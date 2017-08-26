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
	String jxc_fclybl_dwbh=null;
	String jxc_fclybl_clxlbm=null;
	String jxc_fclybl_clxlmc=null;
	String jxc_fclybl_bzlybl=null;
	String jxc_fclybl_lyblxx=null;
	String jxc_fclybl_lyblsx=null;
	jxc_fclybl_dwbh=request.getParameter("jxc_fclybl_dwbh");
	if (jxc_fclybl_dwbh!=null)
	{
		jxc_fclybl_dwbh=cf.GB2Uni(jxc_fclybl_dwbh);
		if (!(jxc_fclybl_dwbh.equals("")))	wheresql+=" and  (jxc_fclybl.dwbh='"+jxc_fclybl_dwbh+"')";
	}
	jxc_fclybl_clxlbm=request.getParameter("jxc_fclybl_clxlbm");
	if (jxc_fclybl_clxlbm!=null)
	{
		jxc_fclybl_clxlbm=jxc_fclybl_clxlbm.trim();
		if (!(jxc_fclybl_clxlbm.equals("")))	wheresql+=" and (jxc_fclybl.clxlbm="+jxc_fclybl_clxlbm+") ";
	}
	jxc_fclybl_clxlmc=request.getParameter("jxc_fclybl_clxlmc");
	if (jxc_fclybl_clxlmc!=null)
	{
		jxc_fclybl_clxlmc=cf.GB2Uni(jxc_fclybl_clxlmc);
		if (!(jxc_fclybl_clxlmc.equals("")))	wheresql+=" and  (jxc_fclybl.clxlmc like '%"+jxc_fclybl_clxlmc+"%')";
	}
	jxc_fclybl_bzlybl=request.getParameter("jxc_fclybl_bzlybl");
	if (jxc_fclybl_bzlybl!=null)
	{
		jxc_fclybl_bzlybl=jxc_fclybl_bzlybl.trim();
		if (!(jxc_fclybl_bzlybl.equals("")))	wheresql+=" and  (jxc_fclybl.bzlybl>="+jxc_fclybl_bzlybl+") ";
	}
	jxc_fclybl_bzlybl=request.getParameter("jxc_fclybl_bzlybl2");
	if (jxc_fclybl_bzlybl!=null)
	{
		jxc_fclybl_bzlybl=jxc_fclybl_bzlybl.trim();
		if (!(jxc_fclybl_bzlybl.equals("")))	wheresql+=" and  (jxc_fclybl.bzlybl<="+jxc_fclybl_bzlybl+") ";
	}
	jxc_fclybl_lyblxx=request.getParameter("jxc_fclybl_lyblxx");
	if (jxc_fclybl_lyblxx!=null)
	{
		jxc_fclybl_lyblxx=jxc_fclybl_lyblxx.trim();
		if (!(jxc_fclybl_lyblxx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblxx>="+jxc_fclybl_lyblxx+") ";
	}
	jxc_fclybl_lyblxx=request.getParameter("jxc_fclybl_lyblxx2");
	if (jxc_fclybl_lyblxx!=null)
	{
		jxc_fclybl_lyblxx=jxc_fclybl_lyblxx.trim();
		if (!(jxc_fclybl_lyblxx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblxx<="+jxc_fclybl_lyblxx+") ";
	}
	jxc_fclybl_lyblsx=request.getParameter("jxc_fclybl_lyblsx");
	if (jxc_fclybl_lyblsx!=null)
	{
		jxc_fclybl_lyblsx=jxc_fclybl_lyblsx.trim();
		if (!(jxc_fclybl_lyblsx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblsx>="+jxc_fclybl_lyblsx+") ";
	}
	jxc_fclybl_lyblsx=request.getParameter("jxc_fclybl_lyblsx2");
	if (jxc_fclybl_lyblsx!=null)
	{
		jxc_fclybl_lyblsx=jxc_fclybl_lyblsx.trim();
		if (!(jxc_fclybl_lyblsx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblsx<="+jxc_fclybl_lyblsx+") ";
	}
	ls_sql="SELECT jxc_fclybl.dwbh,sq_dwxx.dwmc,jxc_fclybl.clxlbm,jxc_fclybl.clxlmc,jxc_fclybl.bzlybl||'%',jxc_fclybl.lyblxx||'%',jxc_fclybl.lyblsx||'%'  ";
	ls_sql+=" FROM sq_dwxx,jxc_fclybl  ";
    ls_sql+=" where jxc_fclybl.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_fclybl.clxlmc,jxc_fclybl.dwbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_fclyblList.jsp","","","EditJxc_fclybl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置主键
	String[] keyName={"dwbh","clxlbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_fclyblList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_fclybl where "+chooseitem;
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
  <B><font size="3">辅材领用比例－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">分公司</td>
	<td  width="16%">分公司</td>
	<td  width="12%">材料小类编码</td>
	<td  width="21%">材料小类名称</td>
	<td  width="11%">标准领用比例</td>
	<td  width="11%">领用比例下限</td>
	<td  width="11%">领用比例上限</td>
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