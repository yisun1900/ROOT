<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String tcsjflbm=null;
String sfbxx=null;
String sfyxsj=null;
String jldw=null;
String bzsl=null;
String sfxzsl=null;


String sfyqxtpp=null;
String lrr=null;
String lrsj=null;

String sfkjm=null;
double yxjmzdsl=0;
double jmdj=0;
String sfkgh=null;
double khzdsl=0;
double ghzj=0;


String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wheretccpdlbm=cf.GB2Uni(request.getParameter("tccpdlbm"));
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,tccpdlbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfyqxtpp,jldw,bzsl,sfxzsl,lrr,lrsj ";
	ls_sql+=" ,sfkjm,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj";
	ls_sql+=" from  tc_tczcxm";
	ls_sql+=" where  (dqbm='"+wheredqbm+"')  and (bjjbbm='"+wherebjjbbm+"') and (tccpdlbm='"+wheretccpdlbm+"')  and (tccplbbm='"+wheretccplbbm+"')  ";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		khzdsl=rs.getDouble("khzdsl");
		ghzj=rs.getDouble("ghzj");

		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfyxsj=cf.fillNull(rs.getString("sfyxsj"));
		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		jldw=cf.fillNull(rs.getString("jldw"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<form method="post" action="SaveEditTc_tczcxm.jsp" name="editform" >
<div align="center">套餐主材项目－维护 </div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>地区</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
  </select></td>
    <td align="right"><font color="#FF0000">*</font>报价级别</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm",bjjbbm);
	%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>产品大类</td> 
  <td width="32%">
  <select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc",tccpdlbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>产品小类</td> 
  <td width="32%"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐升级分类</td> 
  <td width="32%"><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bdm_tcsjflbm order by tcsjflbm",tcsjflbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>是否必选项</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfbxx","Y+是&N+否",sfbxx);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>升级是否收费</td>
  <td><%
	cf.radioToken(out, "sfyxsj","Y+是&N+否",sfyxsj);
%></td>
  <td align="right"><font color="#FF0000">*</font>是否要求相同品牌</td>
  <td><%
	cf.radioToken(out, "sfyqxtpp","Y+是&N+否",sfyqxtpp);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否限制数量</td>
  <td><%
	cf.radioToken(out, "sfxzsl","1+可增项&2+不可增项&3+不控制",sfxzsl);
%></td>
  <td align="right">标准数量</td>
  <td width="32%"><input type="text" name="bzsl" size="20" maxlength="17"  value="<%=bzsl%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否可减免</td>
  <td><%
	cf.radioToken(out, "sfkjm","1+不可减免&2+可减免",sfkjm);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许减免最大数量</td>
  <td><input type="text" name="yxjmzdsl" value="<%=yxjmzdsl%>" size="20" maxlength="17" ></td>
  <td align="right">减免单价</td>
  <td><input type="text" name="jmdj" value="<%=jmdj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>是否可更换</td>
  <td><%
	cf.radioToken(out, "sfkgh","1+不可换&2+可换",sfkgh);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">可换最大数量</td>
  <td><input type="text" name="khzdsl" value="<%=khzdsl%>" size="20" maxlength="17" ></td>
  <td align="right">更换折价</td>
  <td><input type="text" name="ghzj" value="<%=ghzj%>" size="20" maxlength="17" ></td>
</tr>




<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
<input type="hidden" name="wheretccpdlbm"  value="<%=wheretccpdlbm%>" >
<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >

    <tr align="center"> 
      <td colspan="4"> 
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
</table>
</form>
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
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("请选择[产品大类]！");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("请选择[产品小类]！");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("请选择[是否必选项]！");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("请选择[升级是否收费]！");
		FormName.sfyxsj[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}



	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("请选择[是否要求相同品牌]！");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("请选择[是否限制数量]！");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked || FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("错误！数量可增项，必须输入[标准数量]！");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "标准数量"))) {
			return false;
		}
	}
	else
	{
		FormName.bzsl.value="";
	}

	if(	!radioChecked(FormName.sfkjm)) {
		alert("请选择[是否可减免]！");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("错误！必须输入[允许减免最大数量]！");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "允许减免最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("错误！必须输入[减免单价]！");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "减免单价"))) {
			return false;
		}
	}
	else
	{
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
	}

	if(	!radioChecked(FormName.sfkgh)) {
		alert("请选择[是否可更换]！");
		FormName.sfkgh[0].focus();
		return false;
	}
	if (FormName.sfkgh[1].checked)
	{
		if(	javaTrim(FormName.khzdsl)=="") {
			alert("错误！必须输入[可换最大数量]！");
			FormName.khzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.khzdsl, "可换最大数量"))) {
			return false;
		}
		if(	javaTrim(FormName.ghzj)=="") {
			alert("错误！必须输入[更换折价]！");
			FormName.ghzj.focus();
			return false;
		}
		if(!(isFloat(FormName.ghzj, "更换折价"))) {
			return false;
		}
	}
	else
	{
		FormName.khzdsl.value="";
		FormName.ghzj.value="";
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
