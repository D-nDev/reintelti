<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Properties"%>                                                                                                  
<%@page import="javax.mail.Session"%>                                                                                                       
<%@page import="javax.mail.Authenticator"%>                                                                                                 
<%@page import="javax.mail.PasswordAuthentication"%>                                                                                        
<%@page import="javax.mail.Message"%>                                                                                                       
<%@page import="javax.mail.internet.MimeMessage"%>                                                                                          
<%@page import="javax.mail.internet.InternetAddress"%>                                                                                      
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.*"%> 
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

           var email ;

           email = document.form2.email.value ;

           if ( email.length == 0 ) {

              alert("Preencha o campo E-mail") ;
              document.form2.email.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           document.getElementById('form2').submit();
    }
        
    </script>
    <%

  

  String driver = "net.sourceforge.jtds.jdbc.Driver" ;
  String url     = "EDITE AQUI"; // "jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
  String usuario = "EDITE AQUI" ; // Usuário do SQL
  String senha   = "EDITE AQUI" ; // Senha do SQL


  Class.forName(driver) ;


  Connection conexao = DriverManager.getConnection(url,usuario,senha);
 


%>


<%                                                                                                                                          
String smtpServer = null;                                                                                                                   
String smtpPort = null;                                                                                                                     
final String authAddress = "EDITE AQUI"; //E-mail do header
final String authPassword = "EDITE AQUI";     //Senha                                                               
String subject = null;                                                                                                                      
String email = null;
String mail = request.getParameter("mail");
String message = null;
String result;
String senhanova = Long.toHexString(Double.doubleToLongBits(Math.random())); // geração da nova senha
String send = request.getParameter("send");                                                                                                                                                        
if(send!=null){
        smtpServer = "smtp.gmail.com"; // Endereço SMTP
        smtpPort = "465";     //Porta SMTP
        subject = "Sua senha nova para a Reintel TI: ";//Assunto       
        email = request.getParameter("mail");  //E-mail que receberá a mensagem(e-mail do usuário)
       
        message = "Sua Nova senha é: " + senhanova + "<br><br>" + "<h2>Recomendamos fortemente que a altere após logar.</h2>" + "<br><br>" + "<h2>*Lembre-se se este e-mail não pertencer a nenhuma conta esta senha será invalidada automaticamente.";
  
        //Declara as propriedades do envio do email via smtp    
        try{                                             
                Properties props = new Properties();    
                props.put("mail.smtp.host", smtpServer);
                props.put("mail.smtp.port", smtpPort);
                props.put("mail.smtp.auth", "true");   
                props.put("mail.transport.protocol", "smtp");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
     
                                                         
            // cria as propriedades da sessão baseados no authadress e authpassword
            Session sessionMail = Session.getInstance(props, new Authenticator() {
                 public PasswordAuthentication getPasswordAuthentication() {     
                         return new PasswordAuthentication(authAddress, authPassword);
                 }                                                                   
                });                                                                  
                                                                         
            sessionMail.setDebug(true);
            // cria a mensagem
            Message msg = new MimeMessage(sessionMail);
            // Indica de quem vai enviar para quem
            InternetAddress addressFrom = new InternetAddress(authAddress);
            msg.setFrom(addressFrom);
            InternetAddress[] addressTo = new InternetAddress[1];
            addressTo[0] = new InternetAddress(email);
            msg.setRecipients(Message.RecipientType.TO, addressTo);
            msg.setSubject(subject);
            msg.setContent(message, "text/html; charset=UTF-8");

            String sql = "update cadastro_n1 set senha='"+senhanova+"' where email='"+mail+"'";
            Transport.send(msg);



            Statement stm = conexao.createStatement() ;


            stm.executeUpdate(sql) ;
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Senha enviada para o e-mail.');");
            out.println("</script>");
        }catch(Exception e){
                e.printStackTrace(response.getWriter());
        }
}
%>
</head>
<body>
    <!--Cabeçalho-->
     <div id="cabecalho">
       <img class="imgca" src="Imagens/logo1.png" width="80px" height="60px">
       <%
        //Define a sessão
                String nome = (String)session.getAttribute("usuario");
                if (nome != null)

                {
                   out.println("<script>");
                   out.println("alert('Você já está logado!');");
                   out.println("location='area-cliente.jsp';");
                   out.println("</script>");
                }
                else
                {

                }
        %>
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

<div id="container">
           <h2>
            <p class="Titulo"> Digite seu e-mail abaixo</p>
           </h2>

             <form name="form2" id="form1" action="esqueceusenha.jsp" method="post"> 
                <input class="usuario" type="text" name="mail" id="mail" placeholder="E-mail"><br><br>
                <input type="submit" name="send" value="Enviar" class="Entrar" onClick="verificar()">
                <a href="login.jsp"><input type="button" name="voltar" value="Voltar" class="voltar"></a>
            
        </div>
</form>
</body>
</html>