/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actionPackage;

import DbPack.DatabaseConnection;
import DbPack.TrippleDes;
import Utils.EncryptRsa;
import Utils.SimpleFTPClient;
import alogithm.RSACipher;
import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author Eswar
 */
public class Upload2 extends HttpServlet {
private static final String TMP_DIR_PATH = "c:\\tmp";
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "file";
    private File destinationDir;
    Calendar currentDate = Calendar.getInstance();
    SimpleDateFormat formatter =
            new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
    String dateNow = formatter.format(currentDate.getTime());
final String filepath="S:\\";
    static String  cipher;
       SimpleFTPClient client;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             HttpSession user=request.getSession(true);
              Connection con = null;
    Statement st = null;
    Statement st1 = null;
     String EncKey = "";
      PreparedStatement pstm1 = null;
       MultipartRequest m=new MultipartRequest(request,filepath);
      
           File file=m.getFile("file");           
           String filename=file.getName().toLowerCase();
           String fname="";
           String encType=m.getParameter("keys");
         HttpSession session = request.getSession(true);
    String getu = session.getAttribute("ID").toString();
    System.out.println("id is " + getu);
     int x = filename.lastIndexOf('\\');
        String fN = filename.substring(x + 1, filename.length());
        System.out.println(fN);
   
     String gr=null;
        String gr_sig=null;
        con = DatabaseConnection.getCon();
        st = con.createStatement();
        st1 = con.createStatement();
    PreparedStatement pstm = null;
        FileInputStream fis = null;
        long size = 0;

            client = new SimpleFTPClient();
            client.setHost("ftp.drivehq.com");
            client.setUser("sssv");
            client.setPassword("eastwest2017");
            client.setRemoteFile(filename);
Connection cones=DatabaseConnection.getCon();
Statement stm=cones.createStatement();
ResultSet rs=stm.executeQuery("select * from upload where file_name='"+filename+"'");
if(rs.next())
{
    response.sendRedirect("memberHome.jsp?msgges= NOT sucess..!");
}
else
{
     BufferedReader br=new BufferedReader(new FileReader(filepath+filename));
            StringBuffer sb=new StringBuffer();
            String temp=null;
            while(( temp=br.readLine())!=null){
               sb.append(temp);              
           } 
            System. out.println("file content:"+sb.toString());
             File fes= new File("S:/"+filename);
                

              		BufferedOutputStream w = new BufferedOutputStream(new FileOutputStream(fes));
                        int c;
              		
               if(encType.equalsIgnoreCase("DDDES")){
                     cipher = new TrippleDes().encrypt(sb.toString());
               }else if(encType.equals("select")){
                   
               }else{
                   EncryptRsa Algo = new EncryptRsa();
                   
                    EncKey = Algo.generateKey(); //sav the key 
                   
                   cipher = Algo.encrypt(session.getAttribute("Username").toString(),EncKey, sb.toString());
                   
                   System.out.println("i m inside the rsa algo -------------------------"+cipher);
               }   
                System.out.println(cipher);
               w.write(cipher.getBytes());
                      
               w.close();
                            
               
                 String fesname=fes.getName();
              
               String fN1=fesname.substring(x+1, fesname.length());
               client=new SimpleFTPClient();
                   
                    client.setHost("ftp.drivehq.com");
                    client.setUser("sssv");
                    client.setPassword("eastwest2017");
                    client.setRemoteFile(fN1);

                   boolean log= client.connect(); 
        
       if(log)
       {
                       if (client.uploadFile(fes)){
        
        //;

        String emailes="";
        
            String sq2 = "insert into upload (file_name,file_data,date,key_,group_,user_id,s_key)values(?,?,?,?,?,?,?)";
        String sq3 = "select * from register where username = '" + getu + "'";
        System.out.println("jjj");
        ResultSet rs3 = st.executeQuery(sq3); 
        if(rs3.next()){
            emailes=rs3.getString("email");
          gr = rs3.getString("group_");  
          gr_sig=rs3.getString("gr_sig");
        }
        String EncData = new TrippleDes().encrypt(filename);
        System.out.println("emailllll---------"+emailes);
        pstm1 = con.prepareStatement(sq2);
        pstm1.setString(7, EncKey);
        System.out.println("filekeyyyyyyy issssss"+EncKey);
        pstm1.setString(1, filename);
        
         System.out.println("filename=============="+filename);
        Random r = new Random();
        int getKey = r.nextInt() + 5000;
        String key = "" + getKey;

        pstm1.setString(2, cipher);
        System.out.println("cipher=============="+cipher);
        pstm1.setString(3, dateNow);
        System.out.println("cipher=============="+dateNow);
        pstm1.setString(4, EncData);
        System.out.println("cipher=============="+EncData);


        pstm1.setString(5, gr);
        System.out.println("cipher==========gr===="+gr);
        pstm1.setString(6, getu);
        System.out.println("cipher=============getu="+getu);


    pstm1.execute();
        String Msges="Your File access Key For the File"+filename+" Key is: "+EncData;
       mail mes=new mail();
         String sq4 = "select * from register where group_ = '" + gr + "'";
        System.out.println("rrrrrr");
        ResultSet rs4 = st.executeQuery(sq4);
        while(rs4.next())
        {
            String email=rs4.getString("email");
            String uname=rs4.getString("username");
            System.out.println("emaill-------"+email);
         // mail_Send.sendMail(Msges, getu, email);
       mail_Send.sendMail(Msges,uname,email);
       System.out.println("sssssssss");
        
//        System.out.println("sd=============="+sd);
       {
            System.out.println("in");
             int ii = st1.executeUpdate("insert into log_details values('"+getu+"','"+filename+"','"+gr+"','Upload',now())");
             if(ii!=0){
//                 JOptionPane.showMessageDialog(null,"File Key Is :  "+new TrippleDes().encrypt(fileName).toString());
                // out.println("alert('completed')");
                response.sendRedirect("memberHome.jsp?msg=file Uploaded");    
             }else{
                 out.println("log error");
             }
         
        }
        }            }else{
                response.sendRedirect("memberHome.jsp?msg=file not Uploaded");               
                       }
       }else{
           response.sendRedirect("memberHome.jsp?msg=file not Uploaded");    
       }
            }
            

           
        }catch(Exception e)
        {
            
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
