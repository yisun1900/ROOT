<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<%

		
	
			String ls_sql=null;
			Connection conn = null;
			//Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement ps=null;
            try {

				conn=cf.getConnection();
				ls_sql="update sq_cd set glurl='boloniJK/SelectCxCrm_khxxForDd.jsp'  where cdxsmc='������ѯ'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				
				out.println("ִ�гɹ�");
				
				ps.close();
               
				
}catch (Exception e)
	{
	out.print("ʧ��: " + e);
	return;
	}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
				%>
				

           
   