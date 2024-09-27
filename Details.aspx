<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="de1.Details" %>

<%@ Register Src="~/UserControl/ucPeoductDetails.ascx" TagPrefix="uc1" TagName="ucPeoductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucPeoductDetails runat="server" id="ucPeoductDetails" />
</asp:Content>
