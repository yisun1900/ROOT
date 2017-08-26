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
      <div align="center">订单跟踪</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
            <tr> 
			<td > 
                <div align="center">跟单</div>              </td>
              <td > 
                <div align="center">订单编号</div>              </td>
				 <td > 
                <div align="center">订单状态</div>              </td>
				<td > 
                <div align="center">松下亿达订单状态</div>              </td>
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

		
		String orderId=null;
		String custId=request.getParameter("khbh");
		String cx=request.getParameter("cx");
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			//String orderId;  //订单编号
			String orderState=null;// 订单状态
			String orderType=null;// 订单类型
			Customer customer=new Customer();// 客户对象
			String store=null;//销售店面
			Double orderAmount=0.00;//订单金额
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
                 Order[] obj  = (Order[])call.invoke(new Object[]{custId});

				 
				 for(int i=0;i<obj.length;i++)
					 {
					 orderType=obj[i].getOrderType();// 订单类型
					 if("家装订单".equals(orderType))
						 continue;
					 orderId=obj[i].getOrderId();  //订单编号
					 orderState=obj[i].getOrderState();// 订单状态
					 
					 customer=obj[i].getCustomer();// 客户对象
					 store=obj[i].getStore();//销售店面
					 if(store==null)
					 store="";
					 orderAmount=obj[i].getOrderAmount();//订单金额

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
					 <td><a href="GzOrder.jsp?orderId=<%=orderId%>" target="_blank">跟踪</a></td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--





function f_do(FormName)//参数FormName:Form的名称
{
	if(javaTrim(FormName.orderId)=="") {
		alert("订单编号不能为空");
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
