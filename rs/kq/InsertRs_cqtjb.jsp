<%@ page contentType="text/html;charset=GBK" %>
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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="nian" value="<%=cf.getDataStr(cf.addMonth(-1),"YYYY")%>" size="20" maxlength="4" >              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="yue" value="<%=cf.getDataStr(cf.addMonth(-1),"MM")%>" size="20" maxlength="2" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�����ֹ�˾</td>
              <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              </select></td>
              <td align="right">��������</td>
              <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}

%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">Ա������</td>
              <td width="35%"><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx  where sfzszg in('Y','N') and dwbh='"+dwbh+"' ","");
	}
	else{
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx  where sfzszg in('Y','N') and ssfgs='"+ssfgs+"' ","");
	}
%>
              </select></td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ȫ������</td>
              <td width="35%"> 
                <input type="text" name="qqts" value="" size="20" maxlength="8" >              </td>
              <td width="15%" align="right">��������</td>
              <td width="35%"> 
                <input type="text" name="cqts" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="button"  value="��������ͳ�Ʊ�" onClick="f_dc(insertform)" >
                <input type="button"  value="�������ͳ�Ʊ�" onClick="f_dr(insertform)" >
                <input type="button"  value="�鿴����ͳ�Ʊ�" onClick="f_ck(insertform)" >
                <input type="reset"  value="����" name="reset">              </td>
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
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("������[��]��");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��������]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա������]��");
		FormName.ygbh.focus();
		return false;
	}

	if(	javaTrim(FormName.qqts)=="") {
		alert("������[ȫ������]��");
		FormName.qqts.focus();
		return false;
	}
	if(!(isNumber(FormName.qqts, "ȫ������"))) {
		return false;
	}
	if(	javaTrim(FormName.cqts)=="") {
		alert("������[��������]��");
		FormName.cqts.focus();
		return false;
	}
	if(!(isNumber(FormName.cqts, "��������"))) {
		return false;
	}

	FormName.action="SaveInsertRs_cqtjb.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("������[��]��");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.action="expCqtjb.jsp";
	FormName.submit();
	return true;
}
function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("������[��]��");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.action="loadData.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("������[��]��");
		FormName.yue.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.action="Rs_cqtjbCkList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
