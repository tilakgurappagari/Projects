import React from 'react';
import BurgerLogo from '../../assets/images/burger-logo.png';
import './logo.css';

const Logo = (props) => (

    <div className= "Logo" style = {{height : props.height, marginBottom:props.marginBottom}}>
        <img  src={BurgerLogo} alt = "MYBURGER"/>
    </div>

);

export default Logo;