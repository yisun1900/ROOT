<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String pxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
	String yhmc=(String)session.getAttribute("yhmc");
	String pxjhmc=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();

		ls_sql="select pxjhmc";
		ls_sql+=" from  rs_pxjh ";
		ls_sql+=" where pxjhbh='"+pxjhbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
	//	out.print(ls_sql);
		if (rs.next())
		{
			pxjhmc=rs.getString(1);
	//		out.print(count);
		}
		rs.close();
		ps.close();
	}
	catch (Exception e) {
		out.print("发生意外: " + e);
		return;
	}
	finally 
	{
		try{
			if (rs!= null) rs.close(); 
			if (ps!= null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}

%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><b><%=pxjhmc%>（<%=pxjhbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>培训结果</td> 
  <td width="35%"> 
    <select name="jhjg" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">完成</option>
	<option value="0">未完成</option>
    <option value="2">部分完成</option>
    </select>
  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">录入人</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">录入时间</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
     <textarea name="bz" cols="71" rows="3" onKeyUp="keyTo(savebutton)"></textarea>
  </td>
</tr>
    <tr align="center"> 
    <td colspan="4"> 
    <input name="pxjhbh" type="hidden" value="<%=pxjhbh%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
	<input type="reset"  value="重输" name="reset">
	<input type="button"  value="培训总结明细" onClick="f_domx(insertform)" name="lrmxbutton" disabled>
	<input type="button"  value="录入完成" onClick="f_wc(insertform)" name="wcbutton" disabled>
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
	if(	javaTrim(FormName.jhjg)=="") {
		alert("请选择[培训结果]！");
		FormName.jhjg.focus();
		return false;
	}

	FormName.action="SaveInsertRs_pxjhjg.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	FormName.reset.disabled=true;
	FormName.lrmxbutton.disabled=false;
	//FormName.wcbutton.disabled=true;
	return true;
}
function f_domx(FormName)//参数FormName:Form的名称
{
	FormName.action="Rs_pxzjmxList.jsp";
	FormName.submit();
	FormName.wcbutton.disabled=false;
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertRs_pxjhjgwc.jsp";
	FormName.submit();
	FormName.lrmxbutton.disabled=true;
	FormName.wcbutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
