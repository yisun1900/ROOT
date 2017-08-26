<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcysxmbm=null;
String gcysxmmc=null;
String ysxmflbm=null;
String bz=null;
String dygcjdbm=null;
String sfhf=null;
String hflxbm=null;
double ljskbfb=0;
String wheregcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gcysxmbm,gcysxmmc,ysxmflbm,bz,dygcjdbm,sfhf,hflxbm,ljskbfb ";
	ls_sql+=" from  dm_gcysxm";
	ls_sql+=" where  (gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		ysxmflbm=cf.fillNull(rs.getString("ysxmflbm"));
		bz=cf.fillNull(rs.getString("bz"));
		dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		sfhf=cf.fillNull(rs.getString("sfhf"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		ljskbfb=rs.getDouble("ljskbfb");
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
<form method="post" action="SaveEditDm_gcysxm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������Ŀ����</td>
  <td width="31%"><select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm where ysxmflbm='"+ysxmflbm+"'",ysxmflbm);
%>
  </select></td>
  <td width="19%" align="right"><span class="STYLE1">*</span>������Ŀ����(4λ)</td>
  <td width="31%"><input type="text" name="gcysxmbm" size="20" maxlength="4"  value="<%=gcysxmbm%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>������Ŀ����</td> 
  <td colspan="3"><input type="text" name="gcysxmmc" size="73" maxlength="50"  value="<%=gcysxmmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�ط�</td>
  <td><%
		cf.radioToken(out, "sfhf","Y+��&N+��",sfhf);
%></td>
  <td align="right">�ط�����</td>
  <td><select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm",hflxbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ���̽���</td>
  <td><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:151PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",dygcjdbm);
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>�ۼƼ�װ�տ�ٷֱ�</td>
  <td><input type="text" name="ljskbfb" size="10" maxlength="8"  value="<%=ljskbfb%>" >
  %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheregcysxmbm"  value="<%=wheregcysxmbm%>" >
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
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("��ѡ��[������Ŀ����]��");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhf)) {
		alert("������[�Ƿ�ط�]��");
		FormName.sfhf[0].focus();
		return false;
	}
	if (FormName.sfhf[0].checked)
	{
		if(	javaTrim(FormName.hflxbm)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hflxbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.hflxbm)!="") {
			alert("����طã�");
			FormName.hflxbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.ljskbfb)=="") {
		alert("��ѡ��[�ۼƼ�װ�տ�ٷֱ�]��");
		FormName.ljskbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.ljskbfb, "�ۼƼ�װ�տ�ٷֱ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
