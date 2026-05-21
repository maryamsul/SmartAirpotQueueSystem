<%@ Page Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="SecurityDashboard.aspx.cs"
    Inherits="airport.SecurityDashboard" %>

<asp:Content
    ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

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
        }

        /* FIX: same button style as BoardingDashboard */
        .action-btn {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
        }
    </style>

</asp:Content>

<asp:Content
    ID="MainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="container">

        <h1 class="dashboard-title">Security Dashboard</h1>

        <!-- statistics -->
        <div class="row mt-5">

            <div class="col-md-4">
                <div class="card stat-card">
                    <h4>Waiting</h4>
                    <asp:Label ID="lblWaiting" runat="server" Text="0" CssClass="display-6" />
                </div>
            </div>

            <div class="col-md-4">
                <div class="card stat-card">
                    <h4>Serving</h4>
                    <asp:Label ID="lblServing" runat="server" Text="0" CssClass="display-6" />
                </div>
            </div>

            <div class="col-md-4">
                <div class="card stat-card">
                    <h4>Completed</h4>
                    <asp:Label ID="lblCompleted" runat="server" Text="0" CssClass="display-6" />
                </div>
            </div>

        </div>

        <!-- current ticket -->
        <div class="card current-card">
            <h3>Now Serving</h3>

            <p>
                Queue Number:
                <asp:Label ID="lblCurrent" runat="server" Text="-" />
            </p>

            <p>
                Estimated Time:
                <asp:Label ID="lblTime" runat="server" Text="5 mins" />
            </p>
        </div>

        <!-- queue table -->
        <asp:GridView
            ID="GridView1"
            runat="server"
            CssClass="table table-striped">
        </asp:GridView>

        <!-- FIXED BUTTON LAYOUT (same as BoardingDashboard) -->
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

    </div>

</asp:Content>