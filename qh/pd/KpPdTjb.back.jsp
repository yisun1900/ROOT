<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�ͳ��</font></B>
</CENTER>

<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">��������</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">�ܷ�</td>
	<td  width="1%">�ܷ�����</td>
	<td  width="1%">��������</td>
	<td  width="1%">�ʱ���</td>
	<td  width="1%">������</td>
	<td  width="1%">�ɽӴ���</td>
	<td  width="1%">�ɽ��е���</td>
	<td  width="1%">�ɽ�С����</td>
	<td  width="1%">�ɽӵ�����</td>
	<td  width="1%">�ɽӵ��ܶ�</td>
	<td  width="1%">�ѽӴ���</td>
	<td  width="1%">�ѽӴ󵥽��</td>
	<td  width="1%">�ѽ��е���</td>
	<td  width="1%">�ѽ��е����</td>
	<td  width="1%">�ѽ�С����</td>
	<td  width="1%">�ѽ�С�����</td>
	<td  width="1%">�ѽӵ�����</td>
	<td  width="1%">�ѽӵ��ܶ�</td>
	<td  width="1%">Ƿ�Ӵ���</td>
	<td  width="1%">Ƿ���е���</td>
	<td  width="1%">Ƿ��С����</td>
	<td  width="1%">���깤��</td>
	<td  width="1%">��ʩ������</td>
</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dwmc=null;
	int zbj=0;
	int bzs=0;
	int zf=0;
	int zfpm=0;
	int sqpm=0;
	int bqpm=0;
	int kjdds=0;
	int kjzds=0;
	int kjxds=0;
	int kjdzs=0,kjdze=0,yjdds=0,yjddje=0,yjzds=0,yjzdje=0,yjxds=0,yjxdje=0,ywgs=0,zsgds=0;

	int count=0;
	ls_sql="SELECT sgdmc,kp_sgdkpjg.zbj,kp_sgdkpjg.bzs,zf,zfpm,sqpm,bqpm,kjdds,kjzds,kjxds,kjdzs,kjdze,yjdds,yjddje,yjzds,yjzdje,yjxds,yjxdje,ywgs,zsgds ";
	ls_sql+=" FROM sq_sgd,kp_sgdkpjg,kp_kpjl  ";
    ls_sql+=" where kp_sgdkpjg.sgd=sq_sgd.sgd";
    ls_sql+=" and kp_sgdkpjg.kpjlh=kp_kpjl.kpjlh  and zxbz='Y'";
    ls_sql+=" order by kp_sgdkpjg.bqpm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		count++;
		dwmc=rs.getString("sgdmc");
		zbj=rs.getInt("zbj");
		bzs=rs.getInt("bzs");
		zf=rs.getInt("zf");
		zfpm=rs.getInt("zfpm");
		sqpm=rs.getInt("sqpm");
		bqpm=rs.getInt("bqpm");
		kjdds=rs.getInt("kjdds");
		kjzds=rs.getInt("kjzds");
		kjxds=rs.getInt("kjxds");

		if (count%2==1)
		{
			out.println("<tr  bgcolor=\"#FFFFFF\" align=\"center\">");
		}
		else{
			out.println("<tr  bgcolor=\"#E8E8FF\" align=\"center\">");
		}
%>

	<td><%=bqpm%></td>
	<td><%=dwmc%></td>
	<td><%=zf%></td>
	<td><%=zfpm%></td>
	<td><%=sqpm%></td>
	<td><%=zbj%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
	<td><%=dwmc%></td>
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
		if (ps!= null) ps.close(); 
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