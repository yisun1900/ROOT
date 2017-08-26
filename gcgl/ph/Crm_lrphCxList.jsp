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
	String lrph=null;
	String lrr=null;
	String lrsj=null;
	String zdxh=null;
	String sl=null;
	String lx=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_lrph.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and (crm_lrph.dwbh='"+dwbh+"') ";
	}

	lrph=request.getParameter("lrph");
	if (lrph!=null)
	{
		lrph=lrph.trim();
		if (!(lrph.equals("")))	wheresql+=" and (crm_lrph.lrph="+lrph+") ";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_lrph.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_lrph.lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	zdxh=request.getParameter("zdxh");
	if (zdxh!=null)
	{
		zdxh=zdxh.trim();
		if (!(zdxh.equals("")))	wheresql+=" and (crm_lrph.zdxh="+zdxh+") ";
	}
	sl=request.getParameter("sl");
	if (sl!=null)
	{
		sl=sl.trim();
		if (!(sl.equals("")))	wheresql+=" and (crm_lrph.sl="+sl+") ";
	}
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (crm_lrph.lx='"+lx+"')";
	}
	ls_sql="SELECT lrph,lrr,lrsj,dwmc,TO_CHAR(zdxh),sl, DECODE(lx,'1','开工日期','2','隐蔽工程验收','3','完工日期','4','设工程担当','5','完工回访'),crm_lrph.bz  ";
	ls_sql+=" FROM crm_lrph,sq_dwxx  ";
    ls_sql+=" where crm_lrph.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by lrph";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_lrphCxList.jsp","SelectCxCrm_lrph.jsp","","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lrph","lrr","lrsj","zdxh","sl","lx","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lrph"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"lrph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="Crm_lrphmxCxList.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("lrph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
/*
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">批号</td>
	<td  width="14%">录入人</td>
	<td  width="14%">录入时间</td>
	<td  width="14%">录入单位</td>
	<td  width="8%">最大序号</td>
	<td  width="8%">数量</td>
	<td  width="12%">类型</td>
	<td  width="30%">备注</td>
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
