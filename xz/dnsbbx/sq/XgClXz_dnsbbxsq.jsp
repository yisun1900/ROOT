<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String dwbh=null;
String gdzcmc=null;
String bgr=null;
String gsbh=null;
String bmbh=null;
String gdzcflmc=null;
String xh=null;
String pp=null;
String pz1=null;
String pz2=null;
String pz3=null;
String pz4=null;
String pz5=null;
String pz6=null;

String dnsbflmc=null;
String dnsbgzmc=null;
String sqr=null;
String bxrq=null;
String jhlqrq=null;
String sfyzysj=null;
String gzxxsm=null;
String lrr=null;

String jdjg=null;
String clqk=null;
String wxr=null;
String wxlrsj=null;
String wcsj=null;
String wxfy=null;
String clzt=null;
String wxbm=null;

String wherebxxh=cf.GB2Uni(request.getParameter("bxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,dwbh,gdzcmc,bgr,gsbh,bmbh,gdzcflmc,xh,pp,pz1,pz2,pz3,pz4,pz5,pz6 ,dnsbflmc,dnsbgzmc,sqr,bxrq,jhlqrq,DECODE(sfyzysj,'N','��','Y','��') as sfyzysj,gzxxsm,lrr ";
	ls_sql+=" ,jdjg,clqk,wxr,wxlrsj,wcsj,wxfy,clzt,wxbm ";
	ls_sql+=" from  xz_dnsbbxsq";
	ls_sql+=" where  (bxxh="+wherebxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		gdzcmc=cf.fillNull(rs.getString("gdzcmc"));
		bgr=cf.fillNull(rs.getString("bgr"));
		gsbh=cf.fillNull(rs.getString("gsbh"));
		bmbh=cf.fillNull(rs.getString("bmbh"));
		gdzcflmc=cf.fillNull(rs.getString("gdzcflmc"));
		xh=cf.fillNull(rs.getString("xh"));
		pp=cf.fillNull(rs.getString("pp"));
		pz1=cf.fillNull(rs.getString("pz1"));
		pz2=cf.fillNull(rs.getString("pz2"));
		pz3=cf.fillNull(rs.getString("pz3"));
		pz4=cf.fillNull(rs.getString("pz4"));
		pz5=cf.fillNull(rs.getString("pz5"));
		pz6=cf.fillNull(rs.getString("pz6"));

		dnsbflmc=cf.fillNull(rs.getString("dnsbflmc"));
		dnsbgzmc=cf.fillNull(rs.getString("dnsbgzmc"));
		sqr=cf.fillNull(rs.getString("sqr"));
		bxrq=cf.fillNull(rs.getDate("bxrq"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		sfyzysj=cf.fillNull(rs.getString("sfyzysj"));
		gzxxsm=cf.fillNull(rs.getString("gzxxsm"));
		lrr=cf.fillNull(rs.getString("lrr"));

		jdjg=cf.fillNull(rs.getString("jdjg"));
		clqk=cf.fillNull(rs.getString("clqk"));
		wxr=cf.fillNull(rs.getString("wxr"));
		wxlrsj=cf.fillNull(rs.getDate("wxlrsj"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		wxfy=cf.fillNull(rs.getString("wxfy"));
		clzt=cf.fillNull(rs.getString("clzt"));
		wxbm=cf.fillNull(rs.getString("wxbm"));
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
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgClXz_dnsbbxsq.jsp" name="editform">
<div align="center">�޸Ĵ������Լ��豸�������루������ţ�<%=wherebxxh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td width="20%" align="right"><span class="STYLE1">�̶��ʲ����</span></td>
    <td width="30%"><%=gsbh%></td>
    <td width="20%" align="right"><span class="STYLE1">�����ڱ��</span></td>
    <td width="30%"><%=bmbh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�̶��ʲ�����</span></td>
    <td><%=gdzcmc%></td>
    <td align="right"><span class="STYLE1">�̶��ʲ�����</span></td>
    <td><%=gdzcflmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�ͺ�</span></td>
    <td><%=xh%></td>
    <td align="right"><span class="STYLE1">Ʒ��</span></td>
    <td><%=pp%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����(CPU)</span></td>
    <td><%=pz1%></td>
    <td align="right"><span class="STYLE1">����(�ڴ�)</span></td>
    <td><%=pz2%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����(Ӳ��)</span></td>
    <td><%=pz3%></td>
    <td align="right"><span class="STYLE1">����(����)</span></td>
    <td><%=pz4%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����(�Կ�)</span></td>
    <td><%=pz5%></td>
    <td align="right"><span class="STYLE1">����(��ʾ��)</span></td>
    <td><%=pz6%></td>
  </tr>
</table>
<P>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1 STYLE1">���޷ֹ�˾</span></td>
  <td width="30%">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,false);
%>
  </td>
  <td align="right"><span class="STYLE1">���޲���</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">����������</span></td>
  <td><%=sqr%></td>
  <td align="right"><span class="STYLE3">�豸���Ƿ�����Ҫ����</span></td>
  <td><%=sfyzysj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1 STYLE1">�豸������</span></td>
  <td><%=bgr%></td>
  <td align="right" width="20%"><span class="STYLE1">���Լ��豸����</span></td> 
  <td width="30%"><%=dnsbflmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">���Լ��豸���Ϸ���</span></td>
  <td><%=dnsbgzmc%></td>
  <td align="right"><span class="STYLE1">ϣ���������</span></td>
  <td><%=jhlqrq%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1 STYLE1">��������</span></td>
  <td><%=bxrq%></td>
  <td align="right"><span class="STYLE1">¼����</span></td>
  <td><%=lrr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1">������ϸ˵��</span></td> 
  <td colspan="3"><%=gzxxsm%></td>
  </tr>
  </table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><span class="STYLE4">*</span>ά�޲���</span></td>
    <td><select name="wxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+wxbm+"'",wxbm);
%>
    </select></td>
    <td align="right"><span class="STYLE1"><span class="STYLE4">*</span>ά����</span></td>
    <td><input type="text" name="wxr" size="20" maxlength="20"  value="<%=wxr%>" readonly></td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE4">*</span>��Ͻ��</td> 
  <td colspan="3"> 
    <textarea name="jdjg" cols="73" rows="3"><%=jdjg%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">*</span>�������</td>
  <td colspan="3"><textarea name="clqk" cols="73" rows="3"><%=clqk%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">*</span>����״̬</td>
  <td><%
	cf.radioToken(out, "clzt","3+ά����&4+�ɹ���&5+������&6+���",clzt);
%>  </td>
  <td align="right"><span class="STYLE1"><span class="STYLE4">*</span>ά��¼��ʱ��</span></td>
  <td><input type="text" name="wxlrsj" size="20" maxlength="10"  value="<%=wxlrsj%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">ά�����ʱ��</td> 
  <td width="30%"><input type="text" name="wcsj" size="20" maxlength="10"  value="<%=wcsj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">ά�޷���</td> 
  <td width="30%"> 
    <input type="text" name="wxfy" size="20" maxlength="17"  value="<%=wxfy%>" >  </td>
</tr>
<input type="hidden" name="wherebxxh"  value="<%=wherebxxh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wxbm)=="") {
		alert("������[ά�޲���]��");
		FormName.wxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wxr)=="") {
		alert("������[ά����]��");
		FormName.wxr.focus();
		return false;
	}
	if(	javaTrim(FormName.wxlrsj)=="") {
		alert("������[ά��¼��ʱ��]��");
		FormName.wxlrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wxlrsj, "ά��¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jdjg)=="") {
		alert("������[��Ͻ��]��");
		FormName.jdjg.focus();
		return false;
	}
	if(	javaTrim(FormName.clqk)=="") {
		alert("������[�������]��");
		FormName.clqk.focus();
		return false;
	}
	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[����״̬]��");
		FormName.clzt[0].focus();
		return false;
	}

	if (FormName.clzt[3].checked)
	{
		if(	javaTrim(FormName.wcsj)=="") {
			alert("������[ά�����ʱ��]��");
			FormName.wcsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.wcsj, "ά�����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.wcsj.value="";
	}

	if(	javaTrim(FormName.wxfy)=="") {
		alert("������[ά�޷���]��");
		FormName.wxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.wxfy, "ά�޷���"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
