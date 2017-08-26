<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>

<%@ include file="/getlogin.jsp" %>
<%
String tjrq=request.getParameter("tjrq");
String tjrq2=request.getParameter("tjrq2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}
%>
<html>
<head>
<title>工程进度跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" >
<%
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
     	pageObj.setType("EXCEL",response);
	}
%>
<div align="center"><br> <b>未开工工地明细 （<%=tjrq%>----<%=tjrq2%>）</b></div>

<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center">
    <td width="3%">序号</td>
    <td width="6%">合同号</td>
    <td width="4%">客户姓名</td>
    <td width="15%">房屋地址</td>
    <td width="4%">设计师</td>
    <td width="4%">质检</td>
    <td width="4%">施工队</td>
    <td width="6%">工程进度</td>
    <td width="5%">签约日期</td>
    <td width="5%">派单时间</td>
    <td width="5%">应开工日期</td>
    <td width="5%">实开工日期</td>
	<td width="15%">延期说明</td>
    <td width="7%">隐蔽工程</td>
    <td width="7%">中期验收</td>
    <td width="5%">应竣工日期</td>
  </tr>
  <%


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String qyrq=null;
String pdsj=null;
String kgrq=null;
String sjkgrq=null;
String sybgcrq=null;
String szqsj=null;
String jgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String pdclzt=null;
String yqsm=null;
String gcyqyymc=null;

String ys=null;
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="select hth,khxm,fwdz,sjs,zjxm,sgdmc sgd,qyrq,pdsj,kgrq,sjkgrq,sybgcrq,szqsj,jgrq,crm_khxx.gcjdbm,gcjdmc,pdclzt,yqsm";
	ls_sql+=" from  crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.zt='2' and crm_khxx.gcjdbm='1' and pdclzt!='1'";
	
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.gcjdbm,qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yqsm=cf.fillHtml(rs.getString("yqsm"));
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		pdsj=cf.fillHtml(rs.getDate("pdsj"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sybgcrq=cf.fillHtml(rs.getDate("sybgcrq"));
		szqsj=cf.fillHtml(rs.getDate("szqsj"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}

		if (pdclzt.equals("1"))
		{
			ys1="#FFFFFF";
			ys2="#FFFFFF";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}
		else{
			ys1="#FF9999";
			ys2="#FFFFFF";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}

		if (gcjdbm.equals("2"))//1：未开工；2： 材料进场；3：隐蔽工程验收；4： 中期验收；5:：完工
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}
		else if (gcjdbm.equals("3"))
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#CC99FF";
			ys4="#FFFFFF";
		}
		else if (gcjdbm.equals("4"))
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#CC99FF";
			ys4="#FF6699";
		}

%> 
  <tr align="center" bgcolor="<%=ys%>">
  <td><%=row%></td>
    <td><%=hth%></td>
    <td><%=khxm%></td>
    <td><%=fwdz%></td>
    <td><%=sjs%></td>
    <td><%=zjxm%></td>
    <td><%=sgd%></td>
    <td><%=gcjdmc%></td>
    <td bgcolor="<%=ys1%>"><%=qyrq%></td>
    <td bgcolor="<%=ys1%>"><%=pdsj%></td>
    <td bgcolor="<%=ys1%>"><%=kgrq%></td>
    <td bgcolor="<%=ys2%>"><%=sjkgrq%></td>
	<td bgcolor="<%=ys2%>"><%=yqsm%></td>
    <td bgcolor="<%=ys3%>"><%=sybgcrq%></td>
    <td bgcolor="<%=ys4%>"><%=szqsj%></td>
    <td bgcolor="#FFFFFF"><%=jgrq%></td>
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
