<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwlx,dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �ڲ������������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_nbtsjlClList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">������¼��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_nbtsjl_tsjlh" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="crm_nbtsjl_clzt" value="1" checked>
                δ���� 
                <input type="radio" name="crm_nbtsjl_clzt" value="2">
                �ڴ��� 
                <input type="radio" name="crm_nbtsjl_clzt" value="3">
                �ѽ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_nbtsjl_btsr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_nbtsjl_tsr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�������ֹ�˾</td>
              <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"btsfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(btsfgs,btsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"btsfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
        out.println("        </select>");
	}
%> </td>
              <td width="18%" align="right">����������</td>
              <td width="32%"> 
                <select name="btsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N'  order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="crm_nbtsjl_tssj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_nbtsjl_tssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_nbtsjl_slr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_nbtsjl_slsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">¼��ֹ�˾</div>
              </td>
              <td width="33%"> 
                <select name="slfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(slfgs,crm_nbtsjl_slbm,<%=dwstr%>);">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">¼�벿��</div>
              </td>
              <td width="32%"> 
                <select name="crm_nbtsjl_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N'  order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">������</td>
              <td width="33%"> 
                <input type="text" name="crm_nbtsjl_clr" size="20" maxlength="20" >
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">����ʼʱ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_nbtsjl_clkssj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">�������ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_nbtsjl_cljssj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(!(isNumber(FormName.crm_nbtsjl_tsjlh, "Ͷ�߼�¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_tssj, "Ͷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_tssj2, "Ͷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_slsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_clkssj, "����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_cljssj, "�������ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
