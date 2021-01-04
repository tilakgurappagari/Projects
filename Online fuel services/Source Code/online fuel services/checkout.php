<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>online fuel services</title>
<link href="bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link href="stylet.css" rel="stylesheet" type="text/css">

<?php
$payid=rand(1,500);
$date=date("d-m-Y");
include 'dbcon.php';
if(isset($_POST['payment']))
{
   
   $addr=$_SESSION['addr'];
   $_SESSION['AD']=$addr;
   $pid=$_POST['pid'];
   $ptype=$_POST['pmode'];
   $cardno=$_POST['cno'];
  $sno=$_POST['scode'];
  $productid=$_SESSION['ID'];
  $bid=$_SESSION['BID'];
  $bname=$_SESSION['NAME'];
  $amt=$_SESSION['amount'];
  $date=$_POST['date'];
  //$date=getdate(date("d/m/Y"));
 /* echo $bid;
  echo $bname;
  echo $amt;
  echo $date;*/
  $qry="insert into payment(payid,paytype,cardno,scode,productid,buyerid,buyername,amt,addr,date)values($pid,'$ptype',$cardno,
	   $sno,$productid,'$bid','$bname',$amt,'$addr','$date')";
	 
	   $result=mysql_query($qry,$con);
	  
	    if (!$result)
    {
     die('Error: ' . mysql_error());
    }
	  else
		{   $_SESSION['amount']=0;
		  // echo "Ur Details Successfully Registered ";
		  header("location:final.php");
		   }
  }
  
  	if(isset($_POST['can']))
		
   {   
   
   $pqty=$_SESSION['pqty'];
   $_SESSION['qtty']=$_SESSION['qtty']+$pqty;
   $quant=$_SESSION['qtty'];
   $pname=$_SESSION['pname'];
   include 'dbcon.php';
     $result = mysql_query("update product set qty='$quant' where pname='$pname'");
    
          $_SESSION['amount']=$_SESSION['amount']*0;
        header("location:loginhome.php");
  
    }
  
  
?>
<style type="text/css">
.bacg
{
	background-image:url("reg.jpg");
background-size:cover;
	}

h1,h3,h2{
	color:white;
}
</style>
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
    <div id="cart">WELCOME <?php @session_start(); echo $_SESSION['NAME'];?>|<br><a href="index.php" class="cart-link">signout</a>

      <div class="cl">&nbsp;</div>
    <span><strong></strong></span> <span> <strong></strong></span> </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">

      <ul>
        <li><a href="loginhome.php">Home</a></li>
        
       
        <li><a href="aboutus.php">About Us</a></li>
        <li><a href="lcontact.php">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main" class="bacg">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
<form name="f3" method="post">
<br/><br/>
<h1><center> Payment Details</center></h1>
<br><br><br><br><br>
<center><table align="center" border="0">
<tr>
<td align="right"><h2>Payid:</h2> </td>
<td><input type="text" name="pid"  readonly="TRUE" value="<?php echo $payid;?>" /></td>

</tr>
<tr>
<td align="right"><h2>Amount:</h2> </td>
<td><input type="text" name="pid" readonly="TRUE" value="<?php @session_start(); echo $_SESSION['amount'];?>" /></td>

</tr>
<tr>
<td align="right"><h2>Select Delivery Address<br>(default is displayed):</h2> </td>
<td><input type="text" name="addr"  value="<?php @session_start(); echo $_SESSION['addr'];?>" /></td>

</tr>
<tr>
<td align="right"><h2>PaymentMode: </h2></td>
<td><select name="pmode">
<option>CreditCard</option>
<option>MasterCard</option>
<option>VisaCard</option>
<option>PayPal</option>
</select></td>

</tr>
<tr>
<td align="right"><h2>Card No:</h2> </td>
<td><input type="text" name="cno" /></td>

</tr>
<tr>
<td align="right"><h2>cvv:<br>(3 digits at back of card) </h2></td>
<td><input type="password" name="scode" /></td>

</tr>
<tr>
<td align="right"><h2>Date :</h2></td>
<td><input readonly="TRUE" type="text" name="date" value="<?php echo $date;?>" /></td>

</tr>
<tr>
<td > </td>

<td><input type="submit" name="payment" class="btn btn-full" value="confirm payment" /></td>
<td><input type="submit" name="can" class="btn btn-full" value="cancel" /></td>

</tr>
</table></center>
</form>
<br><br><br><br><br><br><br><br><br>
    <!-- End Sidebar -->
    <div class="cl">&nbsp;</div>
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
