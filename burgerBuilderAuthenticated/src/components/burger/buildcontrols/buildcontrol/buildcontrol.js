import React from 'react';
import './buildcontrol.css';
const BuildControl = (props) => (

        <div className="BuildControl">
            
            <button className="btn btn-danger" 
            onClick = {() => props.removed()} 
            disabled={props.disabled}>-</button>
                <div className= "Label">{props.label}</div>
            <button className="btn btn-success"
             onClick = {() => props.added()}>+</button>
        </div>

);

export default BuildControl;