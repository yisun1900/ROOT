<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
	String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

	ls_sql="SELECT bj_cltcfjsl.dqbm,dm_dqbm.dqmc,bj_cltcfjsl.tcmc,bj_cltcfjsl.hxbm,hxmc,bj_cltcfjsl.jgwzbm,bj_cltcfjsl.sl ";
	ls_sql+=" FROM dm_dqbm,bj_cltcfjsl,dm_hxbm  ";
    ls_sql+=" where bj_cltcfjsl.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_cltcfjsl.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_cltcfjsl.dqbm='"+dqbm+"'";
    ls_sql+=" and bj_cltcfjsl.tcmc='"+tcmc+"'";
    ls_sql+=" and bj_cltcfjsl.hxbm='"+hxbm+"'";
    ls_sql+=" order by bj_cltcfjsl.dqbm,bj_cltcfjsl.hxbm,bj_cltcfjsl.tcmc,bj_cltcfjsl.jgwzbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","DeleteBj_cltcfjsl.jsp","EditBj_cltcfjsl.jsp");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","hxmc","tcmc","jgwzbm","sl"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","tcmc","hxbm","jgwzbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("ɾ��");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ײͷ�������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="9%">����</td>
	<td  width="13%">����</td>
	<td  width="21%">�ײ�����</td>
	<td  width="9%">����λ��</td>
	<td  width="9%">����</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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