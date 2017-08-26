<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String whereclbm=cf.GB2Uni(request.getParameter("clbm"));
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
double lrbfb=0;
String bz=null;
double fgsdj=0;
String jldwmc=null;
String cldlmc=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT cl_clbm.clbm,clmc,clgg,fgsdj,jldwmc,DECODE(lrjsfs,'1','��۷�ʽ','2','�ٷֱȷ�ʽ') lrjsfs,lrjsfs lrjsfs2,lrbfb,bz,cl_clbm.cldlmc  ";
	ls_sql+=" FROM cl_clbm,cl_jgmx ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm and cl_clbm.clbm='"+whereclbm+"' and cl_jgmx.dwbh='"+dwbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrjsfs2=cf.fillNull(rs.getString("lrjsfs2"));
		lrbfb=rs.getDouble("lrbfb");
		bz=cf.fillNull(rs.getString("bz"));
		fgsdj=rs.getDouble("fgsdj");
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> ������ϸ(<%=rkph%>)</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">���ϱ���</div>
    </td>
    <td width="32%"> <%=clbm%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">��������</div>
    </td>
    <td width="33%"><%=clmc%>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">���ϴ���</div>
    </td>
    <td width="32%"> <%=cldlmc%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">���Ϲ��</div>
    </td>
    <td width="33%"><%=clgg%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">�ֹ�˾���ϵ���</div>
    </td>
    <td width="32%"><%=fgsdj%>&nbsp;</td>
    <td width="17%"> 
      <div align="right">������λ</div>
    </td>
    <td width="33%"><%=jldwmc%> &nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right">��ע</div>
    </td>
    <td colspan="3"><%=bz%>&nbsp; </td>
  </tr>
</table>
<div align="center">
		<form method="post" action="ServerCl_clbmmx.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right"><font color="red">��ⵥ��</font></td>
        <td width="32%" > 
          <input type="text" name="rkdj" value="<%=fgsdj%>" size="20" maxlength="20"  onKeyUp="dj(insertform);" >
        <td width="17%" align="right">������λ</td>
        <td width="33%" > 
          <input type="text" name="jldwmc" value="<%=jldwmc%>" size="20" maxlength="50"  readonly>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%"> 
          <div align="right"><font color="red">�������</font></div>
        </td>
        <td width="32%" > 
          <input type="text" name="rksl" value="" size="20" maxlength="20"  onKeyup="sl(insertform);" >
        <td width="17%"> 
          <div align="right"><font color="red">�����</font></div>
        </td>
        <td width="33%" > 
          <input type="text" name="rkje" value="" size="20" maxlength="20" >
        </td>
      </tr>
      <tr align="center"> 
        <td colspan="4"> 
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����" name="reset">
          <input type="hidden" name="rkph" value="<%=rkph%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="clmc" value="<%=clmc%>"  >
          <input type="hidden" name="clgg" value="<%=clgg%>"  >
          <input type="hidden" name="lrjsfs" value="<%=lrjsfs2%>"  >
          <input type="hidden" name="lrbfb" value="<%=lrbfb%>"  >
          <input type="hidden" name="cldlmc" value="<%=cldlmc%>"  >
        </td>
      </tr>
    </table>
		</form>
	</div>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function sl(FormName)
{	
	if (FormName.rkdj.value!="")
	{
    FormName.rkje.value=formatDouble(FormName.rksl.value*FormName.rkdj.value,2);
	if (!(isFloat(FormName.rkje,""))){
		FormName.rkje.value="";
		FormName.rksl.value="";
		FormName.rksl.focus();
		return      
	   } 
	}       
}
function dj(FormName)
{	
	if (FormName.rksl.value!="")
	{
    FormName.rkje.value=formatDouble(FormName.rksl.value*FormName.rkdj.value,2);
	if (!(isFloat(FormName.rkje,""))){
		FormName.rkje.value="";
		FormName.rkdj.value="";
		FormName.rkdj.focus();
		return      
	   } 
	}       
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jldwmc)=="") {
		alert("������[������λ]��");
		FormName.jldwmc.focus();
		return false;
	}

	if(	javaTrim(FormName.rksl)=="") {
		alert("������[�������]��");
		FormName.rksl.focus();
		return false;
	}
	if (!(isFloat(FormName.rksl,"�������"))){
		FormName.rksl.focus();     
		return      
	   }
		if(	javaTrim(FormName.rkdj)=="") {
		alert("������[��ⵥ��]��");
		FormName.rkdj.focus();
		return false;
	}
	if (!(isFloat(FormName.rkdj,"��ⵥ��"))){
		FormName.rkdj.focus();     
		return      
	   }
		if(	javaTrim(FormName.rkje)=="") {
		alert("������[�����]��");
		FormName.rkje.focus();
		return false;
	}
	if (!(isFloat(FormName.rkje,"�����"))){
		FormName.rkje.focus();     
		return      
	   }
	lrsl=FormName.rksl.value-0;
	rdj=FormName.rkdj.value-0;
	rje=FormName.rkje.value-0;
	if (lrsl<=0)
	{
		alert("�������������������㣡����");
		FormName.rksl.focus();
		return false;
	}
	if (rdj<=0)
	{
		alert("����ⵥ�ۡ���������㣡����");
		FormName.rkdj.focus();
		return false;
	}
	if (rje<=0)
	{
		alert("��������������㣡����");
		FormName.rksl.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>