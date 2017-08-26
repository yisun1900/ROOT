<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpxmbm=null;
String kpxmmc=null;
String kpdlbm=null;
String kpjg=null;
String kpjgdy=null;
String kpkfbm=null;
String sgdfk=null;
String kpcfbm=null;
String wherekpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
String wherekpjg=cf.GB2Uni(request.getParameter("kpjg"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpxmbm,kpxmmc,kpdlbm,kpjg,kpjgdy,kpkfbm,kpcfbm,sgdfk ";
	ls_sql+=" from  kp_gckpxm";
	ls_sql+=" where  (kpxmbm='"+wherekpxmbm+"') and  (kpjg='"+wherekpjg+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpxmbm=cf.fillNull(rs.getString("kpxmbm"));
		kpxmmc=cf.fillNull(rs.getString("kpxmmc"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpjgdy=cf.fillNull(rs.getString("kpjgdy"));
		kpkfbm=cf.fillNull(rs.getString("kpkfbm"));
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
		sgdfk=cf.fillNull(rs.getString("sgdfk"));
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

<form method="post" action="SaveEditKp_gckpxm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评项目编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxmbm" size="20" maxlength="4"  value="<%=kpxmbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">考评项目名称</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxmmc" size="20" maxlength="50"  value="<%=kpxmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">考评大类</div>
              </td>
              <td width="35%"> 
                <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">严重程度</div>
              </td>
              <td width="35%"> 
                <select name="kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm",kpjg);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">扣分</div>
              </td>
              <td width="35%"> 
                <select name="kpkfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpkfbm,kpkfmc from kp_kpkfbm order by kpkfbm",kpkfbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">处罚</div>
              </td>
              <td width="35%"> 
                <select name="kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm",kpcfbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">罚款</td>
              <td width="35%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="16" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">严重程度定义</td>
              <td colspan="3"> 
                <textarea name="kpjgdy" cols="71" rows="5"><%=kpjgdy%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekpxmbm"  value="<%=wherekpxmbm%>" >
            <input type="hidden" name="wherekpjg"  value="<%=wherekpjg%>" >
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
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("请输入[考评项目编码]！");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmmc)=="") {
		alert("请输入[考评项目名称]！");
		FormName.kpxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("请选择[考评大类]！");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("请选择[严重程度]！");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kpkfbm)=="") {
		alert("请选择[扣分]！");
		FormName.kpkfbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请选择[罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.kpjgdy)=="") {
		alert("请输入[严重程度定义]！");
		FormName.kpjgdy.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
