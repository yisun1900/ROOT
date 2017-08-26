<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

	String khbh=request.getParameter("khbh");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;


String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;
String dqbm=null;
String bjbbh=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj,bjbbh";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=cf.fillNull(rs.getString("fwmj"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="8" align="center" class="STYLE2" ><B>精装包含项目</B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >客户姓名：<%=khxm%></td>
    <td colspan="3" >工程负责人：</td>
    <td width="27%" >设 计 师：<%=sjs%></td>
	<td width="21%" >制单日期：<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >客户地址：<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >客户电话：<%=lxfs%></td>
    <td align="left" >竣工时间：</td>
	<td >建筑面积：<%=fwmj%></td>
  </tr>
      <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >签约店面：&nbsp;</td>
    <td align="left" >材料顾问：&nbsp;</td>
	<td >套餐级别：&nbsp;</td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">项目名称</td>
	<td  width="14%">品牌</td>
	<td  width="14%">型号</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">包含数量</td>
	<td  width="32%">备注及工艺说明</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT tc_csrjkhbzxm.xmmc,tc_csrjkhbzxm.ppmc,tc_csrjkhbzxm.xh,tc_csrjkhbzxm.jldw,tc_csrjkhbzxm.bhsl,tc_csrjkhbzxm.bz";
	ls_sql+=" FROM tc_csrjkhbzxm  ";
    ls_sql+=" where tc_csrjkhbzxm.khbh='"+khbh+"'";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();

%> 
	</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">客户签字：            </td>
    <td colspan="2" height="32">设计师签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">日期：</td>
    <td colspan="2" height="32">日期：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">材料员签字：</td>
    <td colspan="2" height="32">店面经理签字：</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="5" height="32">日期：</td>
    <td colspan="2" height="32">日期：</td>
</table>
</body>
</html>