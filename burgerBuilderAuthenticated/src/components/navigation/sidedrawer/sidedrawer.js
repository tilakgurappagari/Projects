import React from 'react';
import Logo from '../../logo/logo';
import NavigationItems from '../navigationitems/navigationitems';
import Backdrop from '../../ui/backdrop/backdrop';
import './sidedrawer.css';
import Auxiliary from '../../../hoc/auxiliary';
const SideDrawer = (props) => {

    let attachedClasses = ['SideDrawer', 'Close'];
    if(props.openSideDrawer){
        attachedClasses = ['SideDrawer', 'Open'];
    }
    return(
        <Auxiliary>
            <Backdrop  show = {props.openSideDrawer}  clicked = {props.closeSideDrawer}/>
            <div className={attachedClasses.join(' ')}>
                <Logo height = "11%" marginBottom = "32px" />
                <nav>
                    <NavigationItems isAuthenticated= {props.isAuth} />
                </nav>

            </div>
        </Auxiliary>
    );
}

export default SideDrawer;