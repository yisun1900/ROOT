<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String cglb=cf.GB2Uni(request.getParameter("cglb"));
String cllb=cf.GB2Uni(request.getParameter("cllb"));
%>
<center>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><a href="InsertXhmain.jsp?rkph=<%=rkph%>&cglb=<%=cglb%>&cllb=<%=cllb%>">�ͺ�¼��</a></DIV>
<DIV>&nbsp;</DIV>
<DIV><a href="InsertGgmain.jsp?rkph=<%=rkph%>&cglb=<%=cglb%>&cllb=<%=cllb%>">���¼��</a></DIV>
<DIV>&nbsp;</DIV>
<DIV><a href="InsertTmmain.jsp?rkph=<%=rkph%>&cglb=<%=cglb%>&cllb=<%=cllb%>">����¼��</a></DIV>
<DIV>&nbsp;</DIV>
<DIV><a href="InsertNbbmmain.jsp?rkph=<%=rkph%>&cglb=<%=cglb%>&cllb=<%=cllb%>">�ڲ�����¼��</a></DIV>
<DIV>&nbsp;</DIV>
<DIV><a href="SelectJxc_cljgbwhfc.jsp?rkph=<%=rkph%>&cglb=<%=cglb%>&cllb=<%=cllb%>">ѡ��¼��</a></DIV>
<DIV>&nbsp;</DIV>
<DIV><a href="SelectCxJxc_clsgd.jsp?rkph=<%=rkph%>&cglb=<%=cglb%>&cllb=<%=cllb%>">�깺��ת�ɹ��ƻ�</a></DIV>
<DIV>&nbsp;</DIV>
</center>