<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String ckph=null;
String dqbm=null;
String mddqbm=null;
String fgsbh=null;
String ckbh=null;
String cklx=null;
String ckfs=null;
String psfs=null;
String jhshsj=null;
String lydh=null;
String jsr=null;
String ckr=null;
String cksj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String whereckph=cf.GB2Uni(request.getParameter("ckph"));

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//表示录入存盘直接转过来
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ckph,dqbm,mddqbm,fgsbh,ckbh,cklx,ckfs,psfs,jhshsj,lydh,jsr,ckr,cksj,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  jxc_ckd";
	ls_sql+=" where  (ckph='"+whereckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ckph=cf.fillNull(rs.getString("ckph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		mddqbm=cf.fillNull(rs.getString("mddqbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		cklx=cf.fillNull(rs.getString("cklx"));
		ckfs=cf.fillNull(rs.getString("ckfs"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		lydh=cf.fillNull(rs.getString("lydh"));
		jsr=cf.fillNull(rs.getString("jsr"));
		ckr=cf.fillNull(rs.getString("ckr"));
		cksj=cf.fillNull(rs.getDate("cksj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">请修改出库单（出库批号：<%=ckph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">出库地区</span></td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>目的地区</td>
  <td><select name="mddqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+mddqbm+"'  order by dqmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">出库分公司</span></td>
  <td><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' order by dwmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">来源单号</span></td>
  <td><input type="text" name="lydh" size="20" maxlength="13"  value="<%=lydh%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">出库类型</span></td>
  <td><select name="cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectToken(out,"D+订单出库&B+报废出库&T+退货出库&S+申购出库&P+材料单出库&J+辅材代金券出库&X+销售出库&R+调拨出库",cklx,false);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>出库仓库</td> 
  <td width="32%">
  <select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc where ckbh='"+ckbh+"' ",ckbh);
%>
  </select>
  </td>
  <td align="right" width="18%">经手人</td> 
  <td width="32%"><input type="text" name="jsr" size="20" maxlength="20"  value="<%=jsr%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>出库方式</td> 
  <td colspan="3"><%
	cf.radioToken(out, "ckfs","1+自动出库（先生产先出库）&2+自动出库（先入库先出库）&3+手工出库",ckfs);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配送方式</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "psfs","0+厂家配送&1+公司送货&2+自取",psfs);
%>  </td>
  <td align="right" width="18%">计划送货时间</td> 
  <td width="32%"> 
    <input type="text" name="jhshsj" size="20" maxlength="10"  value="<%=jhshsj%>" onDblClick="JSCalendar(this)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>出库人</td> 
  <td width="32%"> 
    <input type="text" name="ckr" size="20" maxlength="20"  value="<%=ckr%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>出库时间</td> 
  <td width="32%"> 
    <input type="text" name="cksj" size="20" maxlength="10"  value="<%=cksj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td>
	<input type="text" name="lrr" value="<%=yhmc%>" size="20"  readonly>  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td>
	<input type="text" name="lrsj" value="<%=cf.today()%>" size="20"  readonly>  </td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td>
   <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'  order by dwbh","");
   %>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="ckph" value="<%=ckph%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="button" onClick="f_lrmx(editform)"  value="输入明细">
	  <input type="button" onClick="f_xgmx(editform)"  value="修改明细">
	  <input type="button" onClick="f_tj(editform)"  value="提交">
	  <input type="button" onClick="f_dyckd(editform)"  value="打印出库单">
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
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[出库地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mddqbm)=="") {
		alert("请选择[目的地区]！");
		FormName.mddqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请选择[出库仓库]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cklx)=="") {
		alert("请选择[出库类型]！");
		FormName.cklx.focus();
		return false;
	}
	if(	!radioChecked(FormName.ckfs)) {
		alert("请选择[出库方式]！");
		FormName.ckfs[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ckr)=="") {
		alert("请输入[出库人]！");
		FormName.ckr.focus();
		return false;
	}
	if(	javaTrim(FormName.cksj)=="") {
		alert("请输入[出库时间]！");
		FormName.cksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cksj, "出库时间"))) {
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

	FormName.action="SaveEditJxc_ckdSgd.jsp";
	FormName.submit();
	return true;
}

function f_lrmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="InsertJxc_ckmxSgd.jsp";
	FormName.submit();
	return true;
}

function f_xgmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="EditAllJxc_ckmx.jsp";
	FormName.submit();
	return true;
}

function f_tj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="tjckdSgd.jsp";
	FormName.submit();
	return true;
}


function f_dyckd(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ckph)=="") {
		alert("请输入[出库批号]！");
		FormName.ckph.focus();
		return false;
	}

	FormName.action="/jxcdy/printCkd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
