/***************************************************
 * INTRANET CELU
 * App_Page/Common/foto.aspx.cs
 * Página de upload de foto pessoal
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

using Celu.Library.Security;
using Celu.Library.DataBase;
using Celu.Library.WebPage;

public partial class App_Page_Common_foto : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        
        if (fupld.PostedFile == null || string.IsNullOrEmpty(fupld.PostedFile.FileName) || fupld.PostedFile.InputStream == null)
        {
            lblmsg.Text = "<br />Erro - Não foi possível enviar o arquivo.<br />";
            return;
        }
        else
        {
            string extension = Path.GetExtension(fupld.PostedFile.FileName).ToLower();
            string fileType = null;

            switch (extension)
            {
                case ".gif":
                    fileType = "image/gif";
                    break;
                case ".jpg":
                case ".jpeg":
                case ".jpe":
                    fileType = "image/jpeg";
                    break;
                default:
                    lblmsg.Text = "<br />Erro - tipo de arquivo inválido.<br />";
                    return;
            }

            if (fupld.PostedFile.InputStream.Length > 1048576){
                 lblmsg.Text = "<br />Erro - O arquivo deve ter no máximo 1MB.<br />";
                return;
            }

            using (SqlConnection Conn = new SqlConnection(CDataBase.getString()))
            {
                try
                {

                    SqlCommand cmd = new SqlCommand("DELETE TBL_MORADOR_FOTO WHERE COD_MORADOR = " +
                        ((CLogin)(Session["login"])).getCod(), Conn);

                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    Conn.Close();

                    const string SQL = "INSERT INTO [TBL_MORADOR_FOTO] ([COD_MORADOR], [MIME], [imagem]) VALUES " + 
                        "(@codMorador, @MIME, @imagem)";
                    cmd = new SqlCommand(SQL, Conn);
                    cmd.Parameters.AddWithValue("@codMorador", ((CLogin)(Session["login"])).getCod());
                    cmd.Parameters.AddWithValue("@MIME", fileType);

                    byte[] imageBytes = new byte[fupld.PostedFile.InputStream.Length + 1];
                    fupld.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);
                    cmd.Parameters.AddWithValue("@imagem", imageBytes);

                    lblmsg.Text = "<br />Arquivo enviado com sucesso <br />";

                    Conn.Open();
                    cmd.ExecuteNonQuery();
                    Conn.Close();
                }
                catch (Exception ex)
                {
                    lblmsg.Text = " Erro ao enviar imagem - " + ex.Message;
                    Conn.Close();
                }
            }
        }
    }
}
