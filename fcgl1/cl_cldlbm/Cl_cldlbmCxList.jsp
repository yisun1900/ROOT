<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String cldlbm=null;
	String cldlmc=null;
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (cldlbm='"+cldlbm+"')";
	}
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cldlmc='"+cldlmc+"')";
	}
	ls_sql="SELECT cldlbm,cldlmc,qybfb||'%'  ";
	ls_sql+=" FROM cl_cldlbm  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"cldlbm","cldlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cldlbm"};
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
	<td  width="20%">材料大类编码</td>
	<td  width="50%">材料大类名称</td>
	<td  width="20%">签约额百分比</td>
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