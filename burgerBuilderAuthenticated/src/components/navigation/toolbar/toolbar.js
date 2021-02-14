import React from 'react';
import './toolbar.css';
import Logo from '../../logo/logo';
import NavigationItems from '../navigationitems/navigationitems';
import DrawerToggle from '../sidedrawer/drawertoggle/drawertoggle';

const Toolbar = (props) => (
        <header className="Toolbar">
            <DrawerToggle  clicked = {props.drawerToggleClicked}/>

            {/* <div>LOGO</div> */}
            <Logo height = "80%" />
            <nav className = "MobileOnly">
               <NavigationItems  isAuthenticated= {props.isAuth}/>
            </nav>
        </header>
);

export default Toolbar;