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

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��ѯ������ϸ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_gcdaCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
               �ֹ�˾              </td>
              <td width="33%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="change(this)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>              </td>
              <td width="17%" align="right"> 
               ǩԼ����              </td>
              <td width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">              </td>
              <td width="17%" align="right">�ͻ����</td>
              <td width="34%"> 
                <input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
               �ͻ�����              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">              </td>
              <td width="17%" align="right"> 
               ��ϵ��ʽ              </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">������ϸ</td>
              <td width="33%"> 
                <select name="damxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select damxbm,damxmc from dm_damxbm order by damxbm","");
%> 
                </select>              </td>
              <td width="17%" align="right">��������</td>
              <td width="34%"> 
                <input type="text" name="sl" size="20" maxlength="20" onKeyUp="keyGo(bgr)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
               ���ֹܷ�˾              </td>
              <td width="33%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"bgrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"bgrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%" align="right"> 
               ���ܵ�λ              </td>
              <td width="34%"> 
                <select name="bgrdw" id="bgrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
               ������              </td>
              <td width="33%"> 
                <input name="bgr" type="text" id="bgr" onKeyUp="keyGo(lrr)" size="20" maxlength="50">              </td>
              <td width="17%" align="right"> 
               ¼����              </td>
              <td width="34%"> 
                <input name="lrr" type="text" id="lrr"  onKeyUp="keyGo(lrsj)" size="20" maxlength="50">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
               ¼��ʱ��&nbsp;��              </td>
              <td width="33%"> 
                <input name="lrsj" type="text" id="lrsj" onKeyUp="keyGo(lrsj2)" size="20" maxlength="50">              </td>
              <td width="17%" align="right"> 
               ��              </td>
              <td width="34%"> 
                <input name="lrsj2" type="text" id="lrsj2"  onKeyUp="keyGo(khbh)" size="20" maxlength="50">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���������</td>
              <td><input name="dadbh" type="text" value="" size="20" maxlength="20"></td>
              <td align="right">�鵵��־</td>
              <td>
					<input type="radio" name="dalqbz" value="1">δ������
					<input type="radio" name="dalqbz" value="2">�ѽ�����
					<input type="radio" name="dalqbz" value="3">�ѹ鵵
				  </td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);
%>


function change(fromID) 
{
	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+fromID.value+"' order by ssfgs,dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{

	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
