﻿/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/Curso/cadCurso.aspx.cs
 * Cadastro de curso
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

public partial class App_Page_Sistema_Utilidade_StatusMorador_cadStatusMorador : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_CURSO);

        // parâmetros sql
        base.setSqlDefault("CURSO");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("curso");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_CURSO", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtDesc, "CHR_DESC_CURSO", FieldType.TextBox, SQLType.Charactere, "Curso", true, true, false));

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
