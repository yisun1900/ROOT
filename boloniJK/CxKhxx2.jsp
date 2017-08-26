<%@ page contentType="text/html;charset=gbk" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>同步客户资料</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<form name="form1">
<table border=0 cellpadding="1" cellspacing=1 bgcolor="#CCCCCC" >
<tr>
<td bgcolor="#FFFFFF"></td>
<td bgcolor="#FFFFFF">客户编号</td>
<td bgcolor="#FFFFFF">客户姓名</td>
<td bgcolor="#FFFFFF">客户地址</td>
<td bgcolor="#FFFFFF">客户电话</td>
<td bgcolor="#FFFFFF">设计合同号</td>
</tr>
<%
//request.setCharacterEncoding("utf-8");
String khxm=request.getParameter("khxm");

//out.println(khxm);
String url = cf.getValue("kb_url");
        Service service = new Service();
            Call call;
			String custName=null;
			String address=null;
			String cellphone=null;
			String decOrderId=null;
			String custId=null;
			//Customer customer=new Customer();
           try {
                 call = (Call) service.createCall();
				//url = "";
				 call.setTargetEndpointAddress(new java.net.URL(url) );
                 //call.setOperationName("getCustomer" );// 这是要调用的方法

				QName qn = new QName("urn:BeanService", "Customer");
				call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
                                new BeanDeserializerFactory(Customer.class, qn));
			 call.setOperationName(new QName("Customer", "getCustomerByCustName"));
            //设定传入的参数，
             call.addParameter("custName", qn, ParameterMode.IN);
            //设定返回的参数
             call.setReturnType(qn, Customer[].class);
            Customer[] customer = (Customer[])call.invoke(new Object[] {khxm});
			//out.println(customer.length);
			if(customer.length>0)
			{
              for(int i=0;i<customer.length;i++) 
				{
				 custId=customer[i].getCustId();
				 custName=customer[i].getCustName();
				 address=customer[i].getAddress();
				 cellphone=customer[i].getCellphone();
				 decOrderId=customer[i].getDecOrderId();
				 //out.println(custName);
				 %>
				 <tr>
				 <td bgcolor="#FFFFFF"><input type="radio"  name="gg" value="<%=custId%>|<%=cellphone%>|<%=address%>|<%=decOrderId%>" onClick="setKhxx()"></td>
				 <td bgcolor="#FFFFFF"><%=custId%></td>
				 <td bgcolor="#FFFFFF"><%=custName%></td>
				 <td bgcolor="#FFFFFF"><%=address%></td>
				 <td bgcolor="#FFFFFF"><%=cellphone%></td>
				 <td bgcolor="#FFFFFF"><%=decOrderId%></td>
				 </tr>
				 <%
				}
                
			}
			else
				{
			%>
			
			<script type="text/javascript">
			alert("找不到该客户");
			window.close();
			</script>
			<%
				}
				
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        
      
 %>
</table>
</form>
</body>
</html>
<script type="text/javascript"> 
			//window.opener.document.insertform.khxm.value="123";
			function setKhxx()
			{
			for(var i=0;i<document.form1.length;i++)
				{
				//alert("123");
				var e=document.form1.elements[i];
				//alert("123");
				if(e.type=="radio" & e.checked)
					{
					var gg=e.value;
					//alert(gg);
					var hh=gg.split("|");
					window.opener.document.insertform.boloniKhbh.value=hh[0];
					window.opener.document.insertform.lxfs.value=hh[1];
					window.opener.document.insertform.yxtxdz.value=hh[2];
					window.opener.document.insertform.sjhth.value=hh[3];
					//alert(hh[3]);
					window.close();
					}
				}
			}
</script>