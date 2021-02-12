import React from 'react';
import './navigationitems.css';
import NavigationItem from './navigationitem/navigationitem';

const NavigationItems = () => (
    <ul className= "NavigationItems">

        {/* <li> <a href="/" >A Link</a></li> */}
        <NavigationItem link = "/"  exact>
                Burger Builder
        </NavigationItem>
        <NavigationItem link = "/orders" >
                Orders
        </NavigationItem>

    </ul>
);

export default NavigationItems;