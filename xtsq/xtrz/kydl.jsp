<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from  v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011501'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[ϵͳ��־]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xh=null;
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String dlsj=null;
	String tcsj=null;

	String xzzwbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}
	
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
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (sq_xtrz.xh="+xh+") ";
	}
	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (sq_xtrz.ip='"+ip+"')";
	}
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_xtrz.yhdlm='"+yhdlm+"')";
		if (!(yhdlm.equals("")))	wheresql+=" and  (c.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	dlsj=request.getParameter("dlsj");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (sq_xtrz.dlsj>=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	dlsj=request.getParameter("dlsj2");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (sq_xtrz.dlsj<=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	tcsj=request.getParameter("tcsj");
	if (tcsj!=null)
	{
		tcsj=tcsj.trim();
		if (!(tcsj.equals("")))	wheresql+="  and (sq_xtrz.tcsj=TO_DATE('"+tcsj+"','YYYY/MM/DD'))";
	}
	String bz=null;
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and (sq_xtrz.bz like '%"+bz+"%') ";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT sq_xtrz.yhdlm,sq_yhxx.yhmc,sq_yhxx.xzzwbm,ROUND((sq_xtrz.dlsj-c.dlsj)*24,2),sq_xtrz.ip aa1,sq_xtrz.dlsj bb1,c.ip aa2,c.dlsj bb2 ";
	ls_sql+=" FROM sq_yhxx,sq_xtrz,sq_xtrz c ";
    ls_sql+=" where sq_xtrz.yhdlm=sq_yhxx.yhdlm(+) ";
    ls_sql+=" and sq_xtrz.yhdlm=c.yhdlm";
    ls_sql+=" and sq_xtrz.xh!=c.xh";
    ls_sql+=" and sq_xtrz.ip1!=c.ip1";
    ls_sql+=" and sq_xtrz.ip2!=c.ip2";
    ls_sql+=" and (sq_xtrz.dlsj-c.dlsj)*24<2";
    ls_sql+=" and (sq_xtrz.dlsj-c.dlsj)*24>0";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_xtrz.dlsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("kydl.jsp","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ip","yhdlm","yhmc","dlsj","tcsj"};
	pageObj.setDisColName(disColName);
*/

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">�û���½��</td>
	<td  width="7%">�û�����</td>
	<td  width="10%">ְ��</td>
	<td  width="9%">���Сʱ</td>
	<td  width="14%">IP��ַ</td>
	<td  width="17%">��½ʱ��</td>
	<td  width="14%">IP��ַ</td>
	<td  width="17%">��½ʱ��</td>
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