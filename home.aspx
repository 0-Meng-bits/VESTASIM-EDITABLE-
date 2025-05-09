<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="WebApplication1.VESTASIM.home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VestaSim</title>
    <link rel="stylesheet" href="home.css" />
    <script src="login.js" defer></script>

    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <meta name="description" content="Buy, rent, and sell properties with ease using VestaSim." />
    <meta property="og:title" content="VestaSim - Property Made Simple" />
</head>

<body id="bodyTag" runat="server" class="home-page">
    <form id="form1" runat="server">
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
                <li><a href="#about">About</a></li>
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
            <img class="menubtn" src="IMG/menubtn.png" alt="menu button" />
        </nav>

        <!--header content here-->
        <section id="home">
            <header>
                <div class="home-content">
                    <h2>Simulate, Invest, and Grow on your path to property success</h2>
                    <div class="line"></div>
                    <h1>Welcome to VestaSim</h1>
                    <a href="#about" class="ctn">Learn More</a>
                </div>
            </header>
        </section>

        <!--about content here-->
        <section id="about">
            <div class="about-container">
                <div class="text-content">
                    <h2>About VestaSim</h2>
                    <p>
                        Searching for the perfect property?
                        Welcome to Vestasim, your ultimate destination for renting, buying, and selling properties.
                        Whether you're looking for a cozy apartment, a dream home, or the perfect investment opportunity,
                        we connect you with the best properties in prime locations. Our platform offers seamless browsing,
                        expert guidance, and flexible options to match your needs. With Vestasim, finding or listing a
                        property has never been easier. Start your journey today—your ideal home or investment is just a
                        click away!
                    </p>
                    <a href="team.aspx" class="btn">OUR TEAM +</a>
                </div>
                <div class="img-container">
                    <div class="img-gallery">
                        <div class="about-img"><img src="IMG/background.png" alt="Apartment Image" /></div>
                    </div>
                </div>
            </div>
        </section>

        <!--features content-->
        <div class="features-container">
            <div class="feature-box">
                <img src="IMG/terrace-transparent.png" alt="terrace-transparent" />
                <h3>Spacious Terraces</h3>
                <p>Enjoy the outdoors and breathtaking views with the large terraces.</p>
            </div>

            <div class="feature-box">
                <img src="IMG/Window-transparent.png" alt="Window-transparent" />
                <h3>Light Bathrooms</h3>
                <p>Beautiful views that can help residents relax and feel more connected to nature.</p>
            </div>

            <div class="feature-box">
                <img src="IMG/Patio-transparent.png" alt="Patio-transparent" />
                <h3>Outdoor Spaces</h3>
                <p>Our first floor patio provides an additional outdoor space to relax and enjoy.</p>
            </div>

            <div class="feature-box">
                <img src="IMG/Ceilings.png" alt="Ceilings" />
                <h3>High Ceilings</h3>
                <p>With ceilings reaching up to 5 meters our apartments are grand and spacious.</p>
            </div>
        </div>

        <!--services content-->
        <section id="services">
            <h2 class="services-title">Our Services</h2>
            <div class="line"></div>
            <div class="services-container">
                <div class="service-box">
                    <img src="IMG/kitchen.png" alt="Kitchen Service" />
                    <div class="service-overlay">
                        <h3>Kitchen</h3>
                        <p>Kitchen with sleek designs and high-end finishes.</p>
                    </div>
                </div>

                <div class="service-box">
                    <img src="IMG/bathroom.png" alt="Bathroom Service" />
                    <div class="service-overlay">
                        <h3>Bathroom</h3>
                        <p>Luxurious and relaxing space bathroom.</p>
                    </div>
                </div>

                <div class="service-box">
                    <img src="IMG/interior.png" alt="Interior Service" />
                    <div class="service-overlay">
                        <h3>Interior</h3>
                        <p>Living spaces with stylish and functional designs.</p>
                    </div>
                </div>
            </div>
        </section>

        <!--explore content here-->
        <section id="explore">
            <video autoplay muted loop id="bg-video">
                <source src="IMG/file.mp4" type="video/mp4" />
                Your browser does not support the video tag.
            </video>

            <div class="explore-content">
                <h1>Explore Your Dream Property</h1>
                <p>Discover amazing properties available for buying, selling, and renting with VestaSim.</p>
                <a href="buy.aspx" class="ctn">Get Started</a>
            </div>
        </section>

        <!--footer section-->
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
