<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Sobre Nós</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="sobre.css">
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
            <ul id="lista">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="sobre.jsp">Sobre</a></li>
                <li><a href="portfolio.jsp">Portfólio</a></li>
                <li><a href="contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>
    <!--Fim cabeçalho-->

    <div class="container">
        <div class="sobre">
            <h3>Sobre Nós</h3>
            <p>A Reintel TI é uma empresa especializada em tecnologia da informação, criada com o objetivo de facilitar a competitividade tecnológica dos clientes, gerando melhor desempenho e estabilidade da rede.</p>
            <p>Contamos com profissionais altamente qualificados, para atender as necessidades de cada cliente, com foco em resolução dos problemas cotidianos de forma rápida e segura.</p>
            <p>Nosso comprometimento é garantir o funcionamento de tudo que se refere a tecnologia da informação e manter o cliente sempre atualizado de novas tecnologias para facilitar o seu trabalho do dia a dia.</p>
        </div>
        <hr>
        <div class="caixa">
            <div class="proposito">
                <h3>Nosso propósito</h3>
                <p>
                    Trazer o melhor serviço e suporte profissional para todos os clientes.
                </p>
            </div>

            <div class="missao">
                <h3>Missão</h3>
                <p>
                    Efetuar o serviço de maneira eficiente, organizado e rápido.
                </p>
            </div>

            <div class="valores">
                <h3>Valores</h3>
                <p class="primeiro">Excelência</p>
                <p>Organização</p>
                <p>Qualidade</p>
                <p>Responsabilidade</p>
            </div>
        </div>
    </div>

</body>
</html>