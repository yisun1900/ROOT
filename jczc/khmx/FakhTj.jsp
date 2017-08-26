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
String lrsj=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sjsfpsj=null;
String sjs=null;
String cxhdbm=null;
String lfsj=null;
String ctsj=null;
String qdsj=null;
String ywy=null;
String zxzt=null;
String lfdj=null;
String sjf=null;
String dzbjze=null;
String yjzxsj=null;
int row=0;

try {
	conn=cf.getConnection();

%>
<CENTER >
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<CENTER >
  <B>正做方案客户统计</B>
</CENTER>
<table border="1" width="190%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">编号</td>
  <td  width="5%">录入日期</td>
  <td  width="4%">客户姓名</td>
  <td  width="10%">电话</td>
  <td  width="13%">地址</td>
  <td  width="4%">业务员</td>
  <td  width="4%">所派设计师</td>
  <td  width="6%">店面</td>
  <td  width="5%">签订设计协议时间</td>
  <td  width="5%">量房时间</td>
  <td  width="4%">量房费</td>
  <td  width="5%">方案完成时间</td>
  <td  width="4%">审核人</td>
  <td  width="5%">审核时间</td>
  <td  width="5%">设计费</td>
  <td  width="5%">预计合同金额</td>
  <td  width="5%">预计签单时间</td>
  <td  width="6%">优惠承诺</td>
  <td  width="3%">跑单</td>
</tr>
<%
	row=0;
	ls_sql=" SELECT dwmc,khbh,lrsj,khxm,lxfs,fwdz,ywy,sjs,lfsj,lfdj,ctsj,sjf,dzbjze,yjzxsj,cxhdbm,crm_zxkhxx.zxzt";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.zxzt in('1','5')";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and  crm_zxkhxx.sjs is not null";
	ls_sql+=" and  crm_zxkhxx.lfbz='Y'";
	
	if (!lrfgs.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.ssfgs ='"+lrfgs+"'";
	}
	if (!lrdwbh.equals(""))
	{
		ls_sql+=" and  crm_zxkhxx.zxdm ='"+lrdwbh+"'";
	}
	ls_sql+=" order by crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,crm_zxkhxx.lrsj";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		ywy=cf.fillHtml(rs.getString("ywy"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		lfsj=cf.fillHtml(rs.getDate("lfsj"));
		lfdj=cf.fillHtml(rs.getString("lfdj"));
		ctsj=cf.fillHtml(rs.getDate("ctsj"));
		sjf=cf.fillHtml(rs.getString("sjf"));
		dzbjze=cf.fillHtml(rs.getString("dzbjze"));
		yjzxsj=cf.fillHtml(rs.getDate("yjzxsj"));
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		zxzt=cf.fillNull(rs.getString("zxzt"));

		if (zxzt.equals("2") || zxzt.equals("4"))
		{
			zxzt="跑单";
		}
		else {
			zxzt="&nbsp;";
		}

		row++;


		%>
		<tr  align="center">
		  <td><%=row%></td>
		  <td><%=lrsj%></td>
		  <td><%=khxm%></td>
		  <td><%=lxfs%></td>
		  <td><%=fwdz%></td>
		  <td><%=ywy%></td>
		  <td><%=sjs%></td>
		  <td><%=dwmc%></td>
		  <td>&nbsp;</td>
		  <td><%=lfsj%></td>
		  <td><%=lfdj%></td>
		  <td><%=ctsj%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=sjf%></td>
		  <td><%=dzbjze%></td>
		  <td><%=yjzxsj%></td>
		  <td><%=cxhdbm%></td>
		  <td><%=zxzt%></td>
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