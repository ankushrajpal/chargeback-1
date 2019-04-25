
var xhr =new XMLHttpRequest();
function complaintValidate()
{
	var cname=document.forms["fcomp"]["cname"].value;
	var ano=document.forms["fcomp"]["ano"].value;
	var e=document.forms["fcomp"]["transactions"];
	var transaction=document.forms["fcomp"]["transactions"].selectedIndex;
	var ddate=document.forms["fcomp"]["ddate"].value;
	var dres=document.forms["fcomp"]["dres"].value;
	var crmk=document.forms["fcomp"]["crmk"].value;	
	var transactions = e.options[e.selectedIndex].value;
	var cname_flag,ano_flag,transactions_flag,ddate_flag,dres_flag,crmk_flag;
	
	document.forms["fcomp"]["cname"].style.borderColor="#ccc";
	document.forms["fcomp"]["ano"].style.borderColor="#ccc";
	document.forms["fcomp"]["transactions"].style.borderColor="#ccc";
	document.forms["fcomp"]["ddate"].style.borderColor="#ccc";
	document.forms["fcomp"]["dres"].style.borderColor="#ccc";
	document.forms["fcomp"]["crmk"].style.borderColor="#ccc";
	
	if(!cname.match(/^[A-Za-z ]+$/))
	{
		document.forms["fcomp"]["cname"].style.borderColor="red";
	}
	else
	{
		cname_flag=1;
	}
	
	if(!ano.match(/^[0-9]+$/))
	{
		document.forms["fcomp"]["ano"].style.borderColor="red";
	}
	else
	{
		ano_flag=1;
	}
	
	if(transaction==0)
	{
		document.forms["fcomp"]["transactions"].style.borderColor="red";
	}
	else
	{
		transactions_flag=1;
	}
	
	if(ddate=="")
	{
		document.forms["fcomp"]["ddate"].style.borderColor="red";
	}
	else
	{
		ddate_flag=1;
	}
	
	if(!dres.match(/^[A-Za-z ]+$/))
	{
		document.forms["fcomp"]["dres"].style.borderColor="red";
	}
	else
	{
		dres_flag=1;
	}
	
	if(!crmk.match(/^[A-Za-z ]+$/))
	{
		document.forms["fcomp"]["crmk"].style.borderColor="red";
	}
	else
	{
		crmk_flag=1;
	}
	
	if(cname_flag==1 && ano_flag==1 && transactions_flag==1 && ddate_flag==1 && dres_flag==1 && crmk_flag==1)
	{
		//document.forms["fcomp"].submit();
		checkTransactionIfExist(transactions);
		
	}
	else
	{
		document.getElementById("red").innerHTML="please update the highlighted mandetory field(s)";
		document.getElementById("red").style.color="red";
	}
	
}


function checkTransactionIfExist(transactions)
{
	alert(transactions);
	if (xhr.readyState == 4 || xhr.readyState == 0) 
		{
		
		xhr.open("GET", 'http://localhost:8090/ChargebackCalculation/CheckComplainController?trans_id='+transactions, false);
		xhr.onreadystatechange = function(){setDiv2(xhr);}; 
		xhr.send(null);	
		}
}
	function setDiv2(xhr)
	{
	if (xhr.readyState == 4) 
	{
	var str = xhr.responseText;
	//alert(str);

	if(str=="true")
		{
			alert("Complain for the transaction already exists!");
		}
	else
		{

		document.forms["fcomp"].submit();


		}
		
	}
	
	}
	