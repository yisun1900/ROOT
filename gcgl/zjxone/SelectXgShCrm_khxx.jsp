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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���̿ۿ�--�޸����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxXgShList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ֹ�˾</td>
              <td width="33%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_zjxdj_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
              <td width="18%" align="right">ǩԼ����</td>
              <td width="32%"> 
                <select name="crm_zjxdj_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_zjxxh" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crhth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_khbh" size="20" maxlength="7" >
              </td>
              <td width="18%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_khxm" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">�绰</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_dh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_zjxdj_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssdw='"+ssfgs+"' order by sgdmc","");
	}
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">ʩ������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_sgbz" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">¼�뵥λ</td>
              <td width="33%"> 
                <select name="crm_zjxdj_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="18%" align="right">¼����</td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�������ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="fssj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="fssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">������ԭ��</div>
              </td>
              <td width="33%"> 
                <select name="crm_zjxdj_zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">���������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_zjxdj_zjje" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">������˵��</td>
              <td width="33%"> 
                <input type="text" name="crm_zjxdj_zjxyysm" size="20" value="">
              </td>
              <td width="18%" align="right">�����׶�</td>
              <td width="32%"> 
                <select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��������ɱ�־</td>
              <td width="33%"> 
                <input type="radio" name="zjxwcbz" value="2" checked>
                ����� </td>
              <td width="18%" align="right">���̿ۿ�������־</td>
              <td width="32%"> 
                <input type="radio" name="gckkspbz" value="Y" checked>
                ������ </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
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
	if(!(isFloat(FormName.crm_zjxdj_zjje, "���������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjxdj_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjxdj_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
