<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Home</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="normalize.css">
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

    <!--Conteudo-->
            <div class="fundo" >
                <pre class="Conteudo">
                    Solução e suporte para
                            sua área de TI
                </pre>

                <div>
                    <a href="portfolio.jsp"><input class="bc" type="button" value="Portfólio"></a>
                    <a href="contato.jsp"><input class="bc" type="button" value="Contato"></a>
                </div>

             </div>
    <!--Fim do Conteudo-->

    <!--Servicos-->
    <div id="principal-servico">
        <div>
            <h1 class="servico">Serviços</h1>
        </div>

        
            <!--Redes-->
        <div id="serv" >
                <img id="imgre" src="Imagens/redes.png" width="50px" height="40px">
            <h4 class="rede">Redes</h4>
            <hr class="linha"> <br/>
            <p class="para">Consultoria.</p> <br/>
            <p class="para">Especializado em implantação de redes,
            cabeadas, estruturadas e wifi.</p> <br/>
            <p class="para">Fazemos manutenções.</p> <br/>
        </div>

        <!--CFTV-->
        <div id="cf">
                <img id="imgcf" src="Imagens/camera.png" width="50px" height="40px">
                <h4 class="rede">CFTV</h4>
                <hr class="linha"> <br/>
                <p class="para">Venda de equipamentos.</p> <br/>
                <p class="para">Instalações.</p> <br/>
                <p class="para">Suporte.</p> <br/>
                <p class="para">Configurações.</p> <br/>
                <p class="para">Acesso via celular.</p> <br/>
        </div>
        

        <!--telefonia-->
        <div id="tel">
                <img id="imgte" src="Imagens/suporte.png" width="35px" height="40px">
                <h4 class="rede">Telefonia</h4>
                <hr class="linha"> <br/>
                <p class="para">Implantação de PABX.</p> <br/>
                <p class="para">Configuração de linha tronco e ramais digitais, ramais analógicos além de suporte.</p> <br/>
                <p class="para">Atendimento automatico.</p> <br/>
        </div>

        <div class="clear"></div>

    </div>

        <!--Limpando os elementos flutuantes-->
        <div class="clear"></div>

        <!--newsletter-->
        <div id="new">
            <div class="tit">
            Assine nossa newsletter
            </div>

            <div class="em">
            <form action="" method="post">
            <span class="email">E-mail: </span> <input class="caixa" type="email" name="E-mail" id="E-mail" placeholder="Digite seu e-mail">
            <a href="embreve.html"><input class="sub" type="button" value="Enviar"></a>
            </form>
            </div>
    </div>

    <!--Rodapé-->
    <div id="rodapé">

        <div class="men">
         Menu
        </div>
        
        <div class="cont">Nossa Empresa</div>

        <div class="social">Nossas Redes sociais</div>

        <div class="clear"></div>
        <!--Topo do menu inferior-->

            <div class="rodface">
                <a href="https://www.facebook.com/reintel.ti.1"><img src="Imagens/face.png" height="40px" width="40px"> </a>
            </div>

            <div class="rodinsta">
                <a href="https://www.instagram.com/reintel_ti/"> <img src="Imagens/insta.png" alt="" height="40px" width="40px"></a>
            </div>

            <div class="clear"></div>
            
                <div class="logorod">
                    <img src="Imagens/logo.png" width="80px" heigth="60px">
                </div>
            
            <ul class="lista">
                <li><a href="index.html">Home</a></li> 
                <li><a href="sobre.html">Sobre</a></li>  
                <li><a href="">Portfólio</a></li> 
                <li><a href="contato.html">Contato</a></li>
            </ul>
            
            <pre class="info">
                <div class="esp">Tel.(11)2421-8281</div>
                <div class="esp">suporte@reintel.com.br</div>
                <div class="esp">Rua Quarto Centenário, 158</div>
                <div class="esp">Jd.Tranquilidade</div>
                <div class="esp">Guarulhos - SP.</div>
            </pre>
            
    </div>

    <!---Rodapé

    <div class="roda">
        <span class="text">&copy;2019 Todos os direitos reservados</span>
    </div>-->

</body>
</html>