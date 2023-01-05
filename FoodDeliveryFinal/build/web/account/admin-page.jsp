<%@include file="connect.jsp" %>
<!--
<?php
include 'includes/connect.jsp';


	if($_SESSION['admin_sid']==session_id())
	{
		?>

-->

<%
    
//if(session.getAttribute("admin_sid'")==session.getId())
//	{
		
    %>
                <!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="msapplication-tap-highlight" content="no">
  <title>Food Menu</title>

  <!-- Favicons-->
  <link rel="icon" href="images/favicon/favicon-32x32.png" sizes="32x32">
  <!-- Favicons-->
  <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png">
  <!-- For iPhone -->
  <meta name="msapplication-TileColor" content="#00bcd4">
  <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png">
  <!-- For Windows Phone -->


  <!-- CORE CSS-->
  <link href="css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  <!-- Custome CSS-->    
  <link href="css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection">

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="js/plugins/data-tables/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" media="screen,projection">
  
     <style type="text/css">
  .input-field div.error{
    position: relative;
    top: -1rem;
    left: 0rem;
    font-size: 0.8rem;
    color:#FF4081;
    -webkit-transform: translateY(0%);
    -ms-transform: translateY(0%);
    -o-transform: translateY(0%);
    transform: translateY(0%);
  }
  .input-field label.active{
      width:100%;
  }
  .left-alert input[type=text] + label:after, 
  .left-alert input[type=password] + label:after, 
  .left-alert input[type=email] + label:after, 
  .left-alert input[type=url] + label:after, 
  .left-alert input[type=time] + label:after,
  .left-alert input[type=date] + label:after, 
  .left-alert input[type=datetime-local] + label:after, 
  .left-alert input[type=tel] + label:after, 
  .left-alert input[type=number] + label:after, 
  .left-alert input[type=search] + label:after, 
  .left-alert textarea.materialize-textarea + label:after{
      left:0px;
  }
  .right-alert input[type=text] + label:after, 
  .right-alert input[type=password] + label:after, 
  .right-alert input[type=email] + label:after, 
  .right-alert input[type=url] + label:after, 
  .right-alert input[type=time] + label:after,
  .right-alert input[type=date] + label:after, 
  .right-alert input[type=datetime-local] + label:after, 
  .right-alert input[type=tel] + label:after, 
  .right-alert input[type=number] + label:after, 
  .right-alert input[type=search] + label:after, 
  .right-alert textarea.materialize-textarea + label:after{
      right:70px;
  }
  </style> 
</head>

<body>
  <!-- Start Page Loading -->
  <div id="loader-wrapper">
      <div id="loader"></div>        
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->

  <!-- //////////////////////////////////////////////////////////////////////////// -->

  <!-- START HEADER -->
  <header id="header" class="page-topbar">
        <!-- start header nav-->
        <div class="navbar-fixed">
            <nav class="navbar-color">
                <div class="nav-wrapper">
                    <ul class="left">                      
                      <li><h1 class="logo-wrapper"><a href="index.jsp" class="brand-logo darken-1"><img src="images/materialize-logo.png" alt="logo"></a> <span class="logo-text">Logo</span></h1></li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- end header nav-->
  </header>
  <!-- END HEADER -->

  <!-- //////////////////////////////////////////////////////////////////////////// -->

  <!-- START MAIN -->
  <div id="main">
    <!-- START WRAPPER -->
    <div class="wrapper">

      <!-- START LEFT SIDEBAR NAV-->
      <aside id="left-sidebar-nav">
        <ul id="slide-out" class="side-nav fixed leftside-navigation">
            <li class="user-details cyan darken-2">
            <div class="row">
                <div class="col col s4 m4 l4">
                    <img src="images/avatar.jpg" alt="" class="circle responsive-img valign profile-image">
                </div>
				 <div class="col col s8 m8 l8">
                    <ul id="profile-dropdown" class="dropdown-content">
                        <li><a href="routers/logout.jsp"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                        </li>
                    </ul>
                </div>
                <div class="col col s8 m8 l8">
                    <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown"><?php echo $name;?>�<i class="mdi-navigation-arrow-drop-down right"></i></a>
                    <p class="user-roal"><?php echo $role;?></p>
                </div>
            </div>
            </li>
            <li class="bold active"><a href="index.jsp" class="waves-effect waves-cyan"><i class="mdi-editor-border-color"></i> Food Menu</a>
            </li>
                <li class="no-padding">
                    <ul class="collapsible collapsible-accordion">
                        <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="mdi-editor-insert-invitation"></i> Orders</a>
                            <div class="collapsible-body">
                                <ul>
								<li><a href="all-orders.jsp">All Orders</a>
                                </li>
                                
                                <!--
								<?php
									$sql = mysqli_query($con, "SELECT DISTINCT status FROM orders;");
									while($row = mysqli_fetch_array($sql)){
                                    echo '<li><a href="all-orders.jsp?status='.$row['status'].'">'.$row['status'].'</a>
                                    </li>';
									}
									?>
                                
                                -->
                                
                                				<%
                                                                    Statement st=con.createStatement();
                                                                    
									String sql = "SELECT DISTINCT status FROM orders";
                                                                        ResultSet rs=st.executeQuery(sql);
                                                                        
									while(rs.next()){
                                                                            %>
                                    <li><a href="all-orders.jsp?status="<%= rs.getString("status")%> ><%= rs.getString("status")%></a>
                                    </li>
                                    <%
									}
									%>
                                
                                                                        
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>
                 <li class="no-padding">
                    <ul class="collapsible collapsible-accordion">
                        <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-question-answer"></i> Tickets</a>
                            <div class="collapsible-body">
                                <ul>
								<li><a href="all-tickets.jsp">All Tickets</a>
                                </li>
								<!--<?php
									$sql = mysqli_query($con, "SELECT DISTINCT status FROM tickets;");
									while($row = mysqli_fetch_array($sql)){
                                    echo '<li><a href="all-tickets.jsp?status='.$row['status'].'">'.$row['status'].'</a>
                                    </li>';
									}
									?>-->
                                                                <%
                                                                    
                                                                String sql5 = "SELECT DISTINCT status FROM tickets";
                                                                Statement st5=con.createStatement();
                                                                ResultSet rs5=st5.executeQuery(sql5);

									while(rs5.next()){
                                                                            
                                                                        %>
                                    <li><a href="all-tickets.jsp?status='"<%=rs5.getString("status")%> >"<%=rs5.getString("status")%></a>
                                    </li>
                                    <%
									}


                                                                    %>
        
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>			
            <li class="bold"><a href="users.jsp" class="waves-effect waves-cyan"><i class="mdi-social-person"></i> Users</a>
            </li>				
        </ul>
        <a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i class="mdi-navigation-menu"></i></a>
        </aside>
      <!-- END LEFT SIDEBAR NAV-->

      <!-- //////////////////////////////////////////////////////////////////////////// -->

      <!-- START CONTENT -->
      <section id="content">

        <!--breadcrumbs start-->
        
        <!--breadcrumbs end-->


        <!--start container-->
        <div class="container">
          
		  <form class="formValidate" id="formValidate" method="post" action="menu-router.jsp" novalidate="novalidate">
            <div class="row">
              <div class="col s12 m4 l3">
                <h4 class="breadcrumbs-title">Edit Menu Items</h4>
              </div>
              <div>
				<table id="data-table-admin" class="responsive-table display" cellspacing="0">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Item Price/Piece</th>
                        <th>Image</th>
                      </tr>
                    </thead>

                    <tbody>
                        <!--
				<?php
				$result = mysqli_query($con, "SELECT * FROM items");
				while($row = mysqli_fetch_array($result))
				{
					echo '<tr><td><div class="input-field col s12"><label for="'.$row["id"].'_name">Name</label>';
					echo '<input value="'.$row["name"].'" id="'.$row["id"].'_name" name="'.$row['id'].'_name" type="text" data-error=".errorTxt'.$row["id"].'"><div class="errorTxt'.$row["id"].'"></div></td>';					
					echo '<td><div class="input-field col s12 "><label for="'.$row["id"].'_price">Price</label>';
					echo '<input value="'.$row["price"].'" id="'.$row["id"].'_price" name="'.$row['id'].'_price" type="text" data-error=".errorTxt'.$row["id"].'"><div class="errorTxt'.$row["id"].'"></div></td>';                   
					echo '<td>';
					if($row['deleted'] == 0){
						$text1 = 'selected';
						$text2 = '';
					}
					else{
						$text1 = '';
						$text2 = 'selected';						
					}
					echo '
					<img src="data:image/jpeg;base64,'.base64_encode($row['image']).'" id="'.$row["id"].'_image" name="'.$row['id'].'_image" type="file" data-error=".errorTxt'.$row["id"].'"><div class="errorTxt'.$row["id"].'"></div>
                    </td></tr>';
				}
				?>
                        -->
                        
                        
                        <%
				String result = "SELECT * FROM items";
                                Statement st6=con.createStatement();
                                ResultSet rs6=st6.executeQuery(result);
				while(rs6.next())
				{
                                    String idd=rs6.getString("id")+"_name";
                                    String pr=rs6.getString("id")+"_price";
                                    %>
                                    <tr><td><div class="input-field col s12"><label for=<%=idd%>>Name</label>';
			<input value="<%=rs6.getString("name")%>" id="<%=rs6.getString("id")%> name="<%=rs6.getString("id")%> type="text" data-error=".errorTxt'.$row["id"].'"><div class="errorTxt'.$row["id"].'"></div></td>';					
			<td><div class="input-field col s12 "><label for="'.$row["id"].'_price">Price</label>';
			<input value=<%=rs6.getString("price")%> id=<%=pr%> name="<%=pr%>" type="text" >
                        </div></td>
                        <td>
                            <%
                                String text1="",text2="";
					if(rs6.getInt("deleted") == 0){
						text1 = "selected";
						text2 = "";
					}
					else{
						text1 = "";
						text2 = "selected";						
					}
                                        %>
					<!--
					<img src="data:image/jpeg;base64,'.base64_encode($row['image']).'" id="'.$row["id"].'_image" name="'.$row['id'].'_image" type="file" data-error=".errorTxt'.$row["id"].'"><div class="errorTxt'.$row["id"].'"></div>
                    </td></tr>-->
                                        
                                        <%}
				%>
                        
                    </tbody>
</table>
              </div>
			  <div class="input-field col s12">
                              <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Modify
                                <i class="mdi-content-send right"></i>
                              </button>
                            </div>
            </div>
			</form>
		  <form class="formValidate" id="formValidate1" method="post" action="add-item.jsp" novalidate="novalidate" enctype="multipart/form-data">
            <div class="row">
              <div class="col s12 m4 l3">
                <h4 class="header">Add Item</h4>
              </div>
              <div>
<table>
                    <thead>
                      <tr>
                        <th data-field="id">Name</th>
                        <th data-field="name">Item Price/Piece</th>
                        <th data-field="image">Image</th>
                      </tr>
                    </thead>

                    <tbody>
                        <!--
				<?php
				
					echo '<tr><td><div class="input-field col s12"><label for="name">Name</label>';
					echo '<input id="name" name="name" type="text" data-error=".errorTxt01"><div class="errorTxt01"></div></td>';					
					echo '<td><div class="input-field col s12 "><label for="price" class="">Price</label>';
					echo '<input id="price" name="price" type="text" data-error=".errorTxt02"><div class="errorTxt02"></div></td>';

					echo '<td><div class="input-field col s12 ">';
					echo '
					<input type="file" id="image" name="image" data-error=".errorTxt01"><div class="errorTxt01"></div></td>';                   
					echo '<td></tr>';
				?>
                        -->
                        <tr><td><div class="input-field col s12"><label for="name">Name</label>
					<input id="name" name="name" type="text" ></div></td>					
					<td><div class="input-field col s12 "><label for="price" class="">Price</label>
					<input id="price" name="price" type="text" data-error=".errorTxt02"><div class="errorTxt02"></div></td>

					<td><div class="input-field col s12 ">
					
					<input type="file" id="image" name="image" data-error=".errorTxt01"><div class="errorTxt01"></div></td>
					<td></tr>
                    </tbody>
</table>
              </div>
			  <div class="input-field col s12">
                              <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Add
                                <i class="mdi-content-send right"></i>
                              </button>
                            </div>
            </div>
			</form>			
            <div class="divider"></div>
            
          </div>
        </div>
        </div>
        <!--end container-->

      </section>
      <!-- END CONTENT -->
    </div>
    <!-- END WRAPPER -->




  <!-- //////////////////////////////////////////////////////////////////////////// -->

  <!-- START FOOTER -->
  <footer class="page-footer">
    <div class="footer-copyright">
      <div class="container">
        <!--<span>Copyright � <a class="grey-text text-lighten-4" href="#" target="_blank">Students</a> All rights reserved.</span>-->
        <span class="right"> Design and Developed by <a class="grey-text text-lighten-4" href="#">Students</a></span>
        </div>
    </div>
  </footer>
    <!-- END FOOTER -->



    <!-- ================================================
    Scripts
    ================================================ -->
    
    
    <!-- jQuery Library -->
    <script type="text/javascript" src="js/plugins/jquery-1.11.2.min.js"></script>    
    <!--angularjs-->
    <script type="text/javascript" src="js/plugins/angular.min.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <!-- data-tables -->
    <script type="text/javascript" src="js/plugins/data-tables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/data-tables/data-tables-script.js"></script>
    
    <script type="text/javascript" src="js/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/plugins/jquery-validation/additional-methods.min.js"></script>
    
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="js/custom-script.js"></script>
	    
</body>

</html>
<!--
<?php
	}
	else
	{
		if($_SESSION['customer_sid']==session_id())
		{
			header("location:index.jsp");		
		}
		else{
			header("location:login.jsp");
		}
	}
?>
    -->      
          
