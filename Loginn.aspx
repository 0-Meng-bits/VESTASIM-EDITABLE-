<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginn.aspx.cs" Inherits="YourProject.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - VestaSim</title>
    <!-- <link rel="stylesheet" href="ho.css" /> -->
    <script src="login.js" defer></script>

    
    <style>
    /* Reuse all styles from Login.aspx */
    @import url('https://fonts.googleapis.com/css?family=Montserrat:500');

    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Montserrat", sans-serif;
    }

    body {
        background-color: #0d1321;
        overflow-x: hidden;
    }

    .blur-bg-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        backdrop-filter: blur(10px);
        transition: 0.1s ease;
    }

    .form-popup {
        position: fixed;
        top: 50%;
        left: 50%;
        max-width: 720px;
        width: 100%;
        background: #748cab;
        transform: translate(-50%, -50%);
        box-shadow: 1px 1px 5px #0d1321;
        border-radius: 5px;
    }

    .form-popup .close-btn {
        position: absolute;
        top: 12px;
        right: 12px;
        color: #0d1321;
        cursor: pointer;
        background: none;
        border: none;
    }

    .form-popup .form-box {
        display: flex;
    }

    .form-box .form-details {
        max-width: 330px;
        width: 100%;
        color: #f0ebd8;
        display: flex;
        padding: 0 20px;
        text-align: center;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-shadow: 5px 5px 10px black;
        background-image: url('IMG/bg-housse.png');
        background-size: cover;
        background-position: center;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
    }

    .form-box .form-content {
        width: 100%;
        padding: 35px;
    }

    form .input-field {
        height: 50px;
        width: 100%;
        margin-top: 20px;
        position: relative;
    }

    form .input-field input {
        height: 100%;
        width: 100%;
        padding: 0 15px;
        font-size: 0.95rem;
        border: none;
        border-radius: 20px;
        box-shadow: 1px 1px 5px #0d1321;
    }   

    .form-box h2 {
        text-align: center;
        margin-bottom: 30px;
    }

    .form-box a {
        color: darkblue;
        text-decoration: none;
    }

    .form-box a:hover {
        text-decoration: underline;
    }

    .bottom-link {
        color: #f0ebd8;
    }

    form button, .btn {
        width: 100%;
        outline: none;
        border: none;
        font-size: 1rem;
        font-weight: 600;
        padding: 14px 0;
        border-radius: 20px;
        margin: 25px 0;
        color: #F0EBD8;
        cursor: pointer;
        background-color: #1d2d44;
        transition: 0.2s ease;
        box-shadow: 1px 1px 5px #0d1321;
    }

    form button:hover, .btn:hover {
        background-color: #3E5C76;
    }
</style>

    <script>
        function closeLoginPopup() {
            document.querySelector('.form-popup').style.display = 'none';
            window.location.href = 'home.aspx';
        }

        function validateEmail() {
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            if (!email.includes("@")) {
                alert("Please include '@' in your email.");
                return false;
            }
            if (!email.endsWith(".com")) {
                alert("Email must end with '.com'");
                return false;
            }
            return true;
        }


    </script>

</head>
<body class="login-page">
    <!-- Background Blur if needed -->
    <div class="blur-bg-overlay"></div>

    <!-- Login Form -->
    <div class="form-popup">
  <button class="close-btn" onclick="closeLoginPopup()">&#10006</button>
  <div class="form-box login">
    <div class="form-details">
      <p>Please Login your personal account</p>
    </div>
    <div class="form-content">
      <h2>LOGIN</h2>
      <form id="loginForm" runat="server">
        <div class="input-field">
          <asp:TextBox ID="txtEmail" runat="server" CssClass="input-control" placeholder="Enter your email"></asp:TextBox>
        </div>
        <div class="input-field">
          <asp:TextBox ID="txtPassword" runat="server" CssClass="input-control" TextMode="Password" placeholder="Enter password"></asp:TextBox>
        </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn"
                        OnClick="btnLogin_Click" OnClientClick="return validateEmail();" />

                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

                    <div class="bottom-link">
                        Don't have an account?
                        <a href="Signupp.aspx">Signup</a>
                    </div>
        </form>
      </div>
  </div>
</div>

</body>
</html>
