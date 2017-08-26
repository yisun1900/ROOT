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
	String xz_xzzlkhb_dwbh=null;
	String xz_xzzlkhb_khsj=null;
	String xz_xzzlkhb_khbm=null;
	xz_xzzlkhb_dwbh=request.getParameter("xz_xzzlkhb_dwbh");
	if (xz_xzzlkhb_dwbh!=null)
	{
		xz_xzzlkhb_dwbh=cf.GB2Uni(xz_xzzlkhb_dwbh);
		if (!(xz_xzzlkhb_dwbh.equals("")))	wheresql+=" and  (xz_xzzlkhb.dwbh='"+xz_xzzlkhb_dwbh+"')";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj>=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
	}
	xz_xzzlkhb_khsj=request.getParameter("xz_xzzlkhb_khsj2");
	if (xz_xzzlkhb_khsj!=null)
	{
		xz_xzzlkhb_khsj=xz_xzzlkhb_khsj.trim();
		if (!(xz_xzzlkhb_khsj.equals("")))	wheresql+="  and (xz_xzzlkhb.khsj<=TO_DATE('"+xz_xzzlkhb_khsj+"','YYYY/MM/DD'))";
	}
	xz_xzzlkhb_khbm=request.getParameter("xz_xzzlkhb_khbm");
	if (xz_xzzlkhb_khbm!=null)
	{
		xz_xzzlkhb_khbm=cf.GB2Uni(xz_xzzlkhb_khbm);
		if (!(xz_xzzlkhb_khbm.equals("")))	wheresql+=" and  (xz_xzzlkhb.khbm='"+xz_xzzlkhb_khbm+"')";
	}
	ls_sql="SELECT xz_xzzlkhb.xh as xh,a.dwmc as xz_xzzlkhb_dwbh,xz_xzzlkhb.khsj as xz_xzzlkhb_khsj,xz_xzzlkhb.khr as xz_xzzlkhb_khr,xz_xzzlkhb.cw as xz_xzzlkhb_cw,xz_xzzlkhb.ht as xz_xzzlkhb_ht,xz_xzzlkhb.dmgl as xz_xzzlkhb_dmgl,xz_xzzlkhb.wj as xz_xzzlkhb_wj,xz_xzzlkhb.wpsb as xz_xzzlkhb_wpsb,xz_xzzlkhb.bgyp as xz_xzzlkhb_bgyp,xz_xzzlkhb.xcyp as xz_xzzlkhb_xcyp,xz_xzzlkhb.gxbb as xz_xzzlkhb_gxbb,xz_xzzlkhb.jk as xz_xzzlkhb_jk,xz_xzzlkhb.kq as xz_xzzlkhb_kq,xz_xzzlkhb.gzap as xz_xzzlkhb_gzap,xz_xzzlkhb.ts as xz_xzzlkhb_ts,b.dwmc as xz_xzzlkhb_khbm  ";
	ls_sql+=" FROM xz_xzzlkhb,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where xz_xzzlkhb.dwbh=a.dwbh  and  xz_xzzlkhb.khbm=b.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_xzzlkhbList.jsp","SelectXz_xzzlkhb.jsp","ViewXz_xzzlkhb.jsp","EditXz_xzzlkhb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","xz_xzzlkhb_dwbh","xz_xzzlkhb_khsj","xz_xzzlkhb_khr","xz_xzzlkhb_cw","xz_xzzlkhb_ht","xz_xzzlkhb_dmgl","xz_xzzlkhb_wj","xz_xzzlkhb_wpsb","xz_xzzlkhb_bgyp","xz_xzzlkhb_xcyp","xz_xzzlkhb_gxbb","xz_xzzlkhb_jk","xz_xzzlkhb_kq","xz_xzzlkhb_gzap","xz_xzzlkhb_ts","xz_xzzlkhb_khbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_xzzlkhbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from xz_xzzlkhb where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="5%">考核序号</td>
	<td  width="5%">被考核部门</td>
	<td  width="5%">考核时间</td>
	<td  width="5%">考核人</td>
	<td  width="5%">财务15分</td>
	<td  width="5%">合同10分</td>
	<td  width="5%">店面管理10分</td>
	<td  width="5%">文件5分</td>
	<td  width="5%">物品设备10</td>
	<td  width="5%">办公用品5分</td>
	<td  width="5%">宣传用品5分</td>
	<td  width="5%">各项报表15分</td>
	<td  width="5%">监控5分</td>
	<td  width="5%">考勤7分</td>
	<td  width="5%">工作安排8分</td>
	<td  width="5%">其它部门及人员投诉5分</td>
	<td  width="5%">考核部门</td>
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