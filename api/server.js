var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
var ingredients = [
    {
        "id": "1",
        "text":"eggs"
    },
    {
        "id": "2",
        "text":"milk"
    },
    {
        "id": "3",
        "text":"chicken"
    },
    {
        "id": "4",
        "text":"coffee"
    }
];


app.get('/ingredients', function(request, response){

    response.send(ingredients);

});

 
app.post('/ingredients', function(request, response){
    var ingredient = request.body;
    if (!ingredient || ingredient.text==="")
        {response.status(500).send({error:"your ingredient must have text"});}
        else{
            ing.push(ingredient);
            response.status(200).send(ing);
        }
});

app.put('/ingredients/:ingredientId', function(request, response){
  // var ingredientId = request.params.id;
   var newtext= request.body.text;
   if( !newtext || newtext==="")
   {
       response.status(500).send({error:"you must provide ingredient text"});
   }
   else{
        var idFound = false;
        for( var x= 0; x<ingredients.length; x++)
            {
                    var ing =ingredients[x];
                    if(ing.id=== request.params.ingredientId){
                        ingredients[x].text=newtext;
                        idFound=true;
                        break;

                    }
            }


            if(!idFound){
                response.status(500).send({error:"Ingredient ID not found"});
            }
            else{
            response.send(ingredients);}
        }

});


app.listen(3000, function()
{
    console.log("api running on port 3000");
});