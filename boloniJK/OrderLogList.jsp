<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>����״̬ת����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">����״̬ת����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr > 
              <td > 
                <div align="center">�������</div>              </td>
				<td > 
                <div align="center">��־����</div>              </td>
               <td > 
                <div align="center">��־����</div>              </td>
				 <td > 
                <div align="center">�����˱��</div>              </td>
				 <td > 
                <div align="center">����ʱ��</div>              </td>
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

			//����������:OrderLog
			QName qn = new QName("urn:BeanService", "OrderLog");
			call.registerTypeMapping(OrderLog.class, qn, new BeanSerializerFactory(OrderLog.class, qn), 
			new BeanDeserializerFactory(OrderLog.class, qn));

			//�ӿڷ�������listOrderByCustId
			call.setOperationName(new QName("OrderLog", "listOrderLogByOrderId"));
			//�趨���صĲ���
			call.setReturnType(qn, OrderLog[].class);


			//�趨����Ĳ�����
			call.addParameter("orderId", qn, ParameterMode.IN);


			//ִ��
			OrderLog[] obj  = (OrderLog[])call.invoke(new Object[]{orderId});

	DateFormat f1;
	f1 = DateFormat.getDateInstance();

				String ordId ;	//�������
				String logName;	//��־����
				String logDesc;	//��־����
				String usrId;	//�����˱��
				java.util.Date logTime=null;	//����ʱ��
				 for(int i=0;i<obj.length;i++)
				{
					ordId=obj[i].getOrdId();
					logName=obj[i].getLogName();//�ۿ�
					logDesc=obj[i].getLogDesc();//�Ӽ�ϵ��
					usrId=obj[i].getUsrId();;//�ܽ��
					logTime=obj[i].getLogTime();//��Ʒ��λ

			

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

           
          </table>


	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

