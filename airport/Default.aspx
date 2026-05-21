<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs"  Inherits="airport.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
 :root {
    --primary-blue: #0052cc;
    --accent-gold: #ffca28;
    --boarding-teal: #0d9488;
}

body {
    background: #f0f2f5;
    font-family: 'Inter', -apple-system, sans-serif;
}

.navbar {
    background: rgba(255, 255, 255, 0.85) !important;
    backdrop-filter: blur(16px);
    border-bottom: 1px solid rgba(0,0,0,0.06);
    transition: 0.3s ease;
}

.navbar .btn {
    border-radius: 999px;
    padding: 8px 16px;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.3px;
    transition: all 0.25s ease;
    border: 1px solid transparent;
}

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

.navbar .btn-outline-dark {
    background: rgba(0,0,0,0.04);
    border: 1px solid rgba(0,0,0,0.12);
}

.navbar .btn-outline-dark:hover {
    background: #111;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.2);
}

.navbar .btn-primary {
    background: linear-gradient(135deg, #0052cc, #2563eb);
    border: none;
    box-shadow: 0 6px 15px rgba(0, 82, 204, 0.25);
}

.navbar .btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 22px rgba(0, 82, 204, 0.35);
}

.hero {
    position: relative;
    width: 100%;
    min-height: 70vh;

    display: flex;
    align-items: center;
    justify-content: flex-start; /* ADD THIS */
    color: white;

    background: url('https://media.cntraveler.com/photos/56ccd80793a5257460572d8b/16:9/w_1280,c_limit/airport-check-in-lufthansa-frankfurt.jpg')
        center/cover no-repeat;

    overflow: hidden;
}
.hero::before { 
    content: "";
    position: absolute; 
    inset: 0;
    background: linear-gradient( 120deg, rgba(0, 82, 204, 0.78), rgba(0, 0, 0, 0.45) );

}
.hero-content {
    position: relative;
    z-index: 2;
    max-width: 750px;
    animation: fadeUp 0.8s ease-out;

    text-align: left;
    align-items: flex-start;

    margin-left: 60px; /* optional: pushes it nicely from edge */
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(18px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.service-card {
    background: white;
    border-radius: 28px;
    padding: 40px 25px;
    text-align: center;

    box-shadow: 0 10px 30px rgba(0,0,0,0.06);
    transition: all 0.3s ease;

    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.service-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 20px 45px rgba(0,0,0,0.12);
}

.icon-circle {
    width: 72px;
    height: 72px;
    margin: 0 auto 20px;

    border-radius: 18px;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 1.8rem;
    transition: 0.3s ease;
}

.checkin-icon {
    background: #eff6ff;
    color: #2563eb;
}
.security-icon {
    background: #eff6ff;
    color: #2563eb;
    box-shadow: 0 8px 20px rgba(37, 99, 235, 0.15);
}

.boarding-icon {
    background: #eff6ff;
    color: #2563eb;
    box-shadow: 0 8px 20px rgba(37, 99, 235, 0.15);
}

.service-card:hover .icon-circle {
    transform: scale(1.08);
}

.btn-action {
    border-radius: 12px;
    padding: 12px;
    font-weight: 700;
    text-transform: uppercase;
    font-size: 0.85rem;
    width: 100%;
    border: none;
}

.btn-boarding {
    background: var(--boarding-teal) !important;
    color: white !important;
}

section.container {
    margin-top: -70px;
    position: relative;
    z-index: 5;
}
    </style>
<section class="hero">
    <div class="container hero-content">
        <h1 class="display-4 fw-bold">Seamless <span style="color:#ffca28">Journeys</span> <br /> Start Here </h1>
        <p class="lead opacity-75">Don't stand in line. Secure your digital spot and enjoy the airport lounges while we hold your place.</p>
    </div>
</section>

<section class="container" style="margin-top:-80px; position:relative; z-index:5;">
    <div class="row g-4">

        <div class="col-md-4">
            <div class="service-card">
                <div>
                    <div class="icon-circle checkin-icon">
                        <i class="fa-solid fa-luggage-cart"></i>
                    </div>
                    <h4>Baggage Drop</h4>
                    <p class="text-muted small">Bag Drop & Check-in </p>
                </div>

              <asp:Button ID="btnCheckin" runat="server"
    Text="Take Ticket"
    CssClass="btn btn-primary btn-action mt-3"
      OnClick="btnCheckin_Click" />
            </div>
        </div>

        <!-- SECURITY -->
        <div class="col-md-4">
            <div class="service-card">
                <div>
                    <div class="icon-circle security-icon">
                        <i class="fa-solid fa-user-shield"></i>
                    </div>
                    <h4>Security</h4>
                    <p class="text-muted small">Carry-on & Passenger Screening</p>
                </div>

               <asp:Button ID="btnSecurity" runat="server"
                Text="Take Ticket"
                CssClass="btn btn-primary btn-action mt-3"
                OnClick="btnSecurity_Click" />
                </div>
        </div>

        <!-- BOARDING -->
        <div class="col-md-4">
            <div class="service-card">
                <div>
                    <div class="icon-circle boarding-icon">
                        <i class="fa-solid fa-plane-departure"></i>
                    </div>
                    <h4>Boarding</h4>
                    <p class="text-muted small">Gate Boarding & Departure</p>
                </div>

               <asp:Button ID="btnBoarding" runat="server"
            Text="Take Ticket"
            CssClass="btn btn-primary btn-action mt-3"
            OnClick="btnBoarding_Click" />
            </div>
        </div>

    </div>

    <div class="text-center mt-5">
        <asp:Label ID="lblTicket" runat="server"
            CssClass="fs-3 fw-bold text-success" />
    </div>
</section>

</asp:Content>