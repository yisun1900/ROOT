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
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;

String tdjxh=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();

	//�˶������
	int count=0;
	ls_sql="select NVL(max(substr(tdjxh,8,2)),0)";
	ls_sql+=" from  crm_tdjdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	
	tdjxh=khbh+cf.addZero(count+1,2);
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
      <div align="center"> �˶���Ǽ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_tdjdj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�˶������</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="tdjxh" value="<%=tdjxh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">���ݵ�ַ</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="fwdz" value="<%=fwdz%>" size="20" maxlength="100" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�绰</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="dh" value="<%=lxfs%>" size="20" maxlength="100" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">���ʦ</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�˶���ԭ��</div>
              </td>
              <td width="35%"> 
                <select name="tdjyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tdjyybm,tdjyymc from dm_tdjyybm order by tdjyybm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�˶���ԭ��˵��</td>
              <td colspan="3"> 
                <textarea name="tdjyysm" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">Ӧ�˽��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ytje" value="" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">ʵ�˽��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="stje" value="" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�˶���ʱ��</td>
              <td width="35%"> 
                <input type="text" name="tdjsj" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">�˶��������</td>
              <td width="35%"> 
                <input type="text" name="tdjblr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">¼�뵥λ</font></div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">¼����</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.tdjxh)=="") {
		alert("������[�˶������]��");
		FormName.tdjxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�绰]��");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.tdjyybm)=="") {
		alert("��ѡ��[�˶���ԭ��]��");
		FormName.tdjyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tdjyysm)=="") {
		alert("��ѡ��[�˶���ԭ��˵��]��");
		FormName.tdjyysm.focus();
		return false;
	}
	if(	javaTrim(FormName.ytje)=="") {
		alert("��ѡ��[Ӧ�˽��]��");
		FormName.ytje.focus();
		return false;
	}
	if(!(isFloat(FormName.ytje, "Ӧ�˽��"))) {
		return false;
	}
	if(	javaTrim(FormName.stje)=="") {
		alert("��ѡ��[ʵ�˽��]��");
		FormName.stje.focus();
		return false;
	}
	if(!(isFloat(FormName.stje, "ʵ�˽��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdjsj)=="") {
		alert("��ѡ��[�˶���ʱ��]��");
		FormName.tdjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tdjsj, "�˶���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.tdjblr)=="") {
		alert("��ѡ��[�˶��������]��");
		FormName.tdjblr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.dwbh.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
