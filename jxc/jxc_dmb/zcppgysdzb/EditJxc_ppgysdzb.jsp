<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String gysbm=null;
String gysmc=null;


String yhdlm=null;
String yhkl=null;
String yhmc=null;
String kdlxtbz=null;
String lxdlsbcs=null;
String mmxgsj=null;
String mmsyzq=null;
String yxdlsbcs=null;
String sfsd=null;


String yhzmc="";

String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String sfxcl=null;
double tcycf=0;
String sfkgtcsl=null;


String whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
String wheregysbm=cf.GB2Uni(request.getParameter("gysbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,gysbm,gysmc,yhdlm,yhkl,yhmc,kdlxtbz,lxdlsbcs,mmxgsj,mmsyzq,yxdlsbcs,sfsd,sfyyh,yhkssj,yhjzsj,yhnr,sfkgtcsl,sfxcl,tcycf";
	ls_sql+=" from  jxc_ppgysdzb";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		lxdlsbcs=cf.fillNull(rs.getString("lxdlsbcs"));
		mmxgsj=cf.fillNull(rs.getDate("mmxgsj"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		sfsd=cf.fillNull(rs.getString("sfsd"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		sfkgtcsl=cf.fillNull(rs.getString("sfkgtcsl"));
		sfxcl=cf.fillNull(rs.getString("sfxcl"));
		tcycf=rs.getDouble("tcycf");
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
<form method="post" action="SaveEditJxc_ppgysdzb.jsp" name="editform">
<div align="center">���ģ���Ʒ�ƹ�Ӧ�̶��ձ��޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ֹ�˾</td>
  <td width="31%" >
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td width="18%" >&nbsp;</td>
  <td width="34%" >&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span>��Ʒ��</td> 
  <td colspan="3" > 
    <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX">
   <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where ppbm='"+ppbm+"'",ppbm);
%>
  </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ӧ��</td>
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','��������','N','����������') from jxc_gysxx where jxc_gysxx.cllx='1'  and dqbm in(select dqbm from sq_dwxx where dwbh='"+ssfgs+"') order by sfhz desc,gysmc",gysbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ������</td>
  <td><%
	cf.radioToken(out, "sfxcl","Y+��Ҫ&N+��",sfxcl);
%></td>
  <td align="right">�Ƿ�ɸ��ײ�����</td>
  <td><%
	cf.radioToken(out, "sfkgtcsl","Y+����&N+��",sfkgtcsl);
%></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ����Ż�</td>
  <td><%
	cf.radioToken(out, "sfyyh","N+��&Y+��",sfyyh);
%>  </td>
  <td align="right">�ײ�Զ�̷�</td>
  <td><input type="text" name="tcycf" value="<%=tcycf%>" size="20" maxlength="16"  ></td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Żݿ�ʼʱ��</td>
  <td><input type="text" name="yhkssj" value="<%=yhkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�Żݽ���ʱ��</td>
  <td><input type="text" name="yhjzsj" value="<%=yhjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">�Ż�����</td>
  <td colspan="3"><textarea name="yhnr" cols="70" rows="3"><%=yhnr%></textarea>  </td>
</tr>



            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4">ϵͳ��Ȩ</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>�ɵ�½ϵͳ��־</td>
              <td><%
	cf.radioToken(out,"kdlxtbz","Y+�ɵ�½&N+���ɵ�½",kdlxtbz);
%></td>
              <td width="18%" align="right">�û�����</td>
              <td width="34%"><input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" ></td>
            </tr>
    <tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�û���¼��</td> 
  <td width="31%"> 
    <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >  </td>
  <td width="18%" align="right"><font color="#0000FF">�û�����</font></td>
    <td width="34%"><input type="text" name="yhkl" value="<%=yhkl%>" size="20" maxlength="50" readonly>
	<BR><%=cf.makejm(yhkl)%></td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����</td>
  <td><%
	cf.radioToken(out,"sfsd","Y+������&N+δ����",sfsd);
%></td>
  <td width="18%" align="right">����ʹ������</td>
  <td width="34%"><input type="text" name="mmsyzq" size="20" maxlength="8"  value="<%=mmsyzq%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�����½ʧ�ܴ���</td> 
  <td width="31%"><input type="text" name="yxdlsbcs" size="20" maxlength="8"  value="<%=yxdlsbcs%>" ></td>
  <td width="18%" align="right">�Ѿ���½ʧ�ܴ���</td>
  <td width="34%"><input type="text" name="lxdlsbcs" size="20" maxlength="8"  value="<%=lxdlsbcs%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�û�������</td>
  <td colspan="3"><%=yhzmc%></td>
</tr>
<input type="hidden" name="whereppbm"  value="<%=whereppbm%>" >
<input type="hidden" name="wheregysbm"  value="<%=wheregysbm%>" >
    <tr> 
      <td colspan="6" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	  <input name="button2" type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="�û���Ȩ" >
      <input type="button"  value="��������" onClick="editform.yhkl.value='111111'" name="button">
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("������[��Ʒ�Ʊ���]��");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "��Ʒ�Ʊ���"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
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
	
	
	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("������[�Żݿ�ʼʱ��]��");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "�Żݿ�ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("������[�Żݽ���ʱ��]��");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "�Żݽ���ʱ��"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[�Żݿ�ʼʱ��]���ܴ���[�Żݽ���ʱ��]��");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("������[�Ż�����]��");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}


	if(!(isFloat(FormName.tcycf, "�ײ�Զ�̷�"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxcl)) {
		alert("��ѡ��[�Ƿ������]��");
		FormName.sfxcl[0].focus();
		return false;
	}
	
	
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
