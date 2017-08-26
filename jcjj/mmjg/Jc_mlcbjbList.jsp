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
	String jc_mlcbjb_mmdglxbm=null;
	String jc_mlcbjb_ysbm=null;
	String jc_mlcbjb_qhjgqjbm=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mlcbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mlcbjb.dqbm='"+dqbm+"')";

	jc_mlcbjb_mmdglxbm=request.getParameter("jc_mlcbjb_mmdglxbm");
	if (jc_mlcbjb_mmdglxbm!=null)
	{
		jc_mlcbjb_mmdglxbm=cf.GB2Uni(jc_mlcbjb_mmdglxbm);
		if (!(jc_mlcbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_mlcbjb.mmdglxbm='"+jc_mlcbjb_mmdglxbm+"')";
	}
	jc_mlcbjb_ysbm=request.getParameter("jc_mlcbjb_ysbm");
	if (jc_mlcbjb_ysbm!=null)
	{
		jc_mlcbjb_ysbm=cf.GB2Uni(jc_mlcbjb_ysbm);
		if (!(jc_mlcbjb_ysbm.equals("")))	wheresql+=" and  (jc_mlcbjb.ysbm='"+jc_mlcbjb_ysbm+"')";
	}
	jc_mlcbjb_qhjgqjbm=request.getParameter("jc_mlcbjb_qhjgqjbm");
	if (jc_mlcbjb_qhjgqjbm!=null)
	{
		jc_mlcbjb_qhjgqjbm=cf.GB2Uni(jc_mlcbjb_qhjgqjbm);
		if (!(jc_mlcbjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_mlcbjb.qhjgqjbm='"+jc_mlcbjb_qhjgqjbm+"')";
	}
	ls_sql="SELECT jc_mlcbjb.dqbm,jc_mlcbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_mlcbjb.ysbm as ysbm,jdm_mmczbm.mmczmc as jdm_mmczbm_mmczmc,jc_mlcbjb.qhjgqjbm as qhjgqjbm,jdm_qhjgqj.qhjgqj as jdm_qhjgqj_qhjgqj,jc_mlcbjb.ctdj as jc_mlcbjb_ctdj,jc_mlcbjb.csdj as jc_mlcbjb_csdj,jc_mlcbjb.lrr,jc_mlcbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jc_mlcbjb,jc_mmdglx,jdm_mmczbm,jdm_qhjgqj,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mlcbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mlcbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mlcbjb.dqbm=dm_dqbm.dqbm(+) and jc_mlcbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('21','22')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mlcbjb.dqbm,jc_mlcbjb.mmdglxbm,jc_mlcbjb.ysbm,jc_mlcbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mlcbjbList.jsp","SelectJc_mlcbjb.jsp","","EditJc_mlcbjb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"jc_mmdglx_mmdglxmc","jdm_mmczbm_mmczmc","jdm_qhjgqj_qhjgqj","jc_mlcbjb_ctdj","jc_mlcbjb_csdj","lrr","lrsj","dwmc","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"mmdglxbm","dqbm","ysbm","qhjgqjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_mlcbjbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//列参数对象加入Hash表
	spanColHash.put("jdm_mmczbm_mmczmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_mlcbjb where "+chooseitem;
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
	<td  width="16%">订购类型</td>
	<td  width="12%">材质</td>
	<td  width="12%">墙厚价格区间</td>
	<td  width="9%">窗套每米单价</td>
	<td  width="9%">窗扇每平米单价</td>
	<td  width="6%">录入人</td>
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
