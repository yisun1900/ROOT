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
	String cw_fllyjl_jlh=null;
	String cw_fllyjl_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_fllyjl_gdyp=null;
	String cw_fllyjl_dj=null;
	String cw_fllyjl_sl=null;
	String cw_fllyjl_je=null;
	String cw_fllyjl_jkblr=null;
	String cw_fllyjl_jkblsj=null;
	String cw_fllyjl_lrr=null;
	String cw_fllyjl_lrsj=null;
	String cw_fllyjl_lrbm=null;
	String cw_fllyjl_jsbz=null;
	String cw_fllyjl_jsjlh=null;
	String cw_fllyjl_scbz=null;
	String cw_fllyjl_scr=null;
	String cw_fllyjl_scsj=null;
	cw_fllyjl_jlh=request.getParameter("cw_fllyjl_jlh");
	if (cw_fllyjl_jlh!=null)
	{
		cw_fllyjl_jlh=cf.GB2Uni(cw_fllyjl_jlh);
		if (!(cw_fllyjl_jlh.equals("")))	wheresql+=" and  (cw_fllyjl.jlh='"+cw_fllyjl_jlh+"')";
	}
	cw_fllyjl_sgd=request.getParameter("cw_fllyjl_sgd");
	if (cw_fllyjl_sgd!=null)
	{
		cw_fllyjl_sgd=cf.GB2Uni(cw_fllyjl_sgd);
		if (!(cw_fllyjl_sgd.equals("")))	wheresql+=" and  (cw_fllyjl.sgd='"+cw_fllyjl_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_fllyjl_gdyp=request.getParameter("cw_fllyjl_gdyp");
	if (cw_fllyjl_gdyp!=null)
	{
		cw_fllyjl_gdyp=cf.GB2Uni(cw_fllyjl_gdyp);
		if (!(cw_fllyjl_gdyp.equals("")))	wheresql+=" and  (cw_fllyjl.gdyp='"+cw_fllyjl_gdyp+"')";
	}
	cw_fllyjl_dj=request.getParameter("cw_fllyjl_dj");
	if (cw_fllyjl_dj!=null)
	{
		cw_fllyjl_dj=cw_fllyjl_dj.trim();
		if (!(cw_fllyjl_dj.equals("")))	wheresql+=" and  (cw_fllyjl.dj="+cw_fllyjl_dj+") ";
	}
	cw_fllyjl_sl=request.getParameter("cw_fllyjl_sl");
	if (cw_fllyjl_sl!=null)
	{
		cw_fllyjl_sl=cw_fllyjl_sl.trim();
		if (!(cw_fllyjl_sl.equals("")))	wheresql+=" and  (cw_fllyjl.sl="+cw_fllyjl_sl+") ";
	}
	cw_fllyjl_je=request.getParameter("cw_fllyjl_je");
	if (cw_fllyjl_je!=null)
	{
		cw_fllyjl_je=cw_fllyjl_je.trim();
		if (!(cw_fllyjl_je.equals("")))	wheresql+=" and  (cw_fllyjl.je="+cw_fllyjl_je+") ";
	}
	cw_fllyjl_jkblr=request.getParameter("cw_fllyjl_jkblr");
	if (cw_fllyjl_jkblr!=null)
	{
		cw_fllyjl_jkblr=cf.GB2Uni(cw_fllyjl_jkblr);
		if (!(cw_fllyjl_jkblr.equals("")))	wheresql+=" and  (cw_fllyjl.jkblr='"+cw_fllyjl_jkblr+"')";
	}
	cw_fllyjl_jkblsj=request.getParameter("cw_fllyjl_jkblsj");
	if (cw_fllyjl_jkblsj!=null)
	{
		cw_fllyjl_jkblsj=cw_fllyjl_jkblsj.trim();
		if (!(cw_fllyjl_jkblsj.equals("")))	wheresql+="  and (cw_fllyjl.jkblsj=TO_DATE('"+cw_fllyjl_jkblsj+"','YYYY/MM/DD'))";
	}
	cw_fllyjl_lrr=request.getParameter("cw_fllyjl_lrr");
	if (cw_fllyjl_lrr!=null)
	{
		cw_fllyjl_lrr=cf.GB2Uni(cw_fllyjl_lrr);
		if (!(cw_fllyjl_lrr.equals("")))	wheresql+=" and  (cw_fllyjl.lrr='"+cw_fllyjl_lrr+"')";
	}
	cw_fllyjl_lrsj=request.getParameter("cw_fllyjl_lrsj");
	if (cw_fllyjl_lrsj!=null)
	{
		cw_fllyjl_lrsj=cw_fllyjl_lrsj.trim();
		if (!(cw_fllyjl_lrsj.equals("")))	wheresql+="  and (cw_fllyjl.lrsj=TO_DATE('"+cw_fllyjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_fllyjl_lrbm=request.getParameter("cw_fllyjl_lrbm");
	if (cw_fllyjl_lrbm!=null)
	{
		cw_fllyjl_lrbm=cf.GB2Uni(cw_fllyjl_lrbm);
		if (!(cw_fllyjl_lrbm.equals("")))	wheresql+=" and  (cw_fllyjl.lrbm='"+cw_fllyjl_lrbm+"')";
	}
	cw_fllyjl_jsbz=request.getParameter("cw_fllyjl_jsbz");
	if (cw_fllyjl_jsbz!=null)
	{
		cw_fllyjl_jsbz=cf.GB2Uni(cw_fllyjl_jsbz);
		if (!(cw_fllyjl_jsbz.equals("")))	wheresql+=" and  (cw_fllyjl.jsbz='"+cw_fllyjl_jsbz+"')";
	}
	cw_fllyjl_jsjlh=request.getParameter("cw_fllyjl_jsjlh");
	if (cw_fllyjl_jsjlh!=null)
	{
		cw_fllyjl_jsjlh=cf.GB2Uni(cw_fllyjl_jsjlh);
		if (!(cw_fllyjl_jsjlh.equals("")))	wheresql+=" and  (cw_fllyjl.jsjlh='"+cw_fllyjl_jsjlh+"')";
	}
	cw_fllyjl_scbz=request.getParameter("cw_fllyjl_scbz");
	if (cw_fllyjl_scbz!=null)
	{
		cw_fllyjl_scbz=cf.GB2Uni(cw_fllyjl_scbz);
		if (!(cw_fllyjl_scbz.equals("")))	wheresql+=" and  (cw_fllyjl.scbz='"+cw_fllyjl_scbz+"')";
	}
	cw_fllyjl_scr=request.getParameter("cw_fllyjl_scr");
	if (cw_fllyjl_scr!=null)
	{
		cw_fllyjl_scr=cf.GB2Uni(cw_fllyjl_scr);
		if (!(cw_fllyjl_scr.equals("")))	wheresql+=" and  (cw_fllyjl.scr='"+cw_fllyjl_scr+"')";
	}
	cw_fllyjl_scsj=request.getParameter("cw_fllyjl_scsj");
	if (cw_fllyjl_scsj!=null)
	{
		cw_fllyjl_scsj=cw_fllyjl_scsj.trim();
		if (!(cw_fllyjl_scsj.equals("")))	wheresql+="  and (cw_fllyjl.scsj=TO_DATE('"+cw_fllyjl_scsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_fllyjl.jlh,sq_sgd.sgdmc,cw_fllyjl.zsl,cw_fllyjl.zje,cw_fllyjl.jkblr,cw_fllyjl.jkblsj,cw_fllyjl.lrr,cw_fllyjl.lrsj,dwmc, DECODE(cw_fllyjl.jsbz,'0','未结算','1','已结算'),cw_fllyjl.jsjlh, DECODE(cw_fllyjl.scbz,'N','未删除','Y','删除'),cw_fllyjl.scr,cw_fllyjl.scsj,cw_fllyjl.bz  ";
	ls_sql+=" FROM cw_fllyjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_fllyjl.sgd=sq_sgd.sgd(+) and cw_fllyjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_fllyjl.jlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_fllyjlList.jsp","","","EditCw_fllyjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jlh","cw_fllyjl_sgd","sq_sgd_sgdmc","cw_fllyjl_gdyp","cw_fllyjl_dj","cw_fllyjl_sl","cw_fllyjl_je","cw_fllyjl_jkblr","cw_fllyjl_jkblsj","cw_fllyjl_lrr","cw_fllyjl_lrsj","cw_fllyjl_lrbm","cw_fllyjl_jsbz","cw_fllyjl_jsjlh","cw_fllyjl_scbz","cw_fllyjl_scr","cw_fllyjl_scsj","cw_fllyjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"cw_fllyjlList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from cw_fllyjl where "+chooseitem;
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
	<td  width="4%">数量</td>
	<td  width="4%">金额</td>
	<td  width="4%">办理人</td>
	<td  width="6%">办理时间</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="4%">结算标志</td>
	<td  width="6%">结算记录号</td>
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