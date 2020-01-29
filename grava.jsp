<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"  %>
<link href="text-cadas.css" rel="stylesheet" type="text/css" media="screen" />
<meta charset="UTF-8">
<%
  try {
  // cria as variaveis  
  // e obtem os dados digitados pelo usuario
  request.setCharacterEncoding("UTF-8");
  String vusuario  = request.getParameter( "txtusuario" ) ;
  String vemail = request.getParameter( "txtemail" ) ;
  String vsenha = request.getParameter( "txtsenha" ) ;
  String vnome = request.getParameter( "txtnome" ) ;
  String vcpf = request.getParameter( "strCPF" ) ;
  String vendereco = request.getParameter( "txtendereco" ) ;
  String vnumeroendereco = request.getParameter( "txtnumero" ) ;
  String vcomplemento = request.getParameter( "txtcomplemento" ) ;
  String vestado = request.getParameter( "estados" ) ;
  String vcidade = request.getParameter( "cidades" ) ;
  String vbairro = request.getParameter( "txtbairro" ) ;
  String vtelefone = request.getParameter( "txttelefone" ) ;
  String vcelular = request.getParameter( "txtcelular" ) ;
  String vcep = request.getParameter( "cep" ) ;
  

  // cria as variaveis para conexao com o banco de dados
  //
  String driver = "net.sourceforge.jtds.jdbc.Driver" ;
  String url     = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
  String usuario = "EDITE AQUI" ; // Usu·rio do SQL
  String senha   = "EDITE AQUI" ; // Senha do SQL

  // carrega o driver na memÛria
  //
  Class.forName(driver) ;

  // cria a conexao com o banco
  //
  Connection conexao = DriverManager.getConnection(url,usuario,senha);

  // prepara o comando para inserir 
  String sql = "INSERT INTO cadastro_n1 (usuario,email,senha,nome,cpf,cep,endereco,numeroendereco,complemento,estado,cidade,bairro,telefone,celular) VALUES ('" + vusuario + "','" + vemail + "','" + vsenha + "', '" + vnome + "', '" + vcpf + "', '" + vcep + "', '" + vendereco +"', '" + vnumeroendereco + "', '" + vcomplemento + "', '" + vestado + "', '" + vcidade + "', '" + vbairro + "', '" + vtelefone + "', '" + vcelular + "')" ; // Insere o cadastro na database

  // cria o objeto statement para executar
  // o comando do sql
  Statement stm = conexao.createStatement() ;


  // executa o comando do sql
  stm.executeUpdate(sql) ;

   out.println("<script type=\"text/javascript\">");
   out.println("alert('Cadastro realizado com sucesso.');");
   out.println("location='index.jsp';");
   out.println("</script>");

 }catch (Exception e){
  out.println("<script charset=\"utf-8\">");
  out.println("alert('Usu√°rio ou e-mail j√° existe!');");
  out.println("location='cadastro.jsp';");
  out.println("</script>");
  }


%>






