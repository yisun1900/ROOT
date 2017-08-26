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
	String crm_nbtsjl_tsjlh=null;
	String crm_nbtsjl_btsr=null;
	String crm_nbtsjl_tsr=null;
	String crm_nbtsjl_tssj=null;
	String crm_nbtsjl_slr=null;
	String crm_nbtsjl_slsj=null;
	String crm_nbtsjl_slbm=null;
	String crm_nbtsjl_clzt=null;
	String crm_nbtsjl_clr=null;
	String crm_nbtsjl_clkssj=null;
	String crm_nbtsjl_cljssj=null;
	crm_nbtsjl_tsjlh=request.getParameter("crm_nbtsjl_tsjlh");
	if (crm_nbtsjl_tsjlh!=null)
	{
		crm_nbtsjl_tsjlh=crm_nbtsjl_tsjlh.trim();
		if (!(crm_nbtsjl_tsjlh.equals("")))	wheresql+=" and (crm_nbtsjl.tsjlh="+crm_nbtsjl_tsjlh+") ";
	}
	crm_nbtsjl_btsr=request.getParameter("crm_nbtsjl_btsr");
	if (crm_nbtsjl_btsr!=null)
	{
		crm_nbtsjl_btsr=cf.GB2Uni(crm_nbtsjl_btsr);
		if (!(crm_nbtsjl_btsr.equals("")))	wheresql+=" and  (crm_nbtsjl.btsr like '%"+crm_nbtsjl_btsr+"%')";
	}
	crm_nbtsjl_tsr=request.getParameter("crm_nbtsjl_tsr");
	if (crm_nbtsjl_tsr!=null)
	{
		crm_nbtsjl_tsr=cf.GB2Uni(crm_nbtsjl_tsr);
		if (!(crm_nbtsjl_tsr.equals("")))	wheresql+=" and  (crm_nbtsjl.tsr like '%"+crm_nbtsjl_tsr+"%')";
	}
	crm_nbtsjl_tssj=request.getParameter("crm_nbtsjl_tssj");
	if (crm_nbtsjl_tssj!=null)
	{
		crm_nbtsjl_tssj=crm_nbtsjl_tssj.trim();
		if (!(crm_nbtsjl_tssj.equals("")))	wheresql+="  and (crm_nbtsjl.tssj>=TO_DATE('"+crm_nbtsjl_tssj+"','YYYY/MM/DD'))";
	}
	crm_nbtsjl_tssj=request.getParameter("crm_nbtsjl_tssj2");
	if (crm_nbtsjl_tssj!=null)
	{
		crm_nbtsjl_tssj=crm_nbtsjl_tssj.trim();
		if (!(crm_nbtsjl_tssj.equals("")))	wheresql+="  and (crm_nbtsjl.tssj<=TO_DATE('"+crm_nbtsjl_tssj+"','YYYY/MM/DD'))";
	}
	crm_nbtsjl_slr=request.getParameter("crm_nbtsjl_slr");
	if (crm_nbtsjl_slr!=null)
	{
		crm_nbtsjl_slr=cf.GB2Uni(crm_nbtsjl_slr);
		if (!(crm_nbtsjl_slr.equals("")))	wheresql+=" and  (crm_nbtsjl.slr like '%"+crm_nbtsjl_slr+"%')";
	}
	crm_nbtsjl_slsj=request.getParameter("crm_nbtsjl_slsj");
	if (crm_nbtsjl_slsj!=null)
	{
		crm_nbtsjl_slsj=crm_nbtsjl_slsj.trim();
		if (!(crm_nbtsjl_slsj.equals("")))	wheresql+="  and (crm_nbtsjl.slsj=TO_DATE('"+crm_nbtsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_nbtsjl_slbm=request.getParameter("crm_nbtsjl_slbm");
	if (crm_nbtsjl_slbm!=null)
	{
		crm_nbtsjl_slbm=cf.GB2Uni(crm_nbtsjl_slbm);
		if (!(crm_nbtsjl_slbm.equals("")))	wheresql+=" and  (crm_nbtsjl.slbm='"+crm_nbtsjl_slbm+"')";
	}
	crm_nbtsjl_clzt=request.getParameter("crm_nbtsjl_clzt");
	if (crm_nbtsjl_clzt!=null)
	{
		crm_nbtsjl_clzt=cf.GB2Uni(crm_nbtsjl_clzt);
		if (!(crm_nbtsjl_clzt.equals("")))	wheresql+=" and  (crm_nbtsjl.clzt='"+crm_nbtsjl_clzt+"')";
	}
	crm_nbtsjl_clr=request.getParameter("crm_nbtsjl_clr");
	if (crm_nbtsjl_clr!=null)
	{
		crm_nbtsjl_clr=cf.GB2Uni(crm_nbtsjl_clr);
		if (!(crm_nbtsjl_clr.equals("")))	wheresql+=" and  (crm_nbtsjl.clr='"+crm_nbtsjl_clr+"')";
	}
	crm_nbtsjl_clkssj=request.getParameter("crm_nbtsjl_clkssj");
	if (crm_nbtsjl_clkssj!=null)
	{
		crm_nbtsjl_clkssj=crm_nbtsjl_clkssj.trim();
		if (!(crm_nbtsjl_clkssj.equals("")))	wheresql+="  and (crm_nbtsjl.clkssj=TO_DATE('"+crm_nbtsjl_clkssj+"','YYYY/MM/DD'))";
	}
	crm_nbtsjl_cljssj=request.getParameter("crm_nbtsjl_cljssj");
	if (crm_nbtsjl_cljssj!=null)
	{
		crm_nbtsjl_cljssj=crm_nbtsjl_cljssj.trim();
		if (!(crm_nbtsjl_cljssj.equals("")))	wheresql+="  and (crm_nbtsjl.cljssj=TO_DATE('"+crm_nbtsjl_cljssj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_nbtsjl.tsjlh,c.dwmc btsfgs,b.dwmc btsbm,crm_nbtsjl.btsr,crm_nbtsjl.tsnr,crm_nbtsjl.tsr,crm_nbtsjl.tssj,crm_nbtsjl.slr,crm_nbtsjl.slsj,a.dwmc slbm, DECODE(crm_nbtsjl.clzt,'1','未处理','2','在处理','3','已解决')";
	ls_sql+=" FROM crm_nbtsjl,sq_dwxx a,sq_dwxx b,sq_dwxx c ";
    ls_sql+=" where crm_nbtsjl.slbm=a.dwbh(+) and crm_nbtsjl.btsbm=b.dwbh(+) and crm_nbtsjl.btsfgs=c.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_nbtsjl.btsfgs,crm_nbtsjl.tsjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_nbtsjlList.jsp","SelectCrm_nbtsjl.jsp","","EditCrm_nbtsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tsjlh","crm_nbtsjl_btsr","crm_nbtsjl_tsnr","crm_nbtsjl_tsr","crm_nbtsjl_tssj","crm_nbtsjl_slr","crm_nbtsjl_slsj","sq_dwxx_dwmc","crm_nbtsjl_clzt","crm_nbtsjl_clr","crm_nbtsjl_clkssj","crm_nbtsjl_cljssj","crm_nbtsjl_clqk"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Crm_nbtsjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_nbtsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("btsfgs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] tsjlh = request.getParameterValues("tsjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tsjlh,"tsjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_nbtsjl where "+chooseitem;
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
	pageObj.printPageLink(155);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">反馈记录号</td>
	<td  width="9%">被反馈分公司</td>
	<td  width="10%">被反馈部门</td>
	<td  width="5%">被反馈人</td>
	<td  width="30%">反馈内容</td>
	<td  width="5%">反馈人</td>
	<td  width="6%">反馈时间</td>
	<td  width="5%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="10%">录入部门</td>
	<td  width="4%">处理状态</td>
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