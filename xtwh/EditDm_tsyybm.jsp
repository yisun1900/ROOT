<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwstr=cf.getItemData("select tsxlbm,tsxlmc,tslxbm from dm_tsxlbm order by tslxbm,tsxlbm");
%>
<%

String tsyybm=null;
String tsyymc=null;
String tslxbm=null;
String tsxlbm=null;
String zjkf=null;
String px=null;
String wheretsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsyybm,tsyymc,tslxbm,tsxlbm,px,zjkf ";
	ls_sql+=" from  dm_tsyybm";
	ls_sql+=" where  (tsyybm='"+wheretsyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsyybm=cf.fillNull(rs.getString("tsyybm"));
		tsyymc=cf.fillNull(rs.getString("tsyymc"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
		zjkf=cf.fillNull(rs.getString("zjkf"));
		px=cf.fillNull(rs.getString("px"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditDm_tsyybm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">投诉报修大类</div>
              </td>
              <td width="30%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(tslxbm,tsxlbm,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm",tslxbm);
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">投诉报修小类</div>
              </td>
              <td width="29%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="tsyybm.value=tsxlbm.value">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tslxbm='"+tslxbm+"' order by tsxlbm",tsxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">投诉报修原因编码</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tsyybm" size="20" maxlength="6"  value="<%=tsyybm%>" >
              </td>
              <td width="21%"> 
                <div align="right">投诉报修原因名称</div>
              </td>
              <td width="29%"> 
                <input type="text" name="tsyymc" size="20" maxlength="50"  value="<%=tsyymc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">质检扣分</div>
              </td>
              <td width="30%">
                <input type="text" name="zjkf" value="<%=zjkf%>" size="20" maxlength="8" >
              </td>
              <td width="21%"> 
                <div align="right">显示顺序</div>
              </td>
              <td width="29%">
                <input type="text" name="px" size="20" maxlength="8"  value="<%=px%>" >
              </td>
            </tr>
            <input type="hidden" name="wheretsyybm"  value="<%=wheretsyybm%>" >
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("请选择[投诉报修大类]！");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("请选择[投诉报修小类]！");
		FormName.tsxlbm.focus();
		return false;
	}
	if(FormName.tsyybm.value.length!=6) {
		alert("[投诉报修原因编码]应该为6位！");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("请输入[投诉报修原因编码]！");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyymc)=="") {
		alert("请输入[投诉报修原因名称]！");
		FormName.tsyymc.focus();
		return false;
	}
	if(	javaTrim(FormName.zjkf)=="") {
		alert("请输入[质检扣分]！");
		FormName.zjkf.focus();
		return false;
	}
	if(!(isNumber(FormName.zjkf, "质检扣分"))) {
		return false;
	}
	if(!(isNumber(FormName.px, "显示顺序"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
