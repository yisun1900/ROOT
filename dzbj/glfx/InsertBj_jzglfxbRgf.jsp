<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;

String save=request.getParameter("save");
String dqbm=request.getParameter("dqbm");
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT xmmc,dqmc,xmdlmc,xmxlmc,clcb,rgcb,jxcb,cbenj";
	ls_sql+=" FROM bj_jzbjb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_jzbjb.bjbbh='"+bjbbh+"' and bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.bjjbbm='"+bjjbbm+"'";
	ls_sql+=" and bj_jzbjb.dqbm=dm_dqbm.dqbm and bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		jxcb=rs.getDouble("jxcb");
		cbenj=rs.getDouble("cbenj");
	}
	else{
		out.println("错误！项目不存在");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>家装工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
.STYLE6 {color: #990000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" >
  <div align="center">修改家装工料分析表－增加人工费</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr>
        <td align="right"><span class="STYLE1">地区</span></td>
        <td><%=dqmc%></td>
        <td align="right"><span class="STYLE1">报价版本号</span></td>
        <td><%=bjbbh%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目编号</span></td>
        <td><%=xmbh%></td>
        <td align="right"><span class="STYLE1">报价级别</span></td>
        <td><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目名称</span></td>
        <td colspan="3"><%=xmmc%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目大类</span></td>
        <td><%=xmdlbm%></td>
        <td align="right"><span class="STYLE1">项目小类</span></td>
        <td><%=xmxlbm%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">材料成本</span></td>
        <td><span class="STYLE6"><%=clcb%></span></td>
        <td align="right"><span class="STYLE6">人工成本</span></td>
        <td><span class="STYLE6"><%=rgcb%></span></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">成本价</span></td>
        <td><span class="STYLE6"><%=cbenj%>          <br>
        </span></td>
        <td align="right"><span class="STYLE6">机械成本</span></td>
        <td><span class="STYLE6"><%=jxcb%></span></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="24" colspan="4" align="center" bgcolor="#FFFFCC">&nbsp;</td>
      </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>工料分类</td>
      <td width="32%"><select name="glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm where glflbm='2' order by glflbm","");
%>
      </select></td>
      <td align="right" width="18%"><span class="STYLE2">*</span>类型</td>
      <td width="32%"><input name="lx" type="radio"  value="1" checked>
打印
  <input type="radio" name="lx"  value="2">
不打印 </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>人工费名称</td>
      <td><select name="glfxclmc" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option  value=""></option>
        <option  value="水电工">水电工</option>
        <option  value="木工">木工</option>
        <option  value="瓦工">瓦工</option>
        <option  value="油漆工">油漆工</option>
        <option  value="杂工">杂工</option>
      </select></td>
      <td align="right"><span class="STYLE2">*</span>计量单位</td>
      <td><input type="text" name="jldwbm" value="工日" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>单价</td>
      <td width="32%">
		<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
		</select>
		<input type="text" name="dj" value="" size="20" maxlength="17" ></td>
      <td align="right" width="18%"><span class="STYLE2">*</span>数量</td>
      <td width="32%"><input type="text" name="xhl" value="" size="20" maxlength="17" ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">录入人</span></td>
      <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">录入时间</span></td>
      <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">备注</td>
      <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>      </td>
    </tr>
    <tr align="center">
      <td colspan="4"><input type="button"  value="增加人工" onClick="f_lrrg(insertform)" >
        <input type="hidden" name="bjbbh"  value="<%=bjbbh%>" >
          <input type="hidden" name="wlllbz"  value="N" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="hidden" name="glfxclbm" value="" size="20" maxlength="100"  readonly>
          <input type="hidden" name="jqsfl" value="0" size="20" maxlength="17" >
          <input type="hidden" name="bsfl" value="0" size="20" maxlength="17" >
          <input type="hidden" name="tvocsfl" value="0" size="20" maxlength="17" >    </td>
    </tr>
  </table>




</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_lrrg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请输入[报价版本号]！");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别编码]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.glflbm)=="") {
		alert("请选择[工料分类]！");
		FormName.glflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("请输入[人工费名称]！");
		FormName.glfxclmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请输入[计量单位]！");
		FormName.jldwbm.focus();
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
	if(	javaTrim(FormName.xhl)=="") {
		alert("请输入[数量]！");
		FormName.xhl.focus();
		return false;
	}
	if(!(isFloat(FormName.xhl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.jqsfl)=="") {
		alert("请输入[甲醛释放量]！");
		FormName.jqsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.jqsfl, "甲醛释放量"))) {
		return false;
	}
	if(	javaTrim(FormName.bsfl)=="") {
		alert("请输入[苯释放量]！");
		FormName.bsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.bsfl, "苯释放量"))) {
		return false;
	}
	if(	javaTrim(FormName.tvocsfl)=="") {
		alert("请输入[TVOC释放量]！");
		FormName.tvocsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.tvocsfl, "TVOC释放量"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
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

	FormName.action="SaveInsertBj_jzglfxbRgf.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>
