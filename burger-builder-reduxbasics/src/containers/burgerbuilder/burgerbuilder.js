import React, { Component } from "react";
import {connect} from 'react-redux';
import Auxiliary from '../../hoc/auxiliary';
import Burger from '../../components/burger/burger';
import BuildControls from '../../components/burger/buildcontrols/buildcontrols';
import Modal from '../../components/ui/modal/modal';
import OrderSummary from '../../components/burger/ordersummary/ordersummary';
import withErrorHandler from '../../hoc/withErrorHandler/withErrorHandler';
import axios from '../../axios-orders';
import Spinner from '../../components/ui/spinner/spinner';
import * as actionTypes from '../../store/actions';

// const INGREDIENT_PRICES = {
//     salad: 0.5,
//     cheese : 0.5,
//     meat: 1.5,
//     bacon: 1.0
// }

class BurgerBuilder extends Component {

    state = {
    //    ingredients : null,
    //     totalPrice : 4,
    //     tax : 4 * 7.5/100,
    //     subTotal : 4 + (4*7.5/100),
      //  purchasable : false,
        purchasing: false,
        loading : false,
        error : false
    }

    componentDidMount () {
        console.log(this.props);
        // axios.get( 'https://burger-builder-e8150-default-rtdb.firebaseio.com/ingredients.json' )
        //     .then( response => {
        //         this.setState( { ingredients: response.data } );
        //     } )
        //     .catch( error => {
        //         this.setState( { error: true } );
        //     } );
    }

    updatePurchaseState = (ingredients) => {
        //const ingredients = {...this.state.ingredients};
        const sum = Object.keys(ingredients)
        .map(igKey => {
            return ingredients[igKey];
        }).reduce((sum,el)=>{
            return sum+el;
        },0);
        //this.setState({purchasable: sum > 0});
        return sum >0;

    }
    purchaseHandler = () =>{
        this.setState({purchasing:true});
    }
    purchaseCancelHandler = () =>{
        this.setState({purchasing : false});
    }
    // purchaseContinueHandler =  () =>{
    //     //alert('you continue');
    //     // this.setState({loading : true});
    //     // const order = {
    //     //     ingredients : this.state.ingredients,
    //     //     total : this.state.totalPrice,
    //     //     tax : this.state.tax,
    //     //     subTotal : this.state.subTotal,
    //     //     customer : {
    //     //         name : 'tilak',
    //     //         address : {
    //     //             street : 'river ln',
    //     //             zipCode :53132,
    //     //             country : 'USA'
    //     //         },
    //     //         email : 'abc@burger.com',
    //     //     },
    //     //     deliveryMetthod : 'Regular'
    //     // }
    //     // axios.post('/orders.json', order)
    //     // .then(response => {
    //     //     this.setState({loading : false, purchasing : false});
    //     // })
    //     // .catch(error =>{
    //     //     this.setState({loading : false, purchasing : false});
    //     // });
    //     // const queryParams = [];
    //     // for (let i in this.state.ingredients){
    //     //     queryParams.push(encodeURIComponent(i) + '=' + encodeURIComponent(this.state.ingredients[i]));
    //     // }
    //     // queryParams.push('price=' + this.state.totalPrice);
    //     // queryParams.push('tax=' + this.state.tax);
    //     // queryParams.push('subtotal=' + this.state.subTotal);

    //     // const  queryString = queryParams.join('&');
    //     this.props.history.push({
    //         pathname : '/checkout',
    //         search : '?' + queryString
    //     });
    // }

    // addIngredientHandler =(type) => {
    //         const oldCount = this.state.ingredients[type];
    //         const updatedCount = oldCount +1;
    //         const updatedIngredients = {
    //             ...this.state.ingredients
    //         };
    //         updatedIngredients[type] = updatedCount;
    //         const priceAddition = INGREDIENT_PRICES[type];
    //         const oldPrice = this.state.totalPrice;
    //         const newPrice = oldPrice + priceAddition;
    //         this.setState({totalPrice : newPrice, ingredients: updatedIngredients, tax: newPrice*7.5/100 , subTotal: newPrice + (newPrice*7.5/100)});
    //         this.updatePurchaseState(updatedIngredients);

    // }

    // removeIngredientHandler =(type) => {
    //     const oldCount = this.state.ingredients[type];
    //         if (oldCount <= 0){
    //             return ; 
    //         }
    //         const updatedCount = oldCount - 1;
    //         const updatedIngredients = {
    //             ...this.state.ingredients
    //         };
    //         updatedIngredients[type] = updatedCount;
    //         const priceDeduction = INGREDIENT_PRICES[type];
    //         const oldPrice = this.state.totalPrice;
    //         const newPrice = oldPrice - priceDeduction;
    //         this.setState({totalPrice : newPrice, ingredients: updatedIngredients ,  tax: newPrice*7.5/100 , subTotal: newPrice + (newPrice*7.5/100)});
    //         this.updatePurchaseState(updatedIngredients);
        
    // }
    purchaseContinueHandler = () =>{
        this.props.history.push('/checkout');
    }


    render(){
        const disabledInfo = {
            ...this.props.ings
        };
        for(let key in disabledInfo){
            disabledInfo[key] = disabledInfo[key] <= 0
        }

       

        let orderSummary = null;
       
        let burger = this.state.error ? <p>ingredients cant be loaded</p> : <Spinner />;

       if(this.props.ings){
        burger = (
            <Auxiliary>
                 <Burger ingredients={this.props.ings} />
                <BuildControls
                    ordered = {this.purchaseHandler}
                    ingredientAdded={this.props.onIngredientAdded}
                    ingredientRemoved = {this.props.onIngredientRemoved}
                    disabled ={disabledInfo}
                    price={this.props.price}
                    tax = {this.props.tax}
                    subTotal = {this.props.subTotal}
                    purchasable = {this.updatePurchaseState(this.props.ings)}
                />
            </Auxiliary>
        );
        orderSummary =  <OrderSummary ingredients={this.props.ings}
        total = {this.props.price}
         tax={this.props.tax} 
         subtotal={this.props.subTotal}
         purchaseCanceled = {this.purchaseCancelHandler}
         puchaseContinued = {this.purchaseContinueHandler}
         />;

         if(this.state.loading){
            orderSummary = <Spinner /> ;
    }

       }

        return(
            <Auxiliary>
                <Modal show={this.state.purchasing}
                        modalClosed = {()=>this.purchaseCancelHandler()}
                        subtotal={this.state.subTotal}
                        >
                   {orderSummary}
                </Modal>
               {burger}
            </Auxiliary>
        );
    }
}


const mapStateToProps = (state) =>{
    return{
        ings : state.ingredients,
        price : state.totalPrice,
        tax : state.tax,
        subTotal : state.subTotal

    };
}

const mapDispatchToprops = (dispatch) =>{
    return{
        onIngredientAdded : (ingName) => dispatch({type: actionTypes.ADD_INGREDIENT, ingredientName: ingName  }),
        onIngredientRemoved : (ingName) => dispatch({type: actionTypes.REMOVE_INGREDIENT, ingredientName: ingName  })

    };
}

export default connect(mapStateToProps, mapDispatchToprops)(withErrorHandler(BurgerBuilder , axios));