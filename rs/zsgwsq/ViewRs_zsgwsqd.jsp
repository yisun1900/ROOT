<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String dwbh=null;
String zsgwmc=null;

int zbrs=0;
String slrq=null;
String sqzbly=null;
String bmryjg=null;
String zbgwzn=null;
String zbgwxcfw=null;


String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String clzt=null;
String ztbm=null;

String shjl=null;
String shyj=null;
String spxh=null;
String shr=null;
String shsj=null;


String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,zsgwmc,zbrs,slrq,sqzbly,bmryjg,zbgwzn,zbgwxcfw,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh,shr,shsj ";
	ls_sql+=" from  rs_zsgwsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zsgwmc=cf.fillNull(rs.getString("zsgwmc"));
		zbrs=rs.getInt("zbrs");
		slrq=cf.fillNull(rs.getDate("slrq"));

		sqzbly=cf.fillNull(rs.getString("sqzbly"));
		bmryjg=cf.fillNull(rs.getString("bmryjg"));
		zbgwzn=cf.fillNull(rs.getString("zbgwzn"));
		zbgwxcfw=cf.fillNull(rs.getString("zbgwxcfw"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));

		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		spxh=cf.fillNull(rs.getString("spxh"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));

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
<div align="center">�����λ����</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">�걨��˾</font></td>
    <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
    <td align="right" width="17%"><font color="#000000">�����λ����</font></td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="23"><font color="#000000"></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">�����λ����</td>
    <td colspan="3"><%=zsgwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">��������</font></td>
    <td width="34%"><%=zbrs%></td>
    <td align="right" width="17%"><font color="#000000">��������</font></td>
    <td width="33%"><%=slrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">����������Ա�ṹ</td>
    <td colspan="3"><%=bmryjg%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">������λְ��</td>
    <td colspan="3"><%=zbgwzn%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">������λн�귶Χ</td>
    <td colspan="3"><%=zbgwxcfw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">������������</td>
    <td colspan="3"><%=sqzbly%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">¼����</font></td>
    <td width="34%"><%=lrr%> </td>
    <td align="right" width="17%"><font color="#000000">¼��ʱ��</font></td>
    <td width="33%"><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">¼�벿��</font></td>
    <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
    <td align="right" width="17%"><font color="#000000">��������</font></td>
    <td width="33%"><%=sqrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">��ע</font></td>
    <td colspan="3"><%=bz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"> ����״̬ </td>
    <td width="34%"> <%
	cf.selectToken(out,"01+�ȴ�����&02+��������&03+����ͨ��&04+����ȡ��",clzt,true);
%> </td>
    <td align="right" width="17%"> ����״̬ </td>
    <td width="33%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='12' order by ztbm",ztbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"> ������� </td>
    <td width="34%"> <%=spxh%> </td>
    <td align="right" width="17%"> ��˽��� </td>
    <td width="33%"> <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl",shjl,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">����� </td>
    <td width="34%"><%=shr%> </td>
    <td align="right" width="17%">���ʱ�� </td>
    <td width="33%"><%=shsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"> ������ </td>
    <td colspan="3"> <%=shyj%> </td>
  </tr>
</table>


<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="7%">�������</td>
	<td  width="9%">��˽���</td>
	<td  width="7%">�����</td>
	<td  width="9%">���ʱ��</td>
	<td  width="9%">����״̬</td>
	<td  width="16%">����״̬</td>
	<td  width="43%">������</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	ls_sql="SELECT spxh,shjlmc,shr,shsj,DECODE(rs_zsgwsqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),ztmc,shyj";
	ls_sql+=" FROM rs_zsgwsqspb,rs_shjlbm,rs_ztbm ";
    ls_sql+=" where rs_zsgwsqspb.shjl=rs_shjlbm.shjl and rs_zsgwsqspb.ztbm=rs_ztbm.ztbm(+)  ";
	ls_sql+=" and rs_zsgwsqspb.sqxh='"+sqxh+"'";
    ls_sql+=" order by rs_zsgwsqspb.spxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>


</body>
</html>
