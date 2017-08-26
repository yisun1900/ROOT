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
String wherebxxh=cf.GB2Uni(request.getParameter("bxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,dwbh,gdzcmc,bgr,gsbh,bmbh,gdzcflmc,xh,pp,pz1,pz2,pz3,pz4,pz5,pz6 ,dnsbflmc,dnsbgzmc,sqr,bxrq,jhlqrq,sfyzysj,gzxxsm,lrr ";
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
.STYLE1 {color: #0000CC}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXz_dnsbbxsq.jsp" name="editform">
<div align="center">�޸ģ����Լ��豸�������루������ţ�<%=wherebxxh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="20%" align="right"><span class="STYLE1">���޷ֹ�˾</span></td>
    <td width="30%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%>
    </select></td>
    <td width="20%" align="right">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�̶��ʲ����</span></td>
    <td><input type="text" name="gsbh" value="<%=gsbh%>" size="20" maxlength="20" readonly></td>
    <td align="right"><span class="STYLE1">�����ڱ��</span></td>
    <td><input type="text" name="bmbh" value="<%=bmbh%>" size="20" maxlength="20" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�̶��ʲ�����</span></td>
    <td><input type="text" name="gdzcmc" value="<%=gdzcmc%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">�̶��ʲ�����</span></td>
    <td><select name="gdzcflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select gdzcflmc c1,gdzcflmc c2 from xz_gdzcflbm where gdzcflmc='"+gdzcflmc+"'","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�ͺ�</span></td>
    <td><input type="text" name="xh" value="<%=xh%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">Ʒ��</span></td>
    <td><input type="text" name="pp" value="<%=pp%>" size="20" maxlength="50" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����(CPU)</span></td>
    <td><input type="text" name="pz1" value="<%=pz1%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">����(�ڴ�)</span></td>
    <td><input type="text" name="pz2" value="<%=pz2%>" size="20" maxlength="50" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����(Ӳ��)</span></td>
    <td><input type="text" name="pz3" value="<%=pz3%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">����(����)</span></td>
    <td><input type="text" name="pz4" value="<%=pz4%>" size="20" maxlength="50" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">����(�Կ�)</span></td>
    <td><input type="text" name="pz5" value="<%=pz5%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">����(��ʾ��)</span></td>
    <td><input type="text" name="pz6" value="<%=pz6%>" size="20" maxlength="50" readonly>    </td>
  </tr>
</table>
<P>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE3">*</span>���޲���</span></td>
  <td width="30%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE3">*</span>����������</td>
  <td><input type="text" name="sqr" size="20" maxlength="20"  value="<%=sqr%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE3">*</span>�豸������</span></td>
  <td><input type="text" name="bgr" value="<%=bgr%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="20%"><span class="STYLE1"><span class="STYLE3">*</span></span>���Լ��豸����</td> 
  <td width="30%"><select name="dnsbflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dnsbflmc c1,dnsbflmc c2 from xz_dnsbflbm order by dnsbflbm",dnsbflmc);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE3">*</span></span>���Լ��豸���Ϸ���</td>
  <td><select name="dnsbgzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dnsbgzmc c1,dnsbgzmc c2 from xz_dnsbgzbm order by dnsbgzbm",dnsbgzmc);
%>
  </select></td>
  <td align="right"><span class="STYLE3">*</span>ϣ���������</td>
  <td><input type="text" name="jhlqrq" size="20" maxlength="10"  value="<%=jhlqrq%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE3">*</span>�豸���Ƿ�����Ҫ����</td> 
  <td colspan="3"><%
	cf.radioToken(out, "sfyzysj","N+��&Y+��",sfyzysj);
%>
	  &nbsp;&nbsp;&nbsp;&nbsp;�豸������ȷ�ϵ����豸��ϵͳӲ����<span class="STYLE3">��<strong>�Ƿ������Ҫ���ݡ�</strong></span>��
	  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  ����<span class="STYLE2">����ǰ���ݡ�</span>���Է���װ����ϵͳʱ��<span class="STYLE2">����Ҫ���ݶ�ʧ��</span>��</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE3">*</span>��������</span></td>
  <td><input type="text" name="bxrq" size="20" maxlength="10"  value="<%=bxrq%>" readonly></td>
  <td align="right"><span class="STYLE1"><span class="STYLE3">*</span>¼����</span></td>
  <td><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE3">*</span>������ϸ˵��</td> 
  <td colspan="3"> 
    <textarea name="gzxxsm" cols="73" rows="4"><%=gzxxsm%></textarea>  </td>
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
	if(	javaTrim(FormName.sqr)=="") {
		alert("������[����������]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.dnsbflmc)=="") {
		alert("��ѡ��[���Լ��豸����]��");
		FormName.dnsbflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dnsbgzmc)=="") {
		alert("��ѡ��[���Լ��豸���Ϸ���]��");
		FormName.dnsbgzmc.focus();
		return false;
	}
	if(	javaTrim(FormName.bxrq)=="") {
		alert("������[��������]��");
		FormName.bxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.bxrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqrq)=="") {
		alert("������[ϣ���������]��");
		FormName.jhlqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "ϣ���������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyzysj)) {
		alert("��ѡ��[�豸���Ƿ�����Ҫ����]��");
		FormName.sfyzysj[0].focus();
		return false;
	}
	if(	javaTrim(FormName.gzxxsm)=="") {
		alert("������[������ϸ˵��]��");
		FormName.gzxxsm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
