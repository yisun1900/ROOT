<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String lzrq=null;
String lzyy=null;
String dwbh=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String lzyyflbm=null;
String czsqxh=null;
String lzlx=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,yhmc,bianhao,sfzh,xzzwbm,lzrq,lzyy,dwbh,ssfgs,lrr,lrsj,lzyyflbm,czsqxh,lzlx ";
	ls_sql+=" from  rs_yhlzjl";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		lzrq=cf.fillNull(rs.getDate("lzrq"));
		lzyy=cf.fillNull(rs.getString("lzyy"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lzyyflbm=cf.fillNull(rs.getString("lzyyflbm"));
		czsqxh=cf.fillNull(rs.getString("czsqxh"));
		lzlx=cf.fillNull(rs.getString("lzlx"));
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
<form method="post" action="SaveEditRs_yhlzjl.jsp" name="editform">
  <div align="center">请修改离职信息</div>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">所属分公司</font></td>
      <td width="34%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
        </select>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">所属单位</font></td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">员工序号</font></td>
      <td width="34%"> 
        <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">工号</font></td>
      <td width="33%"> 
        <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">员工名称</font></td>
      <td width="34%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">身份证号</font></td>
      <td width="33%"> 
        <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">行政职务</font></td>
      <td width="34%"> 
        <input type="text" name="xzzwbm" size="20" maxlength="50"  value="<%=xzzwbm%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#0000CC">辞职申请序号</font></td>
      <td width="33%"> 
        <input type="text" name="czsqxh" value="<%=czsqxh%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="16%"><font color="#CC0000">*</font>离职类型</td>
      <td width="34%">
<%
	cf.radioToken(out, "lzlx","S+辞职&T+辞退",lzlx);
%>
	  </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>离职原因分类</td>
      <td width="34%"> 
        <select name="lzyyflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm order by lzyyflbm",lzyyflbm);
%> 
        </select>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>离职日期</td>
      <td width="33%"> 
        <input type="text" name="lzrq" size="20" maxlength="10"  value="<%=lzrq%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>离职原因</td>
      <td colspan="3"> 
        <textarea name="lzyy" cols="73" rows="6"><%=lzyy%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="34%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
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
	if(	!radioChecked(FormName.lzlx)) {
		alert("请选择[离职类型]！");
		FormName.lzlx[0].focus();
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
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lzrq)=="") {
		alert("请输入[离职日期]！");
		FormName.lzrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lzrq, "离职日期"))) {
		return false;
	}
	if(	javaTrim(FormName.lzyyflbm)=="") {
		alert("请输入[离职原因分类]！");
		FormName.lzyyflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lzyy)=="") {
		alert("请输入[离职原因]！");
		FormName.lzyy.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[所属单位编号]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.ssfgs.focus();
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
