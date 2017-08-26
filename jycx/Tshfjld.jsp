<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>客户投诉、电话回访记录单</title>
</head>
<%
String khbh=null;
String crm_khxx_hth=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sjs=null;
String crm_khxx_sjkgrq=null;
String crm_khxx_sjjgrq=null;
String crm_khxx_sgbz=null;
String crm_khxx_zjxm=null;
String wherecrm_khxx_khbh=null;
wherecrm_khxx_khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
//根据客户编号取得客户基本信息
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select distinct crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.sjs,crm_khxx.hth  ,";
	ls_sql+="crm_khxx.sjkgrq,crm_khxx.sjjgrq,crm_khxx.sgbz,crm_khxx.zjxm,crm_khxx.tsjlh ";
    ls_sql+="from crm_khxx ";
	ls_sql+="where crm_khxx.khbh='"+wherecrm_khxx_khbh+"'";
	//out.println(ls_sql);
//ls_sql+="crm_tsjl.tsnr,crm_tsjl.slsj,crm_tsjl.slr,";
//ls_sql+="crm_tsclqk.clqk,crm_tsclqk.lrr";
//ls_sql+="from crm_khxx,crm_tsjl,crm_tsclqk";
//ls_sql+="where crm_khxx.tsjlh=crm_tsjl.tsjlh(+) and crm_tsjl.tsjlh=crm_tsclqk.tsjlh(+)";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		 khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_hth=cf.fillNull(rs.getString("hth"));
		crm_khxx_khxm=cf.fillNull(rs.getString("khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("lxfs"));
		crm_khxx_sjs=cf.fillNull(rs.getString("sjs"));
		crm_khxx_sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		crm_khxx_sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		crm_khxx_sgbz=cf.fillNull(rs.getString("sgbz"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("zjxm"));
		
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<%
//根据客户编号和投诉记录号取得投诉和处理情况

int xh=0;
String tsnr[]={"","","","",""};
String slsj[]={"","","","",""};
String slr[]={"","","","",""};

String clqk[]={"","","","",""};
String clsj[]={"","","","",""};
String lrr[]={"","","","",""};

ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_tsjl.tsnr,crm_tsjl.slsj,crm_tsjl.slr,crm_tsclqk.clqk,crm_tsclqk.clsj,crm_tsclqk.lrr ";
    ls_sql+="from crm_tsjl,crm_tsclqk ";
    ls_sql+="where crm_tsjl.khbh='"+wherecrm_khxx_khbh+"' and crm_tsjl.tsjlh=crm_tsclqk.tsjlh(+)";
	//out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		 
		
		tsnr[xh]=cf.fillNull(rs.getString("tsnr"));
		slsj[xh]=cf.fillNull(rs.getDate("slsj"));
		 slr[xh]=cf.fillNull(rs.getString("slr"));

		clqk[xh]=cf.fillNull(rs.getString("clqk"));
		clsj[xh]=cf.fillNull(rs.getDate("clsj"));
		 lrr[xh]=cf.fillNull(rs.getString("lrr"));
		 xh++;
		 
	}
}
catch (Exception e) {
	out.print("意外: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<body>
<p class="style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
<b><font size="6">业 之 峰 装 饰 有 限 公司</font></b></p> 
<p class="style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
<font size="5">&nbsp;&nbsp;&nbsp客户投诉、电话回访记录单</font></p>
<p class="style11">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp合同编号：<%=crm_khxx_hth%></p>
<table width="648" height="586" border="1" cellspacing="0">
  <tr bordercolor="#D6D3CE">
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">客户姓名&nbsp;</font></span></td>
    <td width="94" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_khxm%> </font></span></td>
    <td width="88" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">工程地址</font></span></td>
    <td colspan="4" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_fwdz%></font></span></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">联系电话</font></span></td>
    <td colspan="4" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_lxfs%></font></span></td>
    <td width="50" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">设计师</font></span></td>
    <td width="119" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_sjs%></font></span></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">开竣工日期</font></span></td>
    <td colspan="2" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_sjkgrq%>至<%=crm_khxx_sjjgrq%></font></span></td>
    <td width="51" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">工长</font></span></td>
    <td width="97" bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_sgbz%></font></span></td>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style8"><font face="宋体">巡检</font></span></td>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="23"><span class="style9"><font face="宋体">&nbsp;<%=crm_khxx_sjs%></font></span></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td width="23" rowspan="5" bordercolorlight="#000000" bordercolordark="#000000" height="248">
	<p class="style3"><font face="宋体">回</font></p>
    <p class="style3"><font face="宋体">访</font></p>
    <p class="style3"><font face="宋体">投</font></p>
    <p class="style3"><font face="宋体">诉</font></p>
    <p class="style3"><font face="宋体">记</font></p>
    <p class="style3"><font face="宋体">录</font></p></td>
    <td width="63" height="46" bordercolorlight="#000000" bordercolordark="#000000"><font face="宋体">第一次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="宋体">&nbsp;<%=tsnr[0]%><p><font face="宋体"><p align="right">记录人：<%=slr[0]%>&nbsp;&nbsp;&nbsp;<%=slsj[0]%></font></p></font></td>
  </tr>
  <tr>
    <td height="44" bordercolorlight="#000000" bordercolordark="#000000"><font face="宋体">第二次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="44"><font face="宋体">&nbsp;<%=tsnr[1]%><p><font face="宋体"><p align="right">记录人：<%=slr[1]%>&nbsp;&nbsp;&nbsp;<%=slsj[1]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="45"><font face="宋体">第三次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="45"><font face="宋体">&nbsp;<%=tsnr[2]%><p><font face="宋体"><p align="right">记录人：<%=slr[2]%>&nbsp;&nbsp;&nbsp;<%=slsj[2]%></font></p></font></td>
  </tr>
  <tr>
    <td height="46" bordercolorlight="#000000" bordercolordark="#000000"><font face="宋体">第四次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="宋体">&nbsp;<%=tsnr[3]%><p><font face="宋体"><p align="right">记录人：<%=slr[3]%>&nbsp;&nbsp;&nbsp;<%=slsj[3]%></font></p></font></td>
  </tr>
  <tr>
    <td height="51" bordercolorlight="#000000" bordercolordark="#000000"><font face="宋体">第五次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="51"><font face="宋体">&nbsp;<%=tsnr[4]%><p><font face="宋体"><p align="right">记录人：<%=slr[4]%>&nbsp;&nbsp;&nbsp;<%=slsj[4]%></font></p></font></td>
  </tr>
  <tr bordercolor="#D6D3CE">
    <td rowspan="5" bordercolorlight="#000000" bordercolordark="#000000" height="249">
	<p class="style3"><font face="宋体">处</font></p>
    <p class="style3"><font face="宋体">理</font></p>
    <p class="style3"><font face="宋体">结</font></p>
    <p class="style3"><font face="宋体">果</font></p></td>
    <td width="63" bordercolorlight="#000000" bordercolordark="#000000" height="51"><font face="宋体">第一次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="51"><font face="宋体">&nbsp;<%=clqk[0]%><p><font face="宋体"><p align="right">记录人：<%=lrr[0]%>&nbsp;&nbsp;&nbsp;<%=clsj[0]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="40"><font face="宋体">第二次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="40"><font face="宋体">&nbsp;<%=clqk[1]%><p><font face="宋体"><p align="right">记录人：<%=lrr[1]%>&nbsp;&nbsp;&nbsp;<%=clsj[1]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="47"><font face="宋体">第三次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="47"><font face="宋体">&nbsp;<%=clqk[2]%><p><font face="宋体"><p align="right">记录人：<%=lrr[2]%>&nbsp;&nbsp;&nbsp;<%=clsj[2]%></font></p></font></td>
  </tr>
  <tr>
    <td bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="宋体">第四次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="46"><font face="宋体">&nbsp;<%=clqk[3]%><p><font face="宋体"><p align="right">记录人：<%=lrr[3]%>&nbsp;&nbsp;&nbsp;<%=clsj[3]%></font></p></font></td>
  </tr>
  <tr>
    <td height="49" bordercolorlight="#000000" bordercolordark="#000000"><font face="宋体">第五次</font></td>
    <td colspan="6" bordercolorlight="#000000" bordercolordark="#000000" height="49"><font face="宋体">&nbsp;<%=clqk[4]%><p><font face="宋体"><p align="right">记录人：<%=lrr[4]%>&nbsp;&nbsp;&nbsp;<%=clsj[4]%></font></p></font></td>
  </tr>
</table>
<p>填表时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p> 
<p>归档时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
电话回访员签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p> 
</body>
</html>
