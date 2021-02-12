import { Component } from "react";
import { Route, Redirect } from "react-router-dom";
import CheckoutSummary from '../../components/Order/checkoutsummary/checkoutsummary';
import ContactData from "./contactdata/contactdata";
import {connect} from 'react-redux';
//import * as actions from '../../store/actions/index';

class Checkout extends Component{
    // state = {
    //     ingredients :null,
    //     totalPrice : 0,
    //     tax : 0,
    //     subTotal : 0
        
    // }

    // componentWillMount(){
    //     const query = new URLSearchParams(this.props.location.search);
    //     const ingredients = {};
    //     let price = 0;
    //     let tax = 0;
    //     let subtotal = 0;
    //     for(let param of query.entries()){
    //         //['salad','1']
    //         if(param[0] === 'price'){
    //             price = param[1];
    //         }
    //         else if(param[0] === 'tax'){
    //             tax = param[1];
    //         }
    //         else if(param[0] === 'subtotal'){
    //             subtotal = param[1];
    //         }
    //         else{
    //             ingredients[param[0]] = +param[1];
    //         }
           
    //     }
    //     this.setState({ingredients : ingredients , totalPrice : price, tax : tax, subTotal:subtotal});
    // }

    

    checkoutCancelHandler = () =>{
        this.props.history.goBack();

    }

    checkoutContinueHandler = () =>{
        this.props.history.replace('/checkout/contact-data');

    }

        render(){

                let summary = <Redirect to="/" />
                if(this.props.ings){
                    const purchasedRedirect = this.props.purchased ? <Redirect to= "/" /> : null;

                    summary = ( 
                    <div>
                        {purchasedRedirect}
                        <CheckoutSummary
                        checkoutCancelled = {this.checkoutCancelHandler}
                        checkoutContinued = {this.checkoutContinueHandler}
                        ingredients = {this.props.ings} />

                        <Route path={this.props.match.path + '/contact-data'}
                        component= {ContactData} />
                        </div>
                        
                        );
                }
                return summary;

       

        }
}

const mapStateToProps = (state) =>{
    return{
            ings: state.burgerBuilder.ingredients,
            price :state.burgerBuilder.totalPrice,
            tax : state.burgerBuilder.tax,
            subTotal : state.burgerBuilder.subTotal,
            purchased : state.order.purchased

    };
};

// const mapDispatchToprops = dispatch =>{
//     return{
//         onInitPurchase:  () => dispatch(actions.purchaseInit())
//     };
// };


export default connect(mapStateToProps)(Checkout);