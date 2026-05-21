<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Display.aspx.cs" Inherits="airport.Display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ================= NAVBAR ================= */

:root {
    --primary-blue: #0052cc;
    --accent-gold: #ffca28;
    --boarding-teal: #0d9488;
}

.navbar {
    background: rgba(255, 255, 255, 0.85) !important;
    backdrop-filter: blur(16px);
    border-bottom: 1px solid rgba(0,0,0,0.06);
    transition: 0.3s ease;
}

/* NAVBAR BUTTONS */

.navbar .btn {
    border-radius: 999px;
    padding: 8px 16px;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.3px;
    transition: all 0.25s ease;
    border: 1px solid transparent;
}

/* TAKE TICKET */

.navbar .btn-outline-primary {
    background: rgba(0, 82, 204, 0.08);
    border: 1px solid rgba(0, 82, 204, 0.25);
    color: var(--primary-blue);
}

.navbar .btn-outline-primary:hover {
    background: var(--primary-blue);
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(0, 82, 204, 0.25);
}

/* LIVE DISPLAY */

.navbar .btn-outline-dark {
    background: rgba(0,0,0,0.04);
    border: 1px solid rgba(0,0,0,0.12);
    color: #111827;
}

.navbar .btn-outline-dark:hover {
    background: #111;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.2);
}

/* STAFF LOGIN */

