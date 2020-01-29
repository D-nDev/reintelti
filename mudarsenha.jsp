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

           var senhaantiga ;

           senhaantiga = document.senhas.senhaantiga.value ;

           if ( senhaantiga.length == 0 ) {

              alert("Preencha o campo Senha Atual") ;
              document.senhas.senhaantiga.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var senhanova ;

           senhanova = document.senhas.senhanova.value ;

           if ( senhanova.length < 6 ) {

              alert("Preencha o campo Senha Nova com no mínimo 6 caracteres") ;
              document.senhas.senhanova.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           var confirmasenha ;

           confirmasenha = document.senhas.confirmasenha.value ;

           if ( confirmasenha.length == 0 ) {

              alert("Preencha o campo de confirmação de senha") ;
              document.senhas.confirmasenha.focus() ;
              event.stopPropagation();
              event.preventDefault();
              return false ;
           }

           if(document.senhas.senhaantiga.value == document.senhas.senhanova.value)
           {
           alert('A Senha atual e a nova são iguais.');
           event.stopPropagation();
           event.preventDefault();
           return false;
           }

           if(document.senhas.senhanova.value != document.senhas.confirmasenha.value)
           {
           alert('As senhas não coincidem');
           event.stopPropagation();
           event.preventDefault();
           return false;
           } 

           document.getElementById('senhas').submit();
    }

</script>


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
            <a href="area-cliente.jsp"><input class="bt" type="submit" value="Enviar chamado"></a> <br>
            <a href="historico.jsp"><input class="bt" type="submit" value="Histórico"></a> <br>
        </div>
    </div>
    
    <!--Formulario-->
    <div class="container">
        <div class="titulo">
            Bem-Vindo(a), <%=session.getAttribute("nome")%>
        </div>

        <hr class="hrform">
        <div class="form">
            <form name="senhas" action="mudarsenhap.jsp" id="senhas" method="post">
 
                <span>
                    <label for="senhaatual"> <span class="senhaatual">Senha Atual:</span> </label> <br>
                    <input class="senhaatual" type="password" name="senhaantiga" id="current" >
                </span>
                <div class="clear"></div>
                <span>
                    <label for="senhanova"> <span class="senhanova">Senha Nova:</span></label><br>
                    <input class="senhanova" type="password" name="senhanova" id="new" >
                </span>
                <div class="clear"></div>
                <span>
                    <label for="confirmasenha"> <span class="confirmasenha">Confirme a nova senha:</span></label><br>
                    <input class="confirmasenha" type="password" name="confirmasenha" id="confirm" >
                </span>

                <div class="clear"></div>

                <input class="btalterar" type="submit" name="send" value="Alterar" onClick="verificar()">
                
            </form>
        </div>
    </div>

    <div class="rodape"></div>
</body>
</html>