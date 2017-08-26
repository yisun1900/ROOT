<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String dwbh=null;
String ygbh=null;
String yhmc=null;
String xb=null;
String xzzwbm=null;

String kssj=null;
String jzsj=null;
double ljts=0;
String yysm=null;

String txzsm=null;
String jtgj=null;
String zwdlr=null;
String xcsm=null;
double btbz=0;
double zsbz=0;

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

String yclzt=null;
String yztbm=null;

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,ygbh,yhmc,xb,xzzwbm,kssj,jzsj,ljts,yysm,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh,shr,shsj,txzsm,jtgj,zwdlr,xcsm,btbz,zsbz ";
	ls_sql+=" from  rs_ccsqd";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		kssj=cf.fillNull(rs.getDate("kssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		ljts=rs.getDouble("ljts");

		yysm=cf.fillNull(rs.getString("yysm"));

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

		txzsm=cf.fillNull(rs.getString("txzsm"));
		jtgj=cf.fillNull(rs.getString("jtgj"));
		zwdlr=cf.fillNull(rs.getString("zwdlr"));
		xcsm=cf.fillNull(rs.getString("xcsm"));
		btbz=rs.getDouble("btbz");
		zsbz=rs.getDouble("zsbz");
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
<div align="center">��������</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">Ա�����</font></td>
    <td width="34%"><%=ygbh%> </td>
    <td align="right" width="17%"><font color="#000000">Ա������</font></td>
    <td width="33%"><%=yhmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">�Ա�</font></td>
    <td width="34%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
    <td align="right" width="17%"><font color="#000000">ְ��</font></td>
    <td width="33%"><%=xzzwbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">�����ֹ�˾</font></td>
    <td width="34%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
    <td align="right" width="17%"><font color="#000000">��������</font></td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="23"><font color="#000000"></font></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">ͬ����˵��</td>
    <td colspan="3"><%=txzsm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">��ͨ����</td>
    <td width="34%"><%=jtgj%> </td>
    <td align="right" width="17%">�����ڼ�ְ�������</td>
    <td width="33%"><%=zwdlr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">������׼</td>
    <td width="34%"><%=btbz%> </td>
    <td align="right" width="17%">ס�ޱ�׼</td>
    <td width="33%"><%=zsbz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%">�г�˵��</td>
    <td colspan="3"><%=xcsm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">��ʼʱ��</font></td>
    <td width="34%"><%=kssj%> </td>
    <td align="right" width="17%"><font color="#000000">����ʱ��</font></td>
    <td width="33%"><%=jzsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">�ۼ�����</font></td>
    <td width="34%"><%=ljts%> </td>
    <td align="right" width="17%"><font color="#000000"></font></td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="16%"><font color="#000000">ԭ��˵��</font></td>
    <td colspan="3"><%=yysm%> </td>
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
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='11' order by ztbm",ztbm,true);
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
	ls_sql="SELECT spxh,shjlmc,shr,shsj,DECODE(rs_ccsqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),ztmc,shyj";
	ls_sql+=" FROM rs_ccsqspb,rs_shjlbm,rs_ztbm ";
    ls_sql+=" where rs_ccsqspb.shjl=rs_shjlbm.shjl and rs_ccsqspb.ztbm=rs_ztbm.ztbm(+)  ";
	ls_sql+=" and rs_ccsqspb.sqxh='"+sqxh+"'";
    ls_sql+=" order by rs_ccsqspb.spxh";
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
