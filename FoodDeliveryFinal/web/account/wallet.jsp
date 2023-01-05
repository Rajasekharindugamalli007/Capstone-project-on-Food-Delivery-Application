<%@page import="java.sql.*"%>
<%
    String wallet_id="";
Class.forName("com.mysql.jdbc.Driver");  
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food","root","");  
String user_id=session.getAttribute("user_id").toString();
String sql = "SELECT * FROM wallet where customer_id = '"+user_id+"'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
if(rs.next()){
 wallet_id = rs.getString("id");
}
String sql1 = "SELECT * FROM wallet_details where wallet_id = '"+wallet_id+"'";
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery(sql1);
if(rs1.next()){
String balance = rs.getString("balance");
}
%>

