<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String gysmc=null;
String gyslb=null;
String zclb=null;
String mrazhs=null;
String ppbm=null;
String ppmc=null;
String gysbm=null;
String gys=null;
String bz=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String gysbh=null;

gysbh=cf.GB2Uni(request.getParameter("gysbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,gysmc,gyslb,zclb,mrazhs,ppbm,ppmc,gysbm,gys,bz,sfyyh,yhkssj,yhjzsj,yhnr ";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where gysbh='"+gysbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gyslb=cf.fillNull(rs.getString("gyslb"));
		zclb=cf.fillNull(rs.getString("zclb"));
		mrazhs=cf.fillNull(rs.getString("mrazhs"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gys=cf.fillNull(rs.getString("gys"));
		bz=cf.fillNull(rs.getString("bz"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
</head>

<body bgcolor="#FFFFFF">
<div align="center"> Ʒ�ƹ�Ӧ����Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> �������� </td>
    <td width="33%"> <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,true);
%> </td>
    <td align="right" width="17%"> Ʒ�ƹ�Ӧ������ </td>
    <td width="33%"> <%=gysmc%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> Ʒ�ƹ�Ӧ�̱�� </td>
    <td width="33%"> <%=gysbh%> </td>
    <td align="right" width="17%"> ��Ӧ����� </td>
    <td width="33%"> <%
	cf.selectToken(out,"1+ľ��&2+����&3+�Ҿ�&4+����",gyslb,true);
%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> ����С�� </td>
    <td width="33%"> <%=zclb%> </td>
    <td align="right" width="17%"> ÿ�հ�װ���� </td>
    <td width="33%"> <%=mrazhs%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> Ʒ�Ʊ��� </td>
    <td width="33%"> <%=ppbm%> </td>
    <td align="right" width="17%"> Ʒ������ </td>
    <td width="33%"> <%=ppmc%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> ��Ӧ�̱��� </td>
    <td width="33%"> <%=gysbm%> </td>
    <td align="right" width="17%"> ��Ӧ������ </td>
    <td width="33%"> <%=gys%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> ��ע </td>
    <td width="33%"> <%=bz%> </td>
    <td align="right" width="17%"> �Ƿ����Ż� </td>
    <td width="33%"> <%
	cf.radioToken(out, "Y+��&N+��",sfyyh,true);
%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> �Żݿ�ʼʱ�� </td>
    <td width="33%"> <%=yhkssj%> </td>
    <td align="right" width="17%"> �Żݽ���ʱ�� </td>
    <td width="33%"> <%=yhjzsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="17%"> �Ż����� </td>
    <td width="33%"> <%=yhnr%> </td>
    <td align="right" width="17%">&nbsp; </td>
    <td width="33%">&nbsp; </td>
</tr>
</table>



<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50%">Ʒ�ƹ�Ӧ�̱��</td>
	<td  width="50%">�����ֹ�˾</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sq_ppgyssqfgs.gysbh,dwmc";
	ls_sql+=" FROM sq_ppgyssqfgs,sq_dwxx  ";
    ls_sql+=" where sq_ppgyssqfgs.ssfgs=sq_dwxx.dwbh and sq_ppgyssqfgs.gysbh='"+gysbh+"' ";
	ls_sql+=" order by sq_ppgyssqfgs.ssfgs";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();

%>
</table>

</body>
</html>
