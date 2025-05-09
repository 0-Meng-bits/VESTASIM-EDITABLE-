<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rent.aspx.cs" Inherits="WebApplication1.VESTASIM.Rent" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VestaSim</title>
    <link rel="stylesheet" href="rent.css" />
    <script src="login.js" defer></script>
</head>

<body>
    <form id="form1" runat="server">
    <!-- Navigation bar -->
    <nav class="navbar">
        <h1 class="logo">VestaSim</h1>
        <ul class="navlinks">
            <li class="active"><a href="home.aspx">Home</a></li>
            <li>
                <a href="#properties">Properties</a>
                <ul class="dropdown">
                    <li><a href="buy.aspx">Buy</a></li>
                    <li><a href="sell.aspx">Sell</a></li>
                    <li><a href="rent.aspx">Rent</a></li>
                </ul>
            </li>
            <li><a href="home.aspx">About</a></li>
            <li><a href="team.aspx">Team</a></li>
            <li class="ctn"><a href="#contact">Contact</a></li>

            <!-- Login Link -->
            <li id="ctn" class="log-btn">
                <asp:Panel ID="loginPanel" runat="server">
                    <a href="Loginn.aspx">Login</a>
                </asp:Panel>
             
                <asp:Panel ID="logoutPanel" runat="server">
                    <a href="Logout.aspx">Logout</a>
                </asp:Panel>
            </li>

        </ul>
        <img class="menubtn" src="IMG/menubtn.png" alt="Menu Button" />
    </nav>

    <!-- Header content -->
    <section id="home">
        <header>
            <div class="home-content">
                <h2>Simulate, Invest, and Grow on your path to property success</h2>
                <div class="line"></div>
                <h1>Rent Now!</h1>
                    <!-- Search Bar Section -->
                     <section id="search-section">
                         <div class="search-bar">
                             <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search properties..." />
                             <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
                         </div>
                     </section>

                     <!-- Search Results Section -->
                     <section id="results-section">
                         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="true" CssClass="property-grid" />
                     </section>

            </div>
        </header>
    </section>

    <!-- Footer section -->
    <section id="footer">
        <footer>
            <div class="footer-container">
                <div class="footer-section about">
                    <h2>About Us</h2>
                    <p>
                        At VestaSim, we make buying, selling, and renting properties simple, secure,
                        and seamless. Whether you're looking for your dream home, listing a property,
                        or finding the perfect rental.
                    </p>
                </div>
                <div class="footer-section links">
                    <h2>Quick Links</h2>
                    <ul>
                        <li><a href="home.aspx">Home</a></li>
                        <li><a href="#about">About Us</a></li>
                        <li><a href="team.aspx">Team</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-section contact">
                    <h2 id="contact">Contact Us</h2>
                    <p>Email: vestasim@gmail.com</p>
                    <p>Phone: 09484463845</p>
                    <p>Address: Agujo Daanbantayan, Cebu, Philippines</p>
                </div>
                <div class="footer-bottom">
                    <p>&copy; 2025 VESTASIM. All Rights Reserved.</p>
                </div>
            </div>
        </footer>
    </section>
        </form>
</body>

</html>
