<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bj_gzbjb_dqbm=request.getParameter("bj_gzbjb_dqbm");
	String bjjbbm=request.getParameter("bjjbbm");


	ls_sql="SELECT xmdlmc,xmxlmc,xmbh,xmmc,DECODE(bj_gzbjb.sfbxx,'1','<font color=\"#FF0000\">��ѡ</font>','2','�Ǳ�ѡ','3','<font color=\"#0000FF\">����ѡ</font>') sfbxx,jldwmc,smmc,cbenj,sgdbj,bj_gzbjb.bj,DECODE(sfxycl,'1','��Ҫ','2','����Ҫ') sfxycl,zcmc,zcgg,zcf,clf,rgf,jjf,glfbl,gycl";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+) and bjlx='1'";
	ls_sql+=" and bj_gzbjb.dqbm='"+bj_gzbjb_dqbm+"' and bj_gzbjb.bjjbbm='"+bjjbbm+"'";
    ls_sql+=" order by bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.alignStr[18]="align='left'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">��Ŀ����</td>
	<td  width="6%">��ĿС��</td>
	<td  width="5%">��Ŀ���</td>
	<td  width="9%">��Ŀ����</td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="3%">������λ</td>
	<td  width="5%">����</td>
	<td  width="4%">�ɱ���</td>
	<td  width="4%">ʩ���ӱ���</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="3%">�Ƿ���Ҫ����</td>
	<td  width="7%">��������</td>
	<td  width="7%">���Ĺ��</td>
	<td  width="4%">���ķ�</td>
	<td  width="4%">���ķ�</td>
	<td  width="4%">�˹���</td>
	<td  width="4%">��е��</td>
	<td  width="3%">����Ѱٷֱ�</td>
	<td  width="24%">��������������˵��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>