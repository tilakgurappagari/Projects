<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <script type="text/javascript">
    history.pushState(null, null, document.URL);
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL);
});
  </script>
<title>online fuel services</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<?php
include 'dbcon.php';
$sql="select * from product where qty>0";
$result=mysql_query($sql);

?>
</head>
<body onload="function ()">
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
  <div id="main">
    <form action="upproduct.php"   name="memenable" method="post">
<br/><br/><br/><br/><br><br><br><br><br>
<h1><center>Product List By Category</center></h1>


<center>

<br><br>
Choose a Product:
<select name="pname">
<?php while($row = mysql_fetch_array($result))
  {
 ?>
  	
	<option><?php echo $row['pname'] ?></option>
	
  
<?php
  }
?>
</select><br/><br/><br/>
<input type="submit" value="Update Product" name="view" /><br/><br/>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</center>
</form>

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
