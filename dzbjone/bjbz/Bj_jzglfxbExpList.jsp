<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150132'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���������Ϸ���]��"+xtrzyhmc+"') ";
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
	String glbxh=null;
	String dqbm=null;
	String xmbh=null;
	String xmmc=null;
	String xmdlbm=null;
	String xmxlbm=null;
	String glflbm=null;
	String glfxclmc=null;
	String pp=null;
	String xh=null;
	String jldwbm=null;
	String xhl=null;
	String dj=null;
	String lrr=null;
	String lrsj=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzglfxb.bjbbh='"+bjbbh+"')";
	}
	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzglfxb.bjjbbm='"+bjjbbm+"')";
	}

	glbxh=request.getParameter("glbxh");
	if (glbxh!=null)
	{
		glbxh=glbxh.trim();
		if (!(glbxh.equals("")))	wheresql+=" and (bj_jzglfxb.glbxh="+glbxh+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzglfxb.dqbm='"+dqbm+"')";
	}
	xmbh=request.getParameter("xmbh");
	if (xmbh!=null)
	{
		xmbh=cf.GB2Uni(xmbh);
		if (!(xmbh.equals("")))	wheresql+=" and  (bj_jzglfxb.xmbh='"+xmbh+"')";
	}
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc='"+xmmc+"')";
	}
	xmdlbm=request.getParameter("xmdlbm");
	if (xmdlbm!=null)
	{
		xmdlbm=cf.GB2Uni(xmdlbm);
		if (!(xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+xmdlbm+"')";
	}
	xmxlbm=request.getParameter("xmxlbm");
	if (xmxlbm!=null)
	{
		xmxlbm=cf.GB2Uni(xmxlbm);
		if (!(xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+xmxlbm+"')";
	}

	ls_sql="SELECT bj_jzglfxb.xmbh,xmmc,glflmc,DECODE(bj_jzglfxb.wlllbz,'Y','��Ҫ','N','��') wlllbz,TO_CHAR(glfxclbm),glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,jldwmc,xhl,bj_jzglfxb.dj,bj_jzglfxb.bz,bj_jzglfxb.jqsfl,bj_jzglfxb.bsfl,bj_jzglfxb.tvocsfl,DECODE(bj_jzglfxb.lx,'1','��ӡ','2','����ӡ')";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,jdm_jldwbm,bdm_glflbm,jxc_clbm  ";
    ls_sql+=" where bj_jzglfxb.bjbbh=bj_jzbjb.bjbbh and bj_jzglfxb.dqbm=bj_jzbjb.dqbm and bj_jzglfxb.xmbh=bj_jzbjb.xmbh and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm";
    ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+)";
    ls_sql+=" and bj_jzglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_jzglfxb.glfxclbm=jxc_clbm.nbbm(+)" ;
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzglfxb.bjjbbm,bj_jzglfxb.glflbm,bj_jzglfxb.glbxh";
    pageObj.sql=ls_sql;

//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(20000);//����ÿҳ��ʾ��¼��



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td width="4%">��Ŀ���</td>
	<td width="11%">��Ŀ����</td>

	<td width="3%">���Ϸ���</td>
	<td width="4%">�赽��������</td>
	<td width="5%">���ϱ���</td>
	<td width="10%">��������</td>
	<td width="7%"><font color="#0000FF">Ʒ��</font></td>
	<td width="6%"><font color="#0000FF">�ͺ�</font></td>
	<td width="8%"><font color="#0000FF">���</font></td>
	<td width="3%">������λ</td>
	<td width="4%">����</td>
	<td width="4%"><font color="#0000FF">����</font></td>
	<td width="17%">��ע</td>
	<td  width="3%">��ȩ�ͷ���</td>
	<td  width="3%">���ͷ���</td>
	<td  width="3%">TVOC�ͷ���</td>
	<td  width="3%">����</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>