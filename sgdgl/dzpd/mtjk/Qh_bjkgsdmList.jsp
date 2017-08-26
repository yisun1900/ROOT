<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dqbm=(String)session.getAttribute("dqbm");
%>
<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String qh_bjkgsdm_bjkgsbh=null;
	String qh_bjkgsdm_bjkgsmc=null;
	qh_bjkgsdm_bjkgsbh=request.getParameter("qh_bjkgsdm_bjkgsbh");
	if (qh_bjkgsdm_bjkgsbh!=null)
	{
		qh_bjkgsdm_bjkgsbh=cf.GB2Uni(qh_bjkgsdm_bjkgsbh);
		if (!(qh_bjkgsdm_bjkgsbh.equals("")))	wheresql+=" and  (qh_bjkgsdm.bjkgsbh='"+qh_bjkgsdm_bjkgsbh+"')";
	}
	qh_bjkgsdm_bjkgsmc=request.getParameter("qh_bjkgsdm_bjkgsmc");
	if (qh_bjkgsdm_bjkgsmc!=null)
	{
		qh_bjkgsdm_bjkgsmc=cf.GB2Uni(qh_bjkgsdm_bjkgsmc);
		if (!(qh_bjkgsdm_bjkgsmc.equals("")))	wheresql+=" and  (qh_bjkgsdm.bjkgsmc='"+qh_bjkgsdm_bjkgsmc+"')";
	}
	ls_sql="SELECT qh_bjkgsdm.bjkgsbh as bjkgsbh,qh_bjkgsdm.bjkgsmc as qh_bjkgsdm_bjkgsmc,dm_dqbm.dqmc ";
	ls_sql+=" FROM qh_bjkgsdm ,dm_dqbm ";
    ls_sql+=" where qh_bjkgsdm.dqbm=dm_dqbm.dqbm and (dm_dqbm.dqbm='"+dqbm+"')";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditQh_bjkgsdm.jsp");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"bjkgsbh","qh_bjkgsdm_bjkgsmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bjkgsbh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="20%">被监控公司编号</td>
	<td  width="30%">被监控公司名称</td>
	<td  width="20%">地区</td>
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