<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");
	String xmbh=request.getParameter("xmbh");

	ls_sql=" SELECT glflmc,wlbm,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,glmc,pp,xhgg,cljldwmc,TO_CHAR(dj),xhl,ROUND(xhl*dj,2)";
	ls_sql+=" FROM bj_khglfxb,bdm_cljldwbm,bdm_glflbm  ";
	ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.xmbh='"+xmbh+"'";
    ls_sql+=" and bj_khglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_khglfxb.glflbm=bdm_glflbm.glflbm(+)";
	ls_sql+=" order by bj_khglfxb.glflbm,glmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">������������ϸ��<%=khbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���Ϸ������</td>
	<td  width="5%">������ϱ���</td>
	<td  width="5%">�赽��������</td>
	<td  width="16%">��������</td>
	<td  width="12%">Ʒ��</td>
	<td  width="10%">�ͺŹ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">����</td>
	<td  width="6%">������</td>
	<td  width="6%">���</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>


</body>

</html>