<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String azr=null;
String sazrq=null;
String azsm=null;
String aztzr=null;
String kazsj=null;
String jhazrq=null;
String aztzsj=null;
String ksazsj=null;
String ycyybm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ksazsj,ycyybm,azr,sazrq,azsm,aztzr,kazsj,aztzsj,jhazrq";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ycyybm=cf.fillNull(rs.getString("ycyybm"));
		ksazsj=cf.fillNull(rs.getDate("ksazsj"));
		azr=cf.fillNull(rs.getString("azr"));
		sazrq=cf.fillNull(rs.getDate("sazrq"));
		azsm=cf.fillNull(rs.getString("azsm"));
		aztzr=cf.fillNull(rs.getString("aztzr"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
		jhazrq=cf.fillNull(rs.getDate("jhazrq"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
	}

	if (ksazsj.equals(""))
	{
		ksazsj=cf.today();
	}
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
<title>��װ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">��װ��������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">Э�̰�װʱ��</span></td>
              <td width="29%"><input type="text" name="kazsj" size="20" maxlength="20"  value="<%=kazsj%>" readonly></td>
              <td width="21%" align="right"><span class="STYLE1">��ͬ��װʱ��</span></td>
              <td width="29%"><input type="text" name="jhazrq" size="20" maxlength="10"  value="<%=jhazrq%>" readonly></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">����װ֪ͨ��</span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="aztzr" size="20" maxlength="20"  value="<%=aztzr%>" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">����װ֪ͨʱ��</span></td>
              <td bgcolor="#FFFFFF"><input type="text" name="aztzsj" value="<%=aztzsj%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF">��װ��Ϣ¼����</td>
              <td bgcolor="#E8E8FF"><input type="text" name="azr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td align="right" bgcolor="#E8E8FF">��װ״̬</td>
              <td bgcolor="#E8E8FF"><%
	cf.radioToken(out, "clzt","31+���ڰ�װ&33+��װ���","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF">��װ��ʼʱ��</td>
              <td bgcolor="#E8E8FF"><input type="text" name="ksazsj" size="20" maxlength="10" value="<%=ksazsj%>" ondblclick="JSCalendar(this)"></td>
              <td align="right" bgcolor="#E8E8FF">��װ���ʱ��</td>
              <td bgcolor="#E8E8FF"><input type="text" name="sazrq" size="20" maxlength="20"  value="<%=sazrq%>" ondblclick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">�ӳ�ԭ��</td>
              <td><select name="ycyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",ycyybm);
%>
                </select>              </td>
              <td bgcolor="#E8E8FF" align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#E8E8FF">��װ˵��</td>
              <td colspan="3" bgcolor="#E8E8FF"> 
                <textarea name="azsm" cols="71" rows="3"><%=azsm%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="center" height="51"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset" name="Reset" value="����">
                <input type="button"  value="¼�밲װ��¼" onClick="f_lraz(insertform)" name="lraz" disabled>
                <input type="button"  value="�鿴��װ��¼" onClick="f_ckaz(insertform)" name="ckaz" disabled>
                <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
              </td>
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
	if(	javaTrim(FormName.azr)=="") {
		alert("������[��װ��]��");
		FormName.azr.focus();
		return false;
	}

	if(	javaTrim(FormName.ksazsj)=="") {
		alert("������[��װ��ʼʱ��]��");
		FormName.ksazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ksazsj, "��װ��ʼʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[��װ״̬]��");
		FormName.clzt[0].focus();
		return false;
	}

	if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.sazrq)=="") {
			alert("������[��װ���ʱ��]��");
			FormName.sazrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.sazrq, "��װ���ʱ��"))) {
			return false;
		}

		if (FormName.sazrq.value>FormName.jhazrq.value)
		{
			if(	javaTrim(FormName.ycyybm)=="") {
				alert("������[�ӳ�ԭ��]��");
				FormName.ycyybm.focus();
				return false;
			}
			if(	javaTrim(FormName.azsm)=="") {
				alert("������[��װ˵��]��");
				FormName.azsm.focus();
				return false;
			}
		}
		else{
			FormName.ycyybm.value="";
		}
	}
	else{
		FormName.sazrq.value="";
		FormName.ycyybm.value="";
	}

	FormName.action="SaveAzJc_jjdd.jsp";
	FormName.submit();
	FormName.lraz.disabled=false;
	FormName.ckaz.disabled=false;
	return true;
}

function f_lraz(FormName)//����FormName:Form������
{

	FormName.action="InsertJc_jjazjl.jsp";
	FormName.submit();
	return true;
}

function f_ckaz(FormName)//����FormName:Form������
{

	FormName.action="Jc_jjazjlList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
