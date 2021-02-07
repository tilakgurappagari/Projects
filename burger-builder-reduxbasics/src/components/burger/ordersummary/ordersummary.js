import React, { Component } from 'react';
import './ordersummary.css'
import Button from '../../ui/button/button';
//import Auxiliary from '../../../hoc/auxiliary';
class OrderSummary extends Component {

    render() {
    const ingredientSummary = Object.keys(this.props.ingredients)
    .map(igKey => {
        return (<li key = {igKey}>
            <span style ={{textTransform: 'capitalize'}} >{igKey}</span> : {this.props.ingredients[igKey]}
        </li>);
    });
    return(
            
                <div className="OrderWrapper">
                <h3>Your Order</h3>
                <p>Ordered Ingredients</p>
                <ul className="ListWrapper">
                        {ingredientSummary}
                </ul>
                <p>Continue To CheckOut?</p>
                <p> <strong> TOTAL:{parseFloat(this.props.total).toFixed(2)} </strong> </p>
                <p> <strong> TAX:{this.props.tax.toFixed(2)} </strong> </p>
                <p> <strong> SUBTOTAL:{this.props.subtotal.toFixed(2)} </strong> </p>
                <Button btnType = "Danger" clicked = {this.props.purchaseCanceled}>CANCEL ORDER</Button>
                <Button btnType = "Success" clicked = {this.props.puchaseContinued}>CONTINUE</Button>
                </div>
            
    );
    }
}

export default OrderSummary;