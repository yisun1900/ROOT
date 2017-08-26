<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqbh=null;
String zbye=null;
String zbzw=null;
String fgs=null;
String dwbh=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xb=null;
String hy=null;
String nl=null;
String xl=null;
String zy=null;
String wy=null;
String jsjjn=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String jhzt=null;
String ztbm=null;
String lrr=null;
String ssfgs=null;
String lrsj=null;
String bz=null;
String wheresqbh=null;
wheresqbh=cf.GB2Uni(request.getParameter("sqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select sqbh,zbye,dm_xzzwbm.xzzwmc zbzw,a.dwmc fgs,b.dwmc 	 dwbh,zbly,zbqt,xwdgsj,xb,hy,nl,xl,zy,wy,jsjjn,gzjy,gx,jn,qt,rygznr,DECODE(jhzt,'1','等待审批','2','审批流程中','3','招聘完成','4','审批未通过','5','修改计划','6','审核完成') jhzt,ztbm,lrr,c.dwmc ssfgs,lrsj,rs_ryzbsq.bz ";
	ls_sql+=" from  rs_ryzbsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,dm_xzzwbm";
	ls_sql+=" where a.dwbh=rs_ryzbsq.fgs and b.dwbh=rs_ryzbsq.dwbh and c.dwbh=rs_ryzbsq.ssfgs and dm_xzzwbm.xzzwbm=rs_ryzbsq.zbzw and  (sqbh='"+wheresqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqbh=cf.fillNull(rs.getString("sqbh"));
		zbye=cf.fillNull(rs.getString("zbye"));
		zbzw=cf.fillNull(rs.getString("zbzw"));
		fgs=cf.fillNull(rs.getString("fgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zbly=cf.fillNull(rs.getString("zbly"));
		zbqt=cf.fillNull(rs.getString("zbqt"));
		xwdgsj=cf.fillNull(rs.getDate("xwdgsj"));
		xb=cf.fillNull(rs.getString("xb"));
		hy=cf.fillNull(rs.getString("hy"));
		nl=cf.fillNull(rs.getString("nl"));
		xl=cf.fillNull(rs.getString("xl"));
		zy=cf.fillNull(rs.getString("zy"));
		wy=cf.fillNull(rs.getString("wy"));
		jsjjn=cf.fillNull(rs.getString("jsjjn"));
		gzjy=cf.fillNull(rs.getString("gzjy"));
		gx=cf.fillNull(rs.getString("gx"));
		jn=cf.fillNull(rs.getString("jn"));
		qt=cf.fillNull(rs.getString("qt"));
		rygznr=cf.fillNull(rs.getString("rygznr"));
		jhzt=cf.fillNull(rs.getString("jhzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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
<style type="text/css">
<!--
.STYLE4 {font-family: "仿宋_GB2312"}
.STYLE6 {font-family: "仿宋_GB2312"; color: #FF0000; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
  <h3><strong> 人员增补申请表</strong></h3>
</div>
<table width="75%" border="0" align="center">
  <tr>
    <td width="15%"><div align="right">申报公司: </div></td>
    <td width="35%"><span class="STYLE4"><%=fgs%></span></td>
	<td width="15%"><div align="right">填表时间:</div></td>
    <td width="35%"><span class="STYLE4"><%=lrsj%></span></td>
  </tr>
</table>

<table width="75%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#999999" style="FONT-SIZE:14">
<tr bgcolor="#FFFFFF">
  <td width="17%" align="right"> 申请部门 </td>
  <td width="17%"> 
    <%=dwbh%>
  </td>
    <td align="right" width="14%"> 
    增补职务  </td>
  <td width="16%"> 
    <%=zbzw%>
  </td>
  <td align="right" width="14%"> 
    增补员额  </td>
  <td width="22%"> 
    <%=zbye%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    增补理由
  </td>
  <td> 
<%
	cf.selectToken(out,"1+缺员补充&2+扩大编制&3+储备人力&4+其他",zbly,true);
%>
  </td>
    <td align="right"> 
    增补其他
  </td>
  <td colspan="3"> 
    <%=zbqt%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    希望到岗时间
  </td>
  <td> 
    <%=xwdgsj%>
  </td>
    <td align="right"> 
    申请状态
  </td>
  <td> 
    <%=jhzt%>
  </td>
  <td align="right"> 
    审核状态
  </td>
  <td> 
    <%=ztbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    性别
  </td>
  <td> 
<%
	cf.selectToken(out,"0+不限制&1+男&2+女",xb,true);
%>
  </td>
    <td align="right"> 
    年龄
  </td>
  <td> 
    <%=nl%>
  </td>
    <td rowspan="5" align="right"> 
    <CENTER>补充<br>人员<br>
	工作<br>内容</CENTER>  </td>
  <td rowspan="5"> 
    <%=rygznr%>
  </td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 
    婚姻
  </td>
  <td> 
<%
	cf.selectToken(out,"0+不限制&1+已婚&2+未婚",hy,true);
%>
  </td>
    <td align="right"> 
    学历
  </td>
  <td> 
<%
	cf.selectToken(out,"0+高中&1+大专&2+大学&3+硕士",xl,true);
%>
  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    专业
  </td>
  <td> 
    <%=zy%>
  </td>
  <td align="right"> 
    外语
  </td>
  <td> 
    <%=wy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    计算机技能
  </td>
  <td> 
    <%=jsjjn%>
  </td>
  <td align="right"> 
    工作经验
  </td>
  <td> 
    <%=gzjy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    个性
  </td>
  <td> 
    <%=gx%>
  </td>
  <td align="right"> 
    技能
  </td>
  <td> 
    <%=jn%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    其他
  </td>
  <td> 
    <%=qt%>
  </td>
  <td align="right"> 
    录入人
  </td>
  <td> 
    <%=lrr%>
  </td>
    <td align="right"> 
    录入人分公司
  </td>
  <td> 
    <%=ssfgs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    备注
  </td>
  <td colspan="5"> 
    <%=bz%>
  </td>
</tr>
</table>
<table width="75%" border="0" align="center">
  <tr>
    <td align="right" width="15%"><span class="STYLE6">申请编号：</span><%=sqbh%></td>
  </tr>
</table>

</body>
</html>
