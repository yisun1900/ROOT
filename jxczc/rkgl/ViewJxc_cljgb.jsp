<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String clbm="";
String dqbm="";
String gysmc="";
String lsj="";
String xsj="";
String cxhdbl="";
String myqjf="";
String sfycx="";
String cxkssj="";
String cxjzsj="";
String cxj="";
String lscxhdbl="";
String cxmyqjf="";
String xsfs="";
double zcpzsl=0;
double dhsl=0;
String ycgsl="";
String whereclbm="";
String wheredqbm="";
String clmc="";
String xh="";
String gg="";
String zp="";
String scsmc=""; 
String ppmc="";
String cldlbm=""; 
String clxlbm="";
String ccpzsl="";
String bfpzsl="";
String wheresql="";
String nbbm="";
String bz="";
double kykc=0;
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
whereclbm=cf.addZero(whereclbm,13);
if (whereclbm!=null && !(whereclbm.equals("")))
{wheresql+=" and jxc_cljgb.clbm='"+whereclbm+"' ";}
wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
if (wheredqbm!=null && !(wheredqbm.equals("")))
{wheresql+=" and jxc_cljgb.dqbm='"+wheredqbm+"' ";}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select jxc_cljgb.clbm clbm,dqmc dqbm,gysmc,lsj,xsj,cxhdbl,myqjf,DECODE(sfycx,'N','��','Y','��') sfycx,cxkssj,cxjzsj,cxj,lscxhdbl,cxmyqjf,DECODE(xsfs,'1','����Ʒ','2','�ֻ�����','3','�ڻ�����') xsfs,zcpzsl,dhsl,ycgsl,clmc,xh,gg,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_clbm.zp||'\" width=\"100px\" height=\"100px\">' zp,scsmc,ppmc,cldlbm,clxlbm,ccpzsl,bfpzsl,jxc_clbm.bz bz,(zcpzsl-dhsl) kykc,nbbm ";
	ls_sql+=" from  jxc_cljgb,dm_dqbm,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and jxc_cljgb.dqbm=dm_dqbm.dqbm and cllb='1'"; 
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nbbm=cf.fillNull(rs.getString("nbbm"));
		ccpzsl=cf.fillNull(rs.getString("ccpzsl"));
		bfpzsl=cf.fillNull(rs.getString("bfpzsl"));
		clbm=cf.fillNull(rs.getString("clbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		myqjf=cf.fillNull(rs.getString("myqjf"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cxj=cf.fillNull(rs.getString("cxj"));
		lscxhdbl=cf.fillNull(rs.getString("lscxhdbl"));
		cxmyqjf=cf.fillNull(rs.getString("cxmyqjf"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		zcpzsl=rs.getDouble("zcpzsl");
		kykc=rs.getDouble("kykc");
		dhsl=rs.getDouble("dhsl");
		ycgsl=cf.fillNull(rs.getString("ycgsl"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zp=cf.fillNull(rs.getString("zp"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	else 
	{
		if (whereclbm!=null && !(whereclbm.equals("")))
		{
			%>
		<SCRIPT language=javascript >
		<!--
		alert("û���ҵ���Ӧ���ݣ����������Ƿ���ȷ��");
		window.close();
		//-->
		</SCRIPT>
		<%
		}
	}
//	out.print(ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#00FFFF"><strong>���ϱ���</strong></td>
  <td bgcolor="#00FFFF"><b><%=clbm%></b></td>
  <td width="15%" rowspan="4" align="right">��Ƭ</td>
  <td width="35%" rowspan="4"><%=zp%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="15%" align="right"><font color="#000000">�ڲ�����</font></td>
  <td width="35%"><%=nbbm%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
  <td align="right">��������</td>
  <td><%=clmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">����</td>
  <td><%=dqbm%></td>
  </tr>

  <tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF"><font color="#FF0000">�ڿ�����</font></td>
  <td width="35%" bgcolor="#9999FF"><font color="#FF0000"><%=zcpzsl%></font></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color="#FF0000">���ÿ��</td>
  <td width="35%" bgcolor="#9999FF"><font color="#FF0000"><%=kykc%></font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF"><font color="#FF0000">�ͻ���������</font></td>
  <td width="35%" bgcolor="#9999FF"><font color="#FF0000"><%=dhsl%></font></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color="#FF0000">�Ѳɹ�����</font></td>
  <td width="35%" bgcolor="#9999FF"><font color="#FF0000"><%=ycgsl%></font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#99CCFF">���ϴ���</td>
  <td width="35%" bgcolor="#99CCFF"><%=cldlbm%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">����С��</td>
  <td width="35%" bgcolor="#99CCFF"><%=clxlbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%" bgcolor="#99CCFF"> 
    Ʒ��</td>
  <td width="35%" bgcolor="#99CCFF"><%=scsmc%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">��Ʒ��</td>
  <td width="35%" bgcolor="#99CCFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99CCFF">�ͺ�</td>
  <td bgcolor="#99CCFF"><%=xh%></td>
  <td align="right" bgcolor="#99CCFF">���</td>
  <td bgcolor="#99CCFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">��Ӧ��</td>
  <td colspan="3" bgcolor="#CCFFCC"><%=gysmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">��ע</td>
  <td colspan="3" bgcolor="#CCFFCC"><%=bz%></td>
  </tr>
</table>
</body>
</html>