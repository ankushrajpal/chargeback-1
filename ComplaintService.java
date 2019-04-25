package com.cc.controller.service;

import java.sql.*;
import java.util.ArrayList;

import com.cc.model.bean.ComplaintEntityBean;
import com.cc.model.dao.ComplaintDAOImpl;
import com.cc.model.dao.MyConnection;

public class ComplaintService {
	
	ComplaintDAOImpl obj=new ComplaintDAOImpl();
	
	public static Boolean Insert_data(ComplaintEntityBean complaint) throws Exception
	{
		Connection con=MyConnection.getObj().getConnection();
		ComplaintDAOImpl obj=new ComplaintDAOImpl();
		
		
		Boolean res=obj.insert(complaint);
		return res;
		
	}
	public static Boolean Update_status(String query) throws Exception
	{
		Connection con=MyConnection.getObj().getConnection();
		ComplaintDAOImpl obj=new ComplaintDAOImpl();
		
		
		Boolean res=obj.update(query);
		return res;
		
	}
	
	
	public static ArrayList<ComplaintEntityBean> select_Data() throws Exception
	{
		
		ArrayList<ComplaintEntityBean> complaint=new ArrayList<ComplaintEntityBean>();
		
		String query="select complaint_id,transaction_id,customer_name,account_no,dispute_date from complaint";
		
		Connection con=MyConnection.getObj().getConnection();
		ComplaintDAOImpl obj=new ComplaintDAOImpl();
		
		
		ResultSet rs=obj.select(query);
		
		while(rs.next())
		{
			ComplaintEntityBean c=new ComplaintEntityBean();
			
			c.setComplaintId(Integer.parseInt(rs.getString("complaint_id")));
			c.setTranId(Long.parseLong(rs.getString("transaction_id")));
			c.setCustomerName(rs.getString("customer_name"));
			c.setAccountNo(Long.parseLong(rs.getString("account_no")));
			c.setDisputeDate(rs.getString("dispute_date"));		
			
			complaint.add(c);			
		}
		
		return complaint;
		
	}
	
	public static ArrayList<ComplaintEntityBean> select_MoreData() throws Exception
	{
		ArrayList<ComplaintEntityBean> complaint=new ArrayList<ComplaintEntityBean>();
		
		String query="select distinct * from complaint";
		
		Connection con=MyConnection.getObj().getConnection();
		ComplaintDAOImpl obj=new ComplaintDAOImpl();		
		
		ResultSet rs=obj.select(query);
		
		while(rs.next())
		{
			ComplaintEntityBean c=new ComplaintEntityBean();
			
			c.setComplaintId(Integer.parseInt(rs.getString("complaint_id")));
			c.setCustomerName(rs.getString("customer_name"));
			c.setAccountNo(Long.parseLong(rs.getString("account_no")));
			c.setTranId(Long.parseLong(rs.getString("transaction_id")));
			c.setDisputeDate(rs.getString("dispute_date"));
			c.setDisputeReason(rs.getString("dispute_reason"));
			c.setCustomerRemarks(rs.getString("customer_remark"));
			c.setComplaintStatus(rs.getString("complaint_status"));
			c.setBankRemark(rs.getString("bank_remark"));
			
			complaint.add(c);
			
		}
				
		return complaint;
		
	}
}