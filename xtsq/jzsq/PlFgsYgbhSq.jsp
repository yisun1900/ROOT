<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010211")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="100%"> 
      <div align="center"><font color="#000099"><b>�ͻ�������Ȩ</b></font> 
      </div>
    </td>
  </tr>
  <tr> 
    <td colspan="2" align="center"> 
      <input type="button"  value="����" onClick="f_do(insertform)">
      <input type="reset"  value="����" name="reset">
    </td>
  </tr>
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="SavePlFgsYgbhSq.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right"><font color="#CC0000">*</font>�ͻ�������Ȩ��Χ</td>
              <td width="59%">
<%
	cf.radioToken(out, "kfgssq","1+��Ȩ�����ֹ�˾<BR>&2+��Ȩ����ֹ�˾","");
%>
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right"> <font color="#000099"><b></b></font> 
                <font color="#CC0000">*</font>��ѡ��ֹ�˾���ɶ�ѡ��<BR>
              </td>
              <td width="59%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:252PX" size="30" multiple>
                  <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx in('A0','F0') order by cxbz,dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh"  value="<%=ygbh[i]%>" >
		<%
	}
%>
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
	if(	!radioChecked(FormName.kfgssq)) {
		alert("��ѡ��[�ͻ�������Ȩ��Χ]��");
		FormName.kfgssq[0].focus();
		return false;
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("������[��Ȩ�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
