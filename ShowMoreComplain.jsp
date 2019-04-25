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
   
   <style>

.rform
{
  position:relative;
	margin-top:3%;
	margin-left:35%;
    width:30%;
	height:85%;
	display:none;
}

#update
  {
   	   padding:5px;
   	   margin-left:15px;
   	   font-size:24px;
  }
</style>
   
   <script src="js/Refund.js"></script>
</head>
<%@include file="user_navbar.jsp" %>

<body>
 
 	<%
    System.out.println(session.getAttribute("mssg"));
if(session.getAttribute("mssg")!=null)
{
	%>

	<script type="text/javascript">
	
	
	setTimeout(function() {
		alert("<%=session.getAttribute("mssg")%>");
		}, 50);
	
	</script>
	<% 
	session.setAttribute("mssg",null);
}

%>


	<% 
	
		String s=request.getParameter("tran_id");
		String cb=request.getParameter("chargeback");
		
	%>
	
	
		<center style="margin-top:5%;">
			<p>Complaint Details <%= s %></p><br><br><br>

			<table border="2" class="table" style="width:70%;">
	
		<%

			ArrayList<ComplaintEntityBean> complaint=ComplaintService.select_MoreData();

			for(ComplaintEntityBean c:complaint)
			{		
		%>		
			
			
			<tr>
				<td>Complaint Id</td>
				<td><%= c.getComplaintId()%></td>
			</tr>
			
			<tr>
				<td>Customer Name</td>
				<td><%= c.getCustomerName() %></td>
			</tr>  
			
			<tr>
				<td>Account No</td>
				<td><%=c.getAccountNo() %></td>
			</tr>  
			
			<tr>
				<td>Transaction ID</td>
				<td><%=c.getTranId() %></td>
			</tr>
			
			<tr>
				<td>Dispute Date</td>
				<td><%=c.getDisputeDate() %></td>
			</tr>
			
			<tr>
				<td>Dispute Reason</td>
				<td><%=c.getDisputeReason() %></td>
			</tr>
			
			<tr>
				<td>Customer Remark</td>
				<td><%=c.getCustomerRemarks() %></td>
			</tr>
			
			<tr>
				<td>Complaint Status</td>
				<td><%=c.getComplaintStatus() %></td>
			</tr>
			
			<tr>
				<td>Bank Remark</td>
				<td><%=c.getBankRemark() %></td>
			</tr>
		
	</table>
		
	<p><button onclick="showRefundForm();" type="button" id="update"  style="text-decoration:none; color: black; font-weight:bold;">Update Status</button></p>
	</center>	
	
	<div class="rform" id="rform">
	<form method="post" action="../RefundController" class="refd" name="refund">
	<div id="red3"></div>
	
	 <div class="form-group">
      <label for="cname1" style="color:white;"><span class="glyphicon glyphicon-user" style="color:white;"></span> Customer Name<span style="color:red;">*</span></label>
		<input type="text" value="<%= c.getCustomerName() %>" class="form-control" name="cname1" placeholder="Enter customer name" readonly>
		</div>
		
		<div class="form-group">
      <label for="ano1" style="color:white;"><span class="glyphicon glyphicon-piggy-bank" style="color:white;"></span> Account number<span style="color:red;">*</span></label>
		<input type="number"  class="form-control" value="<%=c.getAccountNo() %>" name="ano1" readonly>
		</div>
		
		<div class="form-group">
      <label for="tran" style="color:white;"><span class="glyphicon glyphicon-piggy-bank" style="color:white;"></span> Transaction Id<span style="color:red;">*</span></label>
		<input type="number"  class="form-control" value="<%=c.getTranId() %>" name="tran"  readonly>
		</div>
		
		<div class="form-group">
      <label for="amount" style="color:white;"><span class="glyphicon glyphicon-piggy-bank" style="color:white;"></span> Chargeback Amount<span style="color:red;">*</span></label>
		<input type="number" value="<%=cb%>"class="form-control" name="amount" readonly >
		</div>
				
		<div class="form-group">
      <label for="date" style="color:white;"><span class="glyphicon glyphicon-calendar" style="color:white;"></span> Date (dd/MM/yyyy)<span style="color:red;">*</span></label>
		<input type="date" class="form-control" name="date"  placeholder="Enter refund date">
		</div>
		
		<div class="form-group">
      <label for="rres" style="color:white;"><span class="glyphicon glyphicon-pencil" style="color:white;"></span> Refund reason<span style="color:red;">*</span></label>
		<textarea class="form-control" name="rres"  placeholder="Enter refund reason"></textarea>
		</div>
		
		<div class="form-group">
                <label for="sel1" style="color:white;"><span class="glyphicon glyphicon-ok" style="color:white;"></span>&nbsp;Refund Status<span style="color:red;">*</span></label>
                  <select class="form-control" id="sel2" name="refund_status" onchange="disableRefundAmount();">
                     <option value="select">Select..</option>
                     <option value="yes">Yes</option>
                     <option value="no">No</option>
                  </select>
            </div>
		<script>
		function disableRefundAmount()
		{
			var e = document.getElementById("sel2");
			var selectVal = e.options[e.selectedIndex].value;
			if(selectVal=="yes")
			document.getElementById("ramount").disabled=false;
			else
				document.getElementById("ramount").disabled=true;
		}
		
		</script>
		<div class="form-group">
      <label for="ramount" style="color:white;"><span class="glyphicon glyphicon-piggy-bank" style="color:white;"></span> Refund Amount<span style="color:red;">*</span></label>
		<input type="text"  class="form-control" name="ramount" id="ramount" placeholder="Enter Refund Amount">
		</div>
		
		<div class="form-group">
      <label for="comm" style="color:white;"><span class="glyphicon glyphicon-pencil" style="color:white;"></span> Comments<span style="color:red;">*</span></label>
		<textarea class="form-control" name="comm"  placeholder="Comments..."></textarea>
		</div>
		<input type=hidden name="locat" id="locat">
		
		<button type="button" class="btn btn-success btn-block" onclick="refundValidate()">Submit</button>
	</form>	
	
	</div>
	
	
	
	
	<a href="ShowComplain.jsp?tran_id=s" class="btn btn-info btn-lg capsule">
          <span class="glyphicon glyphicon-arrow-left"></span> Back
        </a>
        
	
		
        <script>
	function showRefundForm()
	{
		document.getElementById("rform").style.display="block";
		updateComplaintStatus();
	}
	var xhr =new XMLHttpRequest();
	function updateComplaintStatus()
	{
		if (xhr.readyState == 4 || xhr.readyState == 0) 
		{
		
		xhr.open("GET", 'http://localhost:8090/ChargebackCalculation/UpdateComplainStatusController?status=inprogress & cid=<%=c.getComplaintId()%>', false);
		//xhr.onreadystatechange = function(){setDiv(xhr);}; 
		xhr.send(null);
		
		}
	}
	
	
	var stat=document.getElementById("complaint_status").innerHTML;
	if(stat=="closed")
		{
		document.getElementById("update").style.display="none";
		}
	<%
	
			}
		%>	
	
		
	</script>

</body>
</html>