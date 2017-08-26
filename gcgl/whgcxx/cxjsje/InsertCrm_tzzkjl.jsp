<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String bjjb=null;
String ssfgs=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String khjl=null;
String dmjl="";
String dmjldh="";

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String zklx="";
double zdzk=10;

double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
double qtsfxmzk=10;

String zjxzklx="";
String sfybfxmzk="";
String sfybffyzk="";
double gczjxfzk=10;
double gcjxzk=10;
double glfzjxzk=10;
double jxglfzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;

double hdzsjz=0;
double djjje=0;
double djjbfb=10;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

double zjjmje=0;

String djjzsfs="";
String zsjs="";

String yxbffydz="";//是否允许部分费用打折  1：允许；9：不允许

String zdzkDisplay="none";
String dxzkDisplay="none";
String bfzkDisplay="none";
String qtzkDisplay="none";

String tzjlh="";
try {
	conn=cf.getConnection();


	String ysshbz="";
	ls_sql="select bjjb,cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,ysshbz,sq_dwxx.yxbffydz";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.ssfgs=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//是否启用预算审核  N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
		yxbffydz=cf.fillNull(rs.getString("yxbffydz"));
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">调整折扣(调整记录号:<%=tzjlh%>)</div>



<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">合同号</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
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
    <td align="right"><span class="STYLE2">店长及电话</span></td>
    <td><%=dmjl%>（<%=dmjldh%>）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">参加公司活动</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">小区促销活动</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">展会促销活动</span></td>
    <td colspan="3">
	  <A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></A>	</td>
    </tr>
</table>



<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td width="100%"> 
          <input type="hidden" name="tzjlh" value="<%=tzjlh%>" > 
          <input type="hidden" name="khbh" value="<%=khbh%>" > 
          <input type="hidden" name="ssfgs" value="<%=ssfgs%>" > 
          <input type="hidden" name="cxhdbm" value="<%=cxhdbm%>" >
          <input name="wc" type="button" onClick="f_wcdz(insertform)"  value="重新计算金额" >
          <input name="button" type="button" onClick="window.open('/dhzx/sjszx/ylbj.jsp?khbh=<%=khbh%>')"  value="查看报价">
          <input type="reset"  value="重输" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_wcdz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="wcdz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
