<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mmdglxbm=null;
String mmdglxmc=null;
String tdjjl=null;
String jjfs=null;
String bz=null;
String wheremmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mmdglxbm,mmdglxmc,tdjjl,jjfs,bz ";
	ls_sql+=" from  jc_mmdglx";
	ls_sql+=" where  (mmdglxbm='"+wheremmdglxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mmdglxmc=cf.fillNull(rs.getString("mmdglxmc"));
		tdjjl=cf.fillNull(rs.getString("tdjjl"));
		jjfs=cf.fillNull(rs.getString("jjfs"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmdglx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><span class="STYLE1">*</span>ľ�Ŷ������ͱ���</div>              </td>
              <td width="33%"> 
                <input type="text" name="mmdglxbm" size="20" maxlength="2"  value="<%=mmdglxbm%>" >              </td>
              <td width="18%"> 
                <div align="right"><span class="STYLE1">*</span>ľ�Ŷ�����������</div>              </td>
              <td width="32%"> 
                <input type="text" name="mmdglxmc" size="20" maxlength="50"  value="<%=mmdglxmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>�Ƽ۷�ʽ</td>
              <td colspan="3"><%
	cf.radioToken(out, "jjfs","11+ľ��<BR>&12+˫���ƿ�<BR>&13+˫�ڴ���<BR>&14+�����ƿ�<BR>&15+���ڴ���<BR>&21+������<BR>&22+�Ŷ���<BR>&31+��Ʈ������<BR>&32+��Ʈ��ƽ̨�Ͽ�<BR>&41+ƽ���׼Ƽ�<BR>&42+���׼Ƽ�<BR>&43+�ֶ�ƽ���׼Ƽ�<BR>&44+�ֶ����׼Ƽ�<BR>&45+�ֶΰ����ȼƼ�",jjfs);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><span class="STYLE1">*</span>�ص��Ӽ���</div>              </td>
              <td width="33%"> 
                <input type="text" name="tdjjl" size="20" maxlength="9"  value="<%=tdjjl%>" >
                % </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wheremmdglxbm"  value="<%=wheremmdglxbm%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="33%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="32%" height="2"> 
                <input type="reset"  value="����">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("������[ľ�Ŷ������ͱ���]��");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxmc)=="") {
		alert("������[ľ�Ŷ�����������]��");
		FormName.mmdglxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("��ѡ��[�Ƽ۷�ʽ]��");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.tdjjl)=="") {
		alert("������[�ص��Ӽ���]��");
		FormName.tdjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.tdjjl, "�ص��Ӽ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
