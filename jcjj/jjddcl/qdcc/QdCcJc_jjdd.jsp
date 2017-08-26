<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhccsj=null;
String jhccxgsj=null;
String jhccxgyy=null;
String jjsjs=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jhccsj,jhccxgsj,jhccxgyy,jjsjs";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhccxgsj=cf.fillNull(rs.getDate("jhccxgsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
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

<html>
<head>
<title>�Ҿ߳���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��¼��</td>
	<td  width="10%">�������</td>
	<td  width="8%">�Ҿ����ʦ</td>
	<td  width="10%">�ƻ�����ʱ��</td>
	<td  width="10%">��ϵ���</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="34%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="select jlh,ddbh,jjsjs,jhclsj,DECODE(clzt,'03','δȷ��','05','ȷ��ʱ��'),lrr,lrsj,bz";
	ls_sql+=" from jc_jjsjslxjl ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by jlh";
	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%>
</table>

<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center"><strong>ȷ������ʱ�䣨������ţ�<%=ddbh%>��</strong> </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">��ϵ���</td>
              <td width="29%"><input type="radio" name="clzt" value="03">
				δȷ��
				<input type="radio" name="clzt" value="05">
				ȷ��ʱ�� </td>
              <td width="22%" align="right">�ƻ�����ʱ��</td>
              <td width="28%"><input type="text" name="jhccsj" size="20" maxlength="20"  value="<%=jhccsj%>" ondblclick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">�ƻ�����¼����</td>
              <td width="29%">
                <input type="text" name="jhccxgr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="22%" align="right">�ƻ�����¼��ʱ��</td>
              <td width="28%"> 
                <input type="text" name="jhccxgsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="jhccxgyy" cols="71" rows="3"><%=jhccxgyy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="hidden" name="jjsjs"  value="<%=jjsjs%>" >
                </div>              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
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
	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[��ϵ���]��");
		FormName.clzt[0].focus();
		return false;
	}
	if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.jhccsj)=="") {
			alert("������[�ƻ�����ʱ��]��");
			FormName.jhccsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhccsj, "�ƻ�����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.jhccsj.value="";
		if(	javaTrim(FormName.jhccxgyy)=="") {
			alert("������[��ע]��");
			FormName.jhccxgyy.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.jhccxgr)=="") {
		alert("������[�ƻ�����¼����]��");
		FormName.jhccxgr.focus();
		return false;
	}
	if(	javaTrim(FormName.jhccxgsj)=="") {
		alert("������[�ƻ�����¼��ʱ��]��");
		FormName.jhccxgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhccxgsj, "�ƻ�����¼��ʱ��"))) {
		return false;
	}

	FormName.action="SaveQdCcJc_jjdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
