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
	String cw_kzbjbl_xuhao=null;
	String cw_kzbjbl_mc=null;
	String cw_kzbjbl_qd=null;
	String cw_kzbjbl_zd=null;
	String cw_kzbjbl_bfb=null;
	String cw_kzbjbl_fgsbh=null;
	cw_kzbjbl_xuhao=request.getParameter("cw_kzbjbl_xuhao");
	if (cw_kzbjbl_xuhao!=null)
	{
		cw_kzbjbl_xuhao=cw_kzbjbl_xuhao.trim();
		if (!(cw_kzbjbl_xuhao.equals("")))	wheresql+=" and (cw_kzbjbl.xuhao="+cw_kzbjbl_xuhao+") ";
	}
	cw_kzbjbl_mc=request.getParameter("cw_kzbjbl_mc");
	if (cw_kzbjbl_mc!=null)
	{
		cw_kzbjbl_mc=cf.GB2Uni(cw_kzbjbl_mc);
		if (!(cw_kzbjbl_mc.equals("")))	wheresql+=" and  (cw_kzbjbl.mc='"+cw_kzbjbl_mc+"')";
	}
	cw_kzbjbl_qd=request.getParameter("cw_kzbjbl_qd");
	if (cw_kzbjbl_qd!=null)
	{
		cw_kzbjbl_qd=cw_kzbjbl_qd.trim();
		if (!(cw_kzbjbl_qd.equals("")))	wheresql+=" and  (cw_kzbjbl.qd="+cw_kzbjbl_qd+") ";
	}
	cw_kzbjbl_zd=request.getParameter("cw_kzbjbl_zd");
	if (cw_kzbjbl_zd!=null)
	{
		cw_kzbjbl_zd=cw_kzbjbl_zd.trim();
		if (!(cw_kzbjbl_zd.equals("")))	wheresql+=" and  (cw_kzbjbl.zd="+cw_kzbjbl_zd+") ";
	}
	cw_kzbjbl_bfb=request.getParameter("cw_kzbjbl_bfb");
	if (cw_kzbjbl_bfb!=null)
	{
		cw_kzbjbl_bfb=cw_kzbjbl_bfb.trim();
		if (!(cw_kzbjbl_bfb.equals("")))	wheresql+=" and  (cw_kzbjbl.bfb="+cw_kzbjbl_bfb+") ";
	}
	cw_kzbjbl_fgsbh=request.getParameter("cw_kzbjbl_fgsbh");
	if (cw_kzbjbl_fgsbh!=null)
	{
		cw_kzbjbl_fgsbh=cf.GB2Uni(cw_kzbjbl_fgsbh);
		if (!(cw_kzbjbl_fgsbh.equals("")))	wheresql+=" and  (cw_kzbjbl.fgsbh='"+cw_kzbjbl_fgsbh+"')";
	}
	ls_sql="SELECT cw_kzbjbl.xuhao,cw_kzbjbl.mc,cw_kzbjbl.qd,cw_kzbjbl.zd,cw_kzbjbl.bfb||'%',sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,cw_kzbjbl  ";
    ls_sql+=" where cw_kzbjbl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_kzbjbl.fgsbh,cw_kzbjbl.xuhao";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_kzbjblCxList.jsp","SelectCxCw_kzbjbl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xuhao","cw_kzbjbl_mc","cw_kzbjbl_qd","cw_kzbjbl_zd","cw_kzbjbl_bfb","sq_dwxx_dwmc"};
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
	<td  width="6%">序号</td>
	<td  width="25%">名称</td>
	<td  width="15%">起点金额（>=）</td>
	<td  width="15%">终点金额（<）</td>
	<td  width="8%">扣除百分比</td>
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