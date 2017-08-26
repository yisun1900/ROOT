<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

String yddbh=null;
String zjxfssj=null;
String jc_mmydd_khxm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jc_mmzjx.yddbh,crm_khxx.khxm,jc_mmzjx.zjxfssj";
	ls_sql+=" from  jc_mmzjx,crm_khxx";
	ls_sql+=" where jc_mmzjx.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and jc_mmzjx.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
	}
	rs.close();
	ps.close();


%>

<html>
<head>
<title>�����ڴ�ľ��ȷ�ϱ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="100%" > 
        <table width="100%" border="0" style='FONT-SIZE: 20px'>
          <tr> 
            <td width="40%"><strong>�����ţ�<%=yddbh%></strong></td>
            <td width="60%"><strong>Ԫ �� ľ �� �� ͬ �� ���������</strong></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr> 
    <td> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="280" scope="row">�ͻ�������<%=jc_mmydd_khxm%></td>
          <td width="265" scope="row"> 
            <div align="left"> ���湤����¼��</div>
          </td>
          
        <td width="200">&nbsp;</td>
        </tr>
      </table>
      <b style='FONT-SIZE: 14px'>ľ��Ʒ����</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="20%">ͼƬ</td>
          <td  width="20%">ͼƬ</td>
          <td  width="20%">ͼƬ</td>
          <td  width="20%">ͼƬ</td>
          <td  width="20%">ͼƬ</td>
        </tr>
		<tr align="center"> 

<%
	String mmxh=null;
	String zp=null;

	int row=0;
	ls_sql="SELECT distinct jc_mmdgdmx.mmxh,jc_mmxhb.zp";
	ls_sql+=" FROM jc_mmdgdmx,jc_mmxhb,jc_mmzjxmx";
    ls_sql+=" where jc_mmdgdmx.mmxh=jc_mmxhb.mmxh";
    ls_sql+=" and jc_mmdgdmx.xh=jc_mmzjxmx.xh and jc_mmzjxmx.yddbh='"+yddbh+"' and jc_mmzjxmx.zjxxh="+zjxxh;
    ls_sql+=" order by jc_mmdgdmx.mmxh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		mmxh=cf.fillHtml(rs.getString("mmxh"));
		zp=cf.fillHtml(rs.getString("zp"));

		row++;

		%>
		  <td align="center"><IMG SRC="/jcjj/mmxh/images/<%=zp%>" height="250"><BR><%=row%>:��ʽ/��ţ�<%=mmxh%></td>
		<%

		if (row%5==0)
		{
			%>
			</tr>
			<tr align="center"> 
			<%
		}


	}
	rs.close();
	ps.close();
%> 
		</tr>
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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	  }
	 catch (Exception e){
		 if (conn != null) cf.close(conn); 
	 }
}
%> 


<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">�ͻ�ǩ�֣�</td>
          <td width="630">�����ˣ�</td>
        </tr>
        <tr> 
          <td colspan="2">ǩ�����ڣ�<%=zjxfssj%></td>
          <td width="630">ǩ�����ڣ�<%=zjxfssj%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>



