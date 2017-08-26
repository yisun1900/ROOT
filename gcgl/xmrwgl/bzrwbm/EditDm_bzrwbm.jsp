<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String bjlb=null;
String sqtxnr=null;
String sqtxts=null;
String shtxnr=null;
String shtxts=null;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String bz=null;
String sfwlcb=null;
String zyrwbm=null;
String rwxh=null;

String xgytg=null;
String gytgts=null;
String sjcpxx=null;
String sjcpfl=null;
String bjjbbm=null;
String gznr=null;

String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,bz,sfwlcb,zyrwbm,rwxh ";
	ls_sql+=" ,xgytg,gytgts,sjcpxx,sjcpfl,bjjbbm,gznr ";
	ls_sql+=" from  dm_bzrwbm";
	ls_sql+=" where  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xgytg=cf.fillNull(rs.getString("xgytg"));
		gytgts=cf.fillNull(rs.getString("gytgts"));
		sjcpxx=cf.fillNull(rs.getString("sjcpxx"));
		sjcpfl=cf.fillNull(rs.getString("sjcpfl"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		gznr=cf.fillNull(rs.getString("gznr"));

		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		bz=cf.fillNull(rs.getString("bz"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));

		if (sqtxts.equals("0"))
		{
			sqtxts="";
		}
		if (shtxts.equals("0"))
		{
			shtxts="";
		}
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
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�������</td>
  <td><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm",rwflbm);
%>
  </select></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span><span class="STYLE3">�������(4λ)</span></td>
  <td><input type="text" name="rwbm" size="20" maxlength="4"  value="<%=rwbm%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>��������</td> 
  <td colspan="3"><input type="text" name="rwmc" size="73" maxlength="50"  value="<%=rwmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ժҪ����</td>
  <td colspan="3"><select name="zyrwbm" style="FONT-SIZE:12PX;WIDTH:524PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm",zyrwbm);
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">*</span>�Ƿ��漰��Ʒ��Ϣ</td>
  <td bgcolor="#FFFFCC"><%
	cf.radioToken(out, "sjcpxx","Y+��&N+��",sjcpxx);
%></td>
  <td rowspan="4" align="right" bgcolor="#FFFFCC">�漰��Ʒ����</td>
  <td rowspan="4" bgcolor="#FFFFCC"><select name="cpflbm" size="7" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.mutilSelectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","select cpflbm from dm_bzrwcpfl where rwbm='"+rwbm+"'");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�蹤��ͣ��</td>
  <td><%
	cf.radioToken(out, "xgytg","Y+��&N+��",xgytg);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ͣ������</td>
  <td><input type="text" name="gytgts" size="20" maxlength="8"  value="<%=gytgts%>" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>��������</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from dm_bjjbbm order by bjjbbm",bjjbbm);
%>
  </select></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>�������</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bjlb","1+��ǰ����&2+�º�����&3+��ǰ�º�����&9+һ���¼",bjlb);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ǰ��������</td> 
  <td width="33%"> 
    <input type="text" name="sqtxts" size="20" maxlength="8"  value="<%=sqtxts%>" >  </td>
  <td align="right" width="17%">�º���������</td> 
  <td width="33%"><input type="text" name="shtxts" size="20" maxlength="8"  value="<%=shtxts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ǰ��������</td>
  <td colspan="3"><textarea name="sqtxnr" cols="72" rows="2"><%=sqtxnr%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�º���������</td>
  <td colspan="3"><textarea name="shtxnr" cols="72" rows="2"><%=shtxnr%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">*</span>�Ƿ�������</td>
  <td bgcolor="#FFFFCC"><%
	cf.radioToken(out, "sfxys","Y+��&N+��",sfxys);
%></td>
  <td rowspan="4" align="right" bgcolor="#FFFFCC">������Ŀ</td>
  <td rowspan="4" bgcolor="#FFFFCC"><select name="gcysxmbm" size="7" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.mutilSelectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm order by gcysxmbm","select gcysxmbm from dm_bzrwysxm where rwbm='"+rwbm+"'");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ�Ӱ���������</td>
  <td><%
	cf.radioToken(out, "sfyxhxgq","Y+��&N+��",sfyxhxgq);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ�Ӱ�츴��</td>
  <td><%
	cf.radioToken(out, "sfyxfc","Y+��&N+��",sfyxfc);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�������</td>
  <td><input name="rwxh" type="text" value="<%=rwxh%>" size="10" maxlength="8" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ�Ϊ��̱�</td>
  <td>
<%
	cf.radioToken(out, "sfwlcb","Y+��&N+��",sfwlcb);
%>  </td>
  <td align="right"><span class="STYLE2">*</span>�ص�������</td>
  <td><%
	cf.radioToken(out, "zdjkrw","1+�ص���&2+���ص���",zdjkrw);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע����</td>
  <td colspan="3"><textarea name="gznr" cols="72" rows="4"><%=gznr%></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">����ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="2"><%=bz%></textarea>      </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="button" onClick="f_do1(editform)"  value="�����߼���ϵ" name="ljgx">
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
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("������[�������]��");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwmc)=="") {
		alert("������[��������]��");
		FormName.rwmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.xgytg)) {
		alert("��ѡ��[�蹤��ͣ��]��");
		FormName.xgytg[0].focus();
		return false;
	}
	if (FormName.xgytg[0].checked)
	{
		if(	javaTrim(FormName.gytgts)=="") {
			alert("������[����ͣ������]��");
			FormName.gytgts.focus();
			return false;
		}
		if(!(isNumber(FormName.gytgts, "����ͣ������"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.gytgts)!="" && javaTrim(FormName.gytgts)!="0") {
			alert("��������[����ͣ������]��");
			FormName.gytgts.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.sjcpxx)) {
		alert("��ѡ��[�Ƿ��漰��Ʒ��Ϣ]��");
		FormName.sjcpxx[0].focus();
		return false;
	}
	if (FormName.sjcpxx[0].checked)
	{
		if(	!selectChecked(FormName.cpflbm)) {
			alert("������[�漰��Ʒ����]��");
			FormName.cpflbm.focus();
			return false;
		}
	}
	else{
		if(	selectChecked(FormName.cpflbm)) {
			alert("����ѡ��[�漰��Ʒ����]��");
			FormName.cpflbm.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.bjlb)) {
		alert("��ѡ��[�������]��");
		FormName.bjlb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjlb)) {
		alert("��ѡ��[�������]��");
		FormName.bjlb[0].focus();
		return false;
	}
	if(!(isNumber(FormName.sqtxts, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.shtxts, "�º���������"))) {
		return false;
	}
	if (FormName.bjlb[0].checked )
	{
		if(	javaTrim(FormName.sqtxts)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxts)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxts.select();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxnr.select();
			return false;
		}
	}
	else if (FormName.bjlb[1].checked )
	{
		if(	javaTrim(FormName.shtxts)=="") {
			alert("������[�º���������]��");
			FormName.shtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)=="") {
			alert("������[�º���������]��");
			FormName.shtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxts)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxts.select();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxnr.select();
			return false;
		}
	}
	else if ( FormName.bjlb[2].checked)
	{
		if(	javaTrim(FormName.sqtxts)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxts)=="") {
			alert("������[�º���������]��");
			FormName.shtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)=="") {
			alert("������[�º���������]��");
			FormName.shtxnr.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqtxts)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxts.select();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxnr.select();
			return false;
		}
		if(	javaTrim(FormName.shtxts)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxts.select();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxnr.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfwlcb)) {
		alert("��ѡ��[�Ƿ�Ϊ��̱�]��");
		FormName.sfwlcb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("������[�������]��");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isFloat(FormName.rwxh, "�������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyxhxgq)) {
		alert("��ѡ��[�Ƿ�Ӱ���������]��");
		FormName.sfyxhxgq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxfc)) {
		alert("��ѡ��[�Ƿ�Ӱ�츴��]��");
		FormName.sfyxfc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxys)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxys[0].focus();
		return false;
	}
	if (FormName.sfxys[0].checked)
	{
		if(	!selectChecked(FormName.gcysxmbm)) {
			alert("������[������Ŀ]��");
			FormName.gcysxmbm.focus();
			return false;
		}
	}
	else{
		if(	selectChecked(FormName.gcysxmbm)) {
			alert("����ѡ��[������Ŀ]��");
			FormName.gcysxmbm.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.zdjkrw)) {
		alert("��ѡ��[�ص�������]��");
		FormName.zdjkrw[0].focus();
		return false;
	}

	FormName.action="SaveEditDm_bzrwbm.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rwbm)=="") {
		alert("������[�������]��");
		FormName.rwbm.focus();
		return false;
	}

	FormName.action="InsertDm_bzrwljgx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
