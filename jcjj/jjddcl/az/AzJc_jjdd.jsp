<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String azr=null;
String sazrq=null;
String azsm=null;
String aztzr=null;
String kazsj=null;
String jhazrq=null;
String aztzsj=null;
String ksazsj=null;
String ycyybm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ksazsj,ycyybm,azr,sazrq,azsm,aztzr,kazsj,aztzsj,jhazrq";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		azr=cf.fillNull(rs.getString("azr"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
	}

	if (ksazsj.equals(""))
	{
		ksazsj=cf.today();
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>安装</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">安装（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">协商安装时间</span></td>
              <td width="29%"><input type="text" name="kazsj" size="20" maxlength="20"  value="<%=kazsj%>" readonly></td>
              <td width="21%" align="right"><span class="STYLE1">合同安装时间</span></td>
              <td width="29%"><input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>" readonly></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">发安装通知人</span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="aztzr" size="20" maxlength="20"  value="<%=aztzr%>" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">发安装通知时间</span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="aztzsj" value="<%=aztzsj%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF">安装信息录入人</td>
              <td bgcolor="#E8E8FF"><input type="text" name="azr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td align="right" bgcolor="#E8E8FF">安装状态</td>
              <td bgcolor="#E8E8FF"><%
	cf.radioToken(out, "clzt","31+正在安装&33+安装完成","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF">安装开始时间</td>
              <td bgcolor="#E8E8FF"><input type="text" name="ksazsj" size="20" maxlength="10" value="<%=ksazsj%>" ondblclick="JSCalendar(this)"></td>
              <td align="right" bgcolor="#E8E8FF">安装完成时间</td>
              <td bgcolor="#E8E8FF"><input type="text" name="sazrq" size="20" maxlength="20"  value="<%=sazrq%>" ondblclick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">延迟原因</td>
              <td><select name="ycyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",ycyybm);
%>
                </select>              </td>
              <td bgcolor="#E8E8FF" align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">安装说明</td>
              <td colspan="3" bgcolor="#E8E8FF"> 
                <textarea name="azsm" cols="71" rows="3"><%=azsm%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="center" height="51"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset" name="Reset" value="重输">
                <input type="button"  value="录入安装记录" onClick="f_lraz(insertform)" name="lraz" disabled>
                <input type="button"  value="查看安装记录" onClick="f_ckaz(insertform)" name="ckaz" disabled>
                <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.azr)=="") {
		alert("请输入[安装人]！");
		FormName.azr.focus();
		return false;
	}

	if(	javaTrim(FormName.ksazsj)=="") {
		alert("请输入[安装开始时间]！");
		FormName.ksazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ksazsj, "安装开始时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.clzt)) {
		alert("请选择[安装状态]！");
		FormName.clzt[0].focus();
		return false;
	}

	if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.sazrq)=="") {
			alert("请输入[安装完成时间]！");
			FormName.sazrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.sazrq, "安装完成时间"))) {
			return false;
		}

		if (FormName.sazrq.value>FormName.jhazrq.value)
		{
			if(	javaTrim(FormName.ycyybm)=="") {
				alert("请输入[延迟原因]！");
				FormName.ycyybm.focus();
				return false;
			}
			if(	javaTrim(FormName.azsm)=="") {
				alert("请输入[安装说明]！");
				FormName.azsm.focus();
				return false;
			}
		}
		else{
			FormName.ycyybm.value="";
		}
	}
	else{
		FormName.sazrq.value="";
		FormName.ycyybm.value="";
	}

	FormName.action="SaveAzJc_jjdd.jsp";
	FormName.submit();
	FormName.lraz.disabled=false;
	FormName.ckaz.disabled=false;
	return true;
}

function f_lraz(FormName)//参数FormName:Form的名称
{

	FormName.action="InsertJc_jjazjl.jsp";
	FormName.submit();
	return true;
}

function f_ckaz(FormName)//参数FormName:Form的名称
{

	FormName.action="Jc_jjazjlList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
