<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>OILS</title>

<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='TotalQuartz'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['TQ'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='Castrol'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['CAS'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='ShellHelix'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['SH'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>
<?php
include 'dbcon.php';
  
   
      $qry="SELECT * FROM product WHERE pname='ServoGear'";
	  $result=mysql_query($qry);
	     if(mysql_num_rows($result)>0)
	     {
		    @session_start();
			//session_regenerate_id();
			$member = mysql_fetch_assoc($result);
			$_SESSION['SG'] = $member['price'];
			$_SESSION['ID'] = $member['prodid'];
			//$_SESSION['amount']=0;
			// echo $_SESSION['NAME'];
			
			}
	
			session_write_close();
		
	
	
	

?>




<?php
include 'dbcon.php';
$sql="select * from product where qty>0 AND ptype='oil'";
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
    <div id="cart">WELCOME <?php @session_start(); echo $_SESSION['NAME'];?>|<br><a href="index.php" class="cart-link">signout</a>
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
          <li> <a href="#"><img src="css/images/oil1.jpg" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><br><h3>CASTROL ENGINE OIL</h3>
              <div class="product-desc">
                <h4><b>PRICE</b> </h4>
                
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['CAS'];?></strong> </div>
            </div>
          </li>
          <li> <a href="#"><img src="css/images/oil2.png" /></a>
            <div class="product-info">
              <br><br><br><br><br><h3>TOTAL QUARTZ </h3>
              <div class="product-desc">
                <h4><b>PRICE</b></h4>
                
       
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['TQ'];?></strong> </div>
            </div>
          </li>
          <li class="last"> <a href="#"><img src="css/images/oil3.png" alt="" /></a>
            <div class="product-info">
              <br><br><br><br><br><h3>SHELL HELIX</h3>
              <div class="product-desc">
                <h4>PRICE</h4>
                
			
                <strong class="price"><img src="css/images/rsredbig.gif" /><?php @session_start(); echo $_SESSION['SH'];?></strong> </div>
            </div>         
          </li>
		  <li class="last"> <a href="#"><img src="css/images/oil4.png"  alt="" /></a>
            <div class="product-info">
              <br><br><br><br><br><h3>SERVO</h3>
              <div class="product-desc">
                <h4>PRICE</h4>
                
                <strong class="price"><img src="css/images/rsredbig.gif"  /><?php @session_start(); echo $_SESSION['SG'];?></strong> </div>
            </div>         
          </li>
		 </ul>
        <div class="cl">&nbsp;</div>
      </div>
	  	  	  	  <form id="f1" action="cart.php" method="post">

<h3><center>Select The Product  InOrder To Buy</center></h3><br/><br/>
<center>
  oil brand   <select name="pid">
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
