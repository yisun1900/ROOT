<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sgbz=null;
String sjs=null;
String sgdmc=null;
String zjxm=null;
String mbbm=null;


String khbh=request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sgdmc,sjs,zjxm,sgbz,mbbm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		mbbm=cf.fillNull(rs.getString("mbbm"));
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
<title>修改施工进度模版</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditMbCrm_khxx.jsp" name="editform" >
<div align="center">修改施工进度模版</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#000099">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#000099">实开工日期</font> </td>
    <td width="32%"><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">联系方式</font></td>
    <td><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">房屋地址</font></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">设计师</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">施工队</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">质检姓名</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font>修改施工进度模版</td>
    <td><select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
      <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb order by mbbm",mbbm);
%>
    </select></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="button"  value="保存" onClick="f_do(editform)">
	<input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请输入[施工进度模版]！");
		FormName.mbbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
