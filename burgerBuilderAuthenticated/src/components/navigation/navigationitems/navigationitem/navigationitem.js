import React from 'react';
import { NavLink } from 'react-router-dom';
import './navigationitem.css';


const NavigationItem = (props) => (

    <li className = "NavigationItem">
         <NavLink to={props.link} exact={props.exact}
         activeClassName = "active"
        //  className = {props.active ? "active" : null}
         >
             {props.children}


    </NavLink>
         </li>
);

export default NavigationItem;