
import React, { Component } from 'react';
import './modal.css';
import Auxiliary from '../../../hoc/auxiliary';
import Backdrop from '../backdrop/backdrop';


class Modal extends Component {

    shouldComponentUpdate(nextProps, nextState){
        return nextProps.show !== this.props.show || nextProps.children !== this.props.children;
            
        
    }

    render(){
    let classname= '';

    if (this.props.show){
        classname = "Modal Modal-1";
    }
    else{
        classname = "Modal Modal-2";
    }
  
    return(
    // <div 
    // style={{
    //     transform: props.show ? 'translateY(0)' : 'translate(-100vh)',
    //     opacity : props.show ? '1' : '0'
    // }}
    // className= "Modal">
    <Auxiliary> 
        <Backdrop show = {this.props.show}  clicked={this.props.modalClosed}/>   
        <div className={classname}>
        {this.props.children}
    </div>
    
    </Auxiliary>

);
    }
}

export default Modal;
    
