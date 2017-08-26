<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String gysbm=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;
String cwdm=null;
String kdlxtbz=null;
String lxdlsbcs=null;
String mmxgsj=null;
String mmsyzq=null;
String yxdlsbcs=null;
String sfsd=null;
String bz=null;
String gyslx=null;
String sfhz=null;
String cllx=null;

String yhzmc="";

String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cllx,gysbm,dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhkl,yhmc,cwdm,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd,bz,gyslx,sfhz ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cllx=cf.fillNull(rs.getString("cllx"));
		sfhz=cf.fillNull(rs.getString("sfhz"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		lxdlsbcs=cf.fillNull(rs.getString("lxdlsbcs"));
		mmxgsj=cf.fillNull(rs.getDate("mmxgsj"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		sfsd=cf.fillNull(rs.getString("sfsd"));
		bz=cf.fillNull(rs.getString("bz"));
		gyslx=cf.fillNull(rs.getString("gyslx"));
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
<form method="post" action="" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>供应商名称</td>
  <td colspan="3"><input type="text" name="gysmc" size="50" maxlength="50"  value="<%=gysmc%>" >
    <input type="hidden" name="gysbm" size="10" maxlength="8"  value="<%=gysbm%>" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否合作</td>
  <td>
<%
	cf.radioToken(out,"sfhz","Y+合作&N+不合作",sfhz);
%>  </td>
  <td align="right"><span class="STYLE1">*</span>供应材料类型</td>
  <td><%
	cf.radioToken(out,"cllx","1+主材&2+辅材&3+主材及辅材",cllx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>所属地区</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" width="19%"><span class="STYLE1">*</span>供应商类型</td> 
  <td width="31%"><select name="gyslx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+代销品供货商&1+库存供货商&2+共用供货商",gyslx);
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商地址</td> 
  <td colspan="3"><input type="text" name="gysdz" size="50" maxlength="100"  value="<%=gysdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商负责人</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20"  value="<%=gysfzr%>" >  </td>
  <td align="right" width="19%">供应商电话</td> 
  <td width="31%"> 
    <input type="text" name="gysdh" size="20" maxlength="50"  value="<%=gysdh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">财务代码</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20"  value="<%=cwdm%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商传真</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50"  value="<%=gyscz%>" >  </td>
  <td align="right" width="19%">EMail</td> 
  <td width="31%"> 
    <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><input type="text" name="bz" size="60" maxlength="100"  value="<%=bz%>" >  </td>
</tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">系统授权</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>可登陆系统标志</td>
              <td><%
	cf.radioToken(out,"kdlxtbz","Y+可登陆&N+不可登陆",kdlxtbz);
%></td>
              <td width="19%" rowspan="8" align="right"><font color="#FF0000">*</font>所属分公司</td>
              <td width="31%" rowspan="8"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="15" multiple>
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx='F0' and cxbz='N' order by cxbz,dwbh","select ssfgs from jxc_gyssqfgs where gysbm='"+wheregysbm+"'");
	}
	else{
		cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx='F0' and cxbz='N' and dqbm='"+dqbm+"' order by cxbz,dwbh","select ssfgs from jxc_gyssqfgs where gysbm='"+wheregysbm+"'");
	}
%>
              </select></td>
            </tr>
    <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">用户登录名</td> 
  <td width="32%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000FF">用户口令</font></td> 
  <td width="32%"><input type="text" name="yhkl" value="<%=yhkl%>" size="20" maxlength="50" readonly></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">用户名称</td>
  <td><input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否锁定</td>
  <td><%
	cf.radioToken(out,"sfsd","Y+已锁定&N+未锁定",sfsd);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">密码使用周期</td>
  <td><input type="text" name="mmsyzq" size="20" maxlength="8"  value="<%=mmsyzq%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">允许登陆失败次数</td> 
  <td width="32%"><input type="text" name="yxdlsbcs" size="20" maxlength="8"  value="<%=yxdlsbcs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">已经登陆失败次数</td> 
  <td width="32%"><input type="text" name="lxdlsbcs" size="20" maxlength="8"  value="<%=lxdlsbcs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">用户所属组</td>
  <td colspan="3"><%=yhzmc%></td>
</tr>
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <p>
	    <input type="button"  value="保存" onClick="f_do(editform)">
	    <input type="reset"  value="重输">
	    <input name="button2" type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="用户授权" >
	    <input type="button"  value="重置密码" onClick="editform.yhkl.value='111111'" name="button">
	    </p>
	  <p>
	    <input type="button"  value="子品牌供应商对照表" onClick="f_dzb(editform)" >
	    <input type="button"  value="录入联系人" onClick="f_lr(editform)" name="lr" >
	    <input type="button"  value="查看联系人" onClick="f_ck(editform)" name="ck" >
	  </p>
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhz)) {
		alert("请选择[是否合作]！");
		FormName.sfhz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cllx)) {
		alert("请选择[供应材料类型]！");
		FormName.cllx[0].focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[供应商名称]！");
		FormName.gysmc.focus();
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
	if(	!selectChecked(FormName.ssfgs)) {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
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

	FormName.target="";
	FormName.action="SaveEditJxc_gysxx.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_gyslxr.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jxc_gyslxrList.jsp";
	FormName.submit();
	return true;
}

function f_dzb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_ppgysdzb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
