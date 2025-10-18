<link rel="stylesheet" href="{{ asset('assets/css/sidebar.css') }}">
<div class="dashboard-container">
   
    <aside class="sidebar">
        <nav class="nav-menu">
          
            <div class="nav-item nav-item-header {{ request()->routeIs('home') ? 'active' : '' }}">
                <a href="{{ route('home') }}">
                    <span>Registro de Repartos y Decuentos</span>
                </a>
            </div>
            
           
            <div class="nav-item {{ request()->routeIs('reparto1.index') ? 'active' : '' }}">
                <a href="{{ route('reparto1.index') }}">Primer Reparto</a>
                  
                </a>
            </div>
            <div class="nav-item">
                <a href="#">
                    <span>Segundo Reparto</span>
                </a>
            </div>
            <div class="nav-item">
                <a href="#">
                    <span>Descuentos Asambleas</span>
                </a>
            </div>
            <div class="nav-item">
                <a href="#">
                    <span>Descuentos Faenas</span>
                </a>
            </div>
            <div class="nav-item">
                <a href="#">
                    <span>Gestión de Inasistencias</span>
                </a>
            </div>
            <div class="nav-item">
                <a href="#">
                    <span>Gestión de Programas de apoyo</span>
                </a>
            </div>
            <div class="nav-item">
                <a href="#">
                    <span>Gestión de Actividades</span>
                </a>
            </div>
        </nav>
        
        <div class="sidebar-footer">
            <div class="nav-item logout" onclick="if(confirm('¿Cerrar sesión?')) { sessionStorage.clear(); document.getElementById('logout-form').submit(); }">
               
                <span>Cerrar sesión</span>
            </div>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </div>
    </aside>
</div>