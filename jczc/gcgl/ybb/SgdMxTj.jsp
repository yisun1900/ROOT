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

	String sjfw=null;
	String sjfw2=null;


	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");
	
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (hflxbm!=null)
	{
		if (!(hflxbm.equals("")))	wheresql+=" and crm_hfjl.hflxbm='"+hflxbm+"'";
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>施工队回访明细（回访类型：<%=hflxmc%>）<BR>
  (回访时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2">序号</td>
    <td rowspan="2">项目经理</td>
    <td rowspan="2">回访次数</td>
    <td colspan="5">服务态度</td>
    <td colspan="5">施工质量</td>
    <td colspan="5">工人素质</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="5%" bgcolor="#CC99FF">5分</td>
    <td  width="5%" bgcolor="#9999FF">4分</td>
    <td  width="5%" bgcolor="#CCFFCC">3分</td>
    <td  width="5%" bgcolor="#CCFFCC">2分</td>
    <td  width="5%" bgcolor="#CCFFCC">1分</td>
    <td  width="5%" bgcolor="#CC99FF">5分</td>
    <td  width="5%" bgcolor="#9999FF">4分</td>
    <td  width="5%" bgcolor="#CCFFCC">3分</td>
    <td  width="5%" bgcolor="#CCFFCC">2分</td>
    <td  width="5%" bgcolor="#CCFFCC">1分</td>
    <td  width="5%" bgcolor="#CC99FF">5分</td>
    <td  width="5%" bgcolor="#9999FF">4分</td>
    <td  width="5%" bgcolor="#CCFFCC">3分</td>
    <td  width="5%" bgcolor="#CCFFCC">2分</td>
    <td  width="5%" bgcolor="#CCFFCC">1分</td>
  </tr>
  <%
String all=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String ys=null;

String sgd=null;
String sgdmc=null;
int hfcs=0;
int allhfcs=0;

int fwsz21=0;
int fwsz22=0;
int fwsz23=0;
int fwsz24=0;
int fwsz25=0;

int sgzl21=0;
int sgzl22=0;
int sgzl23=0;
int sgzl24=0;
int sgzl25=0;

int grsz21=0;
int grsz22=0;
int grsz23=0;
int grsz24=0;
int grsz25=0;

String fwsz=null;
String sgzl=null;
String grsz=null;
int sl=0;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT crm_khxx.sgd,sgdmc,count(*) hfcs";
	ls_sql+=" FROM crm_hfjl,crm_khxx,sq_sgd ";
	ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
    ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.sgd,sgdmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		hfcs=rs.getInt("hfcs");

		allhfcs+=hfcs;

		row++;

		
		//施工队服务态度
		fwsz21=0;
		fwsz22=0;
		fwsz23=0;
		fwsz24=0;
		fwsz25=0;

		ls_sql="SELECT fwsz,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" group by fwsz";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			fwsz=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (fwsz.equals("24"))
			{
				fwsz21=sl;
			}
			else if (fwsz.equals("25"))
			{
				fwsz22=sl;
			}
			else if (fwsz.equals("26"))
			{
				fwsz23=sl;
			}
			else if (fwsz.equals("27"))
			{
				fwsz24=sl;
			}
			else if (fwsz.equals("28"))
			{
				fwsz25=sl;
			}
		}
		rs1.close();
		ps1.close();

		//施工队施工质量
		sgzl21=0;
		sgzl22=0;
		sgzl23=0;
		sgzl24=0;
		sgzl25=0;

		ls_sql="SELECT sgzl,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" group by sgzl";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			sgzl=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (sgzl.equals("24"))
			{
				sgzl21=sl;
			}
			else if (sgzl.equals("25"))
			{
				sgzl22=sl;
			}
			else if (sgzl.equals("26"))
			{
				sgzl23=sl;
			}
			else if (sgzl.equals("27"))
			{
				sgzl24=sl;
			}
			else if (sgzl.equals("28"))
			{
				sgzl25=sl;
			}
		}
		rs1.close();
		ps1.close();

		//施工队工人素质
		grsz21=0;
		grsz22=0;
		grsz23=0;
		grsz24=0;
		grsz25=0;

		ls_sql="SELECT grsz,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
		ls_sql+=" group by grsz";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			grsz=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (grsz.equals("24"))
			{
				grsz21=sl;
			}
			else if (grsz.equals("25"))
			{
				grsz22=sl;
			}
			else if (grsz.equals("26"))
			{
				grsz23=sl;
			}
			else if (grsz.equals("27"))
			{
				grsz24=sl;
			}
			else if (grsz.equals("28"))
			{
				grsz25=sl;
			}
		}
		rs1.close();
		ps1.close();


		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}

%> 
  <tr bgcolor="<%=ys%>"  align="center"> 
    <td ><%=row%></td>
    <td ><%=sgdmc%></td>
    <td ><%=hfcs%></td>
    <td bgcolor="#CC99FF" ><%=fwsz25%></td>
    <td bgcolor="#9999FF" ><%=fwsz24%></td>
    <td bgcolor="#CCFFCC" ><%=fwsz23%></td>
    <td bgcolor="#CCFFCC" ><%=fwsz22%></td>
    <td bgcolor="#CCFFCC" ><%=fwsz21%></td>

    <td bgcolor="#CC99FF" ><%=sgzl25%></td>
    <td bgcolor="#9999FF" ><%=sgzl24%></td>
    <td bgcolor="#CCFFCC" ><%=sgzl23%></td>
    <td bgcolor="#CCFFCC" ><%=sgzl22%></td>
    <td bgcolor="#CCFFCC" ><%=sgzl21%></td>

    <td bgcolor="#CC99FF" ><%=grsz25%></td>
    <td bgcolor="#9999FF" ><%=grsz24%></td>
    <td bgcolor="#CCFFCC" ><%=grsz23%></td>
    <td bgcolor="#CCFFCC" ><%=grsz22%></td>
     <td bgcolor="#CCFFCC" ><%=grsz21%></td>
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
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