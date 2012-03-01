using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Celu.Library.DataBase;

namespace Celu.Library.WebPage
{
    
    public enum FieldType
    {
        TextBox,
        SelectBox,
        CheckBox,
        Calendar
    }

    public enum SQLType
    {
        Numeric,
        Charactere,
        Date,
        DateTime,
        Bit
    }

    public enum StatusPage
    {
        OpenUnload,
        OpenLoad,
        AfterEditClick,
        AfterSaveClick,
        AfterDelClick,
        AfterInsertClick,
        Null
    }

    public class CRegField
    {
        private WebControl _pageelement;
        private String _fieldname;        
        private FieldType _fieldtype;
        private SQLType _sqltype;
        private String _desc;
        private Boolean _editable;
        private Boolean _notnull;
        private Boolean _primary;        


        public CRegField(WebControl pageelement, String fieldname, FieldType fieldtype,
                            SQLType sqltype, String desc, Boolean editable, Boolean notnull, Boolean primary)
        {
            this._pageelement = pageelement;
            this._fieldname = fieldname;        
            this._fieldtype = fieldtype;
            this._sqltype = sqltype;
            this._desc = desc;
            this._editable = editable;
            this._notnull = notnull;
            this._primary = primary;
        }

        public WebControl pageelement()
        {
            return this._pageelement;
        }

        public String fieldname()
        {
            return this._fieldname;
        }

        public FieldType fieldtype()
        {
            return this._fieldtype;
        }

        public SQLType sqltype()
        {
            return this._sqltype;
        }

        public String desc()
        {
            return this._desc;
        }

        public Boolean editable()
        {
            return this._editable;
        }

        public Boolean notnull()
        {
            return this._notnull;
        }

        public Boolean primary()
        {
            return this._primary;
        }

        public void updateElement(WebControl pageelement)
        {
            this._pageelement = pageelement;
        }

    }

    public abstract class CRegPage : CPage
    {   

        // propriedades privadas
        private String _isqlverifysave;
        private String _isqlsave;
        private String _isqlload;
        private String _isqldel;
        private String _table;
        private String _idurl;
        private List<CRegField> _fields;        
        private int _identity = -1;
        private Boolean _systemcad;
        
        // elementos html
        private Button _btnEdit;
        private Button _btnSave;
        private Button _btnDel;
        private Button _btnNew;
        private HtmlTable _htmtable;

        public void setSqlDefault(String name)
        {
            this._table = "TBL_" + name;
            this._isqlverifysave = "EXECUTE VERIFY_INSERT_" + name;
            this._isqlsave = "EXECUTE INSERT_" + name;
            this._isqlload = "EXECUTE LOAD_REG_" + name;
            this._isqldel = "EXECUTE DELETE_" + name;
        }

        public void setHtmlElements(Button btnEdit, Button btnSave, Button btnDel, Button btnNew, HtmlTable htmtable)
        {
            this._btnEdit = btnEdit;
            this._btnSave = btnSave;
            this._btnDel = btnDel;
            this._btnNew = btnNew;
            this._htmtable = htmtable;

            // evento onclick do edit
            this._btnEdit.Attributes.Add("onclick", 
                "javascript:document.getElementById('" + btnEdit.ID + "').disabled=true;" +
                "document.getElementById('" + btnSave.ID + "').disabled=false;" +
                (this._systemcad ? "document.getElementById('" + btnDel.ID + "').disabled=true;" : "document.getElementById('" + btnDel.ID + "').disabled=false;") +
                (this._systemcad ? "document.getElementById('" + btnNew.ID + "').disabled=true;" : "document.getElementById('" + btnNew.ID + "').disabled=false;") +
                "document.getElementById('" + htmtable.ID + "').disabled=false;" +
                "return false;");

            String newscript = String.Empty;

            for (int i = 0; i < _fields.Count; i++)
            {
                if (_fields[i].fieldtype() == FieldType.TextBox)
                {
                    newscript += "document.getElementById('" + _fields[i].pageelement().ID + "').value='';";
                }
                else if (_fields[i].fieldtype() == FieldType.SelectBox)
                {
                    newscript += "document.getElementById('" + _fields[i].pageelement().ID + "').selectedIndex=0;";
                }
                else if (_fields[i].fieldtype() == FieldType.CheckBox)
                {
                    newscript += "document.getElementById('" + _fields[i].pageelement().ID + "').checked=false;";
                }
                else if (_fields[i].fieldtype() == FieldType.Calendar)
                {
                    //newscript += "today = new Date();document.getElementById('" + _fields[i].pageelement().ID + "').SelectedDate = today;";
                }

            }

            this._btnNew.Attributes.Add("onclick",
                "javascript:document.getElementById('" + btnEdit.ID + "').disabled=true;" +
                "document.getElementById('" + btnSave.ID + "').disabled=false;" +
                "document.getElementById('" + btnDel.ID + "').disabled=true;" +
                "document.getElementById('" + btnNew.ID + "').disabled=true;" +
                "document.getElementById('" + htmtable.ID + "').disabled=false;" +
                newscript + "return false;");
        }

