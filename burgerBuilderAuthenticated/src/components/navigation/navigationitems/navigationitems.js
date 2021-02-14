import React from 'react';
import './navigationitems.css';
import NavigationItem from './navigationitem/navigationitem';

const NavigationItems = (props) => (
    <ul className= "NavigationItems">

        {/* <li> <a href="/" >A Link</a></li> */}
        <NavigationItem link = "/"  exact>
                Burger Builder
        </NavigationItem>
        {props.isAuthenticated 
        ?<NavigationItem link = "/orders" >Orders</NavigationItem>
        : null
    }

        {!props.isAuthenticated 
        ? <NavigationItem link="/auth">LOGIN</NavigationItem>
        : <NavigationItem link="/logout">LOGOUT</NavigationItem>
}
    </ul>
);

export default NavigationItems;