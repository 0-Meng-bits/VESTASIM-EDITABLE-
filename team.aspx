<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="team.aspx.cs" Inherits="VestaSim.team" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VestaSim</title>
    <link rel="stylesheet" href="team.css">
    <script src="login.js" defer></script>
</head>
<body>

    <!--Navigation bar-->
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
        <img class="menubtn" src="IMG/menubtn.png" alt="Menu">
    </nav>

    <!--Header content-->
    <section id="home">
        <header>
            <div class="home-content">
                <h2>Simulate, Invest, and Grow on your path to property success</h2>
                <div class="line"></div>
                <h1>Get to know our team!</h1>
            </div>
        </header>
    </section>

    <section class="team-section">
        <h2 class="team-title">Meet the Team</h2>
        <div class="team-container">
            <div class="team-card">
                <div class="card-inner">
                    <div class="card-front">
                        <img src="IMG/nawong.png" alt="Photo of Alexa Loon">
                        <h3>Alexa Suzane D. Loon</h3>
                        <p>Mortgage broker</p>
                    </div>
                    <div class="card-back">
                        <p>"Passionate about property investment and wealth creation and is dedicated to
                            helping clients achieve their financial dreams."</p>
                    </div>
                </div>
            </div>
            <div class="team-card">
                <div class="card-inner">
                    <div class="card-front">
                        <img src="IMG/nawong.png" alt="Photo of Bea Santos">
                        <h3>Bea Delos Santos</h3>
                        <p>Mortgage broker</p>
                    </div>
                    <div class="card-back">
                        <p>"Our all-inclusive service is backed by top-notch business partners.
                            Our team is ready to lend a hand—book a free appointment today."</p>
                    </div>
                </div>
            </div>
            <div class="team-card">
                <div class="card-inner">
                    <div class="card-front">
                        <img src="IMG/nawong.png" alt="Photo of Romel Batusbatusan">
                        <h3>Romel Batusbatusan</h3>
                        <p>Mortgage broker</p>
                    </div>
                    <div class="card-back">
                        <p>"As your local VestaSim Mortgage Broker,
                            my job is to keep it simple and find a home loan option that truly fits your needs."</p>
                    </div>
                </div>
            </div>
            <div class="team-card">
                <div class="card-inner">
                    <div class="card-front">
                        <img src="IMG/nawong.png" alt="Photo of Benjie Sumile">
                        <h3>Benjie Sumile</h3>
                        <p>Mortgage broker</p>
                    </div>
                    <div class="card-back">
                        <p>"Our experts can help you connect with the right broker."</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--Footer-->
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

    <script src="login.js"></script>
</body>
</html>
