<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150131'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[������������Ŀ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	String bjjbbm=request.getParameter("bjjbbm");
	String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));


	ls_sql="SELECT xmdlmc,xmxlmc,xmflmc,xmbh,bj_jzbjb.xmmc,DECODE(bj_jzbjb.sfbxx,'1','<font color=\"#FF0000\">�ر���</font>','2','<font color=\"#CC00CC\">������</font>','3','��ѡ��','9','<font color=\"#0000FF\">������</font>') sfbxx,smmc,jdm_jldwbm.jldwmc,bj_jzbjb.cbenj,bj_jzbjb.sgcbj,bj_jzbjb.bj,bj_jzbjb.clbj,bj_jzbjb.zcf,bj_jzbjb.rgbj,bj_jzbjb.ysf,bj_jzbjb.jxbj,bj_jzbjb.shf,bj_jzbjb.qtf,bj_jzbjb.sgdbj,DECODE(bj_jzbjb.sfyxdz,'Y','����','N','��') sfyxdz,bj_jzbjb.zdzk,gycl,flmcgg,bz,bj_jzbjb.glxmbh,bj_jzbjb.xh,DECODE(bj_jzbjb.sfxycl,'Y','��Ҫ','N','��') sfxycl,DECODE(bj_jzbjb.sfxyyjd,'Y','��Ҫ','N','��') sfxyyjd";
	ls_sql+=" FROM bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,jdm_jldwbm,bdm_xmflbm  ";
    ls_sql+=" where bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm(+) ";
	ls_sql+=" and bj_jzbjb.xmflbm=bdm_xmflbm.xmflbm(+)"; 	
	ls_sql+=" and bj_jzbjb.dqbm='"+bj_jzbjb_dqbm+"' and bj_jzbjb.bjjbbm='"+bjjbbm+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
    ls_sql+=" order by bj_jzbjb.dqbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzbjb.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��



	pageObj.alignStr[21]="align='left'";

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="310%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��Ŀ����</td>
	<td  width="4%">��ĿС��</td>
	<td  width="4%">��Ŀ����</td>
	<td  width="4%">��Ŀ���</td>
	<td  width="9%">��Ŀ����</td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="4%">����</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�ɱ���</td>
	<td  width="2%">ʩ���ɱ���</td>
	<td  width="2%">����Ԥ���</td>
	<td  width="2%">���ķ�</td>
	<td  width="2%">���ķ�</td>
	<td  width="2%">�˹���</td>
	<td  width="2%">�����</td>
	<td  width="2%">��е��</td>
	<td  width="2%">��ķ�</td>
	<td  width="2%">������</td>
	<td  width="2%">���̻�������</td>
	<td  width="2%">�Ƿ���������</td>
	<td  width="2%">����ۿ�</td>
	<td  width="14%">��������������˵��</td>
	<td  width="10%">�������ƹ��</td>
	<td  width="6%">��ע</td>
	<td  width="5%">������Ŀ���</td>
	<td  width="2%">�������</td>
	<td  width="2%">�Ƿ���Ҫ����</td>
	<td  width="2%">�Ƿ���Ԥ����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>