<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gj=null;
String dd=null;
String khjl=null;
String zt=null;

String clzt=null;
String spr=null;
String spsj=null;
String spsm=null;
String yczzsj=null;
String yczzsm=null;
String lrr=null;
String lrsj=null;

String lrbm=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select spsm,spr,spsj,clzt,yczzsj,yczzsm,lrr,lrsj,lrbm ";
	ls_sql+=" from  crm_htyczz";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		spsm=cf.fillNull(rs.getString("spsm"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		yczzsj=cf.fillNull(rs.getDate("yczzsj"));
		yczzsm=cf.fillNull(rs.getString("yczzsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select zt,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (zt.equals("6"))
	{
//		out.println("错误！合同已经异常终止");
//		return;
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
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
<title>合同异常终止－－回访</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveHfCrm_htyczz.jsp" name="editform">
<div align="center">合同异常终止－－回访 </div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">工程担当</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">异常终止时间</font></td> 
  <td width="32%"><%=yczzsj%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">异常终止说明</font></td> 
  <td colspan="3"><%=yczzsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">录入人</font></td>
  <td><%=lrr%></td>
  <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">录入时间</font></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">录入部门</font></td>
  <td>
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">审批结论</font></td>
  <td colspan="3">
<%
	cf.radioToken(out,"2+同意&3+不同意",clzt,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">审批说明</font></td>
  <td colspan="3"><%=spsm%> </td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">审批人</font></td>
  <td><%=spr%></td><td align="right" bgcolor="#FFFFFF"><font color="#0000CC">审批时间</font></td>
    <td><%=spsj%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>回访说明</td>
  <td colspan="3"><textarea name="hfsm" cols="73" rows="3"></textarea>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">回访人</font></td>
  <td><input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">回访时间</font></td>
  <td><input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr align="center">
  <td colspan="4"><input type="hidden" name="khbh" value="<%=khbh%>" >
      <input type="button"  value="存盘" onClick="f_do(editform)">
      <input type="reset"  value="重输" name="reset">  </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.hfsm)=="") {
		alert("请输入[回访说明]！");
		FormName.hfsm.focus();
		return false;
	}

	if(	javaTrim(FormName.hfr)=="") {
		alert("请输入[回访人]！");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("请输入[回访时间]！");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "回访时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
