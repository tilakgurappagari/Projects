//import classes from 'layout.module.css';
import React, { Component } from 'react';
import Auxiliary from '../../hoc/auxiliary';
//import {styles} from  './'
import  './layout.css';
import Toolbar from '../navigation/toolbar/toolbar';
import SideDrawer from '../navigation/sidedrawer/sidedrawer';



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
    <Toolbar   drawerToggleClicked ={this.sideDrawerToggleHandler} />
    <SideDrawer 
   
    openSideDrawer = {this.state.showSideDrawer}
    closeSideDrawer = {this.sideDrawerClosedHandler}/>
    <main className = "content">{this.props.children}</main>
    </Auxiliary>
    );

    }
}

export default  Layout;