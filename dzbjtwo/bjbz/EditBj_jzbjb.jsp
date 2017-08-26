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
String sfbxx=null;
String glxmbh=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;


String xmflbm=null;
String sfyxdz=null;
double sgcbj=0;
double zdzk=0;

String bjbbh=cf.GB2Uni(cf.getParameter(request,"bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=request.getParameter("xmbh");
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmflbm,sfyxdz,sgcbj,zdzk,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clcb,rgcb,cbenj,bj,clbj,rgbj,gycl,xh,sfbxx,glxmbh,flmcgg,bz,sfxycl,sfxyyjd";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		sfyxdz=cf.fillNull(rs.getString("sfyxdz"));
		sgcbj=rs.getDouble("sgcbj");
		zdzk=rs.getDouble("zdzk");
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
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		glxmbh=cf.fillNull(rs.getString("glxmbh"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
		bz=cf.fillNull(rs.getString("bz"));
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
       <div align="center">请修改家装报价表
    </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
              <td colspan="3">
			  <input type="text" name="bjbbh" value="<%=bjbbh%>" size="73" maxlength="50" readonly>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">地区</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">报价级别</font></td>
              <td width="32%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>项目大类</td>
              <td width="32%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>项目小类</td>
              <td width="32%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">项目分类</td>
              <td><select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select xmflbm,xmflmc from bdm_xmflbm order by xmflbm",xmflbm);
%>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <div align="right"><font color="#FF0000">*</font>项目编号              </td>
              <td width="32%"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" >              </td>
              <td width="18%" align="right"> 
              <div align="right">排序序号              </td>
              <td width="32%"> 
              <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>项目名称</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="72" maxlength="100"  value="<%=xmmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">饰面</td>
              <td width="32%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>工程量计量单位</td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#FF0000">*</font>是否必选项</td>
              <td colspan="3"><%
	cf.radioToken(out, "sfbxx","1+必报项&2+必列项&3+可选项&9+作废项",sfbxx);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">关联项目编号</td>
              <td colspan="3"><input type="text" name="glxmbh" size="56" maxlength="100"  value="<%=glxmbh%>" >
              <font color="#FF0000"><strong>（项目编号用逗号分割）</strong></font></td>
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
              <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>成本价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">材料成本</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="clcb" value="<%=clcb%>" size="20" maxlength="17" readonly onChange="f_jscb(editform)"></td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">人工成本</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="rgcb" value="<%=rgcb%>" size="20" maxlength="17" readonly onChange="f_jscb(editform)"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">成本价</font></td>
              <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="cbenj" value="<%=cbenj%>" size="20" maxlength="17" readonly>
                  <font color="#0000CC"><strong>注意：成本价＝材料成本＋人工成本</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>对外报价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>材料费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="<%=clbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>人工费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="<%=rgbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font><font color="#0000CC">工程预算价</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" readonly>
                <font color="#0000CC"><strong>工程预算价＝材料费+主材费</strong></font></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>施工队报价</td>
              <td colspan="3" bgcolor="#CCCCFF"><input name="sgcbj" type="text" value="<%=sgcbj%>" size="20" maxlength="17"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>是否允许打折</td>
              <td bgcolor="#CCCCFF">
			  <%
 	cf.radioToken(out, "sfyxdz","Y+允许打折&N+否",sfyxdz);
%>				</td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>最低折扣</td>
              <td bgcolor="#CCCCFF"><input name="zdzk" type="text" value="<%=zdzk%>" size="10" maxlength="10" >
                (0到10之间)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">工艺材料简介</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="71" rows="8"><%=gycl%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="4"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="4"><%=bz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">修改人</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">修改时间</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="button" onClick="f_wh(editform)"  value="维护工料分析" name="wh" >
                  <input type="reset"  value="重输">
                  <input type="hidden" name="wherebjbbh"  value="<%=bjbbh%>" >
                  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherexmbh"  value="<%=xmbh%>" >
              <input type="hidden" name="wherebjjbbm"  value="<%=bjjbbm%>" ></td>
            </tr>
          </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jscb(FormName)//参数FormName:Form的名称
{
	var cbenj=FormName.clcb.value*1+FormName.rgcb.value*1;
	cbenj=round(cbenj,2);
	FormName.cbenj.value=cbenj;
}

function f_jsjg(FormName)//参数FormName:Form的名称
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jscb(FormName);
	f_jsjg(FormName);

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

	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工队报价]！");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工队报价"))) {
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
	if(	javaTrim(FormName.clbj)=="") {
		alert("请输入[材料费]！");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.rgbj)=="") {
		alert("请输入[人工费]！");
		FormName.rgbj.focus();
		return false;
	}
	if(!(isFloat(FormName.rgbj, "人工费"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyxdz)) {
		alert("请选择[是否可打折]！");
		FormName.sfyxdz[0].focus();
		return false;
	}
	if (FormName.sfyxdz[0].checked)
	{
		if(	javaTrim(FormName.zdzk)=="") {
			alert("请输入[最低折扣]！");
			FormName.zdzk.select();
			return false;
		}
		if(!(isFloat(FormName.zdzk, "最低折扣"))) {
			return false;
		}
		if (FormName.zdzk.value<0 || FormName.zdzk.value>10)
		{
			alert("错误！[最低折扣]应该在0和10之间！");
			FormName.zdzk.select();
			return false;
		}
	}
	else{
		FormName.zdzk.value=10;
	}


	if(!(isFloat(FormName.xh, "序号"))) {
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

	FormName.action="SaveEditBj_jzbjb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//参数FormName:Form的名称
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
		alert("请输入[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="EditBj_jzglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
