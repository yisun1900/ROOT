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
  <B>质检员回访明细（回访类型：<%=hflxmc%>）<BR>
  (回访时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2">序号</td>
    <td rowspan="2">质检员</td>
    <td rowspan="2">回访次数</td>
    <td colspan="5">质检员服务</td>
    <td colspan="5">质检员到位</td>
    <td colspan="5">质检员尽责</td>
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

String zjxm=null;
int hfcs=0;
int allhfcs=0;

int zjyfw21=0;
int zjyfw22=0;
int zjyfw23=0;
int zjyfw24=0;
int zjyfw25=0;

int zjydw21=0;
int zjydw22=0;
int zjydw23=0;
int zjydw24=0;
int zjydw25=0;

int zjyjz21=0;
int zjyjz22=0;
int zjyjz23=0;
int zjyjz24=0;
int zjyjz25=0;

String zjyfw=null;
String zjydw=null;
String zjyjz=null;
int sl=0;

try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT zjxm,count(*) hfcs";
	ls_sql+=" FROM crm_hfjl,crm_khxx ";
	ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
    ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.zjxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
		hfcs=rs.getInt("hfcs");

		allhfcs+=hfcs;

		row++;

		
		//质检员服务
		zjyfw21=0;
		zjyfw22=0;
		zjyfw23=0;
		zjyfw24=0;
		zjyfw25=0;

		ls_sql="SELECT zjyfw,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ls_sql+=" group by zjyfw";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			zjyfw=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (zjyfw.equals("24"))
			{
				zjyfw21=sl;
			}
			else if (zjyfw.equals("25"))
			{
				zjyfw22=sl;
			}
			else if (zjyfw.equals("26"))
			{
				zjyfw23=sl;
			}
			else if (zjyfw.equals("27"))
			{
				zjyfw24=sl;
			}
			else if (zjyfw.equals("28"))
			{
				zjyfw25=sl;
			}
		}
		rs1.close();
		ps1.close();

		//质检员到位
		zjydw21=0;
		zjydw22=0;
		zjydw23=0;
		zjydw24=0;
		zjydw25=0;

		ls_sql="SELECT zjydw,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ls_sql+=" group by zjydw";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			zjydw=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (zjydw.equals("24"))
			{
				zjydw21=sl;
			}
			else if (zjydw.equals("25"))
			{
				zjydw22=sl;
			}
			else if (zjydw.equals("26"))
			{
				zjydw23=sl;
			}
			else if (zjydw.equals("27"))
			{
				zjydw24=sl;
			}
			else if (zjydw.equals("28"))
			{
				zjydw25=sl;
			}
		}
		rs1.close();
		ps1.close();

		//质检员尽责
		zjyjz21=0;
		zjyjz22=0;
		zjyjz23=0;
		zjyjz24=0;
		zjyjz25=0;

		ls_sql="SELECT zjyjz,count(*) ";
		ls_sql+=" FROM crm_hfjl,crm_khxx ";
		ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.jglxbm not in('6','7')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
		ls_sql+=" group by zjyjz";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			zjyjz=cf.fillNull(rs1.getString(1));
			sl=rs1.getInt(2);

			if (zjyjz.equals("24"))
			{
				zjyjz21=sl;
			}
			else if (zjyjz.equals("25"))
			{
				zjyjz22=sl;
			}
			else if (zjyjz.equals("26"))
			{
				zjyjz23=sl;
			}
			else if (zjyjz.equals("27"))
			{
				zjyjz24=sl;
			}
			else if (zjyjz.equals("28"))
			{
				zjyjz25=sl;
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
    <td ><%=zjxm%></td>
    <td ><%=hfcs%></td>

    <td bgcolor="#CC99FF" ><%=zjyfw25%></td>
    <td bgcolor="#9999FF" ><%=zjyfw24%></td>
    <td bgcolor="#CCFFCC" ><%=zjyfw23%></td>
    <td bgcolor="#CCFFCC" ><%=zjyfw22%></td>
    <td bgcolor="#CCFFCC" ><%=zjyfw21%></td>

    <td bgcolor="#CC99FF" ><%=zjydw25%></td>
    <td bgcolor="#9999FF" ><%=zjydw24%></td>
    <td bgcolor="#CCFFCC" ><%=zjydw23%></td>
    <td bgcolor="#CCFFCC" ><%=zjydw22%></td>
    <td bgcolor="#CCFFCC" ><%=zjydw21%></td>

    <td bgcolor="#CC99FF" ><%=zjyjz25%></td>
    <td bgcolor="#9999FF" ><%=zjyjz24%></td>
    <td bgcolor="#CCFFCC" ><%=zjyjz23%></td>
    <td bgcolor="#CCFFCC" ><%=zjyjz22%></td>
    <td bgcolor="#CCFFCC" ><%=zjyjz21%></td>
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