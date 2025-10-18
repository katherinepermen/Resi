<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reparto Utilidad - Ejidal</title>
    <link rel="stylesheet" href="{{ asset('assets/css/monto.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    @include('partials.header')
    <div class="container">
        @include('partials.sidebar')

        <main class="main-content">
            @if (session('success'))
                <div class="alert alert-success" style="padding: 15px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px; margin-bottom: 20px;">
                    {{ session('success') }}
                </div>
            @endif

            @if ($errors->any())
                <div class="alert alert-danger" style="padding: 15px; background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; border-radius: 5px; margin-bottom: 20px;">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="info-card">
                <!-- Info Card Icon -->
                <div class="money-icon">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="info-content">
                    <h2>Reparto Utilidad</h2>
                    <p>Seleccione un tipo de reparto para ver y editar su información. Puede modificar el valor según sea necesario.</p>
                </div>
            </div>

            <div class="monto-actual-section">
                <div class="monto-header">MONTO ACTUAL</div>
                <div class="monto-display" id="monto-actual-display">$0.00</div>
                <div class="currency-label">Pesos Mexicanos (MXN)</div>
            </div>
           
            <div class="forms-container">
                <form method="POST" action="" id="edit-form">
                    @csrf
                    @method('PUT')

                    <div class="form-section">
                        <div class="form-header">
                            <!-- Form Icons -->
                            <div class="form-icon green-icon">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <h3>Información del Monto</h3>
                        </div>
                        <div class="form-content">
                            <div class="form-group">
                                <label><i class="fas fa-dollar-sign"></i> Monto</label>
                                <input type="text" name="monto" value="0.00" class="form-input" id="monto_input">
                            </div>
                            
                            <div class="form-group">
                                <label><i class="far fa-calendar"></i> Año</label>
                                <select name="anio" id="anio_select" class="form-select">
                                    <option value="">Seleccionar año</option>
                                    <!-- Los años se generarán dinámicamente con JavaScript -->
                                </select>
                            </div>

                            <div class="form-group">
                                <label><i class="fas fa-list-alt"></i> Tipo de reparto</label>
                                <select name="tipo_reparto" id="tipo_reparto_select" class="form-select">
                                    <option value="">Seleccionar reparto</option>
                                    <option value="reparto_finiquito">Reparto Finiquito</option>
                                    <option value="primer_reparto">Primer Reparto</option>
                                    <option value="segundo_reparto">Segundo Reparto</option>
                                    <option value="finiquito_utilidades">Finiquito de Utilidades</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <div class="form-header">
                            <!-- Form Icons -->
                            <div class="form-icon orange-icon">
                                <i class="fas fa-info-circle"></i>
                            </div>
                            <h3>Detalles Adicionales</h3>
                        </div>
                        <div class="form-content">
                            <div class="form-group">
                                <label><i class="fas fa-user"></i> Responsable</label>
                                <input type="text" value="{{ Auth::user()->name ?? 'Comisario Ejidal' }}" class="form-input" readonly>
                            </div>
                            <div class="form-group">
                                <label><i class="far fa-calendar-alt"></i> Fecha de Registro</label>
                                <div class="date-input-container">
                                    <input type="date" name="fecha_registro" id="fecha_registro_input" class="form-input date-input" readonly>
                                    <!-- Calendar Icon -->
                                    <div class="calendar-icon">
                                        <i class="far fa-calendar-alt"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="action-buttons">
                        <!-- Button Icons -->
                        <button type="submit" id="guardar-btn" class="btn btn-green">
                            <i class="fas fa-save"></i> Guardar Cambios
                        </button>
                        <button type="button" id="cancelar-btn" class="btn btn-red" onclick="window.location.href = '{{ route('home') }}'">
                            <i class="fas fa-times"></i> Cancelar
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script src="{{ asset('assets/js/main.js') }}"></script>

    <script>

    const BASE_URL_GET = "{{ url('/utilidad/get-data') }}";
    const BASE_URL_UPDATE = "{{ url('/utilidad/update') }}";

    document.addEventListener('DOMContentLoaded', function () {
        const tipoRepartoSelect = document.getElementById('tipo_reparto_select');
        const montoInput = document.getElementById('monto_input');
        const anioSelect = document.getElementById('anio_select');
        const fechaInput = document.getElementById('fecha_registro_input');
        const editForm = document.getElementById('edit-form');
        const montoActualDisplay = document.getElementById('monto-actual-display');
        const guardarBtn = document.getElementById('guardar-btn');

        // Función para llenar dinámicamente el select de años
        function populateYearSelect() {
            const anioSelect = document.getElementById('anio_select');
            const currentYear = new Date().getFullYear();
            const numberOfYears = 5; // Puedes ajustar cuántos años quieres mostrar

            // Limpiar opciones existentes
            anioSelect.innerHTML = '<option value="">Seleccionar año</option>';

            // Agregar años consecutivos
            for (let i = 0; i < numberOfYears; i++) {
                const year = currentYear + i;
                const option = document.createElement('option');
                option.value = year;
                option.textContent = year;
                anioSelect.appendChild(option);
            }
        }

        tipoRepartoSelect.addEventListener('change', function () {
            const tipoSeleccionado = this.value;

            if (!tipoSeleccionado) {
                editForm.action = '#';
                montoInput.value = '0.00';
                anioSelect.value = '';
                fechaInput.value = '';
                montoActualDisplay.textContent = '$0.00';
                guardarBtn.disabled = true;
                return;
            }

            guardarBtn.disabled = false;

            // Se usa la nueva constante BASE_URL_GET para construir la petición.
            fetch(`${BASE_URL_GET}/${tipoSeleccionado}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Reparto no encontrado en la base de datos.');
                    }
                    return response.json();
                })
                .then(data => {
                    montoInput.value = parseFloat(data.monto).toFixed(2);
                    anioSelect.value = data.anio;
                    fechaInput.value = data.fecha_registro;
                    montoActualDisplay.textContent = `$${parseFloat(data.monto).toFixed(2)}`;
                    
                    // Se usa la constante BASE_URL_UPDATE para la acción del formulario.
                    editForm.action = `${BASE_URL_UPDATE}/${data.id_utilidad}`;
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('No se encontraron datos para este reparto. Puede agregarlo como un nuevo registro si lo desea.');
                    montoInput.value = '0.00';
                    anioSelect.value = '';
                    fechaInput.value = '';
                    montoActualDisplay.textContent = '$0.00';
                    guardarBtn.disabled = true; 
                    editForm.action = '#';
                });
        });

        // Llamar a la función cuando se carga la página
        populateYearSelect();

        guardarBtn.disabled = true;
    });
    </script>
</body>
</html>