<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String yhmc=(String)session.getAttribute("yhmc");
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
//chooseitem=chooseitem.replaceAll("clbm","jxc_gysddmx.clbm");
String clbmlist="";
String gysddph=null;
String dqbm=null;
String ckbh=null;
String hjbh=null;
String rklx=null;
String rkdzt=null;
String ddbh=null;
String fgsbh=null;
String jsr=null;
String rkr=null;
String rksj=null;
String ckzje=null;
String wheregysddph=null;
String psfs=null;
String sfjz=null;
String sfth=null;
String gysmc=null;
String nian=null;
String yue=null;
String ri=null;
String bz="";
String czxh=null;
String jhshsj=null;
String hth=null;
String lydh=null;
String shr=null;
String zbshr=null;
String xzbshyy=null;
String yqdhsj=null;
String xdrq=null;
String xdr=null;
String cglb=null;
int ckzsl=0;
String dz=null;
String dwmc=null;
String fhshr=null;
String shrsj=null;
String dh=null;
String shfgs=null;
wheregysddph=cf.GB2Uni(request.getParameter("gysddph"));
//String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	

	ls_sql="select gysddph,to_char(yqdhsj,'YYYY') nian,to_char(yqdhsj,'MM') yue,to_char(yqdhsj,'DD') ri,gysmc,dqmc dqbm,DECODE(cglb,'J','���Ųɹ�','D','�ط��ɹ�') cglb,xdr,to_char(xdrq,'YYYY-MM-DD') xdrq,to_char(yqdhsj,'YYYY-MM-DD') yqdhsj,dwmc fgsbh,DECODE(psfs,'1','����','2','��ȡ','3','����') psfs,jxc_gysdd.bz bz,shfgs ";
	ls_sql+=" from  jxc_gysdd,sq_dwxx,dm_dqbm ";
	ls_sql+=" where (gysddph='"+wheregysddph+"') and jxc_gysdd.dqbm=dm_dqbm.dqbm and jxc_gysdd.ssfgs=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));
		ri=cf.fillNull(rs.getString("ri"));
		shfgs=cf.fillNull(rs.getString("shfgs"));

		psfs=cf.fillNull(rs.getString("psfs"));
		gysddph=cf.fillNull(rs.getString("gysddph"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		cglb=cf.fillNull(rs.getString("cglb"));
		xdr=cf.fillNull(rs.getString("xdr"));
		xdrq=cf.fillNull(rs.getString("xdrq"));
		yqdhsj=cf.fillNull(rs.getString("yqdhsj"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bz=cf.fillNull(rs.getString("bz"));

	}
	rs.close();
	ps.close();
	
	//��ѯ�ֹ�˾��ϵ�˼���ַ
	ls_sql="select dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2,sm1,sm2 ";
	ls_sql+=" from  jxc_fgslxr ";
	ls_sql+=" where (dwbh='"+shfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dz=cf.fillNull(rs.getString("dz"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		fhshr=cf.fillNull(rs.getString("shr"));
		shrsj=cf.fillNull(rs.getString("shrsj"));
		dh=cf.fillNull(rs.getString("dh"));

	}
	rs.close();
	ps.close();

//	ls_sql="select count(*)+1 ";
//	ls_sql+=" from jxc_rkmx ";
//	ls_sql+=" where gysddph='"+gysddph+"'";
////	out.print(ls_sql);
//	ps= conn.prepareStatement(ls_sql);
//	rs =ps.executeQuery(ls_sql);
//	while (rs.next())
//	{
//		ckzsl=rs.getInt(1);
//	}
//	rs.close();
//	ps.close();
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
<title>���϶���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><font size="+2"><b>�����ڴ�װ�ι��̣����������޹�˾---<U>&nbsp;<%=fgsbh%>&nbsp;</U>���϶���</font></b></div>
<div align="center"><font size="+3"><b>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</b></font></div>
<table width="100%" border="0" style="FONT-SIZE:18" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    ��&nbsp;Ӧ&nbsp;�̣�</td>
  <td colspan="3"> 
   <%=gysmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"> 
    �������ţ�</td>
  <td width="30%"> 
    <%=gysddph%>  </td>
		<td align="right" width="20%"> 
    ���ͷ�ʽ��</td>
  <td width="30%"> 
    <%=psfs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �ջ���λ��</td>
  <td > 
   <%=dwmc%>  </td>
   <td align="right" width="10%"> 
    Ҫ�󵽻����ڣ�</td>
  <td > 
    <U>&nbsp;<%=nian%>&nbsp;</U>��<U>&nbsp;<%=yue%>&nbsp;</U>��<U>&nbsp;<%=ri%>&nbsp;</U>�� </td>
</tr>
<!-- <tr bgcolor="#FFFFFF">
  
  <td align="right" width="10%"> 
    �ջ���ַ��</td>
  <td colspan="3"> 
   <%=dz%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
	<td align="right" width="10%"> 
    ��&nbsp;��&nbsp;�ˣ�</td>
  <td width="20%"> 
    <%=fhshr%>��<%=shrsj%>��  </td>
  <td align="right" width="10%">��ϵ��ʽ��</td>
  <td width="25%"> <%=dh%> </td>
</tr> -->

</table>
<DIV>&nbsp;</DIV>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0">
<tr bgcolor="#FFFFFF">
	<td align="center" width="5%"><b>���</b></td>
	<td align="center" width="10%"><b>�ڲ�����</b></td>
	<td align="center" width="20%"><b>��������</b></td>
	<td align="center" width="15%"><b>�ͺ�</b></td>
	<td align="center" width="15%"><b>���Ϲ��</b></td>
	<td align="center" width="5%"><b>��������</b></td>
	<td align="center" width="8%"><b>������λ</b></td>
<!-- 	<td align="center" width="8%"><b>�����M<SUP>3</SUP>��</b></td>
	<td align="center" width="8%"><b>������KG��</b></td> -->
</tr>
<%
int dhxh=0;
int i=0;
String xh=null;
String clbm=null;
String clmc=null;
String gg=null;
String jldwmc=null;
double dhsl=0;
double sumdhsl=0;
double cltj=0;
double djzl=0;
double sumcltj=0;
double sumdjzl=0;
try {
	conn=cf.getConnection();
	ls_sql="select distinct clbm ";
	ls_sql+=" from jxc_clbm ";
	ls_sql+=" where "+chooseitem+" ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clbmlist+="'"+cf.fillNull(rs.getString("clbm"))+"',";
	}
	clbmlist=clbmlist.substring(0,clbmlist.length()-1);
	rs.close();
	ps.close();
	ls_sql="select dhxh,jxc_clbm.nbbm clbm,jxc_gysddmx.xh xh,jxc_gysddmx.clmc clmc,jxc_gysddmx.gg gg,jldwbm jldwmc,jxc_gysddmx.dhsl dhsl,clcd*clkd*clgd/1000000 cltj,djzl ";
	ls_sql+=" from jxc_gysddmx,jxc_clbm ";
	ls_sql+=" where gysddph='"+gysddph+"' and jxc_clbm.clbm=jxc_gysddmx.clbm and jxc_gysddmx.clbm in("+clbmlist+") ";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i++;
		dhxh=rs.getInt("dhxh");
		clbm=cf.fillNull(rs.getString("clbm"));
		xh=cf.fillNull(rs.getString("xh"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		dhsl=rs.getDouble("dhsl");
		cltj=rs.getDouble("cltj");
		djzl=rs.getDouble("djzl");
		sumdhsl+=dhsl;
		sumcltj+=cltj*dhsl;
		sumdjzl+=djzl*dhsl;
		%>
		<tr bgcolor="#FFFFFF">
		<td align="center"><%=i%></td>
		<td align="center"><%=clbm%></td>
		<td align="center"><%=clmc%></td>
		<td align="center"><%=xh%></td>
		<td align="center"><%=gg%></td>
		<td align="center"><%=dhsl%></td>
		<td align="center"><%=jldwmc%></td>
<!-- 		<td align="center"><%=cltj%>*<%=dhsl%></td>
		<td align="center"><%=djzl%>*<%=dhsl%></td> -->
		<%
			if (i==1)
//		{out.print("<td  rowspan=\""+ckzsl+"\">"+xzbshyy+"</td>");}
			%>
		</tr>
		<%
	}
	rs.close();
	ps.close();
	sumcltj=sumcltj*1000;
	%>
		<tr bgcolor="#FFFFFF">
		<td align="center" colspan="5">�ϼ�</td>
		<td align="center"><%=cf.formatDouble(sumdhsl)%></td>
		<td align="center">&nbsp;</td>
		<!-- <td align="center"><%=Math.floor(sumcltj)/1000%></td>
		<td align="center"><%=sumdjzl%></td> -->
		</tr>
		<tr bgcolor="#FFFFFF" >
		<td colspan="7" align="left"><b> �ջ���ַ��<%=dz%>&nbsp;&nbsp;<%=fhshr%>&nbsp;&nbsp;�绰��<%=shrsj%></b></td>
		</tr>
		
		<%
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

</table>
</body>
</html>

&nbsp;<br>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<table width="100%" border="0">
<!--   <tr>
    <td width="33%"><font ><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font ><b>��&nbsp;&nbsp;�ܣ�</b></font></td>
    <td width="33%"><font ><b>�ջ�Ա��</b></font></td>
  </tr> -->
  <tr>
    <td width="33%"><font ><b>�Ʊ��ˣ�<%=yhmc%></b></font></td>
    <td width="33%"><font ><b>�µ��ˣ�<%=xdr%></b></font></td>
    <td width="33%"><font ><b>�µ����ڣ�<%=xdrq%></b></font></td>
  </tr>
  <tr>
    <td width="33%"><font ><b>�����ˣ�&nbsp;&nbsp;&nbsp;</b></font></td>
    <td width="33%"><font ><b>&nbsp;</b></font></td>
    <td width="33%"><font ><b>&nbsp;</b></font></td>
  </tr>
  <tr>
    <td colspan="2"><font ><b><!-- ��ע�� --></b></font></td>
	<td colspan="2" align="right"><font >��ӡ���ڣ�<%=cf.today("YYYY-MM-DD")%></font></td>
  </tr>
</table>