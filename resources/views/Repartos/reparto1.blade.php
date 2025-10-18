<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Primer Reparto - Ejidal</title>
    <link rel="stylesheet" href="{{ asset('assets/css/reparto1.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    {{-- Necesario para que Laravel Blade envíe el token CSRF para peticiones AJAX --}}
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>
<body>
    @include('partials.header')
    <div class="container">
        @include('partials.sidebar')
        
        <main class="main-content">
            <h1 class="page-title">Primer Reparto</h1>


            <!-- Tabla de Repartos y Panel de Información -->
            <div class="table-container">
                <div class="table-section">
                    <div class="table-actions">
                        <div class="search-box">
                            <input type="text" id="searchTable" placeholder="Buscar por nombre...">
                            <button class="btn-search">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <button type="button" class="btn-agregar" id="btnAbrirModal">
                            <i class="fas fa-plus"></i> Agregar Préstamo
                        </button>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Ejidatario</th>
                                <th>Prestamo</th>
                                <th>Descripción</th>
                                <th>Fecha</th>
                                <th>Reparto 1</th>  
                                <th>Acciones</th>
                            </tr>
                        </thead>
                       <tbody>
                            @foreach($prestamos as $prestamo)
                            <tr class="ejidatario-row" 
                                data-ejidatario="{{ trim($prestamo->nombre) }} {{ trim($prestamo->apellido_paterno) }} {{ trim($prestamo->apellido_materno) }}"
                                data-descripcion="{{ $prestamo->motivo }}"
                                data-prestamo="{{ number_format($prestamo->cantidad, 2, '.', '') }}"
                                {{-- Usamos el monto de la utilidad de catálogo para "disponible" --}}
                                data-disponible="{{ number_format($utilidad ? $utilidad->monto : 0, 2, '.', '') }}" 
                                {{-- El total es la utilidad disponible MENOS el préstamo --}}
                                data-total="{{ number_format($utilidad ? $utilidad->monto - $prestamo->cantidad : 0, 2, '.', '') }}">
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $prestamo->nombre }} {{ $prestamo->apellido_paterno }} {{ $prestamo->apellido_materno }}</td>
                                <td>${{ number_format($prestamo->cantidad, 2) }}</td>
                                <td class="description-cell" data-full-text="{{ $prestamo->motivo }}">{{ $prestamo->motivo }}</td>
                                <td>{{ $prestamo->fecha }}</td>
                                <td>
                                    {{-- Monto fijo del Reparto 1 --}}
                                    @if($utilidad)
                                        ${{ number_format($utilidad->monto, 2) }}
                                    @else
                                        N/A
                                    @endif
                                </td>
                                <td>
                                    <button onclick="editarReparto({{ $prestamo->id_reparto_uti }})" class="btn-edit">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <form action="{{ route('reparto1.destroy', $prestamo->id_reparto_uti) }}" 
                                          method="POST" 
                                          style="display: inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn-delete">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    
                    <div class="pagination">
                       
                        <a href="#" class="page-link"><</a>
                        <a href="#" class="page-link active">1</a>
                        <a href="#" class="page-link">2</a>
                        <a href="#" class="page-link">3</a>
                       
                        <a href="#" class="page-link">4</a>
                        <a href="#" class="page-link">></a>
                    
                    </div>
                </div>

                <!-- Panel de información fijo a la derecha -->
                <div class="info-panel">
                    <div class="info-header">
                        <i class="fas fa-info-circle"></i>
                        <h2>INFORMACIÓN</h2>
                    </div>

                    <div class="info-content">
                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-user-circle"></i>
                                <span>Ejidatario</span>
                            </div>
                            <div class="info-value" id="ejidatarioInfo">LUIS AGUILAR ESPINOZA</div>
                        </div>

                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-file-alt"></i>
                                <span>Descripción</span>
                            </div>
                            <div class="info-value" id="descripcionInfo">Préstamo</div>
                        </div>

                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-wallet"></i>
                                <span>Disponible</span>
                            </div>
                            <div class="info-value money" id="disponibleInfo">$800.00</div>
                        </div>

                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-hand-holding-usd"></i>
                                <span>Préstamo</span>
                            </div>
                            <div class="info-value money" id="prestamoInfo">$0.00</div>
                        </div>

                        <div class="info-item total">
                            <div class="info-label">
                                <i class="fas fa-calculator"></i>
                                <span>Total</span>
                            </div>
                            <div class="info-value money" id="totalInfo">$800.00</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- MODAL: Solicitud de Préstamo (Estructura Corregida) -->
            <div id="prestamoModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>Solicitud de Préstamo</h2>
                    
                    <div class="search-container">
                        <input type="text" id="searchInput" class="search-input" placeholder="Buscar ejidatario...">
                        <button id="searchButton">
                            <i class="fas fa-search"></i>
                            Buscar
                        </button>
                    </div>
                    
                    <form class="solicitud-form" action="{{ route('reparto1.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label>Ejidatario</label>
                            <input type="text" name="ejidatario" readonly>
                            <input type="hidden" name="id_ejidatario">
                        </div>
                        <div class="form-group">
                            <label>Descripción</label>
                            <input type="text" name="descripcion" required>
                        </div>
                        <div class="form-group">
                            <label>Cantidad</label>
                            <input type="number" name="cantidad" step="0.01" required>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn-cancelar">Cancelar</button>
                            <button type="submit" class="btn-guardar">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- Modal de Edición -->
            <div id="editModal" class="modal">
                <div class="modal-content">
                    <span class="close-edit">&times;</span>
                    <h2>Editar Préstamo</h2>
                    
                    <form id="editForm" class="edit-form">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label>Ejidatario</label>
                            <input type="text" name="ejidatario" id="edit_ejidatario" readonly>
                        </div>
                        <div class="form-group">
                            <label>Descripción</label>
                            <input type="text" name="descripcion" id="edit_descripcion" required>
                        </div>
                        <div class="form-group">
                            <label>Cantidad</label>
                            <input type="number" name="cantidad" id="edit_cantidad" step="0.01" required>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn-cancelar" id="btnCancelarEdit">Cancelar</button>
                            <button type="submit" class="btn-guardar">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</body>
<script src="{{ asset('assets/js/reparto1.js') }}"></script>
</html>
