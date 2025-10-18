document.addEventListener('DOMContentLoaded', function() {
    
    // --- Selectores del Modal ---
    const modal = document.getElementById("prestamoModal");
    const btnAbrirModal = document.getElementById("btnAbrirModal");
    // Selector modificado para mayor especificidad y evitar null en algunos casos.
    const span = document.querySelector(".modal-content .close"); 
    const btnCancelar = document.querySelector("#prestamoModal .btn-cancelar");

    // --- Selectores de Búsqueda y Formulario (dentro del MODAL) ---
    const searchInput = document.getElementById('searchInput'); 
    const searchButton = document.getElementById('searchButton'); 
    const ejidatarioInput = document.querySelector('.solicitud-form [name="ejidatario"]');
    const idEjidatarioInput = document.querySelector('.solicitud-form [name="id_ejidatario"]');
    
    // --- Selectores del Panel de Información Fijo ---
    const rows = document.querySelectorAll('.ejidatario-row');
    const infoSection = document.querySelector('.info-section');
    
    // --- Lógica del Modal (Apertura y Cierre) ---
    
    if (btnAbrirModal) {
        btnAbrirModal.onclick = function() {
            modal.style.display = "block";
            limpiarFormulario();
        }
    }

    if (span) {
        span.onclick = function() {
            modal.style.display = "none";
            limpiarFormulario();
        }
    }

    if (btnCancelar) {
        btnCancelar.onclick = function() {
            modal.style.display = "none";
            limpiarFormulario();
        }
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            limpiarFormulario();
        }
    }
    
    // --- Lógica de Búsqueda de Ejidatario para el Modal ---
    
    function buscarEjidatario() {
        const searchTerm = searchInput.value.trim();
        if (searchTerm.length < 3) return;

        // AJAX para buscar el ejidatario por nombre
        fetch(`/buscar-ejidatario?q=${searchTerm}`)
        .then(response => {
            // Manejar 404/Errores
            if (!response.ok) {
                console.error(`Error ${response.status}: Ejidatario no encontrado.`);
                // Limpiar campos del modal en caso de error de red o 404
                ejidatarioInput.value = '';
                idEjidatarioInput.value = '';
                document.getElementById('ejidatarioInfo').textContent = 'Ejidatario no encontrado.';
                throw new Error('Ejidatario no encontrado o error en servidor');
            }
            return response.json();
        })
        .then(data => {
            // ***** CORRECCIÓN CLAVE: data.disponible || 0 asegura que siempre sea un número *****
            // Esto previene el error "data.disponible.toFixed is not a function"
            const disponible = parseFloat(data.disponible || 0);
            
            if (data && data.id) {
                // Rellenar campos del modal
                ejidatarioInput.value = data.nombre_completo; // Muestra el nombre en el campo de solo lectura
                idEjidatarioInput.value = data.id; // Guarda el ID de ejidatario (FK)
                
                // Mostrar el disponible en el panel fijo
                const disponibleInfoElement = document.getElementById('disponibleInfo');
                if (disponibleInfoElement) {
                    disponibleInfoElement.textContent = `$${disponible.toFixed(2)}`;
                }
                
                // Actualizar campos del panel fijo con la información del ejidatario encontrado
                document.getElementById('ejidatarioInfo').textContent = data.nombre_completo;
                document.getElementById('descripcionInfo').textContent = '';
                document.getElementById('prestamoInfo').textContent = '$0.00';
                document.getElementById('totalInfo').textContent = `$${disponible.toFixed(2)}`;

            } else {
                alert('Ejidatario no encontrado.'); 
                ejidatarioInput.value = '';
                idEjidatarioInput.value = '';
            }
        })
        .catch(error => {
            console.error('Error de búsqueda:', error);
            // Limpiar campos si hay un error en el catch
            ejidatarioInput.value = '';
            idEjidatarioInput.value = '';
        });
    }
    
    if (searchButton) {
        searchButton.addEventListener('click', buscarEjidatario);
    }

    if (searchInput) {
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault(); 
                buscarEjidatario();
            }
        });
    }

    // --- Lógica de Actualización del Panel de Información al hacer click en la fila ---
    
    if (rows.length > 0) { 
        rows.forEach(row => {
            row.addEventListener('click', function() {
                // Remover la clase selected de todas las filas
                rows.forEach(r => r.classList.remove('selected'));
                this.classList.add('selected');
                
                // 1. Obtener valores como números
                const disponible = parseFloat(this.dataset.disponible);
                const prestamo = parseFloat(this.dataset.prestamo);
                
                // 2. Calcular el total (Disponible - Préstamo)
                const total = (disponible - prestamo).toFixed(2);
                
                // 3. Actualizar el panel de información
                document.getElementById('ejidatarioInfo').textContent = this.dataset.ejidatario;
                document.getElementById('descripcionInfo').textContent = this.dataset.descripcion;
                document.getElementById('disponibleInfo').textContent = `$${disponible.toFixed(2)}`;
                document.getElementById('prestamoInfo').textContent = `$${prestamo.toFixed(2)}`;
                document.getElementById('totalInfo').textContent = `$${total}`;
                
                // Efecto de actualización visual
                if (infoSection) {
                    infoSection.style.animation = 'none'; 
                    void infoSection.offsetWidth; 
                    infoSection.style.animation = 'highlight 1s';
                }
            });
        });
    }
    
    // --- Funciones Auxiliares ---

    function limpiarFormulario() {
        const form = document.querySelector('.solicitud-form');
        if (form) {
            form.reset();
            document.querySelector('.solicitud-form [name="id_ejidatario"]').value = '';
        }
    }

    // Modal de edición
    const editModal = document.getElementById("editModal");
    const closeEdit = document.querySelector(".close-edit");
    const btnCancelarEdit = document.getElementById("btnCancelarEdit");
    const editForm = document.getElementById("editForm");

    // Función para abrir modal de edición
    window.editarReparto = function(id) {
        event.stopPropagation(); // Evitar que se propague el click a la fila
        
        // Obtener la fila seleccionada
        const selectedRow = document.querySelector('.ejidatario-row.selected');
        if (!selectedRow) return;

        // Llenar el formulario de edición con los datos de la fila
        document.getElementById('edit_ejidatario').value = selectedRow.dataset.ejidatario;
        document.getElementById('edit_descripcion').value = selectedRow.dataset.descripcion;
        document.getElementById('edit_cantidad').value = selectedRow.dataset.prestamo;

        // Establecer la acción del formulario
        editForm.action = `/reparto1/${id}`;
        
        // Mostrar el modal
        editModal.style.display = "block";
    };

    // Cerrar modal
    closeEdit.onclick = function() {
        editModal.style.display = "none";
    };

    btnCancelarEdit.onclick = function() {
        editModal.style.display = "none";
    };

    // Cerrar al hacer clic fuera del modal
    window.onclick = function(event) {
        if (event.target == editModal) {
            editModal.style.display = "none";
        }
    };

    // Manejar el envío del formulario
    editForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const formData = new FormData(this);

        fetch(this.action, {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                editModal.style.display = "none";
                // Recargar la página para mostrar los cambios
                window.location.reload();
            } else {
                alert('Error al actualizar el registro');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error al procesar la solicitud');
        });
    });

    // Confirmar eliminación
    document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', function(e) {
            if (!confirm('¿Está seguro de que desea eliminar este registro?')) {
                e.preventDefault();
            }
        });
    });
    
    // --- Animación CSS ---
    const style = document.createElement('style');
    style.textContent = `
        @keyframes highlight {
            0% { transform: scale(1); background-color: #e0f7fa; }
            50% { transform: scale(1.02); background-color: #b2ebf2; }
            100% { transform: scale(1); background-color: transparent; }
        }
        .info-section {
            transition: background-color 0.5s ease;
        }
    `;
    document.head.appendChild(style);
});
