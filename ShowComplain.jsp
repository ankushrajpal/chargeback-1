<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.cc.controller.service.ComplaintService" %>
    <%@ page import="com.cc.model.bean.ComplaintEntityBean" %>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <link href="css/AfterLogin.css" rel="stylesheet">
   <link href="css/Back.css" rel="stylesheet">
</head>
<%@include file="user_navbar.jsp" %>
<body>

<% String s=request.getParameter("tran_id");
String cb=request.getParameter("chargeback");
System.out.println(cb);
long a=Long.valueOf(s);
%>

<center style="margin-top:5%;">
<p>Complaint Details  <%=a  %></p><br><br><br>
<table border="5" class="table" style="width:70%;">
<thead class="thead-dark">
<tr>
<th>Complaint Id</th>
<th>Transaction Id</th>
<th>Customer Name</th>
<th>Account Number</th>
<th>Dispute Date </th>
<th>Details</th>
</tr>
</thead>




<%

	ArrayList<ComplaintEntityBean> complaint=ComplaintService.select_Data();

	for(ComplaintEntityBean c:complaint)
	{		
%>
		<tr>
		<td><%= c.getComplaintId()%></td>
		<td><%= c.getTranId()%></td>
		<td><%= c.getCustomerName() %></td>
		<td><%= c.getAccountNo() %></td>
		<td><%= c.getDisputeDate()%></td>
		<td><a href='ShowMoreComplain.jsp?tran_id=<%= c.getTranId()%> &chargeback=<%=cb %>'><button type="button" style="color:black;">Show More</button></a></td>
		</tr>
<% 
	}

%>








</table>
</center>

<a href="ChargeBack.jsp" class="btn btn-info btn-lg capsule">
          <span class="glyphicon glyphicon-arrow-left"></span> Back
        </a>
</body>
</html>