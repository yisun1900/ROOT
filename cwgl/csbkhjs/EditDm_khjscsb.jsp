<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String dqbm=null;
String sftzk=null;
String sfyfq=null;
String sfydjfx=null;
String sfydyq=null;
String sfydxpzc=null;
String sfydgzc=null;
String sfyzcfk=null;
String sfykhpc=null;
String sfyjsgcyh=null;
String sfyyqf=null;
String sfxmbm1=null;
String sfxmbm2=null;
String sfxmbm3=null;
String sfyqtx1=null;
String qtx1mc=null;
String sfyqtx2=null;
String qtx2mc=null;
String sfyqtx3=null;
String qtx3mc=null;
String sfxsp=null;
String sfxsq=null;
String sfydxpzcyh=null;
String sfydgzcyh=null;
String sfyjszcyh=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sfydxpzcyh,sfydgzcyh,sfyjszcyh,fgsbh,dqbm,sftzk,sfyfq,sfydjfx,sfydyq,sfydxpzc,sfydgzc,sfyzcfk,sfykhpc,sfyjsgcyh,sfyyqf,sfxmbm1,sfxmbm2,sfxmbm3,sfyqtx1,qtx1mc,sfyqtx2,qtx2mc,sfyqtx3,qtx3mc,sfxsp,sfxsq ";
	ls_sql+=" from  dm_khjscsb";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfydxpzcyh=cf.fillNull(rs.getString("sfydxpzcyh"));
		sfydgzcyh=cf.fillNull(rs.getString("sfydgzcyh"));
		sfyjszcyh=cf.fillNull(rs.getString("sfyjszcyh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sftzk=cf.fillNull(rs.getString("sftzk"));
		sfyfq=cf.fillNull(rs.getString("sfyfq"));
		sfydjfx=cf.fillNull(rs.getString("sfydjfx"));
		sfydyq=cf.fillNull(rs.getString("sfydyq"));
		sfydxpzc=cf.fillNull(rs.getString("sfydxpzc"));
		sfydgzc=cf.fillNull(rs.getString("sfydgzc"));
		sfyzcfk=cf.fillNull(rs.getString("sfyzcfk"));
		sfykhpc=cf.fillNull(rs.getString("sfykhpc"));
		sfyjsgcyh=cf.fillNull(rs.getString("sfyjsgcyh"));
		sfyyqf=cf.fillNull(rs.getString("sfyyqf"));
		sfxmbm1=cf.fillNull(rs.getString("sfxmbm1"));
		sfxmbm2=cf.fillNull(rs.getString("sfxmbm2"));
		sfxmbm3=cf.fillNull(rs.getString("sfxmbm3"));
		sfyqtx1=cf.fillNull(rs.getString("sfyqtx1"));
		qtx1mc=cf.fillNull(rs.getString("qtx1mc"));
		sfyqtx2=cf.fillNull(rs.getString("sfyqtx2"));
		qtx2mc=cf.fillNull(rs.getString("qtx2mc"));
		sfyqtx3=cf.fillNull(rs.getString("sfyqtx3"));
		qtx3mc=cf.fillNull(rs.getString("qtx3mc"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		sfxsq=cf.fillNull(rs.getString("sfxsq"));
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
<form method="post" action="SaveEditDm_khjscsb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���������ۿ�</td>
  <td><%
	cf.radioToken(out, "sftzk","1+��&3+��",sftzk);
%></td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ��н��㹤���Ż�</td>
  <td><%
	cf.radioToken(out, "sfyjsgcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyjsgcyh);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ��з�ȯ</td>
  <td><%
	cf.radioToken(out, "sfyfq","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyfq);
%></td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ��ж�����</td>
  <td><%
	cf.radioToken(out, "sfydjfx","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydjfx);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��е���ȯ</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydyq","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydyq);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ������ķ���</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyzcfk","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyzcfk);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����շ���Ŀ1</td>
  <td><select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc",sfxmbm1);
%>
  </select></td>
  <td align="right">�����շ���Ŀ2</td>
  <td><select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc",sfxmbm2);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����շ���Ŀ3</td>
  <td><select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc",sfxmbm3);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д���Ʒ����</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydxpzc","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydxpzc);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д���Ʒ�����Ż�</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydxpzcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydxpzcyh);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д�������</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydgzc","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydgzc);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д��������Ż�</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfydgzcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfydgzcyh);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��н��������Ż�</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyjszcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyjszcyh);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��пͻ��⳥��</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfykhpc","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfykhpc);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���������1</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx1","1+��&3+��",sfyqtx1);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ������ڷ�</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfyyqf","1+�ֹ�¼��&2+�Զ���ȡ&3+��",sfyyqf);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������1����</td>
  <td colspan="3"><input type="text" name="qtx1mc" size="73" maxlength="50"  value="<%=qtx1mc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���������2</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx2","1+��&3+��",sfyqtx2);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������2����</td>
  <td colspan="3"><input type="text" name="qtx2mc" size="73" maxlength="50"  value="<%=qtx2mc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���������3</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx3","1+��&3+��",sfyqtx3);
%>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������3����</td>
  <td colspan="3"><input type="text" name="qtx3mc" size="73" maxlength="50"  value="<%=qtx3mc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsp","1+��&3+��",sfxsp);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��������Ȩ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsq","1+��&3+��",sfxsq);
%>  </td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftzk)) {
		alert("��ѡ��[���������ۿ�]��");
		FormName.sftzk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjsgcyh)) {
		alert("��ѡ��[�Ƿ��н��㹤���Ż�]��");
		FormName.sfyjsgcyh[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyfq)) {
		alert("��ѡ��[�Ƿ��з�ȯ]��");
		FormName.sfyfq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydjfx)) {
		alert("��ѡ��[�Ƿ��ж�����]��");
		FormName.sfydjfx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydyq)) {
		alert("��ѡ��[�Ƿ��е���ȯ]��");
		FormName.sfydyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyzcfk)) {
		alert("��ѡ��[�Ƿ������ķ���]��");
		FormName.sfyzcfk[0].focus();
		return false;
	}



	if(	!radioChecked(FormName.sfydxpzc)) {
		alert("��ѡ��[�Ƿ��д���Ʒ����]��");
		FormName.sfydxpzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydxpzcyh)) {
		alert("��ѡ��[�Ƿ��д���Ʒ�����Ż�]��");
		FormName.sfydxpzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzc)) {
		alert("��ѡ��[�Ƿ��д�������]��");
		FormName.sfydgzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzcyh)) {
		alert("��ѡ��[�Ƿ��д��������Ż�]��");
		FormName.sfydgzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjszcyh)) {
		alert("��ѡ��[�Ƿ��н��������Ż�]��");
		FormName.sfyjszcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfykhpc)) {
		alert("��ѡ��[�Ƿ��пͻ��⳥��]��");
		FormName.sfykhpc[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyyqf)) {
		alert("��ѡ��[�Ƿ������ڷ�]��");
		FormName.sfyyqf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqtx1)) {
		alert("��ѡ��[�Ƿ���������1]��");
		FormName.sfyqtx1[0].focus();
		return false;
	}
	if (FormName.sfyqtx1[0].checked)
	{
		if(	javaTrim(FormName.qtx1mc)=="") {
			alert("��ѡ��[������1����]��");
			FormName.qtx1mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx1mc.value="";
	}

	if(	!radioChecked(FormName.sfyqtx2)) {
		alert("��ѡ��[�Ƿ���������2]��");
		FormName.sfyqtx2[0].focus();
		return false;
	}
	if (FormName.sfyqtx2[0].checked)
	{
		if(	javaTrim(FormName.qtx2mc)=="") {
			alert("��ѡ��[������1����]��");
			FormName.qtx2mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx2mc.value="";
	}
	if(	!radioChecked(FormName.sfyqtx3)) {
		alert("��ѡ��[�Ƿ���������3]��");
		FormName.sfyqtx3[0].focus();
		return false;
	}
	if (FormName.sfyqtx3[0].checked)
	{
		if(	javaTrim(FormName.qtx3mc)=="") {
			alert("��ѡ��[������3����]��");
			FormName.qtx3mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx3mc.value="";
	}
	if(	!radioChecked(FormName.sfxsp)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxsp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("��ѡ��[�Ƿ��������Ȩ]��");
		FormName.sfxsq[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
