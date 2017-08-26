<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

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

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String ls_sql=null;
try {
	conn=cf.getConnection();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>员工花名册</B><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 

<table border="1" width="200%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="4%" class="STYLE1">排名</td>
  <td  width="7%" class="STYLE1">部门</td>
  <td  width="6%" class="STYLE1">姓名</td>
  <td  width="6%" class="STYLE2">职务</td>
  <td  width="3%" class="STYLE2">性别</td>
  <td  width="3%" class="STYLE2">婚否</td>
  <td  width="6%" class="STYLE2">入职时间</td>
  <td  width="6%" class="STYLE2">职称</td>
  <td  width="6%" class="STYLE2">学历</td>
  <td  width="8%" class="STYLE2">毕业院校</td>
  <td  width="8%" class="STYLE2">专业</td>
  <td  width="6%" class="STYLE2">毕业时间</td>
  <td  width="6%" class="STYLE2">出生日期</td>
  <td  width="10%" class="STYLE2">身份证号</td>
  <td  width="11%" class="STYLE2">户籍地址</td>
  <td  width="3%" class="STYLE2">社保</td>

</tr>
<%
	int row=0;
	String ssbh=null;//所属部门
	String yhmc=null;//姓名
	String xzzwmc=null;//职务
	String xb=null;//性别
	String hf=null;//婚否
	String rzsj=null;//入职时间
	String zc=null;//职称
	String xueli=null;//学历
	String byyx=null;//毕业院校
	String zy=null;//专业
	String cjgzsj=null;//毕业时间
	String csrq=null;//出生日期
	String sfzh=null;//身份证号
	String hjszd=null;//户籍地址
	String sfbsb=null;//是否办社保
	String sb1=null;
	String sb2=null;
	String sb3=null;
	String sb4=null;
	String sb5=null;

	ls_sql="SELECT sq_dwxx.dwmc dwmc,yhmc,xzzwbm,DECODE(xb,'M','男','W','女') xb,DECODE(hf,'Y','已婚','N','未婚') hf,rzsj,byyx,zy,cjgzsj,csrq,sfzh,hjszd,zcmc";
	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sfzszg in ('Y','N') and sq_dwxx.dwbh=sq_yhxx.dwbh ";
	ls_sql+=wheresql;
	ls_sql+="order by dwmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ssbh=rs.getString(1);
		yhmc=rs.getString(2);
		xzzwmc=cf.fillHtml(rs.getString(3));
		xb=cf.fillHtml(rs.getString(4));
		hf=cf.fillHtml(rs.getString(5));
		rzsj=cf.fillHtml(rs.getDate(6));
//		xueli=rs.getString(7);
		byyx=cf.fillHtml(rs.getString(7));
		zy=cf.fillHtml(rs.getString(8));
		cjgzsj=cf.fillHtml(rs.getDate(9));
		csrq=cf.fillHtml(rs.getDate(10));
		sfzh=cf.fillHtml(rs.getString(11));
		hjszd=cf.fillHtml(rs.getString(12));
		zc=cf.fillHtml(rs.getString(13));

		ls_sql="SELECT xlbm";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where sq_yhxx.yhmc='"+yhmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			xueli=cf.fillHtml(rs1.getString("xlbm"));
		}
		rs1.close();
		ps1.close();
		//社保
		ls_sql="SELECT ylbx,jylbx,sybx,gsby,syx";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where sq_yhxx.yhmc='"+yhmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sb1=rs1.getString(1);
			sb2=rs1.getString(2);
			sb3=rs1.getString(3);
			sb4=rs1.getString(4);
			sb5=rs1.getString(5);
		}
		rs1.close();
		ps1.close();
		if(sb1.equals("Y") || sb2.equals("Y") || sb3.equals("Y") || sb4.equals("Y") || sb5.equals("Y"))
		{
			sfbsb="<font color=red>已办</font>";
		}
		else
		{
			sfbsb="未办";
		}
		row++;

		%>
		<tr align="center">
			<td class="STYLE3"><%=row%></td>
			<td class="STYLE3"><%=ssbh%></td>
			<td class="STYLE3"><%=yhmc%></td>
			<td  align="right" class="STYLE4"><%=xzzwmc%></td>
			<td  align="right" class="STYLE4"><%=xb%></td>
			<td  align="right" class="STYLE4"><%=hf%></td>
			<td  align="right" class="STYLE4"><%=rzsj%></td>
			<td  align="right" class="STYLE4"><%=zc%></td>
			<td  align="right" class="STYLE4"><%=xueli%></td>
			<td  align="right" class="STYLE4"><%=byyx%></td>
			<td  align="right" class="STYLE4"><%=zy%></td>
			<td  align="right" class="STYLE4"><%=cjgzsj%></td>
			<td  align="right" class="STYLE4"><%=csrq%></td>
			<td  align="right" class="STYLE4"><%=sfzh%></td>
			<td  align="right" class="STYLE4"><%=hjszd%></td>
			<td  align="right" class="STYLE4"><%=sfbsb%></td>
		</tr>
		<%	

	}
	rs.close();
	ps.close();

%>
</table>
  </DIV>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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
%>

