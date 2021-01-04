<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>online fuel services</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />



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
    <div id="cart">welcome   <?php @session_start(); echo $_SESSION['NAME'];?>|<br><a href="index.php" class="cart-link">signout</a>

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="loginhome.php">Home</a></li>
        
       
        <li><a href="labout.php">About Us</a></li>
        <li><a href="lcontact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">

<br><br><br><br><br><br><br><br><br><br>
<center><table border="0"  align="center" width="10" height="10">
 <p>  Thanks For Purchasing the Product . We will deliver the Product soon <br>to the given address:   <?php @session_start(); echo $_SESSION['AD'];?></p>
<a href="loginhome.php">OK</a></center>

   

      
  
</table></center>


  </div>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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




