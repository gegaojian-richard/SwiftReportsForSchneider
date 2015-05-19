<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_login.aspx.cdcab7d2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    </head>
<body>
    <asp:Panel runat="server" ID="Background" style="left: 50%; position: absolute; width: 865px;height:630px;  margin-left: -432px;padding-top:30px;padding-bottom:30px; ">

    <form id="form1" runat="server">
     <asp:ImageButton ID="btnok" runat="server" ImageUrl="~/Conzerv/OK1.jpg" 
         
        
        style="top: 380px; left: 591px; position: absolute; height: 35px; width: 75px; " 
        onclick="btnok_Click" />
    <asp:Image ID="Image7" runat="server" ImageUrl="~/Conzerv/Logo.jpg" 
        
        
        style="top: 504px; left: 649px; position: absolute; height: 53px; width: 178px" />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Conzerv/Login.jpg" 
        
        
        style="top: 6px; left: 28px; position: absolute; height: 28px; width: 68px" />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/Conzerv/Face.jpg" 
        
        
        style="top: 168px; left: 19px; position: absolute; height: 200px; width: 151px" />
    <asp:Image ID="Image4" runat="server" ImageUrl="~/Conzerv/Online-Test-Cert.jpg" 
        
               
        
        style="top: 49px; left: 0px; position: absolute; height: 63px; width: 861px" />
    <asp:TextBox ID="txtsesa" runat="server" 
        
        
        style="top: 205px; left: 569px; position: absolute;  width: 258px" 
        Font-Names="Arial" Font-Size="Small"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtpassword" ErrorMessage="*" 
        
        style="top: 268px; left: 839px; position: absolute; height: 18px; width: 22px"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtsesa" ErrorMessage="*" 
        
        style="top: 208px; left: 840px; position: absolute; height: 16px; width: 22px"></asp:RequiredFieldValidator>
    <asp:Image ID="Image5" runat="server" ImageUrl="~/Conzerv/PW.jpg" 
        
        
        
        
        style="top: 261px; left: 404px; position: absolute; height: 34px; width: 140px" />
    <asp:Image ID="Image6" runat="server" ImageUrl="~/Conzerv/UN.jpg" 
        
        
        
        
        style="top: 199px; left: 401px; position: absolute; height: 34px; width: 140px" />
    <asp:TextBox ID="txtpassword" runat="server" 
        
        
        
        style="top: 265px; left: 570px; position: absolute;  width: 258px" 
        Font-Names="Arial" TextMode="Password"></asp:TextBox>
    <div id="tip" style="top:315px; left:492px; position:absolute;font-size:medium; width: 345px;color:blue;font-family:Arial">( Please use the SESA number and Windows session password to login ).</div>
    <asp:ImageButton ID="btncancel" runat="server" ImageUrl="~/Conzerv/Cancel.jpg" 
        
        style="top: 380px; left: 719px; position: absolute; height: 35px; width: 75px" 
        onclick="btncancel_Click" CausesValidation="False" />
    </form>
        <asp:Image ID="Image8" runat="server" ImageUrl="~/Conzerv/copyright.jpg" 
        
    style="bottom:6px; left: 6px; position: absolute; height: 61px; width: 861px" />
    </asp:Panel>

</body>
    </html>

