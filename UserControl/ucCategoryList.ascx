<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategoryList.ascx.cs" Inherits="de1.UserControl.ucCategoryList" %>
<asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" DataSourceID="DataListEntityDataSource">
    <ItemTemplate>
         <div>


            <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("CatName") + "(" + Eval("Courses.Count") + ")" %>' NavigateUrl='<%# "~/Category.aspx?id=" + Eval("CatID") %>'></asp:HyperLink>
        </div>
    </ItemTemplate>
</asp:DataList>

<asp:EntityDataSource ID="DataListEntityDataSource" runat="server" ConnectionString="name=QLKhoaHocEntities" DefaultContainerName="QLKhoaHocEntities" EnableFlattening="False" EntitySetName="Categories" EntityTypeFilter="Category" Include="Courses"></asp:EntityDataSource>
