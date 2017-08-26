<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String yhmc=(String)session.getAttribute("yhmc");

	String pxlx=null;
	String skxs=null;
	String kclx=null;
	String pxkc=null;
	String kcnr=null;
	String pxcd=null;
	String pxrs=null;
	String pxfy=null;
	String pxjs=null;
	String bz=null;
	String gcrs=null;
	String zcrs=null;
	String jcrs=null;
	String pxkssj=null;
	String pxjssj=null;
	String pxjhbh=null;

	String wherepxmxbh=cf.GB2Uni(request.getParameter("pxmxbh"));
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();
		ls_sql="select skxs,kclx,pxkc,kcnr,pxcd,pxrs,pxfy,pxjs,bz,pxlx,gcrs,zcrs,jcrs,pxkssj,pxjssj,pxjhbh ";
		ls_sql+=" from  rs_pxjhmx";
		ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			skxs=cf.fillNull(rs.getString("skxs"));
			kclx=cf.fillNull(rs.getString("kclx"));
			pxkc=cf.fillNull(rs.getString("pxkc"));
			kcnr=cf.fillNull(rs.getString("kcnr"));
			pxcd=cf.fillNull(rs.getString("pxcd"));
			pxrs=cf.fillNull(rs.getString("pxrs"));
			pxfy=cf.fillNull(rs.getString("pxfy"));
			pxjs=cf.fillNull(rs.getString("pxjs"));
			bz=cf.fillNull(rs.getString("bz"));
			pxlx=cf.fillNull(rs.getString("pxlx"));
			gcrs=cf.fillNull(rs.getString("gcrs"));
			zcrs=cf.fillNull(rs.getString("zcrs"));
			jcrs=cf.fillNull(rs.getString("jcrs"));
			pxkssj=cf.fillNull(rs.getDate("pxkssj"));
			pxjssj=cf.fillNull(rs.getDate("pxjssj"));
			pxjhbh=cf.fillNull(rs.getString("pxjhbh"));
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
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_pxzjmx.jsp" name="insertform" target="_blank">
<div align="center">培训总结明细（计划明细编号:<%=wherepxmxbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">授课形式</td> 
  <td width="35%"> 
    <select name="skxs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select skxs,skxsmc from rs_pxskxsbm order by skxs",skxs);
%>
    </select>
  </td>
  <td align="right" width="15%">课程类型</td> 
  <td width="35%"> 
    <select name="kclx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select kclx,lxmc  from rs_pxkclxbm order by kclx",kclx);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训人数</td> 
  <td width="35%"> 
    <input type="text" name="pxrs" size="20" maxlength="8" value="<%=pxrs%>">
  </td>
    <td align="right" width="15%">培训费用</td> 
  <td width="35%"> 
    <input type="text" name="pxfy"  size="20" maxlength="9" value="<%=pxfy%>">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">高层人数</td> 
  <td width="35%"> 
    <input type="text" name="gcrs"  size="20" maxlength="8" value="<%=gcrs%>">
  </td>
    <td align="right" width="15%">中层人数</td> 
  <td width="35%"> 
    <input type="text" name="zcrs" size="20" maxlength="8" value="<%=zcrs%>">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">基层人数</td> 
  <td width="35%"> 
    <input type="text" name="jcrs" size="20" maxlength="8" value="<%=jcrs%>">
  </td>
    <td align="right" width="15%">培训场地</td> 
  <td width="35%"> 
    <input type="text" name="pxcd"  size="20" maxlength="50" value="<%=pxcd%>">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训讲师</td> 
  <td width="35%"> 
    <input type="text" name="pxjs"  size="20" maxlength="40"  value="<%=pxjs%>">
  </td>
  <td align="right" width="15%">培训结果</td> 
  <td width="35%"> 
    <select name="pxjg" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">完成</option>
	<option value="0">未完成</option>
    <option value="2">部分完成</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训开始时间</td> 
  <td width="35%"> 
    <input type="text" name="pxkssj" size="20" maxlength="10"  ondblclick="JSCalendar(this)" value="<%=pxkssj%>">
  </td>
  <td align="right" width="15%">培训结束时间</td> 
  <td width="35%"> 
    <input type="text" name="pxjssj"  size="20" maxlength="10"  ondblclick="JSCalendar(this)" value="<%=pxjssj%>">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">录入人</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">录入时间</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训课程</td> 
  <td width="35%" colspan="3" > 
     <textarea name="pxkc" cols="71" rows="3" onKeyUp="keyTo(savebutton)"><%=pxkc%></textarea>
  </td>

</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">课程内容</td> 
  <td width="35%" colspan="3" > 
     <textarea name="kcnr" cols="71" rows="3" onKeyUp="keyTo(savebutton)"><%=kcnr%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3" > 
     <textarea name="bz" cols="71" rows="3" onKeyUp="keyTo(savebutton)"><%=bz%></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input name="pxjhbh" type="hidden" value="<%=pxjhbh%>">
	<input name="pxmxbh" type="hidden" value="<%=wherepxmxbh%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
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

	if(	javaTrim(FormName.skxs)=="") {
		alert("请选择[授课形式]！");
		FormName.skxs.focus();
		return false;
	}
	if(	javaTrim(FormName.kclx)=="") {
		alert("请选择[课程类型]！");
		FormName.kclx.focus();
		return false;
	}
	if(	javaTrim(FormName.pxrs)=="") {
		alert("请输入[培训人数]！");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.pxrs, "培训人数"))) {
		return false;
	}
	if(	javaTrim(FormName.pxfy)=="") {
		alert("请输入[培训费用]！");
		FormName.pxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.pxfy, "培训费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gcrs)=="") {
		alert("请输入[高层人数]！");
		FormName.gcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gcrs, "高层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.zcrs)=="") {
		alert("请输入[中层人数]！");
		FormName.zcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.zcrs, "中层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.jcrs)=="") {
		alert("请输入[基层人数]！");
		FormName.jcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.jcrs, "基层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.pxjg)=="") {
		alert("请选择[培训结果]！");
		FormName.pxjg.focus();
		return false;
	}
	if(	javaTrim(FormName.pxkssj)=="") {
		alert("请输入[培训开始时间]！");
		FormName.pxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxkssj, "培训开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.pxjssj)=="") {
		alert("请输入[培训结束时间]！");
		FormName.pxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxjssj, "培训结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
