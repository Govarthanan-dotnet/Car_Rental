<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Car.aspx.cs" Inherits="Car_Rental.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color: #00FFFF">
          <h1 style="color: #00FF00; font-size: 70px; background-color: #FF00FF; text-align: center; width: 700px; margin-right: auto; margin-left: auto;">GP  Car  Rental</h1>
   <div class="container-fluid"></div>
     <div class ="row"> </div>  
     <h1 style="color: #FF0000; z-index: 1; left: 10px; top: 231px;height: 96px; width: 1040px; padding-left: 700px; font-size: 50px;">Manage Cars</h1>
  
    <div style="padding-left: 70px">
         <asp:GridView runat="server" ID="CarList" AutoGenerateSelectButton="True"  class ="table table-hover" Width="1300px" Height="198px" OnSelectedIndexChanged="CarList_SelectedIndexChanged">
         <AlternatingRowStyle BackColor="Lime" />
 <EditRowStyle BackColor="Blue" />
              <HeaderStyle BackColor="Red" />
      </asp:GridView>
    </div>
             
        <div class="col"> </div>
     <div style="padding-left: 15px;"><br />
     <asp:Label runat="server" Text="Plate Number" BorderStyle="None" Font-Size="XX-Large" ForeColor="#0000CC"></asp:Label><br /><br />
     <asp:TextBox runat="server" ID="plate_number" BorderStyle="Solid" Font-Size="Medium" Height="40px" Width="220px"></asp:TextBox>
   </div><br />
 <div style="padding-left: 15px">
     <asp:Label runat="server" Text="Brand" Font-Size="XX-Large" ForeColor="#0000CC"></asp:Label><br /><br />
     <asp:TextBox runat="server" ID="brand" BorderStyle="Solid" Font-Size="Medium" Width="220px" Height="40px"></asp:TextBox>
 </div><br /><br />
   <div style="padding-left: 15px;">
     <asp:Label runat="server" Text="Model" BorderStyle="None" Font-Size="XX-Large" ForeColor="#0000CC"></asp:Label><br /><br />
     <asp:TextBox runat="server" ID="model" BorderStyle="Solid" Font-Size="Medium" Height="40px" Width="220px"></asp:TextBox>
 </div><br />
 <div style="padding-left: 15px">
     <asp:Label runat="server" Text="Price" Font-Size="XX-Large" ForeColor="#0000CC"></asp:Label><br /><br />
     <asp:TextBox runat="server" ID="price" BorderStyle="Solid" Font-Size="Medium" Width="220px" Height="40px"></asp:TextBox>
  </div><br />
   <div style="padding-left: 15px">
     <asp:Label runat="server" Text="Status" Font-Size="XX-Large" ForeColor="#0000CC"></asp:Label><br /><br />
     <asp:DropDownList runat="server" ID="available" Font-Size="Medium" Height="40px" Width="220px">
        <asp:ListItem>Available</asp:ListItem>
        <asp:ListItem>Booking</asp:ListItem>
     </asp:DropDownList>
  </div>    <br /> <br />
   <div style="padding-left: 30px; word-spacing: 40px">
     <asp:Button runat="server" class="btn btn-outline-warning" Text="Update" ID="update_btn" Font-Size="20px" Height="50px" Width="100px" OnClick="update_btn_Click" ></asp:Button>
     <asp:Button runat="server" class="btn btn-outline-success" Text="Add" ID="save_btn" Font-Size="20px" Height="50px" Width="100px" OnClick="save_btn_Click" ></asp:Button>
     <asp:Button runat="server" class="btn btn-outline-danger" Text="Delete" ID="delete_btn" Font-Size="20px" Height="50px" Width="100px" OnClick="delete_btn_Click" ></asp:Button>
   </div>
   
 </div>  
</asp:Content>
