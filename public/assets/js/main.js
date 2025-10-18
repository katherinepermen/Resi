document.addEventListener('DOMContentLoaded', () => {

    /* ---------- VARIABLES GENERALES ---------- */
    const montoInput = document.getElementById('monto-input');        // solo existe en la página de monto
    const guardarBtn = document.getElementById('guardar-btn');        // solo existe en la página de monto
    const tipoSelect = document.querySelector('select[name="tipo_reparto"]');

    // Totales guardados en sessionStorage
    let total   = parseFloat(sessionStorage.getItem('totalGeneral'))   || 0;
    let primer  = parseFloat(sessionStorage.getItem('primerReparto'))  || 0;
    let segundo = parseFloat(sessionStorage.getItem('segundoReparto')) || 0;
    let tercero = parseFloat(sessionStorage.getItem('saneamiento')) || 0;

    /* ---------- 1. VISTA: Monto (formulario) ---------- */
    const montoDisplay = document.getElementById('monto-actual-display'); // solo en la página de monto
    if (montoDisplay) {
        // Muestra el total acumulado general
        montoDisplay.textContent = `$${total.toFixed(2)}`;
    }

    if (guardarBtn && montoInput) {
        guardarBtn.addEventListener('click', () => {
            const nuevoMonto = parseFloat(montoInput.value);
            const tipo       = tipoSelect ? tipoSelect.value : "";

            if (!isNaN(nuevoMonto) && nuevoMonto > 0 && tipo) {
                // Suma al total general
                total += nuevoMonto;
                sessionStorage.setItem('totalGeneral', total);

                // Suma al reparto correspondiente
                if (tipo === 'primer_reparto') {
                    primer += nuevoMonto;
                    sessionStorage.setItem('primerReparto', primer);
                } else if (tipo === 'segundo_reparto') {
                    segundo += nuevoMonto;
                    sessionStorage.setItem('segundoReparto', segundo);
                } else if (tipo === 'reparto_finiquito') {
                    tercero += nuevoMonto;
                    sessionStorage.setItem('saneamiento', tercero);
                }

                // Actualiza el display de la página de monto
                if (montoDisplay) {
                    montoDisplay.textContent = `$${total.toFixed(2)}`;
                }

                // Limpia el input
                montoInput.value = '0.00';
            }
        });
    }

    /* ---------- 2. VISTA: Home (dashboard) ---------- */
    const homeTotal   = document.getElementById('home-total-display');
    const homePrimer  = document.getElementById('home-primer-display');
    const homeSegundo = document.getElementById('home-segundo-display');
    const homeSaneamiento = document.getElementById('home-saneamiento-display');

    if (homeTotal)   homeTotal.textContent   = `$${total.toFixed(2)}`;
    if (homePrimer)  homePrimer.textContent  = `$${primer.toFixed(2)}`;
    if (homeSegundo) homeSegundo.textContent = `$${segundo.toFixed(2)}`;
    if (homeSaneamiento) homeSaneamiento.textContent = `$${tercero.toFixed(2)}`;

    /* ---------- 3. Botón de logout (opcional) ---------- */
    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => sessionStorage.clear());
    }

});