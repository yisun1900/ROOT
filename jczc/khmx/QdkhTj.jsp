<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String lrfgs=request.getParameter("fgs");
String lrdwbh=request.getParameter("dwbh");


		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int xh=0;

String dwmc=null;
String khbh=null;
String qyrq=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String cncxhdbm=null;
String cxhdbm=null;
String ctsj=null;
String kgrq=null;
String jgrq=null;
String qdsj=null;
String ywy=null;
double qye=0;
int fwmj=0;
double sjf=0;

int row=0;

try {
	conn=cf.getConnection();

%>
<CENTER >
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<CENTER >
  <B>签单客户统计</B>
</CENTER>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">编号</td>
  <td  width="5%">客户姓名</td>
  <td  width="9%">电话</td>
  <td  width="12%">地址</td>
  <td  width="4%">业务员</td>
  <td  width="4%">所派设计师</td>
  <td  width="7%">店面</td>
  <td  width="5%">方案完成时间</td>
  <td  width="5%">签单时间</td>
  <td  width="4%">面积</td>
  <td  width="5%">设计费</td>
  <td  width="4%">平米设计费</td>
  <td  width="6%">签约额</td>
  <td  width="4%">平米造价</td>
  <td  width="7%">优惠承诺</td>
  <td  width="7%">促销活动</td>
  <td  width="5%">开工时间</td>
  <td  width="5%">完工时间</td>
</tr>
<%
	row=0;
	ls_sql=" SELECT dwmc,khbh,qyrq,khxm,lxfs,fwdz,ywy,sjs,fwmj,sjf,qye,cxhdbm,kgrq,jgrq";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.zt in('2','5')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
	if (!lrfgs.equals(""))
	{
		ls_sql+=" and  crm_khxx.fgsbh ='"+lrfgs+"'";
	}
	if (!lrdwbh.equals(""))
	{
		ls_sql+=" and  crm_khxx.dwbh ='"+lrdwbh+"'";
	}
	ls_sql+=" order by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.qyrq";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		ywy=cf.fillHtml(rs.getString("ywy"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		fwmj=rs.getInt("fwmj");
		sjf=rs.getDouble("sjf");
		qye=rs.getDouble("qye");
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));

		row++;



		ls_sql=" select ctsj,cxhdbm";
		ls_sql+=" from crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cncxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
			ctsj=cf.fillHtml(rs1.getDate("ctsj"));
		}
		rs1.close();
		ps1.close();
		
		int pmsjf=0;
		int pmqye=0;
		if (fwmj==0)
		{
			pmsjf=0;
			pmqye=0;
		}
		else{
			pmsjf=(int)sjf/fwmj;
			pmqye=(int)qye/fwmj;
		}

		%>
		<tr  align="center">
		  <td><%=row%></td>
		  <td><%=khxm%></td>
		  <td><%=lxfs%></td>
		  <td><%=fwdz%></td>
		  <td><%=ywy%></td>
		  <td><%=sjs%></td>
		  <td><%=dwmc%></td>
		  <td><%=ctsj%></td>
		  <td><%=qyrq%></td>
		  <td><%=fwmj%></td>
		  <td><%=sjf%></td>
		  <td><%=pmsjf%></td>
		  <td><%=qye%></td>
		  <td><%=pmqye%></td>
		  <td><%=cncxhdbm%></td>
		  <td><%=cxhdbm%></td>
		  <td><%=kgrq%></td>
		  <td><%=jgrq%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();
%>
</table>




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


</body>
</html>