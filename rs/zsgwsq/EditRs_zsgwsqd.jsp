<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String dwbh=null;
String zsgwmc=null;

int zbrs=0;
String slrq=null;
String sqzbly=null;
String bmryjg=null;
String zbgwzn=null;
String zbgwxcfw=null;


String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String clzt=null;
String ztbm=null;

String shjl=null;
String shyj=null;
String spxh=null;
String shr=null;
String shsj=null;

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,dwbh,zsgwmc,zbrs,slrq,sqzbly,bmryjg,zbgwzn,zbgwxcfw,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh,shr,shsj ";
	ls_sql+=" from  rs_zsgwsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zsgwmc=cf.fillNull(rs.getString("zsgwmc"));
		zbrs=rs.getInt("zbrs");
		slrq=cf.fillNull(rs.getDate("slrq"));

		sqzbly=cf.fillNull(rs.getString("sqzbly"));
		bmryjg=cf.fillNull(rs.getString("bmryjg"));
		zbgwzn=cf.fillNull(rs.getString("zbgwzn"));
		zbgwxcfw=cf.fillNull(rs.getString("zbgwxcfw"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));

		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		spxh=cf.fillNull(rs.getString("spxh"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
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
<form method="post" action="SaveEditRs_zsgwsqd.jsp" name="editform">
  <div align="center">修改申请（申请序号：<%=sqxh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">申报公司</font></td>
      <td width="33%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>增设岗位部门</td>
      <td width="31%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fgsbh+"' and cxbz='N' order by dwbh",dwbh);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>增设岗位名称</td>
      <td colspan="3"> 
        <input type="text" name="zsgwmc" value="<%=zsgwmc%>" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>增补人数</td>
      <td width="33%"> 
        <input type="text" name="zbrs" value="<%=zbrs%>" size="20" maxlength="8">
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>设立日期</td>
      <td width="31%"> 
        <input type="text" name="slrq" value="<%=slrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>增补部门人员结构</td>
      <td colspan="3"> 
        <textarea name="bmryjg" cols="72" rows="3"><%=bmryjg%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>增补岗位职能</td>
      <td colspan="3"> 
        <textarea name="zbgwzn" cols="72" rows="3"><%=zbgwzn%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>增补岗位薪酬范围</td>
      <td colspan="3"> 
        <input type="text" name="zbgwxcfw" value="<%=zbgwxcfw%>" size="73" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>申请增补理由</td>
      <td colspan="3"> 
        <textarea name="sqzbly" cols="72" rows="3"><%=sqzbly%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="33%"> 
        <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td width="33%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>申请日期</td>
      <td width="31%"> 
        <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sqxh)=="") {
		alert("请输入[申请序号]！");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[申报公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[增设岗位部门]！");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zsgwmc)=="") {
		alert("请选择[增设岗位名称]！");
		FormName.zsgwmc.select();
		return false;
	}
	if(	javaTrim(FormName.zbrs)=="") {
		alert("请选择[增补人数]！");
		FormName.zbrs.select();
		return false;
	}
	if(!(isNumber(FormName.zbrs, "增补人数"))) {
		return false;
	}

	if(	javaTrim(FormName.slrq)=="") {
		alert("请选择[设立日期]！");
		FormName.slrq.select();
		return false;
	}
	if(!(isDatetime(FormName.slrq, "设立日期"))) {
		return false;
	}

	if(	javaTrim(FormName.bmryjg)=="") {
		alert("请选择[增补部门人员结构]！");
		FormName.bmryjg.select();
		return false;
	}
	if(	javaTrim(FormName.zbgwzn)=="") {
		alert("请选择[增补岗位职能]！");
		FormName.zbgwzn.select();
		return false;
	}
	if(	javaTrim(FormName.zbgwxcfw)=="") {
		alert("请选择[增补岗位薪酬范围]！");
		FormName.zbgwxcfw.select();
		return false;
	}

	if(	javaTrim(FormName.sqzbly)=="") {
		alert("请输入[申请增补理由]！");
		FormName.sqzbly.focus();
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
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
