<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String dm=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");

String sqbh=null;
String zbye=null;
String zbzw=null;
String fgs=null;
String dwbh=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xb=null;
String hy=null;
String nl=null;
String xl=null;
String zy=null;
String wy=null;
String jsjjn=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String ztbm=null;
String bz=null;
String wheresqbh=cf.GB2Uni(request.getParameter("sqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sqbh,zbye,zbzw,fgs,dwbh,zbly,zbqt,xwdgsj,xb,hy,nl,xl,zy,wy,jsjjn,gzjy,gx,jn,qt,rygznr,ztbm,bz ";
	ls_sql+=" from  rs_ryzbsq";
	ls_sql+=" where  (sqbh='"+wheresqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqbh=cf.fillNull(rs.getString("sqbh"));
		zbye=cf.fillNull(rs.getString("zbye"));
		zbzw=cf.fillNull(rs.getString("zbzw"));
		fgs=cf.fillNull(rs.getString("fgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zbly=cf.fillNull(rs.getString("zbly"));
		zbqt=cf.fillNull(rs.getString("zbqt"));
		xwdgsj=cf.fillNull(rs.getDate("xwdgsj"));
		xb=cf.fillNull(rs.getString("xb"));
		hy=cf.fillNull(rs.getString("hy"));
		nl=cf.fillNull(rs.getString("nl"));
		xl=cf.fillNull(rs.getString("xl"));
		zy=cf.fillNull(rs.getString("zy"));
		wy=cf.fillNull(rs.getString("wy"));
		jsjjn=cf.fillNull(rs.getString("jsjjn"));
		gzjy=cf.fillNull(rs.getString("gzjy"));
		gx=cf.fillNull(rs.getString("gx"));
		jn=cf.fillNull(rs.getString("jn"));
		qt=cf.fillNull(rs.getString("qt"));
		rygznr=cf.fillNull(rs.getString("rygznr"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_ryzbsq.jsp" name="editform">
<div align="center">修改人员增补申请</div>
<div align="left" class="STYLE1">申请编号：<%=sqbh  %></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补员额</td> 
  <td width="35%"> 
    <input type="text" name="zbye" size="20" maxlength="8"  value="<%=zbye%>" >
  </td>
    <td align="right" width="15%">增补职务</td> 
  <td width="35%"> 
   <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm",zbzw);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fgs);
	}
%>
    </select>
  </td>
    <td align="right" width="15%">申请部门</td> 
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",dwbh);
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh",dwbh);
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dm+"'",dwbh);
	}
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补理由</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
<%
	cf.selectToken(out,"1+缺员补充&2+扩大编制&3+储备人力&4+其他",zbly);
%>
    </select>
  </td>
    <td align="right" width="15%">增补其他</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20"  value="<%=zbqt%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">希望到岗时间</td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" size="20" maxlength="10"  value="<%=xwdgsj%>" ondblclick="JSCalendar(this)">
  </td>
    <td align="right" width="15%">状态编码</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" size="20" maxlength="4"  value="<%=ztbm%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">性别</td> 
  <td width="35%"> 
    <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"0+不限制&1+男&2+女",xb);
%>
    </select>
  </td>
  <td align="right" width="15%">婚姻</td> 
  <td width="35%"> 
    <select name="hy" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"0+不限制&1+已婚&2+未婚",hy);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">年龄</td> 
  <td width="35%"> 
    <input type="text" name="nl" size="20" maxlength="20"  value="<%=nl%>" >
  </td>
  <td align="right" width="15%">学历</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"0+高中&1+大专&2+大学&3+硕士",xl);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">专业</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="40"  value="<%=zy%>" >
  </td>
  <td align="right" width="15%">外语</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="20"  value="<%=wy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计算机能力</td> 
  <td width="35%"> 
    <input type="text" name="jsjjn" size="20" maxlength="20"  value="<%=jsjjn%>" >
  </td>
  <td align="right" width="15%">工作经验</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="20"  value="<%=gzjy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">个性</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="60"  value="<%=gx%>" >
  </td>
  <td align="right" width="15%">技能</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="40"  value="<%=jn%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">其他</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200"  value="<%=qt%>" >
  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp; 
	
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">人员工作内容</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=rygznr%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>

<input type="hidden" name="wheresqbh"  value="<%=wheresqbh%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
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
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "4")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sqbh)=="") {
		alert("请输入[申请编号]！");
		FormName.sqbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zbye)=="") {
		alert("请输入[增补员额]！");
		FormName.zbye.focus();
		return false;
	}
	if(!(isNumber(FormName.zbye, "增补员额"))) {
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("请输入[增补职务]！");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.fgs)=="") {
		alert("请输入[所属分公司]！");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[申请部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zbly)=="") {
		alert("请选择[增补理由]！");
		FormName.zbly.focus();
		return false;
	}
	if(	javaTrim(FormName.xwdgsj)=="") {
		alert("请输入[希望到岗时间]！");
		FormName.xwdgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "希望到岗时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("请选择[性别]！");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.hy)=="") {
		alert("请选择[婚姻]！");
		FormName.hy.focus();
		return false;
	}
	if(	javaTrim(FormName.nl)=="") {
		alert("请输入[年龄]！");
		FormName.nl.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("请选择[学历]！");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("请输入[专业]！");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("请输入[外语]！");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.jsjjn)=="") {
		alert("请输入[计算机能力]！");
		FormName.jsjjn.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("请输入[工作经验]！");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("请输入[个性]！");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("请输入[技能]！");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("请输入[补充人员工作内容]！");
		FormName.rygznr.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请输入[状态编码]！");
		FormName.ztbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
