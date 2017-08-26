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
	String rs_yggzjl_xh=null;
	String rs_yggzjl_fxrq=null;
	String rs_yggzjl_ssfgs=null;
	String rs_yggzjl_ksrq=null;
	String rs_yggzjl_zzrq=null;
	String rs_yggzjl_lrr=null;
	String rs_yggzjl_lrsj=null;
	String rs_yggzjl_lrbm=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	wheresql+=" and  (rs_yggzjl.lx='"+lx+"')";
	}

	rs_yggzjl_xh=request.getParameter("rs_yggzjl_xh");
	if (rs_yggzjl_xh!=null)
	{
		rs_yggzjl_xh=cf.GB2Uni(rs_yggzjl_xh);
		if (!(rs_yggzjl_xh.equals("")))	wheresql+=" and  (rs_yggzjl.xh='"+rs_yggzjl_xh+"')";
	}
	rs_yggzjl_fxrq=request.getParameter("rs_yggzjl_fxrq");
	if (rs_yggzjl_fxrq!=null)
	{
		rs_yggzjl_fxrq=rs_yggzjl_fxrq.trim();
		if (!(rs_yggzjl_fxrq.equals("")))	wheresql+="  and (rs_yggzjl.fxrq>=TO_DATE('"+rs_yggzjl_fxrq+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_fxrq=request.getParameter("rs_yggzjl_fxrq2");
	if (rs_yggzjl_fxrq!=null)
	{
		rs_yggzjl_fxrq=rs_yggzjl_fxrq.trim();
		if (!(rs_yggzjl_fxrq.equals("")))	wheresql+="  and (rs_yggzjl.fxrq<=TO_DATE('"+rs_yggzjl_fxrq+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_ssfgs=request.getParameter("rs_yggzjl_ssfgs");
	if (rs_yggzjl_ssfgs!=null)
	{
		rs_yggzjl_ssfgs=cf.GB2Uni(rs_yggzjl_ssfgs);
		if (!(rs_yggzjl_ssfgs.equals("")))	wheresql+=" and  (rs_yggzjl.ssfgs='"+rs_yggzjl_ssfgs+"')";
	}
	rs_yggzjl_ksrq=request.getParameter("rs_yggzjl_ksrq");
	if (rs_yggzjl_ksrq!=null)
	{
		rs_yggzjl_ksrq=rs_yggzjl_ksrq.trim();
		if (!(rs_yggzjl_ksrq.equals("")))	wheresql+="  and (rs_yggzjl.ksrq=TO_DATE('"+rs_yggzjl_ksrq+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_zzrq=request.getParameter("rs_yggzjl_zzrq");
	if (rs_yggzjl_zzrq!=null)
	{
		rs_yggzjl_zzrq=rs_yggzjl_zzrq.trim();
		if (!(rs_yggzjl_zzrq.equals("")))	wheresql+="  and (rs_yggzjl.zzrq=TO_DATE('"+rs_yggzjl_zzrq+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_lrr=request.getParameter("rs_yggzjl_lrr");
	if (rs_yggzjl_lrr!=null)
	{
		rs_yggzjl_lrr=cf.GB2Uni(rs_yggzjl_lrr);
		if (!(rs_yggzjl_lrr.equals("")))	wheresql+=" and  (rs_yggzjl.lrr='"+rs_yggzjl_lrr+"')";
	}
	rs_yggzjl_lrsj=request.getParameter("rs_yggzjl_lrsj");
	if (rs_yggzjl_lrsj!=null)
	{
		rs_yggzjl_lrsj=rs_yggzjl_lrsj.trim();
		if (!(rs_yggzjl_lrsj.equals("")))	wheresql+="  and (rs_yggzjl.lrsj>=TO_DATE('"+rs_yggzjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_lrsj=request.getParameter("rs_yggzjl_lrsj2");
	if (rs_yggzjl_lrsj!=null)
	{
		rs_yggzjl_lrsj=rs_yggzjl_lrsj.trim();
		if (!(rs_yggzjl_lrsj.equals("")))	wheresql+="  and (rs_yggzjl.lrsj<=TO_DATE('"+rs_yggzjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_lrbm=request.getParameter("rs_yggzjl_lrbm");
	if (rs_yggzjl_lrbm!=null)
	{
		rs_yggzjl_lrbm=cf.GB2Uni(rs_yggzjl_lrbm);
		if (!(rs_yggzjl_lrbm.equals("")))	wheresql+=" and  (rs_yggzjl.lrbm='"+rs_yggzjl_lrbm+"')";
	}
	ls_sql="SELECT rs_yggzjl.xh,rs_yggzjl.fxrq,b.dwmc ssfgs,rs_yggzjl.ksrq,rs_yggzjl.zzrq,rs_yggzjl.lrr,rs_yggzjl.lrsj,a.dwmc lrbm,rs_yggzjl.bz  ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,rs_yggzjl  ";
    ls_sql+=" where rs_yggzjl.lrbm=a.dwbh and rs_yggzjl.ssfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzjl.ssfgs,rs_yggzjl.fxrq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yggzjlList.jsp","SelectRs_yggzjl.jsp","","EditRs_yggzjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","rs_yggzjl_fxrq","rs_yggzjl_ssfgs","rs_yggzjl_ksrq","rs_yggzjl_zzrq","rs_yggzjl_lrr","rs_yggzjl_lrsj","sq_dwxx_dwmc","rs_yggzjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_yggzjlList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_yggzjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from rs_yggzb where "+chooseitem;
		sql[1]="delete from rs_yggzjl where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="9%">序号</td>
	<td  width="9%">发薪日期</td>
	<td  width="11%">发薪公司</td>
	<td  width="9%">工资开始日期</td>
	<td  width="9%">工资终止日期</td>
	<td  width="7%">录入人</td>
	<td  width="9%">录入时间</td>
	<td  width="13%">录入部门</td>
	<td  width="16%">备注</td>
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