        public void setIdUrl(String idurl)
        {
            this._idurl = idurl;
        }

        public void setSqlVerifySave(String isqlverifysave)
        {
            this._isqlverifysave = isqlverifysave;
        }

        public void setSqlSave(String isqlsave)
        {
            this._isqlsave = isqlsave;
        }

        public void setSqlLoad(String isqlload)
        {
            this._isqlload = isqlload;
        }

        public void setSqlDel(String isqldel)
        {
            this._isqldel = isqldel;
        }

        public void setTable(String table)
        {
            this._table = table;
        }

        public void setIdentity(int identity)
        {
            this._identity = identity;
        }

        public void setSystemCad(Boolean systemcad)
        {
            this._systemcad = systemcad;
        }

        public void addField(CRegField field)
        {
            this._fields.Add(field);
        }

        public CRegPage()
        {
            this._fields = new List<CRegField>();
            this._systemcad = false;
        }

        public override Boolean loadPage()
        {
            return loadPage(String.Empty);
        }

        public override Boolean loadPage(String id)
        {

            // verifica permissão
            if (!base.loadPage())
            {
                return false;
            }

            try
            {

                CDataBase db = new CDataBase();

                if (id.Equals(String.Empty))
                {
                    id = getUrlParameter(Request.RawUrl, this._idurl);
                }

                if (id.Equals("-1"))
                {                    
                    this.setPageStatus(StatusPage.OpenUnload);
                    return false;
                }
                else
                {

                    CQuery query = db.select(this._isqlload + " " + id, this.mountFieldName());

                    if (query.Count() == 0)
                    {
                        this.setPageStatus(StatusPage.OpenUnload);
                    }
                    else
                    {

                        for (int i = 0; i < this._fields.Count; i++)
                        {
                            if (_fields[i].fieldtype() == FieldType.TextBox)
                            {                                
                                ((TextBox)this._fields[i].pageelement()).Text = query.Field(0, i);                                
                            }
                            else if (_fields[i].fieldtype() == FieldType.SelectBox)
                            {
                                ((DropDownList)_fields[i].pageelement()).SelectedValue = query.Field(0,i);
                            }
                            else if (_fields[i].fieldtype() == FieldType.CheckBox)
                            {
                                try
                                {
                                    ((CheckBox)_fields[i].pageelement()).Checked = Convert.ToBoolean(query.Field(0, i));
                                }
                                catch (Exception ex1)
                                {
                                    // empty
                                }
                            }
                            else if (_fields[i].fieldtype() == FieldType.Calendar)
                            {
                                try
                                {
                                    ((Calendar)_fields[i].pageelement()).SelectedDate = Convert.ToDateTime(query.Field(0, i));
                                }
                                catch (Exception ex2)
                                {
                                    // empty
                                }
                            }
                        }

                        this.setPageStatus(StatusPage.OpenLoad);

                    }
                }

                
            }
            catch (Exception ex)
            {
                return false;
            }

            return true;
            
        }

