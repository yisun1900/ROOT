<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String bfcs=null;
String bfjs=null;
String bfbl=null;
String sdlbfbl=null;
String kzbjjs=null;
String sfwgjs=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
String sgdjbxg=null;
double kzbjbl=0;
double zxxs=0;
double jxxs=0;
double lkhjbfb=0;

String zjxjffs=null;
double ljzjxxs=0;
String sfkyqpc=null;
String sfkclfk=null;
String sfkfkje=null;
String sfkclyf=null;
String sfjjlje=null;
String sfkzckk=null;
String sfjqtje=null;
String zjxbhfw=null;
String zjxsjd=null;

String sdlqz=null;
String sfjzcjl=null;
String zcsfjs=null;
String zcjehqfs=null;
String zcjsblkg=null;
double zcjsbl=0;
double fkbl=0;
String sksh=null;

String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherebfcs=cf.GB2Uni(request.getParameter("bfcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select lkhjbfb,fgsbh,bfcs,bfjs,bfbl,sdlbfbl,kzbjjs,sfwgjs,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,sgdjbxg,kzbjbl,zxxs,jxxs ";
	ls_sql+=" ,zjxjffs,ljzjxxs,sfkyqpc,sfkclfk,sfkfkje,sfkclyf,sfjjlje,sfkzckk,sfjqtje,zjxbhfw,zjxsjd";
	ls_sql+=" ,sdlqz,sfjzcjl,zcsfjs,zcjehqfs,zcjsblkg,zcjsbl,fkbl,sksh";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+wherefgsbh+"' and bfcs="+wherebfcs;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sdlqz=cf.fillNull(rs.getString("sdlqz"));
		sfjzcjl=cf.fillNull(rs.getString("sfjzcjl"));
		zcsfjs=cf.fillNull(rs.getString("zcsfjs"));
		zcjehqfs=cf.fillNull(rs.getString("zcjehqfs"));
		zcjsblkg=cf.fillNull(rs.getString("zcjsblkg"));
		zcjsbl=rs.getDouble("zcjsbl");
		fkbl=rs.getDouble("fkbl");
		sksh=cf.fillNull(rs.getString("sksh"));

		zjxbhfw=cf.fillNull(rs.getString("zjxbhfw"));
		zjxsjd=cf.fillNull(rs.getString("zjxsjd"));
		zjxjffs=cf.fillNull(rs.getString("zjxjffs"));
		ljzjxxs=rs.getDouble("ljzjxxs");
		sfkyqpc=cf.fillNull(rs.getString("sfkyqpc"));
		sfkclfk=cf.fillNull(rs.getString("sfkclfk"));
		sfkfkje=cf.fillNull(rs.getString("sfkfkje"));
		sfkclyf=cf.fillNull(rs.getString("sfkclyf"));
		sfjjlje=cf.fillNull(rs.getString("sfjjlje"));
		sfkzckk=cf.fillNull(rs.getString("sfkzckk"));
		sfjqtje=cf.fillNull(rs.getString("sfjqtje"));

		lkhjbfb=rs.getDouble("lkhjbfb");
		kzbjbl=rs.getDouble("kzbjbl");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		bfcs=cf.fillNull(rs.getString("bfcs"));
		bfjs=cf.fillNull(rs.getString("bfjs"));
		bfbl=cf.fillNull(rs.getString("bfbl"));
		sdlbfbl=cf.fillNull(rs.getString("sdlbfbl"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		sfwgjs=cf.fillNull(rs.getString("sfwgjs"));
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		sgdjbxg=cf.fillNull(rs.getString("sgdjbxg"));
		zxxs=rs.getDouble("zxxs");
		jxxs=rs.getDouble("jxxs");
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
<form method="post" action="SaveEditDm_sgdjscsb.jsp" name="editform">
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
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"1+��һ��&2+�ڶ���&3+������&4+���Ĵ�&5+�����&6+������&7+���ߴ�&8+�ڰ˴�&9+�깤����",bfcs);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
<select name="bfjs" style="FONT-SIZE:12PX;WIDTH:232PX">
	 <OPTION value=""></OPTION>
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm order by jsjsbm",bfjs);
%>
  </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="bfbl" size="10" maxlength="9"  value="<%=bfbl%>" >
    %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���ʩ���Ӽ������</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+��&N+��",sgdjbxg);
%></td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ��깤����</td>
  <td><%
	cf.radioToken(out, "sfwgjs","Y+��&N+��",sfwgjs);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td rowspan="2" align="right"><span class="STYLE1">*</span>ˮ��·���㷽ʽ</td>
  <td rowspan="2"><%
	cf.radioToken(out, "sdljsfs","1+����������<BR>&2+�����������ɸ�<BR>&3+���������ɸ�<BR>&4+�ֹ�¼�������",sdljsfs);
%></td>
  <td align="right">ˮ��·ȡֵ</td>
  <td><%
	cf.radioToken(out, "sdlqz","1+��ǰ&2+�ۺ�&3+ʩ���ɱ���",sdlqz);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ˮ��·��������</td>
  <td><input type="text" name="sdlbfbl" size="10" maxlength="9"  value="<%=sdlbfbl%>" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td rowspan="5" align="right"><font color="#FF0000">*</font>���������ʽ</td>
  <td rowspan="5"><%
	cf.radioToken(out, "zjxjffs","1+������<BR>&2+�ۼ��ۺ���������<BR>&3+�ۼ�������ʩ���ɱ�<BR>&4+�ۺ������������<BR>&5+����ʩ���ɱ�����ʩ���ɱ�<BR>&6+����ʩ���ɱ��ۺ������<BR>&7+�ۺ����������ʩ���ɱ�",zjxjffs);
%></td>
  <td align="right">�����������Χ</td>
  <td><%
	cf.radioToken(out, "zjxbhfw","1+����&2+������&3+���̣�������<br>&4+����(��ˮ��)&5+���̣�������(��ˮ��)",zjxbhfw);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������ʱ���</td>
  <td><%
	cf.radioToken(out, "zjxsjd","1+ȫ��&2+����ǰ&3+������",zjxsjd);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ۼ�������ϵ��</td>
  <td><input name="ljzjxxs" type="text" value="<%=ljzjxxs%>" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ϵ��</td>
  <td><input type="text" name="jxxs" value="<%=jxxs%>" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ϵ��</td>
  <td><input type="text" name="zxxs" value="<%=zxxs%>" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����ڷ��⳥��</td>
  <td><%
	cf.radioToken(out, "sfkyqpc","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkyqpc);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ����</td>
  <td><%
	cf.radioToken(out, "zcsfjs","1+������&2+����������&3+�˹�¼��",zcsfjs);
%></td>
  <td align="right">���Ľ���ȡ��ʽ</td>
  <td><%
	cf.radioToken(out, "zcjehqfs","1+�Զ���ȡ&2+�˹�¼��",zcjehqfs);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���Ľ���������޸�</td>
  <td><%
	cf.radioToken(out, "zcjsblkg","1+���޸�&2+�����޸�",zcjsblkg);
%></td>
  <td align="right">���Ľ������</td>
  <td><input type="text" name="zcjsbl" value="<%=zcjsbl%>" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" rowspan="2" align="right"><span class="STYLE1">*</span>�Ƿ���ʱ���</td> 
  <td width="32%" rowspan="2"><%
	cf.radioToken(out, "sfkzbj","Y+���ʱ���������ɸ�<BR>&M+���ʱ�������ɸ�<BR>&N+�����ʱ���",sfkzbj);
%></td>
  <td align="right" width="18%">���ʱ������</td> 
  <td width="32%"><%
	cf.radioToken(out, "kzbjjs","1+�������&2+�����ܶ�",kzbjjs);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ������</td>
  <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk);
%>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۹�����Ʒ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѹ�����</td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�۸��ķ���</td>
  <td><%
	cf.radioToken(out, "sfkclfk","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkclfk);
%></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�۲����˷�</td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkclyf);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�����Ŀۿ�</td>
  <td><%
	cf.radioToken(out, "sfkzckk","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkzckk);
%></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�����Ľ���</td>
  <td><%
	cf.radioToken(out, "sfjzcjl","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfjzcjl);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�۷�����</td>
  <td><%
	cf.radioToken(out, "sfkfkje","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfkfkje);
%></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ӽ������</td>
  <td><%
	cf.radioToken(out, "sfjjlje","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfjjlje);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td><%
	cf.radioToken(out, "sfjqtje","Y+�Զ���ȡ&S+�˹�¼��&N+��",sfjqtje);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������ϼưٷֱ�</td>
  <td colspan="3"><input name="lkhjbfb" type="text" value="<%=lkhjbfb%>" size="10" maxlength="9" >
    %&nbsp;&nbsp;&nbsp;&nbsp;���Ͽ�+������Ʒ+������&lt;=��������*������ϼưٷֱ�</td>
  </tr>
<tr bgcolor="#CCCCCC">
  <td height="23" colspan="4" align="center">��������</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ҫ�����㸶�����</td>
  <td><input name="fkbl" type="text" value="<%=fkbl%>" size="10" maxlength="9" >
  %
    </td>
  <td rowspan="2" align="right"><span class="STYLE1">*</span>Ҫ�����㹤�̽���</td>
  <td rowspan="2"><select name="gcjdbm" size="5" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.mutilSelectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm where gcjdbm!='7' order by gcjdbm","select gcjdbm from dm_yqgcjd where fgsbh='"+wherefgsbh+"' and bfcs="+wherebfcs);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ���������</td>
  <td><%
	cf.radioToken(out, "sksh","Y+�����&N+�������",sksh);
%></td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
	<input type="hidden" name="wherebfcs"  value="<%=wherebfcs%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input name="button3" type="button" onClick="f_lr(editform)"  value="����������">
	  <input type="button" onClick="f_lr(editform)"  value="���ʱ������">
	  <input name="button" type="button" onClick="f_jbtz(editform)"  value="ʩ���Ӽ�����������">
	  <input name="button2" type="button" onClick="f_zbjtz(editform)"  value="�ʱ�����������">
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
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bfjs)=="") {
		alert("������[��������]��");
		FormName.bfjs.focus();
		return false;
	}
	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("��ѡ��[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs[0].focus();
		return false;
	}
	if (FormName.sdljsfs[0].checked)
	{
		notRadio(FormName.sdlqz);
		FormName.sdlbfbl.value="0";
	}
	else 
	{
		if(	!radioChecked(FormName.sdlqz)) {
			alert("��ѡ��[ˮ��·ȡֵ]��");
			FormName.sdlqz[0].focus();
			return false;
		}

		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("������[ˮ��·��������]��");
			FormName.sdlbfbl.focus();
			return false;
		}
		if(!(isFloat(FormName.sdlbfbl, "ˮ��·��������"))) {
			return false;
		}
	}

	if(	!radioChecked(FormName.zcsfjs)) {
		alert("��ѡ��[�����Ƿ����]��");
		FormName.zcsfjs[0].focus();
		return false;
	}
	if (FormName.zcsfjs[0].checked)
	{
		FormName.zcjehqfs[0].checked=true;
		FormName.zcjsblkg[1].checked=true;
		FormName.zcjsbl.value="0";
	}
	else if (FormName.zcsfjs[1].checked)
	{
		if(	!radioChecked(FormName.zcjehqfs)) {
			alert("��ѡ��[���Ľ���ȡ��ʽ]��");
			FormName.zcjehqfs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zcjsblkg)) {
			alert("��ѡ��[���Ľ���������޸�]��");
			FormName.zcjsblkg[0].focus();
			return false;
		}

		if(	javaTrim(FormName.zcjsbl)=="") {
			alert("������[���Ľ������]��");
			FormName.zcjsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.zcjsbl, "���Ľ������"))) {
			return false;
		}
	}
	else
	{
		if(	!radioChecked(FormName.zcjehqfs)) {
			alert("��ѡ��[���Ľ���ȡ��ʽ]��");
			FormName.zcjehqfs[0].focus();
			return false;
		}

		FormName.zcjsblkg[1].checked=true;
		FormName.zcjsbl.value="0";
	}


	if(	!radioChecked(FormName.sfkzbj)) {
		alert("��ѡ��[�Ƿ���ʱ���]��");
		FormName.sfkzbj[0].focus();
		return false;
	}

	if (FormName.sfkzbj[2].checked)
	{
		notRadio(FormName.kzbjjs);
		FormName.kzbjbl.value="0";
	}
	else
	{
		if(	!radioChecked(FormName.kzbjjs)) {
			alert("��ѡ��[���ʱ������]��");
			FormName.kzbjjs[0].focus();
			return false;
		}
		if(	javaTrim(FormName.kzbjbl)=="") {
			alert("������[���ʱ������]��");
			FormName.kzbjbl.focus();
			return false;
		}
		if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
			return false;
		}
	}


	if(	!radioChecked(FormName.sfkclk)) {
		alert("��ѡ��[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkgdyp)) {
		alert("��ѡ��[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyfgf)) {
		alert("��ѡ��[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("��ѡ��[�Ƿ���ʩ���Ӽ������]��");
		FormName.sgdjbxg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.zjxjffs)) {
		alert("��ѡ��[���������ʽ]��");
		FormName.zjxjffs[0].focus();
		return false;
	}

	if (FormName.zjxjffs[0].checked)
	{
		FormName.ljzjxxs.value="0";
		FormName.zxxs.value="0";
		FormName.jxxs.value="0";
		notRadio(FormName.zjxbhfw);
		notRadio(FormName.zjxsjd);
	}
	else if (FormName.zjxjffs[1].checked || FormName.zjxjffs[2].checked)
	{
		if(	!radioChecked(FormName.zjxbhfw)) {
			alert("��ѡ��[�����������Χ]��");
			FormName.zjxbhfw[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zjxsjd)) {
			alert("��ѡ��[������ʱ���]��");
			FormName.zjxsjd[0].focus();
			return false;
		}
		if(	javaTrim(FormName.ljzjxxs)=="") {
			alert("������[�ۼ�������ϵ��]��");
			FormName.ljzjxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.ljzjxxs, "�ۼ�������ϵ��"))) {
			return false;
		}

		if (parseFloat(FormName.ljzjxxs.value)<=0)
		{
			alert("����[�ۼ�������ϵ��]�������0");
			FormName.ljzjxxs.select();
			return false;
		}

		FormName.zxxs.value="0";
		FormName.jxxs.value="0";
	}
	else if (FormName.zjxjffs[3].checked || FormName.zjxjffs[4].checked || FormName.zjxjffs[5].checked || FormName.zjxjffs[6].checked)
	{
		if(	!radioChecked(FormName.zjxbhfw)) {
			alert("��ѡ��[�����������Χ]��");
			FormName.zjxbhfw[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zjxsjd)) {
			alert("��ѡ��[������ʱ���]��");
			FormName.zjxsjd[0].focus();
			return false;
		}

		FormName.ljzjxxs.value="0";

		if(	javaTrim(FormName.zxxs)=="") {
			alert("������[����ϵ��]��");
			FormName.zxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.zxxs, "����ϵ��"))) {
			return false;
		}

		if (parseFloat(FormName.zxxs.value)<=0)
		{
			alert("����[����ϵ��]�������0");
			FormName.zxxs.select();
			return false;
		}
		if(	javaTrim(FormName.jxxs)=="") {
			alert("������[����ϵ��]��");
			FormName.jxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.jxxs, "����ϵ��"))) {
			return false;
		}

		if (parseFloat(FormName.jxxs.value)<=0)
		{
			alert("����[����ϵ��]�������0");
			FormName.jxxs.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfkclfk)) {
		alert("��ѡ��[�Ƿ�۸��ķ���]��");
		FormName.sfkclfk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclyf)) {
		alert("��ѡ��[�Ƿ�۲����˷�]��");
		FormName.sfkclyf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzckk)) {
		alert("��ѡ��[�Ƿ�����Ŀۿ�]��");
		FormName.sfkzckk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjzcjl)) {
		alert("��ѡ��[�Ƿ�����Ľ���]��");
		FormName.sfjzcjl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkfkje)) {
		alert("��ѡ��[�Ƿ�۷�����]��");
		FormName.sfkfkje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjjlje)) {
		alert("��ѡ��[�Ƿ�ӽ������]��");
		FormName.sfjjlje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjqtje)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfjqtje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyqpc)) {
		alert("��ѡ��[�Ƿ�����ڷ��⳥��]��");
		FormName.sfkyqpc[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfwgjs)) {
		alert("��ѡ��[�Ƿ��깤����]��");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lkhjbfb)=="") {
		alert("������[������ϼưٷֱ�]��");
		FormName.lkhjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.lkhjbfb, "������ϼưٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.lkhjbfb.value)<0 || parseFloat(FormName.lkhjbfb.value)>100)
	{
		alert("����[������ϼưٷֱ�]Ӧ��0��100֮��");
		FormName.lkhjbfb.focus();
		return false;
	}

	if(	javaTrim(FormName.fkbl)=="") {
		alert("������[Ҫ�����㸶�����]��");
		FormName.fkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fkbl, "Ҫ�����㸶�����"))) {
		return false;
	}
	if (parseFloat(FormName.fkbl.value)<0 || parseFloat(FormName.fkbl.value)>100)
	{
		alert("����[Ҫ�����㸶�����]Ӧ��0��100֮��");
		FormName.fkbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sksh)) {
		alert("��ѡ��[�����Ƿ���������]��");
		FormName.sksh[0].focus();
		return false;
	}

	if(	!selectChecked(FormName.gcjdbm)) {
		alert("������[Ҫ�����㹤�̽���]��");
		FormName.gcjdbm.focus();
		return false;
	}

	FormName.action="SaveEditDm_sgdjscsb.jsp";
	FormName.target="";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_kzbjbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_jbtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_jbtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_zbjtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_zbjtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
