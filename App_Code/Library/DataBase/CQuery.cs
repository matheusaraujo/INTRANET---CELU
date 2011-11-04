/***************************************************
 * INTRANET CELU
 * App_Code/Library/DataBase/CQuery.cs
 * Representa uma consulta ao Banco de Dado
 * # 2010-10-02
 * Matheus Araújo
 * Valquire Jesus
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Web;

namespace Celu.Library.DataBase
{

    public class CQuery
    {
        private List<CRow> _rows;
        
        public CQuery()
        {       
            _rows = new List<CRow>();
        }

        public void addRow(CRow row)
        {
            _rows.Add(row);
        }

        public CRow Row(int i)
        {
            return _rows[i];
        }

        public int Count()
        {
            return _rows.Count;
        }

        public CField objField(int i, int j)
        {
            return _rows[i].Field(j);
        }

        public String Field(int i, int j)
        {
            return _rows[i].Field(j).Value();
        }
    }
}