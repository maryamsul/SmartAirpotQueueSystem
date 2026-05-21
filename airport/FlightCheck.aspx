<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlightCheck.aspx.cs" Inherits="airport.FlightCheck" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Flight Verification - SkyQueue</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #edf3f9;
            color: #1f2937;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            height: 64px;
            background: #ffffff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 56px;
            box-shadow: 0 2px 14px rgba(15, 23, 42, 0.08);
            width: 100%;
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
            color: #0066d9;
        }

        .nav-text {
            font-size: 14px;
            color: #64748b;
        }

        .page {
            min-height: calc(100vh - 64px);
            padding: 34px 18px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dashboard {
            width: min(550px, 100%);
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 10px 34px rgba(15, 23, 42, 0.13);
        }

        .header {
            border-bottom: 1px solid #e5edf5;
            padding-bottom: 16px;
            margin-bottom: 24px;
            text-align: center;
        }

        h2 {
            margin: 0 0 8px;
            font-size: 26px;
            color: #0f172a;
        }

        .subtitle {
            margin: 0;
            color: #64748b;
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }

        .input-label {
            font-size: 13px;
            color: #64748b;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 8px;
            letter-spacing: 0.5px;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            color: #1e293b;
            background-color: #f8fafc;
            transition: border-color 0.2s, background-color 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: #0066d9;
            background-color: #ffffff;
        }

        .message-alert {
            display: block;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
            font-weight: 500;
        }
        
        .message-alert:empty {
            display: none;
        }

        .actions {
            display: flex;
            flex-direction: column;
            gap: 12px;
            align-items: center;
            margin-top: 24px;
        }

        .btn {
            width: 100%;
            max-width: 240px;
            padding: 12px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            color: #ffffff;
            background-color: #0066d9;
            font-weight: bold;
            font-size: 14px;
            text-align: center;
            transition: background-color 0.2s;
        }

        .btn:hover {
            background-color: #0052ad;
        }

        .footer-text {
            font-size: 13px;
            color: #64748b;
            text-align: center;
            margin: 0;
        }

        @media (max-width: 760px) {
            .navbar {
                height: auto;
                gap: 6px;
                align-items: flex-start;
                flex-direction: column;
                padding: 16px 20px;
            }

            .dashboard {
                padding: 22px 16px;
            }
            
            .btn {
                width: 100%;
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

   <!-- NAVBAR HEADER -->
    <div class="navbar">
        <a href="Default.aspx" class="logo" style="text-decoration: none;">SkyQueue</a>
        <div class="nav-text">Flight Verification</div>
    </div>

    <div class="page">
        <div class="dashboard">
            
            <div class="header">
                <h2>Verify Flight</h2>
                <p class="subtitle">Please enter your details to verify your booking status</p>
            </div>

            <form id="form1" runat="server">

                <div class="form-group">
                    <label class="input-label" for="txtFlightNumber">Enter Flight Number</label>
                    <asp:TextBox ID="txtFlightNumber" runat="server" CssClass="form-control" placeholder="ex., QR301" />
                </div>
                <div class="actions">
                    <asp:Button ID="btnCheck" runat="server" Text="Verify Flight" CssClass="btn" OnClick="btnCheck_Click" />
                </div>

                <!-- Success  -->
                <asp:Label ID="lblMessage" runat="server" CssClass="message-alert" />

                <!-- STEP 2 the hidden box field -->
                <asp:Panel ID="pnlFlightCode" runat="server" Visible="false">
                    <hr style="margin:20px 0;border:1px solid #e5edf5;" />
                    
                    <div class="form-group">
                        <label class="input-label">Enter Flight Code</label>
                        <asp:TextBox ID="txtFlightCode" runat="server" CssClass="form-control" placeholder="e.g., FLIGHT-AX91" />
                    </div>

                    <div class="actions">
                        <asp:Button ID="btnContinue" runat="server" Text="Continue" CssClass="btn" OnClick="btnContinue_Click" />
                    </div>
                </asp:Panel>

            </form>

        </div>
    </div>

</body>
</html>