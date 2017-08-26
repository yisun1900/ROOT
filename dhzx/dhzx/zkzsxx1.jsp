<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=null;
String fwdz=null;


double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;

String zjxzklx="";
String zjxzklxmc="";
double gczjxfzk=10;
double gcjxzk=10;
double glfzjxzk=10;
double jxglfzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;

double clfzk=0;
double zcfzk=0;
double rgfzk=0;
double ysfzk=0;
double jxfzk=0;
double shfzk=0;
double qtfzk=0;

double djjbfb=0;
double djjje=0;
double zjxdjjje=0;
double rzfbfb=0;
double htrzf=0;
double zjxrzf=0;

String djjzsfs="";
double khfqbfb=0;
double khfqje=0;

String cxhdbm=null;
String ssfgs=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,ssfgs,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();


	ls_sql="select zjxzklx,DECODE(zjxzklx,'1','ͬ��ͬ','2','�����ۿ�') zjxzklxmc,gcfqdzk,glfzk,sjzk,sjfzk";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		zjxzklxmc=cf.fillNull(rs.getString("zjxzklxmc"));
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from crm_khbffyzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select  gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk ";
	ls_sql+=" from  crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");

	}
	rs.close();
	ps.close();

	ls_sql="select DECODE(djjzsfs,'1','�̶����','2','�ٷֱ�') djjzsfs,khfqbfb,khfqje ";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		khfqbfb=rs.getDouble("khfqbfb");
		khfqje=rs.getDouble("khfqje");
	}
	rs.close();
	ps.close();

	ls_sql="select djjbfb,djjje,zjxdjjje,rzfbfb,htrzf,zjxrzf ";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjbfb=rs.getDouble("djjbfb");
		djjje=rs.getDouble("djjje");
		zjxdjjje=rs.getDouble("zjxdjjje");

		rzfbfb=rs.getDouble("rzfbfb");
		htrzf=rs.getDouble("htrzf");
		zjxrzf=rs.getDouble("zjxrzf");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>�ۿ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�ۿ�������Ϣ</div> 
<div align="center"></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right"><strong>�ͻ���� </strong></td>
    <td width="29%"><%=khbh%></td>
    <td width="21%" align="right"><b>�ͻ�����</b></td>
    <td width="29%"><%=khxm%></td>
  </tr>
  
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF"><b>���ݵ�ַ</b></td>
    <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>��˾�����</strong></td>
    <td colspan="3"><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>С�������</strong></td>
    <td colspan="3"><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right" bgcolor="#CCCCFF"><strong>չ������</strong></td>
    <td colspan="3"><%=cxhdbmzh%></td>
  </tr>
  
  <tr bgcolor="#CCCCFF">
    <td colspan="4" align="center"><strong>��ͬ�ۿ�</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̷�ǩ���ۿ�</td>
    <td><%=gcfqdzk%></td><td align="right">&nbsp;</td>
      <td>&nbsp;</td></tr>
  <tr bgcolor="#FFFFFF">
    <td height="21" align="right">������ۿ�</td>
    <td><%=glfzk%></td><td align="right">˰���ۿ�</td>
      <td><%=sjzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ʒ��ۿ�</td>
    <td><%=sjfzk%></td><td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td colspan="4" align="center"><strong>�������ۿ�</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�������ۿ�����</td>
    <td colspan="3"><%=zjxzklxmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���������ۿ�</td>
    <td><%=gczjxfzk%></td>
    <td align="right">���̼����ۿ�</td>
    <td><%=gcjxzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="21" align="right">���������ۿ�</td>
    <td><%=glfzjxzk%></td>
    <td align="right">���������ۿ�</td>
    <td><%=jxglfzk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����˰���ۿ�</td>
    <td><%=sjzjxzk%></td><td align="right">����˰���ۿ�</td>
      <td><%=sjfzjxzk%></td></tr>
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center" bgcolor="#FFFFCC"><p>���̷Ѳ��ִ���</p></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̣����ķ��ۿ�</td>
    <td><%=clfzk%></td><td align="right">���̣����ķ��ۿ�</td>
      <td><%=zcfzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̣��˹����ۿ�</td>
    <td><%=rgfzk%></td><td align="right">���̣�������ۿ�</td>
      <td><%=ysfzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̣���е���ۿ�</td>
    <td><%=jxfzk%></td><td align="right">���̣���ķ��ۿ�</td>
      <td><%=shfzk%></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���̣��������ۿ�</td>
    <td><%=qtfzk%></td><td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">ǩ��ǰѡ�����ȯ���ͷ�ʽ</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ȯ���ͷ�ʽ</td>
    <td><%=djjzsfs%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ȯ�ٷֱ�</td>
    <td><%=khfqbfb%>%</td>
    <td align="right">���ͽ��</td>
    <td><%=khfqje%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFCC">ǩ������</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ȯ�ٷֱ�</td>
    <td><%=djjbfb%>%</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ���ʹ���ȯ</td>
    <td><%=djjje%></td>
    <td align="right">���������ȯ</td>
    <td><%=zjxdjjje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��֤�Ѱٷֱ�</td>
    <td><%=rzfbfb%>%</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ��֤��</td>
    <td><%=htrzf%></td>
    <td align="right">��������֤��</td>
    <td><%=zjxrzf%></td>
  </tr>
</table>

