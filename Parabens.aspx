<%@ Page Language="C#" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    if (Session["protocolo"] == null)
        Response.Redirect("Default.aspx");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>AVANÇO - CENTRO UNIVERSITÁRIO</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <link href="css/cadastro.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="principal">
            <div id="cabecalho">
                <center><a href="Default.aspx"><img src="imagens/logoavanco.png" width="500" height="161" border="0" alt="Logotipo Avanço" /></a></center>
                <div id="menu">
                    <a href="Default.aspx">Início</a>
                </div>
            </div>

            <div id="conteudo">
                <div id="esquerda">
                    <h2>Acesso Restrito</h2>
                    <form action="Default.aspx" name="login" onsubmit="return Acessar();" method="post">
                        <div>
                            <label>
                                R.A
                                <input type="text" name="ra" maxlength="10" />
                            </label>
                            <label>
                                Senha
                                <input type="password" name="senha" />
                            </label>
                            <div class="clr"></div>
                            <input type="submit" name="submit" value="Entrar" class="botao" />
                        </div>
                    </form>
                </div>

                <div id="direita">
                    <center><h1>Parabéns</h1></center>
                    <br />
                    <h2>Sua inscrição foi confirmada com sucesso!!!</h2>
                    <br /><br />
                    <strong>Não esqueça no dia da prova de levar:</strong><br /><br />
                    <ul style="list-style-image: url(icones/001_60.png);" id="necessarios">
                        <li>Comprovante de inscrição</li>
                        <li>Documento de identidade com foto</li>
                        <li>Caneta(preta ou azul)</li>
                        <li>Lápis</li>
                        <li>Borracha</li>
                    </ul>
                    <br />
                </div>
                <div class="clr"></div>
            </div>

            <div id="rodape">
                Mais informações ligue: 0800-999-9999<br />
                Av. Joaquim Constantino, nº 3756 - Rod. Raposo Tavares km 570 - Presidente Prudente - SP 
            </div>
        </div>
        <script type="text/javascript">
            function Acessar() {
                if (document.login.ra.value == "") {
                    alert("Preencha o campo R.A.");
                    document.login.ra.focus();
                    return false;
                }

                if (document.login.senha.value == "") {
                    alert("Preencha o campo Senha");
                    document.login.senha.focus();
                    return false;
                }

                if (document.login.senha.value != "" && document.login.senha.value != "") {
                    alert("Bem Vindo Aluno!");
                    return false;
                }
            }
        </script>
    </body>
</html>
