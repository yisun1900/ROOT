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
	String cw_gdyplyjl_jlh=null;
	String cw_gdyplyjl_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_gdyplyjl_gdyp=null;
	String cw_gdyplyjl_dj=null;
	String cw_gdyplyjl_sl=null;
	String cw_gdyplyjl_je=null;
	String cw_gdyplyjl_jkblr=null;
	String cw_gdyplyjl_jkblsj=null;
	String cw_gdyplyjl_lrr=null;
	String cw_gdyplyjl_lrsj=null;
	String cw_gdyplyjl_lrbm=null;
	String cw_gdyplyjl_jsbz=null;
	String cw_gdyplyjl_jsjlh=null;
	String cw_gdyplyjl_scbz=null;
	String cw_gdyplyjl_scr=null;
	String cw_gdyplyjl_scsj=null;
	cw_gdyplyjl_jlh=request.getParameter("cw_gdyplyjl_jlh");
	if (cw_gdyplyjl_jlh!=null)
	{
		cw_gdyplyjl_jlh=cf.GB2Uni(cw_gdyplyjl_jlh);
		if (!(cw_gdyplyjl_jlh.equals("")))	wheresql+=" and  (cw_gdyplyjl.jlh='"+cw_gdyplyjl_jlh+"')";
	}
	cw_gdyplyjl_sgd=request.getParameter("cw_gdyplyjl_sgd");
	if (cw_gdyplyjl_sgd!=null)
	{
		cw_gdyplyjl_sgd=cf.GB2Uni(cw_gdyplyjl_sgd);
		if (!(cw_gdyplyjl_sgd.equals("")))	wheresql+=" and  (cw_gdyplyjl.sgd='"+cw_gdyplyjl_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_gdyplyjl_gdyp=request.getParameter("cw_gdyplyjl_gdyp");
	if (cw_gdyplyjl_gdyp!=null)
	{
		cw_gdyplyjl_gdyp=cf.GB2Uni(cw_gdyplyjl_gdyp);
		if (!(cw_gdyplyjl_gdyp.equals("")))	wheresql+=" and  (cw_gdyplyjl.gdyp='"+cw_gdyplyjl_gdyp+"')";
	}
	cw_gdyplyjl_dj=request.getParameter("cw_gdyplyjl_dj");
	if (cw_gdyplyjl_dj!=null)
	{
		cw_gdyplyjl_dj=cw_gdyplyjl_dj.trim();
		if (!(cw_gdyplyjl_dj.equals("")))	wheresql+=" and  (cw_gdyplyjl.dj="+cw_gdyplyjl_dj+") ";
	}
	cw_gdyplyjl_sl=request.getParameter("cw_gdyplyjl_sl");
	if (cw_gdyplyjl_sl!=null)
	{
		cw_gdyplyjl_sl=cw_gdyplyjl_sl.trim();
		if (!(cw_gdyplyjl_sl.equals("")))	wheresql+=" and  (cw_gdyplyjl.sl="+cw_gdyplyjl_sl+") ";
	}
	cw_gdyplyjl_je=request.getParameter("cw_gdyplyjl_je");
	if (cw_gdyplyjl_je!=null)
	{
		cw_gdyplyjl_je=cw_gdyplyjl_je.trim();
		if (!(cw_gdyplyjl_je.equals("")))	wheresql+=" and  (cw_gdyplyjl.je="+cw_gdyplyjl_je+") ";
	}
	cw_gdyplyjl_jkblr=request.getParameter("cw_gdyplyjl_jkblr");
	if (cw_gdyplyjl_jkblr!=null)
	{
		cw_gdyplyjl_jkblr=cf.GB2Uni(cw_gdyplyjl_jkblr);
		if (!(cw_gdyplyjl_jkblr.equals("")))	wheresql+=" and  (cw_gdyplyjl.jkblr='"+cw_gdyplyjl_jkblr+"')";
	}
	cw_gdyplyjl_jkblsj=request.getParameter("cw_gdyplyjl_jkblsj");
	if (cw_gdyplyjl_jkblsj!=null)
	{
		cw_gdyplyjl_jkblsj=cw_gdyplyjl_jkblsj.trim();
		if (!(cw_gdyplyjl_jkblsj.equals("")))	wheresql+="  and (cw_gdyplyjl.jkblsj=TO_DATE('"+cw_gdyplyjl_jkblsj+"','YYYY/MM/DD'))";
	}
	cw_gdyplyjl_lrr=request.getParameter("cw_gdyplyjl_lrr");
	if (cw_gdyplyjl_lrr!=null)
	{
		cw_gdyplyjl_lrr=cf.GB2Uni(cw_gdyplyjl_lrr);
		if (!(cw_gdyplyjl_lrr.equals("")))	wheresql+=" and  (cw_gdyplyjl.lrr='"+cw_gdyplyjl_lrr+"')";
	}
	cw_gdyplyjl_lrsj=request.getParameter("cw_gdyplyjl_lrsj");
	if (cw_gdyplyjl_lrsj!=null)
	{
		cw_gdyplyjl_lrsj=cw_gdyplyjl_lrsj.trim();
		if (!(cw_gdyplyjl_lrsj.equals("")))	wheresql+="  and (cw_gdyplyjl.lrsj=TO_DATE('"+cw_gdyplyjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdyplyjl_lrbm=request.getParameter("cw_gdyplyjl_lrbm");
	if (cw_gdyplyjl_lrbm!=null)
	{
		cw_gdyplyjl_lrbm=cf.GB2Uni(cw_gdyplyjl_lrbm);
		if (!(cw_gdyplyjl_lrbm.equals("")))	wheresql+=" and  (cw_gdyplyjl.lrbm='"+cw_gdyplyjl_lrbm+"')";
	}
	cw_gdyplyjl_jsbz=request.getParameter("cw_gdyplyjl_jsbz");
	if (cw_gdyplyjl_jsbz!=null)
	{
		cw_gdyplyjl_jsbz=cf.GB2Uni(cw_gdyplyjl_jsbz);
		if (!(cw_gdyplyjl_jsbz.equals("")))	wheresql+=" and  (cw_gdyplyjl.jsbz='"+cw_gdyplyjl_jsbz+"')";
	}
	cw_gdyplyjl_jsjlh=request.getParameter("cw_gdyplyjl_jsjlh");
	if (cw_gdyplyjl_jsjlh!=null)
	{
		cw_gdyplyjl_jsjlh=cf.GB2Uni(cw_gdyplyjl_jsjlh);
		if (!(cw_gdyplyjl_jsjlh.equals("")))	wheresql+=" and  (cw_gdyplyjl.jsjlh='"+cw_gdyplyjl_jsjlh+"')";
	}
	cw_gdyplyjl_scbz=request.getParameter("cw_gdyplyjl_scbz");
	if (cw_gdyplyjl_scbz!=null)
	{
		cw_gdyplyjl_scbz=cf.GB2Uni(cw_gdyplyjl_scbz);
		if (!(cw_gdyplyjl_scbz.equals("")))	wheresql+=" and  (cw_gdyplyjl.scbz='"+cw_gdyplyjl_scbz+"')";
	}
	cw_gdyplyjl_scr=request.getParameter("cw_gdyplyjl_scr");
	if (cw_gdyplyjl_scr!=null)
	{
		cw_gdyplyjl_scr=cf.GB2Uni(cw_gdyplyjl_scr);
		if (!(cw_gdyplyjl_scr.equals("")))	wheresql+=" and  (cw_gdyplyjl.scr='"+cw_gdyplyjl_scr+"')";
	}
	cw_gdyplyjl_scsj=request.getParameter("cw_gdyplyjl_scsj");
	if (cw_gdyplyjl_scsj!=null)
	{
		cw_gdyplyjl_scsj=cw_gdyplyjl_scsj.trim();
		if (!(cw_gdyplyjl_scsj.equals("")))	wheresql+="  and (cw_gdyplyjl.scsj=TO_DATE('"+cw_gdyplyjl_scsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_gdyplyjl.jlh,sq_sgd.sgdmc,cw_gdyplyjl.gdyp,cw_gdyplyjl.dj,cw_gdyplyjl.sl,cw_gdyplyjl.je,cw_gdyplyjl.jkblr,cw_gdyplyjl.jkblsj,cw_gdyplyjl.lrr,cw_gdyplyjl.lrsj,dwmc, DECODE(cw_gdyplyjl.jsbz,'0','未结算','1','已结算'),cw_gdyplyjl.jsjlh, DECODE(cw_gdyplyjl.scbz,'N','未删除','Y','删除'),cw_gdyplyjl.scr,cw_gdyplyjl.scsj,cw_gdyplyjl.bz  ";
	ls_sql+=" FROM cw_gdyplyjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdyplyjl.sgd=sq_sgd.sgd(+) and cw_gdyplyjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gdyplyjl.jlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_gdyplyjlList.jsp","","","EditCw_gdyplyjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","cw_gdyplyjl_sgd","sq_sgd_sgdmc","cw_gdyplyjl_gdyp","cw_gdyplyjl_dj","cw_gdyplyjl_sl","cw_gdyplyjl_je","cw_gdyplyjl_jkblr","cw_gdyplyjl_jkblsj","cw_gdyplyjl_lrr","cw_gdyplyjl_lrsj","cw_gdyplyjl_lrbm","cw_gdyplyjl_jsbz","cw_gdyplyjl_jsjlh","cw_gdyplyjl_scbz","cw_gdyplyjl_scr","cw_gdyplyjl_scsj","cw_gdyplyjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_gdyplyjlList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] jlh = request.getParameterValues("jlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(jlh,"jlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_gdyplyjl where "+chooseitem;
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">记录号</td>
	<td  width="4%">施工队</td>
	<td  width="8%">工地用品</td>
	<td  width="4%">单价</td>
	<td  width="4%">数量</td>
	<td  width="4%">金额</td>
	<td  width="4%">办理人</td>
	<td  width="6%">办理时间</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="4%">结算标志</td>
	<td  width="4%">结算记录号</td>
	<td  width="4%">删除标志</td>
	<td  width="4%">删除人</td>
	<td  width="6%">删除时间</td>
	<td  width="44%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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