<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">  �޸�����طü�¼ </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_hfjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �طü�¼��              </td>
              <td width="30%"> 
              <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="9" >              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �ͻ����              </td>
              <td width="30%"> 
              <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                �ͻ�����              </td>
              <td width="32%"> 
              <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="30%"> 
              <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td width="18%" align="right"> 
                ��ϵ��ʽ              </td>
              <td width="32%"> 
              <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ����ʽ              </td>
              <td width="30%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+���账��&1+������ز���","");
%> 
              </select>              </td>
              <td width="18%" align="right"> 
                ��������              </td>
              <td width="32%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql=null;

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	}
	cf.selectItem(out,sql,"");
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����״̬</td>
              <td width="30%"><select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="Y">��ز����Ѵ���</option>
                <option value="N">��ز���δ����</option>
              </select></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �ط�ʱ�� ��              </td>
              <td width="30%"> 
              <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                ��              </td>
              <td width="32%"> 
              <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�طò���</td>
              <td width="30%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
              </select>              </td>
              <td width="18%" align="right">�ط���</td>
              <td width="32%"> 
              <input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_hfjl_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
