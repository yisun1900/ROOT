<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String tjrq=null;
String tjrq2=null;
String lx=null;
tjrq=request.getParameter("tjrq");
tjrq2=request.getParameter("tjrq2");
lx=request.getParameter("lx");

%>
<html>
<head>
<title>工程进度跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b>咨询回访客户反馈表 <br>(<%=tjrq%>--<%=tjrq2%>)</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="8%">回访日期</td>
	<td width="8%">下次回访日期</td>
    <td width="8%">客户姓名</td>
	 <td width="5%">联系方式</td>
	 <td width="15%">房屋地址</td>
    <td width="5%">户型</td>
    <td width="15%">客户回访情况</td>
    <td width="7%">是否签单</td>
    <td width="7%">失败原因</td>
    <td width="7%">责任设计师</td>
	<td width="7%">咨询店面</td>
    
  </tr>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");


String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
}
if(lx!=null)
{
	if(!(lx.equals(""))) wheresql+=" and hfjg='"+lx+"'";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm="";
String fwdz="";
String sjs="";
String hxmc="";
String hfjg="";
String sbyymc="";
String hfr="";
String xchfrq="";
String sjkgrq="";
String sybgcrq="";
String khhfqk="";
String hfsj="";
String gcjdmc="";
String zxdm="";
String lxfs="";

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="select to_char(hfsj,'YYYY-MM-DD') hfsj,khxm,lxfs,sjs,hxmc,DECODE(hfjg,'1','继续跟踪','2','已签约','3','失败') hfjg,sbyymc,khhfqk,hfr,TO_CHAR(xchfrq,'YYYY-MM-DD')  xchfrq,fwdz,dwmc ";
	ls_sql+=" from  crm_zxkhxx,crm_zxhfjl,dm_hxbm,dm_sbyybm,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.khbh=crm_zxhfjl.khbh  and crm_zxkhxx.hxbm=dm_hxbm.hxbm(+) and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+) ";
	ls_sql+=" and crm_zxhfjl.hfsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxhfjl.hfsj<=TO_DATE('"+tjrq2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while (rs.next())
	{
		hfsj=rs.getString("hfsj");
		khxm=rs.getString("khxm");
		lxfs=rs.getString("lxfs");
		sjs=cf.fillHtml(rs.getString("sjs"));
		hxmc=cf.fillHtml(rs.getString("hxmc"));
		hfjg=cf.fillHtml(rs.getString("hfjg"));
		sbyymc=cf.fillHtml(rs.getString("sbyymc"));
		hfr=cf.fillHtml(rs.getString("hfr"));
		xchfrq=cf.fillHtml(rs.getString("xchfrq"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		khhfqk=cf.fillHtml(rs.getString("khhfqk"));
		zxdm=cf.fillHtml(rs.getString("dwmc"));
	
		

		row++;
%> 
  <tr align="center">
    <td><%=hfsj%></td>
	<td><%=xchfrq%></td>
    <td><%=khxm%></td>
	<td><%=lxfs%></td>
    <td><%=fwdz%></td>
	<td><%=hxmc%></td>
	<td><%=khhfqk%></td>
	<td><%=hfjg%></td>
	<td><%=sbyymc%></td>
    <td><%=sjs%></td>
	<td><%=zxdm%></td>
  
    
  </tr>
  <%
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
</table>
</body>
</html>
