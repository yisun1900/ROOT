<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String jldw=null;
String sjcj=null;

String sjsfycx=null;
String cxsjcj=null;
String cxkssj=null;
String cxjssj=null;

String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherebjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String wherebjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,bjjbbm,bjjbbm1,tccplbbm,jldw,sjcj,sjsfycx,cxkssj,cxjssj,cxsjcj ";
	ls_sql+=" from  tckd_tcsjcjb";
	ls_sql+=" where  (dqbm='"+wheredqbm+"') and  (bjjbbm='"+wherebjjbbm+"') and  (bjjbbm1='"+wherebjjbbm1+"') and  (tccplbbm='"+wheretccplbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbbm1=cf.fillNull(rs.getString("bjjbbm1"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sjcj=cf.fillNull(rs.getString("sjcj"));

		sjsfycx=cf.fillNull(rs.getString("sjsfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxsjcj=cf.fillNull(rs.getString("cxsjcj"));
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
<form method="post" action="SaveEditTckd_tcsjcjb.jsp" name="editform" target="_blank">
<div align="center">�ײ�������۱�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">


<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
%>
    </select></td>
  <td align="right"><font color="#FF0000">*</font>��Ʒ���</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc",tccplbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>ԭ���ۼ���</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm  order by bjjbbm",bjjbbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>�������ۼ���</td>
  <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm  order by bjjbbm",bjjbbm1);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>������λ</td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldw);
%>
  </select></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�������</td> 
  <td width="32%"><input type="text" name="sjcj" size="20" maxlength="17"  value="<%=sjcj%>" ></td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right"><font color="#FF0000">*</font>�����Ƿ��д���</td>
  <td colspan="3"><%
	cf.radioToken(out, "sjsfycx","1+�޴���&2+���������ƴ���&3+���������ƴ���",sjsfycx);
%></td>
  </tr>
<tr bgcolor="#E8E8FF">
  <td align="right">������ʼʱ��</td>
  <td><input type="text" name="cxkssj" value="<%=cxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">��������ʱ��</td>
  <td><input type="text" name="cxjssj" value="<%=cxjssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right">�����������</td>
  <td><input type="text" name="cxsjcj" value="<%=cxsjcj%>" size="20" maxlength="9" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
	<input type="hidden" name="wherebjjbbm"  value="<%=wherebjjbbm%>" >
	<input type="hidden" name="wherebjjbbm1"  value="<%=wherebjjbbm1%>" >
	<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="button" onClick="f_lr(editform)"  value="ά��Ʒ���������">
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[ԭ���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("��ѡ��[�������ۼ���]��");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("������[�������]��");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "�������"))) {
		return false;
	}

	if(	!radioChecked(FormName.sjsfycx)) {
		alert("��ѡ��[�����Ƿ��д���]��");
		FormName.sjsfycx[0].focus();
		return false;
	}

	if (FormName.sjsfycx[1].checked || FormName.sjsfycx[2].checked)
	{
		if(	javaTrim(FormName.cxsjcj)=="") {
			alert("������[�����������]��");
			FormName.cxsjcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxsjcj, "�����������"))) {
			return false;
		}

		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjssj.select();
			return false;
		}
	}
	else{
		FormName.cxsjcj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
	}

	FormName.action="SaveEditTckd_tcsjcjb.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[ԭ���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("��ѡ��[�������ۼ���]��");
		FormName.bjjbbm1.focus();
		return false;
	}

	FormName.action="InsertTckd_tcppsjcjb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
