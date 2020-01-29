<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Portfólio</title>
    <link rel="stylesheet" type="texr/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="portfolio.css">
</head>
<body>
    <!--Topo-->
    <div id="principal" >
        <!--Botão login, acesso a página de Login-->
        <a href="cadastro.jsp"> <input class="bt-cadastro" id="botaocadastro" type="button" value="Criar conta"></a>
        <a href="login.jsp"> <input class="bt" id="botaologin" type="button" value="Entrar"></a>
        <a href="logout.jsp"> <input name="botaosair" id="botaosair" class="bt" type="button" value="Sair"></a>
        <a href="area-cliente.jsp"> <input name="botaocliente" id="botaocliente" class="bt" type="button" value="Área do Cliente"></a>
        <!--Imagem Instragam, acesso ao Instragram-->
        <a href="https://www.instagram.com/reintel_ti/"><img class="insta" src="Imagens/insta.png" width="20px" height="20px"> </a>
        <!--Imagem facebook, acesso ao facebook-->
        <a href="https://www.facebook.com/reintel.ti.1"><img class="face" src="Imagens/face.png" width="20px" height="20px"></a>
    </div>
    <!--Fim do topo-->
         
    <!--Cabeçalho-->
    <div id="cabecalho" >
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
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="sobre.jsp">Sobre</a></li>
                <li><a href="portfolio.jsp">Portfólio</a></li>
                <li><a href="contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>
    <!--Fim cabeçalho-->
    
    <div class="container">
        <div class="conteudo">
            <h3>Trabalhos realizados pela Reintel TI</h3>
            
            <div class="pbx">
                <h4>PABX</h4>
                <p>Instalação da modulare +, e preventiva de uma impacta 40, é importante a cada 6 meses ou no máximo uma vez ao ano realizar preventivas nos equipamentos, para melhorar o seu desempenho e aumentar a sua vida útil.</p>
                <h5>Antes:</h5>
                    <figure>
                        <img src="Imagens/Pabx1depois.jpg" alt="" class="png" height="200">
                        <img src="Imagens/pabx2antes.jpg" alt="" class="png1"  height="200">
                    </figure>

                <h5>Depois:</h5>
                    <figure>
                        <img src="Imagens/Pabx1antes.jpg" alt="" class="png" height="200">
                        <img src="Imagens/pabx2depois.jpg" alt="" class="png1"  height="200">
                    </figure>

            </div>
        </div> 

        <div class="conteudo2">  
            <div class="pbx">
                <h4>CFTV</h4>
                <p>O cliente solicitou para organizar a fiação. Aonde no local estava tudo bagunçado !!</p>
                <h5>Antes:</h5>
                    <figure>
                        <img src="Imagens/cftv1antes.jpg" alt="" class="png" height="200">
                        <img src="Imagens/cftv2antes.jpg" alt="" class="png1"  height="200">
                        <img src="Imagens/cftv3antes.jpg" alt="" class="png1"  height="200">
                    </figure>
    
                <h5>Depois:</h5>
                    <figure>
                        <img src="Imagens/cftv1depois.jpg" alt="" class="png" height="200">
                        <img src="Imagens/cftv2depois.jpg" alt="" class="png1"  height="200">
                    </figure>
    
            </div>

        <div class="conteudo3">  
            <div class="pbx">
                <h4>Redes</h4>
                <p>Ampliação da rede do cliente, realizamos a troca do rack porque o antigo já estava apertado para os equipamentos.</p>
                <h5>Antes:</h5>
                    <figure>
                        <img src="Imagens/redes1antes.jpg" alt="" class="png" height="200">
                    </figure>
    
                <h5>Depois:</h5>
                    <figure>
                        <img src="Imagens/redes1depois.jpg" alt="" class="png" height="200">
                        <img src="Imagens/redes2depois.jpg" alt="" class="png1"  height="200">
                    </figure>
            </div>

    </div>


</body>
</html>