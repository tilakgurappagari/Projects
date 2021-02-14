//import classes from 'layout.module.css';
import React, { Component } from 'react';
import Auxiliary from '../../hoc/auxiliary';
//import {styles} from  './'
import  './layout.css';
import Toolbar from '../navigation/toolbar/toolbar';
import SideDrawer from '../navigation/sidedrawer/sidedrawer';
import { connect } from 'react-redux';



class Layout extends Component {

    state = {
        showSideDrawer : false
    }

    sideDrawerClosedHandler = () =>{
            this.setState({showSideDrawer: false});
    }

    sideDrawerToggleHandler = () =>{
        this.setState((prevState) => {
            return {showSideDrawer : !this.state.showSideDrawer};
        });
    }

    render(){
    return( 
    <Auxiliary>
    <Toolbar  
    isAuth = {this.props.isAuthenticated}
    drawerToggleClicked ={this.sideDrawerToggleHandler} />
    <SideDrawer 
       isAuth = {this.props.isAuthenticated}

    openSideDrawer = {this.state.showSideDrawer}
    closeSideDrawer = {this.sideDrawerClosedHandler}/>
    <main className = "content">{this.props.children}</main>
    </Auxiliary>
    );

    }
}


const mapStateToProps = state =>{
    
        return{
            isAuthenticated : state.auth.token !== null
        };
    
    
};

export default  connect(mapStateToProps)(Layout);