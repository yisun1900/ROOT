<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>��Ƹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">��Ƹ���</div>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">&nbsp;</td>
	<td  width="8%">����������</td>
	<td  width="5%">��Ƹ����</td>
	<td  width="6%">��Ƹ����</td>
	<td  width="7%">�����ֹ�˾</td>
	<td  width="6%">�ƻ�״̬</td>
	<td  width="9%">״̬����</td>
	<td  width="6%">��˽���</td>
	<td  width="8%">�ƻ���ʼʱ��</td>
	<td  width="8%">�ƻ�����ʱ��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼���˷ֹ�˾</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="10%">��ע</td>
  </tr>
<%

String[] ztbm=request.getParameterValues("ztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String sqbh=null;
int zprs=0;
double zpfy=0;
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


String ys=null;

try {
	conn=cf.getConnection();

	int row=0;
	for(int i=0;i<ztbm.length;i++){
	ls_sql="SELECT rs_zpjh.sqbh sqbh,zprs,zpfy,a.dwmc fgs,DECODE(jhzt,'0','¼��δ���','1','�ȴ�����','2','����������','3','��Ƹ���','4','����δͨ��','5','�޸ļƻ�') jhzt ,rs_ztbm.ztmc ztbm,rs_ryzbsqbm.shjlmc shjl,TO_CHAR(jhkssj,'YYYY-MM-DD') jhkssj,TO_CHAR(jhjssj,'YYYY-MM-DD') jhjssj,lrr,b.dwmc ssfgs,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj,rs_zpjh.bz bz ";
	ls_sql+=" FROM rs_zpjh,rs_ryzbsqbm,sq_dwxx a,sq_dwxx b,rs_ztbm  ";
    ls_sql+=" where rs_ryzbsqbm.shjl=rs_zpjh.shjl and a.dwbh=rs_zpjh.fgs and jhzt!='0' and b.dwbh=rs_zpjh.ssfgs and rs_ztbm.ztbm=rs_zpjh.ztbm and rs_zpjh.ztbm='"+ztbm[i]+"'";
	ls_sql+=" order by rs_zpjh.sqbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sqbh=rs.getString("sqbh");
		zprs=rs.getInt("zprs");
		zpfy=rs.getDouble("zpfy");
		fgs=rs.getString("fgs");
		jhzt=rs.getString("jhzt");
		ztbm_o=rs.getString("ztbm");
		shjl=rs.getString("shjl");
		jhkssj=cf.fillHtml(rs.getString("jhkssj"));
		jhjssj=cf.fillHtml(rs.getString("jhjssj"));
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
	<td><A HREF="Insertrs_ryzbsq.jsp?sqbh=<%=sqbh%>" target="_blank">���</A></td>
    <td><A HREF="viewzpjhmx.jsp?sqbh=<%=sqbh%>" target="_blank"><%=sqbh%></A></td>
    <td><%=zprs%></td>
    <td><%=zpfy%></td>
    <td><%=fgs%></td>
    <td><%=jhzt%></td>
    <td><%=ztbm_o%></td>
    <td><%=shjl%></td>
    <td><%=jhkssj%></td>
    <td><%=jhjssj%></td>
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
