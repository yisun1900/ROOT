<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ѵ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��ѵ���</div>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="3%">&nbsp;</td>
	<td  width="7%">��ѵ�ƻ����</td>
	<td  width="12%">��ѵ�ƻ�����</td>
	<td  width="5%">��ѵ����</td>
	<td  width="6%">��ѵ����</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="5%">�ƻ�״̬</td>
	<td  width="10%">״̬����</td>
	<td  width="5%">��˽���</td>
	<td  width="6%">�Ƿ�ƻ���</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼���˷ֹ�˾</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="18%">��ע</td>
  </tr>
<%

String[] ztbm=request.getParameterValues("ztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String pxjhmc=null;

String pxjhbh=null;
int pxrs=0;
double pxfy=0;
String fgs=null;
String jhzt=null;
String ztbm_o=null;
String shjl=null;
String jhkssj=null;
String jhjssj=null;
String lrr=null;
String ssfgs=null;
String lrsj=null;
String bz=null;
String pxlx=null;
String sfjhn=null;


String ys=null;

try {
	conn=cf.getConnection();

	int row=0;
	for(int i=0;i<ztbm.length;i++){
	ls_sql="SELECT rs_pxjh.pxjhbh pxjhbh,pxjhmc,pxrs,pxfy,a.dwmc fgs,DECODE(jhzt,'0','¼��δ���','1','�ȴ�����','2','����������','3','��ѵ���','4','����δͨ��','5','�޸ļƻ�') jhzt ,rs_ztbm.ztmc ztbm,rs_pxshbm.shjlmc shjl,DECODE(sfjhn,'0','�ƻ���','1','�ƻ���') sfjhn,lrr,b.dwmc ssfgs,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,rs_pxjh.bz bz ";
	ls_sql+=" FROM rs_pxjh,rs_pxshbm,sq_dwxx a,sq_dwxx b,rs_ztbm  ";
    ls_sql+=" where rs_pxshbm.shjl=rs_pxjh.shjl and a.dwbh=rs_pxjh.fgs and jhzt!='0' and b.dwbh=rs_pxjh.ssfgs and rs_ztbm.ztbm=rs_pxjh.ztbm and rs_pxjh.ztbm='"+ztbm[i]+"'";
	ls_sql+=" order by rs_pxjh.pxjhbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		pxjhbh=rs.getString("pxjhbh");
		pxjhmc=rs.getString("pxjhmc");
		pxrs=rs.getInt("pxrs");
		pxfy=rs.getDouble("pxfy");
		fgs=rs.getString("fgs");
		jhzt=rs.getString("jhzt");
		ztbm_o=rs.getString("ztbm");
		shjl=rs.getString("shjl");
		sfjhn=rs.getString("sfjhn");
		lrr=rs.getString("lrr");
		ssfgs=rs.getString("ssfgs");
		lrsj=rs.getString("lrsj");
		bz=cf.fillHtml(rs.getString("bz"));

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>">
	<td><A HREF="InsertRs_pxsh.jsp?pxjhbh=<%=pxjhbh%>" target="_blank">���</A></td>
    <td><A HREF="viewpxjhmx.jsp?pxjhbh=<%=pxjhbh%>" target="_blank"><%=pxjhbh%></A></td>
	<td><%=pxjhmc%></td>
    <td><%=pxrs%></td>
    <td><%=pxfy%></td>
    <td><%=fgs%></td>
    <td><%=jhzt%></td>
    <td><%=ztbm_o%></td>
    <td><%=shjl%></td>
    <td><%=sfjhn%></td>
    <td><%=lrr%></td>
    <td><%=ssfgs%></td>
    <td><%=lrsj%></td>
    <td><%=bz%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
	}

}
catch (Exception e) {
	out.print("Exception: " + e+"<br>");
	out.print("<font color=red>��ѡ������״̬!</font>");
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
</table>
</body>
</html>
