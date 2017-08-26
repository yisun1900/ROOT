<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

//**************************************************************************888
double zcf=0;//A级主材费
double clf=0;
double rgf=0;//A级人工费
double jjf=0;//A级机械费
double glfbl=0;//A级管理费百分比
String zcmc=null;//A级主材名称
String zcgg=null;//A级主材规格


//*******************************************************************************88
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double cbenj=0;
double sgdbj=0;
double bj=0;
String gycl=null;
String xh=null;
String sfxycl=null;
String sfbxx=null;


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfxycl,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,sgdbj,cbenj,bj,gycl,xh,clf,zcf,jjf,rgf,glfbl,zcmc,zcgg,sfbxx";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where  dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sgdbj=rs.getDouble("sgdbj");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		clf=rs.getDouble("clf");

		zcf=rs.getDouble("zcf");
		jjf=rs.getDouble("jjf");
		rgf=rs.getDouble("rgf");
		glfbl=rs.getDouble("glfbl");
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcgg=cf.fillNull(rs.getString("zcgg"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改公装报价表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="17%"><font color="#FF0000">*</font>地区</td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
              <td align="right" width="18%"><font color="#FF0000">*</font>报价级别</td>
              <td width="32%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>项目大类</td>
              <td width="33%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>项目小类</td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>项目编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" >
              </td>
              <td width="18%"> 
                <div align="right">饰面</div>
              </td>
              <td width="32%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="74" maxlength="100"  value="<%=xmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#FF0000">*</font>是否需要主材</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfxycl","1+需要&2+不需要",sfxycl);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="17%">成本价</td>
              <td bgcolor="#E8E8FF" width="33%"> 
                <input type="text" name="cbenj" value="<%=cbenj%>" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF" width="18%">施工队报价</td>
              <td bgcolor="#E8E8FF" width="32%"> 
                <input type="text" name="sgdbj" value="<%=sgdbj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td height="22" align="right" width="17%"> <font color="#FF0000">*</font>客户报价</td>
              <td width="33%"> 
                <input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">管理费百分比</div>
              </td>
              <td width="32%"> 
                <input type="text" name="glfbl" value="<%=glfbl%>" size="8" maxlength="17" >
                % </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">主材名称</td>
              <td width="33%"> 
                <input type="text" name="zcmc" value="<%=zcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="18%">主材规格</td>
              <td width="32%"> 
                <input type="text" name="zcgg" value="<%=zcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">主材费</td>
              <td width="33%"> 
                <input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">辅材费</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">人工费</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="rgf" value="<%=rgf%>" size="20" maxlength="17" >
              </td>
              <td width="18%"> 
                <div align="right">机械费</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jjf" value="<%=jjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="17%">排序序号</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="17%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="72" rows="8"><%=gycl%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>是否必选项</td>
              <td colspan="3"><%
	cf.radioToken(out, "sfbxx","1+必选&2+非必选&3+不可选",sfbxx);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font>修改人</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>修改时间</td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button" onClick="f_lr(editform)"  value="录入工料分析" name="lr" >
                  <input type="button" onClick="f_wh(editform)"  value="维护工料分析" name="wh" >
                  <input type="reset"  value="重输">
                  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherexmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="wherebjjbbm"  value="<%=bjjbbm%>" >
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
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
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(!(isFloat(FormName.cbenj, "成本价"))) {
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "施工队报价"))) {
		return false;
	}
	if(	javaTrim(FormName.bj)=="") {
		alert("请输入[客户报价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "客户报价"))) {
		return false;
	}
	if(!(isFloat(FormName.glfbl, "管理费百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.zcf, "主材费"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "辅材费"))) {
		return false;
	}
	if(!(isFloat(FormName.rgf, "人工费"))) {
		return false;
	}
	if(!(isFloat(FormName.jjf, "机械费"))) {
		return false;
	}
	if(!(isInt(FormName.xh, "序号"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfxycl)) {
		alert("请选择[是否需要主材]！");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[修改人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请选择[修改时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "修改时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}

	FormName.action="SaveEditBj_gzbjb.jsp";
	FormName.submit();
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="InsertBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("请选择[项目大类]！");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("请选择[项目小类]！");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}

	FormName.action="EditBj_gzglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
