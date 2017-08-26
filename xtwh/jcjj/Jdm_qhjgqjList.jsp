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
	String qhjgqjbm=null;
	String qhjgqj=null;
	String qshd=null;
	String zzhd=null;
	String mmdglxbm=null;
	mmdglxbm=request.getParameter("mmdglxbm");
	if (mmdglxbm!=null)
	{
		if (!(mmdglxbm.equals("")))	wheresql+=" and  (jdm_qhjgqj.mmdglxbm='"+mmdglxbm+"')";
	}
	qhjgqjbm=request.getParameter("qhjgqjbm");
	if (qhjgqjbm!=null)
	{
		qhjgqjbm=cf.GB2Uni(qhjgqjbm);
		if (!(qhjgqjbm.equals("")))	wheresql+=" and  (qhjgqjbm='"+qhjgqjbm+"')";
	}
	qhjgqj=request.getParameter("qhjgqj");
	if (qhjgqj!=null)
	{
		qhjgqj=cf.GB2Uni(qhjgqj);
		if (!(qhjgqj.equals("")))	wheresql+=" and  (qhjgqj='"+qhjgqj+"')";
	}
	qshd=request.getParameter("qshd");
	if (qshd!=null)
	{
		qshd=qshd.trim();
		if (!(qshd.equals("")))	wheresql+=" and (qshd="+qshd+") ";
	}
	zzhd=request.getParameter("zzhd");
	if (zzhd!=null)
	{
		zzhd=zzhd.trim();
		if (!(zzhd.equals("")))	wheresql+=" and (zzhd="+zzhd+") ";
	}
	ls_sql="SELECT mmdglxmc,qhjgqjbm,qhjgqj,qshd,zzhd";
	ls_sql+=" FROM jdm_qhjgqj,jc_mmdglx  ";
    ls_sql+=" where (jdm_qhjgqj.mmdglxbm=jc_mmdglx.mmdglxbm(+))";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_qhjgqj.mmdglxbm,qhjgqjbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jdm_qhjgqjList.jsp","SelectJdm_qhjgqj.jsp","","EditJdm_qhjgqj.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"qhjgqjbm","qhjgqj","qshd","zzhd"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"qhjgqjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jdm_qhjgqjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mmdglxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] qhjgqjbm = request.getParameterValues("qhjgqjbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(qhjgqjbm,"qhjgqjbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jdm_qhjgqj where "+chooseitem;
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
	<td  width="10%">&nbsp;</td>
	<td  width="18%">订购类型</td>
	<td  width="18%">墙厚价格区间编码</td>
	<td  width="20%">墙厚价格区间</td>
	<td  width="17%">起始厚度（>）mm</td>
	<td  width="17%">终止厚度（<=）mm</td>
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