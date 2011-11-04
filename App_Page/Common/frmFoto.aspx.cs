/***************************************************
 * INTRANET CELU
 * App_Page/Common/frmFoto.aspx.cs
 * Página para usuário exibir foto
 * # 2011-04-16
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

using Celu.Library.WebPage;
using Celu.Library.Security;
using Celu.Library.DataBase;

public partial class App_Page_Common_frmFoto : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.loadFoto(base.getUrlParameter(Request.RawUrl, "morador"));
    }

    private void loadFoto(String id)
    {

        try
        {
            int imagemID = Convert.ToInt32(id);

            //nomeArquivo], [horaUpload], [MIME], [imagem]
            using (SqlConnection Conn = new SqlConnection(CDataBase.getString()))
            {
                const string SQL = "SELECT [MIME], [imagem] FROM [TBL_MORADOR_FOTO] WHERE [COD_MORADOR] = @id";
                SqlCommand myCommand = new SqlCommand(SQL, Conn);
                myCommand.Parameters.AddWithValue("@id", imagemID);

                Conn.Open();
                SqlDataReader myReader = myCommand.ExecuteReader();

                if (myReader.Read())
                {
                    Response.ContentType = myReader["MIME"].ToString();
                    Response.BinaryWrite((byte[])myReader["imagem"]);


                }

                myReader.Close();
                Conn.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }

    }
}
