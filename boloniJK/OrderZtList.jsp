<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
            <tr> 
			<td > 
                <div align="center">����</div>              </td>
              <td > 
                <div align="center">�������</div>              </td>
				 <td > 
                <div align="center">����״̬</div>              </td>
				<td > 
                <div align="center">�����ڴﶩ��״̬</div>              </td>
				<td > 
                <div align="center">��������</div>              </td>
				 <td > 
                <div align="center">�ͻ�����</div>              </td>
				 <td > 
                <div align="center">�ͻ����</div>              </td>
				 <td > 
                <div align="center">�ƶ��绰</div>              </td>
				 <td > 
                <div align="center">�������</div>              </td>
				 <td > 
                <div align="center">��ַ</div>              </td>
				 <td > 
                <div align="center">���۵���</div>              </td>
            </tr>
<%

		
		String orderId=null;
		String custId=request.getParameter("khbh");
		String cx=request.getParameter("cx");
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			//String orderId;  //�������
			String orderState=null;// ����״̬
			String orderType=null;// ��������
			Customer customer=new Customer();// �ͻ�����
			String store=null;//���۵���
			Double orderAmount=0.00;//�������
			String YblState="";
			Order order=new Order();
			String ls_sql=null;
			Connection conn = null;
			//Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement ps=null;
            try {

				conn=cf.getConnection();
				ls_sql="select boloni_khbh from crm_zxkhxx where  khbh='"+custId+"'";
				ps= conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())
				{
					custId=rs.getString(1);
				}
				//out.println(custId);
				rs.close();
				ps.close();
                 call = (Call) service.createCall();
				//url = "";
				 call.setTargetEndpointAddress(new java.net.URL(url) );
				 QName qn = new QName("urn:BeanService", "Customer");
				 call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
                                new BeanDeserializerFactory(Customer.class, qn));
				 	//����������:Designer
	               qn = new QName("urn:BeanService", "Designer");
	              call.registerTypeMapping(Designer.class, qn, new BeanSerializerFactory(Designer.class, qn), 
		            new BeanDeserializerFactory(Designer.class, qn));

				   qn = new QName("urn:BeanService", "Order");
				  call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
                                new BeanDeserializerFactory(Order.class, qn));
			      call.setOperationName(new QName("Order", "listOrderByCustId"));
                  //�趨����Ĳ�����
                  call.addParameter("custId", qn, ParameterMode.IN);
                  //�趨���صĲ���
                  call.setReturnType(qn, Order[].class);
                 Order[] obj  = (Order[])call.invoke(new Object[]{custId});

				 
				 for(int i=0;i<obj.length;i++)
					 {
					 orderType=obj[i].getOrderType();// ��������
					 if("��װ����".equals(orderType))
						 continue;
					 orderId=obj[i].getOrderId();  //�������
					 orderState=obj[i].getOrderState();// ����״̬
					 
					 customer=obj[i].getCustomer();// �ͻ�����
					 store=obj[i].getStore();//���۵���
					 if(store==null)
					 store="";
					 orderAmount=obj[i].getOrderAmount();//�������

					YblState="";
					ls_sql="select ztmc from jc_order_ybl,dm_orderzt where jc_order_ybl.order_zt=dm_orderzt.ztbm and order_id='"+orderId+"'";
					ps= conn.prepareStatement(ls_sql);
					rs=ps.executeQuery();
					if(rs.next())
					{
						YblState=rs.getString(1);
					}
					rs.close();
					ps.close();
					 %>
					 
					 <tr align="center" bgcolor="#FFFFFF"> 
					 <td><a href="GzOrder.jsp?orderId=<%=orderId%>" target="_blank">����</a></td>
					<td align="center"><a href="OrderItemList.jsp?orderId=<%=orderId%>" target="_blank"><%=orderId%></a></td>
					<td align="center"><%=YblState%></td>
					<td align="center"><%=orderState%></td>
					<td align="center"><%=orderType%></td>
					<td align="center"><%=customer.getCustName()%></td>
					<td align="center"><%=customer.getCustId()%></td>
					<td align="center"><%=customer.getCellphone()%></td>
					<td align="center"><%=orderAmount%></td>
				    <td align="center"><%=customer.getAddress()%></td>
				    <td align="center"><%=store%></td>

				</tr>
				<%}
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
				

           
          </table>


	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--





function f_do(FormName)//����FormName:Form������
{
	if(javaTrim(FormName.orderId)=="") {
		alert("������Ų���Ϊ��");
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>