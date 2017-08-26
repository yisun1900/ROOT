<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<html>
<head>
<title>付款查询结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String custId=request.getParameter("khbh");
String cx=request.getParameter("cx");
String url = cf.getValue("kb_url");

String hth=null;
String khxm=null;
String contractId=null;

Service service = new Service();
Call call;
String orderId;  //订单编号
String id=null;//收款序号
//String contractId=null;  //合同编号
Double amount=0.00;// 收款金额
double allamount=0.00;// 收款金额
java.util.Date payTime=null;// 收款日期
String payType=null;// 付款方式
String billNo=null;// 票据编号
String payForUse=null;// 款项用途
String remark=null;// 备注信息
String person=null;// 录入人
java.util.Date time=null;// 录入时间
Pay pay=new Pay();

String orderState=null;// 订单状态
String orderType=null;// 订单类型
Customer customer=new Customer();// 客户对象
String store=null;//销售店面
Double orderAmount=0.00;//订单金额
Double hte=0.00;//订单金额
String ls_sql=null;
Connection conn = null;
//Statement stmt = null;
ResultSet rs = null;
PreparedStatement ps=null;
try {

	conn=cf.getConnection();

	ls_sql="select qye+suijin+guanlif,hth,khxm";
	ls_sql+=" from crm_khxx where  khbh='"+custId+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{
		hte=rs.getDouble(1);
		hth=rs.getString(2);
		khxm=rs.getString(3);
	}
	rs.close();
	ps.close();

	ls_sql="select boloni_khbh from crm_zxkhxx where  khbh='"+custId+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{
		custId=rs.getString(1);
	}
	rs.close();
	ps.close();

%>
	<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">付款查询结果（客户姓名：<%=khxm%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#cccccc" align="center"> 
               <td > 
                <div align="center">订单编号</div>              </td>
				 <td ><div align="center">实收金额</div></td>
				 <td > 
                <div align="center">应收金额</div>              </td>
				  <td > 
                <div align="center">订单类型</div>              </td>
				 <td > 
                <div align="center">订单状态</div>              </td>
				
            </tr>
<%


	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );

	QName qn = new QName("urn:BeanService", "Customer");
	call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
		new BeanDeserializerFactory(Customer.class, qn));

	//关联本地类:Designer
	qn = new QName("urn:BeanService", "Designer");
	call.registerTypeMapping(Designer.class, qn, new BeanSerializerFactory(Designer.class, qn), 
		new BeanDeserializerFactory(Designer.class, qn));

	qn = new QName("urn:BeanService", "Order");
	call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
		new BeanDeserializerFactory(Order.class, qn));

	call.setOperationName(new QName("Order", "listOrderByCustId"));
	//设定传入的参数，
	call.addParameter("custId", qn, ParameterMode.IN);
	//设定返回的参数
	call.setReturnType(qn, Order[].class);
	Order[] obj2  = (Order[])call.invoke(new Object[]{custId});



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


	for(int j=0;j<obj2.length;j++)
	{
		orderId=obj2[j].getOrderId();  //订单编号
		orderType=obj2[j].getOrderType();// 订单类型
		orderState=obj2[j].getOrderState();// 订单状态
		orderAmount=obj2[j].getOrderAmount();//订单金额
		//						orderAmount=obj2[j].getPayForUse();//款项用途


		if(orderType.equals("家装订单"))
		{
			orderAmount=hte;
			orderType="家装订单（家装设计＋家装施工）";
		}

		amount=0.00;// 收款金额

		Pay obj[]  = (Pay[])call.invoke(new Object[]{orderId});
		for(int i=0;i<obj.length;i++)
		{
			amount=amount+obj[i].getAmont();// 
		}

		allamount+=amount;

		%>
		<tr align="center" bgcolor="#FFFFFF"> 
		<td align="center"><%=orderId%></td>
		<td align="center"><%=amount%></td>
		<td align="center"><%=orderAmount%></td>
		<td align="center"><%=orderType%></td>
		<td align="center"><%=orderState%></td>
		</tr>
		<%
	}

	%>
	<tr align="center" bgcolor="#FFFFFF"> 
	<td align="center">小计</td>
	<td align="center"><%=cf.formatDouble(allamount)%></td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	</tr>
  </table>

<P>
<center>家装订单（家装设计＋家装施工）－－收款明细</center>	
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF"> 
  <td align="center">合同号</td>
  <td align="center">款项用途</td>
  <td align="center">收款金额</td>
  <td align="center">收款日期</td>
  <td align="center">备注</td>
</tr>
	<%

	orderId=hth;
	DateFormat f1;
	f1 = DateFormat.getDateInstance();
	Pay obj[]  = (Pay[])call.invoke(new Object[]{orderId});

	double jzxj=0;

	for(int i=0;i<obj.length;i++)
	{
		amount=obj[i].getAmont();
		payTime=obj[i].getPayTime();// 收款日期
		payForUse=obj[i].getPayForUse();// 款项用途
		remark=obj[i].getRemark();// 备注信息
		allamount=allamount+amount;

		jzxj+=amount;


		%>
		<tr bgcolor="#FFFFF"> 
		<td align="center"><%=orderId%></td>
		<td align="center"><%=payForUse%> </td>
		<td align="center"><%=amount%> </td>
		<td align="center"><%=f1.format(payTime)%> </td>
		<td align="center"><%=remark%> </td>
		</tr>
		<%
	}

	%>
	<tr bgcolor="#FFFFF"> 
	<td align="center">家装订单小计</td>
	<td align="center">&nbsp;</td>
	<td align="center"><%=cf.formatDouble(jzxj)%></td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	</tr>
  </table>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

           


	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

