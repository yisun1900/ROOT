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
<table border="1" width="150%" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
	<td  width="4%">&nbsp;</td>
	<td  width="7%">������</td>
	<td  width="7%">����ֹ�˾</td>
	<td  width="6%">���벿��</td>
	<td  width="6%">����ְ��</td>
	<td  width="6%">��Ƹ����</td>
	<td  width="6%">��Ƹ����</td>
	<td  width="6%">��Ƹ����</td>
	<td  width="8%">ϣ������ʱ��</td>
	<td  width="13%">����ְ��</td>
	<td  width="8%">���״̬</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼���˷ֹ�˾</td>
	<td  width="7%">¼��ʱ��</td>
  </tr>
<%

String[] ztbm=request.getParameterValues("ztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zpsqbh=null;
String fgs=null;
String sqbm=null;
String zbzw=null;
int zprs=0;
double zpfy=0;
String zbly=null;
String xwdgsj=null;
String rygznr=null;
String ztbm_o=null;
String lrr=null;
String ssfgs=null;
String lrsj=null;


String ys=null;

try {
	conn=cf.getConnection();

	int row=0;
	for(int i=0;i<ztbm.length;i++){
	ls_sql="SELECT rs_zpsq.zpsqbh zpsqbh,a.dwmc fgs,b.dwmc sqbm,dm_xzzwbm.xzzwmc zbzw,zprs,zpfy,DECODE(zbly,'0','����','1','ȱԱ����','2','�������','3','��������') zbly,TO_CHAR(xwdgsj,'YYYY-MM-DD') xwdgsj,rygznr,rs_ztbm.ztmc ztbm,lrr,c.dwmc ssfgs,TO_CHAR(lrsj,'YYYY-MM-DD') lrsj ";
	ls_sql+=" FROM rs_zpsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,dm_xzzwbm  ";
    ls_sql+=" where rs_zpsq.zbzw=dm_xzzwbm.xzzwbm and a.dwbh=rs_zpsq.fgs and b.dwbh=rs_zpsq.sqbm and c.dwbh=rs_zpsq.ssfgs and rs_zpsq.sqzt in ('01','02') and rs_ztbm.ztbm=rs_zpsq.ztbm and rs_zpsq.ztbm='"+ztbm[i]+"'";
	ls_sql+=" order by rs_zpsq.zpsqbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		zpsqbh=rs.getString("zpsqbh");
		fgs=rs.getString("fgs");
		sqbm=rs.getString("sqbm");
		zbzw=rs.getString("zbzw");
		zprs=rs.getInt("zprs");
		zpfy=rs.getDouble("zpfy");
		zbly=rs.getString("zbly");
		xwdgsj=cf.fillHtml(rs.getString("xwdgsj"));
		rygznr=cf.fillHtml(rs.getString("rygznr"));
		ztbm_o=rs.getString("ztbm");
		lrr=rs.getString("lrr");
		ssfgs=rs.getString("ssfgs");
		lrsj=rs.getString("lrsj");

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
	<td><A HREF="InsertRs_zpsh.jsp?zpsqbh=<%=zpsqbh%>" target="_blank">���</A></td>
    <td><A HREF="ViewRs_zpsq.jsp?zpsqbh=<%=zpsqbh%>" target="_blank"><%=zpsqbh%></A></td>
    <td><%=fgs%></td>
    <td><%=sqbm%></td>
    <td><%=zbzw%></td>
    <td><%=zprs%></td>
    <td><%=zpfy%></td>
    <td><%=zbly%></td>
    <td><%=xwdgsj%></td>
    <td><%=rygznr%></td>
    <td><%=ztbm_o%></td>
    <td><%=lrr%></td>
    <td><%=ssfgs%></td>
    <td><%=lrsj%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
	}

}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql+"<br>");
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
<div style='FONT-SIZE: 12px'><font color=red>ע�ⲻҪ�ظ���ˣ�</font></div>
</body>
</html>
