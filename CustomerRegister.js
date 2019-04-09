function customerValidate()
{		
	
	var fname=document.forms["cform"]["fname2"].value;
	var lname=document.forms["cform"]["lname2"].value;
	var age=document.forms["cform"]["age2"].value;
	var gender=document.forms["cform"]["gender2"].selectedIndex;
	var city=document.forms["cform"]["city2"].value;
	var state=document.forms["cform"]["state2"].value;
	var account_no=document.forms["cform"]["account_no"].value;
	var uid=document.forms["cform"]["uid2"].value;
	var pswd=document.forms["cform"]["pswd2"].value;
	
	
	var fname_flag,lname_flag,age_flag,gender_flag,city_flag,state_flag,account_no_flag,uid_flag,pswd_flag;
	
	document.forms["cform"]["fname2"].style.borderColor="#ccc";
	document.forms["cform"]["lname2"].style.borderColor="#ccc";
	document.forms["cform"]["age2"].style.borderColor="#ccc";
	document.forms["cform"]["age2"].style.borderColor="#ccc";
	document.forms["cform"]["gender2"].style.borderColor="#ccc";
	document.forms["cform"]["city2"].style.borderColor="#ccc";
	document.forms["cform"]["state2"].style.borderColor="#ccc";
	document.forms["cform"]["account_no"].style.borderColor="#ccc";
	document.forms["cform"]["uid2"].style.borderColor="#ccc";
	document.forms["cform"]["pswd2"].style.borderColor="#ccc";
	
	document.getElementById("pass_mssg2").style.display="none";
	
	
	if(!fname.match(/^[A-Za-z]+$/))
	{
		document.forms["cform"]["fname2"].style.borderColor="red";			
	}
	else
	{
		fname_flag=1;
	}		
	
	if(!lname.match(/^[A-Za-z]+$/))
	{
		document.forms["cform"]["lname2"].style.borderColor="red";
	}
	else
	{
		lname_flag=1;
	}
	
	if(!age.match(/^[0-9]+$/))
	{
		document.forms["cform"]["age2"].style.borderColor="red";
	}
	else
	{
		age_flag=1;
	}
	
	if(gender==0)
	{
		document.forms["cform"]["gender2"].style.borderColor="red";
	}
	else
	{
		gender_flag=1;
	}
	
	if(!city.match(/^[A-Za-z]+$/))
	{
		document.forms["cform"]["city2"].style.borderColor="red";
	}
	else
	{
		city_flag=1;
	}
	
	if(!state.match(/^[A-Za-z ]+$/))
	{
		document.forms["cform"]["state2"].style.borderColor="red";
	}
	else
	{
		state_flag=1;
	}
	
	if(!account_no.match(/^[0-9]+$/))
	{
		document.forms["cform"]["account_no"].style.borderColor="red";
	}
	else
	{
		account_no_flag=1;
	}
	if(!uid.match(/^[a-zA-Z0-9_\-.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/))
	{
		document.forms["cform"]["uid2"].style.borderColor="red";
	}
	else
	{
		uid_flag=1;
	}
	
	
	
	if(!pswd.match(/^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/))
	{
		document.forms["cform"]["pswd2"].style.borderColor="red";
		document.getElementById("pass_mssg2").style.display="block";
		document.getElementById("pass_mssg2").innerHTML="password must contain atleast one capital letter,one small letter,one digit and one special character(!@#$%^&*) and minimum length must be 8";
	}
	else
	{
		pswd_flag=1;
		
	}	
	
	
	
	
	if(fname_flag==1 && lname_flag==1 && age_flag==1 && gender_flag==1 && city_flag==1 && state_flag==1 && account_no_flag==1 && uid_flag==1 &&   pswd_flag==1  )
	{
					
			document.forms["cform"].submit();
	}
	else
	{
	
		document.getElementById("red2").innerHTML="please update the highlighted mandetory field(s)";
		document.getElementById("red2").style.color="red";
	}
	
	


}