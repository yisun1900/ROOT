<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���̻ط�ͳ��<<%=hflxmc%>> <BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> <BR>
</CENTER>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int all=0;
int[] sl=new int[20];
String[] jglxmc=new String[20];
int i=0;

String ls1=null;
String ls2=null;
int sl1=0;

int ywt=0;//������ 
int mwt=0;//û������ 
int wlxs=0;//δ��ϵ��
int wkg=0;//δ����

try {
	conn=cf.getConnection();

	//��ȡ�ط�����
	ls_sql="SELECT jglxbm,jglxmc";
	ls_sql+=" FROM dm_jglxbm  ";
	ls_sql+=" where jglxbm not in('1','6','7')";//������
    ls_sql+=" order by jglxbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		ls1=rs1.getString(1);
		ls2=rs1.getString(2);

		//ȡ����������
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_hfjl,crm_khxx  ";
		ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
		ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_hfjl.jglxbm='"+ls1+"'";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sl1=rs.getInt(1);
		}
		rs.close();
		ps.close();

		jglxmc[i]=ls2;
		sl[i]=sl1;
		ywt+=sl[i];
		i++;
	}
	rs1.close();
	ps1.close();

	

	//��ȡû������
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_hfjl.jglxbm='1'";//1:û����
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mwt=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ȡδ��ϵ��
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_hfjl.jglxbm='6'";//6:δ��ϵ��
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wlxs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//��ȡδ����
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_hfjl,crm_khxx  ";
	ls_sql+=" where crm_hfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') ";
	ls_sql+=" and crm_hfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh ";
    ls_sql+=" and crm_hfjl.jglxbm='7'";//7:δ����
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wkg=rs.getInt(1);
	}
	rs.close();
	ps.close();

	all=ywt+mwt+wlxs+wkg;
	if (all==0)
	{
		out.println("û�лط�����");
		return;
	}

}
catch (Exception e) {
	out.print("��������: " + e);
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
<div align="center">���ͳ�� </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr align="center"> 
    <td rowspan="2" width="12%">&nbsp;</td>
    <td rowspan="2" width="11%">�ط�����</td>
    <td rowspan="2" width="11%">û������ </td>
    <td colspan="<%=(i+1)%>">��������</td>
    <td rowspan="2" width="10%">δ��ϵ�� </td>
    <td rowspan="2" width="9%">δ����</td>
  </tr>
  <tr align="center"> 
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<td  >"+jglxmc[j]+"</td>");
	}
	%>
    <td  align="center">�ϼ�</td>
  </tr>
  <tr align="center"> 
    <td width="12%" align="center">�������ˣ� </td>
    <td width="11%"><%=all%></td>
    <td width="11%"><%=mwt%></td>
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<td  >"+sl[j]+"</td>");
	}
	%>
    <td ><%=ywt%></td>
    <td width="10%"><%=wlxs%></td>
    <td width="9%"><%=wkg%></td>
  </tr>
  <tr align="center"> 
    <td width="12%" align="center">�ٷ��ʣ�%�� </td>
    <td width="11%">&nbsp;</td>
    <td width="11%"><%=  1000*mwt/all/10.0  %>%</td>
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<td  >"+1000*sl[j]/all/10.0+"%</td>");
	}
	%>
    <td ><%=  1000*ywt/all/10.0  %>%</td>
    <td width="10%"><%=  1000*wlxs/all/10.0  %>%</td>
    <td width="9%"><%=  1000*wkg/all/10.0  %>%</td>
  </tr>
</table>
<P><div align="center">ͼ��ͳ�� </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr height="30"> 
	<td width="35%" align="right">û������</td>
	<td width="65%"><img src="/images/ColuGif.gif" width=<%=400*mwt/(mwt+ywt)%> height=15>&nbsp;<%=cf.formatDouble(100.0*mwt/(mwt+ywt))%>%</td>
	</tr>
	<%
	for (int j=0;j<i;j++ )
	{
		out.println("<tr height=\"30\"> ");
		out.println("<td width=\"35%\" align=\"right\">"+jglxmc[j]+"</td>");
		out.println("<td width=\"65%\"><img src=\"/images/ColuGif.gif\" width="+400*sl[j]/(mwt+ywt)+" height=15>&nbsp;"+cf.formatDouble(100.0*sl[j]/(mwt+ywt))+"%</td>");
		out.println("</tr>");
	}
	%>
</table>
</body>
</html>