<P>
��ͬ����
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="20%">һ��������Ŀ</td>
	<td  width="6%">������λ</td>
	<td  width="8%">�г�����</td>
	<td  width="8%">�ɱ�����</td>
	<td  width="6%">��������</td>
	<td  width="6%">��������</td>
	<td  width="6%">ʵ������</td>
	<td  width="35%">��ע</td>
</tr>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
ls_sql="select DECODE(lx,'1','��ѡ','2','��ѡ'),zsxm,jldw,TO_CHAR(scdj),TO_CHAR(cbdj),TO_CHAR(zsslsx),TO_CHAR(zsslxx),sjsl,bz  ";
ls_sql+=" from crm_khzsxx ";
ls_sql+=" where khbh='"+khbh+"'";
ls_sql+=" order by zsxm";

pageObj.sql=ls_sql;
//���ж����ʼ��
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>


��ͬ����

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">����������Ŀ</td>
	<td  width="6%">������λ</td>
	<td  width="8%">�г�����</td>
	<td  width="8%">�ɱ�����</td>
	<td  width="6%">��������</td>
	<td  width="6%">��������</td>
	<td  width="6%">ʵ������</td>
	<td  width="35%">��ע</td>
</tr>

<%
ls_sql="select zsxm,jldw,TO_CHAR(scdj),TO_CHAR(cbdj),TO_CHAR(zsslsx),TO_CHAR(zsslxx),sjsl,bz  ";
ls_sql+=" from crm_khtqzsxx ";
ls_sql+=" where khbh='"+khbh+"'";
ls_sql+=" order by zsxm";

pageObj.sql=ls_sql;
//���ж����ʼ��
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>

<P>
�������ͣ�������Ϊ�գ���ʾ������Ϣ���ͬ��ͬ��
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">����</td>
	<td  width="20%">һ��������Ŀ</td>
	<td  width="6%">������λ</td>
	<td  width="8%">�г�����</td>
	<td  width="8%">�ɱ�����</td>
	<td  width="6%">��������</td>
	<td  width="6%">��������</td>
	<td  width="6%">ʵ������</td>
	<td  width="35%">��ע</td>
</tr>

<%
ls_sql="select DECODE(lx,'1','��ѡ','2','��ѡ'),zsxm,jldw,TO_CHAR(scdj),TO_CHAR(cbdj),TO_CHAR(zsslsx),TO_CHAR(zsslxx),sjsl,bz  ";
ls_sql+=" from crm_khzsxxzx ";
ls_sql+=" where khbh='"+khbh+"'";
ls_sql+=" order by zsxm";

pageObj.sql=ls_sql;
//���ж����ʼ��
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>


�������ͣ�������Ϊ�գ���ʾ������Ϣ���ͬ��ͬ��

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">����������Ŀ</td>
	<td  width="6%">������λ</td>
	<td  width="8%">�г�����</td>
	<td  width="8%">�ɱ�����</td>
	<td  width="6%">��������</td>
	<td  width="6%">��������</td>
	<td  width="6%">ʵ������</td>
	<td  width="35%">��ע</td>
</tr>

<%
ls_sql="select zsxm,jldw,TO_CHAR(scdj),TO_CHAR(cbdj),TO_CHAR(zsslsx),TO_CHAR(zsslxx),sjsl,bz  ";
ls_sql+=" from crm_khtqzsxxzx ";
ls_sql+=" where khbh='"+khbh+"'";
ls_sql+=" order by zsxm";

pageObj.sql=ls_sql;
//���ж����ʼ��
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>

<P>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">�շ���Ŀ</td>
	<td  width="8%">�շѼ��㷽ʽ</td>
	<td  width="4%">�ٷֱ�</td>
	<td  width="4%">������λ</td>
	<td  width="4%">����</td>
	<td  width="5%">����</td>
	<td  width="6%">��ǰ���</td>
	<td  width="3%">�����ۿ�</td>
	<td  width="6%">�ۺ���</td>
	<td  width="4%">����ǩԼ��</td>
	<td  width="4%">����˰��</td>
	<td  width="4%">��������</td>
	<td  width="4%">�Ƿ�ɴ���</td>
	<td  width="3%">����ۿ�</td>
	<td  width="5%">�շ���Ŀ����</td>
	<td  width="4%">ʩ���ӽ���</td>
	<td  width="20%">��ע</td>
</tr>

<%

ls_sql="SELECT sfxmmc,DECODE(bj_sfxmmx.sflx,'1','����ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶����(���ɸ�)','5','�����','6','���ķѰٷֱ�','7','���̼����ķѰٷֱ�') sflx ";
ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','����','2','<font color=\"#FF0000\"><B>������</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','����','2','������') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','����','2','������') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','���ɴ�','Y','�ɴ�') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(bj_sfxmmx.sfxmlx,'1','��ӹ��̷�','2','������ط�','3','��Ʒ�','4','������ķ�','5','���̹����','6','����˰��','7','���Ĺ����','8','����˰��','9','����') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','��','Y','��') sfcysgdjs,bj_sfxmmx.bz";
ls_sql+=" FROM bj_sfxmmx  ";
ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
ls_sql+=" order by bj_sfxmmx.sfxmbm";

pageObj.sql=ls_sql;
//���ж����ʼ��
pageObj.initPage("","","","");
pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

pageObj.out=out;
pageObj.getDate(1);

pageObj.displayDateSum();

%>
</table>

 

</body>
</html>
