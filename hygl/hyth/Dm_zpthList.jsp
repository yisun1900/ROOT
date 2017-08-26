<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls_sql=null;
String wheresql=" WHERE (1=1) ";
int curPage=0;
String pageStr=request.getParameter("curPage");

if (pageStr!=null)//第x次运行
{
	//要求显示第几页
	curPage=Integer.parseInt(pageStr);
}
else//第一次运行,需要查询
{
	curPage=1;
	String thjlh=null;
	String cpbm=null;
	String xh=null;
	String zpbm=null;
	String ckbm=null;
	String plbm=null;
	String sl=null;
	String zplx=null;
	String thrq=null;
	String thrq2=null;
	thrq=request.getParameter("thrq");
	if (thrq!=null)
	{
		if (!(thrq.equals("")))	wheresql+="  and dm_thjl.thrq>=TO_DATE('"+thrq+"','YYYY-MM-DD')";
	}
	thrq2=request.getParameter("thrq2");
	if (thrq2!=null)
	{
		if (!(thrq2.equals("")))	wheresql+="  and dm_thjl.thrq<=TO_DATE('"+thrq2+"','YYYY-MM-DD')";
	}
	thjlh=request.getParameter("thjlh");
	if (thjlh!=null)
	{
		thjlh=cf.GB2Uni(thjlh);
		if (!(thjlh.equals("")))	wheresql+="  and (dm_zpth.thjlh='"+thjlh+"')";
	}
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+="  and (dm_zpth.cpbm='"+cpbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (dm_zpth.xh="+xh+") ";
	}
	zpbm=request.getParameter("zpbm");
	if (zpbm!=null)
	{
		zpbm=cf.GB2Uni(zpbm);
		if (!(zpbm.equals("")))	wheresql+="  and (dm_zpth.zpbm='"+zpbm+"')";
	}
	ckbm=request.getParameter("ckbm");
	if (ckbm!=null)
	{
		ckbm=cf.GB2Uni(ckbm);
		if (!(ckbm.equals("")))	wheresql+="  and (dm_zpth.ckbm='"+ckbm+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		plbm=cf.GB2Uni(plbm);
		if (!(plbm.equals("")))	wheresql+="  and (dm_zpth.plbm='"+plbm+"')";
	}
	sl=request.getParameter("sl");
	if (sl!=null)
	{
		sl=sl.trim();
		if (!(sl.equals("")))	wheresql+=" and (dm_zpth.sl="+sl+") ";
	}
	zplx=request.getParameter("zplx");
	if (zplx!=null)
	{
		zplx=cf.GB2Uni(zplx);
		if (!(zplx.equals("")))	wheresql+="  and (dm_zpth.zplx='"+zplx+"')";
	}
	ls_sql="SELECT dm_zpth.thjlh,dm_zpth.cpbm,a.plmc cppm,thrq,dm_zpth.zpbm,ckmc,b.plmc zppm,sl ";
	ls_sql+=" FROM dm_zpth,dm_thjl,xt_plbm a ,xt_plbm b,xt_ckxx  ";
    ls_sql+=wheresql;
	ls_sql+=" and dm_zpth.cpbm=dm_thjl.cpbm and dm_zpth.thjlh=dm_thjl.thjlh";
	ls_sql+=" and dm_zpth.plbm=b.plbm  and dm_thjl.plbm=a.plbm and dm_zpth.ckbm=xt_ckxx.ckbm";
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("Dm_zpthList.jsp","SelectDm_zpth.jsp","","");
/*
//设置显示列
	String[] disColName={"thjlh","cpbm","xh","zpbm","ckbm","plbm","sl","zplx"};
	pageObject.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"thjlh"};
	pageObject.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObject.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObject.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
	}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%" >退货记录号</td>
		<td  width="10%" >产品编码</td>
		<td  width="15%" >成品品名</td>
		<td  width="12%" >退货日期</td>
		<td  width="10%" >赠品编码</td>
		<td  width="16%" >所在仓库</td>
		<td  width="15%" >赠品品名</td>
		<td  width="6%" >数量</td>
</tr>
<%
	pageObject.printDateSum();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>