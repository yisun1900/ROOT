<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="pageObject" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String) session.getAttribute("dwbh");

	String ls_sql=null;
	ls_sql="SELECT thjlh,cpbm,thdw,thj,DECODE(thbz,0,'本店',1,'异店'),thrq,czy ";
	ls_sql+=" FROM dm_thjl  ";
    ls_sql+=" WHERE shbz='1' and xsdw='"+dwbh+"'";
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("","","ydthrk.jsp","");
/*
//设置显示列
	String[] disColName={"thjlh","cpbm","thdw","thj","thbz","thrq","czy"};
	pageObject.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"thjlh","cpbm"};
	pageObject.setKey(keyName);
	pageObject.setPageRow(10000);
	pageObject.setViewStr("入库");
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObject.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObject.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
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
	pageObject.out=out;
	pageObject.getDate(1);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%" height="2">&nbsp;</td>
		<td  width="12%" height="2">退货记录号</td>
		<td  width="12%" height="2">产品编码</td>
		<td  width="16%" height="2">退货单位</td>
		<td  width="12%" height="2">退货金额</td>
		<td  width="12%" height="2">异店退货</td>
		<td  width="12%" height="2">退货日期</td>
		<td  width="12%" height="2">操作员</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>