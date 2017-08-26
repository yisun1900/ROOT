<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rwbm=null;
String rwmc=null;
String rwflbm=null;
String rwdx=null;
String sfsjysxm=null;
String gcysxmbm=null;

String sfsjzcxm=null;
String zcdlbm=null;
String sjzcjd=null;
String sfyxhxgq=null;
String zdjkrw=null;

String bjsj=null;
String bjjbbm=null;

String sqbjnr=null;
String sqbjts=null;
String shbjnr=null;
String shbjts=null;
String rwxh=null;

String bz=null;


String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rwbm,rwmc,rwflbm,zdjkrw,bjsj,sqbjnr,sqbjts,shbjnr,shbjts,sfsjzcxm,zcdlbm,sjzcjd,bz,sfsjysxm,gcysxmbm,rwxh ";
	ls_sql+=" ,rwdx,sfyxhxgq,sfsjzcxm,zcdlbm,bjjbbm ";
	ls_sql+=" from  gdm_rwbm";
	ls_sql+=" where  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rwdx=cf.fillNull(rs.getString("rwdx"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfsjzcxm=cf.fillNull(rs.getString("sfsjzcxm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));

		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjsj=cf.fillNull(rs.getString("bjsj"));
		sqbjnr=cf.fillNull(rs.getString("sqbjnr"));
		sqbjts=cf.fillNull(rs.getString("sqbjts"));
		shbjnr=cf.fillNull(rs.getString("shbjnr"));
		shbjts=cf.fillNull(rs.getString("shbjts"));
		sfsjzcxm=cf.fillNull(rs.getString("sfsjzcxm"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		sjzcjd=cf.fillNull(rs.getString("sjzcjd"));
		bz=cf.fillNull(rs.getString("bz"));
		sfsjysxm=cf.fillNull(rs.getString("sfsjysxm"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));

		if (sqbjts.equals("0"))
		{
			sqbjts="";
		}
		if (shbjts.equals("0"))
		{
			shbjts="";
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
  <td align="right"><span class="STYLE2">*</span><span class="STYLE3">�������(4λ)</span></td>
  <td><input type="text" name="rwbm" size="20" maxlength="4"  value="<%=rwbm%>" readonly></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>�������</td>
  <td><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from gdm_rwflbm order by rwflbm",rwflbm);
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>��������</td> 
  <td colspan="3"><input type="text" name="rwmc" size="73" maxlength="100"  value="<%=rwmc%>" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>�������</td>
  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "rwdx","1+�ͻ�&2+ʩ����&3+��Ӧ��&4+���ʦ&5+�ʼ�",rwdx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ��漰������</td>
  <td><%
	cf.radioToken(out, "sfsjysxm","Y+��&N+��",sfsjysxm);
%></td>
  <td align="right" bgcolor="#FFFFFF">������Ŀ</td>
  <td bgcolor="#FFFFFF"><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where ysxmflbm='05' order by gcysxmbm",gcysxmbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>�Ƿ��漰������Ŀ</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "sfsjzcxm","Y+��&N+��",sfsjzcxm);
%></td>
  <td align="right" bgcolor="#FFFFFF">�漰���Ĵ���</td>
  <td bgcolor="#FFFFFF"><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb='1' order by cldlmc",zcdlbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">�漰���Ľڵ�</td>
  <td>
  <select name="sjzcjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  <%
	cf.selectToken(out,"03+����֪ͨ&05+�Ѳ���& 25+����֪ͨ&26+����&09+��ͬ�����&11+��ͬ��ȷ��&13+�����ѽ���&15+ȷ���ͻ�ʱ��&17+��֪ͨ�ͻ�&19+�ͻ���װ��� ",sjzcjd);
%>
  </select></td>
  <td align="right" bgcolor="#FFFFFF">��������</td>
  <td bgcolor="#FFFFFF"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from gdm_bjjbbm order by bjjbbm",bjjbbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">*</span>����ʱ��</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bjsj","1+��ǰ����&2+�º�����&3+��ǰ�º�����&9+������",bjsj);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ǰ��������</td> 
  <td width="32%"> 
    <input type="text" name="sqbjts" size="20" maxlength="8"  value="<%=sqbjts%>" >  </td>
  <td align="right" width="18%">�º󱨾�����</td> 
  <td width="32%"><input type="text" name="shbjts" size="20" maxlength="8"  value="<%=shbjts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ŀ��ǰ��������</td>
  <td colspan="3"><textarea name="sqbjnr" cols="72" rows="2"><%=sqbjnr%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�º󱨾�����</td>
  <td colspan="3"><textarea name="shbjnr" cols="72" rows="2"><%=shbjnr%></textarea></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ�Ӱ���������</td>
  <td><%
	cf.radioToken(out, "sfyxhxgq","Y+��&N+��",sfyxhxgq);
%></td>
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">*</span>�ص�������</td>
  <td bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zdjkrw","Y+�ص���&N+���ص���",zdjkrw);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�������</td>
  <td><input name="rwxh" type="text" value="<%=rwxh%>" size="10" maxlength="8" ></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
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
	if(	!radioChecked(FormName.rwdx)) {
		alert("��ѡ��[�������]��");
		FormName.rwdx[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfsjysxm)) {
		alert("��ѡ��[�Ƿ��漰������]��");
		FormName.sfsjysxm[0].focus();
		return false;
	}
	if (FormName.sfsjysxm[0].checked)
	{
		if(	javaTrim(FormName.gcysxmbm)=="") {
			alert("������[������Ŀ]��");
			FormName.gcysxmbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.gcysxmbm)!="") {
			alert("��������[������Ŀ]��");
			FormName.gcysxmbm.focus();
			return false;
		}
	}


	if(	!radioChecked(FormName.sfsjzcxm)) {
		alert("��ѡ��[�Ƿ��漰������Ŀ]��");
		FormName.sfsjzcxm[0].focus();
		return false;
	}
	if (FormName.sfsjzcxm[0].checked)
	{
		if(	javaTrim(FormName.zcdlbm)=="") {
			alert("������[�漰���Ĵ���]��");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.sjzcjd)=="") {
			alert("������[�漰���Ľڵ�]��");
			FormName.sjzcjd.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.zcdlbm)!="") {
			alert("��������[�漰���Ĵ���]��");
			FormName.zcdlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.sjzcjd)!="") {
			alert("��������[�漰���Ľڵ�]��");
			FormName.sjzcjd.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.bjsj)) {
		alert("��ѡ��[����ʱ��]��");
		FormName.bjsj[0].focus();
		return false;
	}
	if(!(isNumber(FormName.sqbjts, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.shbjts, "�º󱨾�����"))) {
		return false;
	}
	if (FormName.bjsj[0].checked )
	{
		if(	javaTrim(FormName.sqbjts)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjts)!="") {
			alert("[�º󱨾�����]ӦΪ�գ�");
			FormName.shbjts.select();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)!="") {
			alert("[�º󱨾�����]ӦΪ�գ�");
			FormName.shbjnr.select();
			return false;
		}
	}
	else if (FormName.bjsj[1].checked )
	{
		if(	javaTrim(FormName.shbjts)=="") {
			alert("������[�º󱨾�����]��");
			FormName.shbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)=="") {
			alert("������[�º󱨾�����]��");
			FormName.shbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjts)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqbjts.select();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqbjnr.select();
			return false;
		}
	}
	else if ( FormName.bjsj[2].checked)
	{
		if(	javaTrim(FormName.sqbjts)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqbjnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjts)=="") {
			alert("������[�º󱨾�����]��");
			FormName.shbjts.focus();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)=="") {
			alert("������[�º󱨾�����]��");
			FormName.shbjnr.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqbjts)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqbjts.select();
			return false;
		}
		if(	javaTrim(FormName.sqbjnr)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqbjnr.select();
			return false;
		}
		if(	javaTrim(FormName.shbjts)!="") {
			alert("[�º󱨾�����]ӦΪ�գ�");
			FormName.shbjts.select();
			return false;
		}
		if(	javaTrim(FormName.shbjnr)!="") {
			alert("[�º󱨾�����]ӦΪ�գ�");
			FormName.shbjnr.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfyxhxgq)) {
		alert("��ѡ��[�Ƿ�Ӱ���������]��");
		FormName.sfyxhxgq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdjkrw)) {
		alert("��ѡ��[�ص�������]��");
		FormName.zdjkrw[0].focus();
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

	FormName.action="SaveEditGdm_rwbm.jsp";
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

	FormName.action="InsertGdm_rwljgx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
