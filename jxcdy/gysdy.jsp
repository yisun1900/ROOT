<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String psph=request.getParameter("psph");
String gysmc=null;
int sl=0;

try {
	conn=cf.getConnection();

	String psdzt="";
	String shjl="";
	ls_sql="SELECT jxc_clpsd.shjl,jxc_clpsd.psdzt";
	ls_sql+=" FROM jxc_clpsd";
	ls_sql+=" where jxc_clpsd.psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shjl=cf.fillNull(rs.getString("shjl"));
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (  (psdzt.equals("0") || psdzt.equals("1")) || (psdzt.equals("6") && shjl.equals("N")))//0���ȴ��ύ��1���ȴ���ˣ�2���ȴ����⣻3���ѳ��⣻5�����ֳ��⣻6�����δͨ��
	{
		out.println("<P>����״̬����ȷ�����ܴ�ӡ��ֻ���ύ�������ͨ������ܴ�ӡ");
		return;
	}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center"><font size="5"><b>ѡ�񡾹�Ӧ�̡���ӡ�����ţ�<%=psph%>��</b></font> 
  <table border="1" cellspacing="0" cellpadding="1" width="50%" style='FONT-SIZE: 15px' >
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="18%" height="26">��Ӧ��</td>
      <td  width="8%" height="26">�����ӡ</td>
      <td  width="8%" height="26">��������</td>
    </tr>
    <%
	ls_sql="SELECT gysmc,count(*)";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"' ";
	ls_sql+=" group by gysmc ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
		sl=rs.getInt(2);
%> 
    <tr > 
      <td  height="25"> 
        <div align="center"><%=gysmc%></div>
      </td>
      <td  height="25"> 
        <div align="center"><A HREF="/jxcdy/gysdy1.jsp?psph=<%=psph%>&gysmc=<%=gysmc%>" target="_blank">��ӡ</A></div>
      </td>
      <td  height="25"> 
        <div align="center"><%=sl%></div>
      </td>
    </tr>
    <%
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
    <tr align="center" > 
      <td  height="58" colspan="3"> 
        <input type="button" name="Button" value="��ӡ���" onclick="window.open('MarkDy.jsp?psph=<%=psph%>')">
      </td>
    </tr>
  </table>
</div>
</body>

</html>
</script>

