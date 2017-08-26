<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
int row=0;
String czxh=request.getParameter("czxh");
String dwbh=(String)session.getAttribute("ssfgs");
String clbm=null;
String clmc=null;
String clgg=null;
double fgsdj=0;
double gdj=0;
double sqlqsl=0;
double sjsl=0;
double sqlqje=0;
double sjje=0;
double xjsqlqsl=0;
double xjsjsl=0;
double xjsqlqje=0;
double xjsjje=0;
String cldlmc=null;
String jldwmc=null;

try {
	conn=cf.getConnection();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">代金券(操作序号:<%=czxh%>)</font></B>
</CENTER>
<form method="post" action="SaveUpdateDlCl_djj.jsp" name="insertform">
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px' >
    <tr  align="center"> 
      <td  width="12%" bgcolor="#CCCCCC">材料大类</td>
      <td  width="8%" bgcolor="#CCCCCC">签约百分比</td>
      <td  width="10%" bgcolor="#CCCCCC">应领取金额</td>
      <td  width="10%" bgcolor="#CCCCCC">累计申领金额</td>
      <td  width="10%" bgcolor="#CCCCCC">差额</td>
      <td  width="10%" bgcolor="#CCCCCC">累计申领比例</td>
      <td  width="30%" bgcolor="#CCCCCC">减免原因</td>
    </tr>
    <%

	String sfjm=null;
	String khbh=null;
	ls_sql="SELECT sfjm,khbh";
	ls_sql+=" from cl_djj"; 
	ls_sql+=" where czxh='"+czxh+"' ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	if (rs1.next())
	{
		sfjm=rs1.getString(1);
		khbh=rs1.getString(2);
	}
	rs1.close();
	ps1.close();
	
	
	double qybfb=0;
	double ylqje=0;
	String ce=null;
	String jmyy=null;
	double xjylqje=0;
	xjsjje=0;
	ls_sql="SELECT cl_djjflmx.cldlmc,cl_djjflmx.qybfb,cl_djjflmx.ylqje,cl_djjflmx.sjje,cl_djjflmx.jmyy ";
	ls_sql+=" FROM cl_djjflmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by cldlmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		qybfb=rs.getDouble("qybfb");
		jmyy=cf.fillNull(rs.getString("jmyy"));
		ylqje=rs.getDouble("ylqje");
		sjje=rs.getDouble("sjje");

		xjylqje+=ylqje;
		xjsjje+=sjje;

		row++;





%> 
    <tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center"> 
      <td><%=cldlmc%></td>
      <td><%=qybfb%>%</td>
      <td><%=ylqje%></td>
      <td><%=sjje%></td>
      <td><%=cf.formatDouble(ylqje-sjje)%></td>
      <td><%=cf.formatDouble(sjje*100.0/ylqje)%>％</td>
      <td > 
	   <input type="hidden" name="cldlmc" value="<%=cldlmc%>"  >
       <input type="text" name="jmyy" size="37" maxlength="200" value="<%=jmyy%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(jmyy[<%=(row)%>])" >
      </td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
%> 
     <tr align="center"> 
      <td colspan="2">小 计</td>
      <td><%=cf.formatDouble(xjylqje)%></td>
      <td><%=cf.formatDouble(xjsjje)%></td>
      <td><%=cf.formatDouble(xjylqje-xjsjje)%></td>
      <td><%=cf.formatDouble(xjsjje*100.0/xjylqje)%>％</td>
      <td>&nbsp;</td>
    </tr>
    <tr  align="center"> 
      <td colspan="8" height="32"><font color="#CC0000">*</font>是否申请减免：<%
	cf.radioToken(out, "sfjm","1+不申请&2+申请减免",sfjm);
%></td>
    </tr>
    <tr  align="center"> 
      <td colspan="8" bgcolor="#CCCCCC" height="40"> 
          <input type="hidden" name="khbh" value="<%=khbh%>"  >
          <input type="hidden" name="czxh" value="<%=czxh%>"  >
          <input type="button"  value="存盘" onClick="f_do(insertform)">
      </td>
    </tr>
  </table>
</form>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">序号</td>
    <td  width="12%" align="center">材料名称</td>
    <td  width="12%" align="center">材料规格</td>
    <td  width="12%" align="center">材料大类</td>
    <td  width="8%" align="center">计量单位</td>
    <td  width="8%" align="center">工队价</td>
    <td  width="8%" align="center">申请数量</td>
    <td  width="10%" align="center">申请金额</td>
    <td  width="8%" align="center">审核数量</td>
    <td  width="10%" align="center">审核金额</td>
  </tr>
  <%
	xjsqlqsl=0;
	xjsjsl=0;
	xjsqlqje=0;
	xjsjje=0;
	ls_sql="SELECT czxh,clbm clbm,clmc,clgg,gdj,sqlqsl,sjsl,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_djjmx ";
	ls_sql+=" where czxh='"+czxh+"' ";
	ls_sql+=" order by cldlmc, clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=rs.getDouble("gdj");
		sqlqsl=rs.getDouble("sqlqsl");
		sjsl=rs.getDouble("sjsl");
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));


		sqlqje=cf.doubleTrim(sqlqsl*gdj);
		sjje=cf.doubleTrim(sjsl*gdj);

		xjsqlqsl+=sqlqsl;
		xjsjsl+=sjsl;
		xjsqlqje+=sqlqje;
		xjsjje+=sjje;
%> 
  <tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center"> 
    <td><%=i%></td>
    <td><%=clmc%></td>
    <td><%=clgg%></td>
    <td><%=cldlmc%></td>
    <td><%=jldwmc%></td>
    <td><%=gdj%></td>
    <td><%=sqlqsl%></td>
    <td><%=sqlqje%></td>
    <td><%=sjsl%></td>
    <td><%=sjje%></td>
  </tr>
  <%
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

xjsqlqsl=cf.doubleTrim(xjsqlqsl);
xjsjsl=cf.doubleTrim(xjsjsl);
xjsqlqje=cf.doubleTrim(xjsqlqje);
xjsjje=cf.doubleTrim(xjsjje);

%> 
  <tr align="center"> 
    <td colspan="4">合计</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><%=xjsqlqsl%></td>
    <td><%=xjsqlqje%></td>
    <td><%=xjsjsl%></td>
    <td><%=xjsjje%></td>
  </tr>
</table>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sfjm)) {
		alert("请选择[是否申请减免]！");
		FormName.sfjm[0].focus();
		return false;
	}

	FormName.submit();
	return true;

}
//-->
</SCRIPT>