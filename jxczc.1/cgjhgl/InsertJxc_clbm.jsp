<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String xsfsmc=null;
String xsfs=null;
String jldwbm=null;
double dgzjg=0;
double zxqdl=0;
double bzgg=0;
String cldlbm=null; 
String clxlbm=null;

String ppmc=null;
String gysmc=null;

double zcpzsl=0;
double ccpzsl=0;
double bfpzsl=0;
double dhsl=0;
double ycgsl=0;

String jhcgsl="";
double jhcgdj=0;
double jhcgje=0;

String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");
String cgjhph=request.getParameter("cgjhph");

String ssfgs=null;
String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql=" select ssfgs";
    ls_sql+=" from jxc_clcgjh";
	ls_sql+=" where cgjhph='"+cgjhph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	ls_sql="select cbj,dfgsjg,nbbm,bzgg,clmc,xh,gg,DECODE(xsfs,'1','����Ʒ','2','�ֻ�����','3','�ڻ�����','4','�������') xsfsmc,xsfs,jldwbm,dgzjg,zxqdl,cldlbm,clxlbm,ppmc,jxc_cljgb.gysmc,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
	ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jhcgdj=rs.getDouble("cbj");
		nbbm=cf.fillNull(rs.getString("nbbm"));
		bzgg=rs.getDouble("bzgg");
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dgzjg=rs.getDouble("dgzjg");
		zxqdl=rs.getDouble("zxqdl");
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));

		zcpzsl=rs.getDouble("zcpzsl");
		ccpzsl=rs.getDouble("ccpzsl");
		bfpzsl=rs.getDouble("bfpzsl");
		dhsl=rs.getDouble("dhsl");
		ycgsl=rs.getDouble("ycgsl");
	}
	rs.close();
	ps.close();

	//����������ϸ:����	 
	ls_sql=" select jhcgsl,jhcgdj,jhcgje ";
	ls_sql+=" from jxc_cgjhmx ";
	ls_sql+=" where clbm='"+clbm+"'  and cgjhph='"+cgjhph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		jhcgsl=cf.fillNull(rs.getString("jhcgsl"));
		jhcgdj=rs.getDouble("jhcgdj");
		jhcgje=rs.getDouble("jhcgje");
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
<title>�ɹ��ƻ���¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
	color: #0000CC;
}
.STYLE3 {color: #0000CC}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">�ɹ��ƻ����ɹ��ƻ����ţ�<%=cgjhph%>��</div>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">���ϱ���</td>
  <td bgcolor="#FFFFFF"><%=clbm%></td>
  <td align="right" bgcolor="#FFFFFF">�ڲ�����</td>
  <td bgcolor="#FFFFFF"><%=nbbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">��������</td>
  <td bgcolor="#FFFFFF"><%=clmc%></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">�ͺ�</td>
  <td bgcolor="#FFFFFF"><%=xh%></td>
  <td align="right" bgcolor="#FFFFFF">���</td>
  <td bgcolor="#FFFFFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">��Ӧ��</td>
  <td bgcolor="#FFFFFF"><%=gysmc%></td>
  <td align="right" bgcolor="#FFFFFF">��Ʒ��</td>
  <td bgcolor="#FFFFFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">���ϴ���</td>
  <td width="32%" bgcolor="#FFFFFF"><%=cldlbm%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">����С��</td>
  <td width="32%" bgcolor="#FFFFFF"><%=clxlbm%></td>
</tr>
</table>
<BR>


		<form method="post" action="SaveInsertJxc_clbm.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="center" bgcolor="#CCFFCC"><span class="STYLE1">¼������</span></td>
      </tr>
 
	  
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">������λ</span></td>
        <td bgcolor="#FFFFFF"><%=jldwbm%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">���۷�ʽ</span></td>
        <td bgcolor="#FFFFFF"><%=xsfsmc%></td>
      </tr>
	
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">��С����</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="zxqdl" value="<%=zxqdl%>" size="20" maxlength="50"  readonly>
        <td align="right"><span class="STYLE3">��װ���</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="bzgg" value="<%=bzgg%>" size="20" maxlength="50"  readonly></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><span class="STYLE4">*</span>�ɹ�����</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="jhcgdj" value="<%=jhcgdj%>" size="20" maxlength="20" readonly>      
        <td align="right">&nbsp;</td>
        <td bgcolor="#FFFFFF" >&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>����</td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="jhcgsl" value="<%=jhcgsl%>" size="20" maxlength="20"  onchange="jsjg(insertform);" >
        <td width="18%" align="right"><span class="STYLE4">*</span><span class="STYLE3">���</span></td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="jhcgje" value="<%=jhcgje%>" size="20" maxlength="20" readonly></td>
      </tr>
      
      <tr align="center"> 
        <td colspan="4">
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����" name="reset">
          <input type="hidden" name="cgjhph" value="<%=cgjhph%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="dqbm" value="<%=dqbm%>"  >
		  <input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>" >	    </td>
      </tr>
    </table>
		</form>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function jsjg(FormName)
{	
	var jhcgje=0;
	jhcgje=FormName.jhcgsl.value*1.0*FormName.jhcgdj.value;
	jhcgje=round(jhcgje,2);
	FormName.jhcgje.value=jhcgje;
}

function f_do(FormName)//����FormName:Form������
{
	jsjg(FormName);

	if(	javaTrim(FormName.jhcgdj)=="") {
		alert("������[�ɹ�����]��");
		FormName.jhcgdj.focus();
		return false;
	}
	if(!(isFloat(FormName.jhcgdj, "�ɹ�����"))) {
		return false;
	}

	if(	javaTrim(FormName.jhcgsl)=="") {
		alert("������[����]��");
		FormName.jhcgsl.select();
		return false;
	}
	if(!(isFloat(FormName.jhcgsl, "����"))) {
		return false;
	}

	if (parseFloat(FormName.jhcgsl.value)<=0)
	{
		alert("����������������㣡����");
		FormName.jhcgsl.select();
		return false;
	}
	if (parseFloat(FormName.jhcgsl.value) < parseFloat(FormName.zxqdl.value))
	{
		alert("��������������ڡ���С����"+FormName.zxqdl.value+"��������");
		FormName.jhcgsl.select();
		return false;
	}
	if (parseFloat(FormName.jhcgsl.value) % parseFloat(FormName.bzgg.value) !=0)
	{
		alert("�������������ǡ���װ���"+FormName.bzgg.value+"����������������");
		FormName.jhcgsl.select();
		return false;
	}


	if(	javaTrim(FormName.jhcgje)=="") {
		alert("������[���]��");
		FormName.jhcgje.focus();
		return false;
	}
	if(!(isFloat(FormName.jhcgje, "���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>