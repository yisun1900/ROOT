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
	String tzph=null;
	String ckbh=null;
	String lrr=null;
	String lrsj=null;
	String ssfgs=null;
	String clzt=null;

	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=clzt.trim();
		if (!(clzt.equals("")))	wheresql+=" and (jxc_hjtzjl.clzt='"+clzt+"') ";
	}
	tzph=request.getParameter("tzph");
	if (tzph!=null)
	{
		tzph=tzph.trim();
		if (!(tzph.equals("")))	wheresql+=" and (jxc_hjtzjl.tzph='"+tzph+"') ";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_hjtzjl.ckbh='"+ckbh+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jxc_hjtzjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_hjtzjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jxc_hjtzjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_hjtzjl.ssfgs='"+ssfgs+"')";
	}

	ls_sql="SELECT tzph,DECODE(jxc_hjtzjl.clzt,'0','未提交','9','提交'),ckmc,jxc_hjtzjl.lrr,jxc_hjtzjl.lrsj,b.dwmc lrbm,a.dwmc ssfgs,jxc_hjtzjl.bz  ";
	ls_sql+=" FROM jxc_hjtzjl,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where jxc_hjtzjl.ckbh=jxc_ckmc.ckbh(+) and jxc_hjtzjl.ssfgs=a.dwbh and jxc_hjtzjl.lrbm=b.dwbh ";
    ls_sql+=" and jxc_hjtzjl.cllx='0'";//0：主材；1：辅材
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_hjtzjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_hjtzjlList.jsp","","","EditJxc_hjtzjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tzph","dqbm","ckbh","lrr","lrsj","ssfgs","ssbm","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tzph"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"tzph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_hjtzjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tzph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">货架调整维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="10%">批号</td>
	<td  width="8%">处理状态</td>
	<td  width="13%">仓库</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="13%">录入部门</td>
	<td  width="13%">分公司</td>
	<td  width="215%">备注</td>
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