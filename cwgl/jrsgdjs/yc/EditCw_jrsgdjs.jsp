<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
String ysglk=null;
String rgfbfb=null;
String bcrgf=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsrq,ysglk,rgfbfb,bcrgf,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_jrbgf";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		ysglk=cf.fillNull(rs.getString("ysglk"));
		rgfbfb=cf.fillNull(rs.getString("rgfbfb"));
		bcrgf=cf.fillNull(rs.getString("bcrgf"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditCw_jrsgdjs.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����¼��</td> 
  <td width="32%"> 
    <input type="text" name="jsjlh" size="20" maxlength="9"  value="<%=jsjlh%>" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",sgd);
%>
    </select>  </td>
  <td align="right" width="18%">ʩ���೤</td> 
  <td width="32%"> 
    <input type="text" name="sgbz" size="20" maxlength="20"  value="<%=sgbz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jsrq" size="20" maxlength="10"  value="<%=jsrq%>" >  </td>
  <td align="right" width="18%">Ԥ�㹤�Ͽ�</td> 
  <td width="32%"> 
    <input type="text" name="ysglk" size="20" maxlength="17"  value="<%=ysglk%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�˹��Ѱٷֱ�</td> 
  <td width="32%"> 
    <input type="text" name="rgfbfb" size="20" maxlength="9"  value="<%=rgfbfb%>" >  </td>
  <td align="right" width="18%">����Ӧ���˹���</td> 
  <td width="32%"> 
    <input type="text" name="bcrgf" size="20" maxlength="17"  value="<%=bcrgf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >  </td>
  <td align="right" width="18%">¼��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼�벿��</td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
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
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.ysglk)=="") {
		alert("������[Ԥ�㹤�Ͽ�]��");
		FormName.ysglk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysglk, "Ԥ�㹤�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("������[�˹��Ѱٷֱ�]��");
		FormName.rgfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfbfb, "�˹��Ѱٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bcrgf)=="") {
		alert("������[����Ӧ���˹���]��");
		FormName.bcrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.bcrgf, "����Ӧ���˹���"))) {
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
