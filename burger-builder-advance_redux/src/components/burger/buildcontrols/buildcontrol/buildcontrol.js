import React from 'react';
import './buildcontrol.css';
const BuildControl = (props) => (

        <div className="BuildControl">
            
            <button className="Less" 
            onClick = {() => props.removed()} 
            disabled={props.disabled}>-</button>
                <div className= "Label">{props.label}</div>
            <button className="More"
             onClick = {() => props.added()}>+</button>
        </div>

);

export default BuildControl;