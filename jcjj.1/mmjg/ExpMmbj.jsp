<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String dqbm=request.getParameter("dqbm");
	
	ls_sql="SELECT distinct jc_mmbjb.mmxh as mmxh,jc_mmbjb.ysbm as ysbm,jdm_mmczbm.mmczmc,jc_mmbjb.qhjgqjbm,jdm_qhjgqj.qhjgqj,jc_mmbjb.ztmdj as ztmdj,dmsjg,dmtjg,mtjg,dkmtjg,zdmjjl,yksmjjl,zmmjg,ysbljjl,tlmpmdj,jc_mmbjb.bz  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmbjb,jdm_qhjgqj,jc_mmxhb";
    ls_sql+=" where jc_mmbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmbjb.mmxh=jc_mmxhb.mmxh(+)";
    ls_sql+=" and jc_mmbjb.dqbm='"+dqbm+"'";
    ls_sql+=" order by jc_mmbjb.mmxh,jc_mmbjb.ysbm,jc_mmbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"mmxh","mmczmc","qhjgqj","ztmdj","dmsjg","dmtjg","mtjg","dkmtjg","zmmjg","zdmjjl","yksmjjl","ysbljjl","tlmpmdj","bz"};
	pageObj.setDisColName(disColName);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">ľ���ͺ�</td>
	<td  width="14%">����</td>
	<td  width="9%">ǽ��۸�����</td>
	<td  width="7%">�����ŵ���</td>
	<td  width="6%">�����ȼ۸�</td>
	<td  width="6%">�����׼۸�</td>
	<td  width="7%">˫������ÿ�׵���</td>
	<td  width="7%">��������ÿ�׵���</td>
	<td  width="5%">��ĸ�żӼ���</td>
	<td  width="5%">�۵��żӼ���</td>
	<td  width="5%">�ƿ���ľ���ɲļӼ���</td>
	<td  width="5%">���������Ӽ���</td>
	<td  width="6%">������ÿƽ�׵���</td>
	<td  width="12%">��ע</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 

</body>
</html>
