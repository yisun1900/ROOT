<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>

<%
String whereckph=request.getParameter("ckph");


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������͵�(��������:<%=whereckph%>)</font></B> 
</CENTER>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
String wzclolr1="red";
String wzclolr2="blue";
String wzclolr3="black";
int i=0;
int row=0;
String clbm=null;
String clmc=null;
String clgg=null;
String gdj=null;
String cksl=null;
String ckje=null;
String cldlmc=null;
String jldwmc=null;
if (whereckph.equals(""))
{
	return;
}

String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String dh=null;
String cksj=null;
String psfs=null;
String jhshsj=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT hth,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh,cksj,DECODE(cl_psd.psfs,'1','����','2','����','9','����') psfs,jhshsj  ";
	ls_sql+=" FROM cl_ckd,crm_khxx,sq_sgd,cl_psd ";
	//ls_sql+=" where cl_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=cl_psd.khbh(+) and cl_ckd.ckph='"+whereckph+"' and cl_psd.psdh='"+psdh+"'";
	ls_sql+=" where cl_ckd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and cl_ckd.psdh=cl_psd.psdh and cl_ckd.ckph='"+whereckph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		dh=cf.fillHtml(rs.getString("dh"));
		cksj=cf.fillHtml(rs.getDate("cksj"));
		psfs=cf.fillHtml(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		
	}
	rs.close();
	ps.close();

%>

  
<table width="100%" border="0">
  <tr> 
    <td width="39%">�ͻ�������<%=khxm%></td>
    <td width="33%">�ͻ��绰��<%=lxfs%></td>
    <td width="28%">��ͬ�ţ�<%=hth%></td>
  </tr>
  <tr> 
    <td width="39%">���ݵ�ַ��<%=fwdz%></td>
	<td width="33%">���ͷ�ʽ��<%=psfs%></td>
    <td width="28%">�ƻ��ͻ�ʱ�䣺<%=jhshsj%></td>
  </tr>
  <tr> 
    <td width="39%">��Ŀ����<%=sgdmc%></td>
    <td width="33%">��Ŀ����绰��<%=dh%></td>
    <td width="28%">����ʱ�䣺<%=cksj%></td>
  </tr>
</table>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="12%">��������</td>
	<td  width="12%">���Ϲ��</td>
	<td  width="12%">���ϴ���</td>
	<td  width="8%">������λ</td>
	<td  width="8%">��������</td>
	<td  width="12%">��ע</td>
</tr>
<%
	ls_sql="SELECT cl_ckmx.clbm clbm,ckph,cl_ckmx.clmc,cl_ckmx.clgg,cl_ckmx.gdj,cksl,ckje,cldlmc,jldwmc  ";
	ls_sql+=" FROM cl_ckmx ";
	ls_sql+=" where ckph='"+whereckph+"' " ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	while (rs.next())
	{
		i++;
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		gdj=cf.fillNull(rs.getString("gdj"));
		cksl=cf.fillNull(rs.getString("cksl"));
		ckje=cf.fillNull(rs.getString("ckje"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center"><%=i%>&nbsp;
			<input type="hidden" name="clbm" value="<%=clbm%>">
			</div>
		</td>
		<td> 
			<div align="center"><%=clmc%>&nbsp;<input type="hidden" name="clmc" value="<%=clmc%>"></div>
		</td>
		<td> 
			<div align="center"><%=clgg%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=cldlmc%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=jldwmc%>&nbsp;</div>
		</td>
		<td> <div align="center"><%=cksl%>&nbsp;</div></td>
		<td>&nbsp;</td>
		</tr>
<%
	row++;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
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

