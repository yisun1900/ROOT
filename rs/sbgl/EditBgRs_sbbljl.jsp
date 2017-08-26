<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String shbxh=null;
String sbblsj=null;
String ylbx=null;
String jylbx=null;
String sybx=null;
String gsby=null;
String syx=null;
String jbxdd=null;
double sbzrjs=0;
double sbzcjs=0;
String bxtjsj=null;
String bxzcsj=null;
double yjsxe=0;
double gsjbfe=0;
double grjbfe=0;
String sfjgjj=null;
double gsjgjj=0;
double grjgjj=0;
double jndbtc=0;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String lx=null;


String ygbh=null;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String rzsj=null;
String dwbh=null;
String ssfgs=null;
String bianma=null;
String yldhtbh=null;
String ldhtlx=null;
String ldhtqx=null;
String htksrq=null;
String htdqrq=null;

String getshbxh=null;
String getsbblsj=null;
String getylbx=null;
String getjylbx=null;
String getsybx=null;
String getgsby=null;
String getsyx=null;
String getjbxdd=null;
double getsbzrjs=0;
double getyjsxe=0;
double getgsjbfe=0;
double getgrjbfe=0;
double getjndbtc=0;
String ysbbljlh=null;
String getsfjgjj=null;


String sbbljlh=cf.GB2Uni(request.getParameter("sbbljlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select lx,ygbh,shbxh,sbblsj,ylbx,jylbx,sybx,gsby,syx,jbxdd,sbzrjs,sbzcjs,bxtjsj,bxzcsj,yjsxe,gsjbfe,grjbfe,sfjgjj,gsjgjj,grjgjj,lrr,lrsj,lrbm,bz,jndbtc ";
	ls_sql+=" from  rs_sbbljl";
	ls_sql+=" where  (sbbljlh='"+sbbljlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		shbxh=cf.fillNull(rs.getString("shbxh"));
		sbblsj=cf.fillNull(rs.getDate("sbblsj"));
		ylbx=cf.fillNull(rs.getString("ylbx"));
		jylbx=cf.fillNull(rs.getString("jylbx"));
		sybx=cf.fillNull(rs.getString("sybx"));
		gsby=cf.fillNull(rs.getString("gsby"));
		syx=cf.fillNull(rs.getString("syx"));
		jbxdd=cf.fillNull(rs.getString("jbxdd"));
		sbzrjs=rs.getDouble("sbzrjs");
		sbzcjs=rs.getDouble("sbzcjs");
		bxtjsj=cf.fillNull(rs.getDate("bxtjsj"));
		bxzcsj=cf.fillNull(rs.getDate("bxzcsj"));
		yjsxe=rs.getDouble("yjsxe");
		gsjbfe=rs.getDouble("gsjbfe");
		grjbfe=rs.getDouble("grjbfe");
		sfjgjj=cf.fillNull(rs.getString("sfjgjj"));
		gsjgjj=rs.getDouble("gsjgjj");
		grjgjj=rs.getDouble("grjgjj");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jndbtc=rs.getDouble("jndbtc");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,bianhao,sfzh,xzzwbm,rzsj,dwbh,ssfgs,ldhtbh,ldhtlx,ldhtqx,htksrq,htdqrq";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yldhtbh=cf.fillNull(rs.getString("ldhtbh"));
		ldhtlx=cf.fillNull(rs.getString("ldhtlx"));
		ldhtqx=cf.fillNull(rs.getString("ldhtqx"));
		htksrq=cf.fillNull(rs.getDate("htksrq"));
		htdqrq=cf.fillNull(rs.getDate("htdqrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select sbbljlh,shbxh,sbblsj,ylbx,jylbx,sybx,gsby,syx,jbxdd,sbzrjs,yjsxe,gsjbfe,grjbfe,jndbtc,sfjgjj";
	ls_sql+=" from  rs_ygsbxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysbbljlh=cf.fillNull(rs.getString("sbbljlh"));

		getshbxh=cf.fillNull(rs.getString("shbxh"));
		getsbblsj=cf.fillNull(rs.getDate("sbblsj"));
		getylbx=cf.fillNull(rs.getString("ylbx"));
		getjylbx=cf.fillNull(rs.getString("jylbx"));
		getsybx=cf.fillNull(rs.getString("sybx"));
		getgsby=cf.fillNull(rs.getString("gsby"));
		getsyx=cf.fillNull(rs.getString("syx"));
		getjbxdd=cf.fillNull(rs.getString("jbxdd"));
		getsbzrjs=rs.getDouble("sbzrjs");
		getyjsxe=rs.getDouble("yjsxe");
		getgsjbfe=rs.getDouble("gsjbfe");
		getgrjbfe=rs.getDouble("grjbfe");
		getjndbtc=rs.getDouble("jndbtc");
		getsfjgjj=cf.fillNull(rs.getString("sfjgjj"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBgRs_sbbljl.jsp" name="editform">
<div align="center">社保变更－维护（社保办理记录号：<%=sbbljlh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099">所属分公司</font></td>
      <td width="31%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%> </td>
      <td align="right" width="20%"><font color="#000099"></font><font color="#000099">所属部门</font></td>
      <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099"></font><font color="#000099">员工序号</font></td>
      <td width="31%"><%=ygbh%> </td>
      <td align="right" width="20%"><font color="#000099">工号</font></td>
      <td width="30%"><%=bianhao%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099"></font><font color="#000099">员工名称</font></td>
      <td width="31%"><%=yhmc%> </td>
      <td align="right" width="20%"><font color="#000099">身份证号</font></td>
      <td width="30%"><%=sfzh%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#000099">入职日期</font></td>
      <td width="31%"><%=rzsj%> </td>
      <td align="right" width="20%"><font color="#000099">行政职务</font></td>
      <td width="30%"><%=xzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>变更类型</td>
      <td width="31%"><%
	cf.radioToken(out, "lx","2+变更&3+停保&4+转出",lx);
%></td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>社会保险号</td>
      <td width="31%"> 
        <input type="text" name="shbxh" size="20" maxlength="20"  value="<%=shbxh%>" >      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>社保办理时间</td>
      <td width="30%"> 
        <input type="text" name="sbblsj" size="20" maxlength="10"  value="<%=sbblsj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>是否缴纳医疗保险</td>
      <td width="31%"> <%
	cf.radioToken(out, "ylbx","Y+是&N+否",ylbx);
%> </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>是否缴纳养老保险</td>
      <td width="30%"> <%
	cf.radioToken(out, "jylbx","Y+是&N+否",jylbx);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>是否缴纳失业保险</td>
      <td width="31%"> <%
	cf.radioToken(out, "sybx","Y+是&N+否",sybx);
%> </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>是否缴纳工伤保险</td>
      <td width="30%"> <%
	cf.radioToken(out, "gsby","Y+是&N+否",gsby);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>是否缴纳生育保险</td>
      <td width="31%"> <%
	cf.radioToken(out, "syx","Y+是&N+否",syx);
%> </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>缴保险地点</td>
      <td width="30%"> 
        <input type="text" name="jbxdd" size="20" maxlength="50"  value="<%=jbxdd%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>交纳基数</td>
      <td width="31%"> 
        <input type="text" name="yjsxe" size="20" maxlength="17"  value="<%=yjsxe%>" >      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>公司交保费额</td>
      <td width="31%"> 
        <input type="text" name="gsjbfe" size="20" maxlength="17"  value="<%=gsjbfe%>" >      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>个人交保费额</td>
      <td width="30%"> 
        <input type="text" name="grjbfe" size="20" maxlength="17"  value="<%=grjbfe%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>是否缴住房公积金</td>
      <td width="31%"><%
	cf.radioToken(out, "sfjgjj","Y+是&N+否",sfjgjj);
%> </td>
      <td align="right" width="20%"><font color="#CC0000">*</font>交纳大病统筹</td>
      <td width="30%"><input type="text" name="jndbtc" value="<%=jndbtc%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">公司交住房公积金</td>
      <td width="31%"> 
        <input type="text" name="gsjgjj" size="20" maxlength="17"  value="<%=gsjgjj%>" >      </td>
      <td align="right" width="20%">个人交住房公积金</td>
      <td width="30%"> 
        <input type="text" name="grjgjj" size="20" maxlength="17"  value="<%=grjgjj%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="19%">保险停缴时间</td>
      <td width="31%">
        <input type="text" name="bxtjsj" value="<%=bxtjsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="20%">保险转出时间</td>
      <td width="30%">
        <input type="text" name="bxzcsj" value="<%=bxzcsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>      </td>
      <td align="right" width="20%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="30%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="31%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sbbljlh"  value="<%=sbbljlh%>" >
          <input type="hidden" name="ygbh"  value="<%=ygbh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)">
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[变更类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if (FormName.lx[1].checked)
	{
		if(	javaTrim(FormName.bxtjsj)=="") {
			alert("请输入[保险停缴时间]！");
			FormName.bxtjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxtjsj, "保险停缴时间"))) {
			return false;
		}
	}
	else if (FormName.lx[2].checked)
	{
		if(	javaTrim(FormName.bxzcsj)=="") {
			alert("请输入[保险转出时间]！");
			FormName.bxzcsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxzcsj, "保险转出时间"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.sbbljlh)=="") {
		alert("请输入[社保办理记录号]！");
		FormName.sbbljlh.focus();
		return false;
	}
	if(	javaTrim(FormName.shbxh)=="") {
		alert("请输入[社会保险号]！");
		FormName.shbxh.focus();
		return false;
	}
	if(	javaTrim(FormName.sbblsj)=="") {
		alert("请输入[社保办理时间]！");
		FormName.sbblsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbblsj, "社保办理时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.ylbx)) {
		alert("请选择[是否缴纳医疗保险]！");
		FormName.ylbx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jylbx)) {
		alert("请选择[是否缴纳养老保险]！");
		FormName.jylbx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sybx)) {
		alert("请选择[是否缴纳失业保险]！");
		FormName.sybx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.gsby)) {
		alert("请选择[是否缴纳工伤保险]！");
		FormName.gsby[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.syx)) {
		alert("请选择[是否缴纳生育保险]！");
		FormName.syx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jbxdd)=="") {
		alert("请输入[缴保险地点]！");
		FormName.jbxdd.focus();
		return false;
	}

	if(	javaTrim(FormName.yjsxe)=="") {
		alert("请输入[交纳基数]！");
		FormName.yjsxe.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsxe, "交纳基数"))) {
		return false;
	}
	if(	javaTrim(FormName.gsjbfe)=="") {
		alert("请输入[公司交保费额]！");
		FormName.gsjbfe.focus();
		return false;
	}
	if(!(isFloat(FormName.gsjbfe, "公司交保费额"))) {
		return false;
	}
	if(	javaTrim(FormName.grjbfe)=="") {
		alert("请输入[个人交保费额]！");
		FormName.grjbfe.focus();
		return false;
	}
	if(!(isFloat(FormName.grjbfe, "个人交保费额"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfjgjj)) {
		alert("请选择[是否缴住房公积金]！");
		FormName.sfjgjj[0].focus();
		return false;
	}
	if(!(isFloat(FormName.gsjgjj, "公司交住房公积金"))) {
		return false;
	}
	if(!(isFloat(FormName.grjgjj, "个人交住房公积金"))) {
		return false;
	}
	if(	javaTrim(FormName.jndbtc)=="") {
		alert("请输入[交纳大病统筹]！");
		FormName.jndbtc.focus();
		return false;
	}
	if(!(isFloat(FormName.jndbtc, "交纳大病统筹"))) {
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
