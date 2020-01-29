<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Login</title>

</head>

<body>

<%! String userdbName;

String userdbPsw;

String dbUsertype;

String endereco;

String cidade;

String estado;

String email;

%>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

String driver = "net.sourceforge.jtds.jdbc.Driver";

String url = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";

String user = "EDITE AQUI"; // Usuário do SQL

String dbpsw = "EDITE AQUI"; // Senha do SQL



String sql = "select * from cadastro_n1 where usuario=? and senha=?";



String usuario = request.getParameter("usuario");

String senha = request.getParameter("senha");

String nome = request.getParameter("nome");

String endereco = request.getParameter("endereco");

String cidade = request.getParameter("cidade");

String estado = request.getParameter("estado");

String email = request.getParameter("email");






if((!(usuario.equals("")) && ((!(senha.equals(""))))))

{

try{

Class.forName(driver);

con = DriverManager.getConnection(url, user, dbpsw);

ps = con.prepareStatement(sql);

ps.setString(1, usuario);

ps.setString(2, senha);


rs = ps.executeQuery();

if(rs.next())

{ 

userdbName = rs.getString("usuario");

userdbPsw = rs.getString("senha");

dbUsertype = rs.getString("nome");

endereco = rs.getString("endereco");

cidade = rs.getString("cidade");

estado = rs.getString("estado");

email = rs.getString("email");

if(usuario.equals(userdbName) && senha.equals(userdbPsw))

{

session.setAttribute("usuario",userdbName);

session.setAttribute("nome",dbUsertype);

session.setAttribute("endereco",endereco);

session.setAttribute("cidade",cidade);

session.setAttribute("estado", estado);

session.setAttribute("email", email);

session.setAttribute("senha", senha);


response.sendRedirect("index.jsp"); 

} 

}

else

   out.println("<script type=\"text/javascript\">");
   out.println("alert('Login ou senha inválidos');");
   out.println("location='login.jsp';");
   out.println("</script>");

rs.close();

ps.close(); 

}

catch(SQLException sqe)

{

out.println(sqe);

} 

}

else

{

%>

<center><p style="color:red">Erro ao logar</p></center>

<% 

getServletContext().getRequestDispatcher("/index.jsp").include(request, 
response);

}

%>

</body>

</html>