<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改－套餐品牌升级差价表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String ppmc=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
ppmc=cf.getParameter(request,"ppmc");

String jldw=null;
String sjcj=null;

String yxkssj=null;
String yxjzsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jldw,sjcj,yxkssj,yxjzsj ";
	ls_sql+=" from  tckd_tcppsjcjb";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjjbbm1='"+bjjbbm1+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jldw=cf.fillNull(rs.getString("jldw"));
		sjcj=cf.fillNull(rs.getString("sjcj"));

		yxkssj=cf.fillNull(rs.getDate("yxkssj"));
		yxjzsj=cf.fillNull(rs.getDate("yxjzsj"));
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">修改－套餐品牌升级差价表</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">产品类别</font></td>
    <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' ","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">原报价级别</font></td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm+"'","");
	%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">升级报价级别</font></td>
    <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm1+"'","");
%>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">计量单位</font></td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm where jldwmc='"+jldw+"'",jldw);
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>有效开始时间</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxkssj" value="<%=yxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>有效结束时间</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxjzsj" value="<%=yxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>品牌</td>
    <td bgcolor="#E8E8FF"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc",ppmc);
%>
    </select></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>升级差价</td>
    <td bgcolor="#E8E8FF"><input type="text" name="sjcj" value="<%=sjcj%>" size="20" maxlength="17" ></td>
  </tr>
  

    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="whereppmc"  value="<%=ppmc%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品类别]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[原报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("请选择[升级报价级别]！");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}


	if(	javaTrim(FormName.yxkssj)=="") {
		alert("请输入[有效开始时间]！");
		FormName.yxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "有效开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.yxjzsj)=="") {
		alert("请输入[有效结束时间]！");
		FormName.yxjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "有效结束时间"))) {
		return false;
	}
	if (FormName.yxkssj.value>FormName.yxjzsj.value)
	{
		alert("[有效开始时间]不能大于[有效结束时间]！");
		FormName.yxjzsj.select();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("请输入[升级差价]！");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "升级差价"))) {
		return false;
	}

	FormName.action="SaveEditTckd_tcppsjcjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
