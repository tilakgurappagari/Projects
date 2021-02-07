import * as actionTypes from './actions';


const initialState = {

    ingredients: {
        salad : 0,
        bacon : 0,
        cheese : 0,
        meat :0
    },
    totalPrice : 4,
    tax : 4 * 7.5/100,
    subTotal : 4 + (4*7.5/100)
}

const INGREDIENT_PRICES = {
    salad: 0.5,
    cheese : 0.5,
    meat: 1.5,
    bacon: 1.0
}


const reducer = (state = initialState , action) =>{

    switch (action.type) {
        case actionTypes.ADD_INGREDIENT: return{
                ...state,
                ingredients : {
                    ...state.ingredients,
                    [action.ingredientName] : state.ingredients[action.ingredientName] + 1
                },
                totalPrice : state.totalPrice + INGREDIENT_PRICES[action.ingredientName],
                tax :(state.totalPrice + INGREDIENT_PRICES[action.ingredientName])* 7.5 / 100,
                subTotal : state.totalPrice + INGREDIENT_PRICES[action.ingredientName] + ( (state.totalPrice + INGREDIENT_PRICES[action.ingredientName]) * 7.5 / 100)
        };

        case actionTypes.REMOVE_INGREDIENT: return{
            ...state,
            ingredients : {
                ...state.ingredients,
                [action.ingredientName] : state.ingredients[action.ingredientName] - 1
            },

            totalPrice : state.totalPrice - INGREDIENT_PRICES[action.ingredientName],
            tax :(state.totalPrice - INGREDIENT_PRICES[action.ingredientName])* 7.5 / 100,
            subTotal : state.subTotal - INGREDIENT_PRICES[action.ingredientName] - ( INGREDIENT_PRICES[action.ingredientName] * 7.5 / 100)
            
  
            };
    
        default: return state;
            
    }
    
};

export default reducer;

