<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT wlbm,glflmc,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,DECODE(lx,'1','�����ж�Ӧ����','2','�޶�Ӧ����') lx,glmc,pp,xhgg,cljldwmc,TO_CHAR(bzdj),TO_CHAR(dj),ylclyl,slclyl,xbclk  ";
	ls_sql+=" FROM cw_dejsclmx,bdm_cljldwbm,bdm_glflbm  ";
    ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"'";
    ls_sql+=" and cw_dejsclmx.jldwbm=bdm_cljldwbm.cljldwbm(+) and cw_dejsclmx.glflbm=bdm_glflbm.glflbm(+)";

    ls_sql+=" UNION ALL ";
/*
*/
	ls_sql+=" SELECT wlbm,glflmc,DECODE(wlllbz,'Y','��Ҫ','N','��') wlllbz,'' lx,glmc,pp,xhgg,cljldwmc,TO_CHAR(dj),TO_CHAR(dj),xhl,0,0  ";
	ls_sql+=" FROM bj_khglfxb,bdm_cljldwbm,bdm_glflbm  ";
	ls_sql+=" where bj_khglfxb.khbh='"+khbh+"'";
    ls_sql+=" and bj_khglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_khglfxb.glflbm=bdm_glflbm.glflbm(+)";
	ls_sql+=" and bj_khglfxb.glflbm='1' and bj_khglfxb.wlllbz='N' ";//ֻȡ�����࣬��������Ҫ��������

	ls_sql+=" order by wlllbz desc,lx desc,glmc";
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
	<td  width="5%">������ϱ���</td>
	<td  width="5%">���Ϸ������</td>
	<td  width="5%">�赽��������</td>
	<td  width="7%">����</td>
	<td  width="16%">��������</td>
	<td  width="12%">Ʒ��</td>
	<td  width="10%">�ͺŹ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">��׼����</td>
	<td  width="6%">���㵥��</td>
	<td  width="7%">Ӧ���������</td>
	<td  width="7%">ʵ���������</td>
	<td  width="8%">�貹���Ͽ�</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>