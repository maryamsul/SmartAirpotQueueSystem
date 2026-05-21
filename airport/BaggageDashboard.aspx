<%@ Page Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="BoardingDashboard.aspx.cs"
    Inherits="airport.BoardingDashboard" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <!-- The page refreshes every 5 seconds -->
    <meta http-equiv="refresh" content="5">

    <style>
        .dashboard-title {
            margin-top: 120px;
            text-align: center;
        }

        .stat-card {
            border: none;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,.08);
        }

        .current-card {
            margin-top: 30px;
            border: none;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,.08);
            margin-bottom: 30px; /* Gives space below the card */
        }

        /* Enforces block layout so buttons don't float unexpectedly */
        .action-btn {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <h1 class="dashboard-title">Boarding Dashboard</h1>

        <div class="row mt-5">
            <div class="col-md-4 mb-3">
                <div class="card stat-card">
                    <h4>Waiting</h4>
                    <asp:Label ID="lblWaiting" runat="server" Text="0" CssClass="display-6" />
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card stat-card">
                    <h4>Serving</h4>
                    <asp:Label ID="lblServing" runat="server" Text="0" CssClass="display-6" />
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card stat-card">
                    <h4>Completed</h4>
                    <asp:Label ID="lblCompleted" runat="server" Text="0" CssClass="display-6" />
                </div>
            </div>
        </div>

        <div class="card current-card">
            <h3>Now Serving</h3>
            <p>Queue Number: <asp:Label ID="lblCurrent" runat="server" Text="-" style="font-weight:bold;" /></p>
            <p>Estimated Time: <asp:Label ID="lblTime" runat="server" Text="5 mins" /></p>
        </div>

        <div class="row mb-4">
            <div class="col-6">
                <asp:Button
                    ID="btnNext"
                    runat="server"
                    Text="Call Next Passenger"
                    CssClass="btn btn-primary action-btn"
                    OnClick="btnNext_Click" />
            </div>
            <div class="col-6">
                <asp:Button
                    ID="btnComplete"
                    runat="server"
                    Text="Complete Current"
                    CssClass="btn btn-success action-btn"
                    OnClick="btnComplete_Click" />
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    CssClass="table table-striped table-hover width-100">
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>