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
int row=0;

try {
	conn=cf.getConnection();

%>
<CENTER >
  <b>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</b>
</CENTER>


<CENTER >
  <B>�г��������ͻ�ͳ��</B>
</CENTER>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">���</td>
  <td  width="6%">¼������</td>
  <td  width="6%">�ͻ�����</td>
  <td  width="11%">�绰</td>
  <td  width="16%">��ַ</td>
  <td  width="5%">ҵ��Ա</td>
  <td  width="6%">�ɵ�ʱ��</td>
  <td  width="5%">�������ʦ</td>
  <td  width="8%">����</td>
  <td  width="10%">�Żݳ�ŵ</td>
  <td  width="6%">ǩ�����Э��ʱ��</td>
  <td  width="6%">����ʱ��</td>
  <td  width="6%">�������ʱ��</td>
  <td  width="6%">ǩ��ʱ��</td>
</tr>
<%
	row=0;
	ls_sql=" SELECT dwmc,khbh,lrsj,khxm,lxfs,fwdz,sjsfpsj,sjs,cxhdbm,lfsj,ctsj,qdsj,ywy";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.zxzt in('0','1','2','3','4','5')";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and  crm_zxkhxx.ywy is not null";
	
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
		sjsfpsj=cf.fillHtml(rs.getDate("sjsfpsj"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		lfsj=cf.fillHtml(rs.getDate("lfsj"));
		ctsj=cf.fillHtml(rs.getDate("ctsj"));
		ywy=cf.fillHtml(rs.getString("ywy"));

		row++;


		ls_sql=" select qyrq";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qdsj=cf.fillHtml(rs1.getDate("qyrq"));
		}
		rs1.close();
		ps1.close();
		

		%>
		<tr  align="center">
		  <td><%=row%></td>
		  <td><%=lrsj%></td>
		  <td><%=khxm%></td>
		  <td><%=lxfs%></td>
		  <td><%=fwdz%></td>
		  <td><%=ywy%></td>
		  <td><%=sjsfpsj%></td>
		  <td><%=sjs%></td>
		  <td><%=dwmc%></td>
		  <td><%=cxhdbm%></td>
		  <td>&nbsp;</td>
		  <td><%=lfsj%></td>
		  <td><%=ctsj%></td>
		  <td><%=qdsj%></td>
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