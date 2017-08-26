<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clcb=0;
double rgcb=0;
double cbenj=0;
double clbj=0;
double rgbj=0;
double bj=0;
String gycl=null;
String xh=null;
String zdyxmyxq=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;
String xmflbm=null;
double sgcbj=0;

String lrr=cf.GB2Uni(request.getParameter("lrr"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmflbm,sgcbj,dqbm,bjjbbm,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clcb,rgcb,cbenj,bj,clbj,rgbj,gycl,xh,zdyxmyxq,flmcgg,bz,sfxycl,sfxyyjd";
	ls_sql+=" from  bj_zdyxmb";
	ls_sql+=" where  lrr='"+lrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		sgcbj=rs.getDouble("sgcbj");
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		clbj=rs.getDouble("clbj");
		rgbj=rs.getDouble("rgbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		zdyxmyxq=cf.fillNull(rs.getDate("zdyxmyxq"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 修改－－自定义项目（项目编号：<%=xmbh%>）</div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><span class="STYLE1"><font color="#CC0000">*</font>地区</span></td>
              <td width="34%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">报价级别</span></td>
              <td width="34%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,false);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#CC0000">*</font>项目大类</td>
              <td width="34%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font>项目小类</td>
              <td width="34%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#CC0000">*</font>项目分类</td>
              <td colspan="3"  ><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm",xmflbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>项目名称</td>
              <td colspan="3"  > 
                <input type="text" name="xmmc" size="73" maxlength="100"  value="<%=xmmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"  ><font color="#CC0000">*</font>计量单位</td>
              <td width="34%"  ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%>
              </select></td>
              <td width="16%" align="right"  ><font color="#CC0000">*</font><font color="#0000CC">自定义项目有效期</font></td>
              <td width="34%"  ><input type="text" name="zdyxmyxq" value="<%=zdyxmyxq%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>是否需要材料</td>
              <td><%
	cf.radioToken(out, "sfxycl","Y+需要&N+否",sfxycl);
%></td>
              <td align="right"><font color="#FF0000">*</font>是否需要预交底</td>
              <td><%
	cf.radioToken(out, "sfxyyjd","Y+需要&N+否",sfxyyjd);
%></td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>工程预算价</td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" ></td>
              <td colspan="2" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"  >工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="71" rows="4"><%=gycl%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="2"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="smbm"  value="<%=smbm%>" >
                  <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="lrr"  value="<%=lrr%>" >
                </div>              </td>
            </tr>
          </table>
        </form>
	  </div>    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请选择[项目编号]！");
		FormName.xmbh.focus();
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
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("请选择[项目分类]！");
		FormName.xmflbm.focus();
		return false;
	}
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
	if(	javaTrim(FormName.bj)=="") {
		alert("请输入[工程预算价]！");
		FormName.bj.focus();
		return false;
	}
	if(!(isFloat(FormName.bj, "工程预算价"))) {
		return false;
	}
 	if(	javaTrim(FormName.zdyxmyxq)=="") {
		alert("请输入[自定义项目有效期]！");
		FormName.zdyxmyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zdyxmyxq, "自定义项目有效期"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxycl)) {
		alert("请选择[是否需要材料]！");
		FormName.sfxycl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxyyjd)) {
		alert("请选择[是否需要预交底]！");
		FormName.sfxyyjd[0].focus();
		return false;
	}

	FormName.action="SaveEditBj_zdyxmb.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
