<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
	String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

	String ls_sql=null;
	ls_sql="SELECT dm_dqbm.dqmc,hxmc,bj_cltcfjsl.tcmc,bj_cltcfjsl.jgwzbm,bj_cltcfjsl.sl ";
	ls_sql+=" FROM dm_dqbm,bj_cltcfjsl,dm_hxbm  ";
    ls_sql+=" where bj_cltcfjsl.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_cltcfjsl.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_cltcfjsl.dqbm='"+dqbm+"'";
    ls_sql+=" and bj_cltcfjsl.tcmc='"+tcmc+"'";
    ls_sql+=" and bj_cltcfjsl.hxbm='"+hxbm+"'";
    ls_sql+=" order by bj_cltcfjsl.jgwzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��




%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ײͷ���������<%=tcmc%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">����</td>
	<td  width="13%">����</td>
	<td  width="21%">�ײ�����</td>
	<td  width="9%">����λ��</td>
	<td  width="9%">����</td>
</tr>
<%
	pageObj.displayDate();
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