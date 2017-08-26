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
	String jc_tjxbjb_mmdglxbm=null;
	String jc_tjxbjb_ysbm=null;
	String jc_tjxbjb_dj=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_tjxbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_tjxbjb.dqbm='"+dqbm+"')";

	jc_tjxbjb_mmdglxbm=request.getParameter("jc_tjxbjb_mmdglxbm");
	if (jc_tjxbjb_mmdglxbm!=null)
	{
		jc_tjxbjb_mmdglxbm=cf.GB2Uni(jc_tjxbjb_mmdglxbm);
		if (!(jc_tjxbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_tjxbjb.mmdglxbm='"+jc_tjxbjb_mmdglxbm+"')";
	}
	jc_tjxbjb_ysbm=request.getParameter("jc_tjxbjb_ysbm");
	if (jc_tjxbjb_ysbm!=null)
	{
		jc_tjxbjb_ysbm=cf.GB2Uni(jc_tjxbjb_ysbm);
		if (!(jc_tjxbjb_ysbm.equals("")))	wheresql+=" and  (jc_tjxbjb.ysbm='"+jc_tjxbjb_ysbm+"')";
	}
	jc_tjxbjb_dj=request.getParameter("jc_tjxbjb_dj");
	if (jc_tjxbjb_dj!=null)
	{
		jc_tjxbjb_dj=jc_tjxbjb_dj.trim();
		if (!(jc_tjxbjb_dj.equals("")))	wheresql+=" and  (jc_tjxbjb.dj="+jc_tjxbjb_dj+") ";
	}
	ls_sql="SELECT jc_tjxbjb.dqbm,jc_tjxbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_tjxbjb.ysbm as ysbm,mmczmc,jc_tjxbjb.dj as jc_tjxbjb_dj,jc_tjxbjb.lrr,jc_tjxbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmdglx,jc_tjxbjb,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm(+) and jc_tjxbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=" and jc_tjxbjb.dqbm=dm_dqbm.dqbm(+) and jc_tjxbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('41','42')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_tjxbjb.dqbm,jc_tjxbjb.mmdglxbm,jc_tjxbjb.ysbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_tjxbjbList.jsp","SelectJc_tjxbjb.jsp","","EditJc_tjxbjb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"jc_mmdglx_mmdglxmc","mmczmc","jc_tjxbjb_dj","lrr","lrsj","dwmc","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"mmdglxbm","dqbm","ysbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_tjxbjbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_tjxbjb where "+chooseitem;
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
	<td  width="20%">订购类型</td>
	<td  width="18%">材质</td>
	<td  width="10%">单价</td>
	<td  width="8%">录入人</td>
	<td  width="11%">录入时间</td>
	<td  width="15%">录入部门</td>
	<td  width="10%">所属地区</td>
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