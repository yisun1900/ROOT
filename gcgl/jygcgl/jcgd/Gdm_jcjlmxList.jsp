<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String jcjlh=request.getParameter("jcjlh");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">监察记录明细（监察记录号：<%=jcjlh%>）</font></B>
</CENTER>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">项目大类</td>
	<td  width="8%">项目小类</td>
	<td  width="5%">项目编码</td>
	<td  width="15%">项目名称</td>
	<td  width="5%">违规级别</td>
	<td  width="5%">整改要求</td>
	<td  width="5%">处罚人员职务</td>
	<td  width="5%">处罚人员名称</td>
	<td  width="5%">员工扣分</td>
	<td  width="5%">员工罚款金额</td>
	<td  width="5%">施工队扣分</td>
	<td  width="5%">施工队罚款金额</td>
	<td  width="5%">违章次数</td>
	<td  width="85%">备注</td>
</tr>
<%
	ls_sql="SELECT xmdlmc,xmxlmc,xmbm,xmmc,wgjbmc,zgyq,xzzwbm,yhmc,ygkf,ygfkje,sgdkf,sgdfkje,wzcs,bz  ";
	ls_sql+=" FROM gdm_jcjlmx  ";
    ls_sql+=" where gdm_jcjlmx.jcjlh='"+jcjlh+"'";
    ls_sql+=" order by xmdlbm,xmxlbm,xmbm ";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","DeleteGdm_jcjlmx.jsp?jcjlh="+jcjlh,"EditGdm_jcjlmx.jsp?jcjlh="+jcjlh);
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName={"xmbm"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("删除");

	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDateSum();
%> 
</table>
</body>
</html>