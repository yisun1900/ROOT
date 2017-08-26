<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">订单明细表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr > 
				<td > 
                <div align="center">订单明细编号</div>              </td>
              <td > 
                <div align="center">订单编号</div>              </td>
				<td > 
                <div align="center">产品名称</div>              </td>
               <td > 
                <div align="center">产品规格</div>              </td>
				 <td > 
                <div align="center">明细状态</div>              </td>
				 <td > 
                <div align="center">单价</div>              </td>
				 <td > 
                <div align="center">数量</div>              </td>
				 <td > 
				  <div align="center">单位</div>              </td>
				 <td > 
                <div align="center">折扣</div>              </td>
				 <td > 
                <div align="center">总金额</div>              </td>
				
              
            </tr>
<%
		String orderId=request.getParameter("orderId");
		//String custId=request.getParameter("custId");
		
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			String orderDetailId=null;  //订单明细编号
			//String orderId;//订单编号
			String pId;//产品编号
			String pName;//产品名称
			String pRemark;//产品描述
			String pNorm;//产品规格
			String pState;//明细状态
			Double pWidth=0.00;//产品宽度
			Double pDepth=0.00;//产品深度
			Double pHeight=0.00;//产品高度
			Double price=0.00;//单价
			Double count=0.00;//数量
			Double discount=0.00;//折扣
			Double addRate=0.00;//加价系数
			Double amount=0.00;//总金额
			String unit;//产品单位
			String stockType;//库存类型
			String remark;//备注信息
			String pType;//产品类型
			String material;//材质名称
			String pSn;//产品序号

			OrderDetail orderDetail=new OrderDetail();
			Connection conn = null;//
			//Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement ps=null;
			String ls_sql=null;
            try {
				call = (Call) service.createCall();

				call.setTargetEndpointAddress(new java.net.URL(url) );

				QName qn = new QName("urn:BeanService", "OrderDetail");
				call.registerTypeMapping(OrderDetail.class, qn, new BeanSerializerFactory(OrderDetail.class, qn), 
					new BeanDeserializerFactory(OrderDetail.class, qn));

				call.setOperationName(new QName("OrderDetail", "listOrderDetailByOrderId"));
				//设定传入的参数，
				call.addParameter("orderId", qn, ParameterMode.IN);
				//设定返回的参数
				call.setReturnType(qn, OrderDetail[].class);

				OrderDetail[] obj  = (OrderDetail[])call.invoke(new Object[]{orderId});

				 for(int i=0;i<obj.length;i++)
					 {
					 orderDetailId=obj[i].getOrderDetailId();
					 //orderId=obj[i].getOrderId();  //订单编号
					    pId=obj[i].getPId();
						pName=obj[i].getPName();
						//pRemark;//产品描述
						pNorm=obj[i].getPNorm();//产品规格
						pState=obj[i].getPState();//明细状态
						
						price=obj[i].getPrice();//单价
						count=obj[i].getCount();//数量
						discount=obj[i].getDiscount();//折扣
						addRate=obj[i].getAddRate();//加价系数
						amount=obj[i].getAmount();;//总金额
						unit=obj[i].getUnit();//产品单位
			
					 %>
					 
					 <tr align="center" bgcolor="#FFFFFF">
					 <td align="center" bgcolor="#FFFFFF"><%=orderDetailId%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=orderId%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=pName%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=pNorm%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=pState%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=price%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=count%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=unit%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=discount%></td>
					 <td align="center" bgcolor="#FFFFFF"><%=amount%></td>

				</tr>
					 <%
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

