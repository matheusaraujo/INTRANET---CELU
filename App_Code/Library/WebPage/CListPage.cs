/***************************************************
 * INTRANET CELU
 * \App_Code\Library\WebPage\CListPage.cs
 * Página genérica para listagem
 * # 2010-10-30
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.HtmlControls;

using Celu.Library.DataBase;

namespace Celu.Library.WebPage
{

    public class CListPage : CPage
    {

        // propriedades privadas
        String _isqlload;
        String _fields;

        // construtor vazio
        public CListPage()
        {
        }
        
        public void setISqlLoad(String isqlload)
        {
            this._isqlload = isqlload;
        }

        public void setFields(String fields)
        {
            this._fields = fields;
        }

        public Boolean loadPage(HtmlTable table, Boolean showEdit)
        {
            return this.loadPage(table, showEdit, true, false, "Editar", "edit");
        }

        // carrega a página
        public Boolean loadPage(HtmlTable table, Boolean showEdit, Boolean showFirst, Boolean zebra, String editText, String editFunc)
        {

            // classe mãe
            if (!base.loadPage()){
                return false;
            }
            else
            {
                CDataBase db = new CDataBase();
                HtmlTableRow row;
                HtmlTableCell cell;

                CQuery query = db.select(this._isqlload, this._fields);

                if (query == null)
                    return false;

                int initRow = table.Rows.Count;

                for (int i = 0; i < query.Count(); i++)
                {

                    row = new HtmlTableRow();

                    for (int j = (showFirst ? 0 : 1); j < query.Row(i).Count(); j++)
                    {

                        cell = new HtmlTableCell();
                        cell.InnerHtml = query.Field(i, j);

                        row.Cells.Add(cell);
                    }

                    if (showEdit)
                    {
                        cell = new HtmlTableCell();
                        cell.InnerHtml = "<a href=\"#\" onclick=\"" + mountFunction(editFunc, query.Row(i)) + "\"" +
                            " onmouseenter=\"javascript:document.getElementById('" + table.ID + "').rows[" + (int)(i + initRow) + "].style.color = 'EB151C';\"" +
                            " onmouseleave=\"javascript:document.getElementById('" + table.ID + "').rows[" + (int)(i + initRow) + "].style.color = '';\"" +
                            ">" + editText + "</a>";
                        row.Cells.Add(cell);
                    }

                    if (i % 2 == 1 && zebra)
                        row.Style.Add("background-color", "Gainsboro");

                    table.Rows.Add(row);

                }

                return true;
            }

        }

        private String mountFunction(String editFunc, CRow row){
            
            int i = editFunc.IndexOf("#");

            while (i > 0)
            {
                editFunc = editFunc.Substring(0, i) + row.Field((int)(editFunc[i+1])-48).Value() + editFunc.Substring(i+2);
                i = editFunc.IndexOf("#", i + 1);
            }

            return editFunc;
        }


    }
}