<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fkfabm=null;
String fkcs=null;
String lx=null;
String sfbhglf=null;
String sfbhsj=null;

String sfbhgcf=null;
String sfbhjrqtf=null;
String sfbhbjrqtf=null;
String sfbhsjf=null;
String sfbhzcf=null;
String sfsjfsesk=null;

String yfkbl=null;
String bqfkbl=null;
String wherefkfabm=cf.GB2Uni(request.getParameter("fkfabm"));
String wherefkcs=cf.GB2Uni(request.getParameter("fkcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fkfabm,fkcs,lx,sfbhglf,sfbhsj,yfkbl,bqfkbl,sfbhgcf,sfbhjrqtf,sfbhbjrqtf,sfbhsjf,sfbhzcf,sfsjfsesk ";
	ls_sql+=" from  cw_fkfamx";
	ls_sql+=" where  (fkfabm='"+wherefkfabm+"') and  (fkcs="+wherefkcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfabm=cf.fillNull(rs.getString("fkfabm"));
		fkcs=cf.fillNull(rs.getString("fkcs"));
		lx=cf.fillNull(rs.getString("lx"));
		sfbhglf=cf.fillNull(rs.getString("sfbhglf"));
		sfbhsj=cf.fillNull(rs.getString("sfbhsj"));
		yfkbl=cf.fillNull(rs.getString("yfkbl"));
		bqfkbl=cf.fillNull(rs.getString("bqfkbl"));
		sfbhgcf=cf.fillNull(rs.getString("sfbhgcf"));
		sfbhjrqtf=cf.fillNull(rs.getString("sfbhjrqtf"));
		sfbhbjrqtf=cf.fillNull(rs.getString("sfbhbjrqtf"));
		sfbhsjf=cf.fillNull(rs.getString("sfbhsjf"));
		sfbhzcf=cf.fillNull(rs.getString("sfbhzcf"));
		sfsjfsesk=cf.fillNull(rs.getString("sfsjfsesk"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_fkfamx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><span class="STYLE1">*</span>�����</td>
      <td width="29%"> 
        <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm",fkfabm);
%> 
      </select>      </td>
      <td align="right" width="21%"><span class="STYLE1">*</span>�տ�����</td>
      <td width="29%"> 
        <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs",fkcs);
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>�����տ���ʣ�%��</td>
      <td><input type="text" name="bqfkbl" size="20" maxlength="9"  value="<%=bqfkbl%>" >      </td>
      <td align="right"><span class="STYLE1">*</span>�ۼ��տ���ʣ�%��</td>
      <td><input type="text" name="yfkbl" size="20" maxlength="9"  value="<%=yfkbl%>" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%"><span class="STYLE1">*</span>�տʽ</td>
      <td colspan="3"> 
          <%
	cf.radioToken(out,"lx","1+����ǰ�տ�(����������)<BR>&2+����ǰ�տ��������һ����ȡ��<BR>&3+����ǰ�տ��������ִ���ȡ��<BR><BR>&6+���ۺ��տ�(����������)<BR>&7+���ۺ��տ��������һ����ȡ��<BR>&8+���ۺ��տ��������ִ���ȡ��<BR><BR>&A+��ǰ������<BR>&B+�ۺ�������<BR>",lx);
%>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>�Ƿ�ʵ�ʷ����ܶ��տ�</td>
      <td><%
	cf.radioToken(out, "sfsjfsesk","Y+��&N+����ȫ������",sfsjfsesk);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFFF"><span class="STYLE1"><strong>���������ȫ�����á�����ѡ������ѡ��</strong></span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ񺬹��̷�</td>
      <td><%
	cf.radioToken(out, "sfbhgcf","N+������&Y+����",sfbhgcf);
%></td>
      <td align="right">�Ƿ���Ʒ�</td>
      <td><%
	cf.radioToken(out, "sfbhsjf","N+������&Y+����",sfbhsjf);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ񺬼�ҵ��������</td>
      <td><%
	cf.radioToken(out, "sfbhjrqtf","N+������&Y+����",sfbhjrqtf);
%></td>
      <td align="right">�Ƿ񺬲���ҵ��������</td>
      <td><%
	cf.radioToken(out, "sfbhbjrqtf","N+������&Y+����",sfbhbjrqtf);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�տ��Ƿ���������</td>
      <td>
<%
	cf.radioToken(out, "sfbhglf","N+������&Y+����",sfbhglf);
%>	  </td>
      <td align="right">�տ��Ƿ����˰��</td>
      <td>
<%
	cf.radioToken(out, "sfbhsj","N+������&Y+����",sfbhsj);
%>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�Ƿ����ķ�</td>
      <td><%
	cf.radioToken(out, "sfbhzcf","N+������&Y+����",sfbhzcf);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <input type="hidden" name="wherefkfabm"  value="<%=wherefkfabm%>" >
    <input type="hidden" name="wherefkcs"  value="<%=wherefkcs%>" >
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("��ѡ��[�����]��");
		FormName.fkfabm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkcs)=="") {
		alert("��ѡ��[�տ�����]��");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "�տ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yfkbl)=="") {
		alert("������[�ۼ��տ���ʣ�%��]��");
		FormName.yfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yfkbl, "�ۼ��տ���ʣ�%��"))) {
		return false;
	}
	if(	javaTrim(FormName.bqfkbl)=="") {
		alert("������[�����տ���ʣ�%��]��");
		FormName.bqfkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bqfkbl, "�����տ���ʣ�%��"))) {
		return false;
	}

	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[�տ����]��");
		FormName.lx[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfsjfsesk)) {
		alert("��ѡ��[�Ƿ�ʵ�ʷ����ܶ��տ�]��");
		FormName.sfsjfsesk[0].focus();
		return false;
	}

	if (FormName.sfsjfsesk[1].checked)
	{
		if(	!radioChecked(FormName.sfbhgcf)) {
			alert("��ѡ��[�Ƿ񺬹��̷�]��");
			FormName.sfbhgcf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhjrqtf)) {
			alert("��ѡ��[�Ƿ񺬼�ҵ��������]��");
			FormName.sfbhjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhbjrqtf)) {
			alert("��ѡ��[�Ƿ񺬲���ҵ��������]��");
			FormName.sfbhbjrqtf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsjf)) {
			alert("��ѡ��[�Ƿ���Ʒ�]��");
			FormName.sfbhsjf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhglf)) {
			alert("��ѡ��[�տ��Ƿ���������]��");
			FormName.sfbhglf[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhsj)) {
			alert("��ѡ��[�տ��Ƿ����˰��]��");
			FormName.sfbhsj[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.sfbhzcf)) {
			alert("��ѡ��[�Ƿ����ķ�]��");
			FormName.sfbhzcf[0].focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
