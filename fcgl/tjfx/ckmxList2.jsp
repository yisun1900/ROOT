<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String whereclbm=null;
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrjsfs2=null;
String lrbfb=null;
String bz=null;
String jldwmc=null;
String cldlmc=null;
double cldj=0;
double fgsdj=0;
double qybfb=0;
double khqye=0;
double txje=0;
double sumrk=0;
double sumck=0;
double kcsl=0;
try {
	conn=cf.getConnection();
/***************************************************************\
|		��ѯ���													|
\***************************************************************/
	ls_sql="select nvl(sum(rksl),0) ";
	ls_sql+=" from cl_rkmx,cl_rkd ";
	ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph ";
//	ls_sql+=" and cl_rkd.dwbh='"+ssfgs+"'  ";
	ls_sql+=" and rkzt='2' and clbm='"+whereclbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
		{
			sumrk=rs.getDouble(1);
		}
	rs.close();
	ps.close();

	ls_sql="select nvl(sum(shsl),0)  ";
	ls_sql+=" from cl_ckmx,cl_ckd  ";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
//	ls_sql+=" and cl_ckd.dwbh='"+ssfgs+"' ";
	ls_sql+=" and ckzt='3'  ";
	ls_sql+=" and cl_ckmx.clbm='"+whereclbm+"' and cl_ckmx.leixing='1' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
		{
			sumck=rs.getDouble(1);
		}
	rs.close();
	ps.close();
	kcsl=sumrk-sumck;
/***************************************************************\
|		��ѯ���Ļ�����Ϣ											|
\***************************************************************/
	ls_sql="SELECT cl_clbm.clbm clbm,clmc,clgg,cldj,jldwmc,qybfb,DECODE(lrjsfs,'1','��۷�ʽ','2','�ٷֱȷ�ʽ') lrjsfs,lrjsfs lrjsfs2,lrbfb,bz,cldlmc ";
	ls_sql+=" FROM cl_clbm,jdm_jldwbm,cl_cldlbm "; 
    ls_sql+=" where cl_clbm.jldwbm=jdm_jldwbm.jldwbm(+)  ";
//	ls_sql+=" and cl_clbm.clbm=cl_jgmx.clbm   ";
	ls_sql+=" and  cl_clbm.cldlbm=cl_cldlbm.cldlbm(+)  ";
	ls_sql+=" and (cl_clbm.clbm='"+whereclbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrjsfs2=cf.fillNull(rs.getString("lrjsfs2"));
		lrbfb=cf.fillNull(rs.getString("lrbfb"));
		bz=cf.fillNull(rs.getString("bz"));
		cldj=rs.getDouble("cldj");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		qybfb=rs.getDouble("qybfb");
	}
	rs.close();
	ps.close();
%>
<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> ������ϸ����<%=clmc%>�� <font color="blue">�������<%=kcsl%>&nbsp;<%=jldwmc%>��</font></div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">���ϱ���</div></td>
	  <td width="35%"> <%=clbm%>&nbsp;</td>
	  <td width="15%"> <div align="right">��������</div></td>
	  <td width="35%"><%=clmc%>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">���ϴ���</div></td>
	  <td width="35%"> <%=cldlmc%>&nbsp;</td>
	  <td width="15%"> <div align="right">���Ϲ��&nbsp;</div></td>
	  <td width="35%"><%=clgg%>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">����</div></td>
	  <td width="35%"><%=cldj%>&nbsp;Ԫ</td>
	  <td width="15%"> <div align="right">&nbsp;</div></td>
	  <td width="35%"> &nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">������λ</div></td>
	  <td width="35%"><%=jldwmc%>&nbsp;</td>
	  <td width="15%"> <div align="right">ǩԼ�ٷֱ�</div></td>
	  <td width="35%"> <%=qybfb%>%&nbsp;</td>
	</tr>
	 <tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">������㷽ʽ</div></td>
	  <td width="35%"> <%=lrjsfs%>&nbsp;</td>
	  <td width="15%"> <div align="right">����ٷֱ�</div></td>
	  <td width="35%"> <%=lrbfb%>%&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="15%"> <div align="right">��ע</div></td>
	  <td colspan="3"><%=bz%> </td>
	</tr>
</table>
&nbsp;<br><center><DIV><font color="blue" size="=2"><b>���ϳ�����ϸ</b></font></DIV></center>&nbsp;<br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#cccccc" align="center" >
	<td width="5%">���</td>
	  <td width="12%">��������</td>
	  <td width="12%">���ⵥλ</td>
	  <td width="10%">�ͻ����</td>
	  <td width="5%">��������</td>
	  <td width="8%">������</td>
	  <td width="12%">�ͻ�����</td>
	  <td width="6%">�Ƿ����</td>
	  <td width="20%">����ԭ��</td>
	</tr>
<%
/*******************************************************************\
|		���ĳ�����ϸ													|
\*******************************************************************/
String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
String mxckph=null;
String mxkhbh=null;
double mxshsl=0;
double mxshje=0;
String mxshqrsj=null;
String mxsfjm=null;
String mxjmyy=null;
String mxdwmc=null;
double summxshsl=0;
double summxshje=0;
	ls_sql="select cl_ckmx.ckph ckph,khbh,shsl,to_char(shqrsj,'YYYY-MM-DD') shqrsj,shje,DECODE(sfjm,'0','����','1','<font color=blue>����</font>','2','<font color=red>����</font>') sfjm,jmyy ,dwmc";
	ls_sql+=" from cl_ckmx,cl_ckd,sq_dwxx  ";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckd.dwbh=sq_dwxx.dwbh(+) ";
//	ls_sql+=" and cl_ckd.dwbh='"+ssfgs+"'  ";
	ls_sql+=" and ckzt='3' and clbm='"+whereclbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
		{ 
		i+=1;
		mxckph=cf.fillNull(rs.getString("ckph"));
		mxkhbh=cf.fillNull(rs.getString("khbh"));
		mxshsl=rs.getDouble("shsl");
		mxshje=rs.getDouble("shje");
		mxshqrsj=cf.fillNull(rs.getString("shqrsj"));
		mxsfjm=cf.fillNull(rs.getString("sfjm"));
		mxjmyy=cf.fillNull(rs.getString("jmyy"));
		mxdwmc=cf.fillNull(rs.getString("dwmc"));
		summxshsl+=mxshsl;
		summxshje+=mxshje;
			%>
			<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center"><%=i%></div>
		</td>
		<td> 
			<div align="center"><%=mxckph%></div>
		</td>
		<td> 
			<div align="center"><%=mxdwmc%></div>
		</td>
		<td> 
			<div align="center"><a href="/khxx/ViewCrm_khxx.jsp?khbh=<%=mxkhbh%>" target="_back"><%=mxkhbh%></a></div>
		</td>
		<td> 
			<div align="center"><%=mxshsl%></div>
		</td>
		<td> 
			<div align="center"><%=mxshje%></div>
		</td>
		<td> 
			<div align="center"><%=mxshqrsj%></div>
		</td>
		<td> 
			<div align="center"><%=mxsfjm%></div>
		</td>
		<td> 
			<div align="center"><%=mxjmyy%></div>
		</td>
		</tr>
			<%
		}
			%>
			<tr bgcolor="#CCCCCC">
		<td> 
			<div align="center">�ϼ�</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=summxshsl%></div>
		</td>
		<td> 
			<div align="center"><%=summxshje%></div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		<td> 
			<div align="center">&nbsp;</div>
		</td>
		</tr>
			<%
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print(ls_sql+"<br>");
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
</table>