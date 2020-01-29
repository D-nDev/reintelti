<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
   <head>  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Login </title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="slogin.css">
    <script type="text/javascript">
        
        
    function verificar() {

           var usuario ;

           usuario = document.form1.usuario.value ;

           if ( usuario.length == 0 ) {

              alert("Preencha o campo Usuário") ;
              document.form1.usuario.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var senha ;

           senha = document.form1.senha.value ;

           if ( senha.length == 0 ) {

              alert("Preencha o campo Senha") ;
              document.form1.senha.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           document.getElementById('form1').submit();
    }
        
    </script>
</head>
<body>
    <!--Cabeçalho-->
     <div id="cabecalho">
       <img class="imgca" src="Imagens/logo1.png" width="80px" height="60px">
       <div class="menu">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="portfolio.jsp">Portfólio</a></li>
            <li><a href="contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>
    <!--Fim do cabeçalho-->
    

       <!--Imagem de fundo--> 
       
       <div class="fundo">
            <img class="bg" src="Imagens/cadastrooff.jpg" alt="" width="100%" height="560px">
       </div>

<%

Connection con = null;

PreparedStatement ps = null;

ResultSet rs = null;



String driver = "net.sourceforge.jtds.jdbc.Driver" ;

String url = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";

String user = "EDITE AQUI"; // Usuário do SQL

String password = "EDITE AQUI"; // Senha do SQL



String sql = "select usuario from cadastro_n1";



try {

Class.forName(driver);

con = DriverManager.getConnection(url, user, password);

ps = con.prepareStatement(sql);

rs = ps.executeQuery(); 

String nome = (String)session.getAttribute("usuario");

  if (nome != null)

  {
   out.println("<script>");
   out.println("alert('Você já está logado');");
   out.println("location='index.jsp';");
   out.println("</script>");
  }

%>
<div id="container">
           <h2>
            <p class="Titulo"> Entre para iniciar a sua sessão.</p>
           </h2>

             <form name="form1" id="form1" action="logar.jsp" method="post"> 
                <input class="usuario" type="text" name="usuario" id="usuario" placeholder="Usuário"><br><br>
                <input class="senha" type="password" name="senha" id="senha" placeholder="Senha">
                <%

                    while(rs.next())

                    {

                    String usertype = rs.getString("usuario");


                    }

                    }

                    catch(SQLException sqe)

                    {

                    out.println("index"+sqe);

                    }

                %>
                <input type="submit" name="Enviar" value="Entrar" class="Entrar" onClick="verificar()">
            

                <a href="cadastro.jsp"><input type="button" name="crie" value="Crie sua Conta" class="crie"></a>
                <a href="esqueceusenha.jsp"><input type="button" name="esqueci" value="Esqueci a Senha" class="esqueci"></a>
        </div>
</form>
</body>
</html>