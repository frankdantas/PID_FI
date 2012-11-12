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
                    <center><h1>Dados da Inscrição</h1></center>

                    <strong>Aluno</strong><br />
                    <% Response.Write(Session["nome"].ToString());%>
                    
                    <br /><br />

                    <table cellpadding="5" cellspacing="0" width="100%">
                        <tr>
                            <td width="50%"><strong>Protocolo</strong></td>
                            <td><strong>Data de Inscrição</strong></td>
                        </tr>
                        <tr>
                            <td><% Response.Write(Session["protocolo"].ToString());%></td>
                            <td><% Response.Write(Session["dt_inscricao"].ToString());%></td>
                        </tr>
                        <tr>
                            <td><br /></td>
                            <td> </td>
                        </tr>
                        <tr>
                            <td><strong>Curso 1ª Opção</strong></td>
                            <td><strong>Curso 2ª Opção</strong></td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    switch (Convert.ToInt32(Session["op1"].ToString()))
                                    {
                                        case 1:
                                            Response.Write("Contabilidade");
                                            break;
                                        case 2:
                                            Response.Write("Administração");
                                            break;
                                        case 3:
                                            Response.Write("Ciência da Computação");
                                            break;
                                        case 4:
                                            Response.Write("Sistemas de Informação");
                                            break;                                            
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    switch (Convert.ToInt32(Session["op2"].ToString()))
                                    {
                                        case 1:
                                            Response.Write("Contabilidade");
                                            break;
                                        case 2:
                                            Response.Write("Administração");
                                            break;
                                        case 3:
                                            Response.Write("Ciência da Computação");
                                            break;
                                        case 4:
                                            Response.Write("Sistemas de Informação");
                                            break;                                            
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td><br /></td>
                            <td> </td>
                        </tr>
                        <tr>
                            <td valign="bottom"><a href="Default.aspx" class="botao">&laquo; Voltar e Alterar os dados</a></td>
                            <td>
                                <a href="Parabens.aspx" class="botao">&raquo; Confirmar</a>
                            </td>
                        </tr>
                    </table>
                    <br /><br /><br />
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
