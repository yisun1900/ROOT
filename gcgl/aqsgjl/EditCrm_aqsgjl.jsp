<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=null;
String fssj=null;
String sgd=null;
String gsrs=null;
String gwrs=null;
String sgsm=null;
String lrr=null;
String lrsj=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherefssj=cf.GB2Uni(request.getParameter("fssj"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,fssj,sgd,gsrs,gwrs,sgsm,lrr,lrsj,lrbm ";
	ls_sql+=" from  crm_aqsgjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (fssj=TO_DATE('"+wherefssj+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		fssj=cf.fillNull(rs.getDate("fssj"));
		sgd=cf.fillNull(rs.getString("sgd"));
		gsrs=cf.fillNull(rs.getString("gsrs"));
		gwrs=cf.fillNull(rs.getString("gwrs"));
		sgsm=cf.fillNull(rs.getString("sgsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_aqsgjl.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >  </td>
  <td align="right" width="18%">����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="fssj" size="20" maxlength="10"  value="<%=fssj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="gsrs" size="20" maxlength="8"  value="<%=gsrs%>" ></td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="gwrs" size="20" maxlength="8"  value="<%=gwrs%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�¹�˵��</td>
  <td colspan="3"><textarea name="sgsm" cols="71" rows="3"><%=sgsm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>
  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
	<input type="hidden" name="wherefssj"  value="<%=wherefssj%>" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("������[����ʱ��]��");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.gsrs)=="") {
		alert("������[��������]��");
		FormName.gsrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gsrs, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gwrs)=="") {
		alert("������[��������]��");
		FormName.gwrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gwrs, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.sgsm)=="") {
		alert("������[�¹�˵��]��");
		FormName.sgsm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
