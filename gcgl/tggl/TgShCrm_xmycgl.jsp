<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String cxwtsj=null;
String dsr=null;
String cxwt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;

String jjfazdr=null;
String jjfazdsj=null;
String jjfa=null;
String jjfashr=null;
String jjfashsj=null;
String clqklrr=null;
String clqklrsj=null;
String sjcljg=null;
String sjclqk=null;

String tgsqr=null;
String tgsqsj=null;
String tgsqyy=null;
String tgshr=null;
String tgshsj=null;
String tgshjg=null;
String tgshsm=null;

String djbh=cf.GB2Uni(request.getParameter("djbh"));

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

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,cxwtsj,dsr,cxwt,lrr,lrsj,lrbm,bz ";
	ls_sql+=" ,jjfazdr,jjfazdsj,jjfa,jjfashr,jjfashsj,clqklrr,clqklrsj,sjcljg,sjclqk ";
	ls_sql+=" ,tgsqr,tgsqsj,tgsqyy,tgshr,tgshsj,tgshjg,tgshsm ";
	ls_sql+=" from  crm_xmycgl";
	ls_sql+=" where  (djbh='"+djbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cxwtsj=cf.fillNull(rs.getDate("cxwtsj"));
		dsr=cf.fillNull(rs.getString("dsr"));
		cxwt=cf.fillNull(rs.getString("cxwt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));

		jjfazdr=cf.fillNull(rs.getString("jjfazdr"));
		jjfazdsj=cf.fillNull(rs.getDate("jjfazdsj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		jjfashr=cf.fillNull(rs.getString("jjfashr"));
		jjfashsj=cf.fillNull(rs.getDate("jjfashsj"));
		clqklrr=cf.fillNull(rs.getString("clqklrr"));
		clqklrsj=cf.fillNull(rs.getDate("clqklrsj"));
		sjcljg=cf.fillNull(rs.getString("sjcljg"));
		sjclqk=cf.fillNull(rs.getString("sjclqk"));

		tgsqr=cf.fillNull(rs.getString("tgsqr"));
		tgsqsj=cf.fillNull(rs.getDate("tgsqsj"));
		tgsqyy=cf.fillNull(rs.getString("tgsqyy"));
		tgshr=cf.fillNull(rs.getString("tgshr"));
		tgshsj=cf.fillNull(rs.getDate("tgshsj"));
		tgshjg=cf.fillNull(rs.getString("tgshjg"));
		tgshsm=cf.fillNull(rs.getString("tgshsm"));
	}
	rs.close();
	ps.close();

	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

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
<title>停工审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveTgShCrm_xmycgl.jsp" name="editform">
<div align="center">停工审核（登记编号：<%=djbh%>）</div>
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
  <td align="right" width="17%"><span class="STYLE2">出现问题时间</span></td> 
  <td width="33%"><%=cxwtsj%></td>
  <td align="right" width="17%"><span class="STYLE2">当事人</span></td> 
  <td width="33%"><%=dsr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">出现问题</span></td> 
  <td colspan="3"><%=cxwt%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入人</span></td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2">录入时间</span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">录入部门</span></td>
  <td>
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">备注</span></td> 
  <td colspan="3"><%=bz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">解决方案制订人</span></td>
  <td><%=jjfazdr%></td>
  <td align="right"><span class="STYLE2">解决方案制订时间</span></td>
  <td><%=jjfazdsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">解决方案</span></td>
  <td colspan="3"><%=jjfa%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">方案审核人</span></td>
  <td><%=jjfashr%></td>
  <td align="right"><span class="STYLE2">方案审核时间</span></td>
  <td><%=jjfashsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">处理情况录入人</span></td>
  <td><%=clqklrr%></td>
  <td align="right"><span class="STYLE2">处理情况录入时间</span></td>
  <td><%=clqklrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">实际处理结果</span></td>
  <td colspan="3"><%
	cf.radioToken(out,"Y+解决&N+未解决",sjcljg,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">实际处理情况</span></td>
  <td colspan="3"><%=sjclqk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">停工申请人</span></td>
  <td><%=tgsqr%></td>
  <td align="right"><span class="STYLE2">停工申请时间</span></td>
  <td><%=tgsqsj%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">停工申请原因</span></td>
  <td colspan="3"><%=tgsqyy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>停工审核</strong></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">停工审核人</span></td>
  <td><input type="text" name="tgshr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">停工审核时间</span></td>
  <td><input type="text" name="tgshsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>停工审核结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "tgshjg","Y+通过&N+未通过",tgshjg);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>停工审核说明</td>
  <td colspan="3"><textarea name="tgshsm" cols="75" rows="3"><%=tgshsm%></textarea></td>
</tr>
    <tr> 
      <td colspan="4" align="center" >
	    <input type="hidden" name="djbh" value="<%=djbh%>" size="20" maxlength="10" readonly>
	    <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
	    <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">	</td>
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
	if(	javaTrim(FormName.djbh)=="") {
		alert("请输入[登记编号]！");
		FormName.djbh.focus();
		return false;
	}

	if(	javaTrim(FormName.tgshr)=="") {
		alert("请输入[停工审核人]！");
		FormName.tgshr.focus();
		return false;
	}
	if(	javaTrim(FormName.tgshsj)=="") {
		alert("请输入[停工审核时间]！");
		FormName.tgshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tgshsj, "停工审核时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.tgshjg)) {
		alert("请选择[停工审核结果]！");
		FormName.tgshjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.tgshsm)=="") {
		alert("请选择[停工审核说明]！");
		FormName.tgshsm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
