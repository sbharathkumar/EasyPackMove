<%-- 
    Document   : Quotes
    Created on : Nov 11, 2016, 12:41:34 PM
    Author     : sontambharath
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Quote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quotes - Easy Pack Move</title>
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/bootstrap-alert.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/Site.css" rel="stylesheet" type="text/css" />
    <link href="css/thumbnail-slider.css" rel="stylesheet" type="text/css" />
    <script src="js/thumbnail-slider.js" type="text/javascript"></script>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/EasyPackMove" class="navbar-brand">Easy Pack Move</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/EasyPackMove">Home</a></li>
                    ${pageContext.session.getAttribute("IsUserLoggedIn") ? '
                    <li><a href="/EasyPackMove/quotes">Quotes</a></li>' : ''}
                    <li><a href="Contact.jsp">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">                    
                    ${pageContext.session.getAttribute("IsUserLoggedIn") ? '
                    <li><a id="loginLink" href="/EasyPackMove/doLogout">Logout</a></li>' : ' 
                    <li><a id="registerLink" href="Register.jsp">Register</a></li>
                    <li><a href="Login.jsp" id="loginLink" >Login</a></li>'}
                </ul>
            </div>
        </div>
    </div>
    <div class="container body-content">
        <h2>Quote List</h2>
        <table class="table">
            <tr>
                <th>
                    Start Address
                </th>
                <th>
                    End Address
                </th>
                <th>
                    Distance
                </th>
                <th>
                    Quote Price
                </th>
                <th>
                    Is Purchased
                </th>
                <th></th>
            </tr>
            <% 
                ArrayList<Quote> _quotes = (ArrayList<Quote>)(Object)session.getAttribute("Quotes");
                for(Quote quote : _quotes){
            %>
            <tr>
                <td>
                    <%= quote.getStartAddress() %>
                </td>
                <td>
                    <%= quote.getEndAddress()%>
                </td>
                <td>
                    <%= quote.getDistance()%>
                </td>
                <td>
                    <%= quote.getQuotePrice()%>
                </td>
                <td>
                    <%= (quote.isIsPurchased()? "Yes": "No")%>
                </td>
                <td>
                    <div class="btn-group">
                        <a href="/EasyPackMove/getquotedetail?QuoteId=<%= quote.getId()%>" class="btn btn-info">Details</a>
                        
                        <% if(!quote.isIsPurchased()){ %>
                            <a href="/EasyPackMove/editquote?QuoteId=<%= quote.getId()%>" class="btn btn-info">Modify Quote</a>
                            <a href="/EasyPackMove/purchase?QuoteId=<%= quote.getId()%>&QuotePrice=<%= quote.getQuotePrice()%>" class="btn btn-info">Purchase</a>
                        <% }%>
                    </div>
                </td>
            </tr>
            <% }%>
        </table>
        <hr />
        <footer>
            <p>&copy; 2016 - Easy Pack Move</p>
        </footer>
    </div>
</body>
</html>
