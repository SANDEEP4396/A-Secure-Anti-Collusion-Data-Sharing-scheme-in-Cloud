<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbPack.DatabaseConnection"%>
<%

Connection con = DatabaseConnection.getCon();
Statement st = con.createStatement();
int i = st.executeUpdate("delete from upload where file_id = '"+request.getQueryString()+"' ");
if(i!=0){
    response.sendRedirect("adminFileDetails.jsp?file Deleted...!");
}

%>