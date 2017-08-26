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
	String jc_mtbjb_mmdglxbm=null;
	String jc_mtbjb_ysbm=null;
	String jc_mtbjb_qhjgqjbm=null;
	String jc_mtbjb_mmdj=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mtbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mtbjb.dqbm='"+dqbm+"')";

	jc_mtbjb_mmdglxbm=request.getParameter("jc_mtbjb_mmdglxbm");
	if (jc_mtbjb_mmdglxbm!=null)
	{
		jc_mtbjb_mmdglxbm=cf.GB2Uni(jc_mtbjb_mmdglxbm);
		if (!(jc_mtbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_mtbjb.mmdglxbm='"+jc_mtbjb_mmdglxbm+"')";
	}
	jc_mtbjb_ysbm=request.getParameter("jc_mtbjb_ysbm");
	if (jc_mtbjb_ysbm!=null)
	{
		jc_mtbjb_ysbm=cf.GB2Uni(jc_mtbjb_ysbm);
		if (!(jc_mtbjb_ysbm.equals("")))	wheresql+=" and  (jc_mtbjb.ysbm='"+jc_mtbjb_ysbm+"')";
	}
	jc_mtbjb_qhjgqjbm=request.getParameter("jc_mtbjb_qhjgqjbm");
	if (jc_mtbjb_qhjgqjbm!=null)
	{
		jc_mtbjb_qhjgqjbm=cf.GB2Uni(jc_mtbjb_qhjgqjbm);
		if (!(jc_mtbjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_mtbjb.qhjgqjbm='"+jc_mtbjb_qhjgqjbm+"')";
	}
	jc_mtbjb_mmdj=request.getParameter("jc_mtbjb_mmdj");
	if (jc_mtbjb_mmdj!=null)
	{
		jc_mtbjb_mmdj=jc_mtbjb_mmdj.trim();
		if (!(jc_mtbjb_mmdj.equals("")))	wheresql+=" and  (jc_mtbjb.mmdj="+jc_mtbjb_mmdj+") ";
	}
	ls_sql="SELECT jc_mtbjb.dqbm,jc_mtbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_mtbjb.ysbm as ysbm,mmczmc,jc_mtbjb.qhjgqjbm as qhjgqjbm,jdm_qhjgqj.qhjgqj as jdm_qhjgqj_qhjgqj,jc_mtbjb.mmdj as jc_mtbjb_mmdj,yksmjjl,jc_mtbjb.lrr,jc_mtbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmdglx,jc_mtbjb,jdm_qhjgqj,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mtbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mtbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=" and jc_mtbjb.dqbm=dm_dqbm.dqbm(+) and jc_mtbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('12','13','14','15') ";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mtbjb.dqbm,jc_mtbjb.mmdglxbm,jc_mtbjb.ysbm,jc_mtbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mtbjbList.jsp","SelectJc_mtbjb.jsp","","EditJc_mtbjb.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"jc_mmdglx_mmdglxmc","mmczmc","jdm_qhjgqj_qhjgqj","jc_mtbjb_mmdj","yksmjjl","lrr","lrsj","dwmc","dqmc" };
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"mmdglxbm","dqbm","ysbm","qhjgqjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_mtbjbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//列参数对象加入Hash表
	spanColHash.put("mmczmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_mtbjb where "+chooseitem;
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
	<td  width="11%">木门订购类型</td>
	<td  width="16%">材质</td>
	<td  width="14%">墙厚价格区间</td>
	<td  width="8%">每米单价</td>
	<td  width="8%">松木集成材加价率</td>
	<td  width="7%">录入人</td>
	<td  width="9%">录入时间</td>
	<td  width="12%">录入部门</td>
	<td  width="7%">所属地区</td>
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