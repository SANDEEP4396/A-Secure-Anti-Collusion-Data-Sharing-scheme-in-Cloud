<%@page import="actionPackage.mail_Send"%>
<%@page import="DbPack.TrippleDes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%
String gets=null;
String group=null;;
String getString = request.getParameter("user");
String gr=request.getParameter("gr");
System.out.println("grrrr"+gr);
String email=request.getParameter("email");
System.out.println("nameeee---"+getString);
Connection con = DatabaseConnection.getCon();
Statement st = con.createStatement();
Statement st1 = con.createStatement();
ResultSet rs = st1.executeQuery("select * from register where  username = '"+getString+"' ");
if(rs.next()){
    gets = new TrippleDes().encrypt(rs.getString("group_"));
//    group=rs.getString("group_");
}
System.out.println("tt "+gets);
int i = st.executeUpdate("update register set status = 'YES' ,gr_sig = '"+gets+"' where username = '"+getString+"' ");
if(i!=0){
    ResultSet rs1=st1.executeQuery("select * from upload where group_='"+gr+"'");
    while(rs1.next())
               {
               String fname=rs1.getString("file_name");
               String key_=rs1.getString("key_");
                 String Msges="Your File access Key For the File"+fname+" Key is: "+key_;
   mail_Send.sendMail(Msges,getString,email);
       System.out.println("sssssssss");
    
}
    response.sendRedirect("view_Action.jsp?group="+session.getAttribute("gid").toString());
       }
else{
    //response.sendRedirect("");
    out.println("Account Activation Error check ur data....");
}
%>
