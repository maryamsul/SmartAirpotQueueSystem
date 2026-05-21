# ✈️ Smart Airport Queue Management System
A web-based Airport Queue Management System built using ASP.NET Web Forms (C#) and SQL Server.
This system is designed to improve airport operations by managing passenger queues for boarding, security, baggage, and ticketing efficiently.

### Features
#### Baggage handling queue dashboard
#### Security check queue management
#### Boarding queue system
#### Ticket management system
#### Live display screen for queue updates
#### User login system (staff/admin)
#### Role-based dashboards (Staff, Security, Boarding, etc.)

### Technologies Used
1. ASP.NET Web Forms (C#)
2. HTML, CSS, JavaScript
3. SQL Server
4. ADO.NET
5. Visual Studio (.NET Framework)

 ### Project Structure
SmartAirportQueueSystem/<br/>
│
├── airport/                       ``` # Main Web Forms application``` <br/>
│   ├── App_Start/<br/>
│   ├── Content/<br/>
│   ├── Scripts/<br/>
│   ├── images/<br/>
│   ├── *.aspx pages<br/>
│   ├── *.cs backend logic<br/>
│   ├── Web.config<br/>
│   └── airport.csproj<br/>
│<br/>
├── SmartAirportQueueDB.sql         ``` # Database schema ```<br/>
├── README.md<br/>
└── LICENSE<br/>

### Database Setup
Open SQL Server Management Studio (SSMS)
Create a new database (e.g., SmartAirportQueueDB)
###### Run the script:
SmartAirportQueueDB.sql
Update connection string in **Web.config**:
```

<connectionStrings>
  <add name="DefaultConnection"
       connectionString="Server=YOUR_SERVER;Database=SmartAirportQueueDB;Trusted_Connection=True;"
       providerName="System.Data.SqlClient" />
</connectionStrings>
```
> [!NOTE]
>## BUILT FOR I3332 PROJECT WITH
>##### @pameladib @nie78
