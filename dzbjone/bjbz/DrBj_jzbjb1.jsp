<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
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

String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String bjbbh=cf.GB2Uni(cf.getParameter(request,"bjbbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select xmflbm,sgcbj,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,gycl,xh,flmcgg,bz,sfxycl,sfxyyjd ";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where  dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		sgcbj=rs.getDouble("sgcbj");
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		bj=rs.getDouble("bj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
	}
	rs.close();
	ps.close();

	ls_sql="select TO_CHAR(ADD_MONTHS(SYSDATE,zdyxmyxq),'YYYY-MM-DD') ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dqbm='"+dqbm+"' and dwlx='F0'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmyxq=rs.getString(1);
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
String yhjs=(String)session.getAttribute("yhjs");
String zwbm=(String)session.getAttribute("zwbm");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<html>
<head>
<title>从标准项目导入</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 从标准项目导入--自定义项目（<font color="#0000FF">原项目编号：<%=xmbh%></font>）</div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveDrBj_jzbjb1.jsp" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>报价版本号</td>
              <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:522PX">
                  <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'（'||dqmc||'）（'||DECODE(bj_dzbjbb.sfzybb,'1','未启用','2','当前版','3','可用版','4','停用')||'）' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' and bj_dzbjbb.bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh","");
%>
                </select>              </td>
            </tr>
            <tr> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">地区</font></td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>              </td>
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">报价级别</font></td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,false);
%> 
                </select>              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>项目大类</td>
              <td bgcolor="#FFFFFF"><select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%>
                </select>              </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>项目小类</td>
              <td bgcolor="#FFFFFF"><select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%>
                </select>              </td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF">项目分类</td>
              <td bgcolor="#FFFFFF"><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm",xmflbm);
%>
              </select></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>项目名称</td>
              <td colspan="3" bgcolor="#FFFFFF" > 
                <input type="text" name="xmmc" size="72" maxlength="100"  value="<%=xmmc%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>计量单位</td>
              <td width="34%" bgcolor="#FFFFFF" ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%>
              </select></td>
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">自定义项目有效期</font></td>
              <td width="34%" bgcolor="#FFFFFF" ><input type="text" name="zdyxmyxq" value="<%=zdyxmyxq%>" size="20" maxlength="10" readonly></td>
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
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>对外报价</strong></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>工程预算价</td>
              <td bgcolor="#CCCCFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" ></td>
              <td colspan="2" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            

            
            <tr> 
              <td width="16%" align="right" bgcolor="#CCCCFF">工艺材料简介</td>
              <td colspan="3" bgcolor="#CCCCFF"> 
                <textarea name="gycl" cols="76" rows="8"><%=gycl%></textarea></td>
            </tr>
              <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="4"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
          <tr> 
              <td colspan="4" align="center" >
                  <input type="hidden" name="xmbh" value="<%=xmbh%>"> 
                <input type="hidden" name="smbm" value="<%=smbm%>" >
                <input type="hidden" name="shbz" value="N" >
                <input type="hidden" name="bjlx" value="2" >
                <input type="hidden" name="lrr" value="<%=yhdlm%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >

				  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherexmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="wherebjjbbm"  value="<%=bjjbbm%>" >
                  <input type="hidden" name="wherebjbbh"  value="<%=bjbbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">              </td>
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("请选择[报价版本号]！");
		FormName.bjbbh.focus();
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
