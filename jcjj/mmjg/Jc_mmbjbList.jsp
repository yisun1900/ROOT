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
	String mxbm=null;
	String jc_mmbjb_ysbm=null;
	String jc_mmbjb_qhjgqjbm=null;
	String ztmdj=null;

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jc_mmbjb.dqbm='"+dqbm+"')";
	}
	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mmbjb.lrbm='"+lrbm+"')";
	}

	mxbm=request.getParameter("mxbm");
	if (mxbm!=null)
	{
		mxbm=cf.GB2Uni(mxbm);
		if (!(mxbm.equals("")))	wheresql+=" and  (jc_mmxhb.mxbm='"+mxbm+"')";
	}
	String mmxh=null;
	mmxh=request.getParameter("mmxh");
	if (mmxh!=null)
	{
		mmxh=cf.GB2Uni(mmxh);
		if (!(mmxh.equals("")))	wheresql+=" and  (jc_mmbjb.mmxh='"+mmxh+"')";
	}
	jc_mmbjb_ysbm=request.getParameter("jc_mmbjb_ysbm");
	if (jc_mmbjb_ysbm!=null)
	{
		jc_mmbjb_ysbm=cf.GB2Uni(jc_mmbjb_ysbm);
		if (!(jc_mmbjb_ysbm.equals("")))	wheresql+=" and  (jc_mmbjb.ysbm='"+jc_mmbjb_ysbm+"')";
	}
	jc_mmbjb_qhjgqjbm=request.getParameter("jc_mmbjb_qhjgqjbm");
	if (jc_mmbjb_qhjgqjbm!=null)
	{
		jc_mmbjb_qhjgqjbm=cf.GB2Uni(jc_mmbjb_qhjgqjbm);
		if (!(jc_mmbjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_mmbjb.qhjgqjbm='"+jc_mmbjb_qhjgqjbm+"')";
	}
	ztmdj=request.getParameter("ztmdj");
	if (ztmdj!=null)
	{
		ztmdj=ztmdj.trim();
		if (!(ztmdj.equals("")))	wheresql+=" and  (jc_mmbjb.ztmdj="+ztmdj+") ";
	}
	ls_sql="SELECT distinct jc_mmbjb.dqbm,jc_mmbjb.mmxh as mmxh,mxmc,jc_mmbjb.ysbm as ysbm,jdm_mmczbm.mmczmc,jc_mmbjb.qhjgqjbm,jdm_qhjgqj.qhjgqj,jc_mmbjb.ztmdj as ztmdj,dmsjg,dmtjg,mtjg,dkmtjg,zdmjjl,yksmjjl,zmmjg,ysbljjl,tlmpmdj,jc_mmbjb.lrr,jc_mmbjb.lrsj,dwmc,dqmc,jc_mmbjb.bz  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmbjb,jdm_qhjgqj,jc_mmxhb,jdm_mxbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mmbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmbjb.mmxh=jc_mmxhb.mmxh(+) and jc_mmxhb.mxbm=jdm_mxbm.mxbm(+)";
    ls_sql+=" and jc_mmbjb.dqbm=dm_dqbm.dqbm(+) and jc_mmbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmbjb.dqbm,jc_mmbjb.mmxh,jc_mmbjb.ysbm,jc_mmbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmbjbList.jsp","SelectJc_mmbjb.jsp","","EditJc_mmbjb.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
//设置显示列
	String[] disColName={"mmxh","mxmc","mmczmc","qhjgqj","ztmdj","dmsjg","dmtjg","mtjg","dkmtjg","zmmjg","zdmjjl","yksmjjl","ysbljjl","tlmpmdj","lrr","lrsj","dwmc","dqmc","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"mmxh","dqbm","ysbm","qhjgqjbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_mmbjbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mmxh","1");//列参数对象加入Hash表
	spanColHash.put("mxmc","1");//列参数对象加入Hash表
	spanColHash.put("mmczmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_mmbjb where "+chooseitem;
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
  <B><font size="3">木门报价-维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">木门型号</td>
	<td  width="6%">门型</td>
	<td  width="8%">材质</td>
	<td  width="6%">墙厚价格区间</td>
	<td  width="4%">整樘门单价</td>
	<td  width="4%">单门扇价格</td>
	<td  width="4%">单门套价格</td>
	<td  width="4%">双口门套每米单价</td>
	<td  width="4%">单口门套每米单价</td>
	<td  width="4%">子母门加价率</td>
	<td  width="4%">折叠门加价率</td>
	<td  width="4%">哑口松木集成材加价率</td>
	<td  width="4%">艺术玻璃加价率</td>
	<td  width="4%">推拉门每平米单价</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="3%">地区</td>
	<td  width="12%">备注</td>
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
