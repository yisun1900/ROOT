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
  <B>���ʦ�ط�ͳ�ƣ��ط����ͣ�<%=hflxmc%>��<BR>
  (�ط�ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="5%">���</td>
    <td rowspan="2" width="16%">����</td>
    <td rowspan="2" width="8%">���ʦ</td>
    <td rowspan="2" width="8%">�طô���</td>
    <td colspan="5">��Ʒ���</td>
    <td colspan="5">���ڷ���</td>
    <td colspan="5">�������</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="5%" bgcolor="#CC99FF">5��</td>
    <td  width="5%" bgcolor="#9999FF">4��</td>
    <td  width="5%" bgcolor="#CCFFCC">3��</td>
    <td  width="5%" bgcolor="#CCFFCC">2��</td>
    <td  width="5%" bgcolor="#CCFFCC">1��</td>
    <td  width="5%" bgcolor="#CC99FF">5��</td>
    <td  width="5%" bgcolor="#9999FF">4��</td>
    <td  width="5%" bgcolor="#CCFFCC">3��</td>
    <td  width="5%" bgcolor="#CCFFCC">2��</td>
    <td  width="5%" bgcolor="#CCFFCC">1��</td>
    <td  width="5%" bgcolor="#CC99FF">5��</td>
    <td  width="5%" bgcolor="#9999FF">4��</td>
    <td  width="5%" bgcolor="#CCFFCC">3��</td>
    <td  width="5%" bgcolor="#CCFFCC">2��</td>
    <td  width="5%" bgcolor="#CCFFCC">1��</td>
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
int sjfa24=0;
int sjfa25=0;

int hqfw21=0;
int hqfw22=0;
int hqfw23=0;
int hqfw24=0;
int hqfw25=0;

int jdqk21=0;
int jdqk22=0;
int jdqk23=0;
int jdqk24=0;
int jdqk25=0;

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

		
		//���ʦ��Ʒ���
		sjfa21=0;
		sjfa22=0;
		sjfa23=0;
		sjfa24=0;
		sjfa25=0;

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

			if (sjfa.equals("24"))
			{
				sjfa21=sl;
			}
			else if (sjfa.equals("25"))
			{
				sjfa22=sl;
			}
			else if (sjfa.equals("26"))
			{
				sjfa23=sl;
			}
			else if (sjfa.equals("27"))
			{
				sjfa24=sl;
			}
			else if (sjfa.equals("28"))
			{
				sjfa25=sl;
			}
		}
		rs1.close();
		ps1.close();

		//���ʦ���ڷ���
		hqfw21=0;
		hqfw22=0;
		hqfw23=0;
		hqfw24=0;
		hqfw25=0;

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

			if (hqfw.equals("24"))
			{
				hqfw21=sl;
			}
			else if (hqfw.equals("25"))
			{
				hqfw22=sl;
			}
			else if (hqfw.equals("26"))
			{
				hqfw23=sl;
			}
			else if (hqfw.equals("27"))
			{
				hqfw24=sl;
			}
			else if (hqfw.equals("28"))
			{
				hqfw25=sl;
			}
		}
		rs1.close();
		ps1.close();

		//���ʦ�������
		jdqk21=0;
		jdqk22=0;
		jdqk23=0;
		jdqk24=0;
		jdqk25=0;

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

			if (jdqk.equals("24"))
			{
				jdqk21=sl;
			}
			else if (jdqk.equals("25"))
			{
				jdqk22=sl;
			}
			else if (jdqk.equals("26"))
			{
				jdqk23=sl;
			}
			else if (jdqk.equals("27"))
			{
				jdqk24=sl;
			}
			else if (jdqk.equals("28"))
			{
				jdqk25=sl;
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
    <td ><%=dwmc%></td>
    <td ><%=sjs%></td>
    <td ><%=hfcs%></td>
    <td bgcolor="#CC99FF" ><%=sjfa25%></td>
    <td bgcolor="#9999FF" ><%=sjfa24%></td>
    <td bgcolor="#CCFFCC" ><%=sjfa23%></td>
    <td bgcolor="#CCFFCC" ><%=sjfa22%></td>
    <td bgcolor="#CCFFCC" ><%=sjfa21%></td>

    <td bgcolor="#CC99FF" ><%=hqfw25%></td>
    <td bgcolor="#9999FF" ><%=hqfw24%></td>
    <td bgcolor="#CCFFCC" ><%=hqfw23%></td>
    <td bgcolor="#CCFFCC" ><%=hqfw22%></td>
    <td bgcolor="#CCFFCC" ><%=hqfw21%></td>

    <td bgcolor="#CC99FF" ><%=jdqk25%></td>
    <td bgcolor="#9999FF" ><%=jdqk24%></td>
    <td bgcolor="#CCFFCC" ><%=jdqk23%></td>
    <td bgcolor="#CCFFCC" ><%=jdqk22%></td>
    <td bgcolor="#CCFFCC" ><%=jdqk21%></td>
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