<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">����ƻ���ѯ���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr > 
			
              <td > 
                <div align="center">�������</div>              </td>
               <td > 
                <div align="center">��ͬ���</div>              </td>
				 <td > 
                <div align="center">�ƻ�������</div>              </td>
				 <td > 
                <div align="center">�ƻ���������</div>              </td>
				 <td > 
                <div align="center">������;</div>              </td>
				 <td > 
                <div align="center">��ע��Ϣ</div>              </td>
				 <td > 
                <div align="center">¼����</div>              </td>
				 <td > 
                <div align="center">¼��ʱ��</div>              </td>
            </tr>
<%
		String contractId=request.getParameter("hth");
		//String custId=request.getParameter("custId");
		String cx=request.getParameter("cx");
		String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			//String orderId;  //�������
			String id=null;//�տ����
			//String contractId=null;  //��ͬ���
			Double amount=0.00;// �տ���
			java.util.Date payTime=null;// �տ�����
			String payType=null;// ���ʽ
			String billNo=null;// Ʊ�ݱ��
			String payForUse=null;// ������;
			String remark=null;// ��ע��Ϣ
			String person=null;// ¼����
			java.util.Date time=null;// ¼��ʱ��

			
			
            try {
                 call = (Call) service.createCall();
				//url = "";
				 call.setTargetEndpointAddress(new java.net.URL(url));
				QName qn = new QName("urn:BeanService", "PayPlan");
				 call.registerTypeMapping(PayPlan.class, qn, new BeanSerializerFactory(PayPlan.class, qn), 
                                new BeanDeserializerFactory(PayPlan.class, qn));
				  
			      call.setOperationName(new QName("PayPlan", "listPayPlanByContractId"));
                  //�趨����Ĳ�����
                  call.addParameter("contractId", qn, ParameterMode.IN);
                  //�趨���صĲ���
                  call.setReturnType(qn, PayPlan[].class);
                
				
                 PayPlan[] obj  = (PayPlan[])call.invoke(new Object[]{contractId});
				 for(int i=0;i<obj.length;i++)
					 {
					 id=obj[i].getId();
					 contractId=obj[i].getContractId();  //�������
					 amount=obj[i].getAmont();// ����״̬
					 payTime=obj[i].getPayTime();// ��������
					  //payType=obj[i].getPayType();// �ͻ�����
					 //billNo=obj[i].getBillNo();// �ͻ�����
					 payForUse=obj[i].getPayForUse();
					 remark=obj[i].getRemark();// ��ע��Ϣ
					 person=obj[i].getPerson();// ¼����
					 time=obj[i].getTime();// ¼��ʱ��
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





function f_do(FormName)//����FormName:Form������
{
	if(javaTrim(FormName.orderId)=="") {
		alert("������Ų���Ϊ��");
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
