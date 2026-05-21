<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="airport.Ticket" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>SkyQueue Ticket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial;
            background: #edf3f9;
        }

        /* NAVBAR */
        .navbar {
            height: 64px;
            background: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            box-shadow: 0 2px 14px rgba(0,0,0,0.08);
        }

        /* 🔵 CLICKABLE LOGO FIX */
        .logo a {
            font-size: 22px;
            font-weight: bold;
            color: #0066d9;
            text-decoration: none;
        }

        .nav-text {
            font-size: 14px;
            color: #64748b;
        }

        /* PAGE */
        .page {
            display: flex;
            justify-content: center;
            padding: 40px 15px;
        }

        .dashboard {
            width: 520px;
            background: #fff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        }

        /* HEADER */
        .header {
            text-align: center;
            margin-bottom: 10px;
        }

        h2 { margin: 0; }

        .subtitle {
            color: #64748b;
            font-size: 14px;
        }

        /* SIMPLE ERROR TEXT ONLY (NO BOX) */
        .error-text {
            color: #dc2626;
            font-size: 13px;
            margin-top: 10px;
        }

        /* ACTIVE TICKET BOX ONLY */
        .ticket-alert {
            background: #eef2ff;
            border: 1px solid #c7d2fe;
            padding: 12px;
            border-radius: 10px;
            margin-top: 12px;
            color: #1e3a8a;
        }

        /* BIG TICKET CENTER FIX */
        .ticket-wrapper {
            text-align: center;
            margin-top: 25px;
        }

        .now-label {
            font-size: 12px;
            font-weight: bold;
            color: #64748b;
        }

        .now {
            font-size: 72px;
            font-weight: bold;
            color: #0066d9;
            margin: 10px 0 20px 0;
        }

        /* INFO */
        .panel {
            background: #f8fafc;
            border: 1px solid #e5edf5;
            border-radius: 10px;
            padding: 18px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e5edf5;
        }

        .row:last-child { border: none; }

        .label { color: #64748b; font-weight: bold; }

        .value { font-weight: bold; }

        /* BUTTONS */
        .actions {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        .btn {
            width: 220px;
            padding: 12px;
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-primary {
            background: #0066d9;
        }

        .btn-primary:hover {
            background: #0052b3;
        }

        .btn-danger {
            background: #64748b;
        }

        .btn-danger:hover {
            background: #475569;
        }

        @media(max-width:700px){
            .dashboard { width: 100%; }
            .btn { width: 100%; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="logo">
            <a href="Default.aspx">SkyQueue</a>
        </div>
        <div class="nav-text">Passenger Ticket Portal</div>
    </div>

    <div class="page">
        <div class="dashboard">

            <!-- HEADER -->
            <div class="header">
                <h2>SkyQueue Ticket</h2>
                <p class="subtitle">Smart Airport Queue System</p>

                <!-- ACTIVE TICKET ONLY -->
              <asp:Panel ID="pnlActiveTicket" runat="server" Visible="false" CssClass="ticket-alert">

            <div style="margin-bottom:10px;">
                <asp:Label ID="lblActiveTicket" runat="server" />
            </div>

            <div>
                <asp:Label ID="Label1" runat="server" CssClass="error-message-badge" />
            </div>

            <div style="margin-top:12px;">
                <asp:Button ID="btnCancelTicket" runat="server"
                    Text="Cancel Ticket"
                    CssClass="btn btn-danger"
                    OnClick="btnCancelTicket_Click" />
            </div>

        </asp:Panel>

                <!-- ERROR TEXT ONLY (NO BOX) -->
                <asp:Label ID="lblError" runat="server" CssClass="error-text" />
            </div>

            <!-- BIG TICKET CENTERED -->
            <div class="ticket-wrapper">
                <div class="now-label">Your Queue Number</div>
                <asp:Label ID="lblTicket" runat="server" CssClass="now" Text="---"></asp:Label>
            </div>

            <!-- INFO -->
            <div class="panel">
                <div class="row">
                    <span class="label">Service Type</span>
                    <span class="value">
                        <asp:Label ID="litService" runat="server" />
                    </span>
                </div>

                <div class="row">
                    <span class="label">Estimated Wait</span>
                    <span class="value">
                        <asp:Label ID="litWait" runat="server" />
                    </span>
                </div>

                <div class="row">
                    <span class="label">Issued</span>
                    <span class="value"><%= DateTime.Now.ToString("hh:mm tt") %></span>
                </div>
            </div>

            <!-- ACTION -->
            <div class="actions">
                <asp:Button ID="btnAction" runat="server"
                    Text="Print Ticket"
                    CssClass="btn btn-primary"
                    OnClick="btnAction_Click" />

                <p style="font-size:13px;color:#64748b;">
                    Thank you for using SkyQueue
                </p>
            </div>

        </div>
    </div>

</form>
</body>
</html>