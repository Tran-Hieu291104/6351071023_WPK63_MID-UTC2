<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucManageProduct.ascx.cs" Inherits="de1.UserControl.ucManageProduct" %>
<style type="text/css">
    .auto-style1 {
        height: 34px;
    }
</style>
<table style="width: 100%">
    <tr>
        <td class="auto-style1">Product name:</td>
        <td class="auto-style1">
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Tên khóa chưa được nhập"></asp:RequiredFieldValidator>
        </td>
        <td class="auto-style1"></td>
    </tr>

    <tr>
        <td>Price:</td>
        <td>
            <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPrice" ErrorMessage="Thời lượng khóa chưa được nhập"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td>Category:</td>
        <td>
            <asp:DropDownList ID="DropDownListCategory" runat="server"></asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td>Description:</td>
        <td>
            <asp:TextBox ID="TextBoxDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="Mô tả khóa học chưa được nhập"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td>Picture:</td>
        <td>
            <asp:FileUpload ID="FileUploadPicture" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUploadPicture" ErrorMessage="Hình ảnh chưa được nhập"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="ButtonAddNew" runat="server" Text="Add new" OnClick="ButtonAddNew_Click" />-
        </td>

    </tr>
</table>

<hr />

<asp:GridView ID="GridViewProducts" AllowPaging="true" PageSize="5"  AutoGenerateColumns="false" runat="server" OnRowCommand="GridViewProducts_RowCommand" OnPageIndexChanging="GridViewProducts_PageIndexChanging" DataKeyNames="id">
<Columns>
    <asp:TemplateField HeaderText="No.">
        <ItemTemplate>
            <%# Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Picture">
        <ItemTemplate>
            <asp:Image runat="server" ID="imageProduct" ImageUrl='<%# "~/images/Courses/" + Eval("ImageFilePath") %>' Width="100px" Height="100px" />
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Name">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" Text='<%# Eval("Name")%>' Target="_blank" runat="server" NavigateUrl='<%# "~/Details.aspx?id="+Eval("id") %>'></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>
        <ItemTemplate>
            <asp:Button runat="server" OnClientClick="return confirm('Do you really want to delete this product?');" ID="DeleteButton" Text="Delete" CommandName="DeleteProduct" CommandArgument='<%# Eval("id") %>'/>
        </ItemTemplate>
    </asp:TemplateField>


        <asp:TemplateField>
    <ItemTemplate>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditProduct" CommandArgument='<%# Eval("id") %>' />
    </ItemTemplate>
</asp:TemplateField>
</Columns>


</asp:GridView>

<hr />
<asp:Panel ID="pnlEditProduct" runat="server" Visible="false">
    <asp:Label ID="lblProductId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:TextBox ID="txtEditProductName" runat="server" placeholder="Product Name"></asp:TextBox>
    <asp:TextBox ID="txtEditProductPrice" runat="server" placeholder="Product Price"></asp:TextBox>
    <asp:TextBox ID="txtEditProductDescription" runat="server" placeholder="Product Description"></asp:TextBox>
    <asp:DropDownList ID="dpEditProductCategory" runat="server"></asp:DropDownList>
    <asp:FileUpload ID="fulEditImageProduct" runat="server" />
    <asp:Button ID="btnUpdateProduct" runat="server" Text="Update" OnClick="btnUpdateProduct_Click" />
    <asp:Button ID="btnCancelUpdate" runat="server" Text="Cancel" OnClick="btnCancelUpdate_Click" />
</asp:Panel>
