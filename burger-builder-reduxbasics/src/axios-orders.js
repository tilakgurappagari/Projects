import axios from 'axios';

 const instance = axios.create({
    baseURL : ' https://burger-builder-e8150-default-rtdb.firebaseio.com/'
});

export default instance;
