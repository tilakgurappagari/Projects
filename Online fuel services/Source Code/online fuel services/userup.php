<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>online fuel services</title>
<link href="bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link href="stylet.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<?php
include 'dbcon.php';
$sql="select * from buyer";
$result=mysql_query($sql);
@session_start();
$id=$_SESSION['BID'];

$msg="";
   
include 'dbcon.php';
$result = mysql_query("SELECT * FROM buyer where buyerid='$id' ");

if(!$result)
{
   die('Error: ' . mysql_error());
}
else
{
while($row = mysql_fetch_array($result))
  {
  
  $id=$row['buyerid'];
  $bname=$row['bname'];
  $addr = $row['addr'] ;
  $city=$row['city'];
  $state=$row['state'];
  $country=$row['country'];
  $zip=$row['zip'];
  $phno=$row['phno'];
  $email=$row['email'];
  $pswd=$row['pswd'];
  
  }
  


}

if(isset($_POST['upp']))
{
     $cname=$_POST['cname'];
	   $address=$_POST['add'];
	   $city=$_POST['cnt'];
	   $state=$_POST['st'];
	   $country=$_POST['coun'];
	   $zip=$_POST['zip'];
	   $phno=$_POST['pho'];
	   $email=$_POST['email'];
	 
	   $password=$_POST['pwd'];
	  	
	 include 'dbcon.php';
     $result = mysql_query("update buyer set bname='$cname',addr='$address',city='$city',state='$state',country='$country',zip='$zip',phno='$phno',email='$email',pswd='$password' where buyerid='$id'");
     if(!$result)
{
   $msg="updation failed.....";
}
else
{
   $msg="Successfully updated.....";
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
.bacg
{
	background-image:url("reg.jpg");
background-size:cover;
	}

h1,h4{
	color:white;
}
</style>
</head>
<body>
<!-- Shell -->

<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">Online Shopping</a></h1>
    <!-- Cart -->
    <div id="cart"> <?php @session_start(); echo $_SESSION['NAME'];?>|<br><a href="index.php" class="cart-link">signout</a>
	     

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="loginhome.php" >Home</a></li>
        
       <li><a href="userup.php" class="active">EditInfo</a></li>
        <li><a href="laboutus.php">About Us</a></li>
        <li><a href="lcontact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main" class="bacg">
<form name="red" method="post" >
<center><h1><b>EDIT INFO</b></h1></center><br><br>
<center><h1><?php echo $msg;?></h1></center>
<center><table  width="500" height="500"border="0"  align="center" width="10" height="10">

<tr>
<td><h4><B><i>NAME</i></B></td><td><input type="text" name="cname" value = "<?php echo $bname;?>" minlength="6" /></td></tr></h2>
<tr>
<td><h4><B><i>ADDRESS</i></B></td> <td><input type="text" name="add"  cols="30" rows="4" value = "<?php echo $addr;?>" required="required"></td></tr></h4>
<tr><td><h4><b><i>CITY</i></B></td><td><input type="text" value = "<?php echo $city;?>" required="required" name="cnt"/></td></tr></h4><br/>
<tr><td><h4><b><i>STATE</i></B></td><td><input type="text" value = "<?php echo $state;?>" required="required" name="st"/></td></tr></h4>
<tr><td><h4><b><i>COUNTRY</i></B></td><td><input type="text" value = "<?php echo $country;?>" required="required" name="coun"/></td></tr></h4>
<tr><td><h4><b><i>ZIP NO</i></B></td><td><input type="text" name="zip" value = "<?php echo $zip;?>" required="required" minlength="6"/></td></tr></h4>
<tr><td><h4><b><i>PHONE NO</i></B></td><td><input type="text" value = "<?php echo $phno;?>"  required="required" name="pho"/></td></tr></h4>
<tr><td><h4><b><i>EMAIL-ID</i></B></td><td><input type="email" name="email" required="required" value = "<?php echo $email;?>"/></td></tr></h4>

<tr><td><h4><b><i>PASSWORD</i></B></td><td><input type="PASSWORD" name="pwd" value = "<?php echo $pswd?>" minlength="8" required="required" /></td></tr></h4>
<td colspan="6" align="center"><b><i><input name="upp" type="submit" class="btn btn-full" value="Update"/></i></b></td></tr>
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
