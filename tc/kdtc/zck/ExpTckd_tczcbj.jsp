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

	ls_sql="SELECT bjjbmc,DECODE(tckd_tczcbj.yxthsj,'Y','��','N','��'),tckd_tczcbj.kdbm,tckd_tczcbj.nbbm,tckd_tczcbj.ppmc,tckd_tczcbj.gysmc,jxc_cldlbm.cldlmc,clxlmc,tckd_tczcbj.cpbm,tckd_tczcbj.cpmc,tckd_tczcbj.xh,tckd_tczcbj.gg,tckd_tczcbj.jldw,tckd_tczcbj.xdjldw,tckd_tczcbj.xdb,tckd_tczcbj.sh,DECODE(tckd_tczcbj.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs,tckd_tczcbj.jsj,DECODE(tckd_tczcbj.sfyx,'1','��Զ��Ч','2','��Ч','3','�׶���Ч') sfyx,tckd_tczcbj.yxkssj,tckd_tczcbj.yxjzsj, tckd_tczcbj.xuhao ";
	ls_sql+=" FROM tckd_tczcbj,jxc_cldlbm,jxc_clxlbm,jdm_bjjbbm ";
    ls_sql+=" where tckd_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tckd_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tczcbj.bjjbbm=jdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tczcbj.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckd_tczcbj.bjjbbm,tckd_tczcbj.kdbm,tckd_tczcbj.tccpdlbm,tckd_tczcbj.tccplbbm,tckd_tczcbj.cpbm";
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
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���ۼ���</td>
	<td  width="5%">�����滻����</td>
	<td  width="5%">�������</td>
	<td  width="5%">�ڲ�����</td>
	<td  width="5%">Ʒ��</td>
	<td  width="9%">��Ӧ��</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="7%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">�µ�������λ</td>
	<td  width="3%">�µ���</td>
	<td  width="3%">���(%)</td>
	<td  width="4%">�Ƿ��账��С��</td>
	<td  width="3%">�����</td>
	<td  width="3%">�Ƿ���Ч</td>
	<td  width="4%">��Ч��ʼʱ��</td>
	<td  width="4%">��Ч����ʱ��</td>
	<td  width="2%">�������</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>