<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khzq=null;
String khqssj=null;
String khjzsj=null;
String fgsbh=null;
String dwbh=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;
String byrw=null;
String cqts=null;
String sjts=null;
String bjts=null;
String kgts=null;
String sjkk=null;
String bjkk=null;
String cjkk=null;
String kgkk=null;
String qqkk=null;
String jbf=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khzq,khqssj,khjzsj,fgsbh,dwbh,ygbh,bianhao,yhmc,xzzwbm,byrw,lrr,lrsj,bz ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where  (khzq='"+wherekhzq+"') and  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzq=cf.fillNull(rs.getString("khzq"));
		khqssj=cf.fillNull(rs.getDate("khqssj"));
		khjzsj=cf.fillNull(rs.getDate("khjzsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		byrw=cf.fillNull(rs.getString("byrw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_jryjkh.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">考核周期</font></td> 
  <td width="32%"> 
    <input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" readonly>  </td>
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">分公司</font></td> 
  <td width="32%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' order by dwbh","");
		%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">考核起始时间</font></td>
  <td><input type="text" name="khqssj" size="20" maxlength="10"  value="<%=khqssj%>" readonly></td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">考核截至时间</font></td>
  <td><input type="text" name="khjzsj" size="20" maxlength="10"  value="<%=khjzsj%>" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">所属部门</font></td> 
  <td width="32%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
		%>
  </select></td>
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">员工序号</font></td> 
  <td width="32%"> 
    <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">工号</font></td> 
  <td width="32%"> 
    <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>  </td>
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">姓名</font></td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">行政职务</font></td> 
  <td width="32%"> 
    <input type="text" name="xzzwbm" size="20" maxlength="30"  value="<%=xzzwbm%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>考核任务</td>
  <td><input type="text" name="byrw" size="20" maxlength="9"  value="<%=byrw%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
		<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}

	if(	javaTrim(FormName.byrw)=="") {
		alert("请输入[考核任务]！");
		FormName.byrw.focus();
		return false;
	}
	if(!(isFloat(FormName.byrw, "考核任务"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
