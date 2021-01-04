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
@session_start(); 
 
$addr=$_SESSION['ADDR'];
$sql="select * from product";
$result=mysql_query($sql);

$qty=0;
if(isset($_POST['submit']))
{
   
include 'dbcon.php';
$result = mysql_query("SELECT * FROM product where pname='".$_POST['pid']."'");

if(!$result)
{
   die('Error: ' . mysql_error());
}
else
{
while($row = mysql_fetch_array($result))
  {
  

  $pname=$row['pname'];
  $price = $row['price'] ;
  $ptype=$row['ptype'];
  $_SESSION['qtty']=$row['qty'];
  }
  
}

}

if(isset($_POST['next']))
   {
	   
	   $adr=$_post['adr'];
	    $pname=$_POST['pname'];
  $ptype=$_POST['ptype'];
   $price=$_POST['price'];
   $qty=$_POST['qty'];
   $_SESSION['pqty']=$qty;
   $_SESSION['amount']=$_SESSION['amount']+ ($price*$qty);
   
   $date=getdate(date("U"));
	   $_SESSION['qtty']=$_SESSION['qtty']-$qty;
	   $quant=$_SESSION['qtty'];
    include 'dbcon.php';
     $rex= mysql_query("update product set qty='$quant' where pname='$pname'");
        header("location:loginhome.php");
  
    }
   if(isset($_POST['cancel']))
   {
	   
	    $pname=$_POST['pname'];
  $ptype=$_POST['ptype'];
   $price=$_POST['price'];
   $qty=0;
  // $_SESSION['amount']=$_SESSION['amount']+ ($price*$qty);
   $date=getdate(date("U"));
	   $_SESSION['amount']=$_SESSION['amount']*0;
	   
       // header("location:cart.php");
  
    }
	if(isset($_POST['pay']))
		
   {   

  $pname=$_POST['pname'];
  $ptype=$_POST['ptype'];
   $price=$_POST['price'];
   $qty=$_POST['qty'];
   $_SESSION['addr']=$addr;
   $_SESSION['pname']=$pname;
   $_SESSION['pqty']=$qty;
   $_SESSION['amount']=$_SESSION['amount']+ ($price*$qty);
   
   $date=getdate(date("U"));
   $_SESSION['qtty']=$_SESSION['qtty']-$qty;
   $quant=$_SESSION['qtty'];
    include 'dbcon.php';
     $rex = mysql_query("update product set qty='$quant' where pname='$pname'");
    
        header("location:checkout.php");
  
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

h2,h4{
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
     <div id="cart">welcome   <?php @session_start(); echo $_SESSION['NAME'];?>|<br><a href="index.php" class="cart-link">signout</a>

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
  
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="loginhome.php" class="active">Home</a></li>
        
       
        <li><a href="laboutus.php">About Us</a></li>
        <li><a href="contact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main" class="bacg">
<form name="f2" method="post">
<br/><br/>
<h2><center> <br><br><br><br><br>Product Details</center></h2>
<center><table align="center" border="0">
<tr>
<td align="center"><h4>product: </h4></td>
<td><input type="text" name="pname" readonly="TRUE" value = "<?php echo $pname;?>"/></td></tr>
<tr>
<td align="center"><h4>ProductType:</h4> </td>
<td><input type="text" name="ptype" readonly="TRUE" value = "<?php echo $ptype;?>"/></td></tr>
<tr>
<td align="center"><h4>Price:</h4> </td>
<td><input type="text" name="price" readonly="TRUE" value = "<?php echo $price;?>" enabled="false"/></td></tr>
<tr>
<td align="center"><h4>Quantity(lit/units):</h4> </td>
<td><input type="text" name="qty"  value = "<?php echo $qty;?>" /></td>
</tr>

<tr> <br>   </tr>
<tr> <br>  </tr>
<tr> <br>  </tr>



<tr><td><input type="submit" name="next" class="btn btn-full" value="continue shopping" /><br><br><br><br><br><br><br></td>

<center><td><input type="submit" name="pay" class="btn btn-full" value="PayNow" /><br><br><br><br><br><br><br></td></center>
<td><input type="submit" value="cancel" align="left" class="btn btn-full" name="cancel"><br><br><br><br><br><br><br></td></tr>





</table></center>

</form>

  </div>
  <br/><br/><br/><br/>
  <!-- End Main -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="home.php">Home</a>  <span>|</span> <a href="laboutus.php">About Us</a> <span>|</span> <a href="lcontact.php">Contact</a> </p>

    <p class="right"> &copy; Online Fuel Services. Design by Tilak,Vishal,Anirudh,Rohith </p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
</body>
</html>
