<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
	String orderId=request.getParameter("orderId");
	String orderType=cf.GB2Uni(cf.getParameter(request,"orderType"));

	String username="YBL";
	String userpassword="kS2aOQBhAWGwMSEpIJT774gcSBA=";
	String returnURL="";
	if (orderType.equals("���񶩵�"))
	{
		returnURL="http://192.168.8.170/Kebao/sale/cabinet/ord_view_detail.jsp?TYPE=ORD_ID&ORD_ID="+orderId;
	}
	else if (orderType.equals("���Ŷ���"))
	{
		returnURL="http://192.168.8.170/Kebao/sale/idoor/ord_view.jsp?ORD_ID="+orderId;
	}
	else if (orderType.equals("�Ҿ߶���"))
	{
		returnURL="http://192.168.8.170/Kebao/sale/fur/viewOrder.htm?ordId="+orderId;
	}
	else
	{
		returnURL="http://192.168.8.170/Kebao/sale/retail/ord_view.jsp?ORD_ID="+orderId;
	}

//	username=java.net.URLEncoder.encode(username,"UTF-8") ;
//	userpassword=java.net.URLEncoder.encode(userpassword,"UTF-8") ;
//	returnURL=java.net.URLEncoder.encode(returnURL,"UTF-8") ;
%> 
<form method="get" action="http://192.168.8.170/Kebao/ybl_login.jsp" name="selectform">


<input type="hidden" name="username" size="20" value="<%=username%>" >
<input type="hidden" name="userpassword" size="40" value="<%=userpassword%>" >
<BR>
<input type="hidden" name="returnURL" size="110" value="<%=returnURL%>" >


</form>

</body>
</html>

<SCRIPT language=javascript >
<!--
	selectform.submit();

function f_do()//����FormName:Form������
{
	selectform.submit();
}
//-->
</SCRIPT>

