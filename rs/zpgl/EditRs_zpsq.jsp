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

String fgs=null;
String sqbm=null;
String zbzw=null;
String zprs=null;
String zpfy=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xbyq=null;
String hyyq=null;
String nlyq=null;
String xl=null;
String zy=null;
String wy=null;
String jsjnl=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String bz=null;
String wherezpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgs,sqbm,zbzw,zprs,zpfy,zbly,zbqt,xwdgsj,xbyq,hyyq,nlyq,xl,zy,wy,jsjnl,gzjy,gx,jn,qt,rygznr,bz ";
	ls_sql+=" from  rs_zpsq";
	ls_sql+=" where  (zpsqbh='"+wherezpsqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgs=cf.fillNull(rs.getString("fgs"));
		sqbm=cf.fillNull(rs.getString("sqbm"));
		zbzw=cf.fillNull(rs.getString("zbzw"));
		zprs=cf.fillNull(rs.getString("zprs"));
		zpfy=cf.fillNull(rs.getString("zpfy"));
		zbly=cf.fillNull(rs.getString("zbly"));
		zbqt=cf.fillNull(rs.getString("zbqt"));
		xwdgsj=cf.fillNull(rs.getDate("xwdgsj"));
		xbyq=cf.fillNull(rs.getString("xbyq"));
		hyyq=cf.fillNull(rs.getString("hyyq"));
		nlyq=cf.fillNull(rs.getString("nlyq"));
		xl=cf.fillNull(rs.getString("xl"));
		zy=cf.fillNull(rs.getString("zy"));
		wy=cf.fillNull(rs.getString("wy"));
		jsjnl=cf.fillNull(rs.getString("jsjnl"));
		gzjy=cf.fillNull(rs.getString("gzjy"));
		gx=cf.fillNull(rs.getString("gx"));
		jn=cf.fillNull(rs.getString("jn"));
		qt=cf.fillNull(rs.getString("qt"));
		rygznr=cf.fillNull(rs.getString("rygznr"));
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
.STYLE2 {font-size: 12px}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_zpsq.jsp" name="editform">
<div align="center">修改招聘申请</div>
<div align="left" class="STYLE1"><span class="STYLE2">申请编号：<%=wherezpsqbh  %></span></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘分公司</td> 
  <td width="35%"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,sqbm,<%=dwstr%>)">
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
    <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",sqbm);
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh",sqbm);
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dm+"'",sqbm);
	}
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补职务</td> 
  <td width="35%"> 
    <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm",zbzw);
%>
    </select>
  </td>
   <td align="right" width="15%">增补员额</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8"  value="<%=zprs%>" >
  </td> 
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9"  value="<%=zpfy%>" >
  </td>
  <td align="right" width="15%">希望到岗时间</td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" size="20" maxlength="10"  value="<%=xwdgsj%>" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补理由</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
    <option value=""></option>
<%
	cf.selectToken(out,"1+缺员补充&2+扩大编制&3+储备人力&0+其他",zbly);
%>
    </select>
  </td>
  <td align="right" width="15%">增补其他</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20"  value="<%=zbqt%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">性别要求</td> 
  <td width="35%"> 
    <select name="xbyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+不限&1+男&2+女",xbyq);
%>
    </select>
  </td>
  <td align="right" width="15%">婚姻要求</td> 
  <td width="35%"> 
    <select name="hyyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+不限&1+已婚&2+未婚",hyyq);
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">年龄要求</td> 
  <td width="35%"> 
    <input type="text" name="nlyq" size="20" maxlength="50"  value="<%=nlyq%>" >
  </td>
  <td align="right" width="15%">工作经验要求</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="50"  value="<%=gzjy%>" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">学历要求</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+高中&1+大专&2+大学&3+硕士",xl);
%>
    </select>
  </td>
  <td align="right" width="15%">专业要求</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="50"  value="<%=zy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">外语能力要求</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="50"  value="<%=wy%>" >
  </td>
  <td align="right" width="15%">计算机能力要求</td> 
  <td width="35%"> 
    <input type="text" name="jsjnl" size="20" maxlength="50"  value="<%=jsjnl%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">个性要求</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="50"  value="<%=gx%>" >
  </td>
  <td align="right" width="15%">技能要求</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="50"  value="<%=jn%>" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">

  <td align="right" width="15%">其他要求</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200"  value="<%=qt%>" >
  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">补充人员工作内容</td> 
  <td width="35%" colspan="3"> 
    <textarea name="rygznr" cols="72" rows=""><%=rygznr%></textarea>
  </td>
 </tr> 
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="72" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpsqbh"  value="<%=wherezpsqbh%>" >
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "0")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("请输入[招聘分公司]！");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sqbm)=="") {
		alert("请输入[申请部门]！");
		FormName.sqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("请选择[增补职务]！");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zprs)=="") {
		alert("请输入[增补员额]！");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "增补员额"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("请输入[招聘费用]！");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "招聘费用"))) {
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
	if(	javaTrim(FormName.xbyq)=="") {
		alert("请选择[性别要求]！");
		FormName.xbyq.focus();
		return false;
	}
	if(	javaTrim(FormName.hyyq)=="") {
		alert("请选择[婚姻要求]！");
		FormName.hyyq.focus();
		return false;
	}
	if(	javaTrim(FormName.nlyq)=="") {
		alert("请输入[年龄要求]！");
		FormName.nlyq.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("请选择[学历要求]！");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("请输入[专业要求]！");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("请输入[外语能力要求]！");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.jsjnl)=="") {
		alert("请输入[计算机能力要求]！");
		FormName.jsjnl.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("请输入[工作经验要求]！");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("请输入[个性要求]！");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("请输入[技能要求]！");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.qt)=="") {
		alert("请输入[其他要求]！");
		FormName.qt.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("请输入[补充人员工作内容]！");
		FormName.rygznr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
