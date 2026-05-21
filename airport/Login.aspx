<%@ Page
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="airport.Login" %>



<asp:Content
    ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        body {
            background: #f5f7fb;
        }

        .login-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            width: 400px;
            padding: 35px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,.1);
        }

        .btn-login {
            width: 100%;
        }
    </style>

</asp:Content>




<asp:Content
    ID="MainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">



    <div class="login-container">

        <div class="login-card">


            <h2 class="text-center mb-4">Staff Login

</h2>



            <asp:Label
                ID="lblEmail"
                runat="server"
                Text="Email"
                CssClass="form-label">

</asp:Label>



            <asp:TextBox
                ID="txtEmail"
                runat="server"
                CssClass="form-control"
                placeholder="Enter email">

</asp:TextBox>



            <br />



            <asp:Label
                ID="lblPassword"
                runat="server"
                Text="Password"
                CssClass="form-label">

</asp:Label>



            <asp:TextBox
                ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="form-control"
                placeholder="Enter password">

</asp:TextBox>



            <br />



            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="btn btn-primary btn-login"
                OnClick="btnLogin_Click" />



            <br />
            <br />



            <asp:Label
                ID="lblError"
                runat="server"
                CssClass="text-danger">

</asp:Label>



        </div>
    </div>



</asp:Content>
