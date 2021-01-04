<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>PETROLS</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='IndianOil(p)'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['INDP'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='BharathPetroleum(p)'";
	  $res=mysql_query($qry);
	     if(mysql_num_rows($res)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($res);
			$_SESSION['BHAP'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='HP(p)'";
	  $res=mysql_query($qry);
	     if(mysql_num_rows($res)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($res);
			$_SESSION['HPP'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='Reliance(p)'";
	  $res=mysql_query($qry);
	     if(mysql_num_rows($res)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($res);
			$_SESSION['RP'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
$sql="select * from product where qty>0 AND ptype='petrol'";
$result=mysql_query($sql);

?>


</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">shoparound</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="login.php" class="cart-link">login</a>
      <div class="cl">&nbsp;</div>
      <span></span> <span></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
	 <div id="navigation">
      <ul>
        <li><a href="index.php" class="active">Home</a></li>
         
        <li><a href="aboutus.php">About Us</a></li>
        <li><a href="contact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
      <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul>
          <li> <a href="#"><img src="css/images/indoil.png" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><h3>INDIAN OIL PETROL</h3>
              <div class="product-desc">
                <h4><b>PRICE</b> </h4>
                
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['INDP'];?></strong> </div>
            </div>
          </li>
          <li> <a href="#"><img src="css/images/bhapetrol.png" /></a>
            <div class="product-info">
              <br><br><br><br><h3>BHARAT PETROL </h3>
              <div class="product-desc">
                <h4><b>PRICE</b></h4>
                
       
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['BHAP'];?></strong> </div>
            </div>
          </li>
          <li class="last"> <a href="#"><img src="css/images/hp.png" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><h3>HP PETROL</h3>
              <div class="product-desc">
                <h4>PRICE</h4>
                
			
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['HPP'];?></strong> </div>
            </div>         
          </li>
		  <li class="last"> <a href="#"><img src="css/images/reliance.jpg" width="235" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><h3>RELIANCE PETROL</h3>
              <div class="product-desc">
                <h4>PRICE</h4>
                
                <strong class="price"><img src="css/images/rsredbig.gif"  /><?php @session_start(); echo $_SESSION['RP'];?></strong> </div>
            </div>         
          </li>
		 </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
 <h1><b>PLEASE LOGIN TO PURCHASE THE PRODUCTS</B></h1>
</body>
</html>
