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
<title>�������ѯ����</title>
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
        <p align="center"> ���ɼҾӶ�����ѯ 
        <p align="center" class="STYLE1">ע�⣺ֻ�о��и�����Ķ�����ѯȨ�ޣ�����ʹ�ñ�ģ��      
      </div>
    </td>
  </tr>
  <tr> 
    <td width="100%" height="197" > 
      <div align="center"> 
        <p><A HREF="/jcjj/mmdd/SelectCxJc_mmydd.jsp?www.youboli.com=<%=cf.makejm("040603",yhdlm)%>" >ľ�Ŷ�����ѯ</A></p>
        <p><A HREF="/jcjj/cgdd/SelectCxJc_cgdd.jsp?www.youboli.com=<%=cf.makejm("041003",yhdlm)%>" >���񶩵���ѯ</A></p>
        <p><A HREF="/jcjj/jjdd/SelectCxJc_jjdd.jsp?www.youboli.com=<%=cf.makejm("041803",yhdlm)%>" >�Ҿ߶�����ѯ</A></p>
        <p><A HREF="/jcjj/zcdd/SelectCxJc_zcdd.jsp?www.youboli.com=<%=cf.makejm("041503",yhdlm)%>" >���Ķ�����ѯ</A></p>
      </div>
    </td>
  </tr>
</table>
</body>
</html>