.navbar .btn-primary {
    background: linear-gradient(135deg, #0052cc, #2563eb);
    border: none;
    color: white;

    box-shadow:
        0 6px 15px rgba(0, 82, 204, 0.25);
}

.navbar .btn-primary:hover {

    background: linear-gradient(135deg, #0047b3, #1d4ed8);

    transform: translateY(-2px);

    box-shadow:
        0 10px 22px rgba(0, 82, 204, 0.35);
}
        body {
            background-color: #f8fafc;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
            color: #1e293b;
        }

        /* Modernized Header */
        .display-header {
background: linear-gradient(135deg, #1e293b, #3b82f6);
color: white;
            padding: 50px 20px;
            border-radius: 0 0 32px 32px;
            text-align: center;
            margin-bottom: 40px;
            margin-top: 60px;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.15);
        }

        .display-header h1 {
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .live-clock {
            font-size: 1.1rem;
            font-weight: 500;
            background: rgba(255, 255, 255, 0.1);
            display: inline-block;
            padding: 6px 16px;
            border-radius: 50px;
            margin-top: 15px;
            backdrop-filter: blur(4px);
            letter-spacing: 0.5px;
        }

        /* Smooth Status Cards */
        .status-card {
            background: white;
            border-radius: 24px;
            padding: 24px;
            text-align: center;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 10px 15px -3px rgba(0, 0, 0, 0.03);
            transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275), box-shadow 0.3s ease;
            height: 100%;
            border: 1px solid rgba(226, 232, 240, 0.8);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .status-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        /* Standardized Image Aspect Ratios */
        .image-box {
            width: 100%;
            height: 160px;
            overflow: hidden;
            border-radius: 14px;
            margin-bottom: 20px;
            position: relative;
            background-color: #f1f5f9;
        }

        .image-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .status-card:hover .image-box img {
            transform: scale(1.05);
        }

        .category-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        /* Main Counter Box */
        .now-serving-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            padding: 20px 15px;
            margin-bottom: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .ticket-label {
            display: block;
            font-size: 0.75rem;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 5px;
        }

        /* High Performance CSS Glow/Pulse Pulse */
        .ticket-number {
            font-size: 4.5rem;
            font-weight: 900;
            color: #2563eb;
            line-height: 1;
            margin: 10px 0;
            display: inline-block;
            animation: gentlePulse 2s infinite ease-in-out;
            letter-spacing: -1px;
        }

        @keyframes gentlePulse {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.03); opacity: 0.95; }
        }

        /* Queue Details Grid */
        .queue-details {
            border-top: 1px solid #f1f5f9;
            padding-top: 20px;
            text-align: left;
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 0.95rem;
        }

        .detail-item:last-child {
            margin-bottom: 0;
        }

        .detail-label {
            color: #64748b;
            font-weight: 500;
        }

        .detail-value {
            font-weight: 700;
            color: #0f172a;
        }

        /* Status Colors using modern UI palettes */
        .wait-high { color: #ef4444; background: #fef2f2; padding: 2px 8px; border-radius: 6px; }
        .wait-medium { color: #f59e0b; background: #fffbeb; padding: 2px 8px; border-radius: 6px; }
        .wait-low { color: #10b981; background: #ecfdf5; padding: 2px 8px; border-radius: 6px; }

        .footer-note {
            text-align: center;
            margin: 50px 0 30px;
            color: #94a3b8;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }
    </style>

    <script type="text/javascript">
        function updateClock() {
            var now = new Date();
            var options = { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' };
            var clockEl = document.getElementById("clock");
            if (clockEl) {
                clockEl.innerHTML = now.toLocaleDateString('en-US', options);
            }
        }
        setInterval(updateClock, 1000);

        // ASP.NET AJAX Compatible Page Load handler
        function pageLoad() {
            updateClock();
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <!-- HEADER -->
    <div class="display-header">
        <h1>✈ SkyQueue Live Monitor</h1>
        <p>Please proceed to your assigned station when your ticket number is called</p>
        <div id="clock" class="live-clock">Loading live updates...</div>
    </div>

    <!-- MAIN INTERFACE -->
    <div class="container">
        <div class="row g-4">

            <!-- BAGGAGE DROP -->
            <div class="col-md-4">
                <div class="status-card">
                    <div class="category-title">
                        <i class="fa-solid fa-luggage-cart text-primary"></i> Baggage Drop
                    </div>
                    
                    <div class="now-serving-box">
                        <div class="image-box">
                            <img src="https://www.etihad.com/content/dam/eag/etihadairways/etihadcom/2025/global/products/manage/manage-check-in-airport-self-service-kiosks.jpg" alt="Baggage Drop" />
                        </div>
                        <span class="ticket-label">Now Serving</span>
                        
                        <!-- Update Panel prevents background flash refreshes -->
                        <asp:UpdatePanel ID="upBaggage" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <span class="ticket-number">
                                    <asp:Label ID="lblBaggageCurrent" runat="server" Text="B102"></asp:Label>
                                </span>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerRefresh" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

                    <div class="queue-details">
                        <asp:UpdatePanel ID="upBaggageDetails" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="detail-item">
                                    <span class="detail-label">Next Ticket</span>
                                    <span class="detail-value">
                                        <asp:Label ID="lblBaggageNext" runat="server" Text="B103"></asp:Label>
                                    </span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Est. Wait Time</span>
                                    <span class="detail-value wait-high">
                                        <asp:Label ID="lblBaggageWait" runat="server" Text="18 Mins"></asp:Label>
                                    </span>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerRefresh" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <!-- SECURITY CHECK -->
            <div class="col-md-4">
                <div class="status-card">
                    <div class="category-title">
                        <i class="fa-solid fa-user-shield text-primary"></i> Security
                    </div>
                    
                    <div class="now-serving-box">
                        <div class="image-box">
                            <img src="https://tse1.mm.bing.net/th/id/OIP.duvy-HPyawDsnEnHrCD3awHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Security Check" />
                        </div>
                        <span class="ticket-label">Now Serving</span>
                        
                        <asp:UpdatePanel ID="upSecurity" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <span class="ticket-number">
                                    <asp:Label ID="lblSecurityCurrent" runat="server" Text="S205"></asp:Label>
                                </span>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerRefresh" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

                    <div class="queue-details">
                        <asp:UpdatePanel ID="upSecurityDetails" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="detail-item">
                                    <span class="detail-label">Next Ticket</span>
                                    <span class="detail-value">
                                        <asp:Label ID="lblSecurityNext" runat="server" Text="S206"></asp:Label>
                                    </span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Est. Wait Time</span>
                                    <span class="detail-value wait-medium">
                                        <asp:Label ID="lblSecurityWait" runat="server" Text="9 Mins"></asp:Label>
                                    </span>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerRefresh" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <!-- BOARDING -->
            <div class="col-md-4">
                <div class="status-card">
                    <div class="category-title">
                        <i class="fa-solid fa-plane-departure text-primary"></i> Boarding
                    </div>
                    
                    <div class="now-serving-box">
                        <div class="image-box">
                            <img src="https://tse4.mm.bing.net/th/id/OIP.KTKc2_lYWY0sfnEwy4YILAHaEK?r=0&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Boarding Check" />
                        </div>
                        <span class="ticket-label">Now Serving</span>
                        
                        <asp:UpdatePanel ID="upBoarding" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <span class="ticket-number">
                                    <asp:Label ID="lblBoardingCurrent" runat="server" Text="P320"></asp:Label>
                                </span>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerRefresh" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

                    <div class="queue-details">
                        <asp:UpdatePanel ID="upBoardingDetails" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="detail-item">
                                    <span class="detail-label">Next Ticket</span>
                                    <span class="detail-value">
                                        <asp:Label ID="lblBoardingNext" runat="server" Text="P321"></asp:Label>
                                    </span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Est. Wait Time</span>
                                    <span class="detail-value wait-low">
                                        <asp:Label ID="lblBoardingWait" runat="server" Text="3 Mins"></asp:Label>
                                    </span>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="TimerRefresh" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

        </div>

        <!-- Hidden Background Timer for smooth async data fetching (Interval in Milliseconds: 15000 = 15s) -->
<!-- Move your timer inside a dedicated UpdatePanel at the bottom -->
<asp:UpdatePanel ID="upTimer" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Timer ID="TimerRefresh" runat="server" Interval="30000" OnTick="TimerRefresh_Tick" />
    </ContentTemplate>
</asp:UpdatePanel>
        <!-- FOOTER -->
        <div class="footer-note">
            SkyQueue Airport Management System &copy; 2026
        </div>
    </div>
</asp:Content>