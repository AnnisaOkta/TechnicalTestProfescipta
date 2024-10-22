using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Technical_Test.Model;
using Technical_Test.Repository;

namespace Technical_Test
{
    public partial class SalesOrder : System.Web.UI.Page
    {
        SalesModel sales = new SalesModel();
        SalesRepo salesRepo = new SalesRepo();

        DataTable dtDetail = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlForm.Visible = false;
                pnlList.Visible = true;
                pnlDetail.Visible = false;
                BindDataGrid();
            }
        }

        private void BindDataGrid()
        {
            sales.WhereCond = "";
            sales.SpName = "GetDataGrid";

            sales = salesRepo.GetListDataGrid(sales);

            if(sales.DtResult1.Rows.Count > 0)
            {
                lvList.DataSource = sales.DtResult1;
                lvList.DataBind();
            }
            else
            {
                lvList.DataSource = null;
                lvList.DataBind();
            }
        }

        private void LoadCust()
        {
            List<CustModel> result = salesRepo.GetListCust();
            ddlFCust.DataTextField = "CUSTOMER_NAME";
            ddlFCust.DataValueField = "CUSTOMER_ID";
            ddlFCust.DataSource = result;
            ddlFCust.DataBind();
            ddlFCust.Items.Insert(0, "Choose One");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            LoadCust();
            pnlList.Visible = false;
            pnlForm.Visible = true;
            pnlDetail.Visible = false;
        }

        protected void btnSaveDetail_Click(object sender, EventArgs e)
        {
            if (txtDName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Name cannot be empty !');", true);
                return;
            }
            else if (txtDQty.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Qty cannot be empty !');", true);
                return;
            }
            else if (txtDPrice.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Price cannot be empty !');", true);
                return;
            }

            if (gvListDetail.Items.Count > 0)
            {
                dtDetail = (DataTable)ViewState["dtDetail"];
            }

            DataRow[] drows = dtDetail.Select();

            if (ViewState["dtDetail"] != null)
            {
                dtDetail = (DataTable)ViewState["dtDetail"];
            }
            else
            {
                dtDetail.Columns.AddRange(new DataColumn[4] { new DataColumn("ItemName"), new DataColumn("Qty"), new DataColumn("Price"), new DataColumn("Total") });
            }
            float total = int.Parse(txtDQty.Text) * int.Parse(txtDPrice.Text);
            dtDetail.Rows.Add(txtDName.Text, txtDQty.Text, txtDPrice.Text, total.ToString());
            ViewState["dtDetail"] = dtDetail;
            gvListDetail.DataSource = ViewState["dtDetail"];
            gvListDetail.DataBind();
            txtDName.Text = "";
            txtDQty.Text = "";
            txtDPrice.Text = "";
            pnlForm.Visible = true;
            pnlDetail.Visible = false;
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            pnlList.Visible = false;
            pnlForm.Visible = false;
            pnlDetail.Visible = true;
        }
    }
}