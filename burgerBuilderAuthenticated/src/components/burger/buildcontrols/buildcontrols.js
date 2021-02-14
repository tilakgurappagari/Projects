import React from 'react';
import './buildcontrols.css';
import BuildControl from './buildcontrol/buildcontrol';
const controls = [
    {label:'Salad', type:'salad'},
    {label:'Bacon', type:'bacon'},
    {label:'Cheese', type:'cheese'},
    {label:'Meat', type:'meat'}

];

const BuildControls = (props) =>(
    <div className=" shadow-lg p-3 mb-5 rounded">
        <p>Total = <strong>{props.price.toFixed(2)}</strong></p>
        <p> Tax = <strong>{props.tax.toFixed(2)}</strong></p>
        <p> SUBTOTAL = <strong>{props.subTotal.toFixed(2)}</strong></p>




        {controls.map(ctrl => (
            <BuildControl
            added = {() => props.ingredientAdded(ctrl.type)}
            removed = {() => props.ingredientRemoved(ctrl.type)}
            key={ctrl.label} label={ctrl.label}
            disabled = {props.disabled[ctrl.type]}
            />
        ))}
        <button
        onClick = {()=> props.ordered()}
        disabled = {!props.purchasable}
        className="btn btn-primary">{props.isAuth ? 'Order Now' : 'signin to continue'}</button>
    </div>
)


export default BuildControls;