<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String) session.getAttribute("dwbh");
String yhjs=(String) session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="95%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr> 
    <td width="95%" height="64"> 
      <div align="center"> 
        <form method="post" action="Dm_zpxsList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ҵ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%" align="right">�������� ��</td>
              <td width="35%"> 
                <input type="text" name="xsrq" size="20" maxlength="10"  onKeyUp="keyGo(xsrq2)">
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="xsrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xh" size="20" maxlength="16" >
              </td>
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zpbm" size="20" maxlength="13" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ڲֿ�</div>
              </td>
              <td width="35%"> 
                <select name="ckbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	if (yhjs.equals("00"))//00���ܹ�˾
	{
		out.println("<option value=''></option>");
		cf.selectItem(out,"select ckbm,ckmc from xt_ckxx where cklx='09' order by ckbm","");
	}
	else if (yhjs.equals("02"))//02���ֹ�˾
	{
		cf.selectItem(out,"select ckbm,ckmc from xt_ckxx where cklx='09' and dwbh in(select dwbh,dwmc from sq_dwxx where dwlx in('2','3') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"') order by ckbm","");
	}
	else if (yhjs.equals("01"))//01��ר����
	{
		cf.selectItem(out,"select ckbm,ckmc from xt_ckxx where cklx='09' and dwbh='"+dwbh+"' order by ckbm","");
	}
	else if (yhjs.equals("03"))//03��������
	{
		cf.selectItem(out,"select ckbm,ckmc from xt_ckxx where cklx='09' and dwbh in(select dwbh,dwmc from sq_dwxx where dwlx in('4','8') and ssdw='"+dwbh+"' or  dwbh='"+dwbh+"') order by ckbm","");
	}
	else if (yhjs.equals("04"))//04������ר����
	{
		cf.selectItem(out,"select ckbm,ckmc from xt_ckxx where cklx='09' and dwbh='"+dwbh+"' order by ckbm","");
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">Ʒ������</div>
              </td>
              <td width="35%"> 
                <select name="plbm" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select plbm,plmc from xt_plbm where pllb='2'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" size="20" maxlength="16" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="djzl" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <select name="zplx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+��Ʒת��&2+��Ʒ","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="��ѯ" onClick="submit_onclick(selectform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
function submit_onclick(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.xsrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xsrq2, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.djzl, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
