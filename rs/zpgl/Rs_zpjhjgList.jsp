<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String zpsqbh=null;
	String fgs=null;
	String sqbm=null;
	String zbzw=null;
	String zprs=null;
	String zpfy=null;
	String zbly=null;
	String zbqt=null;
	String xwdgsj=null;
	String xbyq=null;
	String hyyq=null;
	String nlyq=null;
	String xl=null;
	String zy=null;
	String wy=null;
	String jsjnl=null;
	String gzjy=null;
	String gx=null;
	String jn=null;
	String qt=null;
	String rygznr=null;
	String sqzt=null;
	String lrr=null;
	String lrsj=null;
	String ssfgs=null;
	String ztbm=null;
	zpsqbh=request.getParameter("zpsqbh");
	if (zpsqbh!=null)
	{
		zpsqbh=cf.GB2Uni(zpsqbh);
		if (!(zpsqbh.equals("")))	wheresql+=" and  (zpsqbh='"+zpsqbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_zpsq.fgs='"+fgs+"')";
	}
	sqbm=request.getParameter("sqbm");
	if (sqbm!=null)
	{
		sqbm=cf.GB2Uni(sqbm);
		if (!(sqbm.equals("")))	wheresql+=" and  (sqbm='"+sqbm+"')";
	}
	zbzw=request.getParameter("zbzw");
	if (zbzw!=null)
	{
		zbzw=cf.GB2Uni(zbzw);
		if (!(zbzw.equals("")))	wheresql+=" and  (zbzw='"+zbzw+"')";
	}
	zprs=request.getParameter("zprs");
	if (zprs!=null)
	{
		zprs=zprs.trim();
		if (!(zprs.equals("")))	wheresql+=" and (zprs="+zprs+") ";
	}
	zpfy=request.getParameter("zpfy");
	if (zpfy!=null)
	{
		zpfy=zpfy.trim();
		if (!(zpfy.equals("")))	wheresql+=" and  (zpfy="+zpfy+") ";
	}
	zbly=request.getParameter("zbly");
	if (zbly!=null)
	{
		zbly=cf.GB2Uni(zbly);
		if (!(zbly.equals("")))	wheresql+=" and  (zbly='"+zbly+"')";
	}
	zbqt=request.getParameter("zbqt");
	if (zbqt!=null)
	{
		zbqt=cf.GB2Uni(zbqt);
		if (!(zbqt.equals("")))	wheresql+=" and  (zbqt='"+zbqt+"')";
	}
	xwdgsj=request.getParameter("xwdgsj");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj>=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xwdgsj=request.getParameter("xwdgsj2");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj<=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xbyq=request.getParameter("xbyq");
	if (xbyq!=null)
	{
		xbyq=cf.GB2Uni(xbyq);
		if (!(xbyq.equals("")))	wheresql+=" and  (xbyq='"+xbyq+"')";
	}
	hyyq=request.getParameter("hyyq");
	if (hyyq!=null)
	{
		hyyq=cf.GB2Uni(hyyq);
		if (!(hyyq.equals("")))	wheresql+=" and  (hyyq='"+hyyq+"')";
	}
	nlyq=request.getParameter("nlyq");
	if (nlyq!=null)
	{
		nlyq=cf.GB2Uni(nlyq);
		if (!(nlyq.equals("")))	wheresql+=" and  (nlyq='"+nlyq+"')";
	}
	xl=request.getParameter("xl");
	if (xl!=null)
	{
		xl=cf.GB2Uni(xl);
		if (!(xl.equals("")))	wheresql+=" and  (xl='"+xl+"')";
	}
	zy=request.getParameter("zy");
	if (zy!=null)
	{
		zy=cf.GB2Uni(zy);
		if (!(zy.equals("")))	wheresql+=" and  (zy='"+zy+"')";
	}
	wy=request.getParameter("wy");
	if (wy!=null)
	{
		wy=cf.GB2Uni(wy);
		if (!(wy.equals("")))	wheresql+=" and  (wy='"+wy+"')";
	}
	jsjnl=request.getParameter("jsjnl");
	if (jsjnl!=null)
	{
		jsjnl=cf.GB2Uni(jsjnl);
		if (!(jsjnl.equals("")))	wheresql+=" and  (jsjnl='"+jsjnl+"')";
	}
	gzjy=request.getParameter("gzjy");
	if (gzjy!=null)
	{
		gzjy=cf.GB2Uni(gzjy);
		if (!(gzjy.equals("")))	wheresql+=" and  (gzjy='"+gzjy+"')";
	}
	gx=request.getParameter("gx");
	if (gx!=null)
	{
		gx=cf.GB2Uni(gx);
		if (!(gx.equals("")))	wheresql+=" and  (gx='"+gx+"')";
	}
	jn=request.getParameter("jn");
	if (jn!=null)
	{
		jn=cf.GB2Uni(jn);
		if (!(jn.equals("")))	wheresql+=" and  (jn='"+jn+"')";
	}
	qt=request.getParameter("qt");
	if (qt!=null)
	{
		qt=cf.GB2Uni(qt);
		if (!(qt.equals("")))	wheresql+=" and  (qt='"+qt+"')";
	}
	rygznr=request.getParameter("rygznr");
	if (rygznr!=null)
	{
		rygznr=cf.GB2Uni(rygznr);
		if (!(rygznr.equals("")))	wheresql+=" and  (rygznr='"+rygznr+"')";
	}
	sqzt=request.getParameter("sqzt");
	if (sqzt!=null)
	{
		sqzt=cf.GB2Uni(sqzt);
		if (!(sqzt.equals("")))	wheresql+=" and  (sqzt='"+sqzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_zpsq.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpsq.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_zpsq.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_zpsq.ssfgs='"+ssfgs+"')";
	}
	ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		ztbm=cf.GB2Uni(ztbm);
		if (!(ztbm.equals("")))	wheresql+=" and  (ztbm='"+ztbm+"')";
	}
	ls_sql="SELECT zpsqbh,a.dwmc fgs,b.dwmc sqbm,dm_xzzwbm.xzzwmc zbzw,zprs,zpfy, DECODE(zbly,'0','其他','1','缺员补充','2','扩大编制','3','储备人力'),zbqt,xwdgsj,rs_zpsq.lrr,rs_zpsq.lrsj,c.dwmc ssfgs  ";
	ls_sql+=" FROM rs_zpsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,dm_xzzwbm  ";
    ls_sql+=" where rs_zpsq.fgs=a.dwbh and rs_zpsq.sqbm=b.dwbh and rs_zpsq.ssfgs=c.dwbh and rs_zpsq.zbzw=dm_xzzwbm.xzzwbm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_zpjhjgList.jsp","SelectRs_zpjhjg.jsp","","EidtWcRs_zpsq.jsp");
	//pageObj.setViewStr("录入");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zpsqbh","fgs","sqbm","zbzw","zprs","zpfy","zbly","zbqt","xwdgsj","sqzt","lrr","lrsj","ssfgs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zpsqbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_deleteZpjg.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zpsqbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_zpsq.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zpsqbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
/*	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">招聘结果查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="8%">申请编号</td>
	<td  width="8%">申请分公司</td>
	<td  width="8%">申请部门</td>
	<td  width="8%">增补职务</td>
	<td  width="7%">增补员额</td>
	<td  width="7%">招聘费用</td>
	<td  width="7%">增补理由</td>
	<td  width="9%">增补其他</td>
	<td  width="9%">希望到岗时间</td>
	<td  width="7%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="8%">录入人分公司</td>
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