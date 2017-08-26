<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%
String hth=request.getParameter("hth");
String orderId=hth;
//out.println(hth);
//out.println(orderId);

try {
	String url = cf.getValue("kb_url");
	
	Service service = new Service();
	
	Call call;
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

	call.setOperationName(new QName("Order", "listOrderByOrderId"));
	//�趨����Ĳ�����
	call.addParameter("hth", qn, ParameterMode.IN);
	//�趨���صĲ���
	call.setReturnType(qn, Order.class);

	Order order=new Order();
	order = (Order) call.invoke(new Object[]{hth});

	String custId=null;
	String custName=null;
	String address=null;
	String cellphone=null;
	String decOrderId=null;
	Customer customer=new Customer();// �ͻ�����
	
	customer=order.getCustomer();// �ͻ�����
	if(customer!=null)
	{
		custId=customer.getCustId();
		custName=customer.getCustName();
		address=customer.getAddress();
		cellphone=customer.getCellphone();
	}
	if(custName!=null&&!"".equals(custName))
	{
		%>
		<script type="text/javascript"> 
		window.opener.document.insertform.boloniKhbh.value='<%=custId%>';
		window.opener.document.insertform.khxm.value='<%=custName%>';
		window.opener.document.insertform.lxfs.value='<%=cellphone%>';
		window.opener.document.insertform.yxtxdz.value='<%=address%>';
		window.close();
		</script>
		<%
	}
	else
	{
		%>

		<script type="text/javascript">
		alert("�Ҳ����ÿͻ�");
		window.close();
		</script>
		<%
	}
}
catch (Exception e) {
	out.println(e);
}


 %>
</body>
</html>