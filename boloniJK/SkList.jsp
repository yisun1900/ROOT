<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<html>
<head>
<title>�����ѯ���</title>
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
String orderId;  //�������
String id=null;//�տ����
//String contractId=null;  //��ͬ���
Double amount=0.00;// �տ���
double allamount=0.00;// �տ���
java.util.Date payTime=null;// �տ�����
String payType=null;// ���ʽ
String billNo=null;// Ʊ�ݱ��
String payForUse=null;// ������;
String remark=null;// ��ע��Ϣ
String person=null;// ¼����
java.util.Date time=null;// ¼��ʱ��
Pay pay=new Pay();

String orderState=null;// ����״̬
String orderType=null;// ��������
Customer customer=new Customer();// �ͻ�����
String store=null;//���۵���
Double orderAmount=0.00;//�������
Double hte=0.00;//�������
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
      <div align="center">�����ѯ������ͻ�������<%=khxm%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#cccccc" align="center"> 
               <td > 
                <div align="center">�������</div>              </td>
				 <td ><div align="center">ʵ�ս��</div></td>
				 <td > 
                <div align="center">Ӧ�ս��</div>              </td>
				  <td > 
                <div align="center">��������</div>              </td>
				 <td > 
                <div align="center">����״̬</div>              </td>
				
            </tr>
<%


	call = (Call) service.createCall();
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
	Order[] obj2  = (Order[])call.invoke(new Object[]{custId});



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


	for(int j=0;j<obj2.length;j++)
	{
		orderId=obj2[j].getOrderId();  //�������
		orderType=obj2[j].getOrderType();// ��������
		orderState=obj2[j].getOrderState();// ����״̬
		orderAmount=obj2[j].getOrderAmount();//�������
		//						orderAmount=obj2[j].getPayForUse();//������;


		if(orderType.equals("��װ����"))
		{
			orderAmount=hte;
			orderType="��װ��������װ��ƣ���װʩ����";
		}

		amount=0.00;// �տ���

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
	<td align="center">С��</td>
	<td align="center"><%=cf.formatDouble(allamount)%></td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	<td align="center">&nbsp;</td>
	</tr>
  </table>

<P>
<center>��װ��������װ��ƣ���װʩ���������տ���ϸ</center>	
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF"> 
  <td align="center">��ͬ��</td>
  <td align="center">������;</td>
  <td align="center">�տ���</td>
  <td align="center">�տ�����</td>
  <td align="center">��ע</td>
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
		payTime=obj[i].getPayTime();// �տ�����
		payForUse=obj[i].getPayForUse();// ������;
		remark=obj[i].getRemark();// ��ע��Ϣ
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
	<td align="center">��װ����С��</td>
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

