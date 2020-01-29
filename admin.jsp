<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Properties"%>                                                                                                  
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Administração</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="area-client.css">
</head>
<body>
    <!--Topo-->
    <div class="fundo">
        <img class="imgtopo" src="Imagens/logo1.png" width="80px" height="60px">
    </div>
       
    <!--Menu lateral-->
    
    
    <!--Formulario-->
    <div class="container">

        <%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html;charset=UTF-8"); 

  String driver = "net.sourceforge.jtds.jdbc.Driver" ;
  String url     = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
  String usuario = "EDITE AQUI" ; // usuario do SQL
  String senha   = "EDITE AQUI" ; // senha do SQL

  Class.forName(driver) ;

  Connection conexao =  DriverManager.getConnection(url,usuario,senha) ; 


  String sql = "SELECT * FROM chamados";

  String sql1 = "SELECT * from cadastro_n1";

  Statement stm = conexao.createStatement() ;

  Statement stm2 = conexao.createStatement() ;

  ResultSet dados = stm.executeQuery( sql ) ;

  ResultSet dados1 = stm2.executeQuery(sql1);
 


  while ( dados.next() ) {

  out.print("<div class=tabela>");
  out.print("<div class=titulo>");
  out.print("Chamados: <br/><br>");
  out.print("</div>");
  out.print( "<table class=tabelahistorico border=1 cellspacing=0 width=100% role=grid style=width:80%;table-layout:fixed>"  ) ;  

  out.print( "<tr>"  ) ;  
    out.print( "<th>Código</th><th>Usuário</th><th>Assunto</th><th>Status</th>"  ) ;  
  out.print( "</tr>"  ) ; 

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

   out.print( "</table>"  ) ;  
  

  }

  out.print("<div class=titulo>");
            out.print("Dados cadastrais: <br/><br>");
        out.print("</div>");

  out.print( "</table>"  ) ;  

  out.print("</div>");

   out.print("&thinsp;");
  out.print("<div class=tabela>");
  out.print( "<table class=tabelahistorico border=1 cellspacing=0 width=100% role=grid style=width:80%;table-layout:fixed>"  ) ;  

  out.print( "<tr>"  ) ;  
    out.print( "<th>Código</th><th>Usuário</th><th>E-mail</th><th>Senha</th><th>Nome</th><th>CPF</th><th>CEP</th><th>Endereço</th><th>N°</th><th>Complemento</th><th>Estado</th><th>Cidade</th><th>Bairro</th><th>Telefone</th><th>Celular</th>"  ) ;  
  out.print( "</tr>"  ) ;  

  while ( dados1.next() ) {
   out.print( "<tr>"  ) ;  

     out.print( "<td> "  ) ;  
       out.print( dados1.getString("codigo")  ) ;
     out.print( "</td>"  ) ; 
 
     out.print( "<td>"  ) ;  
       out.print( dados1.getString("usuario")  ) ;
     out.print( "</td>"  ) ; 

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("email")  ) ;
     out.print( "</td>"  ) ; 

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("senha")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("nome")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("cpf")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("cep")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("endereco")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("numeroendereco")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("complemento")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("estado")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("cidade")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("bairro")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("telefone")  ) ;
     out.print( "</td>"  ) ;

     out.print( "<td>"  ) ;  
       out.print( dados1.getString("celular")  ) ;
     out.print( "</td>"  ) ;
 

   out.print( "</tr>"  ) ; 
  

  }


  out.print( "</table>"  ) ;  

  out.print("</div>");

  String nome = (String)session.getAttribute("usuario");

  if (nome == null) {
    out.println("<script>");
    out.println("alert('Você deve estar logado como admin para acessar esta página');");
    out.println("location='login.jsp';");
    out.println("</script>");

  }

  else if (nome.equals("EDITE_AQUI")){ // conta permitida acessar a página de administrador

  }

  else {

  out.println("<script>");
  out.println("alert('Você não é administrador');");
  out.println("location='index.jsp';");
  out.println("</script>");
}

%>


    
</body>
</html>