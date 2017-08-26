<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String sqygbh=(String)session.getAttribute("ygbh");
String sqfgs=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";



	String dwbh=null;
	String ssfgs=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	String rs_ygzbjtzjl_xuhao=null;
	String rs_ygzbjtzjl_ygbh=null;
	String rs_ygzbjtzjl_yhmc=null;
	String sq_yhxx_xzzwbm=null;
	String rs_ygzbjtzjl_je=null;
	String rs_ygzbjtzjl_jlh=null;
	String rs_ygzbjtzjl_lrr=null;
	String rs_ygzbjtzjl_lrsj=null;
	rs_ygzbjtzjl_xuhao=request.getParameter("rs_ygzbjtzjl_xuhao");
	if (rs_ygzbjtzjl_xuhao!=null)
	{
		rs_ygzbjtzjl_xuhao=rs_ygzbjtzjl_xuhao.trim();
		if (!(rs_ygzbjtzjl_xuhao.equals("")))	wheresql+=" and (rs_ygzbjtzjl.xuhao="+rs_ygzbjtzjl_xuhao+") ";
	}
	rs_ygzbjtzjl_ygbh=request.getParameter("rs_ygzbjtzjl_ygbh");
	if (rs_ygzbjtzjl_ygbh!=null)
	{
		rs_ygzbjtzjl_ygbh=rs_ygzbjtzjl_ygbh.trim();
		if (!(rs_ygzbjtzjl_ygbh.equals("")))	wheresql+=" and (rs_ygzbjtzjl.ygbh="+rs_ygzbjtzjl_ygbh+") ";
	}
	rs_ygzbjtzjl_yhmc=request.getParameter("rs_ygzbjtzjl_yhmc");
	if (rs_ygzbjtzjl_yhmc!=null)
	{
		rs_ygzbjtzjl_yhmc=cf.GB2Uni(rs_ygzbjtzjl_yhmc);
		if (!(rs_ygzbjtzjl_yhmc.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.yhmc='"+rs_ygzbjtzjl_yhmc+"')";
	}
	sq_yhxx_xzzwbm=request.getParameter("sq_yhxx_xzzwbm");
	if (sq_yhxx_xzzwbm!=null)
	{
		sq_yhxx_xzzwbm=cf.GB2Uni(sq_yhxx_xzzwbm);
		if (!(sq_yhxx_xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+sq_yhxx_xzzwbm+"')";
	}
	rs_ygzbjtzjl_je=request.getParameter("rs_ygzbjtzjl_je");
	if (rs_ygzbjtzjl_je!=null)
	{
		rs_ygzbjtzjl_je=rs_ygzbjtzjl_je.trim();
		if (!(rs_ygzbjtzjl_je.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.je="+rs_ygzbjtzjl_je+") ";
	}
	rs_ygzbjtzjl_jlh=request.getParameter("rs_ygzbjtzjl_jlh");
	if (rs_ygzbjtzjl_jlh!=null)
	{
		rs_ygzbjtzjl_jlh=cf.GB2Uni(rs_ygzbjtzjl_jlh);
		if (!(rs_ygzbjtzjl_jlh.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.jlh='"+rs_ygzbjtzjl_jlh+"')";
	}
	rs_ygzbjtzjl_lrr=request.getParameter("rs_ygzbjtzjl_lrr");
	if (rs_ygzbjtzjl_lrr!=null)
	{
		rs_ygzbjtzjl_lrr=cf.GB2Uni(rs_ygzbjtzjl_lrr);
		if (!(rs_ygzbjtzjl_lrr.equals("")))	wheresql+=" and  (rs_ygzbjtzjl.lrr='"+rs_ygzbjtzjl_lrr+"')";
	}
	rs_ygzbjtzjl_lrsj=request.getParameter("rs_ygzbjtzjl_lrsj");
	if (rs_ygzbjtzjl_lrsj!=null)
	{
		rs_ygzbjtzjl_lrsj=rs_ygzbjtzjl_lrsj.trim();
		if (!(rs_ygzbjtzjl_lrsj.equals("")))	wheresql+="  and (rs_ygzbjtzjl.lrsj>=TO_DATE('"+rs_ygzbjtzjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ygzbjtzjl_lrsj=request.getParameter("rs_ygzbjtzjl_lrsj2");
	if (rs_ygzbjtzjl_lrsj!=null)
	{
		rs_ygzbjtzjl_lrsj=rs_ygzbjtzjl_lrsj.trim();
		if (!(rs_ygzbjtzjl_lrsj.equals("")))	wheresql+="  and (rs_ygzbjtzjl.lrsj<=TO_DATE('"+rs_ygzbjtzjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT TO_CHAR(rs_ygzbjtzjl.xuhao) xuhao,TO_CHAR(rs_ygzbjtzjl.ygbh),rs_ygzbjtzjl.yhmc,sq_yhxx.xzzwbm,b.dwmc bm,rs_ygzbjtzjl.je,rs_ygzbjtzjl.jlh,rs_ygzbjtzjl.lrr,rs_ygzbjtzjl.lrsj,a.dwmc,rs_ygzbjtzjl.bz  ";
	ls_sql+=" FROM sq_yhxx,rs_ygzbjtzjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_ygzbjtzjl.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=" and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=" and sq_yhxx.dwbh=b.dwbh(+)";
 	if (sqfgs.equals("1") || sqfgs.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+sqygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+sqygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ygzbjtzjl.xuhao desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ygzbjtzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","rs_ygzbjtzjl_ygbh","rs_ygzbjtzjl_yhmc","sq_yhxx_xzzwbm","rs_ygzbjtzjl_je","rs_ygzbjtzjl_jlh","rs_ygzbjtzjl_lrr","rs_ygzbjtzjl_lrsj","rs_ygzbjtzjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xuhao"};
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
  <B><font size="3">设计师质保金－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="6%">员工序号</td>
	<td  width="6%">员工名称</td>
	<td  width="8%">行政职务</td>
	<td  width="9%">部门</td>
	<td  width="9%">金额</td>
	<td  width="9%">关联记录号</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="9%">分公司</td>
	<td  width="27%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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