/***************************************************
 * INTRANET CELU
 * App_Page/Diretoria/Morador/cadMorador.aspx.cs
 * Lista de moradores
 * # 2010-12-17
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.WebPage;
using Celu.Library.Security;
using Celu.Library.DataBase;

public partial class App_Page_Diretoria_Morador_cadMorador : Celu.Library.WebPage.CRegPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        this.setPageElements();

        if (!IsPostBack)
        {
            base.loadPage();
        }

    }

    public override void setPageElements()
    {
        // id da página
        base.setIdPage(CSecurity.CADASTRO_MORADOR);

        // select 
        base.addSelect(new CSelect(this.slctPerfil, "EXECUTE LOAD_LIST_PERFIL", "COD_PERFIL;CHR_DESC_PERFIL", 0, false, true));
        base.addSelect(new CSelect(this.slctStatus, "EXECUTE LOAD_LIST_STATUS_MORADOR", "COD_STATUS_MORADOR;CHR_DESC_STATUS_MORADOR", 0, false, false));
        base.addSelect(new CSelect(this.slctQuarto, "EXECUTE LOAD_LIST_QUARTO", "COD_QUARTO;CHR_DESC_QUARTO", 0, false, true));
        base.addSelect(new CSelect(this.slctIes, "EXECUTE LOAD_LIST_IES", "COD_IES;CHR_DESC_IES", 0, false, false));
        base.addSelect(new CSelect(this.slctCurso, "EXECUTE LOAD_LIST_CURSO", "COD_CURSO;CHR_DESC_CURSO", 0, false, false));
        

        // parâmetros sql
        base.setSqlDefault("MORADOR");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("morador");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_MORADOR", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.cbAtivo, "BLN_ATIVO", FieldType.CheckBox, SQLType.Numeric, "Ativo", true, false, false));
        base.addField(new CRegField(this.txtLogin, "CHR_USERNAME", FieldType.TextBox, SQLType.Charactere, "Login", true, true, false));
        base.addField(new CRegField(this.txtNome, "CHR_NOME", FieldType.TextBox, SQLType.Charactere, "Nome", true, true, false));
        base.addField(new CRegField(this.txtApelido, "CHR_APELIDO", FieldType.TextBox, SQLType.Charactere, "Apelido", true, false, false));
        base.addField(new CRegField(this.txtNumLavanderia, "CHR_NUMERO_LAVANDERIA", FieldType.TextBox, SQLType.Charactere, "Número da Lavanderia", true, false, false));
        base.addField(new CRegField(this.slctQuarto, "COD_QUARTO", FieldType.SelectBox, SQLType.Numeric, "Quarto", true, false, false));
        base.addField(new CRegField(this.slctPerfil, "COD_PERFIL", FieldType.SelectBox, SQLType.Numeric, "Perfil", true, false, false));
        base.addField(new CRegField(this.slctStatus, "COD_STATUS_MORADOR", FieldType.SelectBox, SQLType.Numeric, "Status", true, true, false));
        base.addField(new CRegField(this.slctIes, "COD_IES", FieldType.SelectBox, SQLType.Numeric, "Instituição", true, true, false));
        base.addField(new CRegField(this.slctCurso, "COD_CURSO", FieldType.SelectBox, SQLType.Numeric, "Curso", true, true, false));
        base.addField(new CRegField(this.txtCidadeOrigem, "CHR_CIDADE_ORIGEM", FieldType.TextBox, SQLType.Charactere, "Cidade de Origem", false, false, false));
        base.addField(new CRegField(this.txtCelular, "CHR_TELEFONE_CELULAR", FieldType.TextBox, SQLType.Charactere, "Celular", false, false, false));
	    base.addField(new CRegField(this.txtEmail, "CHR_EMAIL", FieldType.TextBox, SQLType.Charactere, "E-mail", false, false, false));
	    base.addField(new CRegField(this.txtEnderecoContato, "CHR_ENDERECO_CONTATO", FieldType.TextBox, SQLType.Charactere, "Endereço de Contato", false, false, false));
	    base.addField(new CRegField(this.txtTelefoneContato, "CHR_TELEFONE_CONTATO", FieldType.TextBox, SQLType.Charactere, "Telefone de Contato", false, false, false));
	    base.addField(new CRegField(this.txtRg, "CHR_RG", FieldType.TextBox, SQLType.Charactere, "RG", false, false, false));
        base.addField(new CRegField(this.txtCpf, "CHR_CPF", FieldType.TextBox, SQLType.Charactere, "CPF", false, false, false));
        base.addField(new CRegField(this.txtAniversario, "CHR_ANIVERSARIO", FieldType.TextBox, SQLType.Charactere, "Aniversário", false, false, false));
        base.addField(new CRegField(this.slctSemestreIngresso, "INT_SEMESTRE_INGRESSO", FieldType.SelectBox, SQLType.Numeric, "Semestre de Ingresso", true, false, false));
        base.addField(new CRegField(this.txtAnoIngresso, "INT_ANO_INGRESSO", FieldType.TextBox, SQLType.Numeric, "Ano de Ingresso", true, false, false));

        // elementos html
        base.setHtmlElements(this.btnEdit, this.btnSave, this.btnDel, this.btnNew, this.tblCadastro);


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        base.saveClick();
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        base.delClick();
    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        try
        {
            
            if (this.txtCodigo.Text.ToString().Equals(String.Empty))
            {
                alert("O cadastro do morador deve ser salvo antes!");
            }
            else
            {
                CDataBase cdb = new CDataBase();

                cdb.execute("EXECUTE RESET_PASSWORD " + this.txtCodigo.Text.ToString());

                alert("Senha resetada com sucesso!");
            }
        }
        catch (Exception ex)
        {
            alert("Erro ao resetar a senha!\n" + ex.Message);
        }
    }
}
