


var username= document.getElementById('user');
var password= document.getElementById('pwd');
//username.value="tilak";
//password.value="tilak";
var message= document.getElementById('msg');
//message.innerText="hello";

var form = document.getElementById('form1');
form.addEventListener('submit', function(event)
{
           if(!username.value || !password.value)
                {
                    alert("please enter username and password");}
                    
                else if(password.value==username.value){
                
                    message.innerText= "login successful" ; 
                    event.preventDefault();
                    
                }
                else{                
                    message.innerText= "login unsuccessful"   ; 
                    event.preventDefault();
                    
                }
                      
                      });