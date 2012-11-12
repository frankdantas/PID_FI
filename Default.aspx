<%@ Page Language="C#" Debug="true" %>

<script type="text/C#" runat="server">
    static string Protocolo()
    {
        string ano = DateTime.Now.ToString("yyyyMMddHHmmss");
        int[] pesos = { 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
        int soma = 0, protocolo, resto;

        for (int i = 0; i < pesos.Length; i++)
            soma += Convert.ToInt32(ano[i].ToString()) * pesos[i];

        protocolo = soma % 11;
        resto = 11 - protocolo;

        if (protocolo < 2)
            resto = 0;

        return ano + " - " + resto;
    }

    static bool ValidaData(string Data)
    {
        string[] data = Data.Split('/');
        int dia, mes, ano;

        if (int.TryParse(data[0], out dia) && int.TryParse(data[1], out mes) && int.TryParse(data[2], out ano))
        {
            if (Convert.ToInt32(data[0]) > 0 && Convert.ToInt32(data[1]) > 0 && Convert.ToInt32(data[2]) > 0 && Convert.ToInt32(data[0]) <= 31 && Convert.ToInt32(data[1]) <= 12)
            {
                switch (mes)
                {
                    case 1:
                    case 3:
                    case 5:
                    case 7:
                    case 8:
                    case 10:
                    case 12:
                        if (dia > 31)
                            return false;
                        else
                            return true;
                    case 4:
                    case 6:
                    case 9:
                    case 11:
                        if (dia > 30)
                            return false;
                        else
                            return true;
                    case 2:
                        if (ano % 4 == 0 && ano % 100 != 0 && ano % 400 != 0)
                        {
                            if (dia <= 29)
                                return true;
                            else
                                return false;
                        }
                        else
                        {
                            if (dia > 28)
                                return false;
                            else
                                return true;
                        }
                }
            }
            else
                return false;
        }
        return false;
    }

    static string RetiraAcentos(string Texto)
    {
        string Acentos =    "ÄÅÁÂÀÃÉÊËÈÍÎÏÌÖÓÔÒÕÜÚÛÇÝÑäåáâàãéêëèíîïìöóôòõüúûçýÿñ";
        string SemAcentos = "AAAAAAEEEEIIIIOOOOOUUUCYNaaaaaaeeeeiiiiooooouuucyyn";

        for (int i = 0; i < Texto.Length; i++)
        {
            for (int pos = 0; pos < Acentos.Length; pos++)
            {
                Texto = Texto.Replace(Acentos[pos].ToString(), SemAcentos[pos].ToString());
            }
        }

        return Texto;
    }

    static bool ValidaCEM(int Ano)
    {
        if ((Ano >= 1900) && (Ano <= DateTime.Now.Year - 10))
            return true;
        else
            return false;
    }

    static bool ValidaCPF(string vrCPF)
    {
        string valor = vrCPF.Replace(".", "");

        valor = valor.Replace("-", "");

        if (valor.Length != 11)
            return false;

        bool igual = true;

        for (int i = 1; i < 11 && igual; i++)
            if (valor[i] != valor[0])
                igual = false;

        if (igual || valor == "12345678909")
            return false;

        int[] numeros = new int[11];

        for (int i = 0; i < 11; i++)
            numeros[i] = int.Parse(
                valor[i].ToString()
            );

        int soma = 0;

        for (int i = 0; i < 9; i++)
            soma += (10 - i) * numeros[i];

        int resultado = soma % 11;

        if (resultado == 1 || resultado == 0)
        {
            if (numeros[9] != 0)
                return false;
        }

        else if (numeros[9] != 11 - resultado)
            return false;

        soma = 0;

        for (int i = 0; i < 10; i++)
            soma += (11 - i) * numeros[i];

        resultado = soma % 11;

        if (resultado == 1 || resultado == 0)
        {
            if (numeros[10] != 0)
                return false;
        }
        else
            if (numeros[10] != 11 - resultado)
                return false;

        return true;

    }

    static bool ValidaEmail(string Email)
    {
        Regex rg = new Regex(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$");

        if (rg.IsMatch(Email))
            return true;
        else
            return false;
    }

    static bool ValidaEstado(string Estado)
    {
        string[] UF = { "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO" };

        for (int i = 0; i < 27; i++)
		{
			if (Estado == UF[i])
                return true;
		}

        return false;
    }

    static bool ValidaTel(string Numero)
    {
        Numero = Numero.Replace("(", "");
        Numero = Numero.Replace(")", "");
        Numero = Numero.Replace("-", "");
        Numero = Numero.Replace(" ", "");

        if (Numero.Length == 10)
        {
            int Num;

            if (int.TryParse(Numero, out Num))
                return true;
            else
                return false;
        }
        else
            return false;
    }

    static bool ValidaCEP(string Numero)
    {
        Numero = Numero.Replace("-", "");

        if (Numero.Length == 8)
        {
            int Num;

            if (int.TryParse(Numero, out Num))
                return true;
            else
                return false;
        }
        else
            return false;
    }

    static bool ValidaOpcao(string Opcao)
    {
        int Num;

        if (Opcao.Length == 1)
        {
            if (int.TryParse(Opcao, out Num))
            {
                switch (Num)
                {
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        return true;
                    default:
                        return false;
                }
            }
            else
                return false;
        }
        else
            return false;
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
    string Msg = "";

    if (!string.IsNullOrEmpty(Request.Form["submit"]))
    {
        if (Request.Form["submit"] == "Cadastrar")
        {
            //Nome
            if (!string.IsNullOrEmpty(Request.Form["nome"]))
                Session.Add("nome", Request.Form["nome"]);
            else
            {
                Msg += "Preencha o Campo Nome<br />";
                Session.Remove("nome");
            }

            //E-Mail
            if (!string.IsNullOrEmpty(Request.Form["email"]))
                if (ValidaEmail(Request.Form["email"]))
                    Session.Add("email", Request.Form["email"]);
                else
                {
                    Msg += "Preencha o Campo E-mail corertamente.<br />";
                    Session.Remove("email");
                }
            else
            {
                Msg += "Preencha o Campo E-mail<br />";
                Session.Remove("email");
            }
            
            //Nascimento
            if (!string.IsNullOrEmpty(Request.Form["dt_nascimento"]))
                if (ValidaData(Request.Form["dt_nascimento"]))
                    Session.Add("dt_nascimento", Request.Form["dt_nascimento"]);
                else
                {
                    Msg += "Preencha o Campo Data de Nascimento corretamente.<br />";
                    Session.Remove("dt_nascimento");
                }
            else
            {
                Msg += "Preencha o Campo Nascimento<br />";
                Session.Remove("dt_nascimento");
            }
            
            //CPF
            if (!string.IsNullOrEmpty(Request.Form["cpf"]))
                if (ValidaCPF(Request.Form["cpf"]))
                    Session.Add("cpf", Request.Form["cpf"]);
                else
                {
                    Msg += "Preencha o Campo CPF corretamente.<br />";
                    Session.Remove("cpf");
                }
            else
            {
                Msg += "Preencha o Campo CPF<br />";
                Session.Remove("cpf");
            }

            //RG
            if (!string.IsNullOrEmpty(Request.Form["rg"]))
                Session.Add("rg", Request.Form["rg"]);
            else
            {
                Msg += "Preencha o Campo RG<br />";
                Session.Remove("rg");
            }

            //Órgão Emissor
            if (!string.IsNullOrEmpty(Request.Form["orgaoemissor"]))
                Session.Add("orgaoemissor", Request.Form["orgaoemissor"].ToUpper());
            else
            {
                Msg += "Preencha o Campo Órgão Emissor<br />";
                Session.Remove("orgaoemissor");
            }

            //Telefone
            if (!string.IsNullOrEmpty(Request.Form["tel"]))
                if (ValidaTel(Request.Form["tel"]))
                    Session.Add("tel", Request.Form["tel"]);
                else
                {
                    Msg += "Preencha o Campo Telefone corretamente.<br />";
                    Session.Remove("tel");
                }
            else
            {
                Msg += "Preencha o Campo Tel<br />";
                Session.Remove("tel");
            }

            //Celular
            if (!string.IsNullOrEmpty(Request.Form["cel"]))
                if (ValidaTel(Request.Form["cel"]))
                    Session.Add("cel", Request.Form["cel"]);
                else
                {
                    Msg += "Preencha o Campo Celular corretamente.<br />";
                    Session.Remove("cel");
                }
            else
            {
                Msg += "Preencha o Campo Celular<br />";
                Session.Remove("cel");
            }

            //CEP
            if (!string.IsNullOrEmpty(Request.Form["cep"]))
                if (ValidaCEP(Request.Form["cep"]))
                    Session.Add("cep", Request.Form["cep"]);
                else
                {
                    Msg += "Preencha o Campo CEP corretamente.<br />";
                    Session.Remove("cep");
                }
            else
            {
                Msg += "Preencha o Campo CEP<br />";
                Session.Remove("cep");
            }

            //Endereço
            if (!string.IsNullOrEmpty(Request.Form["endereco"]))
                Session.Add("endereco", Request.Form["endereco"]);
            else
            {
                Msg += "Preencha o Campo Endereço<br />";
                Session.Remove("endereco");
            }

            //Número
            if (!string.IsNullOrEmpty(Request.Form["numero"]))
            {
                if (Request.Form["numero"].Length < 11)
                {
                    int Num;

                    if (int.TryParse(Request.Form["numero"], out Num))
                        Session.Add("numero", Request.Form["numero"]);
                    else
                    {
                        Msg += "Preencha o Campo Número corretamente.<br />";
                        Session.Remove("numero");
                    }
                }
                else
                {
                    Msg += "Preencha o Campo Número corretamente.<br />";
                    Session.Remove("numero");
                }
            }
            else
            {
                Msg += "Preencha o Campo Número<br />";
                Session.Remove("numero");
            }

            //Bairro
            if (!string.IsNullOrEmpty(Request.Form["bairro"]))
                Session.Add("bairro", Request.Form["bairro"]);
            else
            {
                Msg += "Preencha o Campo Bairro<br />";
                Session.Remove("bairro");
            }
            
            //Cidade
            if (!string.IsNullOrEmpty(Request.Form["cidade"]))
                Session.Add("cidade", Request.Form["cidade"]);
            else
            {
                Msg += "Preencha o Campo Cidade<br />";
                Session.Remove("cidade");
            }

            //Estado
            if (!string.IsNullOrEmpty(Request.Form["estado"]))
                if (ValidaEstado(Request.Form["estado"].ToUpper()))
                    Session.Add("estado", Request.Form["estado"].ToUpper());
                else
                {
                    Msg += "Este estado não existe.<br />";
                    Session.Remove("estado");
                }
            else
            {
                Msg += "Preencha o Campo Estado<br />";
                Session.Remove("estado");
            }

            //Ano de Conclusão de Ensino Médio
            if (!string.IsNullOrEmpty(Request.Form["acem"]))
            {
                if (Request.Form["acem"].Length == 4)
                {
                    int Num;

                    if (int.TryParse(Request.Form["acem"], out Num))
                    {
                        if (ValidaCEM(Num))
                            Session.Add("acem", Request.Form["acem"]);
                        else
                        {
                            Msg += "Preencha o Campo Ano de Conclusão do Ensino Médio corretamente.<br />";
                            Session.Remove("acem");
                        }
                    }
                    else
                    {
                        Msg += "Preencha o Campo Ano de Conclusão do Ensino Médio corretamente.<br />";
                        Session.Remove("acem");
                    }
                }
                else
                {
                    Msg += "Preencha o Campo Ano de Conclusão do Ensino Médio corretamente.<br />";
                    Session.Remove("acem");
                }
            }
            else
            {
                Msg += "Preencha o Campo acem<br />";
                Session.Remove("acem");
            }

            //Opções de curso
            if (!string.IsNullOrEmpty(Request.Form["op1"]) && !string.IsNullOrEmpty(Request.Form["op2"]))
                if (ValidaOpcao(Request.Form["op1"]) && ValidaOpcao(Request.Form["op2"]))
                {
                    if (Request.Form["op1"] != Request.Form["op2"])
                    {
                        Session.Add("op1", Request.Form["op1"]);
                        Session.Add("op2", Request.Form["op2"]);
                    }
                    else
                    {
                        Msg += "Preencha as opções de curso corretamente.<br />";
                        Session.Remove("op1");
                        Session.Remove("op2");
                    }
                }
                else
                {
                    Msg += "Preencha as opções de curso corretamente.<br />";
                    Session.Remove("op1");
                    Session.Remove("op2");
                }
            else
            {
                Msg += "Preencha as opções de curso corretamente.<br />";
                Session.Remove("op1");
                Session.Remove("op2");
            }

            if (Msg == "")
            {
                if (Session["protocolo"] == null)
                    Session.Add("protocolo", Protocolo());
                
                if (Session["dt_inscricao"] == null)
                    Session.Add("dt_inscricao", DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));

                Response.Redirect("Protocolo.aspx");
            }
        }
    }
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
                    <center><h1>Inscrição</h1></center>

                    <h2>Dados Pessoais</h2>

                    <%
                        //se tiver erros ou mensagens
                        if (Msg != "")
                        {
                    %>
                    <div id="mensagem">
                        <%
                            Response.Write(Msg);
                        %>
                    </div>
                    <%        
                        }
                    %>

                    <form name="dados" action="Default.aspx" onsubmit="return ValidarDados();" method="post">
                        <div>
                            <label id="Nome">
                                Nome
                                <input type="text" name="nome" value="<% if(Session["nome"] != null) Response.Write(Session["nome"].ToString()); %>" />
                            </label>
                            <label id="Email">
                                E-mail
                                <input type="text" name="email" value="<% if(Session["email"] != null) Response.Write(Session["email"].ToString()); %>" />
                            </label>
                            <label id="Dt_Nascimento">
                                Data de Nascimento
                                <input type="text" name="dt_nascimento" value="<% if(Session["dt_nascimento"] != null) Response.Write(Session["dt_nascimento"].ToString()); %>" />
                            </label>
                            <label id="CPF">
                                CPF
                                <input type="text" name="cpf" value="<% if(Session["cpf"] != null) Response.Write(Session["cpf"].ToString()); %>" />
                            </label>
                            <label id="RG">
                                RG
                                <input type="text" name="rg" value="<% if(Session["rg"] != null) Response.Write(Session["rg"].ToString()); %>" />
                            </label>
                            <label id="OrgaoEmissor">
                                Órgão Emissor
                                <input type="text" name="orgaoemissor" value="<% if(Session["orgaoemissor"] != null) Response.Write(Session["orgaoemissor"].ToString()); %>" />
                            </label>
                            <label id="Tel">
                                Telefone
                                <input type="text" name="tel" value="<% if(Session["tel"] != null) Response.Write(Session["tel"].ToString()); %>" />
                            </label>
                            <label id="Cel">
                                Celular
                                <input type="text" name="cel" value="<% if(Session["cel"] != null) Response.Write(Session["cel"].ToString()); %>" />
                            </label>
                            <label id="CEP">
                                CEP
                                <input type="text" name="cep" value="<% if(Session["cep"] != null) Response.Write(Session["cep"].ToString()); %>" />
                            </label>
                            <label id="Endereco">
                                Endereço
                                <input type="text" name="endereco" value="<% if(Session["endereco"] != null) Response.Write(Session["endereco"].ToString()); %>" />
                            </label>
                            <label id="Numero">
                                Numero
                                <input type="text" name="numero" value="<% if(Session["numero"] != null) Response.Write(Session["numero"].ToString()); %>" />
                            </label>
                            <label id="Bairro">
                                Bairro
                                <input type="text" name="bairro" value="<% if(Session["bairro"] != null) Response.Write(Session["bairro"].ToString()); %>" />
                            </label>
                            <label id="Cidade">
                                Cidade
                                <input type="text" name="cidade" value="<% if(Session["cidade"] != null) Response.Write(Session["cidade"].ToString()); %>" />
                            </label>
                            <label id="Estado">
                                Estado
                                <select name="estado">
                                    <option value="AC" <% if(Session["estado"] != null && Session["estado"].ToString() == "AC") Response.Write("selected"); %>>
                                        AC</option>
                                    <option value="AL" <% if(Session["estado"] != null && Session["estado"].ToString() == "AL") Response.Write("selected"); %>>
                                        AL</option>
                                    <option value="AP" <% if(Session["estado"] != null && Session["estado"].ToString() == "AP") Response.Write("selected"); %>>
                                        AP</option>
                                    <option value="AM" <% if(Session["estado"] != null && Session["estado"].ToString() == "AM") Response.Write("selected"); %>>
                                        AM</option>
                                    <option value="BA" <% if(Session["estado"] != null && Session["estado"].ToString() == "BA") Response.Write("selected"); %>>
                                        BA</option>
                                    <option value="CE" <% if(Session["estado"] != null && Session["estado"].ToString() == "CE") Response.Write("selected"); %>>
                                        CE</option>
                                    <option value="DF" <% if(Session["estado"] != null && Session["estado"].ToString() == "DF") Response.Write("selected"); %>>
                                        DF</option>
                                    <option value="ES" <% if(Session["estado"] != null && Session["estado"].ToString() == "ES") Response.Write("selected"); %>>
                                        ES</option>
                                    <option value="GO" <% if(Session["estado"] != null && Session["estado"].ToString() == "GO") Response.Write("selected"); %>>
                                        GO</option>
                                    <option value="MA" <% if(Session["estado"] != null && Session["estado"].ToString() == "MA") Response.Write("selected"); %>>
                                        MA</option>
                                    <option value="MT" <% if(Session["estado"] != null && Session["estado"].ToString() == "MT") Response.Write("selected"); %>>
                                        MT</option>
                                    <option value="MS" <% if(Session["estado"] != null && Session["estado"].ToString() == "MS") Response.Write("selected"); %>>
                                        MS</option>
                                    <option value="MG" <% if(Session["estado"] != null && Session["estado"].ToString() == "MG") Response.Write("selected"); %>>
                                        MG</option>
                                    <option value="PA" <% if(Session["estado"] != null && Session["estado"].ToString() == "PA") Response.Write("selected"); %>>
                                        PA</option>
                                    <option value="PB" <% if(Session["estado"] != null && Session["estado"].ToString() == "PB") Response.Write("selected"); %>>
                                        PB</option>
                                    <option value="PR" <% if(Session["estado"] != null && Session["estado"].ToString() == "PR") Response.Write("selected"); %>>
                                        PR</option>
                                    <option value="PE" <% if(Session["estado"] != null && Session["estado"].ToString() == "PE") Response.Write("selected"); %>>
                                        PE</option>
                                    <option value="PI" <% if(Session["estado"] != null && Session["estado"].ToString() == "PI") Response.Write("selected"); %>>
                                        PI</option>
                                    <option value="RR" <% if(Session["estado"] != null && Session["estado"].ToString() == "RR") Response.Write("selected"); %>>
                                        RR</option>
                                    <option value="RO" <% if(Session["estado"] != null && Session["estado"].ToString() == "RO") Response.Write("selected"); %>>
                                        RO</option>
                                    <option value="RJ" <% if(Session["estado"] != null && Session["estado"].ToString() == "RJ") Response.Write("selected"); %>>
                                        RJ</option>
                                    <option value="RN" <% if(Session["estado"] != null && Session["estado"].ToString() == "RN") Response.Write("selected"); %>>
                                        RN</option>
                                    <option value="RS" <% if(Session["estado"] != null && Session["estado"].ToString() == "RS") Response.Write("selected"); %>>
                                        RS</option>
                                    <option value="SC" <% if(Session["estado"] != null && Session["estado"].ToString() == "SC") Response.Write("selected"); %>>
                                        SC</option>
                                    <option value="SP" <% if(Session["estado"] != null && Session["estado"].ToString() == "SP") Response.Write("selected"); %>>
                                        SP</option>
                                    <option value="SE" <% if(Session["estado"] != null && Session["estado"].ToString() == "SE") Response.Write("selected"); %>>
                                        SE</option>
                                    <option value="TO" <% if(Session["estado"] != null && Session["estado"].ToString() == "TO") Response.Write("selected"); %>>
                                        TO</option>
                                </select>
                            </label>
                            <div class="clr"></div>

                            <h2>Sobre o Curso</h2>

                            <label id="ACEM">
                                Ano de Conclusão do<br />Ensino Médio
                                <input type="text" name="acem" value="<% if(Session["acem"] != null) Response.Write(Session["acem"].ToString()); %>" />
                            </label>
                            <label id="Op1">
                                <br />
                                Curso 1ª Opção
                                <select name="op1">
                                    <option value="1" <%if(Session["op1"] != null && Session["op1"].ToString() == "1") Response.Write("selected"); %>>
                                        Contabilidade</option>
                                    <option value="2" <%if(Session["op1"] != null && Session["op1"].ToString() == "2") Response.Write("selected"); %>>
                                        Administração</option>
                                    <option value="3" <%if(Session["op1"] != null && Session["op1"].ToString() == "3") Response.Write("selected"); %>>
                                        Ciência da Computação</option>
                                    <option value="4" <%if(Session["op1"] != null && Session["op1"].ToString() == "4") Response.Write("selected"); %>>
                                        Sistemas de Informação</option>
                                </select>
                            </label>
                            <label id="Op2">
                                <br />
                                Curso 2ª Opção
                                <select name="op2">
                                    <option value="1" <%if(Session["op2"] != null && Session["op2"].ToString() == "1") Response.Write("selected"); %>>
                                        Contabilidade</option>
                                    <option value="2" <%if(Session["op2"] != null && Session["op2"].ToString() == "2") Response.Write("selected"); %>>
                                        Administração</option>
                                    <option value="3" <%if(Session["op2"] != null && Session["op2"].ToString() == "3") Response.Write("selected"); %>>
                                        Ciência da Computação</option>
                                    <option value="4" <%if(Session["op2"] != null && Session["op2"].ToString() == "4") Response.Write("selected"); %>>
                                        Sistemas de Informação</option>
                                </select>
                            </label>
                            <div class="clr"></div>
                            <br />
                            <input type="submit" name="submit" value="Cadastrar" class="botao" />
                            <br /><br />
                        </div>
                    </form>
                </div>
                <div class="clr"></div>
            </div>

            <div id="rodape">
                Mais informações ligue: 0800-999-9999<br />
                Av. Joaquim Constantino, nº 3756 - Rod. Raposo Tavares km 570 - Presidente Prudente - SP 
            </div>
        </div>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/jquery.maskedinput-1.2.2.js" type="text/javascript"></script>
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

            function ValidarDados() {
                if (document.dados.nome.value == "") {
                    alert("Preencha o campo Nome");
                    document.dados.nome.focus();
                    return false;
                }

                if (document.dados.email.value == "") {
                    alert("Preencha o campo E-mail");
                    document.dados.email.focus();
                    return false;
                }

                if (document.dados.dt_nascimento.value == "") {
                    alert("Preencha o campo Nascimento");
                    document.dados.dt_nascimento.focus();
                    return false;
                }

                if (document.dados.cpf.value == "") {
                    alert("Preencha o campo CPF");
                    document.dados.cpf.focus();
                    return false;
                }

                if (document.dados.rg.value == "") {
                    alert("Preencha o campo RG");
                    document.dados.rg.focus();
                    return false;
                }

                if (document.dados.orgaoemissor.value == "") {
                    alert("Preencha o campo Órgão Emissor");
                    document.dados.orgaoemissor.focus();
                    return false;
                }

                if (document.dados.tel.value == "") {
                    alert("Preencha o campo Telefone");
                    document.dados.tel.focus();
                    return false;
                }

                if (document.dados.cel.value == "") {
                    alert("Preencha o campo Celular");
                    document.dados.cel.focus();
                    return false;
                }

                if (document.dados.cep.value == "") {
                    alert("Preencha o campo CEP");
                    document.dados.cep.focus();
                    return false;
                }

                if (document.dados.endereco.value == "") {
                    alert("Preencha o campo Endereço");
                    document.dados.endereco.focus();
                    return false;
                }

                if (document.dados.numero.value == "") {
                    alert("Preencha o campo Número");
                    document.dados.numero.focus();
                    return false;
                }

                if (document.dados.bairro.value == "") {
                    alert("Preencha o campo Bairro");
                    document.dados.bairro.focus();
                    return false;
                }

                if (document.dados.cidade.value == "") {
                    alert("Preencha o campo Cidade");
                    document.dados.cidade.focus();
                    return false;
                }

                if (document.dados.acem.value == "") {
                    alert("Preencha o campo Ano de Conclusão do Ensino Médio");
                    document.dados.acem.focus();
                    return false;
                }

                if (document.dados.op1.value == document.dados.op2.value) {
                    alert("Escolha opções de cursos diferentes!");
                    document.dados.op2.focus();
                    return false;
                }
                
                return true;
            }

            $(function () {
                $('#CPF input').mask("999.999.999-99");
                $('#Dt_Nascimento input').mask("99/99/9999");
                $('#ACEM input').mask("9999");
                $('#Tel input').mask("(99) 9999-9999");
                $('#Cel input').mask("(99) 9999-9999");
                $('#CEP input').mask("99999-999");
            });
        </script>
    </body>
</html>
