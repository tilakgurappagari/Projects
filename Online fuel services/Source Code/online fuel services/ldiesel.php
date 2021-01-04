<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>PETROLS</title>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='IndianOil(d)'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['INDD'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='BharathPetroleum(d)'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['BHAD'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='HP(d)'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['HPD'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='Reliance(d)'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['RD'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>



<?php
include 'dbcon.php';
$sql="select * from product where qty>0 AND ptype='diesel'";
$result=mysql_query($sql);

?>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#"></a></h1>
    <!-- Cart -->
    <div id="cart"> WELCOME <?php @session_start(); echo $_SESSION['NAME'];?>|<br><a href="index.php" class="cart-link">signout</a>
      <div class="cl">&nbsp;</div>
      <span></span> <span></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
	 <div id="navigation">
      <ul>
        <li><a href="loginhome.php" class="active">Home</a></li>
         
        <li><a href="laboutus.php">AboutUs</a></li>
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
             <br><br><br><br> <h3>INDIAN OIL DIESEL</h3>
              <div class="product-desc">
                <h4><b>PRICE</b> </h4>
                
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['INDD'];?></strong> </div>
            </div>
          </li>
          <li> <a href="#"><img src="css/images/bhapetrol.png" /></a>
            <div class="product-info">
              <br><br><br><br><h3>BHARAT DIESEL </h3>
              <div class="product-desc">
                <h4><b>PRICE</b></h4>
                
       
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['BHAD'];?></strong> </div>
            </div>
          </li>
          <li class="last"> <a href="#"><img src="css/images/hp.png" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><h3>HP DIESEL</h3>
              <div class="product-desc">
                <h4>PRICE</h4>
                
			
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['HPD'];?></strong> </div>
            </div>         
          </li>
		  <li class="last"> <a href="#"><img src="css/images/reliance.jpg" width="235" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><h3>RELIANCE DIESEL</h3>
              <div class="product-desc">
                <h4>PRICE</h4>
                
                <strong class="price"><img src="css/images/rsredbig.gif"  /><?php @session_start(); echo $_SESSION['RD'];?></strong> </div>
            </div>         
          </li>
		 </ul>
        <div class="cl">&nbsp;</div>
      </div>
	  	  <form id="f1" action="cart.php" method="post">

<h3><center>Select The Product  InOrder To Buy</center></h3><br/><br/>
<center>
  Fuel Company   <select name="pid">
<?php while($row = mysql_fetch_array($result))
  {
 ?>
  	
	<option><?php echo $row['pname'] ?></option>
	
  
<?php
  }
?>
</select>

   <input type="submit" value="OK" name="submit"/>
</center>
</form>
      <!-- End Products -->
 
</body>
</html>
