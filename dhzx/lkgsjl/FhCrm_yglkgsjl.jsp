<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String yhmc=null;
String ygbm=null;
String rylx=null;
String jhlkrq=null;
String jhlksj=null;
String jhfhsj=null;
String lkgsmd=null;
String lkgssm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String lklrr=null;
String lklrsj=null;
String sjlksj=null;
String sjfhsj=null;
String jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ygbh,yhmc,ygbm,rylx,jhlkrq,jhlksj,jhfhsj,lkgsmd,lkgssm,lrr,lrsj,lrbm,ssfgs,bz,lklrr,lklrsj,sjlksj,TO_CHAR(SYSDATE,'hh24:mi:ss') sjfhsj";
	ls_sql+=" from  crm_yglkgsjl";
	ls_sql+=" where jlh="+jlh ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		ygbm=cf.fillNull(rs.getString("ygbm"));
		rylx=cf.fillNull(rs.getString("rylx"));
		jhlkrq=cf.fillNull(rs.getDate("jhlkrq"));
		jhlksj=cf.fillNull(rs.getString("jhlksj"));
		jhfhsj=cf.fillNull(rs.getString("jhfhsj"));
		lkgsmd=cf.fillNull(rs.getString("lkgsmd"));
		lkgssm=cf.fillNull(rs.getString("lkgssm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		lklrr=cf.fillNull(rs.getString("lklrr"));
		lklrsj=cf.fillNull(rs.getString("lklrsj"));
		sjlksj=cf.fillNull(rs.getString("sjlksj"));
		sjfhsj=cf.fillNull(rs.getString("sjfhsj"));
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
<title>返回登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveFhCrm_yglkgsjl.jsp" name="editform">
<div align="center">返回登记（记录号：<%=jlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">员工编号</span></td> 
  <td width="32%"><%=ygbh%></td>
  <td align="right" width="18%">人员类型</td> 
  <td width="32%"><%=rylx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">员工名称</span></td> 
  <td width="32%"><%=yhmc%></td>
  <td align="right" width="18%"><span class="STYLE2">员工部门</span></td> 
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ygbm+"'",ygbm,true);
%>	</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">计划离开日期</span></td>
  <td><%=jhlkrq%></td>
  <td align="right"><span class="STYLE2">离开公司目的</span></td>
  <td><%=lkgsmd%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">计划离开时间</span></td> 
  <td width="32%"> <%=jhlksj%><strong>（录入小时）</strong> </td>
  <td align="right" width="18%"><span class="STYLE2">计划返回时间</span></td> 
  <td width="32%"><%=jhfhsj%><strong>（录入小时）</strong> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">离开公司说明</span></td>
  <td colspan="3"><%=lkgssm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入人</span></td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2">录入时间</span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入部门</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right"><span class="STYLE2">所属分公司</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">实际离开时间</span></td>
  <td><%=sjlksj%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">离开录入人</span></td>
  <td><%=lklrr%></td>
  <td align="right"><span class="STYLE2">离开录入时间</span></td>
  <td><%=lklrsj%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>实际返回时间</td>
  <td><input type="text" name="sjfhsj" value="<%=sjfhsj%>" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">返回录入人</span></td>
  <td><input type="text" name="fhlrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">返回录入时间</span></td>
  <td><input type="text" name="fhlrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="jlh" value="<%=jlh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.jlh)=="") {
		alert("请输入[记录号]！");
		FormName.jlh.focus();
		return false;
	}
	if(!(isNumber(FormName.jlh, "记录号"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfhsj)=="") {
		alert("请输入[实际返回时间]！");
		FormName.sjfhsj.focus();
		return false;
	}
	if(	javaTrim(FormName.fhlrr)=="") {
		alert("请输入[返回录入人]！");
		FormName.fhlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.fhlrsj)=="") {
		alert("请输入[返回录入时间]！");
		FormName.fhlrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fhlrsj, "返回录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
