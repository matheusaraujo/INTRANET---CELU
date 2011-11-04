/***************************************************
 * INTRANET CELU
 * \App_Code\Library\WebPage\CPage.cs
 * Página genérica
 * # 2010-10-30
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections.Generic;

using Celu.Library.Security;
using Celu.Library.DataBase;

namespace Celu.Library.WebPage
{
    
    public class CSelect
    {
        private DropDownList _obj;
        private String _isql;
        private String _fields;
        private int _ivalue;
        private Boolean _svalue;
        private Boolean _insNull;
        private List<String> _values;

        public CSelect(DropDownList obj, String isql, String fields, int ivalue, Boolean svalue, Boolean insNull)
        {
            this._obj = obj;
            this._isql = isql;
            this._fields = fields;
            this._ivalue = ivalue;
            this._svalue = svalue;
            this._insNull = insNull;
            this._values = new List<String>();
        }

        public DropDownList obj()
        {
            return this._obj;
        }

        public String isql()
        {
            return this._isql;
        }

        public String fields()
        {
            return this._fields;
        }

        public int ivalue()
        {
            return this._ivalue;
        }

        public Boolean svalue()
        {
            return this._svalue;
        }

        public List<String> values()
        {
            return this._values;
        }

        public void loadSelect()
        {

            CDataBase db = new CDataBase();

            CQuery query = db.select(this._isql, this._fields);

            String temp = "";

            for (int i = 0; i < query.Count(); i++)
            {
                temp = "";

                for (int j = 0; j < query.Row(i).Count(); j++)
                {
                    if (j != this._ivalue || this._svalue)
                    {
                        temp += query.Field(i, j) + " - ";
                    }
                }

                this._values.Add(query.Field(i, this._ivalue));

                this._obj.Items.Add(new ListItem(temp.Substring(0, temp.Length - 3), query.Field(i, this._ivalue)));
            }

            if (this._insNull)
            {
                this._obj.Items.Insert(0, new ListItem("", ""));
            }
        }

        public void setSelect(String value)
        {
            this._obj.SelectedValue = value;
        }
    }

    public class CPage : System.Web.UI.Page
    {
        private String _idPage;
        protected List<CSelect> _select;

        public CPage()
        {
            this._select = new List<CSelect>();   
        }

        public CPage(String idPage)
        {
            this.setIdPage(idPage);
        }

        public void setIdPage(String idPage)
        {
            this._idPage = idPage;
        }

        public String getIdPage()
        {
            return _idPage;
        }

        public virtual Boolean loadPage(String id)
        {
            return loadPage(String.Empty);
        }

        public virtual Boolean loadPage()
        {
            if (!this._idPage.Equals(String.Empty))
            {
                CLogin login = (CLogin)Session["login"];

                if (!login.verificaPermissao(this._idPage))
                {
                    this.semPermissao();
                    return false;
                }

                // select box
                if (this._select.Count > 0)
                {
                    for (int i = 0; i < this._select.Count; i++)
                        _select[i].loadSelect();
                }

                return true;
            }
            else
            {
                this.semPermissao();
                return false;
            }
        }

        private void semPermissao()
        {
            String url = Request.RawUrl;

            url = url.Substring(0, url.ToLower().IndexOf("app_page")) + "App_Page/Common/no_permission.htm";

            String script = "<script type=\"text/javascript\" language=\"javascript\">"
                + "window.navigate('" + url + "');</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "nopermission", script);
            
        }

        public void addSelect(CSelect select)
        {
            this._select.Add(select);
        }

        public void alert(String msg)
        {            
            this.ClientScript.RegisterStartupScript(this.GetType(), "alerta", 
                "<script language=\"javascript\" type=\"text/javascript\">alert('" + msg + "');</script>");
        }

        public String getUrlParameter(String url, String parname)
        {
            String ret = "";

            int i1 = url.IndexOf(parname);
            int i2 = -1;

            if (i1 > 0)
                i2 = url.IndexOf(";", i1 + parname.Length + 1);

            if (i2 > 0)
                ret = url.Substring(i1 + parname.Length + 1, i2 - i1 - parname.Length - 1);

            return ret;


        }
    }
}