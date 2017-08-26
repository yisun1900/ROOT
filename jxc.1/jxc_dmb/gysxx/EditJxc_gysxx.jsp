<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String gysbm=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;
String cwdm=null;
String kdlxtbz=null;
String lxdlsbcs=null;
String mmxgsj=null;
String mmsyzq=null;
String yxdlsbcs=null;
String sfsd=null;
String bz=null;
String gyslx=null;
String sfhz=null;
String cllx=null;

String yhzmc="";

String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cllx,gysbm,dqbm,gysmc,gysdz,gysfzr,gysdh,gyscz,email,yhdlm,yhkl,yhmc,cwdm,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd,bz,gyslx,sfhz ";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where  (gysbm="+wheregysbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cllx=cf.fillNull(rs.getString("cllx"));
		sfhz=cf.fillNull(rs.getString("sfhz"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		gysdz=cf.fillNull(rs.getString("gysdz"));
		gysfzr=cf.fillNull(rs.getString("gysfzr"));
		gysdh=cf.fillNull(rs.getString("gysdh"));
		gyscz=cf.fillNull(rs.getString("gyscz"));
		email=cf.fillNull(rs.getString("email"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		lxdlsbcs=cf.fillNull(rs.getString("lxdlsbcs"));
		mmxgsj=cf.fillNull(rs.getDate("mmxgsj"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		sfsd=cf.fillNull(rs.getString("sfsd"));
		bz=cf.fillNull(rs.getString("bz"));
		gyslx=cf.fillNull(rs.getString("gyslx"));
	}
	rs.close();
	ps.close();

	ls_sql="select yhzmc ";
	ls_sql+=" from  sq_yhssz,sq_yhz";
	ls_sql+=" where sq_yhssz.yhdlm='"+yhdlm+"' and sq_yhssz.yhzbh =sq_yhz.yhzbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yhzmc+=cf.fillNull(rs.getString("yhzmc"))+"��";
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
<form method="post" action="" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ӧ������</td>
  <td colspan="3"><input type="text" name="gysmc" size="50" maxlength="50"  value="<%=gysmc%>" >
    <input type="hidden" name="gysbm" size="10" maxlength="8"  value="<%=gysbm%>" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ����</td>
  <td>
<%
	cf.radioToken(out,"sfhz","Y+����&N+������",sfhz);
%>  </td>
  <td align="right"><span class="STYLE1">*</span>��Ӧ��������</td>
  <td><%
	cf.radioToken(out,"cllx","1+����&2+����&3+���ļ�����",cllx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%>
  </select></td>
  <td align="right" width="19%"><span class="STYLE1">*</span>��Ӧ������</td> 
  <td width="31%"><select name="gyslx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����Ʒ������&1+��湩����&2+���ù�����",gyslx);
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̵�ַ</td> 
  <td colspan="3"><input type="text" name="gysdz" size="50" maxlength="100"  value="<%=gysdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̸�����</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20"  value="<%=gysfzr%>" >  </td>
  <td align="right" width="19%">��Ӧ�̵绰</td> 
  <td width="31%"> 
    <input type="text" name="gysdh" size="20" maxlength="50"  value="<%=gysdh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20"  value="<%=cwdm%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̴���</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50"  value="<%=gyscz%>" >  </td>
  <td align="right" width="19%">EMail</td> 
  <td width="31%"> 
    <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><input type="text" name="bz" size="60" maxlength="100"  value="<%=bz%>" >  </td>
</tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">ϵͳ��Ȩ</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>�ɵ�½ϵͳ��־</td>
              <td><%
	cf.radioToken(out,"kdlxtbz","Y+�ɵ�½&N+���ɵ�½",kdlxtbz);
%></td>
              <td width="19%" rowspan="8" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td width="31%" rowspan="8"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="15" multiple>
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' and cxbz='N' order by cxbz,dwbh","select ssfgs from jxc_gyssqfgs where gysbm='"+wheregysbm+"'");
	}
	else{
		cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' and cxbz='N' and dqbm='"+dqbm+"' order by cxbz,dwbh","select ssfgs from jxc_gyssqfgs where gysbm='"+wheregysbm+"'");
	}
%>
              </select></td>
            </tr>
    <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�û���¼��</td> 
  <td width="32%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000FF">�û�����</font></td> 
  <td width="32%"><input type="text" name="yhkl" value="<%=yhkl%>" size="20" maxlength="50" readonly></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�û�����</td>
  <td><input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����</td>
  <td><%
	cf.radioToken(out,"sfsd","Y+������&N+δ����",sfsd);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʹ������</td>
  <td><input type="text" name="mmsyzq" size="20" maxlength="8"  value="<%=mmsyzq%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����½ʧ�ܴ���</td> 
  <td width="32%"><input type="text" name="yxdlsbcs" size="20" maxlength="8"  value="<%=yxdlsbcs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ѿ���½ʧ�ܴ���</td> 
  <td width="32%"><input type="text" name="lxdlsbcs" size="20" maxlength="8"  value="<%=lxdlsbcs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�û�������</td>
  <td colspan="3"><%=yhzmc%></td>
</tr>
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <p>
	    <input type="button"  value="����" onClick="f_do(editform)">
	    <input type="reset"  value="����">
	    <input name="button2" type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="�û���Ȩ" >
	    <input type="button"  value="��������" onClick="editform.yhkl.value='111111'" name="button">
	    </p>
	  <p>
	    <input type="button"  value="��Ʒ�ƹ�Ӧ�̶��ձ�" onClick="f_dzb(editform)" >
	    <input type="button"  value="¼����ϵ��" onClick="f_lr(editform)" name="lr" >
	    <input type="button"  value="�鿴��ϵ��" onClick="f_ck(editform)" name="ck" >
	  </p>
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhz)) {
		alert("��ѡ��[�Ƿ����]��");
		FormName.sfhz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cllx)) {
		alert("��ѡ��[��Ӧ��������]��");
		FormName.cllx[0].focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[��Ӧ������]��");
		FormName.gysmc.focus();
		return false;
	}
	if(!(isNumber(FormName.lxdlsbcs, "�Ѿ���½ʧ�ܴ���"))) {
		return false;
	}
	if(!(isNumber(FormName.mmsyzq, "����ʹ������"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "�����½ʧ�ܴ���"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfsd)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfsd[0].focus();
		return false;
	}
	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("��ѡ��[�ɵ�½ϵͳ��־]��");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(FormName.kdlxtbz[0].checked) 
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("������[�û���¼��]��");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhmc.focus();
			return false;
		}
	}
	else{
		FormName.yhdlm.value="";
		FormName.yhkl.value="";
		FormName.yhmc.value="";
	}

	FormName.target="";
	FormName.action="SaveEditJxc_gysxx.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_gyslxr.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jxc_gyslxrList.jsp";
	FormName.submit();
	return true;
}

function f_dzb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="InsertJxc_ppgysdzb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
