<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #3300FF}
-->
</style>
</head>
<%

String fgsbh=request.getParameter("fgsbh");
String ywy=cf.GB2Uni(request.getParameter("ywy"));
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");
String xdsskbfb=request.getParameter("xdsskbfb");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="InsertCw_ywyjsjl.jsp" name="insertform" >

<center>
  ��ѡ�񣭣����㹤�أ�<%=ywy%>��
  <input type="button"  value="ѡ�񹤵أ�����" onclick="f_do(insertform)">
    <input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
    <input type="hidden" name="ywy" value="<%=ywy%>" >
    <input type="hidden" name="sjfw" value="<%=sjfw%>" >
    <input type="hidden" name="sjfw2" value="<%=sjfw2%>" >
    <input type="hidden" name="xdsskbfb" value="<%=xdsskbfb%>" >
</center>

<BR>
<center>��ǩ�����㣭��������ϸ��</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ѡ��</td>
	<td  width="9%">��ͬ��</td>
	<td  width="7%">����</td>
	<td  width="24%">���ݵ�ַ</td>
	<td  width="7%">ʩ����</td>
	<td  width="6%">�ʼ�</td>
	<td  width="9%">ǩԼ����</td>
	<td  width="10%">����ǩԼ��</td>
	<td  width="10%">��װʵ�տ� </td>
	<td  width="7%">���̽���</td>
	<td  width="7%">�ͻ�����</td>
</tr>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
String zjxm=null;
String qyrq=null;
String sjjgrq=null;
String tdsj=null;
double qye=0;
double sfke=0;
double allqye=0;
double allsfke=0;
double ywyqdjsbl=0;
double ywyqdjsje=0;
double allywyqdjsje=0;
String ysgcjdmc=null;
String ywyjsbz=null;
String zt=null;

String bgcolor="#E8E8FF";

int row=0;
int row1=0;
int row2=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,sjjgrq,tdsj,qye,sfke,ywyqdjsbl,ywyqdjsje,ysgcjdmc,DECODE(ywyjsbz,'0','δ����','1','ǩ������','2','�깤����') ywyjsbz,DECODE(crm_khxx.zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') zt";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.qyrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+ywy+"' and crm_khxx.ywyjsbz='0'";//0��δ���㣻1��ǩ�����㣻2���깤����
    ls_sql+=" and crm_khxx.sfke*100.0>=crm_khxx.qye*"+xdsskbfb;
    ls_sql+=" and crm_khxx.zt in('2','5')";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ywyqdjsbl=rs.getDouble("ywyqdjsbl");
		ywyqdjsje=rs.getDouble("ywyqdjsje");
		ysgcjdmc=rs.getString("ysgcjdmc");
		ywyjsbz=rs.getString("ywyjsbz");
		zt=rs.getString("zt");

		allqye+=qye;
		allsfke+=sfke;
		allywyqdjsje+=ywyqdjsje;

		row++;
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
				<input name="khbh" type="checkbox" value="<%=khbh%>">			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=qyrq%></td>
			<td><%=qye%></td>
			<td><%=sfke%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=zt%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);
	allywyqdjsje=cf.doubleTrim(allywyqdjsje);

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allqye%></td>
		<td><%=allsfke%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

<center>���깤���㣭��������ϸ��</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ѡ��</td>
	<td  width="9%">��ͬ��</td>
	<td  width="7%">����</td>
	<td  width="24%">���ݵ�ַ</td>
	<td  width="7%">ʩ����</td>
	<td  width="6%">�ʼ�</td>
	<td  width="9%">�깤����</td>
	<td  width="10%">�ѽ������</td>
	<td  width="10%">�ѽ����� </td>
	<td  width="7%">���̽���</td>
	<td  width="7%">�ͻ�����</td>
</tr>

<%
	allqye=0;
	allsfke=0;
	allywyqdjsje=0;

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,sjjgrq,tdsj,qye,sfke,ywyqdjsbl,ywyqdjsje,ysgcjdmc,DECODE(ywyjsbz,'0','δ����','1','ǩ������','2','�깤����') ywyjsbz,DECODE(crm_khxx.zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') zt";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+ywy+"'";//0��δ���㣻1��ǩ�����㣻2���깤����
    ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
    ls_sql+=" and crm_khxx.ywyjsbz='1' and crm_khxx.gcjdbm in('4','5') and crm_khxx.zt in('2','5') ";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ywyqdjsbl=rs.getDouble("ywyqdjsbl");
		ywyqdjsje=rs.getDouble("ywyqdjsje");
		ysgcjdmc=rs.getString("ysgcjdmc");
		ywyjsbz=rs.getString("ywyjsbz");
		zt=rs.getString("zt");

		allqye+=qye;
		allsfke+=sfke;
		allywyqdjsje+=ywyqdjsje;

		row1++;
		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
				<input name="khbh1" type="checkbox" value="<%=khbh%>">			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=sjjgrq%></td>
			<td><%=ywyqdjsbl%>%</td>
			<td><%=ywyqdjsje%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=zt%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);
	allywyqdjsje=cf.doubleTrim(allywyqdjsje);

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allywyqdjsje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

