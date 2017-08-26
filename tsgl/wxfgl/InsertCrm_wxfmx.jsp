<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String hth=null;
String khbh=null;
String ysgd=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String slfsbm=null;
String dwbh=null;
String slbm=null;
String tsnr=null;
String ssfgs=null;

String sfksj="";
String sjbh="";
String fysm="";
double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double cjcdfy=0;
String gys="";
double sgdcdfy=0;
String sgd="";
double khcdfy=0;
double gscdfy=0;
double qtfcdfy=0;
String jsbz="";
String jsjlh="";
String lrr=null;
String lrsj=null;
String wxdah="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select tsnr,slbm,slfsbm,hth,crm_khxx.khbh,crm_khxx.sgd,khxm,fwdz,lxfs,crm_khxx.dwbh,crm_khxx.fgsbh";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ysgd=cf.fillNull(rs.getString("sgd"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select wxdah,sfksj,sjbh,fysm,wxrgf,wxcf,wxclf,wxzfy,cjcdfy,gys,sgdcdfy,sgd,khcdfy,gscdfy,qtfcdfy,jsbz,jsjlh,lrr,lrsj ";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxdah=cf.fillNull(rs.getString("wxdah"));
		sfksj=cf.fillNull(rs.getString("sfksj"));
		sjbh=cf.fillNull(rs.getString("sjbh"));
		fysm=cf.fillHtml(rs.getString("fysm"));
		wxrgf=rs.getDouble("wxrgf");
		wxcf=rs.getDouble("wxcf");
		wxclf=rs.getDouble("wxclf");
		wxzfy=rs.getDouble("wxzfy");
		cjcdfy=rs.getDouble("cjcdfy");
		gys=cf.fillNull(rs.getString("gys"));
		sgdcdfy=rs.getDouble("sgdcdfy");
		sgd=cf.fillNull(rs.getString("sgd"));
		khcdfy=rs.getDouble("khcdfy");
		gscdfy=rs.getDouble("gscdfy");
		qtfcdfy=rs.getDouble("qtfcdfy");
		jsbz=cf.fillNull(rs.getString("jsbz"));
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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

<html>
<head>
<title>录入维修费明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="" name="insertform" >
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="4" height="36"> 
        <div align="center">录入维修费明细（<font color="#006666">报修记录号：<%=tsjlh%></font>）</div>      </td>
    </tr>
    <tr bgcolor="#FFFFCC">
      <td align="right"><font color="#0000CC">客户编号</font></td>
      <td><%=khbh%> </td>
      <td align="right"><font color="#0000CC">合同号</font></td>
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
    <tr bgcolor="#99CCFF">
      <td height="30" colspan="4" align="center">发生费用</td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>维修人工费</td>
      <td width="31%"> 
      <input type="text" name="wxrgf" value="<%=wxrgf%>" size="20" maxlength="20" onChange="f_jsje(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0000">*</font>维修车费</td>
      <td width="31%"> 
      <input type="text" name="wxcf" value="<%=wxcf%>" size="20" maxlength="20" onChange="f_jsje(insertform)">      </td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>维修材料费</td>
      <td width="31%"> 
      <input type="text" name="wxclf" value="<%=wxclf%>" size="20" maxlength="20" onChange="f_jsje(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">维修总费用</font></td>
      <td width="31%"> 
      <input type="text" name="wxzfy" value="<%=wxzfy%>" size="20" maxlength="20" readonly>      </td>
    </tr>
    <tr bgcolor="#99CCFF">
      <td height="30" colspan="4" align="center">承担费用</td>
    </tr>
    
    <tr>
      <td align="right"><font color="#FF0000">*</font>是否开收据</td>
      <td><%
	cf.radioToken(out, "sfksj","Y+是&N+否",sfksj);
%></td>
      <td align="right">收据编号</td>
      <td><input type="text" name="sjbh" value="<%=sjbh%>" size="20" maxlength="50" ></td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>施工队承担费用</td>
      <td width="31%"> 
      <input type="text" name="sgdcdfy" value="<%=sgdcdfy%>" size="20" maxlength="20" >      </td>
      <td width="19%" align="right">承担费用施工队</td>
      <td width="31%">
		  <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
			<%
		   cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc",sgd);
			%>
		  </select>
	  </td>
    </tr>
    <tr>
      <td width="19%" align="right"><font color="#FF0000">*</font>客户承担费用</td>
      <td width="31%"><input type="text" name="khcdfy" value="<%=khcdfy%>" size="20" maxlength="20" ></td>
      <td width="19%" align="right"><font color="#FF0000">*</font>公司承担费用</td>
      <td width="31%"><input type="text" name="gscdfy" value="<%=gscdfy%>" size="20" maxlength="20" ></td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>厂家承担费用</td>
      <td><input type="text" name="cjcdfy" value="<%=cjcdfy%>" size="20" maxlength="20" ></td>
      <td align="right">承担费用厂家</td>
      <td><input type="text" name="gys" value="<%=gys%>" size="20" maxlength="50" ></td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>其它方承担费用</td>
      <td><input type="text" name="qtfcdfy" value="<%=qtfcdfy%>" size="20" maxlength="20" ></td>
      <td align="right">维修档案号</td>
      <td><input type="text" name="wxdah" value="<%=wxdah%>" size="20" maxlength="20" ></td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="31%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="31%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr> 
      <td width="19%" align="right"><font color="#FF0000">*</font>费用说明</td>
      <td colspan="3"> 
        <textarea name="fysm" cols="71" rows="6"><%=fysm%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
          <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
          <input type="hidden" name="khbh" value="<%=khbh%>" >
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//参数FormName:Form的名称
{
	var gk=FormName.wxrgf.value*1.0+FormName.wxcf.value*1.0+FormName.wxclf.value*1.0;
	gk=round(gk,2);
	FormName.wxzfy.value=gk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wxrgf)=="") {
		alert("请选择[维修人工费]！");
		FormName.wxrgf.select();
		return false;
	}
	if(!(isFloat(FormName.wxrgf, "维修人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxcf)=="") {
		alert("请选择[维修车费]！");
		FormName.wxcf.select();
		return false;
	}
	if(!(isFloat(FormName.wxcf, "维修车费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxclf)=="") {
		alert("请选择[维修材料费]！");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.wxclf, "维修材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.wxzfy)=="") {
		alert("请选择[维修总费用]！");
		FormName.wxzfy.select();
		return false;
	}
	if(!(isFloat(FormName.wxzfy, "维修总费用"))) {
		return false;
	}

	if (parseFloat(FormName.wxzfy.value)==0)
	{
		alert("错误[维修总费用]不能为0！");
		FormName.wxrgf.select();
		return false;
	}

	f_jsje(FormName);


	if(	!radioChecked(FormName.sfksj)) {
		alert("请选择[是否开收据]！");
		FormName.sfksj[0].focus();
		return false;
	}

	if (FormName.sfksj[0].checked)
	{
		if(	javaTrim(FormName.sjbh)=="") {
			alert("请选择[收据编号]！");
			FormName.sjbh.focus();
			return false;
		}
	}
	else{
		FormName.sjbh.value="";
	}

	if(	javaTrim(FormName.cjcdfy)=="") {
		alert("请选择[厂家承担费用]！");
		FormName.cjcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.cjcdfy, "厂家承担费用"))) {
		return false;
	}

	if (parseFloat(FormName.cjcdfy.value)!=0)
	{
		if(	javaTrim(FormName.gys)=="") {
			alert("错误！【厂家承担费用】不为0，请选择[承担费用厂家]！");
			FormName.gys.focus();
			return false;
		}
	}
	else{
		FormName.gys.value="";
	}


	if(	javaTrim(FormName.sgdcdfy)=="") {
		alert("请选择[施工队承担费用]！");
		FormName.sgdcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdcdfy, "施工队承担费用"))) {
		return false;
	}


	if (parseFloat(FormName.sgdcdfy.value)!=0)
	{
		if(	javaTrim(FormName.sgd)=="") {
			alert("错误！【施工队承担费用】不为0，请选择[承担费用施工队]！");
			FormName.sgd.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.khcdfy)=="") {
		alert("请选择[业主承担费用]！");
		FormName.khcdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.khcdfy, "业主承担费用"))) {
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


	var gk=FormName.cjcdfy.value*1.0+FormName.sgdcdfy.value*1.0+FormName.khcdfy.value*1.0+FormName.gscdfy.value*1.0+FormName.qtfcdfy.value*1.0;
	gk=round(gk,2);


	if (FormName.wxzfy.value!=gk)
	{
		alert("错误！费用分摊与总额不符，分摊费用加在一起为："+gk);
		FormName.sgdcdfy.focus();
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
	if(	javaTrim(FormName.fysm)=="") {
		alert("请输入[费用说明]！");
		FormName.fysm.focus();
		return false;
	}


	FormName.action="SaveInsertCrm_wxfmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
