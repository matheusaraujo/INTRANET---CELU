/***************************************************
 * INTRANET CELU
 * App_Code/Library/DataBase/CField.cs
 * Representa um campo do Banco de Dados com nome e valor
 * # 2010-10-02
 * Matheus Araújo
 * Valquire Jesus
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Celu.Library.DataBase
{
    public class CField
    {

        private String _name;
        private String _value;

        public CField(String name, String value)
        {
            this._name = name;
            this._value = value;
        }

        public String Value()
        {
            return _value;
        }

        public String Name()
        {
            return _name;
        }

    }
}