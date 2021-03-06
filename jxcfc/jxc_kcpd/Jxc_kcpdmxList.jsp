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
	String pdph=null;
	String pdxh=null;
	String dqbm=null;
	String ckbh=null;
	String hjbh=null;
	String hwbh=null;
	String clbm=null;
	String zljb=null;
	String kcsl=null;
	String pdsl=null;
	pdph=request.getParameter("pdph");
	if (pdph!=null)
	{
		pdph=pdph.trim();
		if (!(pdph.equals("")))	wheresql+=" and (pdph="+pdph+") ";
	}
	pdxh=request.getParameter("pdxh");
	if (pdxh!=null)
	{
		pdxh=pdxh.trim();
		if (!(pdxh.equals("")))	wheresql+=" and (pdxh="+pdxh+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (dqbm='"+dqbm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (ckbh='"+ckbh+"')";
	}
	hjbh=request.getParameter("hjbh");
	if (hjbh!=null)
	{
		hjbh=cf.GB2Uni(hjbh);
		if (!(hjbh.equals("")))	wheresql+=" and  (hjbh='"+hjbh+"')";
	}
	hwbh=request.getParameter("hwbh");
	if (hwbh!=null)
	{
		hwbh=cf.GB2Uni(hwbh);
		if (!(hwbh.equals("")))	wheresql+=" and  (hwbh='"+hwbh+"')";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (clbm='"+clbm+"')";
	}
	zljb=request.getParameter("zljb");
	if (zljb!=null)
	{
		zljb=cf.GB2Uni(zljb);
		if (!(zljb.equals("")))	wheresql+=" and  (zljb='"+zljb+"')";
	}
	kcsl=request.getParameter("kcsl");
	if (kcsl!=null)
	{
		kcsl=kcsl.trim();
		if (!(kcsl.equals("")))	wheresql+=" and  (kcsl="+kcsl+") ";
	}
	pdsl=request.getParameter("pdsl");
	if (pdsl!=null)
	{
		pdsl=pdsl.trim();
		if (!(pdsl.equals("")))	wheresql+=" and  (pdsl="+pdsl+") ";
	}
	ls_sql="SELECT pdph,pdxh,clbm,clmc,xh,gg,nbbm,pdzcpsl,pdccpsl,pdbfpsl  ";
	ls_sql+=" FROM jxc_kcpdmx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_kcpdmxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pdph","pdxh","dqbm","ckbh","hjbh","hwbh","clbm","zljb","kcsl","pdsl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pdph","pdxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_kcpdmxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_kcpdmx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
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
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">盘点批号</td>
	<td  width="2%">盘点序号</td>
	<td  width="8%">材料编码</td>
	<td  width="20%">材料名称</td>
	<td  width="8%">型号</td>
	<td  width="8%">规格</td>
	<td  width="8%">内部编码</td>
	<td  width="5%">盘点正常品数量</td>
	<td  width="5%">盘点残次品数量</td>
	<td  width="5%">盘点报废品数量</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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