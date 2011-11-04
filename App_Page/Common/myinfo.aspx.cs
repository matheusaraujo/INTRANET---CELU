/***************************************************
 * INTRANET CELU
 * App_Page/Common/myinfo.aspx.cs
 * Página de cadastro das informações pessoais
 * # 2011-02-05
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

public partial class App_Page_Common_myinfo : Celu.Library.WebPage.CRegPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        this.setPageElements();

        if (!IsPostBack)
        {
            base.loadPage(((CLogin)Session["login"]).getCod());
        }

    }

    public override void setPageElements()
    {
        // id da página
        base.setIdPage(CSecurity.GERAL);

        // select         
        base.addSelect(new CSelect(this.slctCidadeOrigem, "EXECUTE LOAD_LIST_CIDADE", "COD_CIDADE;CHR_ESTADO;CHR_CIDADE", 0, false, false));


        // parâmetros sql
        base.setSqlDefault("MORADOR");
        base.setSqlVerifySave("-1");
        base.setSqlSave("EXECUTE INSERT_MORADOR_PESSOAL");
        base.setIdentity(0);

        // id por url
        //base.setIdUrl("morador");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_MORADOR", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));        
        base.addField(new CRegField(this.txtLogin, "CHR_USERNAME", FieldType.TextBox, SQLType.Charactere, "Login", false, false, false));
        base.addField(new CRegField(this.txtNome, "CHR_NOME", FieldType.TextBox, SQLType.Charactere, "Nome", false, false, false));
        base.addField(new CRegField(this.txtApelido, "CHR_APELIDO", FieldType.TextBox, SQLType.Charactere, "Apelido", true, false, false));
        base.addField(new CRegField(this.txtNumLavanderia, "CHR_NUMERO_LAVANDERIA", FieldType.TextBox, SQLType.Charactere, "Número da Lavanderia", false, false, false));
        base.addField(new CRegField(this.txtQuarto, "CHR_DESC_QUARTO", FieldType.TextBox, SQLType.Charactere, "Quarto", false, false, false));
        base.addField(new CRegField(this.txtPerfil, "CHR_DESC_PERFIL", FieldType.TextBox, SQLType.Charactere, "Perfil", false, false, false));
        base.addField(new CRegField(this.txtStatus, "CHR_DESC_STATUS_MORADOR", FieldType.TextBox, SQLType.Charactere, "Status", false, false, false));
        base.addField(new CRegField(this.txtIes, "CHR_DESC_IES", FieldType.TextBox, SQLType.Charactere, "Instituição", false, false, false));
        base.addField(new CRegField(this.txtCurso, "CHR_DESC_CURSO", FieldType.TextBox, SQLType.Charactere, "Curso", false, false, false));
        base.addField(new CRegField(this.slctCidadeOrigem, "COD_CIDADE_ORIGEM", FieldType.SelectBox, SQLType.Numeric, "Cidade de Origem", true, false, false));
        base.addField(new CRegField(this.txtCelular, "CHR_TELEFONE_CELULAR", FieldType.TextBox, SQLType.Charactere, "Celular", true, false, false));
        base.addField(new CRegField(this.txtEmail, "CHR_EMAIL", FieldType.TextBox, SQLType.Charactere, "E-mail", true, false, false));
        base.addField(new CRegField(this.txtEnderecoContato, "CHR_ENDERECO_CONTATO", FieldType.TextBox, SQLType.Charactere, "Endereço de Contato", true, false, false));
        base.addField(new CRegField(this.txtTelefoneContato, "CHR_TELEFONE_CONTATO", FieldType.TextBox, SQLType.Charactere, "Telefone de Contato", true, false, false));
        base.addField(new CRegField(this.txtRg, "CHR_RG", FieldType.TextBox, SQLType.Charactere, "RG", true, false, false));
        base.addField(new CRegField(this.txtCpf, "CHR_CPF", FieldType.TextBox, SQLType.Charactere, "CPF", true, false, false));
        base.addField(new CRegField(this.slctDiaAniversario, "INT_DIA_ANIVERSARIO", FieldType.SelectBox, SQLType.Numeric, "Dia de aniversário", true, true, false));
        base.addField(new CRegField(this.slctMesAniversario, "INT_MES_ANIVERSARIO", FieldType.SelectBox, SQLType.Numeric, "Mês de aniversário", true, true, false));
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
}
