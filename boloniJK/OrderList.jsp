<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">订单查询结果</div>
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
                <div align="center">家装订单状态</div>              </td>
               <td > 
                <div align="center">订单状态</div>              </td>
				 <td > 
                <div align="center">订单类型</div>              </td>
				 <td > 
                <div align="center">客户姓名</div>              </td>
				 <td > 
                <div align="center">客户编号</div>              </td>
				 <td > 
                <div align="center">移动电话</div>              </td>
				 <td > 
                <div align="center">订单金额</div>              </td>
				 <td > 
                <div align="center">地址</div>              </td>
				 <td > 
                <div align="center">销售店面</div>              </td>
            </tr>
<%
		String orderId=request.getParameter("orderId");

		String custId=request.getParameter("custId");
		String cx=request.getParameter("cx");
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;

			String orderState;// 订单状态
			String orderType;// 订单类型
			Customer customer=new Customer();// 客户对象
			String store;//销售店面
			Double orderAmount;//订单金额
			String YblState="";
			Order order=new Order();
			Connection conn = null;

			ResultSet rs = null;
			PreparedStatement ps=null;
			String ls_sql=null;
            try {
                 call = (Call) service.createCall();
				//url = "";
				 call.setTargetEndpointAddress(new java.net.URL(url) );
				 if("1".equals(cx))
				 {
				conn=cf.getConnection();
				ls_sql="select ztmc from jc_order_ybl,dm_orderzt where jc_order_ybl.order_zt=dm_orderzt.ztbm and order_id='"+orderId+"'";
				ps= conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())
				{
					YblState=rs.getString(1);
				}
				rs.close();
				ps.close();

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

                 order = (Order) call.invoke(new Object[]{orderId});

				 orderId=order.getOrderId();  //订单编号
				 orderState=order.getOrderState();// 订单状态
				 orderType=order.getOrderType();// 订单类型
				 customer=order.getCustomer();// 客户对象
				 store=order.getStore();//销售店面
				 if(store==null)
					 store="";
				 orderAmount=order.getOrderAmount();//订单金额
				 %>
				 
				  <tr bgcolor="#FFFFFF"align="center"> 
					<td align="center"><%=orderId%></td>
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
				<% }
				 if("2".equals(cx))
				 {
				 //call.setOperationName("listOrderByCustId" );// 这是要调用的方法
				 QName qn = new QName("urn:BeanService", "Customer");
				 call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
                                new BeanDeserializerFactory(Customer.class, qn));
				   qn = new QName("urn:BeanService", "Order");
				  call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
                                new BeanDeserializerFactory(Order.class, qn));
			      call.setOperationName(new QName("Order", "listOrderByCustId"));
                  //设定传入的参数，
                  call.addParameter("custId", qn, ParameterMode.IN);
                  //设定返回的参数
                  call.setReturnType(qn, Order[].class);
                 Order[] obj  = (Order[])call.invoke(new Object[]{custId});

				 conn=cf.getConnection();
				 for(int i=0;i<obj.length;i++)
					 {
					 orderId=obj[i].getOrderId();  //订单编号
					 orderState=obj[i].getOrderState();// 订单状态
					 orderType=obj[i].getOrderType();// 订单类型
					 customer=obj[i].getCustomer();// 客户对象
					 store=obj[i].getStore();//销售店面
					 if(store==null)
					 store="";
					 orderAmount=obj[i].getOrderAmount();//订单金额

		
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
					<td align="center"><%=orderId%></td>
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
					 <%
					 }
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

