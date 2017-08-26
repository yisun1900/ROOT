<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>拆分报价－修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");

String yhmc=(String)session.getAttribute("yhmc");

String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
double sgdbj=0;
String gycl=null;
String xh=null;
String sfbxx=null;
String glxmbh=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;

double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;

String xmflbm=null;
String sfyxdz=null;
double sgcbj=0;
double zdzk=0;

String bjbbh=cf.GB2Uni(cf.getParameter(request,"bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=request.getParameter("xmbh");
String fxmbh=request.getParameter("fxmbh");
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcf,shf,ysf,qtf,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,bj,clbj,rgbj,jxbj,gycl,flmcgg,bz";
	ls_sql+=" from  bj_jzbjcfb";
	ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and fxmbh='"+fxmbh+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{

		shf=rs.getDouble("shf");
		ysf=rs.getDouble("ysf");
		qtf=rs.getDouble("qtf");
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		bj=rs.getDouble("bj");
		clbj=rs.getDouble("clbj");
		rgbj=rs.getDouble("rgbj");
		jxbj=rs.getDouble("jxbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">拆分报价－修改</div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">报价版本号</font></td>
              <td colspan="3"><input type="text" name="bjbbh" value="<%=bjbbh%>" size="73" maxlength="50" readonly>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000CC">地区</font></td>
              <td width="34%">
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
              </select>              </td>
              <td width="16%" align="right"><font color="#CC0000">*</font><font color="#0000CC">报价级别</font></td>
              <td width="34%">
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#CC0000">*</font><font color="#0000CC">父项目编号</font></td>
              <td bgcolor="#FFFFFF"><input type="text" name="fxmbh" size="20" maxlength="16"  value="<%=fxmbh%>" readonly></td>
              <td align="right"><font color="#CC0000">*</font>项目编号</td>
              <td><input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>项目大类              </td>
              <td width="34%" bgcolor="#FFFFFF"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
              </select>              </td>
              <td width="16%" align="right"> 
                <font color="#CC0000">*</font>项目小类              </td>
              <td width="34%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>项目名称</td>
              <td colspan="3"  > 
                <input type="text" name="xmmc" value="<%=xmmc%>" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" ><font color="#CC0000">*</font>计量单位</td>
              <td width="34%" ><select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%>
              </select></td>
              <td width="16%" align="right" >饰面</td>
              <td width="34%" ><select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#CCCCFF"><strong>对外报价</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>辅材费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="clbj" value="<%=clbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>主材费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>人工费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="rgbj" value="<%=rgbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>运输费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="ysf" value="<%=ysf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>机械费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="jxbj" value="<%=jxbj%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#FF0000">*</font>损耗费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="shf" value="<%=shf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>其它费</td>
              <td bgcolor="#CCCCFF"><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" onChange="f_jsjg(editform)"></td>
              <td bgcolor="#CCCCFF" align="right">&nbsp;</td>
              <td bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font><font color="#0000CC">工程预算价</font></td>
              <td colspan="3" bgcolor="#CCCCFF"><input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" readonly>
                  <font color="#0000CC"><strong>工程预算价＝辅材费+主材费＋人工费＋运输费＋机械费＋损耗费＋其它费</strong></font></td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" >工艺材料简介</td>
              <td colspan="3"  > 
                <textarea name="gycl" cols="71" rows="3"><%=gycl%></textarea>              </td>
            </tr>
             <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><textarea name="flmcgg" cols="71" rows="2"><%=flmcgg%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea>              </td>
            </tr>
           <tr align="center"> 
             <td colspan="4"> 
                <input type="hidden" name="wherexmbh" value="<%=xmbh%>" >
                <input type="hidden" name="lrr" value="<%=yhmc%>" >
                <input type="hidden" name="lrsj" value="<%=cf.today()%>" >
              <input type="button"  value="存盘" onClick="f_do(editform)" name="bc">
              <input name="reset" type="reset"  value="重输"></td>
            </tr>
        </table>
</form>    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
 
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var bj=FormName.clbj.value*1+FormName.rgbj.value*1+FormName.jxbj.value*1+FormName.zcf.value*1+FormName.shf.value*1+FormName.ysf.value*1+FormName.qtf.value*1;
	bj=round(bj,2);
	FormName.bj.value=bj;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

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


	if(	javaTrim(FormName.fxmbh)=="") {
		alert("请输入[父项目编号]！");
		FormName.fxmbh.focus();
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
	

	if(	javaTrim(FormName.clbj)=="") {
		alert("请输入[辅材费]！");
		FormName.clbj.focus();
		return false;
	}
	if(!(isFloat(FormName.clbj, "辅材费"))) {
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
	if(	javaTrim(FormName.jxbj)=="") {
		alert("请输入[机械费]！");
		FormName.jxbj.focus();
		return false;
	}
	if(!(isFloat(FormName.jxbj, "机械费"))) {
		return false;
	}
	if(	javaTrim(FormName.zcf)=="") {
		alert("请输入[主材费]！");
		FormName.zcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zcf, "主材费"))) {
		return false;
	}
	if(	javaTrim(FormName.shf)=="") {
		alert("请输入[损耗费]！");
		FormName.shf.focus();
		return false;
	}
	if(!(isFloat(FormName.shf, "损耗费"))) {
		return false;
	}
	if(	javaTrim(FormName.ysf)=="") {
		alert("请输入[运输费]！");
		FormName.ysf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysf, "运输费"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[其它费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "其它费"))) {
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


	FormName.action="SaveEditBj_jzbjcfb.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
