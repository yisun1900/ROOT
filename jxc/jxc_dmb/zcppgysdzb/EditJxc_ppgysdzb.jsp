<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String gysbm=null;
String gysmc=null;


String yhdlm=null;
String yhkl=null;
String yhmc=null;
String kdlxtbz=null;
String lxdlsbcs=null;
String mmxgsj=null;
String mmsyzq=null;
String yxdlsbcs=null;
String sfsd=null;


String yhzmc="";

String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String sfxcl=null;
double tcycf=0;
String sfkgtcsl=null;


String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,gysbm,gysmc,yhdlm,yhkl,yhmc,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd,sfyyh,yhkssj,yhjzsj,yhnr,sfkgtcsl,sfxcl,tcycf";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		lxdlsbcs=cf.fillNull(rs.getString("lxdlsbcs"));
		mmxgsj=cf.fillNull(rs.getDate("mmxgsj"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		sfsd=cf.fillNull(rs.getString("sfsd"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		sfkgtcsl=cf.fillNull(rs.getString("sfkgtcsl"));
		sfxcl=cf.fillNull(rs.getString("sfxcl"));
		tcycf=rs.getDouble("tcycf");
	}
	rs.close();
	ps.close();

	ls_sql="select yhzmc ";
	ls_sql+=" from  sq_yhssz,sq_yhz";
	ls_sql+=" where sq_yhssz.yhdlm='"+yhdlm+"' and sq_yhssz.yhzbh =sq_yhz.yhzbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yhzmc+=cf.fillNull(rs.getString("yhzmc"))+"；";
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_ppgysdzb.jsp" name="editform">
<div align="center">主材－子品牌供应商对照表修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>分公司</td>
  <td width="31%" >
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td width="18%" >&nbsp;</td>
  <td width="34%" >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>子品牌</td> 
  <td colspan="3" > 
    <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX">
   <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where ppbm='"+ppbm+"'",ppbm);
%>
  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>供应商</td>
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）') from jxc_gysxx where jxc_gysxx.cllx='1'  and dqbm in(select dqbm from sq_dwxx where dwbh='"+ssfgs+"') order by sfhz desc,gysmc",gysbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>是否需测量</td>
  <td><%
	cf.radioToken(out, "sfxcl","Y+需要&N+否",sfxcl);
%></td>
  <td align="right">是否可改套餐数量</td>
  <td><%
	cf.radioToken(out, "sfkgtcsl","Y+可以&N+否",sfkgtcsl);
%></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>是否有优惠</td>
  <td><%
	cf.radioToken(out, "sfyyh","N+否&Y+是",sfyyh);
%>  </td>
  <td align="right">套餐远程费</td>
  <td><input type="text" name="tcycf" value="<%=tcycf%>" size="20" maxlength="16"  ></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">优惠开始时间</td>
  <td><input type="text" name="yhkssj" value="<%=yhkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">优惠截至时间</td>
  <td><input type="text" name="yhjzsj" value="<%=yhjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">优惠内容</td>
  <td colspan="3"><textarea name="yhnr" cols="70" rows="3"><%=yhnr%></textarea>  </td>
</tr>



            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">系统授权</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>可登陆系统标志</td>
              <td><%
	cf.radioToken(out,"kdlxtbz","Y+可登陆&N+不可登陆",kdlxtbz);
%></td>
              <td width="18%" align="right">用户名称</td>
              <td width="34%"><input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" ></td>
            </tr>
    <tr bgcolor="#FFFFFF">
  <td align="right" width="17%">用户登录名</td> 
  <td width="31%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >  </td>
  <td width="18%" align="right"><font color="#0000FF">用户口令</font></td>
    <td width="34%"><input type="text" name="yhkl" value="<%=yhkl%>" size="20" maxlength="50" readonly>
	<BR><%=cf.makejm(yhkl)%></td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否锁定</td>
  <td><%
	cf.radioToken(out,"sfsd","Y+已锁定&N+未锁定",sfsd);
%></td>
  <td width="18%" align="right">密码使用周期</td>
  <td width="34%"><input type="text" name="mmsyzq" size="20" maxlength="8"  value="<%=mmsyzq%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">允许登陆失败次数</td> 
  <td width="31%"><input type="text" name="yxdlsbcs" size="20" maxlength="8"  value="<%=yxdlsbcs%>" ></td>
  <td width="18%" align="right">已经登陆失败次数</td>
  <td width="34%"><input type="text" name="lxdlsbcs" size="20" maxlength="8"  value="<%=lxdlsbcs%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">用户所属组</td>
  <td colspan="3"><%=yhzmc%></td>
</tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
    <tr> 
      <td colspan="6" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	  <input name="button2" type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="用户授权" >
      <input type="button"  value="重置密码" onClick="editform.yhkl.value='111111'" name="button">
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[子品牌编码]！");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "子品牌编码"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}

	
	
	if(!(isNumber(FormName.lxdlsbcs, "已经登陆失败次数"))) {
		return false;
	}
	if(!(isNumber(FormName.mmsyzq, "密码使用周期"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "允许登陆失败次数"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfsd)) {
		alert("请选择[是否锁定]！");
		FormName.sfsd[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("请选择[可登陆系统标志]！");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(FormName.kdlxtbz[0].checked) 
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("请输入[用户登录名]！");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("请选择[用户口令]！");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("请选择[用户名称]！");
			FormName.yhmc.focus();
			return false;
		}
	}
	else{
		FormName.yhdlm.value="";
		FormName.yhkl.value="";
		FormName.yhmc.value="";
	}
	
	
	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("请输入[优惠开始时间]！");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "优惠开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("请输入[优惠截至时间]！");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "优惠截至时间"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[优惠开始时间]不能大于[优惠截至时间]！");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}


	if(!(isFloat(FormName.tcycf, "套餐远程费"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxcl)) {
		alert("请选择[是否需测量]！");
		FormName.sfxcl[0].focus();
		return false;
	}
	
	
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
