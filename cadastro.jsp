<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reintel TI | Cadastro</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="cadastro.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
    <script src="https://rawgit.com/RobinHerbots/Inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
    <script type="text/javascript">  

        function limpar(){
           document.getElementById("cadastro").reset();
        }

        $(document).ready(function () { 
        var $campocpf = $("#strCPF");
        });

        $(document).ready(function () { 
        var $campocpf = $("#strCPF");
        $campocpf.mask('000.000.000-00', {reverse: true});
        });

        $(document).ready(function(){
        var SPMaskBehavior = function (val) {
          return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
        },
        spOptions = {
          onKeyPress: function(val, e, field, options) {
              field.mask(SPMaskBehavior.apply({}, arguments), options);
            }
        };

        $(document).ready(function(){
        var SPMaskBehavior2 = function (val) {
          return val.replace(/\D/g, '').length === 10 ? '(00) 0000-0000' : '(00) 0000-0000';
        },
        spOptions = {
          onKeyPress: function(val, e, field, options) {
              field.mask(SPMaskBehavior2.apply({}, arguments), options);
            }
        };

        $(document).ready(function(){
        $("#cep").mask("99999-999");
        });

        $('#txttelefone').mask(SPMaskBehavior2, spOptions);
        });
       

        $('#txtcelular').mask(SPMaskBehavior, spOptions);
        });
  
        function verificar() {

           var usuario, email, senha, nome, cpf2, endereco, numero, estado, cidade, bairro, telefone, celular ;

           usuario = document.cadastro.txtusuario.value ;

           if ( usuario.length == 0 ) {

              alert("Preencha o campo usuário") ;
              document.cadastro.txtusuario.focus() ;
              return false ;
           }


           if ( usuario.length > 20 ) {

              alert("O Campo usuário pode ter no máximo 20 caracteres") ;
              document.cadastro.txtusuario.focus() ;
              return false ;
           }

           if ( usuario == "null" ) {

              alert("Você não pode usar null como usuário") ;
              document.cadastro.txtusuario.focus() ;
              return false ;
           }

           email = document.cadastro.txtemail.value ;

           if ( email.length == 0 ) {

              alert("Preencha o campo E-mail") ;
              document.cadastro.txtemail.focus() ;
              return false ;
           }

           senha = document.cadastro.txtsenha.value ;

           if ( senha.length <= 5 ) {

              alert("A senha deve ter no mínimo 6 caracteres") ;
              document.cadastro.txtsenha.focus() ;
              return false ;
           }

           nome = document.cadastro.txtnome.value ;

           if ( nome.length == 0 ) {

              alert("Preencha o campo Nome Completo") ;
              document.cadastro.txtnome.focus() ;
              return false ;
           }

           if ( nome.length > 70 ) {

              alert("O Campo nome pode ter no máximo 70 caracteres") ;
              document.cadastro.txtnome.focus() ;
              return false ;
           }

           cpf2 = document.cadastro.strCPF.value ;

           if ( strCPF.length <= 0 ) {

              alert("Preencha o campo CPF") ;
              document.cadastro.strCPF.focus() ;
              return false ;
           }

           cep = document.cadastro.cep.value ;

           if ( cep.length == 0 ) {

              alert("Preencha o campo CEP") ;
              document.cadastro.cep.focus() ;
              return false ;
           }

           endereco = document.cadastro.endereco.value ;

           if ( endereco.length == 0 ) {

              alert("Preencha o campo Endereço") ;
              document.cadastro.txtendereco.focus() ;
              return false ;
           }

           numero = document.cadastro.txtnumero.value ;

           if ( numero.length == 0 ) {

              alert("Preencha o campo Nº") ;
              document.cadastro.txtnumero.focus() ;
              return false ;
           }

           estado = document.cadastro.estados.value ;

           if ( estado.length == 0 ) {

              alert("Preencha o campo Estado") ;
              document.cadastro.estados.focus() ;
              return false ;
           }

           cidade = document.cadastro.cidades.value ;

           if ( cidade.length == 0 ) {

              alert("Preencha o campo Cidade") ;
              document.cadastro.cidades.focus() ;
              return false ;
           }

           bairro = document.cadastro.txtbairro.value ;

           if ( bairro.length == 0 ) {

              alert("Preencha o campo Bairro") ;
              document.cadastro.txtbairro.focus() ;
              return false ;
           }

           telefone = document.cadastro.txttelefone.value ;

           if ( telefone.length == 0 ) {

              alert("Preencha o campo Telefone") ;
              document.cadastro.txttelefone.focus() ;
              return false ;
           }
                  
           celular = document.cadastro.txtcelular.value ;

             if ( celular.length == 0 ) {

                alert("Preencha o campo Celular") ;
                document.cadastro.txtcelular.focus() ;
                return false ;
             }

             cpf = document.cadastro.strCPF.value;
            cpf = cpf.replace(/[^\d]+/g, '');
            if (cpf == '') {
             alert("CPF inválido");
             return false;
           }
            // Elimina CPFs invalidos conhecidos    
            if (cpf.length != 11 ||
              cpf == "00000000000" ||
              cpf == "11111111111" ||
              cpf == "22222222222" ||
              cpf == "33333333333" ||
              cpf == "44444444444" ||
              cpf == "55555555555" ||
              cpf == "66666666666" ||
              cpf == "77777777777" ||
              cpf == "88888888888" ||
              cpf == "99999999999") {
              alert("CPF inválido");
              return false;
            }
            // Valida 1o digito 
            add = 0;
            for (i = 0; i < 9; i++)
              add += parseInt(cpf.charAt(i)) * (10 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
              rev = 0;
            if (rev != parseInt(cpf.charAt(9))) {
              alert("CPF inválido");
              return false;
            }
            // Valida 2o digito 
            add = 0;
            for (i = 0; i < 10; i++)
              add += parseInt(cpf.charAt(i)) * (11 - i);
            rev = 11 - (add % 11);
            if (rev == 10 || rev == 11)
              rev = 0;
            if (rev != parseInt(cpf.charAt(10)))
              alert("CPF Inválido");
              document.getElementById('cadastro').submit();
             
          }

     </script>

</head>
<body>
    <div class="geral">
    <!--Topo-->
    <div class="fundo">
    <img class="imgtopo" src="Imagens/logo1.png" width="80px" height="60px">
    <div class="menu">
            <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="portfolio.jsp">Portfólio</a></li>
            <li><a href="contato.jsp">Contato</a></li>
            </ul>
        </div>
    </div>

    <!--Formulario de dados do cliente-->
          <%
        
                String nome = (String)session.getAttribute("nome");
                if (nome != null)

                {
            
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Você já está logado!');");
               out.println("location='index.jsp';");
               out.println("</script>");
                    
                }
          %>

    <script>

        function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('endereco').value=("");
            document.getElementById('bairro').value=("");
            document.getElementById('cidades').value=("");
            document.getElementById('estados').value=("");
        }

        function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('endereco').value=(conteudo.logradouro);
            document.getElementById('bairro').value=(conteudo.bairro);
            document.getElementById('cidades').value=(conteudo.localidade);
            document.getElementById('estados').value=(conteudo.uf);
            document.cadastro.numero.focus() ;
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
            return false;
        }
    }



        function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('endereco').value="...";
                document.getElementById('bairro').value="...";
                document.getElementById('cidades').value="...";
                document.getElementById('estados').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
                return false;
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };
</script>



    <div class="container">
        <form name="cadastro" id="cadastro" action="grava.jsp" method="POST">
            <fieldset>
                <legend>Dados do Cliente</legend>

                    <span>
                        <label for="usuario">Usuário:</label>
                        <input class="usuario" type="text" name="txtusuario" id="usuario" placeholder="Digite seu usuário de login:">
                    </span>

                    <span>
                        <label for="email">Email:</label> 
                        <input class="email" type="email" name="txtemail" id="email" placeholder="Digite seu email:">
                    </span><br>

                    <span>
                        <label for="senha">Senha:</label>
                        <input class="senha" type="password" name="txtsenha" id="senha" placeholder="De 6-16 caracteres">
                    </span>

                <span>
                <label for="nome">Nome Completo:</label>
                <input class="nome" type="text" name="txtnome" id="nome" placeholder="Digite seu nome:" >
                </span>

                <span>
                    <label for="cpf">CPF:</label>
                    <input class="cpf" type="text" maxlength="15" name="strCPF" id="strCPF" placeholder="Ex: xxxxxxxxxxx">
                </span>

                <span>
                    <label for="cep">CEP:</label>
                    <input class="cep" type="text" maxlength="15" name="cep" id="cep" onblur="pesquisacep(this.value);" placeholder="Ex: xxxxxxxxxxx">
                </span>

                <span>
                    <label for="endereco">Endereço:</label>
                    <input class="endereco" type="text" name="txtendereco" id="endereco" placeholder="Ex: Rua, Avenida ...">
                </span>

                <span>
                    <label for="numero">Nº:</label>
                    <input class="numero" type="text" name="txtnumero" id="numero" placeholder="Ex:00">
                </span><br/>

                <span>
                    <label for="comp">Complemento:</label>
                    <input class="comp" type="text" name="txtcomplemento" id="comp" placeholder="Ex: Casa 2, APT 23">
                </span> 

                <span>
                    <label for="estados">Estado: </label>
                    <input class="comp" type="text" name="estados" id="estados">
                </span>
                &nbsp;&nbsp;
                <span>
                    <label for="cidades">Cidade: </label>
                    <input class="comp" type="text" name="cidades" id="cidades">
                </span><br>

                <span>
                    <label for="bairro">Bairro:</label>
                    <input class="bairro" type="text" name="txtbairro" id="bairro">
                </span> 

                <span>
                    <label for="telefone">Telefone:</label>
                    <input class="tel" type="text" name="txttelefone" id="txttelefone" placeholder="Ex: (xx) - xxxx-xxxx">
                </span>

                <span>
                    <label for="celular">Celular:</label>
                    <input class="celular" type="text" name="txtcelular" id="txtcelular" placeholder="Ex:(xx) - xxxxx-xxxx">
                </span><br>

                <input type="button" class="submit" value="Criar conta" onClick="verificar();">
                <input type="button" class="submitlimpar" value="Limpar" onClick="limpar()">

            </fieldset>
        </form>
    </div>
        
        </div> 
        <!--Rodapé-->
        <div class="rodape"></div>
    </div>
    
</body>
</html>