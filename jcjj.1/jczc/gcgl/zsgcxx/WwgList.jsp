<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");
%>
<html>
<head>
<title>工程进度跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b>工程金额10万以上客户明细 <br>(<%=sjfw%>--<%=sjfw2%>)</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="7%">合同号</td>
    <td width="5%">客户姓名</td>
	 <td width="2%">联系方式</td>
    <td width="18%">房屋地址</td>
    <td width="5%">设计师</td>
    <td width="5%">质检</td>
    <td width="5%">施工队</td>
   
    <td width="7%">签约日期</td>
    <td width="7%">派单时间</td>
    <td width="7%">应开工日期</td>
    <td width="7%">实开工日期</td>
    <td width="7%">隐蔽工程</td>
    <td width="7%">合同金额</td>
    <td width="7%">应竣工日期</td>
  </tr>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
double cqye=0;
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}
String ls=null;
ls=request.getParameter("qye");

try{
	if (!(ls.equals("")))  cqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cqye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>类型转换发生意外:"+e);
	return;
}
String px=request.getParameter("px");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");


String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}


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
String qye=null;
String lxfs=null;
String ys=null;
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="select hth,khxm,fwdz,sjs,lxfs,zjxm,sgdmc sgd,qyrq,pdsj,kgrq,sjkgrq,sybgcrq,szqsj,jgrq,crm_khxx.gcjdbm,gcjdmc,pdclzt,qye";
	ls_sql+=" from  crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm ";
	ls_sql+=" and crm_khxx.zt='2' and crm_khxx.gcjdbm!='1' and crm_khxx.gcjdbm!='5' ";
	ls_sql+="  and qye>="+cqye;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" order by "+px;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while (rs.next())
	{
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
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qye=cf.fillNull(rs.getString("qye"));

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
    <td><%=hth%></td>
    <td><%=khxm%></td>
	<td><%=lxfs%></td>
    <td><%=fwdz%></td>
    <td><%=sjs%></td>
    <td><%=zjxm%></td>
    <td><%=sgd%></td>
    
    <td ><%=qyrq%></td>
    <td ><%=pdsj%></td>
    <td ><%=kgrq%></td>
    <td ><%=sjkgrq%></td>
    <td b><%=sybgcrq%></td>
    
	<td ><%=qye%></td>
    <td ><%=jgrq%></td>
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
