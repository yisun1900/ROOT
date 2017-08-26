<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String sjd=null;
String gzdwbm=null;
String drzw=null;
String dwdh=null;
String zmr=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wheresjd=cf.getParameter(request,"sjd");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,sjd,gzdwbm,drzw,dwdh,zmr ";
	ls_sql+=" from  rs_gzjl";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (sjd='"+wheresjd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		sjd=cf.fillNull(rs.getString("sjd"));
		gzdwbm=cf.fillNull(rs.getString("gzdwbm"));
		drzw=cf.fillNull(rs.getString("drzw"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		zmr=cf.fillNull(rs.getString("zmr"));
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改工作经历</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_gzjl.jsp" name="editform">
<div align="center">修改工作经历</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#000ff">员工序号</font></td>
      <td width="35%"> 
        <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">时间段</td>
      <td colspan="3"> 
        <input type="text" name="sjd" size="50" maxlength="50"  value="<%=sjd%>" >
        <font color="#FF0000">（可用任何方式表示时间段）</font> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">工作单位何部门</td>
      <td colspan="3">
        <input type="text" name="gzdwbm" size="73" maxlength="100"  value="<%=gzdwbm%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">担任职务</td>
      <td width="35%">
        <input type="text" name="drzw" size="20" maxlength="50"  value="<%=drzw%>" >
      </td>
      <td align="right" width="15%">证明人</td>
      <td width="35%">
        <input type="text" name="zmr" size="20" maxlength="20"  value="<%=zmr%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">单位电话</td>
      <td width="35%"> 
        <input type="text" name="dwdh" size="20" maxlength="50"  value="<%=dwdh%>" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
    <input type="hidden" name="wheresjd"  value="<%=wheresjd%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.sjd)=="") {
		alert("请输入[时间段]！");
		FormName.sjd.focus();
		return false;
	}
	if(	javaTrim(FormName.gzdwbm)=="") {
		alert("请输入[工作单位何部门]！");
		FormName.gzdwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.drzw)=="") {
		alert("请输入[担任职务]！");
		FormName.drzw.focus();
		return false;
	}
	if(	javaTrim(FormName.dwdh)=="") {
		alert("请输入[单位电话]！");
		FormName.dwdh.focus();
		return false;
	}
	if(	javaTrim(FormName.zmr)=="") {
		alert("请输入[证明人]！");
		FormName.zmr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
