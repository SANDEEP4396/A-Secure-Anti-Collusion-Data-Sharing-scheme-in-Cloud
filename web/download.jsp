<%@page import="Utils.EncryptRsa"%>
<%@page import="java.io.OutputStream"%>
<%@page import="DbPack.TrippleDes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String cipher = null, gr = "", name = null;
    String getFile = request.getQueryString();
    String getUser = session.getAttribute("ID").toString();
    System.out.println("user is " + getUser);
    Connection con = DbPack.DatabaseConnection.getCon();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet rs = st.executeQuery("select * from upload where file_name = '" + getFile + "' ");
    ResultSet rs1 = st2.executeQuery("select * from register where username = '" + getUser + "' ");

   
    if (rs.next()) {
        gr = rs.getString("group_");
        name = rs.getString("file_name");
        cipher = rs.getString("file_data");
    
    if(rs1.next()){
         System.out.println("inside the loop-----------@"+gr+"@-------------the user Data");
    
     if(rs1.getString("group_").equalsIgnoreCase(gr)){
         
     System.out.println("inside the loop .........................................");
    String plain ;
    String Key = rs.getString("s_key");
     if(rs.getString("s_key").equals("")){
      plain = new TrippleDes().decrypt(cipher);
        }else{
         EncryptRsa e = new EncryptRsa();
       plain =  e.dencrypt(session.getAttribute("Username").toString(), Key , cipher);
        }
    byte[] data = plain.getBytes();
    int ii = st1.executeUpdate("insert into log_details values('"+getUser+"','"+getFile+"','"+gr+"','Download',now())");
    if (data != null) {

        System.out.println("go>>>>>>>>>>");

        response.setContentType("image/jpg");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");

        OutputStream os = response.getOutputStream();
        os.write(data);
        os.close();
        data = null;
        //session.removeAttribute("document1");

    }

     }else{
        out.println(" You are Not A Member....!");
     }
         }else{
         out.println(" Database Error Occured....!");
         }
    }else{
          out.println(" Database Error Occured....!");
    }
%>