<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String currentPassword=request.getParameter("senhaantiga");
String Newpass=request.getParameter("senhanova");
String conpass=request.getParameter("confirmasenha");
String url = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
String driver = "net.sourceforge.jtds.jdbc.Driver";
Connection con=null;
String pass=(String)session.getAttribute("senha");
try{
Class.forName(driver);
con = DriverManager.getConnection(url, "EDITE_AQUI", "EDITE_AQUI"); // Usuário e Senha do SQL respectivamente
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from cadastro_n1 where senha='"+currentPassword+"'");
while(rs.next()){
pass=rs.getString(1);
} 
if(currentPassword.equals((String)session.getAttribute("senha"))){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update cadastro_n1 set senha='"+Newpass+"' where usuario='"+(String)session.getAttribute("usuario")+"'");
out.println("<script type=\"text/javascript\">");
   out.println("alert('Senha alterada, por favor entre novamente.');");
   out.println("location='logout2.jsp';");
   out.println("</script>");
st1.close();
con.close();
}
else{
out.println("<script type=\"text/javascript\">");
   out.println("alert('Senha antiga inválida.');");
   out.println("location='mudarsenha.jsp';");
   out.println("</script>");
}
}
catch(Exception e){
out.println(e);
}
%>