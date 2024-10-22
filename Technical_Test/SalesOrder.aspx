<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="SalesOrder.aspx.cs" Inherits="Technical_Test.SalesOrder" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../Content/assets/images/favicon.png">
    <!-- Bootstrap Core CSS -->
    <link href="../Content/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../Content/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="../Content/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

    <script type="text/javascript">
        function ProcessConfirm() {
            if (window.confirm("Are you sure want to process this record ?"))
                return true;
            else
                return false;
        }

        //function ProcessDelete() {
        //    if (window.confirm("Yakin akan hapus data ini ?"))
        //        return true;
        //    else
        //        return false;
        //}
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="row page-titles">
        <div class="col-md-5 col-8 align-self-center">
            <h3 class="text-themecolor m-b-0 m-t-0">Sales</h3>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                <li class="breadcrumb-item active">Sales Order</li>
            </ol>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- Start Page Content -->
    <!-- ============================================================== -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <!-- ============================================================== -->
                    <!-- Panel List -->
                    <!-- ============================================================== -->
                    <asp:Panel runat="server" ID="pnlList">
                        <h4 class="card-title">Sales Order</h4>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblSKeywords" CssClass="control-label">Keywords</asp:Label>
                                    <asp:TextBox runat="server" ID="txtSKeywords" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblSDate" CssClass="control-label">Date</asp:Label>
                                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-success btn-small"><i class="fa fa-plus"></i> Add</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnSeacrh" CssClass="btn btn-info btn-small"><i class="fa fa-search"></i> Search</asp:LinkButton>
                            </div>
                        </div>

                        <div class="table-responsive m-t-40">
                            <asp:ListView ID="lvList" runat="server">
                                <LayoutTemplate>
                                    <table id="gvList" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center;">No</th>
                                                <th style="text-align: center;">Action</th>
                                                <th style="text-align: center;">Sales Order</th>
                                                <th style="text-align: center;">Order Date</th>
                                                <th style="text-align: center;">Customer</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr runat="server" id="itemPlaceholder" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td style="text-align: center;"><%# Container.DataItemIndex + 1 %> </td>
                                        <td class="actions" style="text-align-last: center;">
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="btn btn-warning btn-sm" title="Edit" CommandName="Ubah"><i class="fa fa-edit"></i></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:Literal ID="ltlOrderNo" runat="server" Text='<%# Eval("ORDER_NO")%>' />
                                        </td>
                                        <td>
                                            <asp:Literal ID="ltlOrderDate" runat="server" Text='<%# Eval("ORDER_DATE")%>' />
                                        </td>
                                        <td>
                                            <asp:Literal ID="LtlCustName" runat="server" Text='<%# Eval("CUSTOMER_NAME")%>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <div style="margin-top: 5px; border: solid 1px #999999; padding: 4px;">
                                        <asp:Label ID="lblNoData" runat="server" Text="No Data Result"></asp:Label>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="btn btn-success btn-small"><i class="fa fa-plus"></i> Export to Excel</asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                    <!-- ============================================================== -->
                    <!-- end Panel List -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Panel Form -->
                    <!-- ============================================================== -->
                    <asp:Panel runat="server" ID="pnlForm">
                        <h4 class="card-title">Add New - Sales Order</h4>
                        <hr />
                        <div class="row p-t-20">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:HiddenField runat="server" ID="hdnInputID"></asp:HiddenField>
                                        <asp:Label runat="server" ID="lblFOrderNum" CssClass="control-label">Sales Order Number <span class="text-danger">*</span></asp:Label>
                                        <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Medium" runat="server" ID="reqtxtOrderNum" ControlToValidate="txtFOrderNum" ErrorMessage="This field cannot be blank !" />
                                    </div>
                                    <asp:TextBox runat="server" ID="txtFOrderNum" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="lblFOrderDate" CssClass="control-label">Order Date <span class="text-danger">*</span></asp:Label>
                                        <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Medium" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtFOrderDate" ErrorMessage="This field cannot be blank !" />
                                    </div>
                                    <asp:TextBox runat="server" ID="txtFOrderDate" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="lblFCust" CssClass="control-label">Customer <span class="text-danger">*</span></asp:Label>
                                        <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Medium" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtFOrderNum" ErrorMessage="This field cannot be blank !" />
                                    </div>
                                    <asp:DropDownList runat="server" ID="ddlFCust" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="lblFAddress" CssClass="control-label">Address <span class="text-danger">*</span></asp:Label>
                                        <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Medium" runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtFAddress" ErrorMessage="This field cannot be blank !" />
                                    </div>
                                    <asp:TextBox runat="server" ID="txtFAddress" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <h4 class="card-title">Detail Item Information</h4>
                        <div class="row p-t-20">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Button runat="server" ID="btnAddItem" OnClick="btnAddItem_Click" CssClass="btn btn-success" CausesValidation="false" Text="Add item" />
                                    </div> 
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:DataGrid runat="server" ID="gvListDetail" AutoGenerateColumns="false" CssClass="display nowrap table table-hover table-striped table-bordered">
                                        <Columns>
                                            <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="No">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%# Container.ItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="Qty">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="Price">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="Total">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" HeaderText="Action">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Button ID="btnLMHapus" runat="server" CssClass="btn btn-danger btn-sm" CausesValidation="false" title="Delete" CommandName="Hapus" Text="Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnlDetail">
                        <h4 class="card-title">Add Detail</h4>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="Label1" CssClass="control-label">Item Name <span class="text-danger">*</span></asp:Label>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtDName" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="Label2" CssClass="control-label">Qty <span class="text-danger">*</span></asp:Label>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtDQty" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="Label4" CssClass="control-label">Price <span class="text-danger">*</span></asp:Label>
                                    </div>
                                    <asp:TextBox runat="server" ID="txtDPrice" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:linkbutton runat="server" ID="btnSaveDetail" OnClick="btnSaveDetail_Click" OnClientClick="return ProcessConfirm()" CssClass="btn btn-success"><i class="fa fa-check"></i> Save</asp:linkbutton>
                                <asp:linkbutton runat="server" ID="btnKembali2" CausesValidation="false" cssclass="btn btn-warning"><i class="fa fa-times"></i> Back</asp:linkbutton>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../Content/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../Content/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../Content/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../Content/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../Content/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../Content/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../Content/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../Content/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="../Content/js/custom.min.js"></script>
    <!-- This is data table -->
    <script src="../Content/assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

    <!-- end - This is for export functionality only -->
    <script>
        $(document).ready(function () {
            $('#gvList').DataTable({
                "searching": false
            });
        });
    </script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../Content/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

</asp:Content>
