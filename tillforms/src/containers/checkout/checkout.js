import { Component } from "react";
import { Route } from "react-router-dom";
import CheckoutSummary from '../../components/Order/checkoutsummary/checkoutsummary';
import ContactData from "./contactdata/contactdata";

class Checkout extends Component{
    state = {
        ingredients :null,
        totalPrice : 0,
        tax : 0,
        subTotal : 0
        
    }

    componentWillMount(){
        const query = new URLSearchParams(this.props.location.search);
        const ingredients = {};
        let price = 0;
        let tax = 0;
        let subtotal = 0;
        for(let param of query.entries()){
            //['salad','1']
            if(param[0] === 'price'){
                price = param[1];
            }
            else if(param[0] === 'tax'){
                tax = param[1];
            }
            else if(param[0] === 'subtotal'){
                subtotal = param[1];
            }
            else{
                ingredients[param[0]] = +param[1];
            }
           
        }
        this.setState({ingredients : ingredients , totalPrice : price, tax : tax, subTotal:subtotal});
    }

    checkoutCancelHandler = () =>{
        this.props.history.goBack();

    }

    checkoutContinueHandler = () =>{
        this.props.history.replace('/checkout/contact-data');

    }

        render(){



        return(
            <div>
                <CheckoutSummary
                checkoutCancelled = {this.checkoutCancelHandler}
                checkoutContinued = {this.checkoutContinueHandler}
                ingredients = {this.state.ingredients} />

                <Route path={this.props.match.path + '/contact-data'} 
                
               // component={ContactData}

                render = {(props) => (<ContactData ingredients={this.state.ingredients}
                subtotal = {this.state.subTotal }
                tax = {this.state.tax}
                price = {this.state.totalPrice}
                {...props}
                />)} 
                
                />
            </div>

        );

        }
}

export default Checkout;