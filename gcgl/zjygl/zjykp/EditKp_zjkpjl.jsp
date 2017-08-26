<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=null;
String qssj=null;
String jzsj=null;
String lrr=null;
String lrsj=null;
String bz=null;
String kpfgs=null;
String wherekpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpjlh,qssj,jzsj,lrr,lrsj,bz,kpfgs ";
	ls_sql+=" from  kp_zjkpjl";
	ls_sql+=" where  (kpjlh="+wherekpjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		qssj=cf.fillNull(rs.getDate("qssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		kpfgs=cf.fillNull(rs.getString("kpfgs"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_zjkpjl.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������¼��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kpjlh" size="20" maxlength="8"  value="<%=kpjlh%>" >
  </td>
  <td width="15%"> 
    <div align="right">������ʼʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qssj" size="20" maxlength="10"  value="<%=qssj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������ֹʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jzsj" size="20" maxlength="10"  value="<%=jzsj%>" >
  </td>
  <td width="15%"> 
    <div align="right">¼����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">¼��ʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
  <td width="15%"> 
    <div align="right">��ע</div>
  </td>
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"><%=bz%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�����ֹ�˾</div>
  </td>
  <td width="35%"> 
    <select name="kpfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh",kpfgs);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherekpjlh"  value="<%=wherekpjlh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("������[������¼��]��");
		FormName.kpjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.kpjlh, "������¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.qssj)=="") {
		alert("������[������ʼʱ��]��");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("������[������ֹʱ��]��");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "������ֹʱ��"))) {
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
	if(	javaTrim(FormName.kpfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.kpfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
