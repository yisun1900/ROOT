<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
</style>
<title>�ҵĹ���ʷ</title>
<body>
<%
String bg1="#E8E8FF";
String bg2="#FFFFFF";
String yhbh=(String)session.getAttribute("khbh");//�û����
String lrr=(String)session.getAttribute("yhdlm");//�û���¼ʱ������
//yhbh = "yhbh";//����������
//lrr = "lrr";//����������
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try{
    int zsl = 0;
	int zjs = 0;
	double zje = 0;
	String sumsql = "";
	conn1=cf.getConnection();    //�õ�����
	sumsql = " select count(*) zjs,sum(gmsl) zsl,sum(gmje) zje";
	sumsql+=" from HY_KHHDPT ";
	sumsql+=" where khbh='"+yhbh+"' ";
//	out.println(sql);
	ps1= conn1.prepareStatement(sumsql);
	rs1=ps1.executeQuery();
	if (rs1.next())                            
	{
		zjs=rs1.getInt(1);
		zsl=rs1.getInt(2);
		zje=rs1.getDouble(3);
		%>
		<center>
  <font size="+1"><b>����л��ѡ�������ڴ<br>
  </b></font>
		
  <div align="right"> <font size="-1"><B><font color="#990000">||</font> ����ѡ����<font size="-1" color="red"><%=zjs%></font>����Ʒ 
    <font color="#990000">||</font> �ܹ�<font size="-1" color="red"><%=zsl%></font>�� 
    <font color="#990000">||</font> �����ܽ��Ϊ<font size="-1" color="red"><%=zje%></font>Ԫ 
    <font color="#990000">||</font> </div>
		</center>
		<%
	}
	rs1.close();
	ps1.close();
	}
	catch (Exception e) {
	out.print("Exception: " + e);
	return;
	}
	finally 
	{
		try{
			if (rs1 != null) rs1.close(); 
			if (ps1 != null) ps1.close(); 
			if (conn1 != null) cf.close(conn1); 
		}
		catch (Exception e){
			if (conn1 != null) cf.close(conn1); 
		}
	}%>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="FONT-SIZE: 12px;border-collapse:collapse">
  <tr height="30"  bgcolor="#CCCCCC" align="center">
    <td width="2%" height="28">�� ��</td>
    <td width="3%" height="28">���ı���</td>
    <td width="6%" height="28">��������</td>
    <td width="10%" height="28">ͼ Ƭ</td>
    <td width="5%" height="28">���ϵ��</td>
    <td width="5%" height="28">�� ��</td>
    <td width="5%" height="28">�� ��</td>
    <td width="3%" height="28">�� ɫ</td>
    <td width="3%" height="28">�� ��</td>
    <td width="2%" height="28">�� ��</td>
    <td width="3%" height="28">�� ��</td>
    <td width="4%" height="28">��������</td>
    <td width="3%" height="28">�Ƿ����</td>
    <td width="5%" height="28">�� ע</td>
	</tr>
<%
try{
String ls_sql = "";
String gmsl = "";
String gmje = "";
String zcbm = "";
String zcmc=null;
String zclbbm=null;
String zcdlmc=null;
String gg=null;
String zcysbm=null;
String jldwbm=null;
String yhj=null;
String bz=null;
String zp=null;
String cxj=null;
String xh=null;
String gmrq=null;
String khwjbz=null;
int i = 0;
	conn=cf.getConnection();
	ls_sql = " select jc_zcjgb.zcbm,jc_zcjgb.zcmc,'<IMG SRC=\"/jcjj/zcbj/images/'||zp||'\"  border=0 width=\"150\">' zp,jc_zcjgb.zcmc,HY_KHHDPT.gmsl,HY_KHHDPT.gmje,jc_zcjgb.yhj,jc_zcjgb.cxj,jc_zcjgb.bz,jc_zcjgb.zcysbm,jc_zcjgb.gg,jc_zcjgb.zclbbm,jc_zcjgb.xh,to_char(gmrq,'yyyy-mm-dd') gmrq,DECODE(khwjbz,'Y','<font color=\"blue\">�������','N','<font color=\"red\">���ڹ���') khwjbz";
	ls_sql+=" from HY_KHHDPT,jc_zcjgb ";
	ls_sql+=" where jc_zcjgb.zcbm=HY_KHHDPT.zcbm and  HY_KHHDPT.khbh='"+yhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next()) 
		{ i++;
		zcbm = cf.fillNull(rs.getString("zcbm"));
		gmsl = cf.fillNull(rs.getString("gmsl"));
		gmje = cf.fillNull(rs.getString("gmje"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		gg=cf.fillNull(rs.getString("gg"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		yhj=cf.fillNull(rs.getString("yhj"));
		bz=cf.fillNull(rs.getString("bz"));
		zp=cf.fillNull(rs.getString("zp"));
		cxj=cf.fillNull(rs.getString("cxj"));
		xh=cf.fillNull(rs.getString("xh"));
		gmrq=cf.fillNull(rs.getString("gmrq"));
		khwjbz=cf.fillNull(rs.getString("khwjbz"));
		if (cxj!=null && (!cxj.equals("0")))
			{
				yhj = cxj;
			}
		%>
		<tr height="30" align="center" bgcolor=<%if (i%2==0) out.print(bg1); else out.print(bg2);%>>
		<td><%=i%></td>
		<td><%=zcbm%></td>
		<td><%=zcmc%></td>
		<td><%=zp%></td>
		<td><%=zclbbm%></td>
		<td><%=xh%></td>
		<td><%=gg%></td>
		<td><%=zcysbm%></td>
		<td><%=yhj%></td>
		<td><%=gmsl%></td>
		<td><%=gmje%></td>
		<td><%=gmrq%></td>
		<td><%=khwjbz%></td>
		<td><%=bz%></td>
		</tr>
		<%
		}
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
</table>
</body>