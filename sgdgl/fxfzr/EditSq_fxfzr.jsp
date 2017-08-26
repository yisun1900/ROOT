<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=null;
String sgd=null;
String fzrmc=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String lx=null;
String bz=null;
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String wherefzrmc=cf.getParameter(request,"fzrmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ssfgs,sgd,fzrmc,xb,dh,zz,sfzh,lx,bz ";
	ls_sql+=" from  sq_fxfzr";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (fzrmc='"+wherefzrmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		fzrmc=cf.fillNull(rs.getString("fzrmc"));
		xb=cf.fillNull(rs.getString("xb"));
		dh=cf.fillNull(rs.getString("dh"));
		zz=cf.fillNull(rs.getString("zz"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		lx=cf.fillNull(rs.getString("lx"));
		bz=cf.fillNull(rs.getString("bz"));
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
.STYLE1 {color: #CC0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSq_fxfzr.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>所属分公司</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>  </td>
  <td align="right" width="17%">施工队</td> 
  <td width="33%"><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <%
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc",sgd);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>分项负责人名称</td>
  <td><input type="text" name="fzrmc" size="20" maxlength="20"  value="<%=fzrmc%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">性别</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%>  </td>
  <td align="right" width="17%">电话</td> 
  <td width="33%"> 
    <input type="text" name="dh" size="20" maxlength="50"  value="<%=dh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">住址</td> 
  <td width="32%"> 
    <input type="text" name="zz" size="20" maxlength="100"  value="<%=zz%>" >  </td>
  <td align="right" width="17%">身份证号</td> 
  <td width="33%"> 
    <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>类型</td>
  <td colspan="3"><%
	cf.radioToken(out, "lx","1+木工&2+泥瓦工&3+水电工&4+油漆工",lx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="75" rows="2"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
<input type="hidden" name="wherefzrmc"  value="<%=wherefzrmc%>" >
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[所属施工队]！");
		FormName.sgd.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fzrmc)=="") {
		alert("请输入[分项负责人名称]！");
		FormName.fzrmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
