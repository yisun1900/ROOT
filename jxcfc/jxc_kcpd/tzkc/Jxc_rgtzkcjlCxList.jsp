<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String lsh=null;
	String xgsj=null;
	String xgr=null;
	String clbm=null;
	String clmc=null;
	String ykcsl=null;
	String xkcsl=null;
	String ssfgs=null;
	String dwbh=null;
	lsh=request.getParameter("lsh");
	if (lsh!=null)
	{
		lsh=cf.GB2Uni(lsh);
		if (!(lsh.equals("")))	wheresql+=" and  (lsh='"+lsh+"')";
	}
	xgsj=request.getParameter("xgsj");
	if (xgsj!=null)
	{
		xgsj=xgsj.trim();
		if (!(xgsj.equals("")))	wheresql+="  and (xgsj>=TO_DATE('"+xgsj+"','YYYY/MM/DD'))";
	}
	xgsj=request.getParameter("xgsj2");
	if (xgsj!=null)
	{
		xgsj=xgsj.trim();
		if (!(xgsj.equals("")))	wheresql+="  and (xgsj<=TO_DATE('"+xgsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	xgr=request.getParameter("xgr");
	if (xgr!=null)
	{
		xgr=cf.GB2Uni(xgr);
		if (!(xgr.equals("")))	wheresql+=" and  (xgr='"+xgr+"')";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (clbm='"+clbm+"')";
	}
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (clmc like '%"+clmc+"%')";
	}
	ykcsl=request.getParameter("ykcsl");
	if (ykcsl!=null)
	{
		ykcsl=ykcsl.trim();
		if (!(ykcsl.equals("")))	wheresql+=" and  (ykcsl="+ykcsl+") ";
	}
	xkcsl=request.getParameter("xkcsl");
	if (xkcsl!=null)
	{
		xkcsl=xkcsl.trim();
		if (!(xkcsl.equals("")))	wheresql+=" and  (xkcsl="+xkcsl+") ";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ssfgs='"+ssfgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (dwbh='"+dwbh+"')";
	}
	ls_sql="SELECT lsh,xgsj,xgr,clbm,clmc,ykcsl,xkcsl,a.dwmc ssfgs,b.dwmc dwbh  ";
	ls_sql+=" FROM jxc_rgtzkcjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where jxc_rgtzkcjl.ssfgs=a.dwbh(+)";
    ls_sql+=" and jxc_rgtzkcjl.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_rgtzkcjl.ssfgs,xgsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_rgtzkcjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lsh","xgsj","xgr","clbm","clmc","ykcsl","xkcsl","ssfgs","dwbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lsh","xgsj"};
	pageObj.setKey(keyName);
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">人工调整库存－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">流水号</td>
	<td  width="11%">修改时间</td>
	<td  width="7%">修改人</td>
	<td  width="11%">材料编码</td>
	<td  width="24%">材料名称</td>
	<td  width="7%">原库存数量</td>
	<td  width="7%">调整后库存数量</td>
	<td  width="11%">修改人分公司</td>
	<td  width="11%">修改人部门</td>
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