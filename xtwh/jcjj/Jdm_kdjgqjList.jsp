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
	String jdm_kdjgqj_kdjgqjbm=null;
	String jdm_kdjgqj_kdjgqj=null;
	String jdm_kdjgqj_qskd=null;
	String jdm_kdjgqj_zzkd=null;
	String jdm_kdjgqj_mmdglxbm=null;
	jdm_kdjgqj_kdjgqjbm=request.getParameter("jdm_kdjgqj_kdjgqjbm");
	if (jdm_kdjgqj_kdjgqjbm!=null)
	{
		jdm_kdjgqj_kdjgqjbm=cf.GB2Uni(jdm_kdjgqj_kdjgqjbm);
		if (!(jdm_kdjgqj_kdjgqjbm.equals("")))	wheresql+=" and  (jdm_kdjgqj.kdjgqjbm='"+jdm_kdjgqj_kdjgqjbm+"')";
	}
	jdm_kdjgqj_kdjgqj=request.getParameter("jdm_kdjgqj_kdjgqj");
	if (jdm_kdjgqj_kdjgqj!=null)
	{
		jdm_kdjgqj_kdjgqj=cf.GB2Uni(jdm_kdjgqj_kdjgqj);
		if (!(jdm_kdjgqj_kdjgqj.equals("")))	wheresql+=" and  (jdm_kdjgqj.kdjgqj='"+jdm_kdjgqj_kdjgqj+"')";
	}
	jdm_kdjgqj_qskd=request.getParameter("jdm_kdjgqj_qskd");
	if (jdm_kdjgqj_qskd!=null)
	{
		jdm_kdjgqj_qskd=jdm_kdjgqj_qskd.trim();
		if (!(jdm_kdjgqj_qskd.equals("")))	wheresql+=" and (jdm_kdjgqj.qskd="+jdm_kdjgqj_qskd+") ";
	}
	jdm_kdjgqj_zzkd=request.getParameter("jdm_kdjgqj_zzkd");
	if (jdm_kdjgqj_zzkd!=null)
	{
		jdm_kdjgqj_zzkd=jdm_kdjgqj_zzkd.trim();
		if (!(jdm_kdjgqj_zzkd.equals("")))	wheresql+=" and (jdm_kdjgqj.zzkd="+jdm_kdjgqj_zzkd+") ";
	}
	jdm_kdjgqj_mmdglxbm=request.getParameter("jdm_kdjgqj_mmdglxbm");
	if (jdm_kdjgqj_mmdglxbm!=null)
	{
		jdm_kdjgqj_mmdglxbm=cf.GB2Uni(jdm_kdjgqj_mmdglxbm);
		if (!(jdm_kdjgqj_mmdglxbm.equals("")))	wheresql+=" and  (jdm_kdjgqj.mmdglxbm='"+jdm_kdjgqj_mmdglxbm+"')";
	}
	ls_sql="SELECT jc_mmdglx.mmdglxmc,jdm_kdjgqj.kdjgqjbm,jdm_kdjgqj.kdjgqj,jdm_kdjgqj.qskd,jdm_kdjgqj.zzkd";
	ls_sql+=" FROM jc_mmdglx,jdm_kdjgqj  ";
    ls_sql+=" where jdm_kdjgqj.mmdglxbm=jc_mmdglx.mmdglxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_kdjgqj.mmdglxbm,jdm_kdjgqj.kdjgqjbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_kdjgqjList.jsp","SelectJdm_kdjgqj.jsp","","EditJdm_kdjgqj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kdjgqjbm","jdm_kdjgqj_kdjgqj","jdm_kdjgqj_qskd","jdm_kdjgqj_zzkd","jc_mmdglx_mmdglxmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kdjgqjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_kdjgqjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mmdglxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] kdjgqjbm = request.getParameterValues("kdjgqjbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kdjgqjbm,"kdjgqjbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_kdjgqj where "+chooseitem;
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
	<td  width="27%">订购类型</td>
	<td  width="15%">宽度价格区间编码</td>
	<td  width="15%">宽度价格区间</td>
	<td  width="15%">起始宽度（>）</td>
	<td  width="15%">终止宽度（<=）</td>
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