<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String ddbh=request.getParameter("ddbh");
%>

<body bgcolor="#FFFFFF">
<div align="center"><b>������<%=ddbh%>��������Ϣ</b></div>

<%
String gtmc=null;
String jjazwz=null;
String guige=null;
String jjlx=null;
String bcpp=null;
String bclx=null;
String bcys=null;
double bcbfje=0;
double pjbfje=0;
double zj=0;
double zqbcbfje=0;
double zqpjbfje=0;
double zqzj=0;
String bz=null;
String gtxh=null;
int sl=0;
int zjhsl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select gtxh,ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bcbfje,pjbfje,zj,zqbcbfje,zqpjbfje,zqzj,bz,sl,zjhsl ";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by gtxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		gtmc=cf.fillNull(rs.getString("gtmc"));
		jjazwz=cf.fillHtml(rs.getString("jjazwz"));
		guige=cf.fillHtml(rs.getString("guige"));
		jjlx=cf.fillHtml(rs.getString("jjlx"));
		bcpp=cf.fillNull(rs.getString("bcpp"));
		bclx=cf.fillNull(rs.getString("bclx"));
		bcys=cf.fillNull(rs.getString("bcys"));
		bcbfje=rs.getDouble("bcbfje");
		pjbfje=rs.getDouble("pjbfje");
		zj=rs.getDouble("zj");
		zqbcbfje=rs.getDouble("zqbcbfje");
		zqpjbfje=rs.getDouble("zqpjbfje");
		zqzj=rs.getDouble("zqzj");
		bz=cf.fillHtml(rs.getString("bz"));
		sl=rs.getInt("sl");
		zjhsl=rs.getInt("zjhsl");

		%>
<BR>
<center><b><%=gtmc%>��������ţ�<%=gtxh%>������ͬ������<%=sl%>��������������<%=zjhsl%>��</b></center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">��װλ��</td>
    <td width="32%"><%=jjazwz%></td>
    <td align="right" width="18%">�Ҿ�ϵ��</td>
    <td width="32%"><%=jjlx%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ��� </td>
    <td width="32%"> <%=guige%> </td>
    <td align="right" width="18%">�����ɫ</td>
    <td width="32%"><%=bcys%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ���Ʒ�� </td>
    <td width="32%"> <%=bcpp%> </td>
    <td align="right" width="18%">�������</td>
    <td width="32%"><%=bclx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><strong>��Ĳ��ֽ���ǰ</strong></td> 
    <td width="32%"><%=zqbcbfje%></td>
    <td align="right" width="18%"><span class="STYLE1">��Ĳ��ֽ��ۺ�</span></td>
    <td width="32%"><%=bcbfje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>������ֽ���ǰ</strong></td>
    <td><%=zqpjbfje%></td>
    <td align="right"><span class="STYLE1">������ֽ��ۺ�</span></td>
    <td><%=pjbfje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>�ܼۣ���ǰ</strong></td>
    <td><%=zqzj%></td>
    <td align="right"><span class="STYLE1">�ܼۣ��ۺ�</span></td>
    <td><%=zj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">��ע </td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="10%">�������</td>
			<td  width="17%">�������</td>
			<td  width="6%">��ĺ��</td>
			<td  width="9%">��*��(mm)</td>
			<td  width="6%">����</td>
			<td  width="6%"><strong>��ǰ����</strong></td>
			<td  width="6%"><span class="STYLE1">�ۺ󵥼�</span></td>
			<td  width="9%"><strong>��ǰ���</strong></td>
			<td  width="9%"><span class="STYLE1">�ۺ���</span></td>
			<td  width="22%">��ע</td>
		</tr>
		<%
			ls_sql="SELECT bjmc,bcpp,TO_CHAR(bchd),cd||'*'||kd,sl,TO_CHAR(bzdj),TO_CHAR(khdj),zqje,je,bz  ";
			ls_sql+=" FROM jc_gtbjmx  ";
			ls_sql+=" where gtxh='"+gtxh+"'";
			ls_sql+=" order by bjxh";

			pageObj.sql=ls_sql;
		//���ж����ʼ��
			pageObj.initPage("","","","");
			pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
			pageObj.out=out;
			pageObj.getDate(1);

			pageObj.displayDateSum();
		%> 
		</table>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="15%">�������</td>
			<td  width="11%">�ͺ�</td>
			<td  width="11%">���</td>
			<td  width="7%">������λ</td>
			<td  width="5%">����</td>
			<td  width="7%"><strong>��ǰ����</strong></td>
			<td  width="7%"><span class="STYLE1">�ۺ󵥼�</span></td>
			<td  width="9%"><strong>��ǰ���</strong></td>
			<td  width="9%"><span class="STYLE1">�ۺ���</span></td>
			<td  width="19%">��ע</td>
		</tr>
		<%
			ls_sql="SELECT gtpjmc,xinghao,guige,jldwmc,sl,TO_CHAR(bzdj),TO_CHAR(khdj),zqje,je,bz  ";
			ls_sql+=" FROM jc_gtpjmx,jdm_jldwbm  ";
			ls_sql+=" where jc_gtpjmx.jldwbm=jdm_jldwbm.jldwbm(+) and jc_gtpjmx.gtxh='"+gtxh+"'";
			ls_sql+=" order by pjxh";

			pageObj.sql=ls_sql;
		//���ж����ʼ��
			pageObj.initPage("","","","");
			pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
			pageObj.out=out;
			pageObj.getDate(1);

			pageObj.displayDateSum();
		%> 
		</table>

		<%

	}
	rs.close();
	ps.close();
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

