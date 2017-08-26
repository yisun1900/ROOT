<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String lx=cf.GB2Uni(request.getParameter("lx"));
	String khbh=cf.GB2Uni(request.getParameter("khbh"));
	String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
	String tcmc=cf.getParameter(request,"tcmc");

	String ls_sql=null;
	ls_sql="SELECT bj_khcltcfjsl.jgwzbm,bj_khcltcfjsl.bzsl,bj_khcltcfjsl.sl,'选择' xz,'录入' lr ";
	ls_sql+=" FROM bj_khcltcfjsl  ";
    ls_sql+=" where bj_khcltcfjsl.khbh='"+khbh+"'";
    ls_sql+=" and bj_khcltcfjsl.tcmc='"+tcmc+"'";
    ls_sql+=" order by bj_khcltcfjsl.jgwzbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jgwzbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="SelectCxBj_cltczcmx.jsp?khbh="+khbh+"&dqbm="+dqbm+"&tcmc="+tcmc+"&lx="+lx;//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"jgwzbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="Bj_khcltczcmxList.jsp?khbh="+khbh+"&dqbm="+dqbm+"&tcmc="+tcmc+"&lx="+lx;//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("lr",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


%>

<html>
<head>
<title>窗帘套餐房间数量</title>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">房间位置</td>
	<td  width="9%">标准数量</td>
	<td  width="9%">实际数量</td>
	<td  width="9%">选择型号</td>
	<td  width="9%">录入数量</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
</html>