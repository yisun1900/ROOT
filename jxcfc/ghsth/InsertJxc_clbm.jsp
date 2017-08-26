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
double xsj=0;
double zxqdl=0;
String cldlbm=null; 
String clxlbm=null;

String ppmc=null;
String gysmc=null;

double zcpzsl=0;
double ccpzsl=0;
double bfpzsl=0;
double dhsl=0;
double ycgsl=0;

String xssl="";
double xsje=0;

String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");
String xsph=request.getParameter("xsph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select nbbm,clmc,xh,gg,DECODE(xsfs,'1','����Ʒ','2','�ֻ�����','3','�ڻ�����','4','�������') xsfsmc,xsfs,jldwbm,dgzjg,xsj,zxqdl,cldlbm,clxlbm,ppmc,jxc_cljgb.gysmc,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
	ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dgzjg=rs.getDouble("dgzjg");
		xsj=rs.getDouble("xsj");
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
	ls_sql=" select xssl,xsje ";
	ls_sql+=" from jxc_fcxsmx ";
	ls_sql+=" where clbm='"+clbm+"'  and xsph='"+xsph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		xssl=cf.fillNull(rs.getString("xssl"));
		xsje=rs.getDouble("xsje");
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
<title>���Ĺ������˻�����¼������</title>
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
<div align="center">���Ĺ������˻��������ϵ��ţ�<%=xsph%>��</div>
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

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>��桢��������</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">����Ʒ�����</td>
  <td width="32%" bgcolor="#FFFFFF"><%=zcpzsl%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">�д�Ʒ�����</td>
  <td width="32%" bgcolor="#FFFFFF"><%=ccpzsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">����Ʒ�����</td>
  <td width="32%" bgcolor="#FFFFFF"><%=bfpzsl%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><strong>�ɶ�����</strong></td>
  <td width="32%" bgcolor="#FFFFFF"><%=cf.formatDouble(zcpzsl-dhsl)%></td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right" bgcolor="#FFFFFF">��������</td>
    <td width="32%" bgcolor="#FFFFFF"><%=dhsl%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF">�Ѳɹ�����</td>
    <td width="32%" bgcolor="#FFFFFF"><%=ycgsl%></td>
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
        <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
        <td bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
	
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">�Թ����۸�</span></td>
        <td bgcolor="#FFFFFF" > <%=dgzjg%>  </td>   
        <td align="right"><span class="STYLE4">*</span><span class="STYLE3">���ۼ�</span></td>
        <td bgcolor="#FFFFFF" >
			<input type="text" name="xsj" value="<%=dgzjg%>" size="20" maxlength="20" readonly>
		</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">���۷�ʽ</span></td>
        <td bgcolor="#FFFFFF" ><%=xsfsmc%>      
        <td align="right"><span class="STYLE3">��С����</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="zxqdl" value="<%=zxqdl%>" size="20" maxlength="50"  readonly></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>����</td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="xssl" value="<%=xssl%>" size="20" maxlength="20"  onchange="jsjg(insertform);" >
        <td width="18%" align="right"><span class="STYLE4">*</span><span class="STYLE3">���۽��</span></td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="xsje" value="<%=xsje%>" size="20" maxlength="20" readonly></td>
      </tr>
      
      <tr align="center"> 
        <td colspan="4">
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����" name="reset">
          <input type="hidden" name="xsfs" value="<%=xsfs%>"  >
          <input type="hidden" name="xsph" value="<%=xsph%>"  >
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
	var xsje=0;
	xsje=FormName.xssl.value*1.0*FormName.xsj.value;
	xsje=round(xsje,2);
	FormName.xsje.value=xsje;
}

function f_do(FormName)//����FormName:Form������
{
	jsjg(FormName);

	if(	javaTrim(FormName.xsj)=="") {
		alert("������[���ۼ�]��");
		FormName.xsj.focus();
		return false;
	}
	if(!(isFloat(FormName.xsj, "���ۼ�"))) {
		return false;
	}

	if(	javaTrim(FormName.xssl)=="") {
		alert("������[����]��");
		FormName.xssl.select();
		return false;
	}
	if(!(isFloat(FormName.xssl, "����"))) {
		return false;
	}

	if (parseFloat(FormName.xssl.value)<=0)
	{
		alert("����������������㣡����");
		FormName.xssl.select();
		return false;
	}
	if (parseFloat(FormName.xssl.value) < parseFloat(FormName.zxqdl.value))
	{
		alert("��������������ڡ���С����"+FormName.zxqdl.value+"��������");
		FormName.xssl.select();
		return false;
	}

	if ("<%=xsfs%>"=="2")//1������Ʒ��2���ֻ����ۣ�3���ڻ�����
	{
		if (parseFloat(FormName.xssl.value) > <%=zcpzsl%>)
		{
			alert("�����ֻ����ۣ������������ܴ��ڡ�����Ʒ����� <%=zcpzsl%>��");
			FormName.xssl.select();
			return false;
		}
	}



	if(	javaTrim(FormName.xsje)=="") {
		alert("������[���۽��]��");
		FormName.xsje.focus();
		return false;
	}
	if(!(isFloat(FormName.xsje, "���۽��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>