<P>
<div align="center"><b>��<%=ddbh%>���Ͳ�����Ϣ</b></div>
<table border="1" width="300%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%" rowspan="2">�Ͳ�������</td>
  <td  width="3%" rowspan="2">�Ͳ�������</td>
  <td  width="2%" rowspan="2">�����շ�</td>
  <td  width="3%" rowspan="2"><strong>��ǰ�ܼ�</strong></td>
  <td  width="3%" rowspan="2"><span class="STYLE1">�ۺ��ܼ�</span></td>
  <td  width="2%" rowspan="2">��ͬ����</td>
  <td  width="2%" rowspan="2">����������</td>
  <td  width="3%" rowspan="2">��װλ��</td>
  <td  width="3%" rowspan="2">��*��(mm)</td>
  <td  width="6%" rowspan="2" align="left"><strong>������</strong>���߿��ͺ�<BR>
	  <strong>����</strong>������<BR>
	  <strong>����</strong>������<BR>
    <strong>�������</strong>������</td>
  <td  width="3%" rowspan="2">�߿���ɫ</td>
  <td  width="6%" rowspan="2">װ������</td>
  <td  width="8%" rowspan="2">��Ʒ˵��</td>
  <td colspan="6">���һ</td>
  <td colspan="6">����</td>
  <td  width="12%" rowspan="2">��ע</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���1����</td>
	<td  width="6%" align="left"><strong>������</strong>������<BR>
	  <strong>����</strong>����ɫ<BR>
	  <strong>����</strong>����ɫ<BR>
    <strong>�������</strong>������</td>
	<td  width="6%">о������</td>
	<td  width="2%"><strong>ƽ�׵���</strong></td>
	<td  width="2%"><span class="STYLE1">���׵���</span></td>
	<td  width="3%">���(mm)</td>

	<td  width="2%">���2����</td>
	<td  width="6%" align="left"><strong>������</strong>������<BR>
	  <strong>����</strong>����ɫ<BR>
	  <strong>����</strong>����ɫ<BR>
    <strong>�������</strong>������</td>
	<td  width="6%">о������</td>
	<td  width="2%"><strong>ƽ�׵���</strong></td>
	<td  width="2%"><span class="STYLE1">���׵���</span></td>
	<td  width="3%">���(mm)</td>
  </tr>
<%
	ls_sql="SELECT xcmlxmc,xcmmc,qtsf,zqzj,zj,sl,zjhsl,azwz,gd||'*'||kd gg,bklxxh,bkys,zsxt,bjbz,xcmbm1,mbcl1,xbpz1,TO_CHAR(pmdj1),TO_CHAR(ymdj1),gd1||'*'||kd1,xcmbm2,mbcl2,xbpz2,TO_CHAR(pmdj2),TO_CHAR(ymdj2),gd2||'*'||kd2,bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+) and ddbh='"+ddbh+"'";
    ls_sql+=" order by xcmxh";

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
<div align="center"><b>��<%=ddbh%>����Ʒ�Ҿ߶�����ϸ</b></div>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="4%"><strong>��ǰ����</strong></td>
	<td  width="4%"><span class="STYLE1">�ۺ󵥼�</span></td>
	<td  width="4%">��ͬ����</td>
	<td  width="5%"><strong>��ǰ-��ͬ�ܼ�</strong></td>
	<td  width="5%"><span class="STYLE1">�ۺ�-��ͬ�ܼ�</span></td>
	<td  width="4%">����������</td>
	<td  width="5%"><strong>��ǰ-�������ܼ�</strong></td>
	<td  width="5%"><span class="STYLE1">�ۺ�-�������ܼ�</span></td>
	<td  width="6%">���</td>
	<td  width="5%">����</td>
	<td  width="5%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="7%">ϵ������</td>
	<td  width="9%">����</td>
	<td  width="10%">��ɫ����</td>
	<td  width="13%">��ע</td>
</tr>
<%
	ls_sql="SELECT cpjjbh,TO_CHAR(bzdj),TO_CHAR(khdj),sl,zqzj,zj,zjhsl,zqzjhzj,zjhzj,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,cpjjhs,bz  ";
	ls_sql+=" FROM jc_cpjjddmx  ";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by cpjjbh";

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
