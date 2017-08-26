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
	String zwbm=cf.GB2Uni(request.getParameter("zwbm"));

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
<center>业绩考核（周期:<%=khqssj%>到<%=khjzsj%>）</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"> 
  <td colspan="9" > 
	<div align="center"> 
	  <input type="button"  value="保存" onClick="f_do(editform)"  >
	</div>
  </td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="15%">部门名称</td>
	<td  width="10%">员工序号</td>
	<td  width="10%">工号</td>
	<td  width="10%">姓名</td>
	<td  width="12%">职务</td>
	<td  width="24%">本月任务</td>
</tr>

<%


	int row=0;

	ls_sql="SELECT sq_yhxx.dwbh,sq_dwxx.dwmc,sq_yhxx.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,xzzwbm";
	ls_sql+=" FROM sq_yhxx,sq_dwxx  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.sfzszg not in('S','T')";
	ls_sql+=" and (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')) ";
    ls_sql+=" and sq_yhxx.ssfgs='"+fgsbh+"'";
    ls_sql+=" and sq_yhxx.zwbm='"+zwbm+"'";
    ls_sql+=" order  by sq_dwxx.ssfgs,sq_dwxx.dwbh,sq_yhxx.yhmc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		if (rownum>5000)
		{
			out.println("错误！结果不能大于5000行");
			return;
		}

		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillHtml(rs.getString("bianhao"));
		yhmc=cf.fillHtml(rs.getString("yhmc"));
		xzzwbm=cf.fillHtml(rs.getString("xzzwbm"));

		double byrw=0;
		String byrwStr="";
		ls_sql="select byrw ";
		ls_sql+=" from  cw_jryjkh";
		ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+yhmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			byrw=rs1.getDouble("byrw");
		}
		rs1.close();
		ps1.close();

		if (byrw!=0)
		{
			byrwStr=byrw+"";
		}

		
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
			<td><%=dwmc%>
				<input type="hidden" name="ygbh"  value="<%=ygbh%>" >
				<input type="hidden" name="bianhao"  value="<%=bianhao%>" >
			</td>
			<td><%=ygbh%></td>
			<td><%=bianhao%></td>
			<td><%=yhmc%></td>
			<td><%=xzzwbm%></td>
			<td>
				<input type="text" name="byrw" value="<%=byrwStr%>" size="20" maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
	

%>
<tr bgcolor="#CCCCCC"> 
  <td colspan="9" > 
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

	FormName.action="SaveChooseYhmc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


