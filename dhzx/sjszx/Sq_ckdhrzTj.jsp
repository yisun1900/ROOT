<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011503'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ϵͳ��־]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
	ybl.common.PageObject pageObj= new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String dysj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (bj_bjdyrz.ip='"+ip+"')";
	}

	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (bj_bjdyrz.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	dysj=request.getParameter("dysj");
	if (dysj!=null)
	{
		dysj=dysj.trim();
		if (!(dysj.equals("")))	wheresql+="  and (bj_bjdyrz.dysj>=TO_DATE('"+dysj+"','YYYY/MM/DD'))";
	}
	dysj=request.getParameter("dysj2");
	if (dysj!=null)
	{
		dysj=dysj.trim();
		if (!(dysj.equals("")))	wheresql+="  and (bj_bjdyrz.dysj<=TO_DATE('"+dysj+"','YYYY/MM/DD'))";
	}


	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (bj_bjdyrz.khbh='"+khbh+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT a.dwmc,zwmc,bj_bjdyrz.yhdlm,sq_yhxx.yhmc ,count(*) cc";
	ls_sql+=" FROM sq_yhxx,bj_bjdyrz,sq_dwxx a ,dm_zwbm ";
    ls_sql+=" where bj_bjdyrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.ssfgs=a.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" group by bj_bjdyrz.yhdlm,sq_yhxx.yhmc,a.dwmc,zwmc";
	ls_sql+=" order by cc desc";
    
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(3000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ӱ��۴�ӡͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">�����ֹ�˾</td>
	<td  width="14%">ְ��</td>
	<td  width="14%">�û���½��</td>
	<td  width="10%">�û�����</td>
	<td  width="14%">��ӡ����</td>
	
	
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>