<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>LOGIN PAGE</title>
<link href="bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link href="stylet.css" rel="stylesheet" type="text/css">
<style type="text/css">
th{
	color:orange;
	font-size:20px;
}
.bacg
{
	background-image:url("reg.jpg");
background-size:cover;
	}
	.let{
		color:white;
	}
	p{
		color:white;
	}
	.btn-full
	{
		color:black;
	}
</style>
<?php
include 'dbcon.php';
 $msg="";
if(isset($_POST['login']))
{
   $uname=$_POST['emailtxt'];
   $pwd=$_POST['pwtxt'];
   if($uname=="admin@ofs.in" && $pwd=="admin")
   {
      header("location:admin.php");
   }
   else
   {
      $qry="SELECT * FROM buyer WHERE email='$uname' AND pswd='$pwd'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			
			$_SESSION['NAME'] = $member['bname'];
			$_SESSION['BID'] = $member['buyerid'];
			$_SESSION['ADDR']=$member['addr'];
			$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			header("location:loginhome.php");
			}
			else 
			{
			
			 $msg="login  failed!!!!!";
			
		}
			session_write_close();
		
	
	}
	
}
?>

<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<style type="text/css">


h1{
	color:white;
}
</style>
</head>

<body>
<!-- Shell -->

<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#"></a></h1>
    <!-- Cart -->
    <div id="cart">
	     <a href="registration.php" class="cart-link">register</a>

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="index.php" >Home</a></li>
        
       
        <li><a href="aboutus.php">About Us</a></li>
        <li><a href="contact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <div class="cl">&nbsp;</div>
    <!-- Content -->

    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="bacg">
        <div id="slider-holder">
          <form name="login" method="post">
<br /><br /><br /><br />
<font style="font-family:Palatino Linotype">

</font>



<center>
<table align="center" border="0" bordercolor="#993333">

<tr><td align="right" class="let"><br>Email-ID</td><td><br><input type="email" required="required" name="emailtxt"/></td></tr>
<tr><td align="right" class="let"><br>Password</td><td><br><input type="password" required="required" name="pwtxt"/></td></tr>
<tr><td></td><td><br><input type="submit" class="btn btn-full" name="login" value="Sign In"/></td><td><br><a href="getpass.php" class="btn btn-full"><p>Forgot Password??</p></a></td></tr>
<tr><td><h1><?php echo $msg;?></h1></td></tr>
</table>
</center>
</form>


        </div>
        
      </div>

      <!-- End Content Slider -->
      <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul>
          <li> <a href="#"><img src="css/images/ppetrol.png" height="200" width="240" alt="" /></a>
            <div class="product-info">
              <h3></h3>

              <div class="product-desc">
                <h4>Indian's way</h4>
                <p>Drive safe<br />
             </p>
                <strong class="price"><img src="css/images/rsredbig.gif" />67.88</strong> </div>
            </div>
          </li>
          <li> <a href="#"><img src="css/images/ddiesel.png" height="200" width="240" /></a>
            <div class="product-info">
              <h3></h3>
              <div class="product-desc">
                <h4>Drive Happiness</h4>
                <p>All The Way<br />

                  </p>
                <strong class="price"><img src="css/images/rsredbig.gif" />58.11</strong> </div>
            </div>
          </li>
          <li class="last"> <a href="#"><img src="css/images/llpg.png" height="200" width="240" alt="" /></a>
            <div class="product-info">
              <h3></h3>

              <div class="product-desc">
                <h4>We Love </h4>
                <p>To Be Economic<br />
                </p>
                <strong class="price"><img src="css/images/rsredbig.gif" />33.02</strong> </div>
            </div>
          </li>
        </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
    </div>
    <!-- End Content -->
  
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="home.php">Home</a> <span>|</span> <a href="login.php">Login</a> <span>|</span> <a href="productdetail.php">Products</a> <span>|</span> <a href="about.php">About Us</a> <span>|</span> <a href="contact.php">Contact</a> </p>

    <p class="right"> &copy; Online Fuel Services. Design by Tilak,Vishal,Anirudh </p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
</body>
</html>
