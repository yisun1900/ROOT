<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String kbcpbm=null;
String jldw=null;
double sl=0;
double dj=0;
String sfksc=null;
String sfkth=null;
String lrr=null;
String lrsj=null;
String bz=null;


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=request.getParameter("bjbbh");
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String jgwzbm=request.getParameter("jgwzbm");
String kbwlbm=cf.GB2Uni(request.getParameter("kbwlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select kbcpbm,jldw,sl,dj,sfksc,sfkth,lrr,lrsj,bz ";
	ls_sql+=" from  tckb_bpzcxm";
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (bjjbbm='"+bjjbbm+"') and  (bjbbh='"+bjbbh+"') and  (hxbm='"+hxbm+"') and  (jgwzbm='"+jgwzbm+"') and  (kbwlbm='"+kbwlbm+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jldw=cf.fillNull(rs.getString("jldw"));
		kbcpbm=cf.fillNull(rs.getString("kbcpbm"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		sfksc=cf.fillNull(rs.getString("sfksc"));
		sfkth=cf.fillNull(rs.getString("sfkth"));
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
<form method="post" action="SaveEditTckb_bpzcxm.jsp" name="editform">
<div align="center">套餐标准主材项目－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
  <td width="32%" bgcolor="#E8E8FF"><input type="text" name="bjbbh" value="<%=bjbbh%>" size="20" maxlength="20" readonly></td>
  <td width="18%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td width="32%" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td>
  <td bgcolor="#E8E8FF"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">报价级别</font></td>
  <td bgcolor="#E8E8FF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">户型</font></td>
  <td bgcolor="#E8E8FF"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
  </select></td>
  <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">结构位置</font></td>
  <td bgcolor="#E8E8FF"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm where jgwzmc='"+jgwzbm+"'",jgwzbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>科宝物料编码</td>
  <td><input type="text" name="kbwlbm" value="<%=kbwlbm%>" size="20" maxlength="20" ></td>
  <td align="right"><font color="#FF0000">*</font>科宝产品编码</td>
  <td><input type="text" name="kbcpbm" value="<%=kbcpbm%>" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>标配数量</td>
  <td><input type="text" name="sl" size="20" maxlength="17"  value="<%=sl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>单价</td>
  <td><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否可删除</td>
  <td><%
	cf.radioToken(out, "sfksc","Y+可删除&N+否",sfksc);
%></td>
  <td align="right"><font color="#FF0000">*</font>是否可替换</td>
  <td><%
	cf.radioToken(out, "sfkth","Y+可升级替换&N+不可替换&T+同级替换",sfkth);
%></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherekbwlbm"  value="<%=kbwlbm%>" >
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[结构位置]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kbwlbm)=="") {
		alert("请输入[科宝物料编码]！");
		FormName.kbwlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kbcpbm)=="") {
		alert("请选择[科宝产品编码]！");
		FormName.kbcpbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("错误！输入[标配数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "标配数量"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfksc)) {
		alert("请选择[是否可删除]！");
		FormName.sfksc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkth)) {
		alert("请选择[是否可替换]！");
		FormName.sfkth[0].focus();
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