        public Boolean saveClick()
        {
            if (this._isqlsave.Equals(String.Empty) || this._isqlverifysave.Equals(String.Empty))
            {
                return false;
            }
            else
            {
                String fields = " ";

                for (int i = 0; i < this._fields.Count; i++)
                {

                    // se é campo editável
                    if (this._fields[i].editable())
                    {

                        // verifica se é nulo
                        if (this._fields[i].notnull())
                        {
                            if (this._fields[i].fieldtype() == FieldType.TextBox)
                            {
                                if (((TextBox)this._fields[i].pageelement()).Text.Equals(String.Empty))
                                {
                                    alert("Preencha o campo " + this._fields[i].desc() + "!");
                                    return false;
                                }
                            }
                            else if (this._fields[i].fieldtype() == FieldType.SelectBox)
                            {
                                if (((DropDownList)_fields[i].pageelement()).SelectedValue.Equals(String.Empty))
                                {
                                    alert("Preencha o campo " + this._fields[i].desc() + "!");
                                    return false;
                                }
                            }
                        }

                        // verifica data
                        if (this._fields[i].sqltype() == SQLType.Date && this._fields[i].fieldtype() == FieldType.TextBox)
                        {
                            try
                            {
                                String value = ((TextBox)this._fields[i].pageelement()).Text;
                                DateTime dt = new DateTime(Convert.ToInt32(value.Substring(6, 4)),
                                    Convert.ToInt32(value.Substring(3, 2)), Convert.ToInt32(value.Substring(0, 2)));
                            }
                            catch (Exception ex)
                            {
                                alert("Digite uma data válida (DD/MM/AAAA) para o campo " + this._fields[i].desc() + "!");
                                return false;
                            }
                        }

                        // verifica campo numérico
                        if (this._fields[i].sqltype() == SQLType.Numeric && this._fields[i].fieldtype() == FieldType.TextBox && (i != _identity))
                        {

                            try
                            {
                                String value = ((TextBox)this._fields[i].pageelement()).Text;
                                if (!value.Equals(String.Empty) && this._fields[i].notnull())
                                {
                                    value = value.Replace(",", ".");

                                    Double db = Convert.ToDouble(value);
                                }
                            }
                            catch
                            {
                                alert("Digite um valor numérico válido para o campo " + this._fields[i].desc() + "!");
                                return false;
                            }
                        }

                        String aux;

                        if (this._fields[i].fieldtype() == FieldType.TextBox)
                        {
                            aux = ((TextBox)this._fields[i].pageelement()).Text;
                        }
                        else if (this._fields[i].fieldtype() == FieldType.SelectBox)
                        {
                            aux = ((DropDownList)_fields[i].pageelement()).SelectedValue;
                        }
                        else if (this._fields[i].fieldtype() == FieldType.CheckBox)
                        {
                            aux = ((CheckBox)_fields[i].pageelement()).Checked ? "1" : "0";
                        }
                        else if (this._fields[i].fieldtype() == FieldType.Calendar)
                        {
                            aux = ((Calendar)_fields[i].pageelement()).SelectedDate.Year.ToString() + "-" +
                                ((Calendar)_fields[i].pageelement()).SelectedDate.Month.ToString() + "-" +
                                ((Calendar)_fields[i].pageelement()).SelectedDate.Day.ToString();                                    
                        }
                        else
                        {
                            aux = String.Empty;
                        }

                        fields += ((aux.Equals(String.Empty)&& i != _identity) ? ("NULL,") : ("'" + aux.Replace("'", "''") + "',"));
                    }

                }

                fields = fields.Substring(0, fields.Length - 1);

                CDataBase cdb = new CDataBase();
                CQuery query;

                if (!this._isqlverifysave.Equals("-1"))
                {
                    query = cdb.select(this._isqlverifysave + fields, "P_CHR_MSG_ERRO");
                }
                else
                {
                    query = new CQuery();
                    CRow row = new CRow();
                    row.addField("", "");
                    query.addRow(row);

                }

                if (query.Count() == 0)
                {
                    alert("Houve um erro ao salvar o registro!");
                    this.setPageStatus(StatusPage.OpenUnload);
                    return false;
                }
                else
                {
                    if (!query.Field(0, 0).Equals(String.Empty))
                    {
                        alert("Não foi possível salvar o registro!\\n" + query.Field(0, 0));
                        clearFields();
                        this.setPageStatus(StatusPage.OpenUnload);
                        return false;
                    }
                    else
                    {
                        try
                        {
                            cdb.execute(this._isqlsave + fields);                            
                            this.setIdentity(cdb);
                            this.setPageStatus(StatusPage.AfterSaveClick);
                        }
                        catch (Exception ex)
                        {
                            alert("Erro ao salvar o registro!\\n" + ex.Message);
                            this.setPageStatus(StatusPage.OpenUnload);
                        }
                    }
                }


                return true;
            }
        }

