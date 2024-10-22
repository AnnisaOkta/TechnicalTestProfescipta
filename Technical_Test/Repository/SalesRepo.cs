using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Technical_Test.Model;
using System.Configuration;

namespace Technical_Test.Repository
{
    public class SalesRepo
    {
        
        SqlConnection koneksi = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConn"].ConnectionString);
        public SalesModel GetListDataGrid(SalesModel model)
        {
            SalesModel salesModel = new SalesModel();
            DataTable baru = new DataTable();
            try
            {
                SqlCommand cm = new SqlCommand(model.SpName, koneksi);
                cm.CommandType = CommandType.StoredProcedure;
                cm.CommandTimeout = 14400;
                koneksi.Open();
                cm.Parameters.AddWithValue("@WhereCond", model.WhereCond);
                using (IDataReader sdr = cm.ExecuteReader())
                {
                    baru.Load(sdr);
                }
                koneksi.Close();

                salesModel.DtResult1 = baru;

            }
            catch (SqlException ex)
            {

                if (koneksi != null)
                    koneksi.Close();
            }
            finally
            {
                if (koneksi != null)
                    koneksi.Close();
            }

            return salesModel;
        }

        public List<CustModel> GetListCust()
        {
            List<CustModel> cabang = new List<CustModel>();
            try
            {
                SqlCommand cm = new SqlCommand("GetCust", koneksi);
                cm.CommandType = CommandType.StoredProcedure;
                cm.CommandTimeout = 14400;
                koneksi.Open();

                using (SqlDataReader sdr = cm.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        cabang.Add(new CustModel
                        {
                            CUSTOMER_ID = sdr["CUSTOMER_ID"].ToString().Trim(),
                            CUSTOMER_NAME = sdr["CUSTOMER_NAME"].ToString().Trim(),
                        });
                    }
                }
            }
            catch (SqlException ex)
            {
                if (koneksi != null)
                    koneksi.Close();
            }
            finally
            {
                if (koneksi != null)
                    koneksi.Close();
            }
            return cabang;
        }
    }
}