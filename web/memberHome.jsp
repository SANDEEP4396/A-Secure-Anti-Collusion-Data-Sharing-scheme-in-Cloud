<%@page import="java.sql.ResultSet"%>
<%@page import="DbPack.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>  A Secure Anti-Collusion Data Sharing Scheme for Dynamic Groups in Cloud</title>
<meta name="keywords" content="VOIP Company, css template, free web design layout" />
<meta name="description" content="VOIP Company, css template, free web design layout from TemplateMo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="tabcontent.css" />
<script type="text/javascript" src="tabcontent.js">

</script>

</head>
<body>
  
  <%
  if(request.getParameter("ms")!=null){
      session.setAttribute("ID", request.getParameter("ms"));
  }
  %>
<div id="templatemo_wrapper">
<div id="templatemo_container">
    <div id="templatemo_menu">
        <div id="pettabs" class="indentmenu">
            <ul>
                <li><a href="#" rel="tab1" class="selected">Home</a></li>
<!--                <li><a href="fileDetails.jsp" rel="tab2">File Details</a></li>-->
                <li><a href="file_upload.jsp" rel="tab3">Upload</a></li>
                <li><a href="#" rel="tab4">Download</a></li>
                <li><a href="confirm.jsp" rel="tab3">A/C Revoke</a></li>
                <li><a href="Home.jsp " rel="tab1">Sign Out</a></li>
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
                  <li><a href="#">Service 6</a></li>
                </ul>
            </div>
            
            <div id="tab3" class="tabcontent">
            	<ul>
                  <li><a href="#">Product 1</a></li>
                  <li><a href="#">Product 2</a></li>
                  <li><a href="#">Product 3</a></li>
                  <li><a href="#">Product 4</a></li>
                   <li><a href="#">Product 5</a></li>
                    <li><a href="#">Product 6</a></li>
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
        <p>  A Secure Anti-Collusion Data Sharing Scheme for Dynamic Groups in Cloud</p>
    
    </div>
    
	<div id="templatemo_content">
    	<div id="content_top"></div>
        
        <div class="templatemo_content_section_01">
            <div class="section_01_left" style="margin-left: 20px;">
                <p style="font-family: cursive; font-size:30px;"><a href="file_upload.jsp"><font color="deepskyblue">File Upload</font></a></p>
                <p style="font-family: cursive; font-size:30px;"><a href="FileDownload.jsp"><font color="deepskyblue">File Download</font></a></p>
                <p style="font-family: cursive; font-size:30px;"><a href="fileDetails.jsp"><font color="deepskyblue">File Details</font></a></p>
                <p style="font-family: cursive; font-size:30px;"><a href="confirm.jsp"><font color="deepskyblue">A/C Revoke</font></a></p>
               
            </div> 
			
            
            
            <div class="cleaner">&nbsp;</div>
		</div>
        
       
        
        
    </div>
    
    <div id="templatemo_footer">
    
        	<p>Copyright � 2017 </p>
	</div> <!-- end of footer -->
	<!--  Free CSS Templates from www.TemplateMo.com  -->
</div>
</div>
</body>
</html>