<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String xh=null;

try {
	conn=cf.getConnection();

	//�Զ��������
	ls_sql="select NVL(max(TO_NUMBER(substr(xh,6,5)))+1,1)";
	ls_sql+=" from  rs_yggzjl";
	ls_sql+=" where lrbm='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getString(1);
	}
	rs.close();
	ps.close();
	xh=cf.addZero(xh,5);
	xh=dwbh+xh;

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if(rs!=null) rs.close();
		if (ps!= null) ps.close(); 
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
      <div align="center"> ���㹤�ʣ���ţ�<%=xh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��н����</td>
              <td width="35%"> 
                <input type="text" name="fxrq" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">��н��˾</td>
              <td width="35%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ʿ�ʼ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ksrq" value="<%=cf.firstDay(-1)%>" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">������ֹ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzrq" value="<%=cf.lastDay(-1)%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">¼����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000FF">¼��ʱ��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000FF">¼�벿��</font></td>
              <td width="35%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%" align="right">������������</td>
              <td width="35%"><input type="text" name="qqts" value="" size="20" maxlength="10" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="94"> 
                <p> 
                  <input type="hidden" name="xh" value="<%=xh%>" >
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="button"  value="��������" onClick="f_dcgz(insertform)" name="dcgz" disabled>
                  <input type="button"  value="���빤��" onClick="f_drgz(insertform)" name="drgz" disabled>
                  <input type="reset"  value="����" name="reset">
                </p>
                <p> 
                  <input type="button"  value="�Զ����㹤��" onClick="f_jsgz(insertform)" name="jsgz" disabled>
                  <input type="button"  value="�鿴����" onClick="f_ckgz(insertform)" name="ckgz" >
                </p>
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
	if(	javaTrim(FormName.fxrq)=="") {
		alert("������[��н����]��");
		FormName.fxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.fxrq, "��н����"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[��н��˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ksrq)=="") {
		alert("������[���ʿ�ʼ����]��");
		FormName.ksrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.ksrq, "���ʿ�ʼ����"))) {
		return false;
	}
	if(	javaTrim(FormName.zzrq)=="") {
		alert("������[������ֹ����]��");
		FormName.zzrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zzrq, "������ֹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.qqts)=="") {
		alert("��ѡ��[������������]��");
		FormName.qqts.focus();
		return false;
	}
	if(!(isFloat(FormName.qqts, "������������"))) {
		return false;
	}

	FormName.action="SaveInsertRs_yggzjl.jsp";
	FormName.submit();
	FormName.dcgz.disabled=false;
	FormName.drgz.disabled=false;
	return true;
}
function f_dcgz(FormName)//����FormName:Form������
{

	FormName.action="expGz.jsp";
	FormName.submit();
	FormName.jsgz.disabled=false;
	return true;
}
function f_drgz(FormName)//����FormName:Form������
{

	FormName.action="loadData.jsp";
	FormName.submit();
	FormName.jsgz.disabled=false;
	return true;
}
function f_xggz(FormName)//����FormName:Form������
{

	FormName.action="editGz.jsp";
	FormName.submit();
	FormName.jsgz.disabled=false;
	return true;
}
function f_jsgz(FormName)//����FormName:Form������
{

	FormName.action="jsGz.jsp";
	FormName.submit();
	FormName.ckgz.disabled=false;
	return true;
}
function f_ckgz(FormName)//����FormName:Form������
{

	FormName.action="ckGz.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
