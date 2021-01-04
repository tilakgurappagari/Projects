<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Cloud</title>
        <link href="http://fonts.googleapis.com/css?family=Arvo" rel="stylesheet" type="text/css" />
        <link href="http://fonts.googleapis.com/css?family=Coda:400,800" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
    </head>

    <body>
        <div id="menu-wrapper">
            <div id="menu">
                <ul>
 
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="admin.jsp">Admin</a></li>
                    <li><a href="userLogin.jsp">Member</a></li>  

                                        <li class="current_page_item"><a href="newUser.jsp">Create Member</a></li>                  
                    
                </ul>
            </div>
            <!-- end #menu -->
        </div>
        <div id="header-wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="#">secure file sharing</span></a></h1>                    
                </div>
            </div>
        </div>
        <div id="banner"><img src="images/img04.jpg" width="1000" height="350" alt="" /></div>
        <div id="wrapper">
            <!-- end #header -->
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="content">
                            <div class="post">
                                <h3>New Member</h3>
                                <div style="clear: both;">&nbsp;</div>
                                <div class="entry">
                                    <%if (request.getParameter("msg") != null) {
                                                                out.println(request.getParameter("msg"));
                                                            }%>
                                    <form name="f1" method="post" action="NewUserReg" onSubmit="return validate()">
                                        <table width="90%">
                                            <tr style="height: 40px;"><td>User id:</td><td><input type="text" size="30" style="height: 25px;" id="_name" name="_name"/></td></tr>
                                            <tr style="height: 40px;"><td>Password:</td><td><input type="password" size="30" style="height: 25px;" id="_password" name="_password"/></td></tr>
                                            <tr style="height: 40px;"><td>Gender:</td><td><input type="radio" name="sex" id="sex" value="male" /> Male
                                                    <input type="radio" name="sex" id="sex" value="female" /> Female</td></tr>
                                            <tr style="height: 40px;"><td>Age:</td><td><input type="text" size="30" style="height: 25px;" id="_age" name="_age"/></td></tr>
                                            <tr style="height: 40px;"><td>Phone:</td><td><input type="text" size="30" style="height: 25px;" id="_phone" name="_phone"/></td></tr>
                                            <tr style="height: 40px;"><td>Email-Id:</td><td><input type="text" size="30" style="height: 25px;" id="_emailid" name="_emailid"/></td></tr>


                                            <tr style="height: 40px;"><td></td><td><input type="submit" value="Submit" style="height: 25px;width: 90px;"/></td></tr>
                                        </table>
                                       <!--  <input type="button" Value="Validate" onClick="validate()"/> -->
                                    </form>	
                                </div>
                            </div>
                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #content -->

                        <!-- end #sidebar -->
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>
            </div>
            <!-- end #page -->
        </div>
        <div id="footer">
            <p></p>
        </div>
        <!-- end #footer -->
       <script type="text/javascript"> 
    function validate()
    {
      var phone = f1._phone.value;
      
      var age= f1._age.value;
      var email =f1._emailid.value;
      var name= f1._name.value;
      alert("Pnone no should be 10 digit Number");
      if(isNaN(phone))
    	  {
    	    alert("Pnone no should be 10 digit Number");
    	   f1._phone.focus();    	
    	   return true;
    	  }
      
      return true;
    
    }     
    
    </script>
        
    </body>
</html>
