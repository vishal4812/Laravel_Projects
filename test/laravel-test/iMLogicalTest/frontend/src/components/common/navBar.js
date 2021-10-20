import { NavLink } from 'react-router-dom';

const NavBar = () =>
{
    return(
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <div className="container px-4">

                <div className="collapse navbar-collapse" id="navbarResponsive">
                    <ul className="navbar-nav ms-auto">
                        <li className="nav-item"><NavLink className="nav-link" to='/' >Home</NavLink></li>
                        {localStorage.getItem('token')!==null
                        ?
                        <li className="nav-item"><NavLink className="nav-link" to='/account'>Account</NavLink></li>
                        :
                        <li className="nav-item"><NavLink className="nav-link" to='/login'>Login</NavLink></li>
                    }
                    </ul>
                </div>
            </div>
        </nav>
    )
}

export default NavBar