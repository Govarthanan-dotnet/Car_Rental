<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReturnedCars.aspx.cs" Inherits="Car_Rental.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color: #FF3399">
    <br /><br />
 <h1 style="color: #00FF00; font-size: 70px; background-color: #FF00FF; text-align: center; width: 700px; margin-left: auto; margin-right: auto;">&nbsp;GP  Car  Rental</h1>
    
<div>
 <h3 style="font-size: 40px; color: #FF0000; text-align: center">Returned Cars</h3>
    </div>
    <br /><br />
    <div style="padding-left: 800px">
        <asp:TextBox runat="server" ID="search" BorderColor="Black" BorderStyle="Solid" Font-Size="15px" Height="30px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" Text="Search" ID="Searh_btn" BackColor="Aqua" Font-Size="20px" ForeColor="#FF0066" OnClick="Unnamed1_Click"></asp:Button>
    </div><br />
        
    <div style="padding-left: 70px">
        <asp:GridView runat="server" Width="1300px" Height="150px" ID="ReturnedCars" OnSelectedIndexChanged="ReturnedCars_SelectedIndexChanged">
         <AlternatingRowStyle BackColor="Lime" />
         <EditRowStyle BackColor="Blue" />
         <FooterStyle BackColor="Lime" />
         <HeaderStyle BackColor="Red" />
             
            </asp:GridView>
    </div>
        
    

</asp:Content>
