<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sgd=null;
String jcr=null;
String jcsj=null;
String rcjclxbm=null;
String rcjcjgbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String lrbm=null;
String jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgdmc=null;
String zjxm=null;
String sgbz=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,sgd,jcr,jcsj,rcjclxbm,rcjcjgbm,lrr,lrsj,bz,lrbm ";
	ls_sql+=" from  kp_gdrcjcjl";
	ls_sql+=" where  (jcjlh='"+jcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		jcr=cf.fillNull(rs.getString("jcr"));
		jcsj=cf.fillNull(rs.getDate("jcsj"));
		rcjclxbm=cf.fillNull(rs.getString("rcjclxbm"));
		rcjcjgbm=cf.fillNull(rs.getString("rcjcjgbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,crm_khxx.sgd,sgdmc,zjxm,sgbz";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
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
<form method="post" action="" name="editform" target="_blank">
<div align="center">工地日常检查（记录号：<%=jcjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#000099">实开工日期</font> </td>
    <td><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">房屋地址</font></td>
    <td><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">设计师</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">施工队</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">质检姓名</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>检查人</td> 
  <td width="32%"><input type="text" name="jcr" size="20" maxlength="20"  value="<%=jcr%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>检查时间</td> 
  <td width="32%"><input type="text" name="jcsj" size="20" maxlength="10"  value="<%=jcsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>检查类型</td> 
  <td width="32%"><select name="rcjclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rcjclxbm,rcjclxmc from dm_rcjclxbm order by rcjclxbm",rcjclxbm);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>检查结果</td> 
  <td width="32%"><select name="rcjcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rcjcjgbm,rcjcjgmc from dm_rcjcjgbm order by rcjcjgbm",rcjcjgbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="jcjlh"  value="<%=jcjlh%>" >
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="hidden" name="sgd"  value="<%=sgd%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="button"  value="批量录入" onClick="window.open('PlInserKp_rcjcmx.jsp?jcjlh=<%=jcjlh%>')" name="pllr" >
      <input type="button"  value="上传照片" onClick="f_lrzp(editform)" name="lrzp" >
      <input type="button"  value="查看照片" onClick="f_ckzp(editform)" name="ckzp" >
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
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请输入[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jcr)=="") {
		alert("请输入[检查人]！");
		FormName.jcr.focus();
		return false;
	}
	if(	javaTrim(FormName.jcsj)=="") {
		alert("请输入[检查时间]！");
		FormName.jcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jcsj, "检查时间"))) {
		return false;
	}
	if(	javaTrim(FormName.rcjclxbm)=="") {
		alert("请选择[检查类型]！");
		FormName.rcjclxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjcjgbm)=="") {
		alert("请选择[检查结果]！");
		FormName.rcjcjgbm.focus();
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

	FormName.action="SaveEditKp_gdrcjcjl.jsp";
	FormName.submit();
	return true;
}
function f_lrzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_ckzp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jcjlh)=="") {
		alert("请输入[检查记录号]！");
		FormName.jcjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
