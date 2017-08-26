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
	String cw_zxjlbl_xuhao=null;
	String cw_zxjlbl_mc=null;
	String cw_zxjlbl_qd=null;
	String cw_zxjlbl_zd=null;
	String cw_zxjlbl_bfb=null;
	String cw_zxjlbl_fgsbh=null;
	cw_zxjlbl_xuhao=request.getParameter("cw_zxjlbl_xuhao");
	if (cw_zxjlbl_xuhao!=null)
	{
		cw_zxjlbl_xuhao=cw_zxjlbl_xuhao.trim();
		if (!(cw_zxjlbl_xuhao.equals("")))	wheresql+=" and (cw_zxjlbl.xuhao="+cw_zxjlbl_xuhao+") ";
	}
	cw_zxjlbl_mc=request.getParameter("cw_zxjlbl_mc");
	if (cw_zxjlbl_mc!=null)
	{
		cw_zxjlbl_mc=cf.GB2Uni(cw_zxjlbl_mc);
		if (!(cw_zxjlbl_mc.equals("")))	wheresql+=" and  (cw_zxjlbl.mc='"+cw_zxjlbl_mc+"')";
	}
	cw_zxjlbl_qd=request.getParameter("cw_zxjlbl_qd");
	if (cw_zxjlbl_qd!=null)
	{
		cw_zxjlbl_qd=cw_zxjlbl_qd.trim();
		if (!(cw_zxjlbl_qd.equals("")))	wheresql+=" and  (cw_zxjlbl.qd="+cw_zxjlbl_qd+") ";
	}
	cw_zxjlbl_zd=request.getParameter("cw_zxjlbl_zd");
	if (cw_zxjlbl_zd!=null)
	{
		cw_zxjlbl_zd=cw_zxjlbl_zd.trim();
		if (!(cw_zxjlbl_zd.equals("")))	wheresql+=" and  (cw_zxjlbl.zd="+cw_zxjlbl_zd+") ";
	}
	cw_zxjlbl_bfb=request.getParameter("cw_zxjlbl_bfb");
	if (cw_zxjlbl_bfb!=null)
	{
		cw_zxjlbl_bfb=cw_zxjlbl_bfb.trim();
		if (!(cw_zxjlbl_bfb.equals("")))	wheresql+=" and  (cw_zxjlbl.bfb="+cw_zxjlbl_bfb+") ";
	}
	cw_zxjlbl_fgsbh=request.getParameter("cw_zxjlbl_fgsbh");
	if (cw_zxjlbl_fgsbh!=null)
	{
		cw_zxjlbl_fgsbh=cf.GB2Uni(cw_zxjlbl_fgsbh);
		if (!(cw_zxjlbl_fgsbh.equals("")))	wheresql+=" and  (cw_zxjlbl.fgsbh='"+cw_zxjlbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_zxjlbl.xuhao,cw_zxjlbl.mc,cw_zxjlbl.qd||'%',cw_zxjlbl.zd||'%',cw_zxjlbl.bfb||'%',sq_dwxx.dwmc  ";
	ls_sql+=" FROM cw_zxjlbl,sq_dwxx  ";
    ls_sql+=" where cw_zxjlbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zxjlbl.fgsbh,cw_zxjlbl.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_zxjlblCxList.jsp","SelectCxCw_zxjlbl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","cw_zxjlbl_mc","cw_zxjlbl_qd","cw_zxjlbl_zd","cw_zxjlbl_bfb","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xuhao"};
	pageObj.setKey(keyName);
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
	<td  width="10%">序号</td>
	<td  width="35%">名称</td>
	<td  width="10%">起点百分比（>=）</td>
	<td  width="10%">终点百分比（<）</td>
	<td  width="10%">奖励百分比</td>
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