<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>审核申购单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");


String sgph=cf.GB2Uni(request.getParameter("sgph"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String psfs=null;
String jhshsj=null;
String sgr=null;
String sgrq=null;
String ssfgs=null;
String ssbm=null;
String bz=null;
String sglb=null;
String dqbm=null;
String lrr=null;
String lrsj=null;
String shyj=null;
try {
	conn=cf.getConnection();

	ls_sql="select shyj,DECODE(psfs,'1','配送','2','自取','9','其他') psfs,jhshsj,sgr,sgrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_clsgd.bz,DECODE(sglb,'0','主材','1','辅材') sglb,lrr,lrsj";
	ls_sql+=" from  jxc_clsgd,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where jxc_clsgd.ssfgs=a.dwbh(+) and jxc_clsgd.ssbm=b.dwbh(+) and sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shyj=cf.fillNull(rs.getString("shyj"));
		psfs=cf.fillNull(rs.getString("psfs"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		sgr=cf.fillNull(rs.getString("sgr"));
		sgrq=cf.fillNull(rs.getDate("sgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ssbm=cf.fillNull(rs.getString("ssbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sglb=cf.fillNull(rs.getString("sglb"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
	}
	rs.close();
	ps.close();


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">审核申购单（申购批号：<%=sgph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">申购分公司</span></td>
  <td><%=ssfgs%></td>
  <td align="right"><span class="STYLE2">申购类别</span></td>
  <td><%=sglb%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">申购人</span></td>
  <td><%=sgr%></td>
  <td align="right"><span class="STYLE2">申购日期</span></td>
  <td><%=sgrq%></td>
</tr>
<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE2">配送方式</span></td>
              <td width="32%"><%=psfs%></td>
              <td width="18%" align="right"><span class="STYLE2">计划送货时间</span></td>
      <td width="32%"><%=jhshsj%></td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">录入人</span></td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2">录入时间</span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">录入部门</font></td>
  <td><%=ssbm%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">备注</span></td> 
  <td colspan="3"><%=bz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>审核结论</td>
  <td><%
	cf.radioToken(out, "sgdzt","2+同意&6+不同意","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">审核人</span></td>
  <td><input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>审核日期</span></td>
  <td><input type="text" name="shrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核意见</td>
  <td colspan="3"><textarea name="shyj" cols="72" rows="3" ><%=shyj%></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="sgph" value="<%=sgph%>" >
	  <input type="hidden" name="dqbm" value="<%=dqbm%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2"  align="center">
<tr bgcolor="#CCCCCC"  align="center">
<td width="9%"><b>内部编码</b></td>
  <td width="18%"><b>材料名称</b></td>
  <td width="17%"><b>规格</b></td>
  <td width="10%"  bgcolor="#FFFFcc"> <b>在库数量</b></td>
   <td width="8%"><b>包装规格</b></td>
   <td width="7%"><b>计量单位</b></td>
   <td width="7%"><b>申购单价</b></td>
  <td width="8%" bgcolor="#FFFFcc"><b><span class="STYLE1">*</span>审核单价</b></td>
  <td width="7%"><b>申购数量</b></td>
    <td width="38%" bgcolor="#FFFFcc"><b><span class="STYLE1">*</span>审核数量</b></td>
</tr>
<%

	String clbm=null;
	String nbbm=null;
	String clmc=null;
	String xh=null;
	String gg=null;
	String jldwbm=null;
	String sssdqbm=null;
	double sgsl=0;
	double zksl=0;
	double bzgg=0;
	double sgjg=0;
	double shjg=0;
	double shsl=0;


	ls_sql="select jxc_clsgmx.clbm,jxc_clsgmx.nbbm,jxc_clsgmx.clmc,jxc_clsgmx.xh,jxc_clsgmx.gg,jxc_clsgmx.jldwbm,sgsl,dqbm,bzgg,sgjg,shjg,shsl ";
	ls_sql+=" from  jxc_clsgmx,jxc_clbm,jxc_clsgd,sq_dwxx ";
	ls_sql+=" where jxc_clsgmx.clbm=jxc_clbm.clbm ";
	ls_sql+=" and jxc_clsgmx.sgph=jxc_clsgd.sgph and jxc_clsgd.ssfgs=sq_dwxx.dwbh ";
	ls_sql+=" and jxc_clsgmx.sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sssdqbm=cf.fillNull(rs.getString("dqbm"));
		sgsl=rs.getDouble("sgsl");
		bzgg=rs.getDouble("bzgg");
		sgjg=rs.getDouble("sgjg");
		shjg=rs.getDouble("shjg");
		shsl=rs.getDouble("shsl");

		//查询在库数量
		ls_sql="select sum(kcsl) zksl ";
		ls_sql+=" from  jxc_kcb ";
		ls_sql+=" where clbm='"+clbm+"' and dqbm='"+sssdqbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zksl=rs1.getDouble("zksl");
		}
		rs1.close();
		ps1.close();

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=nbbm%>
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=zksl%></td>
			<td><%=bzgg%>
			<input type="hidden" name="bzgg" value="<%=bzgg%>">
			</td>
			<td><%=jldwbm%></td>
			<td><%=sgjg%></td>
			<td>
				<input type="text" name="shjg" value="<%=shjg%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
		    </td>
			<td><%=sgsl%></td>
			<td>
				<input type="text" name="shsl" value="<%=shsl%>" size="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			</td>
		</tr>
		<%
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sgdzt)) {
		alert("请选择[审核结论]！");
		FormName.sgdzt[0].focus();
		return false;
	}
	if (FormName.sgdzt[1].checked)
	{
		if(	javaTrim(FormName.shyj)=="") {
			alert("请输入[审核意见]！");
			FormName.shyj.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shrq)=="") {
		alert("请输入[审核日期]！");
		FormName.shrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.shrq, "审核日期"))) {
		return false;
	}

	FormName.action="SaveShJxc_clsgd.jsp";
	FormName.submit();
	return true;
}

 //-->
</SCRIPT>
