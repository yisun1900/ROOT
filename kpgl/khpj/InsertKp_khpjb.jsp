<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,sgbz,zjxm,hth,sjkgrq,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ͻ����۱�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_khpjb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="33%"> <%=khbh%> 
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">��ͬ��</font></div>
              </td>
              <td width="33%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="33%"> <%=khxm%>��<%=lxfs%>�� </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">ǩԼ����</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">���ݵ�ַ</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">���ʦ</font></div>
              </td>
              <td width="33%"> <%=sjs%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">�ʼ�Ա</font></div>
              </td>
              <td width="33%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">ʩ����</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">ʩ������</font></div>
              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
              <td width="33%"> <%=sjkgrq%> </td>
              <td width="17%" align="right"><font color="#0000CC">ʵ��������</font></td>
              <td width="33%"> <%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sgzl"  value="1">
                ���� 
                <input type="radio" name="sgzl"  value="2">
                �������� 
                <input type="radio" name="sgzl"  value="3">
                ������ </td>
              <td width="17%"> 
                <div align="right"></div>
              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="gcjd"  value="1">
                ���� 
                <input type="radio" name="gcjd"  value="2">
                �������� 
                <input type="radio" name="gcjd"  value="3">
                ������ </td>
              <td width="17%"> 
                <div align="right">��������ʩ���̶�</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="wmsgcd"  value="1">
                ���� 
                <input type="radio" name="wmsgcd"  value="2">
                �������� 
                <input type="radio" name="wmsgcd"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ʩ�����������</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="ctfw"  value="1">
                ���� 
                <input type="radio" name="ctfw"  value="2">
                �������� 
                <input type="radio" name="ctfw"  value="3">
                ������ </td>
              <td width="17%"> 
                <div align="right">��˾���Ͳ���</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="pscl"  value="1">
                ���� 
                <input type="radio" name="pscl"  value="2">
                �������� 
                <input type="radio" name="pscl"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ʩ���Ӵ������</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="dmcl"  value="1">
                ���� 
                <input type="radio" name="dmcl"  value="2">
                �������� 
                <input type="radio" name="dmcl"  value="3">
                ������ </td>
              <td width="17%"> 
                <div align="right">���Ч��</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sjxg"  value="1">
                ���� 
                <input type="radio" name="sjxg"  value="2">
                �������� 
                <input type="radio" name="sjxg"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��Ʒ���</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="sjfw"  value="1">
                ���� 
                <input type="radio" name="sjfw"  value="2">
                �������� 
                <input type="radio" name="sjfw"  value="3">
                ������ </td>
              <td width="17%"> 
                <div align="right">�������</div>
              </td>
              <td width="33%"> 
                <input type="radio" name="jlfw"  value="1">
                ���� 
                <input type="radio" name="jlfw"  value="2">
                �������� 
                <input type="radio" name="jlfw"  value="3">
                ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sgzl)) {
		alert("��ѡ��[ʩ������]��");
		FormName.sgzl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.gcjd)) {
		alert("��ѡ��[���̽���]��");
		FormName.gcjd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.wmsgcd)) {
		alert("��ѡ��[��������ʩ���̶�]��");
		FormName.wmsgcd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ctfw)) {
		alert("��ѡ��[ʩ�����������]��");
		FormName.ctfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.pscl)) {
		alert("��ѡ��[��˾���Ͳ���]��");
		FormName.pscl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.dmcl)) {
		alert("��ѡ��[ʩ���Ӵ������]��");
		FormName.dmcl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjxg)) {
		alert("��ѡ��[���Ч��]��");
		FormName.sjxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjfw)) {
		alert("��ѡ��[��Ʒ���]��");
		FormName.sjfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jlfw)) {
		alert("��ѡ��[�������]��");
		FormName.jlfw[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
