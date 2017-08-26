<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String dqbm=null;
String sftzk=null;
String sfyfq=null;
String sfydjfx=null;
String sfydyq=null;
String sfydxpzc=null;
String sfydgzc=null;
String sfyzcfk=null;
String sfykhpc=null;
String sfyjsgcyh=null;
String sfyyqf=null;
String sfxmbm1=null;
String sfxmbm2=null;
String sfxmbm3=null;
String sfyqtx1=null;
String qtx1mc=null;
String sfyqtx2=null;
String qtx2mc=null;
String sfyqtx3=null;
String qtx3mc=null;
String sfxsp=null;
String sfxsq=null;
String sfydxpzcyh=null;
String sfydgzcyh=null;
String sfyjszcyh=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sfydxpzcyh,sfydgzcyh,sfyjszcyh,fgsbh,dqbm,sftzk,sfyfq,sfydjfx,sfydyq,sfydxpzc,sfydgzc,sfyzcfk,sfykhpc,sfyjsgcyh,sfyyqf,sfxmbm1,sfxmbm2,sfxmbm3,sfyqtx1,qtx1mc,sfyqtx2,qtx2mc,sfyqtx3,qtx3mc,sfxsp,sfxsq ";
	ls_sql+=" from  dm_khjscsb";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfydxpzcyh=cf.fillNull(rs.getString("sfydxpzcyh"));
		sfydgzcyh=cf.fillNull(rs.getString("sfydgzcyh"));
		sfyjszcyh=cf.fillNull(rs.getString("sfyjszcyh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sftzk=cf.fillNull(rs.getString("sftzk"));
		sfyfq=cf.fillNull(rs.getString("sfyfq"));
		sfydjfx=cf.fillNull(rs.getString("sfydjfx"));
		sfydyq=cf.fillNull(rs.getString("sfydyq"));
		sfydxpzc=cf.fillNull(rs.getString("sfydxpzc"));
		sfydgzc=cf.fillNull(rs.getString("sfydgzc"));
		sfyzcfk=cf.fillNull(rs.getString("sfyzcfk"));
		sfykhpc=cf.fillNull(rs.getString("sfykhpc"));
		sfyjsgcyh=cf.fillNull(rs.getString("sfyjsgcyh"));
		sfyyqf=cf.fillNull(rs.getString("sfyyqf"));
		sfxmbm1=cf.fillNull(rs.getString("sfxmbm1"));
		sfxmbm2=cf.fillNull(rs.getString("sfxmbm2"));
		sfxmbm3=cf.fillNull(rs.getString("sfxmbm3"));
		sfyqtx1=cf.fillNull(rs.getString("sfyqtx1"));
		qtx1mc=cf.fillNull(rs.getString("qtx1mc"));
		sfyqtx2=cf.fillNull(rs.getString("sfyqtx2"));
		qtx2mc=cf.fillNull(rs.getString("qtx2mc"));
		sfyqtx3=cf.fillNull(rs.getString("sfyqtx3"));
		qtx3mc=cf.fillNull(rs.getString("qtx3mc"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		sfxsq=cf.fillNull(rs.getString("sfxsq"));
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
<form method="post" action="SaveEditDm_khjscsb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>允许结算调折扣</td>
  <td><%
	cf.radioToken(out, "sftzk","1+是&3+否",sftzk);
%></td>
  <td align="right"><span class="STYLE1">*</span>是否有结算工程优惠</td>
  <td><%
	cf.radioToken(out, "sfyjsgcyh","1+手工录入&2+自动获取&3+无",sfyjsgcyh);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否有返券</td>
  <td><%
	cf.radioToken(out, "sfyfq","1+手工录入&2+自动获取&3+无",sfyfq);
%></td>
  <td align="right"><span class="STYLE1">*</span>是否有订金返现</td>
  <td><%
	cf.radioToken(out, "sfydjfx","1+手工录入&2+自动获取&3+无",sfydjfx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有抵用券</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydyq","1+手工录入&2+自动获取&3+无",sfydyq);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有主材返款</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyzcfk","1+手工录入&2+自动获取&3+无",sfyzcfk);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它收费项目1</td>
  <td><select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc",sfxmbm1);
%>
  </select></td>
  <td align="right">其它收费项目2</td>
  <td><select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc",sfxmbm2);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它收费项目3</td>
  <td><select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc",sfxmbm3);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代销品主材</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydxpzc","1+手工录入&2+自动获取&3+无",sfydxpzc);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代销品主材优惠</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydxpzcyh","1+手工录入&2+自动获取&3+无",sfydxpzcyh);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代购主材</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydgzc","1+手工录入&2+自动获取&3+无",sfydgzc);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有代购主材优惠</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydgzcyh","1+手工录入&2+自动获取&3+无",sfydgzcyh);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有结算主材优惠</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyjszcyh","1+手工录入&2+自动获取&3+无",sfyjszcyh);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有客户赔偿款</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfykhpc","1+手工录入&2+自动获取&3+无",sfykhpc);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有其它项1</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx1","1+是&3+否",sfyqtx1);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有延期费</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyyqf","1+手工录入&2+自动获取&3+无",sfyyqf);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它项1名称</td>
  <td colspan="3"><input type="text" name="qtx1mc" size="73" maxlength="50"  value="<%=qtx1mc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有其它项2</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx2","1+是&3+否",sfyqtx2);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它项2名称</td>
  <td colspan="3"><input type="text" name="qtx2mc" size="73" maxlength="50"  value="<%=qtx2mc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否有其它项3</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx3","1+是&3+否",sfyqtx3);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">其它项3名称</td>
  <td colspan="3"><input type="text" name="qtx3mc" size="73" maxlength="50"  value="<%=qtx3mc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需审批</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsp","1+是&3+否",sfxsp);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否需结算授权</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsq","1+是&3+否",sfxsq);
