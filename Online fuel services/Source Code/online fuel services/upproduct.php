<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>online fuel services</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<?php
include 'dbcon.php';
//$sql="select * from product";
//$result=mysql_query($sql);
if(isset($_POST['view']))
{
   
include 'dbcon.php';
$pname=$_POST['pname'];
//$result = mysql_query("SELECT * FROM product where pname=".$_POST['pname']."");
$qry="SELECT * FROM product WHERE pname='$pname'";
	  $result=mysql_query($qry);
$pname=$_POST['pname'];
if(!$result)
{
   die('Error: ' . mysql_error());
}
else
{
while($row = mysql_fetch_array($result))
  {
  
  $id=$row['prodid'];
  $ptype=$row['ptype'];
  $pname=$row['pname'];
  $price = $row['price'] ;
  $qty= $row['qty'] ;
  
  }
  
}

}
if(isset($_POST['update']))
{
     $id=$_POST['id'];
	 $ptype=$_POST['ptype'];
	 $pname=$_POST['pname'];
	 $price=$_POST['price'];
	 $qty=$_POST['qty'];
	 include 'dbcon.php';
     $result = mysql_query("update product set pname='$pname',price=$price,qty=$qty,ptype='$ptype' where prodid=".$_POST['id']."");
     if(!$result)
{
   die('Error: ' . mysql_error());
}
else
{
   //echo "updated Successfully";
}
   }
?>

</head>
<body >
<!-- Shell -->

<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#"></a></h1>
    <!-- Cart -->
    <div id="cart">WELCOME Admin|<br><a href="index.php" class="cart-link">signout</a>

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="admin.php" class="active">Home</a></li>
        
       
        <li><a href="aaboutus.php">About Us</a></li>
        <li><a href="acontact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main"><br><br><br><br>
<center><form name="update" method="post">
<br/><br/>
<h1><center> Product Details</center></h1><br><br><br><br>
<table align="center" border="0">
<tr>
<td align="left">Product Id </td><td>:</td>
<td><input type="text" name="id" value = "<?php echo $id;?>"/></td>
</tr>
<tr>
<td align="left">Product Type </td><td>:</td>
<td><input type="text" name="ptype" value = "<?php echo $ptype;?>"/></td>
</tr>
<tr>
<td align="left">Product Name </td><td> :</td>
<td><input type="text" name="pname" value = "<?php echo $pname;?>"/></td>
</tr>
<tr>
<td align="left">Price </td><td> :</td>
<td><input type="text" name="price" value = "<?php echo $price;?>"/></td>
</tr>
<td align="left">Quantity </td><td> :</td>
<td><input type="text" name="qty" value = "<?php echo $qty;?>"/></td>
</tr>
<tr>
<td></td><td><input type="submit" value="Update" name="update"/></td>
</tr>

</table>
</center>
</form ><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</center>

  </div>
  <!-- End Main -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="loginhome.php">Home</a> <span>|</span> <span>|</span> <span>|</span> <a href="about.php">About Us</a> <span>|</span> <a href="lcontact.php">Contact</a> </p>

    <p class="right"> &copy; Online Fuel Services. Design by Tilak,Vishal,Anirudh </p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
</body>
</html>