        public Boolean delClick()
        {
            if (this._isqldel.Equals(String.Empty))
            {
                return false;
            }
            else
            {
                CDataBase cdb = new CDataBase();

                String id = ((TextBox)this._fields[_identity].pageelement()).Text;

                if (id.Equals(String.Empty))
                {
                    id = this._fields[_identity].pageelement().Attributes["Value"].ToString();
                }

                CQuery query = cdb.select(this._isqldel + " " + id, "P_CHR_MSG_ERRO");

                if (query.Count() == 0)
                {
                    return false;
                }
                else
                {
                    if (query.Field(0, 0).Equals(String.Empty))
                    {
                        this.setPageStatus(StatusPage.AfterDelClick);
                        
                        // limpa os campos
                        clearFields();

                        return true;
                    }
                    else
                    {
                        alert("Impossível excluir o registro!\\n" + query.Field(0, 0));
                        return false;
                    }
                }
            }
        }

        private void setIdentity(CDataBase cdb)
        {
            if (this._identity != -1)
            {
                if (((TextBox)this._fields[_identity].pageelement()).Text.Equals(String.Empty))
                {

                    CQuery query = cdb.select("SELECT IDENT_CURRENT('" + this._table + "') AS IDENT_CURRENT", "IDENT_CURRENT");

                    if(query.Count() > 0)
                    {
                        ((TextBox)this._fields[_identity].pageelement()).Text = query.Field(0, 0);
                        this._fields[_identity].pageelement().Attributes.Add("Value", query.Field(0, 0));
                    }
                }
                
            }
        }

        private void clearFields()
        {
            for (int i = 0; i < this._fields.Count; i++)
            {
                if (this._fields[i].fieldtype() == FieldType.TextBox)
                {
                    ((TextBox)this._fields[i].pageelement()).Text = String.Empty;
                    this._fields[i].pageelement().Attributes.Remove("Value");
                }
                else if (this._fields[i].fieldtype() == FieldType.SelectBox)
                {
                    ((DropDownList)_fields[i].pageelement()).SelectedIndex = 0;
                }
                else if (this._fields[i].fieldtype() == FieldType.CheckBox)
                {
                    ((CheckBox)_fields[i].pageelement()).Checked = false;
                }
            }
        }

        private String mountFieldName()
        {
            String ret = ""; 

            for (int i = 0; i < this._fields.Count; i++)
            {
                ret += this._fields[i].fieldname() + ";";
            }

            return ret.Substring(0, ret.Length-1);
        }

        public abstract void setPageElements();
        
        private void setPageStatus(StatusPage _status)
        {
            
            /*-------------------------------                    
            -- ** Estados da página **
            -- Botões: Edit, Save, Del, New - Table
            -- 1 Enabled / 0 Disabled
            -- #a Abrir página sem carregar: 0100-1
            -- #b Abrir página carregando: 1011-0
            -- #c Clique em Editar: 0111-1
            -- #d Clique em Salvar: 1011-0
            -- #e Clique em Deletar: 0100-1
            -- #f Clique em Inserir: 0100-1
            -- obs.: a = e = f, b = c                                     
            -------------------------------*/

            Boolean[] enable = new Boolean[5];
            
            // determina o comportamento de cada estado

            if (_status == StatusPage.OpenUnload || _status == StatusPage.AfterDelClick || _status == StatusPage.AfterInsertClick){
                enable[0] = false;
                enable[1] = true;
                enable[2] = enable[3] = false;
                enable[4] = true;
            }
            else if (_status == StatusPage.OpenLoad || _status == StatusPage.AfterEditClick)
            {
                enable[0] = false;
                enable[1] = enable[2] = enable[3] = enable[4] = true;
            }
            else if (_status == StatusPage.AfterSaveClick)
            {
                enable[0] = true;
                enable[1] = false;
                enable[2] = enable[3] = true;
                enable[4] = false;
            }


            // aplica aos botões
            try { this._btnEdit.Enabled = enable[0]; }
            catch (Exception ex){}

            try { this._btnSave.Enabled = enable[1]; }
            catch (Exception ex) { }

            try { this._btnDel.Enabled = enable[2]; }
            catch (Exception ex) { }

            try { this._btnNew.Enabled = enable[3]; }
            catch (Exception ex) { }

            try { this._htmtable.Disabled = !enable[4]; }
            catch (Exception ex) { }

            // campos não editáveis
            for (int i = 0; i < this._fields.Count; i++)
            {
                if (!this._fields[i].editable())
                {
                    this._fields[i].pageelement().Enabled = false;                    
                }
            }

            // verifica cadastro de sistema
            this.verifySystemCad();

        }

        private void verifySystemCad()
        {
            if (this._systemcad)
            {
                this._btnDel.Enabled = false;
                this._btnNew.Enabled = false;
            }
        }
    }
}