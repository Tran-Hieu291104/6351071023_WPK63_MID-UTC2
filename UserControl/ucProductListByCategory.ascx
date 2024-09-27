<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductListByCategory.ascx.cs" Inherits="de1.UserControl.ucProductListByCategory" %>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="ProductListByCategoryEntityDataSource">
    
    
    <ItemTemplate>
        <div class="product_box">
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' CssClass=""></asp:Label><br />
            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# "~/images/Courses/" + Eval("ImageFilePath") %>' /><br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Duration") %>' CssClass=""></asp:Label><br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Details.aspx?id=" + Eval("id") %>' CssClass="">View Details</asp:HyperLink>
        </div>
    </ItemTemplate>

    <LayoutTemplate>
        <div style="" id="itemPlaceholderContainer" runat="server">
            <span runat="server" id="itemPlaceholder" />
        </div>

        <div class="pager">
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
    
</asp:ListView>


<asp:EntityDataSource ID="ProductListByCategoryEntityDataSource" runat="server" ConnectionString="name=QLKhoaHocEntities" DefaultContainerName="QLKhoaHocEntities" EnableFlattening="False" EntitySetName="Courses" EntityTypeFilter="Course" Include="Category" Where="it.Category.CatID=@CategoryID">
    <WhereParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="id" Type="Int32" />
    </WhereParameters>

</asp:EntityDataSource>
