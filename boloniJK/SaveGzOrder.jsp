<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
java.util.Date date2=new java.util.Date();
SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd");
String date=sdf.format(date2); 
String ls=null;
String orderId=null;
String YblState=null;
String bz=null;

String YblState2=null;
String bz2=null;
java.util.Date lrsj2=null;
String lrr2=null;
String orderState=null;
String url = cf.getValue("kb_url");
orderId=cf.GB2Uni(request.getParameter("orderId"));
YblState=cf.GB2Uni(request.getParameter("YblState"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int i=0;
Service service = new Service();
Call call;
Order order=new Order();
try {
	conn=cf.getConnection();

	ls_sql="select order_zt,lrr,lrsj,bz from jc_order_ybl where order_id='"+orderId+"'";
    ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
		{
			i=1;
			YblState2=rs.getString(1);
			lrr2=rs.getString(2);
			lrsj2=rs.getDate(3);
			bz2=rs.getString(4);
		}
				
		rs.close();
		ps.close();
	if(i==0)
	{
	ls_sql="insert into jc_order_ybl ( order_id,order_zt,bz,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,to_date('"+date+"','yyyy-mm-dd') ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,orderId);
	ps.setString(2,YblState);
	ps.setString(3,bz);
	ps.setString(4,yhmc);
	//ps.setDate(5,date);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	}
	if(i==1)
	{
	ls_sql="update jc_order_ybl set order_id='"+orderId+"',order_zt='"+YblState+"',bz='"+bz+"',lrr='"+yhmc+"',lrsj=to_date('"+date+"','yyyy-mm-dd')  where order_id='"+orderId+"'";
	ps= conn.prepareStatement(ls_sql);
	}
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(ddjlh))+1,1)";
		ls_sql+=" from  jc_order_mx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		ps.close();
		rs.close();
		String ddjlh=cf.addZero(xh,8);

		out.println(ddjlh);
		ls_sql="insert into jc_order_mx (ddjlh,order_id,order_zt,bz,lrr,lrsj ,order_kb_zt) ";
		ls_sql+=" values ( '"+ddjlh+"','"+orderId+"','"+YblState2+"','"+bz2+"','"+lrr2+"',to_date('"+lrsj2+"','yyyy-MM-dd'),'"+orderState+"' ) ";
		//out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		

		call = (Call) service.createCall();
				//url = "";
				 call.setTargetEndpointAddress(new java.net.URL(url) );
				 QName qn = new QName("urn:BeanService", "Customer");
				 call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
                                new BeanDeserializerFactory(Customer.class, qn));
				 qn = new QName("urn:BeanService", "Order");
				call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
                                new BeanDeserializerFactory(Order.class, qn));
			    call.setOperationName(new QName("Order", "listOrderByOrderId"));
                //设定传入的参数，
                call.addParameter("orderId", qn, ParameterMode.IN);
                //设定返回的参数
                call.setReturnType(qn, Order.class);
                 //call.setOperationName("listOrderByOrderId" );// 这是要调用的方法
                 order = (Order) call.invoke(new Object[]{orderId});
				 
				 orderState=order.getOrderState();// 订单状态

		if (ps.executeUpdate()!=1)
		{
			out.println("<BR>存盘失败！");
		}
		else
		{
			%>
			<SCRIPT language=javascript >
			<!--
			alert("存盘成功！");
			window.close();
			//-->
			</SCRIPT>
			<%
		}
		
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>