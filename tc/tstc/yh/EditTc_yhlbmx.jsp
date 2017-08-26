<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

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
<%
String yhmc=(String)session.getAttribute("yhmc");

String lbxmbm=null;
String dqbm=null;
String bjjbbm=null;
String lbmc=null;
String xmmc=null;
String ppmc=null;
String xh=null;
String jldw=null;
double zqdj=0;
double dj=0;
double sjzj=0;
double sl=0;
String bz=null;
String lrr=null;
String lrsj=null;
String lx=null;
String wherelbxmbm=cf.GB2Uni(request.getParameter("lbxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select lbxmbm,dqbm,bjjbbm,lbmc,xmmc,ppmc,xh,jldw,zqdj,dj,sjzj,sl,bz,lrr,lrsj,lx ";
	ls_sql+=" from tc_yhlbmx";
	ls_sql+=" where  (lbxmbm='"+wherelbxmbm+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lbxmbm=cf.fillNull(rs.getString("lbxmbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		lbmc=cf.fillNull(rs.getString("lbmc"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		jldw=cf.fillNull(rs.getString("jldw"));
		zqdj=rs.getDouble("zqdj");
		dj=rs.getDouble("dj");
		sjzj=rs.getDouble("sjzj");
		sl=rs.getDouble("sl");
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lx=cf.fillNull(rs.getString("lx"));
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
<form method="post" action="SaveEditTc_yhlbmx.jsp" name="editform" >
<div align="center">套餐优惠礼包明细－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font>报价级别</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm);
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>项目编码</td> 
  <td width="32%"><input type="text" name="lbxmbm" value="<%=lbxmbm%>" size="20" maxlength="6" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>礼包名称</td> 
  <td width="32%"><select name="lbmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lbmc c1,lbmc c2 from tc_yhlb order by lbmc",lbmc);
%>
  </select></td>
  </tr>


<tr bgcolor="#FFFFFF">
  <td align="right">项目名称</td>
  <td colspan="3"><input type="text" name="xmmc" value="<%=xmmc%>" size="73" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">品牌</td>
  <td colspan="3"><input type="text" name="ppmc" value="<%=ppmc%>" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">型号</td>
  <td colspan="3"><input type="text" name="xh" value="<%=xh%>" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">折前单价</td>
  <td><input type="text" name="zqdj" value="<%=zqdj%>" size="20" maxlength="17" ></td>
  <td align="right">升级折价</td>
  <td><input type="text" name="sjzj" value="<%=sjzj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">优惠单价</td> 
  <td width="32%"><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="17" ></td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">数量</td>
  <td><input type="text" name="sl" value="<%=sl%>" size="20" maxlength="17" ></td>
  <td align="right">类型</td>
  <td><%
	cf.radioToken(out, "lx","1+工程&2+主材",lx);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注及工艺说明</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="10"  ><%=bz%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span> </td>
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>

<input type="hidden" name="wherelbxmbm"  value="<%=wherelbxmbm%>" >

    <tr align="center"> 
      <td colspan="4"> 
	<div align="center">
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
	if(	javaTrim(FormName.lbxmbm)=="") {
		alert("请选择[优惠项目编码]！");
		FormName.lbxmbm.focus();
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
	if(	javaTrim(FormName.lbmc)=="") {
		alert("请输入[礼包名称]！");
		FormName.lbmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前单价"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[优惠单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "优惠单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzj)=="") {
		alert("请输入[升级折价]！");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "升级折价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
