<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjjbbm=null;
	String dqbm=null;

	bjjbbm=request.getParameter("bjjbbm");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT tc_yhlbmx.lbmc,tc_yhlbmx.lbxmbm,tc_yhlbmx.xmmc,tc_yhlbmx.ppmc,tc_yhlbmx.xh,tc_yhlbmx.jldw,tc_yhlbmx.zqdj,tc_yhlbmx.dj,tc_yhlbmx.sjzj,tc_yhlbmx.sl,DECODE(tc_yhlbmx.lx,'1','����','2','����'),tc_yhlbmx.bz ";
	ls_sql+=" FROM tc_yhlbmx ";
    ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
    ls_sql+=" order by tc_yhlbmx.lbmc,lbxmbm,xmmc";
//	out.println(ls_sql);
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
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�������</td>
	<td  width="6%">��Ŀ����</td>
	<td  width="14%">��Ŀ����</td>
	<td  width="10%">Ʒ��</td>
	<td  width="12%">�ͺ�</td>
	<td  width="4%">������λ</td>
	<td  width="5%">��ǰ����</td>
	<td  width="5%">�Żݵ���</td>
	<td  width="5%">�����ۼ�</td>
	<td  width="4%">����</td>
	<td  width="4%">����</td>
	<td  width="24%">��ע������˵��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>