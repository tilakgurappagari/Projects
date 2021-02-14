
import React from 'react';
import './button.css';

const Button = (props) => { 
    // let classname = ['button', props.btnType].join(' ');
    // console.log(classname);
    //console.log('HELLOOOOOOOO');
    
    return(

    <button 
    disabled = {props.disabled}
    className = {['Button', props.btnType].join(' ')}
    onClick = {props.clicked}>
        {props.children}
    </button>

);}

export default Button;



// const Button = (props) => {

//     let classname= '';

//     if (props.btnType === "Danger"){
//         classname = "Buttton Danger";
//     }
//     if(props.btnType=== "Success"){
//         classname = "Button Success";
//     }
// return(
//     <button 
//     className = {classname}
//     onClick = {props.clicked}>
//         {props.children}
//     </button>

// );
// }

// export default Button;