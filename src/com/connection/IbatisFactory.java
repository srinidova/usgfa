package com.connection;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.*;
import java.sql.SQLException;
import java.util.*;

public class IbatisFactory {
   public SqlMapClient getSession()throws IOException,SQLException{
      Reader rd = Resources.getResourceAsReader("com/resource/SqlMapConfig.xml");
      SqlMapClient sqlMap = SqlMapClientBuilder.buildSqlMapClient(rd);
      /*Employee em = new Employee("Zara", "Ali", 5000);
      sqlMap.insert("Employee.insert", em);*/
      return sqlMap;
   }
} 