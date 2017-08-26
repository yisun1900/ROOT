<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_nbtsjl_tsjlh=null;
String crm_nbtsjl_btsr=null;
String crm_nbtsjl_tsnr=null;
String crm_nbtsjl_tsr=null;
String crm_nbtsjl_tssj=null;
String crm_nbtsjl_slr=null;
String crm_nbtsjl_slsj=null;
String sq_dwxx_dwmc=null;
String crm_nbtsjl_clzt=null;
String crm_nbtsjl_clr=null;
String crm_nbtsjl_clkssj=null;
String crm_nbtsjl_cljssj=null;
String crm_nbtsjl_clqk=null;

String btsfgs=null;
String btsbm=null;
String slfgs=null;

String wherecrm_nbtsjl_tsjlh=null;
wherecrm_nbtsjl_tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select slfgs,btsfgs,btsbm,crm_nbtsjl.tsjlh as crm_nbtsjl_tsjlh,crm_nbtsjl.btsr as crm_nbtsjl_btsr,crm_nbtsjl.tsnr as crm_nbtsjl_tsnr,crm_nbtsjl.tsr as crm_nbtsjl_tsr,crm_nbtsjl.tssj as crm_nbtsjl_tssj,crm_nbtsjl.slr as crm_nbtsjl_slr,crm_nbtsjl.slsj as crm_nbtsjl_slsj,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_nbtsjl.clzt as crm_nbtsjl_clzt,crm_nbtsjl.clr as crm_nbtsjl_clr,crm_nbtsjl.clkssj as crm_nbtsjl_clkssj,crm_nbtsjl.cljssj as crm_nbtsjl_cljssj,crm_nbtsjl.clqk as crm_nbtsjl_clqk ";
	ls_sql+=" from  sq_dwxx,crm_nbtsjl";
	ls_sql+=" where sq_dwxx.dwbh=crm_nbtsjl.slbm and  (crm_nbtsjl.tsjlh="+wherecrm_nbtsjl_tsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		slfgs=cf.fillNull(rs.getString("slfgs"));
		btsfgs=cf.fillNull(rs.getString("btsfgs"));
		btsbm=cf.fillNull(rs.getString("btsbm"));
		crm_nbtsjl_tsjlh=cf.fillNull(rs.getString("crm_nbtsjl_tsjlh"));
		crm_nbtsjl_btsr=cf.fillNull(rs.getString("crm_nbtsjl_btsr"));
		crm_nbtsjl_tsnr=cf.fillNull(rs.getString("crm_nbtsjl_tsnr"));
		crm_nbtsjl_tsr=cf.fillNull(rs.getString("crm_nbtsjl_tsr"));
		crm_nbtsjl_tssj=cf.fillNull(rs.getDate("crm_nbtsjl_tssj"));
		crm_nbtsjl_slr=cf.fillNull(rs.getString("crm_nbtsjl_slr"));
		crm_nbtsjl_slsj=cf.fillNull(rs.getDate("crm_nbtsjl_slsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_nbtsjl_clzt=cf.fillNull(rs.getString("crm_nbtsjl_clzt"));
		crm_nbtsjl_clr=cf.fillNull(rs.getString("crm_nbtsjl_clr"));
		crm_nbtsjl_clkssj=cf.fillNull(rs.getDate("crm_nbtsjl_clkssj"));
		crm_nbtsjl_cljssj=cf.fillNull(rs.getDate("crm_nbtsjl_cljssj"));
		crm_nbtsjl_clqk=cf.fillNull(rs.getString("crm_nbtsjl_clqk"));
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">内部反馈记录（反馈记录号：<%=crm_nbtsjl_tsjlh%>） </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">被反馈人</div>
    </td>
    <td width="30%"><%=crm_nbtsjl_btsr%> </td>
    <td width="20%"> 
      <div align="right">处理状态</div>
    </td>
    <td width="30%"><%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决",crm_nbtsjl_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">被反馈分公司</td>
    <td width="30%">
	<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+btsfgs+"'",btsfgs,true);
	%>
	</td>
    <td width="20%" align="right">被反馈部门</td>
    <td width="30%">
	<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+btsbm+"'",btsbm,true);
	%>
	</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">反馈时间</div>
    </td>
    <td width="30%"> <%=crm_nbtsjl_tssj%> </td>
    <td width="20%"> 
      <div align="right">反馈人</div>
    </td>
    <td width="30%"><%=crm_nbtsjl_tsr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">反馈内容</td>
    <td colspan="3"><%=crm_nbtsjl_tsnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">录入时间</div>
    </td>
    <td width="30%"> <%=crm_nbtsjl_slsj%> </td>
    <td width="20%"> 
      <div align="right">录入人</div>
    </td>
    <td width="30%"><%=crm_nbtsjl_slr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">录入部门</div>
    </td>
    <td width="30%"><%=sq_dwxx_dwmc%> </td>
    <td width="20%"> 
      <div align="right">录入分公司</div>
    </td>
    <td width="30%">
	<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slfgs+"'",slfgs,true);
	%>
	</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">处理人</td>
    <td width="30%"><%=crm_nbtsjl_clr%></td>
    <td width="20%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">处理开始时间</div>
    </td>
    <td width="30%"> <%=crm_nbtsjl_clkssj%> </td>
    <td width="20%"> 
      <div align="right">处理结束时间</div>
    </td>
    <td width="30%"> <%=crm_nbtsjl_cljssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">处理情况</td>
    <td colspan="3"><%=crm_nbtsjl_clqk%></td>
  </tr>
</table>
</body>
</html>
