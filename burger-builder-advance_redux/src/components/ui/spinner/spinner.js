import React from 'react';
import Auxiliary from '../../../hoc/auxiliary';
import './spinner.css';

const Spinner = () => (
    <Auxiliary>
    <div className="loader">Loading...</div>
    <p style = {{textAlign :"center"}}>LOADING</p>
    </Auxiliary>
);


export default Spinner;