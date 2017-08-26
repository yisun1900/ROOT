<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qcdm=null;
String qcph=null;
String sjxm=null;
String ssfgs=null;
String yxsgls=null;
String qcxh=null;
String bz=null;
String gcsj=null;

String whereqcdm=cf.GB2Uni(request.getParameter("qcdm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select qcdm,qcph,sjxm,ssfgs,qcxh,yxsgls,gcsj,bz ";
	ls_sql+=" from  xz_qcdm";
	ls_sql+=" where  (qcdm='"+whereqcdm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qcdm=cf.fillNull(rs.getString("qcdm"));
		qcph=cf.fillNull(rs.getString("qcph"));
		sjxm=cf.fillNull(rs.getString("sjxm"));
		qcxh=cf.fillNull(rs.getString("qcxh"));
		gcsj=cf.fillNull(rs.getDate("gcsj"));
		yxsgls=cf.fillNull(rs.getString("yxsgls"));

		bz=cf.fillNull(rs.getString("bz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

<form method="post" action="SaveEditXz_qcdm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qcdm" size="20" maxlength="6"  value="<%=qcdm%>" >
              </td>
              <td width="15%"> 
                <div align="right">�����ƺ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qcph" size="20" maxlength="12"  value="<%=qcph%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">˾������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjxm" size="20" maxlength="8"  value="<%=sjxm%>" >
              </td>
              <td width="15%"> 
                <div align="right">�����ͺ�</div>
              </td>
              <td width="35%">
                <input type="text" name="qcxh" size="20" maxlength="30"  value="<%=qcxh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%">
                <input type="text" name="gcsj" size="20" maxlength="10"  value="<%=gcsj%>" >
              </td>
              <td width="15%"> 
                <div align="right">����ʹ������</div>
              </td>
              <td width="35%">
                <input type="text" name="yxsgls" size="20" maxlength="8"  value="<%=yxsgls%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3">
                <textarea name="bz" cols="82" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����ֹ�˾</div>
              </td>
              <td width="35%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0'",ssfgs);
%>
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <input type="hidden" name="whereqcdm"  value="<%=whereqcdm%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
              </td>
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
	if(	javaTrim(FormName.qcdm)=="") {
		alert("������[��������]��");
		FormName.qcdm.focus();
		return false;
	}
	if(	javaTrim(FormName.qcph)=="") {
		alert("������[�����ƺ�]��");
		FormName.qcph.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(!(isDatetime(FormName.gcsj, "����ʱ��"))) {
	return false;
}
	if(!(isFloat(FormName.yxsgls, "��ʹ������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
