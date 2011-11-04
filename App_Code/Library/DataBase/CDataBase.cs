/***************************************************
 * INTRANET CELU
 * App_Code/Library/DataBase/CDataBase.cs
 * Executa a conexão com o Banco de Dados
 * # 2010-10-02
 * Matheus Araújo
 * Valquire Jesus
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Celu.Library.DataBase
{

    public class CDataBase
    {

        private SqlConnection _cnnConn;
        private SqlDataReader _rstRecord;
        private SqlCommand _cmdCommand;

        // String de conexão
        private static String _strConnection = "Server=INTRANET;Database=db_celu;User Id=us_celu; Password=inf@celu1011";

        public static String getString()
        {
            return _strConnection;
        }

        // construtor vazio
        public CDataBase()
        {

        }

        // executa uma consulta no banco e retorna um objeto CQuery
        public CQuery select(String isql, String sfields)
        {

            // determina vetor de campos
            String[] fields = sfields.Split(';');

            // cria objeto query
            CQuery query = new CQuery();

            try
            {

                // executa a instrução sem fechar a conexão
                this.execute(isql, false);

                // monta o objeto query
                this._rstRecord = this._cmdCommand.ExecuteReader();
                
                while (_rstRecord.Read())
                {
                    CRow row = new CRow();

                    for (int i = 0; i < fields.Length; i++)
                    {
                        try
                        {
                            row.addField(fields[i], _rstRecord[fields[i]].ToString());
                        }
                        catch (Exception ex)
                        {
                            row.addField(fields[i], "");
                        }
                    }

                    query.addRow(row);

                }
            }
            catch (Exception ex)
            {
                query = null;
            }
            finally
            {
                // fecha a conexão          
                this.closeConnection();             
            }

            // retorna a consulta
            return query;

        }

        // abre conexão com o banco de dados
        private void openConnection()
        {
            try
            {
                this._cnnConn = new SqlConnection(_strConnection);
               
                this._cnnConn.Open();

            }
            catch (Exception ex)
            {
                // vazio
                
            }
        }

        // fecha a conexão com o banco de dados
        private void closeConnection()
        {
            try
            {
                this._cnnConn.Close();
                this._cnnConn = null;
            }
            catch (Exception ex)
            {
                // vazio
            }
        }

        // função pública para execução de instrução sql
        public void execute(String isql)
        {
            this.execute(isql, true);
        }

        // função privada para execução de instrução sql
        private void execute(String isql, Boolean closeConnection)
        {

            this.openConnection();

            try
            {
                this._cmdCommand = new SqlCommand(isql, this._cnnConn);

                if (closeConnection)
                {
                    this._cmdCommand.ExecuteNonQuery();
                    this.closeConnection();
                }
            }
            catch (Exception ex)
            {
                // vazio
                
            }

        }
    }
}