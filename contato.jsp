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

<%

  

  String driver = "net.sourceforge.jtds.jdbc.Driver" ;
  String url     = "EDITE AQUI"; //"jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
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
String message = null;
String result;
String send = request.getParameter("send");                                                                                                 
String siteName=(String)session.getAttribute("email");                                                        
if(send!=null){
        smtpServer = "smtp.gmail.com"; // Endereço SMTP
        smtpPort = "465";     //Porta SMTP
        subject = "Contato de " + (String)session.getAttribute("nome");//Assunto       
        email = "EDITE AQUI";   //E-mail que receberá a mensagem(O e-mail da empresa)
       
        message = "E-mail: " + request.getParameter("email2") + "<br><br>" + "Nome: " + request.getParameter("nome") + "<br>" + "Telefone: " + request.getParameter("telefone") + "<br>" + "Mensagem: " + request.getParameter("mensagem");
  
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

            Transport.send(msg);


            out.println("<script type=\"text/javascript\">");
            out.println("alert('Mensagem enviada com sucesso.');");
            out.println("location='index.jsp';");
            out.println("</script>");
        }catch(Exception e){
                e.printStackTrace(response.getWriter());
        }
}
%>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Contato</title>
    <link rel="stylesheet" href="normalize.css">
    <link rel="stylesheet" href="contato.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
    <script src="https://rawgit.com/RobinHerbots/Inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
    <script>


    function verificar() {

           var nome ;

           nome = document.contato.nome.value ;

           if ( nome.length == 0 ) {

              alert("Preencha o campo Nome") ;
              document.contato.nome.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var email3 ;

           email3 = document.contato.email2.value ;

           if ( email3.length == 0 ) {

              alert("Preencha o campo E-mail") ;
              document.contato.email2.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var telefone ;

           telefone = document.contato.telefone.value ;

           if ( telefone.length == 0 ) {

              alert("Preencha o campo Telefone") ;
              document.contato.telefone.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var mensagem ;

           mensagem = document.contato.mensagem.value ;

           if ( mensagem.length == 0 ) {

              alert("Preencha o campo Mensagem") ;
              document.contato.mensagem.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           document.getElementById('contatoform').submit();
    }

    $(document).ready(function(){
        var SPMaskBehavior = function (val) {
          return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
        },
        spOptions = {
          onKeyPress: function(val, e, field, options) {
              field.mask(SPMaskBehavior.apply({}, arguments), options);
            }
        };

        $('#telefone').mask(SPMaskBehavior, spOptions);
        });
  

</script>
</head>
<body>
    
    <!--Topo-->
    <div id="principal" >
        <!--Botão login, acesso a página de Login-->
        <a href="cadastro.jsp"> <input class="bt-cadastro" id="botaocadastro" type="button" value="Criar conta"></a>
        <a href="login.jsp"> <input class="bt" id="botaologin" type="button" value="Entrar"></a>
        <a href="logout.jsp"> <input name="botaosair" id="botaosair" class="bt-sair" type="button" value="Sair"></a>
        <a href="area-cliente.jsp"> <input name="botaocliente" id="botaocliente" class="bt" type="button" value="Área do Cliente"></a>
        <!--Imagem Instragam, acesso ao Instragram-->
        <a href="https://www.instagram.com/reintel_ti/"><img class="insta" src="Imagens/insta.png" width="20px" height="20px"> </a>
        <!--Imagem facebook, acesso ao facebook-->
        <a href="https://www.facebook.com/reintel.ti.1"><img class="face" src="Imagens/face.png" width="20px" height="20px"></a>
    </div>
    <!--Fim do topo-->
     
    <!--Cabeçalho-->
    <div id="cabecalho">
        <img class="imgca" src="Imagens/logo1.png" width="80px" height="60px">
        <p class="clientelogin" name="clientelogin" id="clientelogin">Bem-vindo(a), <%=session.getAttribute("usuario")%></p>
        <%
        //Define a sessão
                String nome = (String)session.getAttribute("usuario");
                if (nome == null)

                {
                   out.println("<script>");
                   out.println("document.getElementById('clientelogin').style.display = 'block';");
                   out.println("document.getElementById('clientelogin').style.display = 'none';");
                   out.println("document.getElementById('botaocliente').style.display = 'none';");
                   out.println("document.getElementById('botaosair').style.display = 'none';");
                   out.println("</script>");
                }
                else
                {

                     out.println("<script>");
                     out.println("document.getElementById('botaologin').style.display = 'block';");
                     out.println("document.getElementById('botaologin').style.display = 'none';");
                     out.println("document.getElementById('botaocadastro').style.display = 'block';");
                     out.println("document.getElementById('botaocadastro').style.display = 'none';");
                     out.println("</script>");
                }
        %>
        <div class="menu">
            <ul id="lista">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="sobre.jsp">Sobre</a></li>
                <li><a href="portfolio.jsp">Portfólio</a></li>
                <li><a href="contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>
    <!--Fim cabeçalho-->

    <div id="container">
        <div class="contato">
            <h4>Contate-nos</h4>

            <form name="contato" id="contatoform" action="">

                <label for="nome">Nome</label> <br>
                <input type="text" name="nome" id="nome"><br>

                <label for="email">E-mail</label> <br>
                <input type="text" name="email2" id="email"><br>

                <label for="telefone">Telefone/Celular</label> <br>
                <input type="text" name="telefone" id="telefone"><br>

                <label for="mensagem">Mensagem</label><br>
                <textarea name="mensagem" id="mensagem" cols="30" rows="8"></textarea><br>

                <input type="submit" name="send" id="test" value="Enviar" class="enviar" onClick="verificar()">

            </form>
        </div>
    </div>
    
    <div id="Mapa">
        <h3>Mapa: Encontre a Reintel TI</h3>
        <iframe class="mapa" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3659.5864458127453!2d-46.55906018563221!3d-23.47537738472565!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94cef582e484fe51%3A0x119a46d5c1ee76ab!2sR.%20Quarto%20Centen%C3%A1rio%2C%20158%20-%20Vila%20Sao%20Rafael%2C%20Guarulhos%20-%20SP%2C%2007053-030!5e0!3m2!1spt-BR!2sbr!4v1573667258952!5m2!1spt-BR!2sbr" width="310" height="170" frameborder="0" style="border:0;" allowfullscreen=""></iframe>

        <ul id="telefone">
            <li class="primeiro">Tel:(11)2421-8281</li>
        </ul>
        
        <ul id="suporte">
            <li class="segundo">suporte@reintel.com.br</li>
        </ul>

        <ul id="endereco">
            <li class="segundo">Rua Quarto Centenário,158 Jd.Tranquilidade Guarulhos-SP</li>
        </ul>
    </div>
</body>

</html>


    