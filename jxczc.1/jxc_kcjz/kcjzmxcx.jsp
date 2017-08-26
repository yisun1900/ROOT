<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jzph=null;
String ckbh=null;
String zcpzsl=null;
String zcpzjg=null;
String ccpzsl=null;
String ccpzje=null;
String bfpzsl=null;
String bfpzje=null;
String jzrq=null;
String wherejzph=null;
wherejzph=cf.GB2Uni(request.getParameter("jzph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jzph,ckmc ckbh,zcpzsl,zcpzjg,ccpzsl,ccpzje,bfpzsl,bfpzje,jzrq ";
	ls_sql+=" from  jxc_kcjz,jxc_ckmc";
	ls_sql+=" where jxc_kcjz.ckbh=jxc_ckmc.ckbh and  (jzph='"+wherejzph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jzph=cf.fillNull(rs.getString("jzph"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		zcpzsl=cf.fillNull(rs.getString("zcpzsl"));
		zcpzjg=cf.fillNull(rs.getString("zcpzjg"));
		ccpzsl=cf.fillNull(rs.getString("ccpzsl"));
		ccpzje=cf.fillNull(rs.getString("ccpzje"));
		bfpzsl=cf.fillNull(rs.getString("bfpzsl"));
		bfpzje=cf.fillNull(rs.getString("bfpzje"));
		jzrq=cf.fillNull(rs.getDate("jzrq"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    结转批号
  </td>
  <td width="35%"> 
    <%=jzph%>
  </td>
  <td align="right" width="15%"> 
    仓库名称
  </td>
  <td width="35%"> 
    <%=ckbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    正常品总数量
  </td>
  <td width="35%"> 
    <%=zcpzsl%>
  </td>
  <td align="right" width="15%"> 
    正常品总金额
  </td>
  <td width="35%"> 
    <%=zcpzjg%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    残次品总数量
  </td>
  <td width="35%"> 
    <%=ccpzsl%>
  </td>
  <td align="right" width="15%"> 
    残次品总金额
  </td>
  <td width="35%"> 
    <%=ccpzje%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    报废品总数量
  </td>
  <td width="35%"> 
    <%=bfpzsl%>
  </td>
  <td align="right" width="15%"> 
    报废品总金额
  </td>
  <td width="35%"> 
    <%=bfpzje%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    结转日期
  </td>
  <td width="35%"> 
    <%=jzrq%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
</table>
</body>
</html>


<%
	String ls_sqlq=null;
	String wheresqljzph=cf.GB2Uni(request.getParameter("jzph"));
	ls_sqlq="SELECT jxc_kcjzmx.jzph jzph,jxc_kcjzmx.clbm clbm,DECODE(jxc_kcjzmx.zljb,'1','正常品','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>') zljb,jxc_kcjzmx.zsl,jxc_kcjzmx.zjg  ";
	ls_sqlq+=" FROM jxc_kcjzmx  ";
    ls_sqlq+=" where jxc_kcjzmx.jzph='"+wheresqljzph+"'";
	ls_sqlq+=" order by clbm ";
    pageObj.sql=ls_sqlq;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(4000000);
/*
//设置显示列
	String[] disColName={"jzph","clbm","zljb","jxc_kcjzmx_zsl","jxc_kcjzmx_zjg"};
	pageObj.setDisColName(disColName);
*/

//设置主键
//	String[] keyName={"jzph","clbm","zljb"};
//	pageObj.setKey(keyName);
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jzph","1");//列参数对象加入Hash表
	spanColHash.put("clbm","1");//列参数对象加入Hash表	
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
&nbsp;<br>
<CENTER >
详细信息
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">结转批号</td>
	<td  width="20%">材料编码</td>
	<td  width="20%">质量级别</td>
	<td  width="20%">总数量</td>
	<td  width="20%">总金额</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printSum();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table width="100%" border="0">
  <tr>
    <td width="33%"><font size="-1"><b>制表：</b></font></td>
    <td width="33%"><font size="-1"><b>审核：</b></font></td>
    <td width="33%"><font size="-1"><b>财务：</b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font size="-1"><b>备注：</b></font></td>
	<td colspan="2" align="right"><font size="-1"><%=cf.today("YYYY-MM-DD")%></font></td>
  </tr>
</table>