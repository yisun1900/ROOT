<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;

int count=0;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.hth";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and (jc_cgdd.ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
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
<title>���񶩵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">����---ȡ��Ԥ������������ţ�<%=ddbh%>�� </div>

<%
if (count>0)
{
	%>
	<BR>
	<div align="center"><font color="#FF0033"><b>���󣡱�����δǩ��ͬ��ȷ���������������ԭ��</b></font> 
	</div>
	<%
	return;
}
%>

<form method="post" action="SaveQxYddJc_cgdd.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">�ͻ����</div>
      </td>
      <td width="31%"> <%=khbh%></td>
      <td width="17%"> 
        <div align="right">��ͬ��</div>
      </td>
      <td width="33%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="31%"> <%=khxm%> </td>
      <td width="17%"> 
        <div align="right"></div>
      </td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="19%" align="right">���ݵ�ַ</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>�۲�����</td>
      <td width="31%"> 
        <input type="text" name="kclf" value="" size="20" maxlength="16" >
      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>ȡ��Ԥ����ԭ��</td>
      <td width="33%"> 
        <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%"> 
        <div align="right"><font color="#FF0000">*</font><font color="#0000CC">�˵�������</font></div>
      </td>
      <td width="31%"> 
        <input type="text" name="tdblr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td width="17%"> 
        <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>�˵�ʱ��</div>
      </td>
      <td width="33%"> 
        <input type="text" name="tdsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>�˵�˵��</td>
      <td colspan="3"> 
        <textarea name="tdsm" rows="4" cols="72"></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button"  value="�˵�" onClick="f_do(selectform)">
          <input type="reset"  value="����" name="reset">
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
        </div>
      </td>
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
	if(	javaTrim(FormName.kclf)=="") {
		alert("��ѡ��[�۲�����]��");
		FormName.kclf.focus();
		return false;
	}
	if(!(isFloat(FormName.kclf, "�۲�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jctdyybm)=="") {
		alert("��ѡ��[�˵�ԭ��]��");
		FormName.jctdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdblr)=="") {
		alert("��ѡ��[�˵�������]��");
		FormName.tdblr.focus();
		return false;
	}
	if(	javaTrim(FormName.tdsj)=="") {
		alert("��ѡ��[�˵�ʱ��]��");
		FormName.tdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdsj, "�˵�ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdsm)=="") {
		alert("��ѡ��[�˵�˵��]��");
		FormName.tdsm.focus();
		return false;
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
