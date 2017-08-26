<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090414'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[房屋面积分析]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[房屋面积分析]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String jzbz=request.getParameter("jzbz");
String tjsj=request.getParameter("tjsj");

String wheresql="";
String wheresql1="";


if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (ssfgs='"+fgs+"')";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

if (tjsj.equals("1"))
{
	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("2"))
{
	wheresql+=" and jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("3"))
{
	wheresql+=" and cwjzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and cwjzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else if (tjsj.equals("4"))
{
	wheresql+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}


String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String getfgsbh=null;
String getfgsmc=null;
String hxmjbm=null;
String hxmjmc=null;
int qys=0;
double qye=0;
double fwmj=0;
int pjde=0;
int pmjj=0;

try {
	conn=cf.getConnection();


%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>房屋面积分析 </B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>

<table border="1" width="250%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="4%" rowspan="2">分公司</td>
  <td  width="2%" rowspan="2">签约数</td>
  <td  width="4%" rowspan="2">签约额</td>
  <td  width="2%" rowspan="2">平均单额</td>
  <td  width="2%" rowspan="2">平米均价</td>

<%
	ls_sql=" SELECT hxmjbm,hxmjmc";
	ls_sql+=" FROM dm_hxmjbm";
	ls_sql+=" order by hxmjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hxmjbm=rs.getString("hxmjbm");
		hxmjmc=rs.getString("hxmjmc");

		%>
		  <td  width="7%" colspan="4"><%=hxmjmc%></td>
		<%
	}
	rs.close();
	ps.close();
%>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
<%
	ls_sql=" SELECT hxmjbm,hxmjmc";
	ls_sql+=" FROM dm_hxmjbm";
	ls_sql+=" order by hxmjbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hxmjbm=rs.getString("hxmjbm");
		hxmjmc=rs.getString("hxmjmc");

		%>
		  <td  width="2%">签约数</td>
		  <td  width="3%">签约额</td>
		  <td  width="2%">平均单额</td>
		  <td  width="2%">平米均价</td>
		<%
	}
	rs.close();
	ps.close();
%>
</tr>
<%
	//获取最大数




	ls_sql=" SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0' ";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("dwbh");
		getfgsmc=rs.getString("dwmc");

		int fgsqys=0;
		double fgsqye=0;
		double fgsfwmj=0;
		int fgspjde=0;
		int fgspmjj=0;
		ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,dm_hxmjbm";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=wheresql;
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			fgsqys=rs2.getInt("qys");
			fgsqye=rs2.getDouble("qye");
			fgsfwmj=rs2.getDouble("fwmj");
		}
		rs2.close();
		ps2.close();

		if (fgsqys==0)
		{
			fgspjde=0;
		}
		else{
			fgspjde=(int)(fgsqye/fgsqys);
		}

		if (fgsfwmj==0)
		{
			fgspmjj=0;
		}
		else{
			fgspmjj=(int)(fgsqye/fgsfwmj);
		}

		%>
		<tr align="center">
			<td ><%=getfgsmc%></td>
			<td ><%=cf.formatDouble(fgsqys)%></td>
			<td ><%=cf.formatDouble(fgsqye)%></td>
			<td ><%=cf.formatDouble(fgspjde)%></td>
			<td ><%=cf.formatDouble(fgspmjj)%></td>
		<%	
	

		ls_sql=" SELECT hxmjbm,hxmjmc";
		ls_sql+=" FROM dm_hxmjbm";
		ls_sql+=" order by hxmjbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			hxmjbm=rs1.getString("hxmjbm");
			hxmjmc=rs1.getString("hxmjmc");

			qys=0;
			qye=0;
			fwmj=0;
			ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(fwmj) fwmj";
			ls_sql+=" FROM crm_khxx,dm_hxmjbm";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
			ls_sql+=" and crm_khxx.hxmjbm='"+hxmjbm+"'";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				qys=rs2.getInt("qys");
				qye=rs2.getDouble("qye");
				fwmj=rs2.getDouble("fwmj");

				pjde=0;
				pmjj=0;

				if (qys==0)
				{
					pjde=0;
				}
				else{
					pjde=(int)(qye/qys);
				}

				if (fwmj==0)
				{
					pmjj=0;
				}
				else{
					pmjj=(int)(qye/fwmj);
				}
			}
			rs2.close();
			ps2.close();

			%>
				<td  align="right"><%=cf.formatDouble(qys)%></td>
				<td  align="right"><%=cf.formatDouble(qye)%></td>
				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<%	
		
		
		}
		rs1.close();
		ps1.close();

		%>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

