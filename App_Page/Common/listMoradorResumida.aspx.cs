/***************************************************
 * INTRANET CELU
 * App_Page/Common/listMoradorResumida.aspx.cs
 * Lista de moradores resumida
 * # 2011-02-19
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Celu.Library.WebPage;
using Celu.Library.Security;

public partial class App_Page_Common_listMoradorResumida : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.GERAL);
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        if (base.loadPage())
        {
            this.loadPage();
        }
    }

    public override Boolean loadPage()
    {

        List<String> cell = new List<String>();
        List<String> sql = new List<String>();
        String field = String.Empty;

        sql.Add("COD_MORADOR");
        field += "COD_MORADOR;";

        cell.Add("Morador");
        sql.Add("CHR_NOME");
        field += "CHR_NOME;";

        if (this.cbApelido.Checked)
        {
            cell.Add("Apelido");
            sql.Add("CHR_APELIDO");
            field += "CHR_APELIDO;";
        }

        if (this.cbNumLavanderia.Checked)
        {
            cell.Add("Número Lavanderia");
            sql.Add("CHR_NUMERO_LAVANDERIA");
            field += "CHR_NUMERO_LAVANDERIA;";
        }

        if (this.cbPerfil.Checked)
        {
            cell.Add("Perfil");
            sql.Add("(SELECT CHR_DESC_PERFIL FROM TBL_PERFIL WHERE TBL_PERFIL.COD_PERFIL = TBL_MORADOR.COD_PERFIL) AS CHR_DESC_PERFIL");
            field += "CHR_DESC_PERFIL;";
        }

        if (this.cbStatus.Checked)
        {
            cell.Add("Status");
            sql.Add("(SELECT CHR_DESC_STATUS_MORADOR FROM TBL_STATUS_MORADOR WHERE TBL_STATUS_MORADOR.COD_STATUS_MORADOR = TBL_MORADOR.COD_STATUS_MORADOR) AS CHR_DESC_STATUS_MORADOR");
            field += "CHR_DESC_STATUS_MORADOR;";
        }

        if (this.cbIes.Checked)
        {
            cell.Add("Instituição de Ensino");
            sql.Add("(SELECT CHR_DESC_IES FROM TBL_IES WHERE TBL_IES.COD_IES = TBL_MORADOR.COD_IES) AS CHR_DESC_IES");
            field += "CHR_DESC_IES;";
        }

        if (this.cbCurso.Checked)
        {
            cell.Add("Curso");
            sql.Add("(SELECT CHR_DESC_CURSO FROM TBL_CURSO WHERE TBL_CURSO.COD_CURSO = TBL_MORADOR.COD_CURSO) AS CHR_DESC_CURSO");
            field += "CHR_DESC_CURSO;";
        }

        if (this.cbQuarto.Checked)
        {
            cell.Add("Quarto");
            sql.Add("(SELECT CHR_DESC_QUARTO FROM TBL_QUARTO WHERE TBL_QUARTO.COD_QUARTO = TBL_MORADOR.COD_QUARTO) AS CHR_DESC_QUARTO");
            field += "CHR_DESC_QUARTO;";
        }

        if (this.cbCidadeOrigem.Checked)
        {
            cell.Add("Cidade de Origem");
            sql.Add("(SELECT (CHR_CIDADE + ' - ' + CHR_ESTADO) FROM TBL_CIDADE WHERE TBL_CIDADE.COD_CIDADE = TBL_MORADOR.COD_CIDADE_ORIGEM) AS CHR_CIDADE");
            field += "CHR_CIDADE;";
        }

        if (this.cbAniversario.Checked)
        {
            cell.Add("Aniversário");
            sql.Add("(CONVERT(VARCHAR(2), INT_DIA_ANIVERSARIO) + ' de ' + CASE TBL_MORADOR.INT_MES_ANIVERSARIO " +
                "WHEN 1 THEN 'Janeiro' WHEN 2 THEN 'Fevereiro' WHEN 3 THEN 'Março' WHEN 4 THEN 'Abril' WHEN 5 THEN 'Maio' WHEN 6 THEN 'Junho' " +
                "WHEN 7 THEN 'Julho' WHEN 8 THEN 'Agosto' WHEN 9 THEN 'Setembro' WHEN 10 THEN 'Outubro' WHEN 11 THEN 'Novembro' WHEN 12 THEN 'Dezembro' " +
                " ELSE '' END ) AS CHR_ANIVERSARIO");            
            field += "CHR_ANIVERSARIO;";
        }

        if (this.cbIngresso.Checked)
        {
            cell.Add("Ingresso");
            sql.Add("(CONVERT(VARCHAR(2), TBL_MORADOR.INT_SEMESTRE_INGRESSO) + '/' + CONVERT(VARCHAR(4), TBL_MORADOR.INT_ANO_INGRESSO)) AS CHR_INGRESSO");
            field += "CHR_INGRESSO;";
        }

        if (this.cbTelefone.Checked)
        {
            cell.Add("Celular");
            sql.Add("CHR_TELEFONE_CELULAR");
            field += "CHR_TELEFONE_CELULAR;";
        }

        if (this.cbEmail.Checked)
        {
            cell.Add("E-mail");
            sql.Add("CHR_EMAIL");
            field += "CHR_EMAIL;";
        }

        HtmlTableCell c;

        for (int i = 0; i < cell.Count; i++)
        {
            c = new HtmlTableCell();
            c.InnerHtml = "<h3>" + cell[i] + "</h3>";

            if (i == cell.Count - 1)
            {
                c.ColSpan = 2;
            }

            this.tblList.Rows[0].Cells.Add(c);
        }
        
        String isql = "SELECT ";

        for (int i = 0; i < sql.Count; i++)
        {
            isql += sql[i] + ","; 
        }

        isql = isql.Substring(0, isql.Length - 1) + " FROM TBL_MORADOR ORDER BY TBL_MORADOR.CHR_NOME";

        base.setISqlLoad(isql);
        base.setFields(field.Substring(0, field.Length-1));

        this.tblList.Style["display"] = "block";

        return base.loadPage(this.tblList, true, false, true, "Detalhes",
            "javascript:__openPopUp('detalMorador.aspx?morador=#0;', 'morador', true, 600, 800, false, false, 'yes');");

    }
}
