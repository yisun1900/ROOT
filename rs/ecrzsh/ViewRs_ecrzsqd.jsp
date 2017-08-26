<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sqxh=null;
String sq_dwxx_dwmc=null;
String ygbh=null;
String yhmc=null;
String xb=null;
String yfgsbh=null;
String ydwbh=null;
String yxzzwbm=null;
String yrzsj=null;
String ylzrq=null;
String ylzyy=null;
String xdwbh=null;
String xxzzwbm=null;
String xrzyy=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String clzt=null;
String ztbm=null;
String spxh=null;
String shr=null;
String shsj=null;
String shjl=null;
String shyj=null;
String sqrq=null;
String ecrzsqsplc="";
String wheresqxh=null;
wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select sqrq,rs_ecrzsqd.sqxh as sqxh,sq_dwxx.dwmc as sq_dwxx_dwmc,rs_ecrzsqd.ygbh as ygbh,rs_ecrzsqd.yhmc as yhmc,rs_ecrzsqd.xb as xb,rs_ecrzsqd.yfgsbh as yfgsbh,rs_ecrzsqd.ydwbh as ydwbh,rs_ecrzsqd.yxzzwbm as yxzzwbm,rs_ecrzsqd.yrzsj as yrzsj,rs_ecrzsqd.ylzrq as ylzrq,rs_ecrzsqd.ylzyy as ylzyy,rs_ecrzsqd.xdwbh as xdwbh,rs_ecrzsqd.xxzzwbm as xxzzwbm,rs_ecrzsqd.xrzyy as xrzyy,rs_ecrzsqd.lrr as lrr,rs_ecrzsqd.lrsj as lrsj,rs_ecrzsqd.lrbm as lrbm,rs_ecrzsqd.bz as bz,rs_ecrzsqd.clzt as clzt,rs_ecrzsqd.ztbm as ztbm,rs_ecrzsqd.spxh as spxh,rs_ecrzsqd.shr as shr,rs_ecrzsqd.shsj as shsj,rs_ecrzsqd.shjl as shjl,rs_ecrzsqd.shyj as shyj ";
	ls_sql+=" from  rs_ecrzsqd,sq_dwxx";
	ls_sql+=" where rs_ecrzsqd.fgsbh=sq_dwxx.dwbh and  (rs_ecrzsqd.sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqxh=cf.fillNull(rs.getString("sqxh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		yfgsbh=cf.fillNull(rs.getString("yfgsbh"));
		ydwbh=cf.fillNull(rs.getString("ydwbh"));
		yxzzwbm=cf.fillNull(rs.getString("yxzzwbm"));
		yrzsj=cf.fillNull(rs.getDate("yrzsj"));
		ylzrq=cf.fillNull(rs.getDate("ylzrq"));
		ylzyy=cf.fillNull(rs.getString("ylzyy"));
		xdwbh=cf.fillNull(rs.getString("xdwbh"));
		xxzzwbm=cf.fillNull(rs.getString("xxzzwbm"));
		xrzyy=cf.fillNull(rs.getString("xrzyy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		spxh=cf.fillNull(rs.getString("spxh"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
	}
	rs.close();
	ps.close();


	String ztmc=null;
	ls_sql="select ztmc";
	ls_sql+=" from  rs_ecrzsqsplc,rs_ztbm";
	ls_sql+=" where rs_ecrzsqsplc.ztbm=rs_ztbm.ztbm and rs_ecrzsqsplc.sqxh='"+wheresqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));

		ecrzsqsplc+="-->"+ztmc;
	}
	rs.close();
	ps.close();
	if (!ecrzsqsplc.equals(""))
	{
		ecrzsqsplc=ecrzsqsplc.substring(3);
	}

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
<div align="center"> ��ְԱ��������ְ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> Ա����� </td>
    <td width="32%"> <%=ygbh%> </td>
    <td align="right" width="18%"> Ա������ </td>
    <td width="32%"> <%=yhmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> �Ա� </td>
    <td width="32%"> <%
	cf.radioToken(out, "M+��&W+Ů",xb,true);
%> </td>
    <td align="right" width="18%"> ԭ�ֹ�˾ </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+yfgsbh+"'",yfgsbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ԭ���� </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ydwbh+"'",ydwbh,true);
%> </td>
    <td align="right" width="18%"> ԭְλ </td>
    <td width="32%"> <%=yxzzwbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> �ϴ���ְ���� </td>
    <td width="32%"> <%=yrzsj%> </td>
    <td align="right" width="18%"> ��ְ���� </td>
    <td width="32%"> <%=ylzrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��ְԭ�� </td>
    <td colspan="3"> <%=ylzyy%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ������� </td>
    <td width="32%"> <%=sqxh%> </td>
    <td align="right" width="18%"> �걨��˾ </td>
    <td width="32%"> <%=sq_dwxx_dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">���������ְ���� </td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+xdwbh+"'",xdwbh,true);
%> </td>
    <td align="right" width="18%">���������ְְλ </td>
    <td width="32%"><%=xxzzwbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">������ְԭ��</td>
    <td colspan="3"><%=xrzyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ¼���� </td>
    <td width="32%"> <%=lrr%> </td>
    <td align="right" width="18%"> ¼��ʱ�� </td>
    <td width="32%"> <%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ¼�벿�� </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
    <td align="right" width="18%">�������� </td>
    <td width="32%"><%=sqrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"><b>������ְ��������</b></td>
    <td colspan="3"><%=ecrzsqsplc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ����״̬ </td>
    <td width="32%"> <%
	cf.selectToken(out,"00+��������&01+�ȴ�����&02+��������&03+����ͨ��&04+����ȡ��&05+����ְ",clzt,true);
%> </td>
    <td align="right" width="18%"> ����״̬ </td>
    <td width="32%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='06' order by ztbm",ztbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ������� </td>
    <td width="32%"> <%=spxh%> </td>
    <td align="right" width="18%"> ��˽��� </td>
    <td width="32%"> <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl",shjl,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">����� </td>
    <td width="32%"><%=shr%> </td>
    <td align="right" width="18%">���ʱ�� </td>
    <td width="32%"><%=shsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ������ </td>
    <td colspan="3"> <%=shyj%> </td>
  </tr>
</table>


<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="5%">���</td>
	<td  width="9%">��˽���</td>
	<td  width="7%">�����</td>
	<td  width="9%">���ʱ��</td>
	<td  width="9%">����״̬</td>
	<td  width="15%">ԭ����״̬</td>
	<td  width="15%">������״̬</td>
	<td  width="31%">������</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	ls_sql="SELECT spxh,shjlmc,shr,shsj,DECODE(rs_ecrzspb.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),b.ztmc yztbm,a.ztmc,shyj";
	ls_sql+=" FROM rs_ecrzspb,rs_shjlbm,rs_ztbm a,rs_ztbm b";
    ls_sql+=" where rs_ecrzspb.shjl=rs_shjlbm.shjl and rs_ecrzspb.ztbm=a.ztbm(+) and rs_ecrzspb.yztbm=b.ztbm(+)  ";
	ls_sql+=" and rs_ecrzspb.sqxh='"+wheresqxh+"'";
    ls_sql+=" order by rs_ecrzspb.spxh";
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
