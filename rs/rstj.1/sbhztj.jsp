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
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
//String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
	wheresql1+=" and  (sq_dwxx.dwbh='"+fgs+"')";
	wheresql2+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
wheresql2+=" and crm_khxx.jzkscsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql2+=" and crm_khxx.jzkscsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

//if (!(dwbh.equals("")))
//{
//	wheresql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
//}

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

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�籣���ܣ�<%=sjfw%>��<%=sjfw2%>��</B><BR>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="13%">�ֹ�˾</td>
  <td  width="12%">�α�������</td>
  <td  width="13%">��˾�ɷ��ܶ�</td>
  <td  width="12%">ռ��ֵ��</td>
  <td  width="13%">���˽ɷ��ܶ�</td>
  <td  width="12%">ռ��ֵ��</td>
  <td  width="13%">�ɷѺϼƽ��</td>
  <td  width="12%">ռ��ֵ��</td>
</tr>
<%
	int ygzs=0;//�α�Ա������
	String dwbh=null;
	String dwmc=null;
	int cbrs=0;//�ֹ�˾�α�Ա������
	double allzqye=0;//ǩԼ��
	double fgsqye=0;//ǩԼ��
	double gsjbfe=0;//��˾�����
	double grjbfe=0;//���˽ɿ��
	double allgsjbfe=0;//��˾�����
	double allgrjbfe=0;//���˽ɿ��

	double bfb1=0;
	double bfb2=0;
	double bfb3=0;

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sfzszg in ('Y','N') and sfcjbx='Y'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ygzs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if(ygzs==0)
	{
		return;
	}

	//��ҵ��
	ls_sql="SELECT sum(qye)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	//��ҵ�������ء�
	if(allzqye==0)
	{
		return;
	}

	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx='F0'";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=rs.getString(1);
		dwmc=rs.getString(2);


		ls_sql="SELECT count(*),sum(gsjbfe),sum(grjbfe)";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sfzszg in ('Y','N') and sfcjbx='Y' and ssfgs='"+dwbh+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cbrs=rs1.getInt(1);
			gsjbfe=rs1.getDouble(2);
			grjbfe=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();
		
		allgsjbfe+=gsjbfe;
		allgrjbfe+=grjbfe;

		ls_sql="SELECT sum(qye)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2' and fgsbh='"+dwbh+"'";
		ls_sql+=wheresql2;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fgsqye=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (fgsqye==0)
		{
			bfb1=0;
			bfb2=0;
			bfb3=0;
		}
		else{
			bfb1=gsjbfe*100.0/fgsqye;
			bfb2=grjbfe*100.0/fgsqye;
			bfb3=(gsjbfe+grjbfe)*100.0/fgsqye;
		}
		%>
		<tr align="center">
			<td ><%=dwmc%></td>
			<td ><%=cbrs%></td>
			<td ><%=gsjbfe%></td>
			<td  align="right" ><%=cf.round(bfb1,1)%>%</td>
			<td ><%=grjbfe%></td>
			<td  align="right" ><%=cf.round(bfb2,1)%>%</td>
			<td ><%=grjbfe+gsjbfe%></td>
			<td  align="right" ><%=cf.round(bfb3,1)%>%</td>
		<%	
	}
	rs.close();
	ps.close();

		bfb1=allgsjbfe*100.0/allzqye;
		bfb2=allgrjbfe*100.0/allzqye;
		bfb3=(allgsjbfe+allgrjbfe)*100.0/allzqye;
%>
		<tr align="center">
			<td >�ܼ�</td>
			<td ><%=ygzs%></td>
			<td ><%=allgsjbfe%></td>
			<td  align="right" ><%=cf.round(bfb1,1)%>%</td>
			<td ><%=allgrjbfe%></td>
			<td  align="right" ><%=cf.round(bfb2,1)%>%</td>
			<td ><%=allgrjbfe+allgsjbfe%></td>
			<td  align="right" ><%=cf.round(bfb3,1)%>%</td>
	
</table>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " +e+"!"+ls_sql);
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

