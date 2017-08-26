<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String sjfw=null;
	String sjfw2=null;
//**********************************************************************************
	String ls=(new java.sql.Date(System.currentTimeMillis())).toString();
	String year=ls.substring(0,4);
	sjfw=year+"-01-01";//一年的统计时间
	sjfw2=ls;
//***************************************************************************
	

	String lrfgs=request.getParameter("fgs");
	String lrdwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>客户资源统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="6%">序号</td>
  <td  width="20%">店面</td>
  <td  width="8%">新登记客流</td>
  <td  width="8%">在谈客户数</td>
  <td  width="8%">交定金数</td>
  <td  width="8%">定金额</td>
  <td  width="8%">签单数</td>
  <td  width="9%">签单额</td>
  <td  width="8%">平均单额</td>
  <td  width="8%">平米均价</td>
  <td  width="9%">设计费</td>
</tr>
<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int xh=0;

String dwbh=null;
String dwmc=null;
String fgsbh=null;
String fgsmc=null;
int kls=0;
int ztkhs=0;
int jdjs=0;
int qys=0;
double qye=0;
double dje=0;
double sjf=0;
int fwmj=0;

int pjde=0;
int pmjj=0;

int fgskls=0;
int fgsztkhs=0;
int fgsjdjs=0;
int fgsqys=0;
double fgsqye=0;
double fgsdje=0;
double fgssjf=0;
int fgsfwmj=0;

int allkls=0;
int allztkhs=0;
int alljdjs=0;
int allqys=0;
double allqye=0;
double alldje=0;
double allsjf=0;
int allfwmj=0;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0'";
	if (lrfgs!=null)
	{
		if (!(lrfgs.equals("")))	ls_sql+=" and  dwbh ='"+lrfgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery(ls_sql);
	while (rs2.next())
	{
		fgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");

		fgskls=0;
		fgsztkhs=0;
		fgsjdjs=0;
		fgsqys=0;
		fgsqye=0;
		fgsdje=0;
		fgssjf=0;
		fgsfwmj=0;

		ls_sql=" SELECT dwbh,dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where ssdw='"+fgsbh+"' and dwlx in('F0','F1','F2')";
		if (lrdwbh!=null)
		{
			if (!(lrdwbh.equals("")))	ls_sql+=" and  dwbh='"+lrdwbh+"'";
		}
		ls_sql+=" order by dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			dwbh=rs.getString("dwbh");
			dwmc=rs.getString("dwmc");

			//新登记客流
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdjbm='"+dwbh+"'";
			ls_sql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				kls=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//在谈客户数
			ls_sql=" SELECT count(*)";
			ls_sql+=" FROM crm_zxkhxx";
			ls_sql+=" where zxdm='"+dwbh+"' and zxzt in('0','1','2')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				ztkhs=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//交定金数
			ls_sql=" SELECT count(*),sum(fkje)";
			ls_sql+=" FROM cw_khfkjl,crm_zxkhxx";
			ls_sql+=" where cw_khfkjl.khbh=crm_zxkhxx.khbh and crm_zxkhxx.zxdjbm='"+dwbh+"' and cw_khfkjl.fklxbm='52'";
			ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				jdjs=rs1.getInt(1);
				dje=rs1.getDouble(2);
			}
			rs1.close();
			ps1.close();

			ls_sql=" SELECT count(*),sum(qye),sum(sjf),sum(fwmj)";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where dwbh='"+dwbh+"' and zt='2'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				qys=rs1.getInt(1);
				qye=rs1.getDouble(2);
				sjf=rs1.getDouble(3);
				fwmj=rs1.getInt(4);
			}
			rs1.close();
			ps1.close();

			if (kls==0 && ztkhs==0 && jdjs==0 && qys==0)
			{
				continue;
			}

			xh++;


			fgskls+=kls;
			fgsztkhs+=ztkhs;
			fgsjdjs+=jdjs;
			fgsqys+=qys;
			fgsqye+=qye;
			fgssjf+=sjf;
			fgsfwmj+=fwmj;
			fgsdje+=dje;

			allkls+=kls;
			allztkhs+=ztkhs;
			alljdjs+=jdjs;
			allqys+=qys;
			allqye+=qye;
			allsjf+=sjf;
			allfwmj+=fwmj;
			alldje+=dje;

			if (qys!=0)
			{
				pjde=(int)qye/qys;
			}
			else{
				pjde=0;
			}
			if (fwmj!=0)
			{
				pmjj=(int)qye/fwmj;
			}
			else{
				pmjj=0;
			}
			
			%>
			<tr  align="center">
			  <td><%=xh%></td>
			  <td><%=dwmc%></td>
			  <td><%=kls%></td>
			  <td><%=ztkhs%></td>
			  <td><%=jdjs%></td>
			  <td align="right"><%=dje%></td>
			  <td><%=qys%></td>
			  <td align="right"><%=cf.formatDouble(qye)%></td>
			  <td align="right"><%=pjde%></td>
			  <td align="right"><%=pmjj%></td>
			  <td align="right"><%=cf.formatDouble(sjf)%></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();

		if (fgsqys!=0)
		{
			pjde=(int)fgsqye/fgsqys;
		}
		else{
			pjde=0;
		}
		if (fgsfwmj!=0)
		{
			pmjj=(int)fgsqye/fgsfwmj;
		}
		else{
			pmjj=0;
		}

		%>
		<tr  align="center" height="29" >
		  <td colspan="2"><font color="#0000FF"><b><%=fgsmc%>小计</b></font></td>
		  <td><font color="#0000FF"><b><%=fgskls%></b></font></td>
		  <td><font color="#0000FF"><b><%=fgsztkhs%></b></font></td>
		  <td><font color="#0000FF"><b><%=fgsjdjs%></b></font></td>
		  <td align="right"><font color="#0000FF"><b><%=fgsdje%></b></font></td>
		  <td><font color="#0000FF"><b><%=fgsqys%></b></font></td>
		  <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(fgsqye)%></b></font></td>
		  <td align="right"><font color="#0000FF"><b><%=pjde%></b></font></td>
		  <td align="right"><font color="#0000FF"><b><%=pmjj%></b></font></td>
		  <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(fgssjf)%></b></font></td>
		</tr>
		<%	
	}
	rs2.close();
	ps2.close();

	
	if (allqys!=0)
	{
		pjde=(int)allqye/allqys;
	}
	else{
		pjde=0;
	}
	if (allfwmj!=0)
	{
		pmjj=(int)allqye/allfwmj;
	}
	else{
		pmjj=0;
	}
	

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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<tr  align="center" height="29" >
  <td colspan="2"><font color="#0000FF"><b>总&nbsp;&nbsp;&nbsp;&nbsp;计</b></font></td>
  <td><font color="#0000FF"><b><%=allkls%></b></font></td>
  <td><font color="#0000FF"><b><%=allztkhs%></b></font></td>
  <td><font color="#0000FF"><b><%=alljdjs%></b></font></td>
  <td align="right"><font color="#0000FF"><b><%=alldje%></b></font></td>
  <td><font color="#0000FF"><b><%=allqys%></b></font></td>
  <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(allqye)%></b></font></td>
  <td align="right"><font color="#0000FF"><b><%=pjde%></b></font></td>
  <td align="right"><font color="#0000FF"><b><%=pmjj%></b></font></td>
  <td align="right"><font color="#0000FF"><b><%=cf.formatDouble(allsjf)%></b></font></td>
</tr>

</table>
</body>
</html>