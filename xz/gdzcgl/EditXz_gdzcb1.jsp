<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

%>
<%
String yhmc=(String)session.getAttribute("yhmc");

String gsbh=null;
String gdzcmc=null;
String bmbh=null;
String gdzcflbm=null;
String xh=null;
String pp=null;
String sl=null;
String grsj=null;
String grj=null;
String gzd=null;
String ygbh=null;
String bgr=null;
String dwbh=null;
String fgsbh=null;
String sfybf=null;
String lrr=null;
String lrsj=null;
String bz=null;
String yjsj=null;
String pz1=null;
String pz2=null;
String pz3=null;
String pz4=null;
String pz5=null;
String pz6=null;
String wheregsbh=cf.GB2Uni(request.getParameter("gsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yjsj,gsbh,gdzcmc,bmbh,gdzcflbm,xh,pp,sl,grsj,grj,gzd,ygbh,bgr,dwbh,fgsbh,sfybf,lrr,lrsj,bz,pz1,pz2,pz3,pz4,pz5,pz6 ";
	ls_sql+=" from  xz_gdzcb";
	ls_sql+=" where  (gsbh='"+wheregsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yjsj=cf.fillNull(rs.getDate("yjsj"));
		gsbh=cf.fillNull(rs.getString("gsbh"));
		gdzcmc=cf.fillNull(rs.getString("gdzcmc"));
		bmbh=cf.fillNull(rs.getString("bmbh"));
		gdzcflbm=cf.fillNull(rs.getString("gdzcflbm"));
		xh=cf.fillNull(rs.getString("xh"));
		pp=cf.fillNull(rs.getString("pp"));
		sl=cf.fillNull(rs.getString("sl"));
		grsj=cf.fillNull(rs.getDate("grsj"));
		grj=cf.fillNull(rs.getString("grj"));
		gzd=cf.fillNull(rs.getString("gzd"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bgr=cf.fillNull(rs.getString("bgr"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sfybf=cf.fillNull(rs.getString("sfybf"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		pz1=cf.fillNull(rs.getString("pz1"));
		pz2=cf.fillNull(rs.getString("pz2"));
		pz3=cf.fillNull(rs.getString("pz3"));
		pz4=cf.fillNull(rs.getString("pz4"));
		pz5=cf.fillNull(rs.getString("pz5"));
		pz6=cf.fillNull(rs.getString("pz6"));
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

String dwstr=cf.getItemData("select ygbh,yhmc,dwbh from sq_yhxx where   sfzszg in('Y','N') and ssfgs='"+fgsbh+"' order by dwbh,yhmc");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXz_gdzcb.jsp" name="insertform">
  <div align="center">请修改固定资产信息</div>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>固定资产编号</td>
      <td width="31%"> 
        <input type="text" name="gsbh" size="20" maxlength="20"  value="<%=gsbh%>" >
      </td>
      <td align="right" width="19%">部门内部编号</td>
      <td width="31%"> 
        <input type="text" name="bmbh" size="20" maxlength="20"  value="<%=bmbh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>固定资产名称</td>
      <td colspan="3"> 
        <input type="text" name="gdzcmc" size="73" maxlength="50"  value="<%=gdzcmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">固定资产分类</td>
      <td width="31%"> 
        <select name="gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm",gdzcflbm);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>是否已报废</td>
      <td width="31%"><%
	cf.radioToken(out, "sfybf","Y+是&N+否",sfybf);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">配置(CPU)</td>
      <td width="31%"> 
        <input type="text" name="pz1" value="<%=pz1%>" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(内存)</td>
      <td width="31%"> 
        <input type="text" name="pz2" value="<%=pz2%>" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">配置(硬盘)</td>
      <td width="31%"> 
        <input type="text" name="pz3" value="<%=pz3%>" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(主板)</td>
      <td width="31%"> 
        <input type="text" name="pz4" value="<%=pz4%>" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right">配置(显卡)</td>
      <td width="31%"> 
        <input type="text" name="pz5" value="<%=pz5%>" size="20" maxlength="50">
      </td>
      <td width="19%" align="right">配置(显示器)</td>
      <td width="31%"> 
        <input type="text" name="pz6" value="<%=pz6%>" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>品牌</td>
      <td width="31%"> 
        <input type="text" name="pp" size="20" maxlength="50"  value="<%=pp%>" >
      </td>
      <td align="right" rowspan="6" width="19%"><font color="#CC0000">*</font>资产所属分公司</td>
      <td rowspan="6" width="31%"> 
        <select name="ssfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","select fgsbh from xz_gdzcssfw where gsbh='"+wheregsbh+"'");
	}
	else{
		cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' OR dwlx in('A0')","select fgsbh from xz_gdzcssfw where gsbh='"+wheregsbh+"'");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">型号</td>
      <td width="31%"> 
        <input type="text" name="xh" size="20" maxlength="50"  value="<%=xh%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>数量</td>
      <td width="31%"> 
        <input type="text" name="sl" size="20" maxlength="8"  value="<%=sl%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">购入时间</td>
      <td width="31%"> 
        <input type="text" name="grsj" size="20" maxlength="10"  value="<%=grsj%>" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">购置地</td>
      <td width="31%"> 
        <input type="text" name="gzd" size="20" maxlength="50"  value="<%=gzd%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">购入价</td>
      <td width="31%"> 
        <input type="text" name="grj" size="20" maxlength="17"  value="<%=grj%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>当前保管分公司</td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(insertform)">
          <%
			if (yhjs.equals("A0") || yhjs.equals("A1"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh",fgsbh);
			}
			else{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
			}
			%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>当前保管部门</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changebm(insertform)">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where   dwlx in ('A0','A1','F0','F1','F2') and ssfgs='"+fgsbh+"' order by dwbh",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font>保管人</td>
      <td width="31%"> 
        <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="bgr.value=ygbh.options[ygbh.selectedIndex].text">
          <%
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where   sfzszg in('Y','N') and dwbh='"+dwbh+"' order by yhmc",ygbh);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>移交保管人时间</td>
      <td width="31%"> 
        <input type="text" name="yjsj" value="<%=yjsj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wheregsbh"  value="<%=wheregsbh%>" >
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="bgr" value="<%=bgr%>" >
          <input type="button"  value="保存" onClick="f_do(insertform)">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

//查询页面使用，增加下拉框内容
function addOption(field,str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	field.add(op1);
}

function changefgs(FormName)
{
	if(	javaTrim(FormName.fgsbh)=="") 
	{
		return false;
	}
	
	FormName.dwbh.length=1;
	FormName.ygbh.length=1;
	
	var str="InsertXz_gdzcbCx.jsp?fgsbh="+FormName.fgsbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changebm(FormName)
{
	if(	javaTrim(FormName.dwbh)=="") 
	{
		return false;
	}

	
	FormName.ygbh.length=1;
	
	var str="InsertXz_gdzcbCx.jsp?dwbh="+FormName.dwbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gsbh)=="") {
		alert("请输入[固定资产编号]！");
		FormName.gsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcmc)=="") {
		alert("请输入[固定资产名称]！");
		FormName.gdzcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcflbm)=="") {
		alert("请选择[固定资产分类]！");
		FormName.gdzcflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pp)=="") {
		alert("请输入[品牌]！");
		FormName.pp.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.grsj, "购入时间"))) {
		return false;
	}
	if(!(isFloat(FormName.grj, "购入价"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[当前保管部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[当前保管分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[保管人]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "保管人"))) {
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("请选择[移交保管人时间]！");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "移交保管人时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfybf)) {
		alert("请选择[是否已报废]！");
		FormName.sfybf[0].focus();
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
	if(	!selectChecked(FormName.ssfgsbh)) {
		alert("请输入[资产所属分公司]！");
		FormName.ssfgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