<center>���˵����㣭��������ϸ��</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ѡ��</td>
	<td  width="9%">��ͬ��</td>
	<td  width="7%">����</td>
	<td  width="24%">���ݵ�ַ</td>
	<td  width="7%">ʩ����</td>
	<td  width="6%">�ʼ�</td>
	<td  width="9%">�˵�����</td>
	<td  width="10%">�ѽ������</td>
	<td  width="10%">�ѽ����� </td>
	<td  width="7%">���̽���</td>
	<td  width="7%">�ͻ�����</td>
</tr>

<%
	allqye=0;
	allsfke=0;
	allywyqdjsje=0;

	ls_sql="SELECT khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,sjjgrq,tdsj,qye,sfke,ywyqdjsbl,ywyqdjsje,ysgcjdmc,DECODE(ywyjsbz,'0','δ����','1','ǩ������','2','�깤����') ywyjsbz,DECODE(crm_khxx.zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','�Ǽ�װ�ͻ�','5','��ƿͻ�') zt";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+ywy+"'";
    ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.tdsj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD')";
    ls_sql+=" and crm_khxx.ywyjsbz!='2' ";
    ls_sql+=" and crm_khxx.zt in('3')  ";
    ls_sql+=" order by tdsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		tdsj=cf.fillHtml(rs.getDate("tdsj"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ywyqdjsbl=rs.getDouble("ywyqdjsbl");
		ywyqdjsje=rs.getDouble("ywyqdjsje");
		ysgcjdmc=rs.getString("ysgcjdmc");
		ywyjsbz=rs.getString("ywyjsbz");
		zt=rs.getString("zt");

		allqye+=qye;
		allsfke+=sfke;
		allywyqdjsje+=ywyqdjsje;

		row2++;
		if (row2%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td>
				<input name="khbh2" type="checkbox" value="<%=khbh%>">			
			</td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=hth%></A></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=tdsj%></td>
			<td><%=ywyqdjsbl%>%</td>
			<td><%=ywyqdjsje%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=zt%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	allqye=cf.doubleTrim(allqye);
	allsfke=cf.doubleTrim(allsfke);
	allywyqdjsje=cf.doubleTrim(allywyqdjsje);

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allywyqdjsje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>


</form>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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



</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	var mark=0;
	if (<%=row%>>1)
	{
		for (var i=0;i<<%=row%> ;i++ )
		{
			if( FormName.khbh[i].checked ){
				mark=1;
			}
		}
	}
	else if (<%=row%>==1)
	{
		if( FormName.khbh.checked ){
			mark=1;
		}
	}

	if (mark==0)
	{
		if ( !confirm("���ѣ�û��ѡ���κΡ�ǩ�����㹤�ء���ȷʵҪ������") )	
		{
			return false;
		}
	}

	mark=0;

	if (<%=row1%>>1)
	{
		for (var i=0;i<<%=row1%> ;i++ )
		{
			if( FormName.khbh1[i].checked ){
				mark=1;
			}
		}
	}
	else if (<%=row1%>==1)
	{
		if( FormName.khbh1.checked ){
			mark=1;
		}
	}

	if (mark==0)
	{
		if ( !confirm("���ѣ�û��ѡ���κΡ��깤�������㹤�ء���ȷʵҪ������") )	
		{
			return false;
		}
	}

	mark=0;

	if (<%=row2%>>1)
	{
		for (var i=0;i<<%=row2%> ;i++ )
		{
			if( FormName.khbh2[i].checked ){
				mark=1;
			}
		}
	}
	else if (<%=row2%>==1)
	{
		if( FormName.khbh2.checked ){
			mark=1;
		}
	}

	if (mark==0)
	{
		if ( !confirm("���ѣ�û��ѡ���κΡ��˵����㹤�ء���ȷʵҪ������") )	
		{
			return false;
		}
	}

	FormName.action="InsertCw_ywyjsjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>