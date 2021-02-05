import React from 'react';
import './input.css';
const Input = (props) =>{

    let inputElement = null;
    const inputClasses = ['InputElement'];
    if(props.invalid && props.shouldValidate && props.touched){
        inputClasses.push('Invalid');
    }
    switch(props.elementType){
        case('input'): inputElement = <input className = {inputClasses.join(' ')} onChange={props.changed} value={props.value}
         {...props.elementConfig}/>; break;
        case('textarea'): inputElement= <textarea className = {inputClasses} onChange={props.changed}  value={props.value}
        {...props.elementConfig}/>; break;
        
        case('select'): inputElement = (
            <select className={inputClasses}  value={props.value} onChange={props.changed}>
                   {props.elementConfig.options.map(option =>(
                        <option  key= {option.value} value={option.value}>
                            {option.displayValue}
                        </option>
                   ))}
            </select>
        ); break;
        default : inputElement = <input className = {inputClasses} onChange={props.changed} value={props.value}
         {...props.elementConfig}/>
    }

    return( 

        <div className="Input">
                <label className="Label">{props.label}</label>
                {inputElement}

        </div>
    );
}

export default Input;