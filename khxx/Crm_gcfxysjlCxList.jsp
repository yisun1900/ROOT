<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>验收记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
%>

<body bgcolor="#FFFFFF">
<div align="center">验收记录(客户编号：<%=khbh%>）</div>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">验收记录号</td>
	<td  width="5%">照片数</td>
	<td  width="24%">验收项目</td>
	<td  width="8%">验收时间</td>
	<td  width="6%">验收人</td>
	<td  width="6%">验收结果</td>
	<td  width="6%">发生整改</td>
	<td  width="26%">验收说明</td>
	<td  width="6%">客户签字</td>
	<td  width="6%">签字授权</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT crm_gcfxysjl.ysjlh,zpsl,gcysxmmc,crm_gcfxysjl.yssj,crm_gcfxysjl.ysr,DECODE(crm_gcfxysjl.ysjg,'1','合格','2','不合格'),DECODE(crm_gcfxysjl.sffszg,'1','是','2','否'),yssm,DECODE(crm_gcfxysjl.sfkhbrqz,'Y','是','N','否'), DECODE(crm_gcfxysjl.dqzysq,'Y','有','N','无授权') ";
	ls_sql+=" FROM crm_gcfxysjl  ";
    ls_sql+=" where crm_gcfxysjl.khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_gcfxysjl.ysjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/gcjdgz/fxys/ViewCrm_gcfxysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</body>
</html>

