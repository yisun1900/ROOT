<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");

	ls_sql="SELECT tc_zck.cpbm,tc_zck.nbbm,tc_zck.cldl,tc_zck.clxl,tc_zck.cpmc,tc_zck.xh,tc_zck.gg,tc_zck.ppmc,tc_zck.gysmc,tc_zck.jldw,tc_zck.xdjldw,tc_zck.xdb,tc_zck.sh, DECODE(tc_zck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������'),tc_zck.lbxmbm,tc_zck.cxxmbm, DECODE(tc_zck.sfyx,'1','��������','2','ֹͣ����','3','�׶�����','4','��ǰ��ʵ'),tc_zck.yxkssj,tc_zck.yxjzsj,tc_zck.xuhao, DECODE(tc_zck.lx,'1','�ײ���','2','������','3','�����','4','�ײ���'),bdm_bjjbbm.bjjbmc,tc_zck.jsj,tc_zck.khxsdj,tc_zck.sgddj,tc_zck.sjj1,tc_zck.sjj2,tc_zck.sjj3,tc_zck.sjj4,tc_zck.sjj5  ";
	ls_sql+=" FROM bdm_bjjbbm,tc_zck  ";
    ls_sql+=" where tc_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_zck.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_zck.bjjbbm,tc_zck.cldl,tc_zck.clxl,tc_zck.cpbm";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="370%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��Ʒ����</td>
	<td  width="2%">�ڲ�����</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">��ƷС��</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="6%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="4%">Ʒ��</td>
	<td  width="6%">��Ӧ��</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�µ�������λ</td>
	<td  width="2%">�µ���</td>
	<td  width="2%">���</td>
	<td  width="2%">�Ƿ��账��С��</td>
	<td  width="3%">�����Ŀ����</td>
	<td  width="3%">������Ŀ����</td>
	<td  width="3%">�Ƿ���Ч</td>
	<td  width="3%">��Ч��ʼʱ��</td>
	<td  width="3%">��Ч����ʱ��</td>
	<td  width="2%">�������</td>
	<td  width="2%">����</td>
	<td  width="2%">���ۼ���</td>

	<td  width="2%">�����</td>
	<td  width="2%">�ͻ����۵���</td>
	<td  width="2%">ʩ���ӵ���</td>
	<td  width="2%">������1</td>
	<td  width="2%">������2</td>
	<td  width="2%">������3</td>
	<td  width="2%">������4</td>
	<td  width="2%">������5</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>