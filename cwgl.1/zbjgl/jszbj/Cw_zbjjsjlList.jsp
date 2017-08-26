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
	String cw_zbjjsjl_xuhao=null;
	String cw_zbjjsjl_sgd=null;
	String cw_zbjjsjl_zbjjsyybm=null;
	String cw_zbjjsjl_je=null;
	String cw_zbjjsjl_lrr=null;
	String cw_zbjjsjl_lrsj=null;
	cw_zbjjsjl_xuhao=request.getParameter("cw_zbjjsjl_xuhao");
	if (cw_zbjjsjl_xuhao!=null)
	{
		cw_zbjjsjl_xuhao=cw_zbjjsjl_xuhao.trim();
		if (!(cw_zbjjsjl_xuhao.equals("")))	wheresql+=" and (cw_zbjjsjl.xuhao="+cw_zbjjsjl_xuhao+") ";
	}
	cw_zbjjsjl_sgd=request.getParameter("cw_zbjjsjl_sgd");
	if (cw_zbjjsjl_sgd!=null)
	{
		cw_zbjjsjl_sgd=cf.GB2Uni(cw_zbjjsjl_sgd);
		if (!(cw_zbjjsjl_sgd.equals("")))	wheresql+=" and  (cw_zbjjsjl.sgd='"+cw_zbjjsjl_sgd+"')";
	}
	cw_zbjjsjl_zbjjsyybm=request.getParameter("cw_zbjjsjl_zbjjsyybm");
	if (cw_zbjjsjl_zbjjsyybm!=null)
	{
		cw_zbjjsjl_zbjjsyybm=cf.GB2Uni(cw_zbjjsjl_zbjjsyybm);
		if (!(cw_zbjjsjl_zbjjsyybm.equals("")))	wheresql+=" and  (cw_zbjjsjl.zbjjsyybm='"+cw_zbjjsjl_zbjjsyybm+"')";
	}
	cw_zbjjsjl_je=request.getParameter("cw_zbjjsjl_je");
	if (cw_zbjjsjl_je!=null)
	{
		cw_zbjjsjl_je=cw_zbjjsjl_je.trim();
		if (!(cw_zbjjsjl_je.equals("")))	wheresql+=" and  (cw_zbjjsjl.je="+cw_zbjjsjl_je+") ";
	}
	cw_zbjjsjl_lrr=request.getParameter("cw_zbjjsjl_lrr");
	if (cw_zbjjsjl_lrr!=null)
	{
		cw_zbjjsjl_lrr=cf.GB2Uni(cw_zbjjsjl_lrr);
		if (!(cw_zbjjsjl_lrr.equals("")))	wheresql+=" and  (cw_zbjjsjl.lrr='"+cw_zbjjsjl_lrr+"')";
	}
	cw_zbjjsjl_lrsj=request.getParameter("cw_zbjjsjl_lrsj");
	if (cw_zbjjsjl_lrsj!=null)
	{
		cw_zbjjsjl_lrsj=cw_zbjjsjl_lrsj.trim();
		if (!(cw_zbjjsjl_lrsj.equals("")))	wheresql+="  and (cw_zbjjsjl.lrsj=TO_DATE('"+cw_zbjjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_zbjjsjl.xuhao,sq_sgd.sgdmc,dm_zbjjsyybm.zbjjsyymc,cw_zbjjsjl.je,cw_zbjjsjl.lrr,cw_zbjjsjl.lrsj,cw_zbjjsjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjjsjl  ";
    ls_sql+=" where cw_zbjjsjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjjsjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zbjjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zbjjsjlList.jsp","SelectCw_zbjjsjl.jsp","","EditCw_zbjjsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","sq_sgd_sgdmc","dm_zbjjsyybm_zbjjsyymc","cw_zbjjsjl_je","cw_zbjjsjl_lrr","cw_zbjjsjl_lrsj","cw_zbjjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_zbjjsjl.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
	String[] xuhao = request.getParameterValues("xuhao");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xuhao,"xuhao"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_zbjjsjl where "+chooseitem;
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
	<td  width="8%">序号</td>
	<td  width="8%">施工队</td>
	<td  width="14%">质保金减少原因</td>
	<td  width="14%">金额</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="30%">备注</td>
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