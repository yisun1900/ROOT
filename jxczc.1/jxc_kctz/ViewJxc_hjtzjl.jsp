<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tzph=null;
String dqbm=null;
String ckbh=null;
String tzr=null;
String tzrq=null;
String ssfgs=null;
String ssbm=null;
String bz=null;
String wheretzph=null;
wheretzph=cf.GB2Uni(request.getParameter("tzph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="SELECT tzph,dqmc dqbm,ckmc ckbh,tzr,tzrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_hjtzjl.bz bz  ";
	ls_sql+=" FROM jxc_hjtzjl,jxc_ckmc,sq_dwxx a,sq_dwxx b,dm_dqbm ";
    ls_sql+=" where jxc_hjtzjl.ckbh=jxc_ckmc.ckbh and jxc_hjtzjl.ssfgs=a.dwbh and jxc_hjtzjl.ssbm=b.dwbh and jxc_hjtzjl.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and  (tzph="+wheretzph+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tzph=cf.fillNull(rs.getString("tzph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		tzr=cf.fillNull(rs.getString("tzr"));
		tzrq=cf.fillNull(rs.getDate("tzrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
    调整批号
  </td>
  <td width="35%"> 
    <%=tzph%>
  </td>
  <td align="right" width="15%"> 
    地区编码
  </td>
  <td width="35%"> 
    <%=dqbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    仓库编号
  </td>
  <td width="35%"> 
    <%=ckbh%>
  </td>
  <td align="right" width="15%"> 
    调整人
  </td>
  <td width="35%"> 
    <%=tzr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    调整日期
  </td>
  <td width="35%"> 
    <%=tzrq%>
  </td>
  <td align="right" width="15%"> 
    所属分公司
  </td>
  <td width="35%"> 
    <%=ssfgs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    所属部门
  </td>
  <td width="35%"> 
    <%=ssbm%>
  </td>
  <td align="right" width="15%"> 
    备注
  </td>
  <td width="35%"> 
    <%=bz%>
  </td>
</tr>
</table>
<%
	String ls_sql2=null;
	String wheresql2=cf.GB2Uni(request.getParameter("tzph"));
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql2="SELECT tzxh,clbm,DECODE(zljb,'1','<font color=green>正常品</font>','2','<font color=blue>残次品</font>','3','<font color=red>报废品</font>'),tzsl,'从（['||hja.hjmc||'] 的 ['||hwa.hwmc||']）调整到（['||hjb.hjmc||'] 的 ['||hwb.hwmc||']）'  ";
	ls_sql2+=" FROM jxc_hjtzmx,jxc_hjmc hja,jxc_hjmc hjb,jxc_hwmc hwa,jxc_hwmc hwb ";
	ls_sql2+=" where jxc_hjtzmx.dchj=hja.hjbh and jxc_hjtzmx.dchw=hwa.hwbh and jxc_hjtzmx.drhj=hjb.hjbh and jxc_hjtzmx.drhw=hwb.hwbh";
    ls_sql2+=" and tzph='"+wheresql2+"'";
    pageObj.sql=ls_sql2;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400000);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
&nbsp;<br>
 调整明细
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">序号</td>
	<td  width="11%">材料编码</td>
	<td  width="11%">质量级别</td>
	<td  width="11%">调整数量</td>
	<td  width="55%">调整轨迹</td>

</tr>
<%
	pageObj.printDateSum();
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
</html>
