<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="pageObject" scope="page" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String thjlh=null;
String cpbm=null;
String thdw=null;
String thj=null;
String thyy=null;
String thbz=null;
String thrq=null;
String czy=null;
String ywxh=null;
String xsdw=null;
String sxj=null;
String khbh=null;
String shbz=null;
String shr=null;
String shrq=null;
String sfjs=null;
String wherethjlh=null;
String wherecpbm=null;
wherethjlh=request.getParameter("thjlh");
wherecpbm=request.getParameter("cpbm");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select thjlh,cpbm,thdw,thj,thyy,thbz,thrq,czy,ywxh,xsdw,sxj,khbh,shbz,shr,shrq,sfjs ";
	ls_sql+=" from  dm_thjl";
	ls_sql+=" where  (thjlh='"+wherethjlh+"') and  (cpbm='"+wherecpbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		thjlh=cf.fillNull(rs.getString("thjlh"));
		cpbm=cf.fillNull(rs.getString("cpbm"));
		thdw=cf.fillNull(rs.getString("thdw"));
		thj=cf.fillNull(rs.getString("thj"));
		thyy=cf.fillNull(rs.getString("thyy"));
		thbz=cf.fillNull(rs.getString("thbz"));
		thrq=cf.fillNull(rs.getDate("thrq"));
		czy=cf.fillNull(rs.getString("czy"));
		ywxh=cf.fillNull(rs.getString("ywxh"));
		xsdw=cf.fillNull(rs.getString("xsdw"));
		sxj=cf.fillNull(rs.getString("sxj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		shbz=cf.fillNull(rs.getString("shbz"));
		shr=cf.fillNull(rs.getString("shr"));
		shrq=cf.fillNull(rs.getDate("shrq"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%"> 
      <div align="center"> �˻���Ϣ</div>
    </td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%" height="64">&nbsp;</td>
    <td width="98%" height="64"> 
      <div align="center">

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˻���¼��</div>
  </td>
  <td width="35%"> 
    <%=thjlh%>
  </td>
  <td width="15%"> 
    <div align="right">��Ʒ����</div>
  </td>
  <td width="35%"> 
    <%=cpbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˻���λ</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",thdw,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">�˻����</div>
  </td>
  <td width="35%"> 
    <%=thj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˻�ԭ��</div>
  </td>
  <td width="35%"> 
    <%=thyy%>
  </td>
  <td width="15%"> 
    <div align="right">�˻�����</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"0+�����˻�&1+��껻��&2+����˻�",thbz,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˻�����</div>
  </td>
  <td width="35%"> 
    <%=thrq%>
  </td>
  <td width="15%"> 
    <div align="right">����Ա</div>
  </td>
  <td width="35%"> 
    <%=czy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����ҵ�����</div>
  </td>
  <td width="35%"> 
    <%=ywxh%>
  </td>
  <td width="15%"> 
    <div align="right">���۵�λ</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",xsdw,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ʵ����</div>
  </td>
  <td width="35%"> 
    <%=sxj%>
  </td>
  <td width="15%"> 
    <div align="right">��Ա���</div>
  </td>
  <td width="35%"> 
    <%=khbh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
              <div align="right">��˱�־</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"0+��ͬ��&1+ͬ��&2+δ���&3+���۵������",shbz,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">�����</div>
  </td>
  <td width="35%"> 
    <%=shr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <%=shrq%>
  </td>
  <td width="15%"> 
    <div align="right">�Ƿ����</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"0+δ����&1+����",sfjs,true);
%>
  </td>
</tr>
 </table>
<p align="center">������Ʒ�˻���Ϣ
<%
	ls_sql="SELECT xh,zpbm,plmc,sl,djzl,DECODE(zplx,1,'��Ʒת��',2,'��Ʒ')  ";
	ls_sql+=" FROM dm_zpth,xt_plbm  ";
    ls_sql+=" WHERE dm_zpth.plbm=xt_plbm.plbm and thjlh='"+thjlh+"' and cpbm='"+cpbm+"'";
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("","","","");
	pageObject.setPageRow(1000);

	pageObject.out=out;
	pageObject.getDate(1);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%" height="2">���</td>
		<td  width="14%" height="2">��Ʒ����</td>
		<td  width="25%" height="2">Ʒ������</td>
		<td  width="10%" height="2">����</td>
		<td  width="14%" height="2">��������</td>
		<td  width="14%" height="2">��Ʒ����</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 

	  
	  </div>
    </td>
    <td width="1%" height="64">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
