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


<script>


    function verificar() {

           var data ;

           data = document.emailForm.data.value ;

           if ( data.length == 0 ) {

              alert("Preencha o campo Data") ;
              document.emailForm.data.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var empresa ;

           empresa = document.emailForm.empresa.value ;

           if ( empresa.length == 0 ) {

              alert("Preencha o campo Empresa") ;
              document.emailForm.empresa.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var suporte ;

           suporte = document.emailForm.suporte.value ;

           if ( suporte.length == 0 ) {

              alert("Preencha o tipo de suporte") ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var endereco ;

           endereco = document.emailForm.endereco.value ;

           if ( endereco.length == 0 ) {

              alert("Preencha o campo Endereço") ;
              document.emailForm.endereco.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var prioridade ;

           prioridade = document.emailForm.prioridade.value ;

           if ( prioridade.length == 0 ) {

              alert("Preencha a prioridade do serviço") ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var responsavel ;

           responsavel = document.emailForm.responsavel.value ;

           if ( responsavel.length == 0 ) {

              alert("Preencha o campo AC/Responsável") ;
              document.emailForm.responsavel.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var problema ;

           problema = document.emailForm.problema.value ;

           if ( problema.length == 0 ) {

              alert("Preencha o campo Problema") ;
              document.emailForm.problema.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           document.getElementById('formclient').submit();
    }

</script>

<%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html;charset=UTF-8"); 

  String u_usuario  = (String)session.getAttribute("usuario") ;
  String u_email = (String)session.getAttribute("email");
  String u_nome = (String)session.getAttribute("nome");
  String u_endereco = request.getParameter("endereco");
  String u_assunto = request.getParameter("problema");
  String u_status = "Aberto";
  

  String driver = "net.sourceforge.jtds.jdbc.Driver" ;
  String url     = "EDITE AQUI"; //"jdbc:jtds:sqlserver://USUARIO_SQL:1433/DATABASE;instance=EXPRESS";
  String usuario = "EDITE AQUI" ; // Usuário do SQL
  String senha   = "EDITE AQUI" ; // Senha do SQL


  Class.forName(driver) ;


  Connection conexao = DriverManager.getConnection(url,usuario,senha);
 


%>


<% 
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");                      
String smtpServer = null;                                                                                                                   
String smtpPort = null;                                                                                                                     
final String authAddress = "EDITE AQUI"; //E-mail do header
final String authPassword = "EDITE AQUI";     //Senha                                                               
String subject = null;                                                                                                                      
String email = null;
String codigo = request.getParameter("codigo");                                                                                                                       
String v_suporte=request.getParameter("suporte");
String v_data =request.getParameter("data");
String v_empresa =request.getParameter("empresa");
String v_endereco =request.getParameter("endereco");
String v_prioridade =request.getParameter("prioridade");
String v_responsavel =request.getParameter("responsavel");
String message = null;
String result;
String send = request.getParameter("send");                                                                                                 
String siteName=(String)session.getAttribute("email");                                                        
if(send!=null){
        smtpServer = "smtp.gmail.com"; // Endereço SMTP
        smtpPort = "465";     //Porta SMTP
        subject = "Chamado de " + (String)session.getAttribute("nome");//Assunto       
        email = "EDITE AQUI";   //E-mail que receberá a mensagem(o e-mail da empresa)
       
        message = "E-mail do usuário: " + (String)session.getAttribute("email") + "<br><br>" + "Usuário: " + (String)session.getAttribute("usuario") + "<br>" + "Tipo de suporte: " + request.getParameter("suporte") + "<br>" + "Data: " + request.getParameter("data") + "<br>" + "Empresa: " + request.getParameter("empresa") + "<br>" + "Endereço: " + request.getParameter("endereco") + "<br>" + "Prioridade: " + request.getParameter("prioridade") + "<br>" + "Responsável: " + request.getParameter("responsavel") + "<br>" + "Mensagem: " + request.getParameter("problema");
  
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

            String sql = "INSERT INTO chamados (usuario,email,nome,endereco,assunto,status) VALUES ('" + u_usuario + "','" + u_email + "', + '" + u_nome + "', '" + u_endereco + "', '" + u_assunto + "', '" + u_status + "')" ; // Query para inserir os chamados na database
            Transport.send(msg);



            Statement stm = conexao.createStatement() ;


            stm.executeUpdate(sql) ;
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Chamado enviado com sucesso.');");
            out.println("</script>");
        }catch(Exception e){
                e.printStackTrace(response.getWriter());
        }
}
%>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Área do Cliente</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="area-client.css">
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
            <a href="historico.jsp"><input class="bt" type="submit" value="Histórico"></a> <br>
            <a href="mudarsenha.jsp"><input class="bt" type="submit" value="Mudar Senha"></a> <br>
        </div>
    </div>
    
    <!--Formulario-->
    <div class="container">
        <div class="titulo">
            Bem-Vindo(a), <%=session.getAttribute("nome")%>
        </div>

        <hr class="hrform">
        <div class="form">
            <form name="emailForm" action="area-cliente.jsp" id="formclient" method="post">
                
                <span>
                   <label for="suporte">Suporte</label> <br>
                   <select name="suporte" class="suporte" id="suporte">
                        <option value="Redes">Redes</option>
                        <option value="CFTV">CFTV</option>
                        <option value="PABX">Telefonia</option>
                    </select> 
                </span>
                
                <span>
                    <label for="datasolicitacao"><span class="nome">Data de Solicitação</span></label><br>
                    <input class="data" type="date" name="data" id="datasolicitacao">
                </span>
                
                <span>
                    <label for="empresa"> <span class="emp"> Empresa</span> </label> <br>
                    <input class="empresa" type="text" name="empresa" id="empresa" >
                </span>
                <div class="clear"></div>
                <span>
                    <label for="endereco"> <span class="end">Endereço</span></label><br>
                    <input class="endereco" type="text" name="endereco" id="endereco" >
                </span>
                
                <span>
                    <label for="prioridade"> <span class="prio">Prioridade</span></label> <br>
                    <select class="prioridade" name="prioridade" id="prioridade">
                        <option value="Baixa">Baixa</option>
                        <option value="Media">Média</option>
                        <option value="Alta">Alta</option>
                        <option value="Urgente">Urgente</option>
                    </select> 
                </span>
                
                <span>
                    <label for="responsavel"><span class="ac">AC / Responsável</span></label> <br>
                    <input class="responsavel" type="text" name="responsavel" id="responsavel" placeholder="Nome">
                </span>
                <div class="clear"></div>
                <span>
                    <label for="problema"><span name="problema" class="problema">Problema</span></label><br>
                    <textarea name="problema" id="problema" cols="122" rows="8"></textarea>
                </span>

                <div class="clear"></div>

                <input class="btsub" type="submit" name="send" value="Enviar Chamado" onClick="verificar()">
                
            </form>
        </div>
    </div>

    <div class="rodape"></div>
</body>
</html>