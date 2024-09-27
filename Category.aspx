<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="de1.Category1" %>

<%@ Register Src="~/UserControl/ucProductListByCategory.ascx" TagPrefix="uc1" TagName="ucProductListByCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucProductListByCategory runat="server" id="ucProductListByCategory" />
</asp:Content>
