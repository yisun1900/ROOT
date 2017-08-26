<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>订单状态转换表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">订单状态转换表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr > 
              <td > 
                <div align="center">订单编号</div>              </td>
				<td > 
                <div align="center">日志名称</div>              </td>
               <td > 
                <div align="center">日志描述</div>              </td>
				 <td > 
                <div align="center">操作人编号</div>              </td>
				 <td > 
                <div align="center">操作时间</div>              </td>
				 <td > 
				

			  
            </tr>
<%
		String orderId=request.getParameter("orderId");


		Connection conn = null;//
		ResultSet rs = null;
		PreparedStatement ps=null;
		String ls_sql=null;
		try {
				
			String url = cf.getValue("kb_url");
			Service service = new Service();
			OrderLog orderLog=new OrderLog();

			Call call=null;
			call = (Call) service.createCall();
			call.setTargetEndpointAddress(new java.net.URL(url) );

			//关联本地类:OrderLog
			QName qn = new QName("urn:BeanService", "OrderLog");
			call.registerTypeMapping(OrderLog.class, qn, new BeanSerializerFactory(OrderLog.class, qn), 
			new BeanDeserializerFactory(OrderLog.class, qn));

			//接口方法名：listOrderByCustId
			call.setOperationName(new QName("OrderLog", "listOrderLogByOrderId"));
			//设定返回的参数
			call.setReturnType(qn, OrderLog[].class);


			//设定传入的参数，
			call.addParameter("orderId", qn, ParameterMode.IN);


			//执行
			OrderLog[] obj  = (OrderLog[])call.invoke(new Object[]{orderId});

	DateFormat f1;
	f1 = DateFormat.getDateInstance();

				String ordId ;	//订单编号
				String logName;	//日志名称
				String logDesc;	//日志描述
				String usrId;	//操作人编号
				java.util.Date logTime=null;	//操作时间
				 for(int i=0;i<obj.length;i++)
				{
					ordId=obj[i].getOrdId();
					logName=obj[i].getLogName();//折扣
					logDesc=obj[i].getLogDesc();//加价系数
					usrId=obj[i].getUsrId();;//总金额
					logTime=obj[i].getLogTime();//产品单位

			

					 %>
					 
					 <tr align="center" bgcolor="#FFFFFF">
					 <td align="center" bgcolor="#FFFFFF"><%=ordId%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=logName%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=logDesc%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=usrId%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=f1.format(logTime)%></td>

				</tr>
					 <%
					 }
				 
}catch (Exception e) {
	out.print("失败: " + e);
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

           
          </table>


	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

