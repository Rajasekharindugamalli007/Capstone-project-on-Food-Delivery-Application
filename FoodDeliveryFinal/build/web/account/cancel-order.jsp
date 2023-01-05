
<%@include file="connect.jsp"%>
<%@include file="wallet.jsp"%>
<%
    

String status = request.getParameter("status");
String id  = request.getParameter("id");
String sql11="UPDATE orders SET status='"+status+"' deleted=1 WHERE id='"+id+"'";
//String sql = "INSERT INTO tickets (poster_id, subject, description, type) VALUES ('"+user_id+"', '"+subject+"', '"+description+"', '"+type+"')";
Statement st11=con.createStatement();
st11.executeUpdate(sql11) ;
	//if ($con->query($sql) === TRUE){
	//	$ticket_id =  $con->insert_id;
        
        Statement st3=con.createStatement();
ResultSet rs2=st3.executeQuery("SELECT * FROM orders where id="+id);
double total=0.0;
while(rs2.next()){
total = rs2.getDouble("total");
}
double balance=0.0;
if(request.getParameter("payment_type").toString().equalsIgnoreCase("Wallet")){
	balance = balance+total;
	String sql22 = "UPDATE wallet_details SET balance = "+balance+" WHERE wallet_id = "+wallet_id;
	Statement mst=con.createStatement();
        mst.executeUpdate(sql22);
}

//header("location: ../tickets.jsp");
%>
<script>
        //window.alert("User Registered Succesfully..");
        
        window.location.assign("orders.jsp");
        </script>

        <!--
        <?php
include '../includes/connect.jsp';
include '../includes/wallet.jsp';
$status = $_POST['status'];
$id = $_POST['id'];
$sql = "UPDATE orders SET status='$status', deleted=1 WHERE id=$id;";
$con->query($sql);
$sql = mysqli_query($con, "SELECT * FROM orders where id=$id");
while($row1 = mysqli_fetch_array($sql)){
$total = $row1['total'];
}
if($_POST['payment_type'] == 'Wallet'){
	$balance = $balance+$total;
	$sql = "UPDATE wallet_details SET balance = $balance WHERE wallet_id = $wallet_id;";
	$con->query($sql);
}
header("location: ../orders.jsp");
?>
        -->