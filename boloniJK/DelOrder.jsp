<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>订单跟踪删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%

		
		String orderId=request.getParameter("orderId");
		
			
			String ls_sql=null;
			Connection conn = null;
			//Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement ps=null;
            try {

				conn=cf.getConnection();
				ls_sql=" delete jc_order_mx where order_id='"+orderId+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				
                ls_sql=" delete jc_order_ybl where order_id='"+orderId+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
%>
				<script language="javascript">
				alert("删除成功");
				window.close();
					
				</script>
<%
				ps.close();
				}
				catch(Exception e)
				{
					out.println("删除失败"+e.getMessage());
				}
				finally 
				{
					try{
						 
						if (rs != null) rs.close(); 
						if (conn != null) cf.close(conn); 
					}
					catch (Exception e){
						if (conn != null) cf.close(conn); 
					}
				}   
				 %>

</body>
</html>





