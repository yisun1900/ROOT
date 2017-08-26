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
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
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
  <B>设计师回访统计（回访类型：<%=hflxmc%>）<BR>
  (回访时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="5%">序号</td>
    <td rowspan="2" width="16%">店面</td>
    <td rowspan="2" width="8%">设计师</td>
    <td rowspan="2" width="8%">回访次数</td>
    <td colspan="3">设计方案</td>
    <td colspan="3">后期服务</td>
    <td colspan="3">交底清楚</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="7%" bgcolor="#CC99FF">满意</td>
    <td  width="7%" bgcolor="#9999FF">较满意</td>
    <td  width="7%" bgcolor="#CCFFCC">不满意</td>
    <td  width="7%" bgcolor="#CC99FF">满意</td>
    <td  width="7%" bgcolor="#9999FF">较满意</td>
    <td  width="7%" bgcolor="#CCFFCC">不满意</td>
    <td  width="7%" bgcolor="#CC99FF">满意</td>
    <td  width="7%" bgcolor="#9999FF">较满意</td>
    <td  width="7%" bgcolor="#CCFFCC">不满意</td>
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

String sjs=null;
String dwmc=null;
int hfcs=0;
int allhfcs=0;

int sjfa21=0;
int sjfa22=0;
int sjfa23=0;

int hqfw21=0;
int hqfw22=0;
int hqfw23=0;

int jdqk21=0;
int jdqk22=0;
int jdqk23=0;

String sjfa=null;
String hqfw=null;
String jdqk=null;
int sl=0;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT dwmc,sjs,count(*) hfcs";
	ls_sql+=" FROM crm_hfjl,crm_khxx,sq_dwxx ";
	ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
    ls_sql+=wheresql;
	ls_sql+=" group by dwmc,crm_khxx.sjs";
	ls_sql+=" order by dwmc,crm_khxx.sjs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hfcs=rs.getInt("hfcs");

		allhfcs+=hfcs;

		row++;

		
		//设计师设计方案
		sjfa21=0;
		sjfa22=0;
		sjfa23=0;

		ls_sql="SELECT sjfa,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.sjs='"+sjs+"'";
		ls_sql+=" group by sjfa";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			sjfa=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (sjfa.equals("21"))
			{
				sjfa21=sl;
			}
			else if (sjfa.equals("22"))
			{
				sjfa22=sl;
			}
			else if (sjfa.equals("23"))
			{
				sjfa23=sl;
			}
		}
		rs1.close();
		ps1.close();

		//设计师后期服务
		hqfw21=0;
		hqfw22=0;
		hqfw23=0;

		ls_sql="SELECT hqfw,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.sjs='"+sjs+"'";
		ls_sql+=" group by hqfw";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			hqfw=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (hqfw.equals("21"))
			{
				hqfw21=sl;
			}
			else if (hqfw.equals("22"))
			{
				hqfw22=sl;
			}
			else if (hqfw.equals("23"))
			{
				hqfw23=sl;
			}
		}
		rs1.close();
		ps1.close();

		//设计师交底清楚
		jdqk21=0;
		jdqk22=0;
		jdqk23=0;

		ls_sql="SELECT jdqk,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.sjs='"+sjs+"'";
		ls_sql+=" group by jdqk";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			jdqk=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (jdqk.equals("21"))
			{
				jdqk21=sl;
			}
			else if (jdqk.equals("22"))
			{
				jdqk22=sl;
			}
			else if (jdqk.equals("23"))
			{
				jdqk23=sl;
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
    <td width="5%" ><%=row%></td>
    <td width="16%" ><%=dwmc%></td>
    <td width="8%" ><%=sjs%></td>
    <td width="8%" ><%=hfcs%></td>
    <td width="7%" bgcolor="#CC99FF" ><%=sjfa21%></td>
    <td width="7%" bgcolor="#9999FF" ><%=sjfa22%></td>
    <td width="7%" bgcolor="#CCFFCC" ><%=sjfa23%></td>
    <td width="7%" bgcolor="#CC99FF" ><%=hqfw21%></td>
    <td width="7%" bgcolor="#9999FF" ><%=hqfw22%></td>
    <td width="7%" bgcolor="#CCFFCC" ><%=hqfw23%></td>
    <td width="7%" bgcolor="#CC99FF" ><%=jdqk21%></td>
    <td width="7%" bgcolor="#9999FF" ><%=jdqk22%></td>
    <td width="7%" bgcolor="#CCFFCC" ><%=jdqk23%></td>
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