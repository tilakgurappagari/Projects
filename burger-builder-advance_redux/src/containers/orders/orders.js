import axios from '../../axios-orders';
import { Component } from "react";
import Order from "../../components/Order/order";
import withErrorHandler from '../../hoc/withErrorHandler/withErrorHandler';
import * as actions from '../../store/actions/index';
import { connect } from 'react-redux';
import Spinner from '../../components/ui/spinner/spinner';



class Orders extends Component{

    // state = {
    //     orders : [],
    //     loading : true
    // }

    // componentDidMount(){
    //     axios.get('/orders.json')
    //     .then(res =>{
    //         //console.log(res.data);
    //         const fetchedOrders  = [];
    //         for (let key in res.data) {
    //             fetchedOrders.push({
    //                 ...res.data[key],
    //                 id :key
    //              });
    //         }
    //         this.setState({loading : false , orders : fetchedOrders});

    //     } )
    //     .catch(err => {
    //         this.setState({loading : false});
    //     });
    // }

    componentDidMount(){
        this.props.onFetchOrders();
    }


    render(){
        let orders = <Spinner/>
        if(!this.props.loading){
            orders = this.props.orders.map(order => (
                    <Order key = {order.id}
                        ingredients = {order.ingredients}
                        price = {order.price}
                        tax = {order.tax}
                        subtotal = {order.subtotal}

                    />
                ))
        };
            

        
        return(
            <div>
                {orders}
               
                {/* {this.props.orders.map(order => (
                    <Order key = {order.id}
                        ingredients = {order.ingredients}
                        price = {order.price}
                        tax = {order.tax}
                        subtotal = {order.subtotal}

                    />
                ))} */}
            </div>
        );
    }
}

const mapStateToProps = state =>{
    return{
        orders : state.order.orders,
        loading : state.order.loading
    }
}

const mapDispatchToprops = dispatch =>{
    return{
        onFetchOrders : () => dispatch(actions.fetchOrders())
    };
};

export default connect(mapStateToProps,mapDispatchToprops)(withErrorHandler(Orders , axios));
//export default Orders;