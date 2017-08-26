<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%

String xcpbm=null;
String xcpmc=null;
String xcpflbm=null;
String jldw=null;
String dj=null;
String sfxsp=null;
String xh=null;
String bz=null;
String wherexcpbm=cf.GB2Uni(request.getParameter("xcpbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xcpbm,xcpmc,xcpflbm,jldw,dj,sfxsp,xh,bz ";
	ls_sql+=" from  oa_xcpbm";
	ls_sql+=" where  (xcpbm='"+wherexcpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcpbm=cf.fillNull(rs.getString("xcpbm"));
		xcpmc=cf.fillNull(rs.getString("xcpmc"));
		xcpflbm=cf.fillNull(rs.getString("xcpflbm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=cf.fillNull(rs.getString("dj"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditOa_xcpbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>ӡˢƷ����</td>
      <td width="31%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflmc",xcpflbm);
%> 
        </select>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>�Ƿ�������</td>
      <td width="31%"><%
	cf.radioToken(out, "sfxsp","N+����Ҫ&Y+��Ҫ",sfxsp);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>ӡˢƷ���루6λ��</td>
      <td width="31%"> 
        <input type="text" name="xcpbm" size="20" maxlength="6"  value="<%=xcpbm%>" >
      </td>
      <td align="right" rowspan="4" width="19%"><font color="#CC0000">*</font>����ȡ�ֹ�˾</td>
      <td rowspan="4" width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="7" multiple>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","select fgsbh from oa_xcplqfw where xcpbm='"+xcpbm+"'");
	}
	else{
		cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"' OR dwlx in('A0')","select fgsbh from oa_xcplqfw where xcpbm='"+xcpbm+"'");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>ӡˢƷ����</td>
      <td width="31%"> 
        <input type="text" name="xcpmc" size="20" maxlength="50"  value="<%=xcpmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������λ</td>
      <td width="31%"> 
        <input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>����</td>
      <td width="31%"> 
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���</td>
      <td width="31%"> 
        <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherexcpbm"  value="<%=wherexcpbm%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
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
	if(	javaTrim(FormName.xcpflbm)=="") {
		alert("��ѡ��[ӡˢƷ����]��");
		FormName.xcpflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxsp)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxsp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xcpbm)=="") {
		alert("������[ӡˢƷ����]��");
		FormName.xcpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpmc)=="") {
		alert("������[ӡˢƷ����]��");
		FormName.xcpmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.xh, "�������"))) {
		return false;
	}

	if(	!selectChecked(FormName.fgsbh)) {
		alert("������[����ȡ�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
