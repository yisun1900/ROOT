<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">付款计划查询结果</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr > 
			
              <td > 
                <div align="center">付款序号</div>              </td>
               <td > 
                <div align="center">合同编号</div>              </td>
				 <td > 
                <div align="center">计划付款金额</div>              </td>
				 <td > 
                <div align="center">计划付款日期</div>              </td>
				 <td > 
                <div align="center">款项用途</div>              </td>
				 <td > 
                <div align="center">备注信息</div>              </td>
				 <td > 
                <div align="center">录入人</div>              </td>
				 <td > 
                <div align="center">录入时间</div>              </td>
            </tr>
<%
		String contractId=request.getParameter("hth");
		//String custId=request.getParameter("custId");
		String cx=request.getParameter("cx");
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			//String orderId;  //订单编号
			String id=null;//收款序号
			//String contractId=null;  //合同编号
			Double amount=0.00;// 收款金额
			java.util.Date payTime=null;// 收款日期
			String payType=null;// 付款方式
			String billNo=null;// 票据编号
			String payForUse=null;// 款项用途
			String remark=null;// 备注信息
			String person=null;// 录入人
			java.util.Date time=null;// 录入时间

			
			
            try {
                 call = (Call) service.createCall();
				//url = "";
				 call.setTargetEndpointAddress(new java.net.URL(url));
				QName qn = new QName("urn:BeanService", "PayPlan");
				 call.registerTypeMapping(PayPlan.class, qn, new BeanSerializerFactory(PayPlan.class, qn), 
                                new BeanDeserializerFactory(PayPlan.class, qn));
				  
			      call.setOperationName(new QName("PayPlan", "listPayPlanByContractId"));
                  //设定传入的参数，
                  call.addParameter("contractId", qn, ParameterMode.IN);
                  //设定返回的参数
                  call.setReturnType(qn, PayPlan[].class);
                
				
                 PayPlan[] obj  = (PayPlan[])call.invoke(new Object[]{contractId});
				 for(int i=0;i<obj.length;i++)
					 {
					 id=obj[i].getId();
					 contractId=obj[i].getContractId();  //订单编号
					 amount=obj[i].getAmont();// 订单状态
					 payTime=obj[i].getPayTime();// 订单类型
					  //payType=obj[i].getPayType();// 客户对象
					 //billNo=obj[i].getBillNo();// 客户对象
					 payForUse=obj[i].getPayForUse();
					 remark=obj[i].getRemark();// 备注信息
					 person=obj[i].getPerson();// 录入人
					 time=obj[i].getTime();// 录入时间
					SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd");
					String payTime2=sdf.format(payTime); 
					String time2=sdf.format(time);
					
					 %>
					 
					  <tr align="center" bgcolor="#FFFFFF">
					    
						<td align="center"><%=id%></td>
						<td align="center"><%=contractId%></td>
						<td align="center"><%=amount%></td>
						<td align="center"><%=payTime2%></td>
						
						<td align="center"><%=payForUse%></td>
					    <td align="center"><%=remark%></td>
					    <td align="center"><%=person%></td>
						<td align="center"><%=time2%></td>
						</tr>
					 <%
					 }
			}catch (Exception e) {
			out.println(e.getMessage());
			return;
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
