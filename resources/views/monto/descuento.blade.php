<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reparto Utilidad - Ejidal</title>
    <link rel="stylesheet" href="{{ asset('assets/css/descuento.css') }}">
    <!-- Agregar Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    @include('partials.header')
    <div class="container">
        @include('partials.sidebar')

        <main class="main-content">
            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif
            @if (session('error'))
    <div class="alert alert-danger">
        {{ session('error') }}
    </div>
@endif
            <div class="info-card">
                <div class="money-icon">
                    <i class="fas fa-money-bill-wave"></i>
                </div>
                <div class="info-content">
                    <h2>Descuento de faenas y asambleas</h2>
                    <p>Ingrese el monto correspondiente al descuento por ausencias a las faenas y asambleas.</p>
                </div>
            </div>

        

<div class="monto-actual-section">
    <div class="monto-header">MONTO ACTUAL</div>
    <div class="monto-display" id="monto-actual-display">$0.00</div>
    <div class="currency-label">Pesos Mexicanos (MXN)</div>
</div>
           
                

            <div class="forms-container">
                <form method="POST" action="{{ route('guardar-descuento') }}">
                    @csrf
                    <div class="form-section">
                        <div class="form-header">
                            <div class="form-icon green-icon">
                                <i class="fas fa-cog"></i>
                            </div>
                            <h3>Configuración de descuentos.</h3>
                        </div>
                        <div class="form-content">
                            <div class="form-group">
                                <label><i class="fas fa-dollar-sign"></i> Tarifa por ausencias</label>
                                <input type="text" name="monto" value="0.00" class="form-input" id="monto">
                            </div>

                            
                               <div class="form-group">
    <label><i class="far fa-calendar"></i> Año</label>
    <select name="anio" class="form-select" id="anio">
        <option value="">Seleccionar año</option>
        @php
            $currentYear = date('Y');
            $endYear = $currentYear + 5;
            for($year = $currentYear; $year <= $endYear; $year++) {
                echo "<option value='{$year}'>{$year}</option>";
            }
        @endphp
    </select>
</div>
                            <div class="form-group">
                                <label><i class="fas fa-tag"></i> Tipo de descuento</label>
                                <select name="tipo" class="form-select" id="tipo">
                                    <option value="">Seleccionar descuento</option>
                                    <option value="Descuento faenas de saneamient">Descuento faenas de saneamiento</option>
                                    <option value="Descuento faenas de aprovecham">Descuento faenas de aprovechamiento</option>
                                    <option value="Descuento asambleas">Descuento asambleas</option>
                                </select>
                            </div>
                            
                        </div>
                    </div>

                    <div class="form-section">
                        <div class="form-header">
                            <div class="form-icon orange-icon">
                                <i class="fas fa-info-circle"></i>
                            </div>
                            <h3>Detalles Adicionales</h3>
                        </div>
                        <div class="form-content">
                            <div class="form-group">
                                <label><i class="fas fa-user"></i> Responsable</label>
                                <input type="text" value="{{ Auth::user()->name ?? 'Comisario Ejidal' }}" class="form-input" readonly>
                                <input type="hidden" name="id_user" value="{{ Auth::id() }}">
                            </div>
                            <div class="form-group">
                                <label><i class="far fa-calendar-alt"></i> Fecha de Registro</label>
                                <div class="date-input-container">
                                    <input type="date" name="fecha_registro" class="form-input date-input" disabled>
                                    <div class="calendar-icon">
                                        <i class="far fa-calendar-alt"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                   <div class="action-buttons">
    <button type="submit" id="guardar-btn" class="btn btn-green">
        <i class="fas fa-save"></i> Guardar
    </button>
    <button type="button" id="cancelar-btn" class="btn btn-red" onclick="window.location.href = '{{ route('home') }}'">
        <i class="fas fa-times"></i> Cancelar
    </button>
            </div>
        </main>
    </div>
</body>

<script src="{{ asset('assets/js/recursos.js') }}"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const tipoSelect = document.getElementById('tipo');
    const montoDisplay = document.getElementById('monto-actual-display');
    const montoInput = document.getElementById('monto');
    const anioSelect = document.getElementById('anio');
    const fechaInput = document.querySelector('input[name="fecha_registro"]');

    tipoSelect.addEventListener('change', function () {
        const tipo = this.value;
        if (tipo) {
            fetch(`/descuento/get-monto/${tipo}`)
                .then(response => response.json())
                .then(data => {
                    montoDisplay.textContent = `$${parseFloat(data.monto).toFixed(2)}`;
                    montoInput.value = parseFloat(data.monto).toFixed(2);
                    if (data.anio) {
                        anioSelect.value = data.anio;
                    }
                    if (data.fecha_registro) {
                        fechaInput.value = data.fecha_registro;
                    }
                });
        } else {
            montoDisplay.textContent = '$0.00';
            montoInput.value = '0.00';
            anioSelect.value = '';
            fechaInput.value = '';
        }
    });
});
</script>
</html>