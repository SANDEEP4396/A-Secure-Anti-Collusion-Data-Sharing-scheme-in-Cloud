<%@page import="DbPack.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> The :  Usage of cryptographic techniques for secure multi-owner data sharing in cloud</title>
<meta name="keywords" content="VOIP Company, css template, free web design layout" />
<meta name="description" content="VOIP Company, css template, free web design layout from TemplateMo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="tabcontent.css" />
<script>
    function checked(){
        
        var us = document.getElementById("user").value;
        var pa = document.getElementById("pass").value;
        var gr = document.getElementById("group").value;
        var em = document.getElementById("email").value;
        var mo = document.getElementById("mobile").value;
        var pl = document.getElementById("place").value;
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
         var mob = /^[1-9]{1}[0-9]{10}$/;
        if(us==""){
            alert("enter username");
            document.getElementById("user").value;
            return false;
        }
        if(pa==""){
            alert("enter password");
            document.getElementById("pass").value;
            return false;
        }
        if(gr==""){
            alert("enter group");
            document.getElementById("group").value;
            return false;
        }
        if(em==""){
            alert("enter email");
            document.getElementById("email").value;
            return false;
        }
         if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
 }
        if(mo==""){
            alert("enter mobile");
            document.getElementById("mobile").value;
            return false;
        }
     if (isNaN(mo))
                {
                    alert("Enter Numbers Only");
                   document.getElementById("mobile").value;
                    return false;
                }
                if (!/^[0-9]{10}$/.test(mo)) {
                    alert("Please input exactly 10 numbers!");
                    document.getElementById("mobile").value;
                    return false;
                }

        if(pl==""){
            alert("enter place");
            document.getElementById("place").value;
            return false;
        }
    }
</script>

</head>
<body>
<div id="templatemo_wrapper">
<div id="templatemo_container">
    <div id="templatemo_menu">
        <div id="pettabs" class="indentmenu">
            <ul>
                <li><a href="Home.jsp" rel="tab1" >Home</a></li>
                  <li><a href="register.jsp" rel="tab2">Register</a></li>
                  <li><a href="#" rel="tab2" class="selected">Login</a></li>
            </ul>
        </div>
        <div class="tabcontentstyle">
        
            
            <div id="tab2" class="tabcontent">
            	<ul>
                  <li><a href="#">Service 1</a></li>
                  <li><a href="#">Service 2</a></li>
                  <li><a href="#">Service 3</a></li>
                  <li><a href="#">Service 4</a></li>
                  <li><a href="#">Service 5</a></li>
                </ul>
            </div>
            
            <div id="tab3" class="tabcontent">
            	<ul>
                  <li><a href="#">Product 1</a></li>
                  <li><a href="#">Product 2</a></li>
                  <li><a href="#">Product 3</a></li>
                  <li><a href="#">Product 4</a></li>
                </ul>
            </div>
            
            <div id="tab4" class="tabcontent">
            	<ul>
                  <li><a href="#">Link 1</a></li>
                  <li><a href="#">Link 2</a></li>
                  <li><a href="#">Link 3</a></li>
                  <li><a href="#">Link 4</a></li>
                  <li><a href="#">Link 5</a></li>
                  <li><a href="#">Link 6</a></li>
                </ul>
            </div>
            
            <div id="tab5" class="tabcontent">
            	Something you might want to know about us.
            </div>
            
            <div id="tab6" class="tabcontent">
            	Don't be hesitated to contact us if you have something to say.
            </div>
        
        </div>
<script type="text/javascript">
        
        var mypets=new ddtabcontent("pettabs")
        mypets.setpersist(true)
        mypets.setselectedClassTarget("link")
        mypets.init(false)   
</script>

    </div> <!-- end of mneu -->
   
    <div id="templatemo_banner">
    	_
        <p> Usage of cryptographic techniques for secure multi-owner data sharing in cloud</p>
    
    </div>
    
	<div id="templatemo_content">
    	<div id="content_top"></div>
        
        <div class="templatemo_content_section_01">
            <div class="section_01_left" style="margin-left: 280px;">
                  <form action="login" method="get">
                <p style="font-family:fantasy;font-size:350%; margin-left: -200px;">Login Page</p><br></br>
                <p style="font-family:fantasy;font-size:150%; ">Username : <input type ="text" name ="username"  size="30"/></p>
                <p style="font-family:fantasy;font-size:150%;margin-left: 3px; ">Password : <input type ="password" name ="password" size="30"/></p>	
                <p style="margin-left: 50px;"><input type ="submit" value="Login" style="font-size:150%;"/><input type ="reset" value="Cancel" style="font-size:150%;" /></p>
                </form>   
                </div> 
			
            
            
            <div class="cleaner">&nbsp;</div>
		</div>
        
       
        
        
    </div>
    
    <div id="templatemo_footer">
    
        	<p>Copyright � 2016 <a href="http://www.mindsofttech.com"><strong>Mindsoft</strong></a> </p>
	</div> <!-- end of footer -->
	<!--  Free CSS Templates from www.TemplateMo.com  -->
</div>
</div>
</html>