/***************************************************
 * INTRANET CELU
 * App_Code/Library/DataBase/CRow.cs
 * Representa uma linha do Banco de Dados com um vetor de campos
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
    public class CRow
    {
        
        private List<CField> _fields;
        
        public CRow()
        {
            _fields = new List<CField>();
        }

        public void addField(String name, String value)
        {
            _fields.Add(new CField(name, value));        
        }

        public CField Field(int i)
        {
            return _fields[i];
        }

        public int Count()
        {
            return _fields.Count();
        }

    }
}