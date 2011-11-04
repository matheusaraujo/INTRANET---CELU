/***************************************************
 * INTRANET CELU
 * App_Code/Library/Security/CLogin.cs
 * Executa e armazena informações de login do usuário no banco de dados
 * # 2010-10-23
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Celu.Library.DataBase;

namespace Celu.Library.Security
{
    public class CLogin
    {

        private String _user;
        private String _cod;

        public CLogin()
        {
            _cod = "-1";
        }

        public String toString()
        {
            return this._user;
        }

        public Boolean doLogin(String user, String pass)
        {

            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE DO_LOGIN '" + user + "','" + pass + "'", 
                "DO_LOGIN");

            try
            {
                if (query.Field(0, 0) == "1")
                {
                    this._user = user;
                    return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
            
        }

        public Boolean verificaPermissao(String item)
        {
            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE VERIFICA_PERMISSAO " + item + ",'" + this._user + "'", "PERMISSAO");

            try
            {
                if (query.Field(0, 0) == "0")
                    return false;
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public String getCod()
        {

            if (this._cod.Equals("-1"))
            {
                CDataBase db = new CDataBase();

                CQuery query = db.select("EXECUTE LOAD_MORADOR_COD_BY_LOGIN '" + this._user + "'", "COD_MORADOR");

                if (query.Count() > 0)
                    this._cod = query.Field(0, 0);                
            }
            
            return this._cod;

        }

        public String changePass(String old, String new1, String new2)
        {

            if (old.Equals(String.Empty) || new1.Equals(String.Empty) || new2.Equals(String.Empty))
            {
                return "Digite a senha antiga e as novas!";
            }
            else if (!new1.Equals(new2))
            {
                return "As senhas digitadas não conferem!";
            }
            else if (new1.Equals(old))
            {
                return "A senha nova deve ser diferente da antiga!";
            }
            else if (new1.Length > 32)
            {
                return "A senha nova deve ter no máximo 32 caracteres!";
            }
            else if (new1.IndexOf(" ") > 0)
            {
                return "A senha nova não deve conter espaços em branco!";
            }
            else if (!doLogin(this._user, old))
            {
                return "A senha antiga está incorreta!";
            }
            else
            {
                CDataBase db = new CDataBase();

                try
                {
                    db.execute("EXECUTE MORADOR_CHANGE_PASS " + this.getCod() + ",'" + new1 + "'");

                    return "Senha trocada com sucesso!";
                }
                catch (Exception ex)
                {
                    return "Erro ao trocar a senha!\\n" + ex.Message;
                }

            }
            
        }
    }
}