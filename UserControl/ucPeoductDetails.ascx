﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucPeoductDetails.ascx.cs" Inherits="de1.UserControl.ucPeoductDetails" %>
<asp:FormView ID="FormView1" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="ID" >
    <ItemTemplate>
        <div class="course_box">
            <asp:Image ID="ImageFilePath" runat="server" Width="100px" Height="100px" ImageUrl='<%# "~/images/Courses/" + Eval("ImageFilePath")%>' /><br />
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' CssClass="product_name"></asp:Label><br />
            <asp:Label ID="Label3" runat="server" Text='<%# "Category: " + Eval("Category.CatName") %>' /><br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Duration") + "mins" %>' CssClass="product_price"></asp:Label><br />
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>' /><br />
            <asp:Label ID="Label5" runat="server" Text='<%# "Numbers of course registrantion: " + Eval("NumViews") %>' />
        </div>

    </ItemTemplate>
</asp:FormView>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLKhoaHocEntities" DefaultContainerName="QLKhoaHocEntities" EnableFlattening="False" EntitySetName="Courses" EntityTypeFilter="Course" Include="Category" Where="it.ID = @Id">
    <WhereParameters>
        <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>
