<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String gcjdbm=request.getParameter("gcjdbm");


	ls_sql="SELECT crm_khxx.khxm,crm_gcyszxmjl.ysjlh,dm_gcyszxmbm.gcyszxmmc, DECODE(crm_gcyszxmjl.gcjdbm,'3','隐蔽工程验收','4','中期验收'),crm_gcyszxmjl.yssj,crm_gcyszxmjl.ysr,crm_gcyszxmjl.lrr,crm_gcyszxmjl.lrsj,dwmc,crm_gcyszxmjl.bz ";
	ls_sql+=" FROM crm_gcyszxmjl,crm_khxx,dm_gcyszxmbm,sq_dwxx  ";
    ls_sql+=" where crm_gcyszxmjl.gcyszxmbm=dm_gcyszxmbm.gcyszxmbm and crm_gcyszxmjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_gcyszxmjl.lrdw=sq_dwxx.dwbh";
    ls_sql+=" and crm_gcyszxmjl.khbh='"+khbh+"' and crm_gcyszxmjl.gcjdbm='"+gcjdbm+"'";
    ls_sql+=" order by crm_gcyszxmjl.ysjlh";
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
	coluParm.link="/gcgl/gcjdgz/ViewCrm_gcyszxmjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">工程验收记录</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户姓名</td>
	<td  width="6%">验收记录号</td>
	<td  width="9%">验收子项目</td>
	<td  width="8%">验收分类</td>
	<td  width="7%">验收时间</td>
	<td  width="5%">验收人</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="8%">录入单位</td>
	<td  width="20%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>