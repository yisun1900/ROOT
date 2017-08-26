<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String dwmc=null;
String cgsjs=null;
String sjsdh=null;

String gtcl=null;
String gtqfbys=null;
String gtfbys=null;
String tmcl=null;
String tmys=null;
String qdssy=null;
String hdssy=null;
String tmcly=null;
String tmysy=null;
String qdssyy=null;
String hdssyy=null;
String dxcl=null;
String dxyse=null;
String dxys=null;
String dgxcl=null;
String dgxyse=null;
String dgxys=null;
String bgcl=null;
String bgys=null;
String lmysy=null;
String lmyse=null;
String xqbly=null;
String xqble=null;
String mbyks=null;
String mbyys=null;
String mbygy=null;
String mbyfb=null;
String mbeks=null;
String mbeys=null;
String mbegy=null;
String mbefb=null;
String mbsks=null;
String mbsys=null;
String mbsgy=null;
String mbsfb=null;

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,sq_dwxx.dwmc,jc_cgdd.cgsjs";
	ls_sql+=" from  jc_cgdd,crm_khxx,sq_dwxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.dwbh=sq_dwxx.dwbh and  (jc_cgdd.ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillHtml(rs.getString("hth"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	//�Ҿ����ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+cgsjs+"' and zwbm='12'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select gtcl,gtqfbys,gtfbys,tmcl,tmys,qdssy,hdssy,tmcly,tmysy,qdssyy,hdssyy,dxcl,dxyse,dxys,dgxcl,dgxyse,dgxys,bgcl,bgys,lmysy,lmyse,xqbly,xqble,mbyks,mbyys,mbygy,mbyfb,mbeks,mbeys,mbegy,mbefb,mbsks,mbsys,mbsgy,mbsfb ";
	ls_sql+=" from  jc_yfjgyqsm";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtcl=cf.fillHtml(rs.getString("gtcl"));
		gtqfbys=cf.fillHtml(rs.getString("gtqfbys"));
		gtfbys=cf.fillHtml(rs.getString("gtfbys"));
		tmcl=cf.fillHtml(rs.getString("tmcl"));
		tmys=cf.fillHtml(rs.getString("tmys"));
		qdssy=cf.fillHtml(rs.getString("qdssy"));
		hdssy=cf.fillHtml(rs.getString("hdssy"));
		tmcly=cf.fillHtml(rs.getString("tmcly"));
		tmysy=cf.fillHtml(rs.getString("tmysy"));
		qdssyy=cf.fillHtml(rs.getString("qdssyy"));
		hdssyy=cf.fillHtml(rs.getString("hdssyy"));
		dxcl=cf.fillHtml(rs.getString("dxcl"));
		dxyse=cf.fillHtml(rs.getString("dxyse"));
		dxys=cf.fillHtml(rs.getString("dxys"));
		dgxcl=cf.fillHtml(rs.getString("dgxcl"));
		dgxyse=cf.fillHtml(rs.getString("dgxyse"));
		dgxys=cf.fillHtml(rs.getString("dgxys"));
		bgcl=cf.fillHtml(rs.getString("bgcl"));
		bgys=cf.fillHtml(rs.getString("bgys"));
		lmysy=cf.fillHtml(rs.getString("lmysy"));
		lmyse=cf.fillHtml(rs.getString("lmyse"));
		xqbly=cf.fillHtml(rs.getString("xqbly"));
		xqble=cf.fillHtml(rs.getString("xqble"));
		mbyks=cf.fillHtml(rs.getString("mbyks"));
		mbyys=cf.fillHtml(rs.getString("mbyys"));
		mbygy=cf.fillHtml(rs.getString("mbygy"));
		mbyfb=cf.fillHtml(rs.getString("mbyfb"));
		mbeks=cf.fillHtml(rs.getString("mbeks"));
		mbeys=cf.fillHtml(rs.getString("mbeys"));
		mbegy=cf.fillHtml(rs.getString("mbegy"));
		mbefb=cf.fillHtml(rs.getString("mbefb"));
		mbsks=cf.fillHtml(rs.getString("mbsks"));
		mbsys=cf.fillHtml(rs.getString("mbsys"));
		mbsgy=cf.fillHtml(rs.getString("mbsgy"));
		mbsfb=cf.fillHtml(rs.getString("mbsfb"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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
<div align="center">���񶩵� </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">      �������</td>
    <td width="29%"> <%=ddbh%> </td>
    <td width="20%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">�ͻ����</td>
    <td width="29%"><%=khbh%></td>
    <td width="20%" align="right">��ͬ��</td>
    <td width="30%"><%=hth%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF">      �ͻ�����</td>
    <td width="29%"><%=khxm%> </td>
    <td width="20%" align="right">      ��ϵ��ʽ</td>
    <td width="30%"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
</table>

<center>����  ��  ��  �֡�</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">���</td>
	<td  width="4%">���</td>
	<td  width="10%">����</td>
	<td  width="10%">�ͺ�</td>
	<td  width="5%">��</td>
	<td  width="5%">��(��)</td>
	<td  width="5%">��</td>
	<td  width="5%">����</td>
	<td  width="5%">��λ</td>
	<td  width="5%">����</td>
	<td  width="7%">���</td>
	<td  width="4%">�ۿ�</td>
	<td  width="7%">�ۺ��</td>
	<td  width="9%">�Ű���ɫ</td>
	<td  width="14%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT lb,TO_CHAR(xuhao),mc,xh,TO_CHAR(cd),TO_CHAR(kd),TO_CHAR(gd),sl,dw,TO_CHAR(dj),je,TO_CHAR(zkl),zhj,mbys,note  ";
	ls_sql+=" FROM jc_yfcgdtmx  ";
    ls_sql+=" where jc_yfcgdtmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by lb,xuhao";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

	
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lb","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	
	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

<center>���� �� Ҫ �� �� �֡�</center>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td height="27" width="10%"><b> ������� </b></td>
    <td colspan="3" > <%=gtcl%> </td>
    <td height="27" colspan="2"> <b>����ǰ�����ɫ</b> </td>
    <td colspan="2" > <%=gtqfbys%> </td>
    <td colspan="3" height="27"><b>��������ɫ</b></td>
    <td width="14%" height="27"><%=gtfbys%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="10%"><b>̨����� </b></td>
    <td colspan="2"><%=tmcl%></td>
    <td width="10%"><b>̨����ɫ </b></td>
    <td colspan="2"><%=tmys%> </td>
    <td width="11%"><b>ǰ��ˮ��ʽ </b></td>
    <td colspan="2"><%=qdssy%></td>
    <td colspan="2"><b>��ˮ��ʽ</b></td>
    <td width="14%"><%=hdssy%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="10%"><b>̨�����I </b></td>
    <td colspan="2"><%=tmcly%></td>
    <td width="10%"><b>̨����ɫI </b></td>
    <td colspan="2"><%=tmysy%></td>
    <td width="11%"><b>ǰ��ˮ��ʽI</b></td>
    <td colspan="2"><%=qdssyy%></td>
    <td colspan="2"><b>��ˮ��ʽI</b></td>
    <td width="14%"><%=hdssyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="10%"><b>���߲���</b></td>
    <td colspan="2"><%=dxcl%></td>
    <td width="10%"><b>������ɫ</b></td>
    <td colspan="2"><%=dxyse%></td>
    <td width="11%"><b>������ʽ</b></td>
    <td colspan="2"><%=dxys%></td>
    <td colspan="2"><b>������ʽI </b></td>
    <td width="14%"><%=lmysy%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="10%"><b>���߲���</b></td>
    <td colspan="2"><%=dgxcl%></td>
    <td width="10%"><b>������ɫ</b></td>
    <td colspan="2"><%=dgxyse%></td>
    <td width="11%"><b>������ʽ</b></td>
    <td colspan="2"><%=dgxys%></td>
    <td colspan="2"><b>������ʽII</b></td>
    <td width="14%"><%=lmyse%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="10%"><b>���ܲ���</b></td>
    <td colspan="2"><%=bgcl%></td>
    <td width="10%"><b>������ɫ</b></td>
    <td colspan="2"><%=bgys%></td>
    <td width="11%"><b>��Ƕ����I</b></td>
    <td colspan="2"><%=xqbly%></td>
    <td colspan="2"><b>��Ƕ����II</b></td>
    <td width="14%"><%=xqble%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td align="center" rowspan="4" width="10%"><b>�Ű�� </b></td>
    <td width="7%" align="center"><b>��ʽ</b></td>
    <td colspan="2"><%=mbyks%> </td>
    <td align="center" rowspan="4" width="8%"><b>�Ű��</b></td>
    <td align="center" width="7%"><b>��ʽ </b></td>
    <td colspan="2"><%=mbeks%> </td>
    <td colspan="2" rowspan="4" align="center"><b>�Ű��</b></td>
    <td width="7%" align="center"><b>��ʽ</b></td>
    <td width="14%"><%=mbsks%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="7%" align="center"><b>��ɫ</b></td>
    <td colspan="2"><%=mbyys%> </td>
    <td align="center" width="7%"><b>��ɫ </b></td>
    <td colspan="2"><%=mbeys%> </td>
    <td width="7%" align="center"><b>��ɫ</b></td>
    <td width="14%"><%=mbsys%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="7%" align="center"><b>����</b></td>
    <td colspan="2"><%=mbygy%> </td>
    <td align="center" width="7%"><b>���� </b></td>
    <td colspan="2"><%=mbegy%> </td>
    <td width="7%" align="center"><b>����</b></td>
    <td width="14%"><%=mbsgy%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" height="27"> 
    <td width="7%" align="center"><b>���</b></td>
    <td colspan="2"><%=mbyfb%> </td>
    <td align="center" width="7%"><b>��� </b></td>
    <td colspan="2"><%=mbefb%> </td>
    <td width="7%" align="center"><b>���</b></td>
    <td width="14%"><%=mbsfb%></td>
  </tr>
</table>
<center>
  ���������á���������Ӳ��֡�
</center>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="7%">���</td>
	<td  width="13%">����</td>
	<td  width="11%">�ͺ�</td>
	<td  width="11%">���</td>
	<td  width="5%">����</td>
	<td  width="5%">��λ</td>
	<td  width="7%">�շ����</td>
	<td  width="6%">����</td>
	<td  width="7%">���</td>
	<td  width="5%">�����ۿ���</td>
	<td  width="7%">�ۺ��</td>
	<td  width="13%">��ע</td>
</tr>
<%
	ls_sql="SELECT xuhao,bh,mc,xh,gg,sl,dw,sflb,TO_CHAR(dj),je,TO_CHAR(zkl),zhj,note  ";
	ls_sql+=" FROM jc_yfsjbf  ";
    ls_sql+=" where jc_yfsjbf.ddbh='"+ddbh+"'";
    ls_sql+=" order by xuhao";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

	
//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("lb","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	
	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

<center>��������Ʒ��������</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="6%">���</td>
	<td  width="13%">����</td>
	<td  width="9%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="5%">����</td>
	<td  width="5%">��λ</td>
	<td  width="7%">�շ����</td>
	<td  width="6%">����</td>
	<td  width="6%">���</td>
	<td  width="5%">�����ۿ���</td>
	<td  width="6%">�ۺ��</td>
	<td  width="20%">��ע</td>
</tr>
<%
	ls_sql="SELECT xuhao,bh,mc,xh,gg,sl,dw,sflb,TO_CHAR(dj),je,TO_CHAR(zkl),zhj,note  ";
	ls_sql+=" FROM jc_yfdgsp  ";
    ls_sql+=" where jc_yfdgsp.ddbh='"+ddbh+"'";
    ls_sql+=" order by xuhao";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

	
//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("lb","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	
	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>


</body>
</html>
