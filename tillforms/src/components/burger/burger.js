import React from 'react';
import './burger.css';
import BurgerIngredients from './burgeringredients/burgeringredients';

const Burger = (props) => {
    let transformedIngredients = Object.keys(props.ingredients).map(igKey => {
        return [...Array(props.ingredients[igKey])].map(( _, i) =>{
           return <BurgerIngredients key = {igKey + i} type={igKey} />;
        });
    }).reduce((arr, el)=> {
        return arr.concat(el)
    }, []) ;
    console.log(transformedIngredients);
    if(transformedIngredients.length===0){
        transformedIngredients = <p>Please Start Adding Ingredients</p>
    }
    
    return (
        <div className="burger">
            <BurgerIngredients type= "bread-top" />
            {transformedIngredients}
            {/* <BurgerIngredients type= "cheese" />
            <BurgerIngredients type= "meat" /> */}
            <BurgerIngredients type= "bread-bottom" />
        </div>
    );
};

export default Burger;