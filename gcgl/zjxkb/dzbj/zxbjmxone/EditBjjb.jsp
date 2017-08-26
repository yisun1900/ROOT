<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//电子报价中级名称
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//电子报价中高级名称
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//电子报价高级名称

String sqbjjb=(String)session.getAttribute("bjjb");

String xh=null;
String wybh=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double dj=0;
double abj=0;
double bbj=0;
double cbj=0;
String gycl=null;
String bjlx=null;
String bjjb=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>


<html>
<head>
<title>调整报价级别</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBjjb.jsp" name="editform" >
  <div align="center">调整报价级别（<b><font color="#0000CC">可按单项调报价级别</font></b>）</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
		<td width="5%">序号</td>
		<td width="23%">报价级别</td>
		<td width="10%">项目编号</td>
		<td width="29%">项目名称</td>
		<td width="5%">计量单位</td>
		<td width="7%">目前单价</td>
<%
	if (sqbjjb==null)
	{
		%>
		<td width="7%"><%=dzbjzjmc%>单价</td>
		<%
	}
	else if (sqbjjb.equals("A"))
	{
		%>
		<td width="7%"><%=dzbjzjmc%>单价</td>
		<%
	}
	else if (sqbjjb.equals("B"))
	{
		%>
		<td width="7%"><%=dzbjzjmc%>单价</td>
		<td width="7%"><%=dzbjzgjmc%>单价</td>
		<%
	}
	else if (sqbjjb.equals("C"))
	{
		%>
		<td width="7%"><%=dzbjgjmc%>单价</td>
		<%
	}
	else if (sqbjjb.equals("D"))
	{
		%>
		<td width="7%"><%=dzbjzjmc%>单价</td>
		<td width="7%"><%=dzbjzgjmc%>单价</td>
		<td width="7%"><%=dzbjgjmc%>单价</td>
		<%
	}
	else if (sqbjjb.equals("E"))
	{
		%>
		<td width="7%"><%=dzbjzgjmc%>单价</td>
		<td width="7%"><%=dzbjgjmc%>单价</td>
		<%
	}
	else
	{
		%>
		<td width="7%"><%=dzbjzjmc%>单价</td>
		<%
	}
%>
	</tr>
<%
	int row=0;
	String bgcolor=null;
	ls_sql="select bj_jzbjb.abj,bj_jzbjb.bbj,bj_jzbjb.cbj,bj_bjxmmx.xh,bj_bjxmmx.wybh,bj_bjxmmx.dqbm,bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,bj_bjxmmx.xmdlbm,bj_bjxmmx.xmxlbm,bj_bjxmmx.smbm,jldwmc,bj_bjxmmx.dj,DECODE(bj_bjxmmx.bjlx,'1','','2','增') bjlx,bj_bjxmmx.bjjb";
	ls_sql+=" from  bj_bjxmmx,jdm_jldwbm,bj_jzbjb";
	ls_sql+=" where  khbh='"+khbh+"' and bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_bjxmmx.wybh=bj_jzbjb.wybh";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		wybh=rs.getString("wybh");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));
		abj=rs.getDouble("abj");
		bbj=rs.getDouble("bbj");
		cbj=rs.getDouble("cbj");


		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=row%></td>
			<td>
<%
	if (bjlx.equals("增"))
	{
		out.println("自定义不能修改");
	}
	else{
		if (sqbjjb==null)
		{
			cf.radioToken(out, "bjjb"+wybh.trim(),"A+"+dzbjzjmc,bjjb);
		}
		else if (sqbjjb.equals("A"))
		{
			cf.radioToken(out, "bjjb"+wybh.trim(),"A+"+dzbjzjmc+"",bjjb);
		}
		else if (sqbjjb.equals("B"))
		{
			cf.radioToken(out,"bjjb"+wybh.trim(),"A+"+dzbjzjmc+"&B+"+dzbjzgjmc+"",bjjb);
		}
		else if (sqbjjb.equals("C"))
		{
			cf.radioToken(out,"bjjb"+wybh.trim(),"C+"+dzbjgjmc+"",bjjb);
		}
		else if (sqbjjb.equals("D"))
		{
			cf.radioToken(out,"bjjb"+wybh.trim(),"A+"+dzbjzjmc+"&B+"+dzbjzgjmc+"&C+"+dzbjgjmc+"",bjjb);
		}
		else if (sqbjjb.equals("E"))
		{
			cf.radioToken(out,"bjjb"+wybh.trim(),"B+"+dzbjzgjmc+"&C+"+dzbjgjmc+"",bjjb);
		}
		else
		{
			cf.radioToken(out,"bjjb"+wybh.trim(),"A+"+dzbjzjmc,bjjb);
		}
		%>
				<input name="wybh" type="hidden" value="<%=wybh%>">
				<input name="xmbh" type="hidden" value="<%=xmbh%>">
		<%
	}

%>
			</td>
			<td align="left"><%=xmbh+bjlx%></td>
			<td align="left"><%=xmmc%></td>
			<td><%=jldwbm%></td>
			<td><%=dj%></td>
<%
	if (sqbjjb==null)
	{
		%>
			<td><%=abj%></td>
		<%
	}
	else if (sqbjjb.equals("A"))
	{
		%>
			<td><%=abj%></td>
		<%
	}
	else if (sqbjjb.equals("B"))
	{
		%>
			<td><%=abj%></td>
			<td><%=bbj%></td>
		<%
	}
	else if (sqbjjb.equals("C"))
	{
		%>
			<td><%=cbj%></td>
		<%
	}
	else if (sqbjjb.equals("D"))
	{
		%>
			<td><%=abj%></td>
			<td><%=bbj%></td>
			<td><%=cbj%></td>
		<%
	}
	else if (sqbjjb.equals("E"))
	{
		%>
			<td><%=bbj%></td>
			<td><%=cbj%></td>
		<%
	}
	else
	{
		%>
			<td><%=abj%></td>
		<%
	}
%>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>
<tr> 
  <td colspan="9" > 
	<div align="center"> 
		<input type="hidden" name="khbh" value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
	  <input type="reset"  value="重输">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
