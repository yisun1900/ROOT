<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>������ѯ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">


<div align="center">������ѯ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
<tr bgcolor="#cccccc" align="center"> 
	<td width="11%">��������</td>
	<td width="16%">�������</td>
	<td width="11%">�����ڴﶩ��״̬</td>
	<td width="10%">����״̬</td>
	<td width="9%">�������</td>
	<td width="9%">ʵ�ս��</td>
	<td width="8%">�����Ա</td>
	<td width="15%">�����Ա��ϵ��ʽ</td>
	<td width="6%">�ͻ����</td>
	<td width="7%">�ͻ�����</td>
  </tr>
<%

		
String khbh=request.getParameter("khbh");


Connection conn = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String custId=null;
	ls_sql="select boloni_khbh from crm_zxkhxx where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{
		custId=rs.getString(1);
	}
	rs.close();
	ps.close();

	String url = cf.getValue("kb_url");
	Service service = new Service();
	Order order=new Order();

	Call call=null;
	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );

	//����������:Customer
	QName qn = new QName("urn:BeanService", "Customer");
	call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
	new BeanDeserializerFactory(Customer.class, qn));

	//����������:Designer
	qn = new QName("urn:BeanService", "Designer");
	call.registerTypeMapping(Designer.class, qn, new BeanSerializerFactory(Designer.class, qn), 
	new BeanDeserializerFactory(Designer.class, qn));

	//����������:Order
	qn = new QName("urn:BeanService", "Order");
	call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
	new BeanDeserializerFactory(Order.class, qn));

	//�ӿڷ�������listOrderByCustId
	call.setOperationName(new QName("Order", "listOrderByCustId"));
	//�趨���صĲ���
	call.setReturnType(qn, Order[].class);

	//�趨����Ĳ�����
	call.addParameter("custId", qn, ParameterMode.IN);

	//ִ��
	Order[] obj  = (Order[])call.invoke(new Object[]{custId});


	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
	new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//�趨����Ĳ�����
	call.addParameter("orderId", qn, ParameterMode.IN);
	//�趨���صĲ���
	call.setReturnType(qn, Pay[].class);


	String orderId=null;//�������
	String orderState=null;// ����״̬
	String orderType=null;// ��������

	String store=null;//���۵���
	double orderAmount=0.00;//�������
	String YblState="";
	String kbkhbh="";//�����ڴ�ͻ����
	String kbkhxm="";//�����ڴ�ͻ�����
	Customer customer=new Customer();// �ͻ�����
	Designer designer=new Designer();// ���ʦ����
	String desId="" ;  //���ʦ���
	String desName="";//���ʦ����
	String desMobilePhone="";//���ʦ�ƶ��绰

	double allamount=0;// �տ���
	double allorderAmount=0.00;//�������
	for(int i=0;i<obj.length;i++)
	{
		orderType=obj[i].getOrderType();// ��������
		if(orderType.equals("��װ����"))
		{
			continue;
		}
		orderId=obj[i].getOrderId();  //�������
		orderState=obj[i].getOrderState();// ����״̬

		customer=obj[i].getCustomer();// �ͻ�����
		designer=obj[i].getDesigner();// ���ʦ����

		store=obj[i].getStore();//���۵���
		if(store==null)
		{
			store="";
		}
		orderAmount=obj[i].getOrderAmount();//�������
		orderAmount=cf.round(orderAmount,2);

		kbkhbh=customer.getCustId();//�����ڴ�ͻ����
		kbkhxm=customer.getCustName();//�����ڴ�ͻ�����

		desId=designer.getDesId();//���ʦ���
		desName=designer.getDesName();//���ʦ����
		desMobilePhone=designer.getDesMobilePhone();//���ʦ�ƶ��绰

		double amount=0;// �տ���

		Pay pay[]  = (Pay[])call.invoke(new Object[]{orderId});
		for(int j=0;j<pay.length;j++)
		{
			amount=amount+pay[j].getAmont();// 
		}

		allamount+=amount;
		allorderAmount+=orderAmount;

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
			<td><%=orderType%></td>
			<td><a href="ToKbSys.jsp?orderId=<%=orderId%>&orderType=<%=orderType%>" target="_blank"><%=orderId%></a></td>
			<td><a href="OrderLogList.jsp?orderId=<%=orderId%>" target="_blank"><%=orderState%></a></td>
			<td><%=YblState%></td>
			<td><%=orderAmount%></td>
			<td><%=amount%></td>
			<td><%=desName%></td>
			<td><%=desMobilePhone%></td>
			<td><%=kbkhbh%></td>
			<td><%=kbkhxm%></td>
		</tr>
		<%
	}

	%>
	<tr align="center" bgcolor="#FFFFFF"> 
		<td>С ��</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allorderAmount%></td>
		<td><%=allamount%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%

}
catch (Exception e)
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


</body>
</html>
