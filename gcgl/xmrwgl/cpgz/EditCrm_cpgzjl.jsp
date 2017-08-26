<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String cplx=null;
String cpazlx=null;
String ghf=null;
String jgpp=null;
String ghfhzsj=null;
String sfxdd=null;
String sfxhxgl=null;
String zxsfwz=null;
String cpsjs=null;
String sfxfb=null;
String sfyyc=null;
String sfxtx=null;
String txrq=null;
String txxs=null;
String txnr=null;
String cpztbm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String zwyjcrq=null;
String jhrksj=null;
String jhshsj=null;
String jhazsj=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;

try {
	conn=cf.getConnection();
	ls_sql="select cplx,cpazlx,ghf,jgpp,ghfhzsj,sfxdd,sfxhxgl,zxsfwz,cpsjs,sfxfb,sfyyc,sfxtx,txrq,txxs,txnr,cpztbm,lrr,lrsj,lrbm,bz ";
	ls_sql+=" ,zwyjcrq,jhrksj,jhshsj,jhazsj ";
	ls_sql+=" from  crm_cpgzjl";
	ls_sql+=" where khbh='"+khbh+"' and cpflbm='"+cpflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zwyjcrq=cf.fillNull(rs.getDate("zwyjcrq"));
		jhrksj=cf.fillNull(rs.getDate("jhrksj"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));

		cplx=cf.fillNull(rs.getString("cplx"));
		cpazlx=cf.fillNull(rs.getString("cpazlx"));
		ghf=cf.fillNull(rs.getString("ghf"));
		jgpp=cf.fillNull(rs.getString("jgpp"));
		ghfhzsj=cf.fillNull(rs.getDate("ghfhzsj"));
		sfxdd=cf.fillNull(rs.getString("sfxdd"));
		sfxhxgl=cf.fillNull(rs.getString("sfxhxgl"));
		zxsfwz=cf.fillNull(rs.getString("zxsfwz"));
		cpsjs=cf.fillNull(rs.getString("cpsjs"));
		sfxfb=cf.fillNull(rs.getString("sfxfb"));
		sfyyc=cf.fillNull(rs.getString("sfyyc"));
		sfxtx=cf.fillNull(rs.getString("sfxtx"));
		txrq=cf.fillNull(rs.getDate("txrq"));
		txxs=cf.fillNull(rs.getString("txxs"));
		txnr=cf.fillNull(rs.getString("txnr"));
		cpztbm=cf.fillNull(rs.getString("cpztbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select hth,khxm,fwdz ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
<div align="center">维护－－产品信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">客户编号</span></td>
    <td><%=khbh%></td>
    <td align="right"><span class="STYLE3">合同号</span></td>
    <td><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3">客户姓名</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE3">房屋地址</span></td>
    <td><%=fwdz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品分类</td> 
  <td width="32%"><select name="cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm='"+cpflbm+"'",cpflbm);
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>产品类型</td> 
  <td width="32%"><%
	cf.radioToken(out, "cplx","1+定制品&2+成品",cplx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>产品安装类型</td> 
  <td width="32%"><%
	cf.radioToken(out, "cpazlx","1+施工类&2+安装类",cpazlx);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>供货方</td> 
  <td width="32%"><%
	cf.radioToken(out, "ghf","甲供+甲供&公司供+公司供&未确认+未确认",ghf);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">甲供品牌</td> 
  <td colspan="3"><input type="text" name="jgpp" size="73" maxlength="50"  value="<%=jgpp%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供货方获知时间</td> 
  <td width="32%"> 
    <input type="text" name="ghfhzsj" size="20" maxlength="10"  value="<%=ghfhzsj%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否交底后新订单</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxdd","Y+是&N+否",sfxdd);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需后续管理</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxhxgl","Y+是&N+否",sfxhxgl);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>选型是否完成</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "zxsfwz","Y+是&N+否",zxsfwz);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品设计师</td> 
  <td width="32%"> 
    <input type="text" name="cpsjs" size="20" maxlength="30"  value="<%=cpsjs%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需提醒</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxtx","Y+需提醒&N+否",sfxtx);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">提醒日期</td>
  <td><input type="text" name="txrq" size="20" maxlength="10"  value="<%=txrq%>" onDblClick="JSCalendar(this)"></td>
  <td align="right">提醒小时</td>
  <td><input type="text" name="txxs" size="20" maxlength="8"  value="<%=txxs%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">提醒内容</td> 
  <td colspan="3"><textarea name="txnr" cols="71" rows="3"><%=txnr%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最晚应进场日期</td>
  <td><input type="text" name="zwyjcrq" size="20" maxlength="10"  value="<%=zwyjcrq%>" onDblClick="JSCalendar(this)"></td>
  <td align="right">计划入库时间</td>
  <td><input type="text" name="jhrksj" size="20" maxlength="10"  value="<%=jhrksj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划送货时间</td>
  <td><input type="text" name="jhshsj" size="20" maxlength="10"  value="<%=jhshsj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right">计划安装时间</td>
  <td><input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jhazsj%>" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input name="button2" type="button" onClick="f_ck(editform)"  value="查看跟踪信息">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("请选择[产品分类]！");
		FormName.cpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("请选择[产品类型]！");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cpazlx)) {
		alert("请选择[产品安装类型]！");
		FormName.cpazlx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("请选择[供货方]！");
		FormName.ghf[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.ghfhzsj, "供货方获知时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxdd)) {
		alert("请选择[是否交底后新订单]！");
		FormName.sfxdd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxhxgl)) {
		alert("请选择[是否需后续管理]！");
		FormName.sfxhxgl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxtx)) {
		alert("请选择[是否需提醒]！");
		FormName.sfxtx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.txrq, "提醒日期"))) {
		return false;
	}
	if(!(isNumber(FormName.txxs, "提醒小时"))) {
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
	if(!(isDatetime(FormName.zwyjcrq, "最晚应进场日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhrksj, "计划入库时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "计划安装时间"))) {
		return false;
	}

	FormName.action="SaveEditCrm_cpgzjl.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("请选择[产品分类]！");
		FormName.cpflbm.focus();
		return false;
	}

	FormName.action="ViewCrm_cpztgzjl.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
