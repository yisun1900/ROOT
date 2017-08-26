<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>业绩考核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String khzq=cf.GB2Uni(request.getParameter("khzq"));
	String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String dwbh=null;
String dwmc=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;

String olddwmc="";

String bgcolor="";

int rownum=0;

try {
	conn=cf.getConnection();

	String khqssj=null;
	String khjzsj=null;
	ls_sql="select khqssj,khjzsj ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=cf.fillNull(rs.getDate("khqssj"));
		khjzsj=cf.fillNull(rs.getDate("khjzsj"));
	}
	rs.close();
	ps.close();
%>

<form method="post" action="" name="editform" target="_blank">
<center> 部门业绩考核（周期:<%=khqssj%>到<%=khjzsj%>）</center>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"> 
  <td colspan="13" > 
	<div align="center"> 
	  <input type="button"  value="保存" onClick="f_do(editform)"  >
	</div>
  </td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="5%">部门编号</td>
	<td  width="10%">部门名称</td>
	<td  width="5%">公司订金数计划</td>
	<td  width="9%">公司设计费计划</td>
	<td  width="9%">公司个性化计划</td>
	<td  width="9%">公司套餐计划</td>
	<td  width="9%">公司主材计划</td>
	<td  width="5%">集团订金数计划</td>
	<td  width="9%">集团设计费计划</td>
	<td  width="9%">集团个性化计划</td>
	<td  width="9%">集团套餐计划</td>
	<td  width="9%">集团主材计划</td>
</tr>

<%


	int row=0;

	ls_sql="SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx  ";
    ls_sql+=" where ssfgs='"+fgsbh+"' and dwlx='F2'";
    ls_sql+=" order  by sq_dwxx.dwbh";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));

		rownum++;

		int djsjh=0;
		double sjfjh=0;
		double gxhjh=0;
		double tcjh=0;
		double zcjh=0;
		double zjh=0;
		int jtdjsjh=0;
		double jtsjfjh=0;
		double jtgxhjh=0;
		double jttcjh=0;
		double jtzcjh=0;
		double jtzjh=0;
		ls_sql="select djsjh,sjfjh,gxhjh,tcjh,zcjh,zjh ";
		ls_sql+=" ,jtdjsjh,jtsjfjh,jtgxhjh,jttcjh,jtzcjh,jtzjh ";
		ls_sql+=" from  cw_jrbmyjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			djsjh=rs1.getInt("djsjh");
			sjfjh=rs1.getDouble("sjfjh");
			gxhjh=rs1.getDouble("gxhjh");
			tcjh=rs1.getDouble("tcjh");
			zcjh=rs1.getDouble("zcjh");
			zjh=rs1.getDouble("zjh");
			jtdjsjh=rs1.getInt("jtdjsjh");
			jtsjfjh=rs1.getDouble("jtsjfjh");
			jtgxhjh=rs1.getDouble("jtgxhjh");
			jttcjh=rs1.getDouble("jttcjh");
			jtzcjh=rs1.getDouble("jtzcjh");
			jtzjh=rs1.getDouble("jtzjh");
		}
		rs1.close();
		ps1.close();

		
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td><%=(row+1)%></td>
			<td><%=dwbh%>
				<input type="hidden" name="dwbh"  value="<%=dwbh%>" >
			</td>
			<td><%=dwmc%>
			</td>
			<td>
				<input type="text" name="djsjh" value="<%=djsjh%>" size="5" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="sjfjh" value="<%=sjfjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="gxhjh" value="<%=gxhjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="tcjh" value="<%=tcjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="zcjh" value="<%=zcjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>

			<td>
				<input type="text" name="jtdjsjh" value="<%=jtdjsjh%>" size="5" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="jtsjfjh" value="<%=jtsjfjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="jtgxhjh" value="<%=jtgxhjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="jttcjh" value="<%=jttcjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td>
				<input type="text" name="jtzcjh" value="<%=jtzcjh%>" size="10" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr bgcolor="#CCCCCC"> 
  <td colspan="13" > 
	<div align="center"> 
		<input type="hidden" name="khzq"  value="<%=khzq%>" >
		<input type="hidden" name="fgsbh"  value="<%=fgsbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
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

	FormName.action="SaveChooseDwbh.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


