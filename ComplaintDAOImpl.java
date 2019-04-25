package com.cc.model.dao;
import com.cc.model.bean.ComplaintEntityBean;

import java.sql.*;

public class ComplaintDAOImpl implements ComplaintDAO{

	Connection con;
	
	public boolean insert(ComplaintEntityBean complaint) throws Exception
	{
		
		con=MyConnection.getObj().getConnection();
		
		PreparedStatement ps=con.prepareStatement("insert into complaint values(?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,complaint.getComplaintId());
		ps.setString(2,complaint.getCustomerName());
		ps.setLong(3,complaint.getAccountNo());		
		ps.setString(4,complaint.getDisputeDate());
		ps.setString(5, complaint.getDisputeReason());
		ps.setString(6, complaint.getCustomerRemarks());
		ps.setString(7, complaint.getComplaintStatus());
		ps.setString(8, complaint.getBankRemark());
		ps.setLong(9,complaint.getTranId());
		
		Boolean x=ps.execute();
		
		System.out.println(x);
		
		return !x;		
	}
	
	public boolean update(String query) throws Exception
	{
		con=MyConnection.getObj().getConnection();
		Statement st=con.createStatement();
		boolean res=st.execute(query);	
		return	!res;
			
	}
	
	public int delete(String query)
	{
		return 0;		
	}
	
	public ResultSet select(String query) throws Exception
	{
		System.out.println(query);
		
		MyConnection.getObj();
		
		Connection con=MyConnection.getObj().getConnection();
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery(query);	
		return	rs;
		
	}
	
}
