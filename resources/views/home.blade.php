<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejidal</title>
   <link rel="stylesheet" href="{{ asset('assets/css/home.css') }}">
</head>
<body>
 @include('partials.header')
    <div class="container">
        @include('partials.sidebar')    

   
        
        <main class="main-content">
           
            <section class="utility-report">
                <div class="section-header">
                    <h2>Reparto Utilidad</h2>
                    <div class="year-selector">
                        <span>Monto total del año </span>
                        <a href="{{ route('monto') }}" class="btn-primary">Agregar Monto</a>
                    </div>
                </div>
                
                <div class="report-cards">
                    <div class="report-card">
                        <h3>FINIQUITO DEL SANEAMIENTO</h3>
                        <div class="monto-display" id="home-saneamiento-display">${{ number_format($finiquito, 2) }}</div>
                    </div>
                    <div class="report-card">
                        <h3>PRIMER REPARTO</h3>
                   <div class="monto-display" id="home-primer-display">${{ number_format($primerReparto, 2) }}</div>
                    </div>
                    <div class="report-card">
                        <h3>SEGUNDO REPARTO</h3>
                      <div class="monto-display" id="home-segundo-display">${{ number_format($segundoReparto, 2) }}</div>
                    </div>
                    <div class="report-card">
                    <h3>FINIQUITO DE UTILIDADES</h3>
                    <div class="monto-display" id="home-finiquito-utilidades-display">
                        ${{ number_format($finiquitoUtilidades, 2) }}
                    </div>
    </div>
                </div>
            </section>

            

           
        <section class="utility-report">
    <div class="section-header">
        <h2>Descuentos Faenas y Asambleas</h2>
        <div class="year-selector">
            <span>Monto total del año </span>
             <a href="{{ route('descuento') }}" class="btn-primary">Monto</a>
        </div>
    </div>
            <div class="report-cards">
                    <div class="report-card">
                        <h3>Descuento faenas de saneamiento</h3>
                        <div class="monto-display" id="descuento-saneamiento-display">
                            ${{ number_format($descuentoSaneamiento, 2) }}
                        </div>
                    </div>
                    <div class="report-card">
                        <h3>Descuento faenas de aprovechamiento</h3>
                   <div class="monto-display" id="descuento-aprovechamiento-display">
                            ${{ number_format($descuentoAprovechamiento, 2) }}
                        </div>
                    </div>
                    <div class="report-card">
                        <h3>Descuento Asambleas</h3>
                      <div class="monto-display" id="descuento-asambleas-display">
                            ${{ number_format($descuentoAsambleas, 2) }}
                        </div>
                    </div>
                </div>       
            </section>

        
        </main>
    </div>
</body>
<script src="{{ asset('assets/js/recursos.js') }}"></script>
<script>
const saneamientoDisplay = document.getElementById('descuento-saneamiento-display');
const aprovechamientoDisplay = document.getElementById('descuento-aprovechamiento-display');
const asambleasDisplay = document.getElementById('descuento-asambleas-display');

if (saneamientoDisplay) saneamientoDisplay.textContent = `$${saneamiento.toFixed(2)}`;
if (aprovechamientoDisplay) aprovechamientoDisplay.textContent = `$${aprovechamiento.toFixed(2)}`;
if (asambleasDisplay) asambleasDisplay.textContent = `$${asambleas.toFixed(2)}`;
</script>
</html>
