<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>订单查询结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">


<div align="center">订单查询结果</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
<tr bgcolor="#cccccc" align="center"> 
	<td width="11%">订单类型</td>
	<td width="16%">订单编号</td>
	<td width="11%">松下亿达订单状态</td>
	<td width="10%">订单状态</td>
	<td width="9%">订单金额</td>
	<td width="9%">实收金额</td>
	<td width="8%">设计人员</td>
	<td width="15%">设计人员联系方式</td>
	<td width="6%">客户编号</td>
	<td width="7%">客户姓名</td>
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

	//关联本地类:Customer
	QName qn = new QName("urn:BeanService", "Customer");
	call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
	new BeanDeserializerFactory(Customer.class, qn));

	//关联本地类:Designer
	qn = new QName("urn:BeanService", "Designer");
	call.registerTypeMapping(Designer.class, qn, new BeanSerializerFactory(Designer.class, qn), 
	new BeanDeserializerFactory(Designer.class, qn));

	//关联本地类:Order
	qn = new QName("urn:BeanService", "Order");
	call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
	new BeanDeserializerFactory(Order.class, qn));

	//接口方法名：listOrderByCustId
	call.setOperationName(new QName("Order", "listOrderByCustId"));
	//设定返回的参数
	call.setReturnType(qn, Order[].class);

	//设定传入的参数，
	call.addParameter("custId", qn, ParameterMode.IN);

	//执行
	Order[] obj  = (Order[])call.invoke(new Object[]{custId});


	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
	new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//设定传入的参数，
	call.addParameter("orderId", qn, ParameterMode.IN);
	//设定返回的参数
	call.setReturnType(qn, Pay[].class);


	String orderId=null;//订单编号
	String orderState=null;// 订单状态
	String orderType=null;// 订单类型

	String store=null;//销售店面
	double orderAmount=0.00;//订单金额
	String YblState="";
	String kbkhbh="";//松下亿达客户编号
	String kbkhxm="";//松下亿达客户姓名
	Customer customer=new Customer();// 客户对象
	Designer designer=new Designer();// 设计师对象
	String desId="" ;  //设计师编号
	String desName="";//设计师姓名
	String desMobilePhone="";//设计师移动电话

	double allamount=0;// 收款金额
	double allorderAmount=0.00;//订单金额
	for(int i=0;i<obj.length;i++)
	{
		orderType=obj[i].getOrderType();// 订单类型
		if(orderType.equals("家装订单"))
		{
			continue;
		}
		orderId=obj[i].getOrderId();  //订单编号
		orderState=obj[i].getOrderState();// 订单状态

		customer=obj[i].getCustomer();// 客户对象
		designer=obj[i].getDesigner();// 设计师对象

		store=obj[i].getStore();//销售店面
		if(store==null)
		{
			store="";
		}
		orderAmount=obj[i].getOrderAmount();//订单金额
		orderAmount=cf.round(orderAmount,2);

		kbkhbh=customer.getCustId();//松下亿达客户编号
		kbkhxm=customer.getCustName();//松下亿达客户姓名

		desId=designer.getDesId();//设计师编号
		desName=designer.getDesName();//设计师姓名
		desMobilePhone=designer.getDesMobilePhone();//设计师移动电话

		double amount=0;// 收款金额

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
		<td>小 计</td>
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


</body>
</html>

