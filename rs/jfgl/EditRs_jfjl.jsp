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
String dwbh=null;
String ssfgs=null;
String rzsj=null;
String lx=null;
String jfsy=null;
String jflxbm=null;
String jfje=null;
String jfrq=null;
String jfzfrq=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String jfjlh=cf.GB2Uni(request.getParameter("jfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,yhmc,bianhao,lx,jfsy,jflxbm,jfje,jfrq,jfzfrq,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  rs_jfjl";
	ls_sql+=" where  (jfjlh="+jfjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		lx=cf.fillNull(rs.getString("lx"));
		jfsy=cf.fillNull(rs.getString("jfsy"));
		jflxbm=cf.fillNull(rs.getString("jflxbm"));
		jfje=cf.fillNull(rs.getString("jfje"));
		jfrq=cf.fillNull(rs.getDate("jfrq"));
		jfzfrq=cf.fillNull(rs.getDate("jfzfrq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select sfzh,xzzwbm,dwbh,ssfgs,rzsj ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  ygbh="+ygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfzh=cf.fillNull(rs.getString("sfzh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
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
<form method="post" action="SaveEditRs_jfjl.jsp" name="editform">
<div align="center">请修改信息（奖罚记录号：<%=jfjlh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">所属分公司</font></td>
      <td width="32%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
        </select>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">所属部门</font></td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">员工序号</font></td>
      <td width="32%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>      </td>
      <td align="right" width="18%"><font color="#000099">工号</font></td>
      <td width="32%"> 
        <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099"></font><font color="#000099">员工名称</font></td>
      <td width="32%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="18%"><font color="#000099">身份证号</font></td>
      <td width="32%"> 
        <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">入职日期</font></td>
      <td width="32%"> 
        <input type="text" name="rzsj" value="<%=rzsj%>" size="20" maxlength="10" readonly>      </td>
      <td align="right" width="18%"><font color="#000099">行政职务</font></td>
      <td width="32%"> 
        <input type="text" name="xzzwbm" size="20" maxlength="50"  value="<%=xzzwbm%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#CCFFCC">&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>类型</td>
      <td width="32%"><%
	cf.radioToken(out, "lx","1+处罚&2+奖励",lx);
%></td>
      <td align="right" width="18%"><font color="#CC0000">*</font>奖罚类型</td>
      <td width="32%"> 
        <select name="jflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jflxbm,jflxmc from dm_jflxbm order by jflxbm",jflxbm);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>奖罚事由</td>
      <td colspan="3"> 
        <textarea name="jfsy" cols="74" rows="6"><%=jfsy%></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>奖罚金额</td>
      <td width="32%"> 
        <input type="text" name="jfje" size="20" maxlength="17"  value="<%=jfje%>" >      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font>奖罚日期</td>
      <td width="32%"> 
        <input type="text" name="jfrq" size="20" maxlength="10"  value="<%=jfrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">录入人</font></td>
      <td width="32%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly></td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">录入时间</font></td>
      <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">录入部门</font></td>
      <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
      </select></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
			<input type="hidden" name="jfjlh"  value="<%=jfjlh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
        </div>      </td>
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
	if(	javaTrim(FormName.jfjlh)=="") {
		alert("请输入[奖罚记录号]！");
		FormName.jfjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.jfjlh, "奖罚记录号"))) {
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[所属部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职日期"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jfsy)=="") {
		alert("请输入[奖罚事由]！");
		FormName.jfsy.focus();
		return false;
	}
	if(	javaTrim(FormName.jflxbm)=="") {
		alert("请选择[奖罚类型]！");
		FormName.jflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jfje)=="") {
		alert("请输入[奖罚金额]！");
		FormName.jfje.focus();
		return false;
	}
	if(!(isFloat(FormName.jfje, "奖罚金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jfrq)=="") {
		alert("请输入[奖罚日期]！");
		FormName.jfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jfrq, "奖罚日期"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
