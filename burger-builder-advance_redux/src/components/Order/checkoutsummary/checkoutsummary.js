import React from 'react';
import Burger from '../../burger/burger';
import Button from '../../ui/button/button';
import './checkoutsummary.css';

const CheckoutSummary = (props) => {



        return(
            <div className = "CheckoutSummary">
                <h1>We hope it's all good</h1>
                <div className = "BurgerWrapper">
                    <Burger  ingredients = {props.ingredients}/>
                </div>
                <Button clicked = {props.checkoutCancelled}
                 btnType = "Danger"> <span style = {{color : 'black'}}>.</span> Cancel</Button>
                <Button  clicked = {props.checkoutContinued}
                btnType = "Success">Continue</Button>

                
            </div>
        )
}

export default CheckoutSummary;