%>  </td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftzk)) {
		alert("请选择[允许结算调折扣]！");
		FormName.sftzk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjsgcyh)) {
		alert("请选择[是否有结算工程优惠]！");
		FormName.sfyjsgcyh[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyfq)) {
		alert("请选择[是否有返券]！");
		FormName.sfyfq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydjfx)) {
		alert("请选择[是否有订金返现]！");
		FormName.sfydjfx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydyq)) {
		alert("请选择[是否有抵用券]！");
		FormName.sfydyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyzcfk)) {
		alert("请选择[是否有主材返款]！");
		FormName.sfyzcfk[0].focus();
		return false;
	}



	if(	!radioChecked(FormName.sfydxpzc)) {
		alert("请选择[是否有代销品主材]！");
		FormName.sfydxpzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydxpzcyh)) {
		alert("请选择[是否有代销品主材优惠]！");
		FormName.sfydxpzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzc)) {
		alert("请选择[是否有代购主材]！");
		FormName.sfydgzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzcyh)) {
		alert("请选择[是否有代购主材优惠]！");
		FormName.sfydgzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjszcyh)) {
		alert("请选择[是否有结算主材优惠]！");
		FormName.sfyjszcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfykhpc)) {
		alert("请选择[是否有客户赔偿款]！");
		FormName.sfykhpc[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyyqf)) {
		alert("请选择[是否有延期费]！");
		FormName.sfyyqf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqtx1)) {
		alert("请选择[是否有其它项1]！");
		FormName.sfyqtx1[0].focus();
		return false;
	}
	if (FormName.sfyqtx1[0].checked)
	{
		if(	javaTrim(FormName.qtx1mc)=="") {
			alert("请选择[其它项1名称]！");
			FormName.qtx1mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx1mc.value="";
	}

	if(	!radioChecked(FormName.sfyqtx2)) {
		alert("请选择[是否有其它项2]！");
		FormName.sfyqtx2[0].focus();
		return false;
	}
	if (FormName.sfyqtx2[0].checked)
	{
		if(	javaTrim(FormName.qtx2mc)=="") {
			alert("请选择[其它项1名称]！");
			FormName.qtx2mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx2mc.value="";
	}
	if(	!radioChecked(FormName.sfyqtx3)) {
		alert("请选择[是否有其它项3]！");
		FormName.sfyqtx3[0].focus();
		return false;
	}
	if (FormName.sfyqtx3[0].checked)
	{
		if(	javaTrim(FormName.qtx3mc)=="") {
			alert("请选择[其它项3名称]！");
			FormName.qtx3mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx3mc.value="";
	}
	if(	!radioChecked(FormName.sfxsp)) {
		alert("请选择[是否需审批]！");
		FormName.sfxsp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("请选择[是否需结算授权]！");
		FormName.sfxsq[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
