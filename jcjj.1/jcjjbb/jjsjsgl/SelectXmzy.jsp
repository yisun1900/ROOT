<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=request.getParameter("ssfgs");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="100%"> 
      <div align="center"> 
        <p align="center"> 集成家居订单查询 
        <p align="center" class="STYLE1">注意：只有具有各分项的订单查询权限，才能使用本模块      
      </div>
    </td>
  </tr>
  <tr> 
    <td width="100%" height="197" > 
      <div align="center"> 
        <p><A HREF="/jcjj/mmdd/SelectCxJc_mmydd.jsp?www.youboli.com=<%=cf.makejm("040603",yhdlm)%>" >木门订单查询</A></p>
        <p><A HREF="/jcjj/cgdd/SelectCxJc_cgdd.jsp?www.youboli.com=<%=cf.makejm("041003",yhdlm)%>" >橱柜订单查询</A></p>
        <p><A HREF="/jcjj/jjdd/SelectCxJc_jjdd.jsp?www.youboli.com=<%=cf.makejm("041803",yhdlm)%>" >家具订单查询</A></p>
        <p><A HREF="/jcjj/zcdd/SelectCxJc_zcdd.jsp?www.youboli.com=<%=cf.makejm("041503",yhdlm)%>" >主材订单查询</A></p>
      </div>
    </td>
  </tr>
</table>
</body>
</html>


