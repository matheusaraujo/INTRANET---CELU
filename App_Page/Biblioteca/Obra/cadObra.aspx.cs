/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/Obra/cadObra.aspx.cs
 * Cadastro de Obra
 * # 2011-02-08
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;
using Celu.Library.WebPage;

public partial class App_Page_Biblioteca_Obra_cadObra : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_OBRA);

        // selects
        base.addSelect(new CSelect(this.slctTipoObra, "EXECUTE LOAD_LIST_TIPO_OBRA", "COD_TIPO_OBRA;CHR_DESC_TIPO_OBRA", 0, false, false));
        base.addSelect(new CSelect(this.slctAutorObra, "EXECUTE LOAD_LIST_AUTOR_OBRA", "COD_AUTOR_OBRA;CHR_NOME_AUTOR_OBRA", 0, false, false));
        base.addSelect(new CSelect(this.slctAssuntoObra, "EXECUTE LOAD_LIST_ASSUNTO_OBRA", "COD_ASSUNTO_OBRA;CHR_DESC_ASSUNTO_OBRA", 0, false, false));


        // parâmetros sql
        base.setSqlDefault("OBRA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("obra");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_OBRA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.slctTipoObra, "COD_TIPO_OBRA", FieldType.SelectBox, SQLType.Numeric, "Tipo de Obra", true, true, false));
        base.addField(new CRegField(this.txtNumChamada, "CHR_CHAMADA", FieldType.TextBox, SQLType.Charactere, "Número de Chamada", true, true, false));
        base.addField(new CRegField(this.txtTitulo, "CHR_TITULO", FieldType.TextBox, SQLType.Charactere, "Título", true, true, false));
        base.addField(new CRegField(this.slctAutorObra, "COD_AUTOR_OBRA", FieldType.SelectBox, SQLType.Numeric, "Autor", true, true, false));
        base.addField(new CRegField(this.txtEdicao, "CHR_EDICAO", FieldType.TextBox, SQLType.Charactere, "Edição", true, false, false));
        base.addField(new CRegField(this.txtPublicacao, "CHR_PUBLICACAO", FieldType.TextBox, SQLType.Charactere, "Publicação", true, false, false));
        base.addField(new CRegField(this.txtNormalizacao, "CHR_NORMALIZACAO", FieldType.TextBox, SQLType.Charactere, "Normalização", true, false, false));
        base.addField(new CRegField(this.slctAssuntoObra, "COD_ASSUNTO_OBRA", FieldType.SelectBox, SQLType.Numeric, "Assunto", true, true, false));
        base.addField(new CRegField(this.txtStatusObra, "CHR_DESC_STATUS_OBRA", FieldType.TextBox, SQLType.Charactere, "Status", false, false, false));


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
