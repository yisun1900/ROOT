<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>施工队预交底</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String sgd=request.getParameter("sgd");

double alldzbjze=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>
<div align="center"><br><b>施工队预交底</b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="2%">序号</td>
    <td width="4%">客户姓名</td>
    <td width="11%">房屋地址</td>
    <td width="4%">电子报价总额</td>
    <td width="4%">回单</td>
    <td width="4%">关系户</td>
    <td width="4%">设计师</td>
    <td width="4%">质检</td>
    <td width="4%">施工队</td>
  </tr>
  <%
String khbh=null;
String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String qyrq=null;
String pdsj=null;
String kgrq=null;
String sjkgrq=null;
String sybgcrq=null;
String szqsj=null;
String jgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String pdclzt=null;
String hzts=null;
String htgq=null;
String yjgrq=null;
String hdlxmc=null;
String khlxmc=null;

double dzbjze=0;



String ys=null;//颜色
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;



	int row=0;
	ls_sql="select crm_zxkhxx.khbh,hdlxmc,khlxmc,hth,khxm,lxfs,fwdz,sjs,zjxm,sgdmc sgd,dzbjze ";
	ls_sql+=" from  crm_zxkhxx,sq_sgd,dm_hdlxbm,dm_khlxbm";
	ls_sql+=" where crm_zxkhxx.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and crm_zxkhxx.hdbz=dm_hdlxbm.hdlxbm(+) ";
	ls_sql+=" and crm_zxkhxx.khlxbm=dm_khlxbm.khlxbm(+) ";
	ls_sql+=" and  crm_zxkhxx.sgd='"+sgd+"' ";
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
	ls_sql+=" order by crm_zxkhxx.lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hdlxmc=cf.fillHtml(rs.getString("hdlxmc"));
		khlxmc=cf.fillHtml(rs.getString("khlxmc"));
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=rs.getString("fwdz");
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		dzbjze=rs.getDouble("dzbjze");

		alldzbjze+=dzbjze;



		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}


%> 
  <tr align="center" bgcolor="<%=ys%>">
  <td><%=row%></td>
    <td><A HREF="/dhzx/dhzx/ViewCrm_zxkhxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
    <td><%=fwdz%></td>
    <td><%=dzbjze%></td>
    <td><%=hdlxmc%></td>
    <td><%=khlxmc%></td>
    <td><%=sjs%></td>
    <td><%=zjxm%></td>
    <td><%=sgd%></td>
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
  <tr align="center"  bgcolor="#E8E8FF">
  <td colspan="2">合计</td>
    <td>&nbsp;</td>
    <td><%=cf.formatDouble(alldzbjze)%></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

</table>
</body>
</html>
