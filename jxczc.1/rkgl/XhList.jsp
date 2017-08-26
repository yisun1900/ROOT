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
	String cgjhph=null;
	String jhxh=null;
	String clbm=null;
	String jhcgsl=null;
	String sjcgsl=null;
	cgjhph=request.getParameter("cgjhph");
	if (cgjhph!=null)
	{
		cgjhph=cf.GB2Uni(cgjhph);
		if (!(cgjhph.equals("")))	wheresql+=" and  (jxc_cgjhmx.cgjhph='"+cgjhph+"')";
	}
	jhxh=request.getParameter("jhxh");
	if (jhxh!=null)
	{
		jhxh=jhxh.trim();
		if (!(jhxh.equals("")))	wheresql+=" and (jxc_cgjhmx.jhxh="+jhxh+") ";
	}
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (jxc_cgjhmx.clbm='"+clbm+"')";
	}
	jhcgsl=request.getParameter("jhcgsl");
	if (jhcgsl!=null)
	{
		jhcgsl=jhcgsl.trim();
		if (!(jhcgsl.equals("")))	wheresql+=" and  (jxc_cgjhmx.jhcgsl="+jhcgsl+") ";
	}
	sjcgsl=request.getParameter("sjcgsl");
	if (sjcgsl!=null)
	{
		sjcgsl=sjcgsl.trim();
		if (!(sjcgsl.equals("")))	wheresql+=" and  (jxc_cgjhmx.sjcgsl="+sjcgsl+") ";
	}
	ls_sql="SELECT cgjhph,jhxh,nbbm,clmc,xh,gg,bzgg,jhcgsl,sjcgsl  ";
	ls_sql+=" FROM jxc_cgjhmx,jxc_clbm  ";
    ls_sql+=" where jxc_cgjhmx.clbm=jxc_clbm.clbm ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cgjhph","jhxh","clbm","jhcgsl","sjcgsl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cgjhph","jhxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"XhList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jxc_cgjhmx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px' >
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">采购计划批号</td>
	<td  width="3%">计划序号</td>
	<td  width="8%">内部编码</td>
	<td  width="12%">材料名称</td>
	<td  width="8%">型号</td>
	<td  width="8%">规格</td>
	<td  width="8%">包装规格</td>
	<td  width="5%">计划采购数量</td>
	<td  width="5%">实际采购数量</td>
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