<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String cpflbm=null;
String cpjkr=null;
String cpkf=null;
String vipkf=null;
String fssj=null;
String cplhsj=null;
String jhbhwcsj=null;
String jhazsj=null;
String fbwxfa=null;
String falrr=null;
String falrsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String qksm=null;
String xdsj=null;
String xdr=null;
String bhlrr=null;
String bhwcrq=null;
String sjazsj=null;
String azsfcg=null;
String azqksm=null;
String fbdbh=cf.GB2Uni(request.getParameter("fbdbh"));

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
	ls_sql="select khbh,cpflbm,cpjkr,cpkf,vipkf,fssj,cplhsj,jhbhwcsj,jhazsj,fbwxfa,falrr,falrsj,lrr,lrsj,lrbm,bz,qksm ";
	ls_sql+=" ,xdsj,xdr,bhlrr,bhwcrq,sjazsj,azsfcg,azqksm";
	ls_sql+=" from  crm_fbdgl";
	ls_sql+=" where fbdbh='"+fbdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjazsj=cf.fillNull(rs.getDate("sjazsj"));
		azsfcg=cf.fillNull(rs.getString("azsfcg"));
		azqksm=cf.fillNull(rs.getString("azqksm"));
		xdr=cf.fillNull(rs.getString("xdr"));
		xdsj=cf.fillNull(rs.getDate("xdsj"));
		bhlrr=cf.fillNull(rs.getString("bhlrr"));
		bhwcrq=cf.fillNull(rs.getDate("bhwcrq"));
		khbh=cf.fillNull(rs.getString("khbh"));
		cpflbm=cf.fillNull(rs.getString("cpflbm"));
		cpjkr=cf.fillNull(rs.getString("cpjkr"));
		cpkf=cf.fillNull(rs.getString("cpkf"));
		vipkf=cf.fillNull(rs.getString("vipkf"));
		fssj=cf.fillNull(rs.getDate("fssj"));
		cplhsj=cf.fillNull(rs.getDate("cplhsj"));
		jhbhwcsj=cf.fillNull(rs.getDate("jhbhwcsj"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		fbwxfa=cf.fillNull(rs.getString("fbwxfa"));
		falrr=cf.fillNull(rs.getString("falrr"));
		falrsj=cf.fillNull(rs.getDate("falrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		qksm=cf.fillNull(rs.getString("qksm"));
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

	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
//		out.println("<BR>！！！错误，客户已完工");
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgAzCrm_fbdgl.jsp" name="editform">
<div align="center">返补维修单－－修改安装（返补单编号：<%=fbdbh%>）</div>
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
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2"><font color="#0000FF">管家</font></span></td>
    <td><%=gj%></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2"><font color="#0000FF">调度</font></span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2"><font color="#0000FF">客户经理</font></span></td>
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
    <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>问题</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">产品分类</font></td> 
  <td width="32%">
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm='"+cpflbm+"'",cpflbm,true);
%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">返补维修发生时间</font></td> 
  <td width="32%"><%=fssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">返补维修情况说明</font></td>
  <td colspan="3"><%=qksm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">录入人</font></td>
  <td><%=lrr%></td>
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">录入时间</font></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">录入部门</font></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">备注</font></td>
  <td colspan="3"><%=bz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>方案</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">产品接口人</font></td> 
  <td width="32%"><%=cpjkr%></td>
  <td align="right" width="18%"><font color="#0000CC">产品客服</font></td> 
  <td width="32%"><%=cpkf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">VIP客服</font></td> 
  <td width="32%"><%=vipkf%></td>
  <td align="right" width="18%"><font color="#0000CC">产品拉回时间</font></td> 
  <td width="32%"><%=cplhsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">计划备货完成时间</font></td> 
  <td width="32%"><%=jhbhwcsj%></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">返补维修方案</font></td> 
  <td colspan="3"><%=fbwxfa%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">方案录入人</font></td>
  <td><%=falrr%></td>
  <td align="right"><font color="#0000CC">方案录入时间</font></td>
  <td><%=falrsj%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>下单备货</strong></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">下单人</font></td>
  <td><%=xdr%></td>
  <td align="right"><font color="#0000CC">返补单下单日期</font></td>
  <td><%=xdsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">备货录入人</font></td>
  <td><%=bhlrr%></td>
  <td align="right"><font color="#0000CC">备货完成日期</font></td>
  <td><%=bhwcrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">计划安装时间</font></td>
  <td><%=jhazsj%></td>
  <td align="right"><font color="#FF0000">*</font>实际安装日期</td>
  <td><input type="text" name="sjazsj" size="20" maxlength="10"  value="<%=sjazsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>安装是否成功</td>
  <td>
<%
	cf.radioToken(out, "azsfcg","Y+成功&N+否",azsfcg);
%>
	</td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">安装录入人</font></td>
  <td><input type="text" name="azlrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">安装情况说明</td>
  <td colspan="3"><textarea name="azqksm" cols="71" rows="3"><%=azqksm%></textarea></td>
  </tr>




    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="fbdbh"  value="<%=fbdbh%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>" > 
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
	if(	!radioChecked(FormName.azsfcg)) {
		alert("请选择[安装是否成功]！");
		FormName.azsfcg[0].focus();
		return false;
	}
	if (FormName.azsfcg[1].checked)
	{
		if(	javaTrim(FormName.azqksm)=="") {
			alert("请输入[安装情况说明]！");
			FormName.azqksm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.sjazsj)=="") {
		alert("请输入[实际安装日期]！");
		FormName.sjazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjazsj, "实际安装日期"))) {
		return false;
	}
	if(	javaTrim(FormName.azlrr)=="") {
		alert("请输入[安装录入人]！");
		FormName.azlrr.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
