package com.cc.model.dao;

import java.sql.*;

import com.cc.model.bean.ComplaintEntityBean;

public interface ComplaintDAO {
	
	boolean insert(ComplaintEntityBean customer) throws Exception;
	
	boolean update(String query) throws Exception;
	
	int delete(String query);
	
	ResultSet select(String query) throws Exception;
	

}
