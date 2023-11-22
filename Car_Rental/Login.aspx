
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Car_Rental.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GP_CarRental</title>
    <link rel="stylesheet" href="css/style.css" />
    
</head>
<body>
    
      <div>
      <section style="padding: 0px; color: #000000; background-color: #333333; background-repeat: no-repeat; background-attachment: fixed; text-align: center; width: 1710px; height: 600px; top: 0px; bottom: 0px; right: 0px; left: 0px; margin-top: 1px; background-image: url('img/bg.jpg');" >
      <div class="container">
      <h1 style="padding: 60px; color: #00FF00; font-weight: bold; font-size: 80px; text-align: center;">GP Car Rental in Chennai</h1>
      <h3 style="padding: 60px; color: #00FF00; font-weight: bold; font-size: 40px; text-align: center;">Great deals at great prices, from the biggest car rental companies</h3>
    </div>
 </section>
</div>
     <form id="form1" runat="server" onsubmit="return validateForm()" method="post">
     <section style="text-align: center">
     <div class="container">
     <div style="border-style: solid; width: 500px; height: 500px; text-align: center; background-color: #FF00FF; margin-left: 30%;">
     <h1 style="font-size: 40px; padding-top: 35px;"> Login Form</h1><br /><br />
     <div style="font-size: 22px">
     <asp:Label runat="server" Text="Email"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
     <asp:TextBox runat="server" ID="email" BorderStyle="Solid" Font-Size="20px" Height="30px" Width="220px"  ></asp:TextBox><br /><br /> <br />
     <asp:Label runat="server" Text="Password"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:TextBox runat="server" ID="password" BorderStyle="Solid" Font-Size="20px" TextMode="Password" Height="30px" Width="220px" ></asp:TextBox><br /><br /> <br /><br />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button runat="server" Text="Login" ID="login_btn" BackColor="#66FFFF" BorderColor="Black" Height="50px" Width="99px" Font-Size="30px" OnClick="login_btn_Click2"></asp:Button>
   </div>
   </div>
     </div>   
   </section>
          </form>
<section style="background-color: #333333; height: 300px; padding-left: 100px; padding-right: 100px;">
     <div class="container">
         <h2 style="color: #FFFFFF; text-align: center; padding-top: 90px;">(+91) 1234567890</h2>
         </div>
</section>
    <script>
        function validateForm() {
            var email = document.getElementById('email').value;
           
            var password = document.getElementById('password').value;
            if (email == "") {
                alert('Please enter a Email');
                return false;
            }

            if (password == "") {
                alert('Please enter a Password');
                return false;
            }
            if (password.length < 5) {
                alert('Password atleast 6 character');
                return false;
            }
           
            else {
                alert('Login Successfully');
                
            }
           
        }
    </script>
</body>
</html>
