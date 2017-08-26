<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String lrxh=cf.GB2Uni(request.getParameter("lrxh"));

String tsjlh=null;

double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double zrfcdfy=0;
double sqyzfy=0;
double gscdfy=0;
double qtfcdfy=0;
String sfksj=null;
String fysm=null;
String jsbz=null;


String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String slfsbm=null;
String dwbh=null;
String slbm=null;
String tsnr=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select tsjlh,wxrgf,wxcf,wxclf,wxzfy,zrfcdfy,sqyzfy,gscdfy,qtfcdfy,sfksj,jsbz,jsjlh,lrr,lrsj,fysm ";
	ls_sql+=" from  crm_wxfmx ";
	ls_sql+=" where lrxh="+lrxh;
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		wxrgf=rs.getDouble("wxrgf");
		wxcf=rs.getDouble("wxcf");
		wxclf=rs.getDouble("wxclf");
		wxzfy=rs.getDouble("wxzfy");
		wxrgf=rs.getDouble("wxrgf");
		zrfcdfy=rs.getDouble("zrfcdfy");
		sqyzfy=rs.getDouble("sqyzfy");
		gscdfy=rs.getDouble("gscdfy");
		qtfcdfy=rs.getDouble("qtfcdfy");
		sfksj=cf.fillNull(rs.getString("sfksj"));
		fysm=cf.fillNull(rs.getString("fysm"));
		jsbz=cf.fillNull(rs.getString("jsbz"));

	}
	rs.close();

	if (jsbz.equals("Y"))
	{
		out.println("错误！已结算，不能再修改");
		return;
	}


	ls_sql="select tsnr,slbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,crm_khxx.dwbh";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<html>
<head>
<title>修改维修费明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="" name="editform" >
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="4" height="36"> 
        <div align="center">修改维修费明细（<font color="#006666">报修记录号：<%=tsjlh%></font>）</div>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td><div align="right"><font color="#0000CC">客户编号</font></div></td>
      <td><%=khbh%> </td>
      <td><div align="right"><font color="#0000CC">合同号</font></div></td>
      <td><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0000CC">客户姓名</font></td>
      <td><%=khxm%>（<%=lxfs%>） </td>
      <td align="right"><font color="#0000CC">签约店面</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">投诉来源</td>
      <td><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm,true);
%>      </td>
      <td align="right"><font color="#660033">录入部门</font></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">报修内容</td>
      <td colspan="3"><%=tsnr%> </td>
    </tr>
    <tr> 
      <td width="19%" align="right">维修人工费</td>
      <td width="31%"> 
      <input type="text" name="wxrgf" value="<%=wxrgf%>" size="20" maxlength="20" onchange="f_js(editform)">      </td>
      <td width="21%" align="right">维修车费</td>
      <td width="29%"> 
      <input type="text" name="wxcf" value="<%=wxcf%>" size="20" maxlength="20" onchange="f_js(editform)">      </td>
    </tr>
    <tr> 
      <td width="19%" align="right">维修材料费</td>
      <td width="31%"> 
      <input type="text" name="wxclf" value="<%=wxclf%>" size="20" maxlength="20" onchange="f_js(editform)">      </td>
      <td width="21%" align="right">维修总费用</td>
      <td width="29%"> 
      <input type="text" name="wxzfy" value="<%=wxzfy%>" size="20" maxlength="20" >      </td>
    </tr>
    <tr> 
      <td width="19%" align="right">施工队承担费用</td>
      <td width="31%"> 
      <input type="text" name="zrfcdfy" value="<%=zrfcdfy%>" size="20" maxlength="20" >      </td>
      <td width="21%" align="right">业主承担费用</td>
      <td width="29%">
      <input type="text" name="sqyzfy" value="<%=sqyzfy%>" size="20" maxlength="20" >      </td>
    </tr>
    <tr>
      <td width="19%" align="right">公司承担费用</td>
      <td width="31%">
      <input type="text" name="gscdfy" value="<%=gscdfy%>" size="20" maxlength="20" >      </td>
      <td width="21%" align="right">其它方承担费用</td>
      <td width="29%">
      <input type="text" name="qtfcdfy" value="<%=qtfcdfy%>" size="20" maxlength="20" >      </td>
    </tr>
    <tr>
      <td align="right">是否开收据</td>
      <td><%
	cf.radioToken(out, "sfksj","Y+是&N+否",sfksj);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td width="19%" align="right">录入人</td>
      <td width="31%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
      <td width="21%" align="right">录入时间</td>
      <td width="29%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td width="19%" align="right">费用说明</td>
      <td colspan="3"> 
        <textarea name="fysm" cols="71" rows="3"><%=fysm%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"> 
          <input type="hidden" name="lrxh" value="<%=lrxh%>" >
          <input type="button"  value="存盘" onClick="f_do(editform)">
          <input type="reset"  value="重输" name="reset">
        </div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_js(FormName)//参数FormName:Form的名称
{
	var gk=FormName.wxrgf.value*1.0+FormName.wxcf.value*1.0+FormName.wxclf.value*1.0;
	gk=round(gk,2);
	FormName.wxzfy.value=gk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wxrgf)=="") {
		alert("请选择[维修人工费]！");
		FormName.wxrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.wxrgf, "维修人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxcf)=="") {
		alert("请选择[维修车费]！");
		FormName.wxcf.focus();
		return false;
	}
	if(!(isFloat(FormName.wxcf, "维修车费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxclf)=="") {
		alert("请选择[维修材料费]！");
		FormName.wxclf.focus();
		return false;
	}
	if(!(isFloat(FormName.wxclf, "维修材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxzfy)=="") {
		alert("请选择[维修总费用]！");
		FormName.wxzfy.focus();
		return false;
	}
	if(!(isFloat(FormName.wxzfy, "维修总费用"))) {
		return false;
	}
	if(	javaTrim(FormName.zrfcdfy)=="") {
		alert("请选择[施工队承担费用]！");
		FormName.zrfcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zrfcdfy, "施工队承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sqyzfy)=="") {
		alert("请选择[业主承担费用]！");
		FormName.sqyzfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sqyzfy, "业主承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gscdfy)=="") {
		alert("请选择[公司承担费用]！");
		FormName.gscdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gscdfy, "公司承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfcdfy)=="") {
		alert("请选择[其它方承担费用]！");
		FormName.qtfcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfcdfy, "其它方承担费用"))) {
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

	f_js(FormName);

	var gk=FormName.zrfcdfy.value*1.0+FormName.sqyzfy.value*1.0+FormName.gscdfy.value*1.0+FormName.qtfcdfy.value*1.0;
	gk=round(gk,2);

	if (FormName.wxzfy.value!=gk)
	{
		alert("错误！费用分摊与总额不符，分摊费用加在一起为："+gk);
		FormName.zrfcdfy.focus();
		return false;
	}

	FormName.action="SaveEditCrm_wxfmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
