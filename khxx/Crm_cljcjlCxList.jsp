<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT crm_khxx.khxm,crm_cljcjl.ysjlh,crm_cljcjl.yssj,crm_cljcjl.ysr,crm_cljcjl.lrr,crm_cljcjl.lrsj,sq_dwxx.dwmc,crm_cljcjl.bz";
	ls_sql+=" FROM crm_cljcjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_cljcjl.lrdw=sq_dwxx.dwbh and crm_cljcjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_cljcjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_cljcjl.ysjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置主键
	String[] keyName={"ysjlh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/cljc/ViewCrm_cljcjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料进场记录</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户姓名</td>
	<td  width="5%">验收记录号</td>
	<td  width="7%">验收时间</td>
	<td  width="5%">验收人</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="11%">录入单位</td>
	<td  width="21%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>