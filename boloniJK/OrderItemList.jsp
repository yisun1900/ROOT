<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>������ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">������ϸ��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr > 
				<td > 
                <div align="center">������ϸ���</div>              </td>
              <td > 
                <div align="center">�������</div>              </td>
				<td > 
                <div align="center">��Ʒ����</div>              </td>
               <td > 
                <div align="center">��Ʒ���</div>              </td>
				 <td > 
                <div align="center">��ϸ״̬</div>              </td>
				 <td > 
                <div align="center">����</div>              </td>
				 <td > 
                <div align="center">����</div>              </td>
				 <td > 
				  <div align="center">��λ</div>              </td>
				 <td > 
                <div align="center">�ۿ�</div>              </td>
				 <td > 
                <div align="center">�ܽ��</div>              </td>
				
              
            </tr>
<%
		String orderId=request.getParameter("orderId");
		//String custId=request.getParameter("custId");
		
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			String orderDetailId=null;  //������ϸ���
			//String orderId;//�������
			String pId;//��Ʒ���
			String pName;//��Ʒ����
			String pRemark;//��Ʒ����
			String pNorm;//��Ʒ���
			String pState;//��ϸ״̬
			Double pWidth=0.00;//��Ʒ���
			Double pDepth=0.00;//��Ʒ���
			Double pHeight=0.00;//��Ʒ�߶�
			Double price=0.00;//����
			Double count=0.00;//����
			Double discount=0.00;//�ۿ�
			Double addRate=0.00;//�Ӽ�ϵ��
			Double amount=0.00;//�ܽ��
			String unit;//��Ʒ��λ
			String stockType;//�������
			String remark;//��ע��Ϣ
			String pType;//��Ʒ����
			String material;//��������
			String pSn;//��Ʒ���

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
				//�趨����Ĳ�����
				call.addParameter("orderId", qn, ParameterMode.IN);
				//�趨���صĲ���
				call.setReturnType(qn, OrderDetail[].class);

				OrderDetail[] obj  = (OrderDetail[])call.invoke(new Object[]{orderId});

				 for(int i=0;i<obj.length;i++)
					 {
					 orderDetailId=obj[i].getOrderDetailId();
					 //orderId=obj[i].getOrderId();  //�������
					    pId=obj[i].getPId();
						pName=obj[i].getPName();
						//pRemark;//��Ʒ����
						pNorm=obj[i].getPNorm();//��Ʒ���
						pState=obj[i].getPState();//��ϸ״̬
						
						price=obj[i].getPrice();//����
						count=obj[i].getCount();//����
						discount=obj[i].getDiscount();//�ۿ�
						addRate=obj[i].getAddRate();//�Ӽ�ϵ��
						amount=obj[i].getAmount();;//�ܽ��
						unit=obj[i].getUnit();//��Ʒ��λ
			
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

