<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>online fuel services</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<?php
include 'dbcon.php';
if(isset($_POST['gpass']))
{
   $pho=$_POST['gpho'];
   
   
   
      $qry="SELECT * FROM buyer WHERE phno='$pho'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			
			$_SESSION['gotpass'] = $member['pswd'];
			$_SESSION['ID'] = $member['buyerid'];
			$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			header("location:gotpass.php");
			}
			else 
			{
			
			header("location: getpass.php");
			
		}
			session_write_close();
		
	
	
	
}
?>

<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>
<!-- Shell -->

<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#"></a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="login.php" class="cart-link">login</a>
	     

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="index.php" class="active">Home</a></li>
        
       
        <li><a href="about.php">About Us</a></li>
        <li><a href="contact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
<form name="red" method="post" >

<center><table  width="500" height="500"border="0"  align="center" width="10" height="10">
<tr><td align="right"><h4><b><i>PLEASE ENTER YOUR PHONE NUMBER </i></B></td><td align="center"><input type="text" name="gpho"/></h4></td>
<td  align="left"><b><i><input name="gpass" type="submit" value="get password"/></i></b></td></tr>
</table></center>

</form>
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
