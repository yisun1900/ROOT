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
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double cjjsj=0;
double gdj=0;
String sfrk="N";
String ckmc="";

try {
	conn=cf.getConnection();

	ls_sql=" SELECT cjjsj,gdj,sfrk,ckmc";
	ls_sql+=" FROM cl_jgmx ";
	ls_sql+=" where cl_jgmx.dwbh='"+dwbh+"' and cl_jgmx.clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cjjsj=rs.getDouble("cjjsj");
		gdj=rs.getDouble("gdj");

		sfrk=cf.fillNull(rs.getString("sfrk"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  >
<div align="center">��¼����ϼ۸�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>�ֹ�˾</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>����</td>
      <td colspan="3">
	  <select name="clbm" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	cf.selectItem(out,"select clbm,trim(clbm)||'��'||clmc||'��'||clgg||'��' from cl_clbm where clbm='"+clbm+"'","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>���Ӽ�</td>
      <td width="30%">
		<input type="text" name="gdj" value="<%=gdj%>" size="20" maxlength="17" >	  
	  </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    

    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font><font color="#0000CC">������</font></td>
      <td width="30%"> 
        <input type="text" name="tzr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font><font color="#0000CC">����ʱ��</font></td>
      <td width="30%"> 
        <input type="text" name="tzsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="hidden" name="sfrk" value="<%=sfrk%>" size="20" maxlength="17" >
		<input type="hidden" name="cjjsj" value="<%=cjjsj%>" size="20" maxlength="17" >
		<input type="hidden" name="ckmc" value="<%=ckmc%>" size="20" maxlength="50" >

        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ϱ���]��");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cjjsj)=="") {
		alert("������[�볧�ҽ����]��");
		FormName.cjjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.cjjsj, "�볧�ҽ����"))) {
		return false;
	}
	if(	javaTrim(FormName.gdj)=="") {
		alert("������[���Ӽ�]��");
		FormName.gdj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdj, "���Ӽ�"))) {
		return false;
	}

/*	
	if(	!radioChecked(FormName.sfrk)) {
		alert("��ѡ��[�Ƿ����]��");
		FormName.sfrk[0].focus();
		return false;
	}
	if (FormName.sfrk[0].checked)
	{
		if(	javaTrim(FormName.ckmc)=="") {
			alert("������[�ֿ�����]��");
			FormName.ckmc.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.ckmc)!="") {
			alert("����Ҫ����[�ֿ�����]��");
			FormName.ckmc.select();
			return false;
		}
	}
*/
	if(	javaTrim(FormName.tzr)=="") {
		alert("������[������]��");
		FormName.tzr.focus();
		return false;
	}
	if(	javaTrim(FormName.tzsj)=="") {
		alert("������[����ʱ��]��");
		FormName.tzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzsj, "����ʱ��"))) {
		return false;
	}

	
	FormName.action="SaveInsertCl_jgmx.jsp";
	FormName.submit();
	return true;
}


function f_exp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ExpCl_jgmx.jsp";
	FormName.submit();
	return true;

}

function f_drnew(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ImpAddData.jsp";
	FormName.submit();
	return true;

}

function f_edit(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ImpEditData.jsp";
	FormName.submit();
	return true;

}

//-->
</SCRIPT>