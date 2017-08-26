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
	String rs_zwdjb_djxmbh=null;
	String rs_zwdjb_djxm=null;
	String rs_zwdjb_gj=null;
	String rs_zwdjb_djjg=null;
	String rs_zwdjb_ygbh=null;
	String rs_zwdjb_yhmc=null;
	String rs_zwdjb_lrsj=null;
	String rs_zwdjb_lrbm=null;
	String rs_zwdjb_ssfgs=null;
	rs_zwdjb_djxmbh=request.getParameter("rs_zwdjb_djxmbh");
	if (rs_zwdjb_djxmbh!=null)
	{
		rs_zwdjb_djxmbh=cf.GB2Uni(rs_zwdjb_djxmbh);
		if (!(rs_zwdjb_djxmbh.equals("")))	wheresql+=" and  (rs_zwdjb.djxmbh='"+rs_zwdjb_djxmbh+"')";
	}
	rs_zwdjb_djxm=request.getParameter("rs_zwdjb_djxm");
	if (rs_zwdjb_djxm!=null)
	{
		rs_zwdjb_djxm=cf.GB2Uni(rs_zwdjb_djxm);
		if (!(rs_zwdjb_djxm.equals("")))	wheresql+=" and  (rs_zwdjb.djxm='"+rs_zwdjb_djxm+"')";
	}
	rs_zwdjb_gj=request.getParameter("rs_zwdjb_gj");
	if (rs_zwdjb_gj!=null)
	{
		rs_zwdjb_gj=cf.GB2Uni(rs_zwdjb_gj);
		if (!(rs_zwdjb_gj.equals("")))	wheresql+=" and  (rs_zwdjb.gj='"+rs_zwdjb_gj+"')";
	}
	rs_zwdjb_djjg=request.getParameter("rs_zwdjb_djjg");
	if (rs_zwdjb_djjg!=null)
	{
		rs_zwdjb_djjg=cf.GB2Uni(rs_zwdjb_djjg);
		if (!(rs_zwdjb_djjg.equals("")))	wheresql+=" and  (rs_zwdjb.djjg='"+rs_zwdjb_djjg+"')";
	}
	rs_zwdjb_ygbh=request.getParameter("rs_zwdjb_ygbh");
	if (rs_zwdjb_ygbh!=null)
	{
		rs_zwdjb_ygbh=rs_zwdjb_ygbh.trim();
		if (!(rs_zwdjb_ygbh.equals("")))	wheresql+=" and (rs_zwdjb.ygbh="+rs_zwdjb_ygbh+") ";
	}
	rs_zwdjb_yhmc=request.getParameter("rs_zwdjb_yhmc");
	if (rs_zwdjb_yhmc!=null)
	{
		rs_zwdjb_yhmc=cf.GB2Uni(rs_zwdjb_yhmc);
		if (!(rs_zwdjb_yhmc.equals("")))	wheresql+=" and  (rs_zwdjb.yhmc='"+rs_zwdjb_yhmc+"')";
	}
	rs_zwdjb_lrsj=request.getParameter("rs_zwdjb_lrsj");
	if (rs_zwdjb_lrsj!=null)
	{
		rs_zwdjb_lrsj=rs_zwdjb_lrsj.trim();
		if (!(rs_zwdjb_lrsj.equals("")))	wheresql+="  and (rs_zwdjb.lrsj=TO_DATE('"+rs_zwdjb_lrsj+"','YYYY/MM/DD'))";
	}
	rs_zwdjb_lrbm=request.getParameter("rs_zwdjb_lrbm");
	if (rs_zwdjb_lrbm!=null)
	{
		rs_zwdjb_lrbm=cf.GB2Uni(rs_zwdjb_lrbm);
		if (!(rs_zwdjb_lrbm.equals("")))	wheresql+=" and  (rs_zwdjb.lrbm='"+rs_zwdjb_lrbm+"')";
	}
	rs_zwdjb_ssfgs=request.getParameter("rs_zwdjb_ssfgs");
	if (rs_zwdjb_ssfgs!=null)
	{
		rs_zwdjb_ssfgs=cf.GB2Uni(rs_zwdjb_ssfgs);
		if (!(rs_zwdjb_ssfgs.equals("")))	wheresql+=" and  (rs_zwdjb.ssfgs='"+rs_zwdjb_ssfgs+"')";
	}

	String myxssl=null;
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT rs_zwdjb.djxmbh,rs_zwdjb.djxm,rs_zwdjb.gj, DECODE(rs_zwdjb.djjg,'1','是','2','否','3','不符合'),rs_zwdjb.ygbh,rs_zwdjb.yhmc,rs_zwdjb.lrsj,sq_dwxx.dwmc,rs_zwdjb.bz  ";
	ls_sql+=" FROM sq_dwxx,rs_zwdjb  ";
    ls_sql+=" where rs_zwdjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_zwdjb.ssfgs,rs_zwdjb.lrbm,rs_zwdjb.yhmc,rs_zwdjb.djxmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_zwdjbCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"djxmbh","rs_zwdjb_djxm","rs_zwdjb_gj","rs_zwdjb_djjg","ygbh","rs_zwdjb_yhmc","rs_zwdjb_lrsj","sq_dwxx_dwmc","rs_zwdjb_ssfgs","rs_zwdjb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djxmbh","ygbh"};
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">自我点检表查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">点检项目编号</td>
	<td  width="25%">点检项目</td>
	<td  width="10%">根据</td>
	<td  width="6%">点检结果</td>
	<td  width="6%">员工序号</td>
	<td  width="6%">员工名称</td>
	<td  width="8%">录入时间</td>
	<td  width="10%">录入部门</td>

	<td  width="10%">备注</td>
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