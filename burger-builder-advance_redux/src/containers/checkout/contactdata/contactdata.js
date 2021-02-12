import { Component } from "react";
import  {connect } from  'react-redux';
import axios from '../../../axios-orders';
import Button from "../../../components/ui/button/button";
import Input from "../../../components/ui/input/input";
import Spinner from "../../../components/ui/spinner/spinner";
import withErrorHandler from '../../../hoc/withErrorHandler/withErrorHandler';
import * as actions from '../../../store/actions/index';
import './contactdata.css';


class ContactData extends Component{


    //////////////////////////////////////////////
    state = {
     orderForm: {
            name: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: 'Your Name'
                },
                value: '',
                validation : {
                    required : true
                },
                valid : false,
                touched : false
            },
            street: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: 'Street'
                },
                value: '',
                validation : {
                    required : true
                },
                valid : false,
                touched : false
            },
            zipCode: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: 'ZIP Code'
                },
                value: '',
                validation : {
                    required : true,
                    minLength : 5,
                    maxLength : 5
                },
                valid : false,
                touched : false
            },
            country: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: 'Country'
                },
                value: '',
                validation : {
                    required : true
                },
                valid : false,
                touched : false
            },
            email: {
                elementType: 'input',
                elementConfig: {
                    type: 'email',
                    placeholder: 'Your E-Mail'
                },
                value: '',
                validation : {
                    required : true
                },
                valid : false,
                touched : false
            },
            deliveryMethod: {
                elementType: 'select',
                elementConfig: {
                    options: [
                        {value: 'fastest', displayValue: 'Fastest'},
                        {value: 'cheapest', displayValue: 'Cheapest'}
                    ]
                },
                value: 'fastest',
                validation : {},
                valid : true
            }
        },
        formIsValid : false
        //loading: false

    }

  

    orderHandler = ( event ) => {
        event.preventDefault();
       // this.setState( { loading: true } );
        const formData = {};
        for (let formElementIdentifier in this.state.orderForm) {
            formData[formElementIdentifier] = this.state.orderForm[formElementIdentifier].value;
        }
        const order = {
            ingredients: this.props.ings,
            price: this.props.price,
            tax : this.props.tax,
            subtotal : this.props.subtotal,
            orderData: formData
        }
        this.props.onOrderBurger(order);
        // axios.post( '/orders.json', order )
        //     .then( response => {
        //         this.setState( { loading: false } );
        //         this.props.history.push( '/' );
        //     } )
        //     .catch( error => {
        //         this.setState( { loading: false } );
        //     } );
    }


    inputChangedHandler = (event, inputIdentifier) =>{
        console.log(event.target.value);
        const updatedOrderForm = {
            ...this.state.orderForm
        };
        const updatedFormElement = { 
            ...updatedOrderForm[inputIdentifier]
        };
        updatedFormElement.value = event.target.value;
        updatedFormElement.valid = this.checkValidity(updatedFormElement.value, updatedFormElement.validation);
        updatedFormElement.touched = true;
        updatedOrderForm[inputIdentifier] = updatedFormElement;
        console.log(updatedFormElement);

        let formIsValid = true;
        for(let inputIdentifier in updatedOrderForm){
            formIsValid =  updatedOrderForm[inputIdentifier].valid && formIsValid;
        }
        this.setState({orderForm: updatedOrderForm , formIsValid : formIsValid});




    }
    checkValidity = (value, rules) =>{
        let isValid = true;
            // if(!rules){
            //     return true;   alternative for delivery validation
            // }
            if(rules.required){
                isValid = value.trim() !== '' && isValid;
            }
            if(rules.minLength){
                isValid = value.length >= rules.minLength && isValid
            }
            if(rules.maxLength){
                isValid = value.length <= rules.maxLength && isValid
            }
            return isValid;
    }

    render(){

        const formElementArray = [];
        for(let key in this.state.orderForm){
            formElementArray.push({
                id : key,
                config : this.state.orderForm[key]
            })
        }

        let form = (
            <form onSubmit= {this.orderHandler}>
            
            {/* <h4>TAX : {tax}</h4> */}
            

            {/* <Input   elementType="..." elementConfig="..."  value="..." />
            <Input  inputtype="input" name="street" placeholder="Your Email" />
            <Input  inputtype="input" name="postal" placeholder="Street" />
            <Input  inputtype="input" name="email" placeholder="Postal Code" /> */}


            {formElementArray.map(formElement => (
               <Input 
               key={formElement.id}
               elementType={formElement.config.elementType}
               elementConfig={formElement.config.elementConfig}
               value={formElement.config.value}
               invalid ={!formElement.config.valid}
               shouldValidate = {formElement.config.validation}
               touched ={formElement.config.touched}
               changed={(event) => this.inputChangedHandler(event, formElement.id)} />
            ))}
            <Button btnType= "Success" disabled={!this.state.formIsValid} >
                Order</Button>
        </form>
        );
        if (this.props.loading){
            form = <Spinner />;
        }

        //let a = parseFloat(this.props.price).toFixed(2);
        //let tax = 7.5 * a /100;
        return(

            <div className= "ContactData">
                <h4>enter your contact data</h4>
                <h4>TOTAL : {parseFloat(this.props.price).toFixed(2)}</h4>

            <h4>TAX : {parseFloat(this.props.tax).toFixed(2)}</h4>
            <h4>SUBTOTAL : {parseFloat(this.props.subtotal).toFixed(2)}</h4>
                {form}
            </div>
        );
    }

}

const mapStateToProps = (state) =>{
    return{
            ings: state.burgerBuilder.ingredients,
            price :state.burgerBuilder.totalPrice,
            tax : state.burgerBuilder.tax,
            subtotal : state.burgerBuilder.subTotal,
            loading : state.order.loading
        

    };
};

const mapDispatchToprops = (dispatch) => {
    return{
        onOrderBurger : (orderData) => dispatch(actions.purchaseBurger(orderData))

    }
};


export default connect(mapStateToProps, mapDispatchToprops)(withErrorHandler(ContactData, axios));









    // orderHandler = (event) =>{
    //     event.preventDefault();
    //     this.setState({loading : true});
    //    //console.log(this.props.ingredients);
    //    //console.log(this.props.tax);
    //    const formData = {};
    //     for (let formElementIdentifier in this.state.orderForm) {
    //         formData[formElementIdentifier] = this.state.orderForm[formElementIdentifier].value;
    //     }
        
    //     const order = {
    //         ingredients : this.props.ingredients,
    //         price : this.props.price,
    
    //         orderData : formData
    //         // customer : {
    //         //     name : 'tilak',
    //         //     address : {
    //         //         street : 'river ln',
    //         //         zipCode : '53132',
    //         //         country : 'USA'
    //         //     },
    //         //     email : 'abc@burger.com',
    //         // },
    //         // deliveryMetthod : 'Regular'
    //     }
    //     axios.post('/orders.json', order)
    //     .then(response => {
    //         this.setState({loading : false});
    //         this.props.history.push('/');
    //     })
    //     .catch(error =>{
    //         this.setState({loading : false});
    //     });

    // }