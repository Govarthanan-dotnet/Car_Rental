<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarBooking.aspx.cs" Inherits="Car_Rental.CarBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GP CarRental</title>
  
   <link rel="stylesheet" href="css/bootstrap.min.css"/>
   <link rel="stylesheet" href="css/scrollbar.css"/>
  
<script src="js/jquery.min.js"></script>
 <script src="js/popper.min.js"></script>
 <script src="js/bootstrap.bundle.min.js"></script>
 <script src="js/jquery-3.0.0.min.js"></script>
 <script src="js/plugin.js"></script>
     
 <script src="js/custom.js"></script>
 <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
     <style type="text/css">
    /* #Select1 {
         height: 13px;
     }*/
 </style>
</head>
<body style="background-color: #FFFF00">
    <form id="form1" runat="server" style="text-align: justify">
                    <header>
                 <div class="p-3 mb-2 bg-dark text-white">
           <nav class="navbar navbar-expand-lg ">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto ms-right" >
        
         <li class="nav-item">
          <a class="nav-link" href="CarBooking.aspx">CarBooking</a>
        </li>
          <li class="nav-item" style="padding-left: 800px">
          <a class="nav-link" href="Login.aspx">Logout</a>
        </li>
          </ul>
             </div>   
      </div>
</nav>
      </div>
        </header>
        <div style="padding-left: 1100px">
     
            </div>
        <br /><br />
    
              <h1 style="color: #00FF00; font-size: 70px; background-color: #FF00FF; width: 600px; margin-right: auto; margin-left: auto; text-align: center;">GP  Car  Rental</h1>
      <br />
        <div class="col"></div>
       <div style="margin-right: auto; margin-left: auto; padding-left: 200px;">
          <asp:GridView runat="server" ID="CarBookings" AutoGenerateSelectButton="True" Width="1200px" Height="198px" OnSelectedIndexChanged="CarBookings_SelectedIndexChanged" Font-Size="20px">
              <AlternatingRowStyle BackColor="Lime" />
              <EditRowStyle BackColor="Blue" />
              <EmptyDataRowStyle BackColor="#0066FF" />
              <FooterStyle BackColor="#3366FF" />
              <HeaderStyle BackColor="Red" />
              <SortedAscendingCellStyle BackColor="Black" />
              <SortedAscendingHeaderStyle BackColor="Black" />
          </asp:GridView>
      </div>
      <br /> <br />
      <div  style="padding-left: 200px">
      <asp:Label runat="server" Text="Name" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="150px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label runat="server" Text="Address" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="150px"></asp:Label>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label runat="server" Text="MobileNo" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="150px"></asp:Label> <br /><br />
      <asp:TextBox runat="server" ID="cust_name" BorderStyle="Solid" Font-Size="Medium" Height="30px" Width="200px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox runat="server" ID="cust_address" BorderStyle="Solid" Font-Size="Medium" Width="200px" Height="30px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox runat="server" ID="cust_mob" BorderStyle="Solid" Font-Size="Medium" Width="200px" Height="30px" MaxLength="10"></asp:TextBox>
 </div>
        <br />
      <div style="padding-left: 200px">
      <asp:Label runat="server" Text="Aadhar No" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="180px"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
      <asp:Label runat="server" Text="Plate No" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="150px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
      <asp:Label runat="server" Text="Brand" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="150px"></asp:Label><br /><br />
      <asp:TextBox runat="server" ID="aadharno" BorderStyle="Solid" Font-Size="Medium" Width="200px" Height="30px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox runat="server" ID="plateno" BorderStyle="Solid" Font-Size="Medium" Width="200px" Height="30px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:TextBox runat="server" ID="brand" BorderStyle="Solid" Font-Size="Medium" Width="200px" Height="30px" MaxLength="10"></asp:TextBox>
      </div>
  <br />
     <div style="padding-left: 200px; width: 1600px;">
     <asp:Label runat="server" Text="Rent Date" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="167px"></asp:Label>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
     <asp:Label runat="server" Text="Return Date" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="197px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
     <asp:Label runat="server" Text="Fees" Font-Size="35px" ForeColor="#0000CC" Height="50px" Width="115px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
     <asp:Label runat="server" Text="Status" Font-Size="35px" ForeColor="#0000CC" Width="114px" Height="50px"></asp:Label><br /><br />
     <input type ="date" runat="server" id="rentdate" height="30" style="border-color: #000000; font-size: medium; width: 200px; height: 30px;" width="200px" />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
     <input type ="date" runat="server" id="returndate" height="25px" style="font-size: medium; border-color: #000000; width: 200px; height: 30px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
      <asp:TextBox runat="server" ID="fees" BorderStyle="Solid" Font-Size="Medium" Width="200px" Height="30px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
         <asp:DropDownList runat="server" ID="status" BorderStyle="Solid" Font-Size="Medium" Height="30px" Width="150px">
         <asp:ListItem>Available</asp:ListItem>
         <asp:ListItem>Booking</asp:ListItem>
          </asp:DropDownList>
  </div>
          <br /> <br /> 
   <div style="padding-left: 600px">
    <asp:Button runat="server" class="btn btn-outline-danger" Text="Cancel" ID="cancel_btn" Font-Size="20px" Height="50px" Width="100px" OnClick="cancel_btn_Click" ForeColor="Black"></asp:Button>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button runat="server" class="btn btn-outline-success" Text="Book" ID="Booking_btn" Font-Size="20px" Height="50px" Width="85px" OnClick="submit_btn_Click" ForeColor="Black"></asp:Button>
    </div>
        <div>
        </div>
    </form>
</body>
</html>
