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
         <%-- ScriptManager required for AJAX and server callbacks --%>
 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

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
                        <div class="search-wrapper">
                            <div class="search-bar">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search properties..." onkeyup="filterLocations()" />
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
                            </div>
        
                            <!-- Suggestions or live results will overflow here -->
                            <div id="Div1" runat="server" class="suggestions-box"></div>
        
                            <!-- Full search results appear below (optional or on full search) -->
                            <div id="propertyResults" runat="server" class="property-results-box">
                                <div class="no-results-message" style="display: none;">No results</div>
                            </div>

                        </div>
                      </section>
            </div>
        </header>
    </section>


<%-- Admin CRUD section for adding/editing property listings --%>
<section id="crud_section" runat="server" visible="false">
    <div class="crud-wrapper">
        <h2><asp:Label ID="lblFormTitle" runat="server" Text="Add New Property" /></h2>
        <div class="crud-form">
            <asp:HiddenField ID="hfPropertyID" runat="server" />
            
            <%-- Property Title input --%>
            <div class="form-group">
                <label>Title:</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Title is required" CssClass="error-message" Display="Dynamic" />
            </div>

            <%-- Description input --%>
            <div class="form-group">
                <label>Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-input" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required" CssClass="error-message" Display="Dynamic" />
            </div>

            <%-- Price input with validation --%>
            <div class="form-group">
                <label>Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input" TextMode="Number" step="0.01" />
                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is required" CssClass="error-message" Display="Dynamic" />
                <asp:RangeValidator ID="rvPrice" runat="server" ControlToValidate="txtPrice" MinimumValue="0" MaximumValue="99999999.99" Type="Double" ErrorMessage="Price must be between 0 and 99,999,999.99" CssClass="error-message" Display="Dynamic" />
            </div>

            <%-- Dropdown for property type --%>
            <div class="form-group">
                <label>Property Type:</label>
                <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-input">
                    <asp:ListItem Value="Buy">Buy</asp:ListItem>
                    <asp:ListItem Value="Sell">Sell</asp:ListItem>
                    <asp:ListItem Value="Rent">Rent</asp:ListItem>
                </asp:DropDownList>
            </div>

            <%-- Dropdown for status --%>
            <div class="form-group">
                <label>Status:</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-input">
                    <asp:ListItem Value="Available">Available</asp:ListItem>
                    <asp:ListItem Value="Sold">Sold</asp:ListItem>
                    <asp:ListItem Value="Rented">Rented</asp:ListItem>
                </asp:DropDownList>
            </div>

            <%-- Location input --%>
            <div class="form-group">
                <label>Location:</label>
                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-input" MaxLength="200" />
                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" ErrorMessage="Location is required" CssClass="error-message" Display="Dynamic" />
            </div>

            <%-- Image upload for property pictures --%>
            <div class="form-group">
                <label>Images:</label>
                <asp:FileUpload ID="fuImages" runat="server" AllowMultiple="true" CssClass="form-input" />
            </div>

            <%-- Save and Cancel buttons --%>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Property" CssClass="crud-btn" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="crud-btn cancel" OnClick="btnCancel_Click" CausesValidation="false" />
            </div>

            <%-- Message display label --%>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </div>
</section>

<%-- Section displaying all properties (Buy content) --%>
<section id="buysell" runat="server">
    <div class="title">
        <h1>Own a property!</h1>
        <div class="line"></div>

        <%-- Button to toggle CRUD form, visible to logged-in users only --%>
        <asp:Button ID="btnAddProperty" runat="server" Text="Add Property" CssClass="crud-btn" OnClick="btnAddProperty_Click" Visible="false" />
    </div>

    <div class="row-buysell">
    <%-- Repeater to render property listings dynamically --%>
    <asp:Repeater ID="rptProperties" runat="server" OnItemCommand="rptProperties_ItemCommand">
        <ItemTemplate>
            
            <div class="col-buysell">
                <%-- Property image or placeholder --%>
                <img src='<%# Eval("ImagePath") ?? "IMG/placeholder.png" %>' alt='<%# Eval("Title") %>' />

                <%-- Basic property info: title, description, price, location --%>
                <div class="apartment-info">
                    <h3><%# Eval("Title") %></h3>
                    <div class="details"><span><%# Eval("Description") %></span></div>
                    <div class="details"><span>Price: <%# Eval("Price", "{0:C}") %></span></div>
                    <div class="details"><span>Location: <%# Eval("Location") %></span></div>
                </div>

                <%-- Actions: view modal, edit, delete (edit/delete only for logged-in users) --%>
                <div class="actions">
                    <button type="button" onclick="openModal('modal<%# Eval("PropertyID") %>', event)">VIEW</button>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="crud-btn" CommandName="Edit" CommandArgument='<%# Eval("PropertyID") %>' Visible='<%# Session["ClientID"] != null %>' />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="crud-btn delete" CommandName="Delete" CommandArgument='<%# Eval("PropertyID") %>' Visible='<%# Session["ClientID"] != null %>' OnClientClick="return confirmDelete(this);" />
                </div>
            </div>

            <%-- Modal with full property details and additional images --%>
            <div id='modal<%# Eval("PropertyID") %>' class="modal">
                <div class="modal-content wide-modal">
                    <span class="close" onclick="closeModal('modal<%# Eval("PropertyID") %>')">×</span>
                    <div class="modal-body">
                        <asp:Repeater ID="rptImages" runat="server" DataSource='<%# GetImages((int)Eval("PropertyID")) %>'>
                            <ItemTemplate>
                                <img src='<%# Eval("ImagePath") %>' alt="Property Image" class="modal-image" />
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="modal-text">
                            <h3><%# Eval("Title") %></h3>
                            <p><%# Eval("Description") %></p>
                            <p>Price: <%# Eval("Price", "{0:C}") %></p>
                            <p>Location: <%# Eval("Location") %></p>
                            <p>Type: <%# Eval("PropertyType") %></p>
                            <p>Status: <%# Eval("Status") %></p>
                        </div>
                    </div>
                </div>
            </div>
          
        </ItemTemplate>
    </asp:Repeater>
         </div>
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
