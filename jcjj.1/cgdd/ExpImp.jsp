<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String ddbh = request.getParameter("ddbh");
%>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr>
    <td height="90" colspan="2" align="center">导入导出信息</td>
  </tr>
  <tr>
    <td width="42%" height="68">&nbsp;</td>
    <td width="58%"><A HREF="ExpKhxx.jsp?ddbh=<%=ddbh%>">导出订单信息</A></td>
  </tr>
  <tr>
    <td height="63">&nbsp;</td>
    <td><A HREF="/jcjj/cgcl/ht/LoadData.jsp?ddbh=<%=ddbh%>">导入订单明细</A></td>
  </tr>
  <tr>
    <td height="63">&nbsp;</td>
    <td><A HREF="/jcjj/cgdd/ViewJc_cgdtmx.jsp?ddbh=<%=ddbh%>">查看订单明细</A></td>
  </tr>
</table>

<p>&nbsp;</p>
<p>&nbsp;</p>
