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
	String cw_jxkkbl_xuhao=null;
	String cw_jxkkbl_mc=null;
	String cw_jxkkbl_qd=null;
	String cw_jxkkbl_zd=null;
	String cw_jxkkbl_bfb=null;
	String cw_jxkkbl_fgsbh=null;
	cw_jxkkbl_xuhao=request.getParameter("cw_jxkkbl_xuhao");
	if (cw_jxkkbl_xuhao!=null)
	{
		cw_jxkkbl_xuhao=cw_jxkkbl_xuhao.trim();
		if (!(cw_jxkkbl_xuhao.equals("")))	wheresql+=" and (cw_jxkkbl.xuhao="+cw_jxkkbl_xuhao+") ";
	}
	cw_jxkkbl_mc=request.getParameter("cw_jxkkbl_mc");
	if (cw_jxkkbl_mc!=null)
	{
		cw_jxkkbl_mc=cf.GB2Uni(cw_jxkkbl_mc);
		if (!(cw_jxkkbl_mc.equals("")))	wheresql+=" and  (cw_jxkkbl.mc='"+cw_jxkkbl_mc+"')";
	}
	cw_jxkkbl_qd=request.getParameter("cw_jxkkbl_qd");
	if (cw_jxkkbl_qd!=null)
	{
		cw_jxkkbl_qd=cw_jxkkbl_qd.trim();
		if (!(cw_jxkkbl_qd.equals("")))	wheresql+=" and  (cw_jxkkbl.qd="+cw_jxkkbl_qd+") ";
	}
	cw_jxkkbl_zd=request.getParameter("cw_jxkkbl_zd");
	if (cw_jxkkbl_zd!=null)
	{
		cw_jxkkbl_zd=cw_jxkkbl_zd.trim();
		if (!(cw_jxkkbl_zd.equals("")))	wheresql+=" and  (cw_jxkkbl.zd="+cw_jxkkbl_zd+") ";
	}
	cw_jxkkbl_bfb=request.getParameter("cw_jxkkbl_bfb");
	if (cw_jxkkbl_bfb!=null)
	{
		cw_jxkkbl_bfb=cw_jxkkbl_bfb.trim();
		if (!(cw_jxkkbl_bfb.equals("")))	wheresql+=" and  (cw_jxkkbl.bfb="+cw_jxkkbl_bfb+") ";
	}
	cw_jxkkbl_fgsbh=request.getParameter("cw_jxkkbl_fgsbh");
	if (cw_jxkkbl_fgsbh!=null)
	{
		cw_jxkkbl_fgsbh=cf.GB2Uni(cw_jxkkbl_fgsbh);
		if (!(cw_jxkkbl_fgsbh.equals("")))	wheresql+=" and  (cw_jxkkbl.fgsbh='"+cw_jxkkbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_jxkkbl.xuhao,cw_jxkkbl.mc,cw_jxkkbl.qd||'%',cw_jxkkbl.zd||'%',cw_jxkkbl.bfb||'%',sq_dwxx.dwmc  ";
	ls_sql+=" FROM cw_jxkkbl,sq_dwxx  ";
    ls_sql+=" where cw_jxkkbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jxkkbl.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jxkkblList.jsp","SelectCw_jxkkbl.jsp","","EditCw_jxkkbl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","cw_jxkkbl_mc","cw_jxkkbl_qd","cw_jxkkbl_zd","cw_jxkkbl_bfb","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_jxkkblList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] xuhao = request.getParameterValues("xuhao");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xuhao,"xuhao"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_jxkkbl where "+chooseitem;
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
	<td  width="10%">序号</td>
	<td  width="35%">名称</td>
	<td  width="10%">起点百分比（>=）</td>
	<td  width="10%">终点百分比（<）</td>
	<td  width="10%">处罚百分比</td>
	<td  width="15%">分公司</td>
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