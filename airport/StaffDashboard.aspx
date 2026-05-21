<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffDashboard.aspx.cs" Inherits="airport.StaffDashboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">


    <style>
        .dashboard-title {
            margin-top: 120px;
            text-align: center;
        }

        .dashboard-card {
            border: none;
            border-radius: 25px;
            padding: 35px;
            box-shadow: 0 5px 20px rgba(0,0,0,.08);
            max-width: 500px;
            margin: auto;
        }

        .logout-btn {
            margin-top: 30px;
            width: 100%;
        }
    </style>

</asp:Content>



<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <h1 class="dashboard-title">Staff Dashboard</h1>

        <p class="text-center text-muted">
            Choose service area and counter
        </p>


        <div class="card dashboard-card">

            <asp:Label runat="server" Text="Service" CssClass="form-label"></asp:Label>

            <asp:DropDownList
                ID="ddlService"
                runat="server"
                CssClass="form-select"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlService_SelectedIndexChanged">

                <asp:ListItem Text="Select Service" Value=""></asp:ListItem>
                <asp:ListItem Text="Security" Value="Security"></asp:ListItem>
                <asp:ListItem Text="Boarding" Value="Boarding"></asp:ListItem>
                <asp:ListItem Text="Baggage Drop" Value="Check-in"></asp:ListItem>

            </asp:DropDownList>


            <br />


            <asp:Label runat="server" Text="Counter" CssClass="form-label"></asp:Label>

            <asp:DropDownList
                ID="ddlCounter"
                runat="server"
                CssClass="form-select">
            </asp:DropDownList>


            <br />


            <asp:Button
                ID="btnOpen"
                runat="server"
                Text="Open Dashboard"
                CssClass="btn btn-primary w-100"
                OnClick="btnOpen_Click" />


            <asp:Button
                ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="btn btn-danger logout-btn"
                OnClick="btnLogout_Click" />

        </div>

    </div>

</asp:Content>
