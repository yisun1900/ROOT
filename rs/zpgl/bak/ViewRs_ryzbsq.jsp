<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqbh=null;
String zbye=null;
String zbzw=null;
String fgs=null;
String dwbh=null;
String zbly=null;
String zbqt=null;
String xwdgsj=null;
String xb=null;
String hy=null;
String nl=null;
String xl=null;
String zy=null;
String wy=null;
String jsjjn=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String jhzt=null;
String ztbm=null;
String lrr=null;
String ssfgs=null;
String lrsj=null;
String bz=null;
String wheresqbh=null;
wheresqbh=cf.GB2Uni(request.getParameter("sqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select sqbh,zbye,dm_xzzwbm.xzzwmc zbzw,a.dwmc fgs,b.dwmc 	 dwbh,zbly,zbqt,xwdgsj,xb,hy,nl,xl,zy,wy,jsjjn,gzjy,gx,jn,qt,rygznr,DECODE(jhzt,'1','�ȴ�����','2','����������','3','��Ƹ���','4','����δͨ��','5','�޸ļƻ�','6','������') jhzt,ztbm,lrr,c.dwmc ssfgs,lrsj,rs_ryzbsq.bz ";
	ls_sql+=" from  rs_ryzbsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,dm_xzzwbm";
	ls_sql+=" where a.dwbh=rs_ryzbsq.fgs and b.dwbh=rs_ryzbsq.dwbh and c.dwbh=rs_ryzbsq.ssfgs and dm_xzzwbm.xzzwbm=rs_ryzbsq.zbzw and  (sqbh='"+wheresqbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqbh=cf.fillNull(rs.getString("sqbh"));
		zbye=cf.fillNull(rs.getString("zbye"));
		zbzw=cf.fillNull(rs.getString("zbzw"));
		fgs=cf.fillNull(rs.getString("fgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zbly=cf.fillNull(rs.getString("zbly"));
		zbqt=cf.fillNull(rs.getString("zbqt"));
		xwdgsj=cf.fillNull(rs.getDate("xwdgsj"));
		xb=cf.fillNull(rs.getString("xb"));
		hy=cf.fillNull(rs.getString("hy"));
		nl=cf.fillNull(rs.getString("nl"));
		xl=cf.fillNull(rs.getString("xl"));
		zy=cf.fillNull(rs.getString("zy"));
		wy=cf.fillNull(rs.getString("wy"));
		jsjjn=cf.fillNull(rs.getString("jsjjn"));
		gzjy=cf.fillNull(rs.getString("gzjy"));
		gx=cf.fillNull(rs.getString("gx"));
		jn=cf.fillNull(rs.getString("jn"));
		qt=cf.fillNull(rs.getString("qt"));
		rygznr=cf.fillNull(rs.getString("rygznr"));
		jhzt=cf.fillNull(rs.getString("jhzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE4 {font-family: "����_GB2312"}
.STYLE6 {font-family: "����_GB2312"; color: #FF0000; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
  <h3><strong> ��Ա���������</strong></h3>
</div>
<table width="75%" border="0" align="center">
  <tr>
    <td width="15%"><div align="right">�걨��˾: </div></td>
    <td width="35%"><span class="STYLE4"><%=fgs%></span></td>
	<td width="15%"><div align="right">���ʱ��:</div></td>
    <td width="35%"><span class="STYLE4"><%=lrsj%></span></td>
  </tr>
</table>

<table width="75%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#999999" style="FONT-SIZE:14">
<tr bgcolor="#FFFFFF">
  <td width="17%" align="right"> ���벿�� </td>
  <td width="17%"> 
    <%=dwbh%>
  </td>
    <td align="right" width="14%"> 
    ����ְ��  </td>
  <td width="16%"> 
    <%=zbzw%>
  </td>
  <td align="right" width="14%"> 
    ����Ա��  </td>
  <td width="22%"> 
    <%=zbye%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    ��������
  </td>
  <td> 
<%
	cf.selectToken(out,"1+ȱԱ����&2+�������&3+��������&4+����",zbly,true);
%>
  </td>
    <td align="right"> 
    ��������
  </td>
  <td colspan="3"> 
    <%=zbqt%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    ϣ������ʱ��
  </td>
  <td> 
    <%=xwdgsj%>
  </td>
    <td align="right"> 
    ����״̬
  </td>
  <td> 
    <%=jhzt%>
  </td>
  <td align="right"> 
    ���״̬
  </td>
  <td> 
    <%=ztbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    �Ա�
  </td>
  <td> 
<%
	cf.selectToken(out,"0+������&1+��&2+Ů",xb,true);
%>
  </td>
    <td align="right"> 
    ����
  </td>
  <td> 
    <%=nl%>
  </td>
    <td rowspan="5" align="right"> 
    <CENTER>����<br>��Ա<br>
	����<br>����</CENTER>  </td>
  <td rowspan="5"> 
    <%=rygznr%>
  </td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 
    ����
  </td>
  <td> 
<%
	cf.selectToken(out,"0+������&1+�ѻ�&2+δ��",hy,true);
%>
  </td>
    <td align="right"> 
    ѧ��
  </td>
  <td> 
<%
	cf.selectToken(out,"0+����&1+��ר&2+��ѧ&3+˶ʿ",xl,true);
%>
  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    רҵ
  </td>
  <td> 
    <%=zy%>
  </td>
  <td align="right"> 
    ����
  </td>
  <td> 
    <%=wy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    ���������
  </td>
  <td> 
    <%=jsjjn%>
  </td>
  <td align="right"> 
    ��������
  </td>
  <td> 
    <%=gzjy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    ����
  </td>
  <td> 
    <%=gx%>
  </td>
  <td align="right"> 
    ����
  </td>
  <td> 
    <%=jn%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    ����
  </td>
  <td> 
    <%=qt%>
  </td>
  <td align="right"> 
    ¼����
  </td>
  <td> 
    <%=lrr%>
  </td>
    <td align="right"> 
    ¼���˷ֹ�˾
  </td>
  <td> 
    <%=ssfgs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 
    ��ע
  </td>
  <td colspan="5"> 
    <%=bz%>
  </td>
</tr>
</table>
<table width="75%" border="0" align="center">
  <tr>
    <td align="right" width="15%"><span class="STYLE6">�����ţ�</span><%=sqbh%></td>
  </tr>
</table>

</body>
</html>
