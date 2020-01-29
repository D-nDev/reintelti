<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Properties"%>                                                                                                  
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Área do Cliente</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="area-cliente2.css">

    <style>
      td  {
       word-wrap:break-word;
      }
    </style>
</head>
<body>
    <!--Topo-->
    <div class="fundo">
        <img class="imgtopo" src="Imagens/logo1.png" width="80px" height="60px">
    </div>
      
    <!--Menu lateral-->
    <div id="lateral">
        <div id="containerlateral">
            <div class="cima">
                <img class="user" src="Imagens/user (1).png" alt="" width="16" height="16">
                <%=session.getAttribute("usuario")%>
            </div>

                

            <%
        //Define a sessão
                String nome = (String)session.getAttribute("usuario");
                if (nome == null)

                {
                   out.println("<script>");
                   out.println("alert('Você deve estar logado para acessar esta página');");
                   out.println("location='login.jsp';");
                   out.println("</script>");
                }
                else
                {

                }
            %>
            <div class="info">
               <%=session.getAttribute("nome")%> <br>
               <%=session.getAttribute("endereco")%> <br>
               <%=session.getAttribute("estado")%> - <%=session.getAttribute("cidade")%> <br>
            </div>

            <hr>
            <a href="index.jsp"><input class="bt" type="submit" value="Pagina inicial"></a> <br>
            <a href="area-cliente.jsp"><input class="bt" type="submit" value="Abrir Chamado"></a> <br>
            <a href="mudarsenha.jsp"><input class="bt" type="submit" value="Mudar Senha"></a> <br>
        </div>
    </div>
    
    <!--Formulario-->
    <div class="container">
        <div class="titulo">
            Bem-Vindo(a), <%=session.getAttribute("nome")%>
        </div>

        <hr class="hrform">
       
        <%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html;charset=UTF-8"); 

  String driver = "net.sourceforge.jtds.jdbc.Driver" ;
  String url     = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
  String usuario = "EDITE AQUI" ; // Usuário do SQL
  String senha   = "EDITE AQUI" ; // Senha do SQL

  Class.forName(driver) ;

  Connection conexao =  DriverManager.getConnection(url,usuario,senha) ; 


  String sql = "SELECT * FROM chamados WHERE usuario= '"+(String)session.getAttribute("usuario")+"'"; // Seleciona o histórico de chamados pela database para o usuário específico

  Statement stm = conexao.createStatement() ;

  ResultSet dados = stm.executeQuery( sql ) ;

  out.print("&thinsp;");
  out.print("<div class=tabela>");
  out.print( "<table class=tabelahistorico border=1 cellspacing=0 width=100% role=grid style=width:80%;table-layout:fixed>"  ) ;  

  out.print( "<tr>"  ) ;  
    out.print( "<th>Código</th><th>Usuário</th><th>Assunto</th><th>Status</th>"  ) ;  
  out.print( "</tr>"  ) ;  

  while ( dados.next() ) {
   out.print( "<tr>"  ) ;  

     out.print( "<td> "  ) ;  
       out.print( dados.getString("codigo")  ) ;
     out.print( "</td>"  ) ; 
 
     out.print( "<td>"  ) ;  
       out.print( dados.getString("usuario")  ) ;
     out.print( "</td>"  ) ; 

     out.print( "<td>"  ) ;  
       out.print( dados.getString("assunto")  ) ;
     out.print( "</td>"  ) ; 

     out.print( "<td>"  ) ;  
       out.print( dados.getString("status")  ) ;
     out.print( "</td>"  ) ;
 

   out.print( "</tr>"  ) ; 
  

  }


  out.print( "</table>"  ) ;  

  out.print("</div>");

%>


    </div>
</body>
</html>