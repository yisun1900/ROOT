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
String yhjs=(String)session.getAttribute("yhjs");
String zgsbh=(String)session.getAttribute("zgsbh");
if (yhjs.equals("00"))//00���ܹ�˾
{
	dwbh=zgsbh;
}
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
        <form method="post" action="Dm_thjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�˻���¼��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thjlh" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cpbm" size="20" maxlength="13" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�˻���λ</div>
              </td>
              <td width="35%"> 
                <select name="thdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�˻����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thj" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�˻�ԭ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thyy" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">�˻�����</div>
              </td>
              <td width="35%"> 
                <select name="thbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <option value="0">�����˻�</option>
                  <option value="1">��껻��</option>
                  <option value="2">����˻�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�˻����� ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="thrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%">
                <input type="text" name="thrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">��Ա���</td>
              <td width="35%">
                <input type="text" name="khbh" size="20" maxlength="50" >
              </td>
              <td width="15%" align="right">�ͻ�����</td>
              <td width="35%">
                <select name="khlx" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="1">��Ա</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ҵ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ywxh" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">���۵�λ</div>
              </td>
              <td width="35%"> 
                <select name="xsdw" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ʵ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sxj" size="20" maxlength="17" >
              </td>
              <td width="15%"> 
                <div align="right">����Ա</div>
              </td>
              <td width="35%">
                <input type="text" name="czy" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����˻���˱�־</div>
              </td>
              <td width="35%"> 
                <select name="shbz" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="2">δ���</option>
                  <option value="0">δͨ��</option>
                  <option value="1">ͨ��</option>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="shr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="shrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">�Ƿ����</div>
              </td>
              <td width="35%"> 
                <select name="sfjs" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value="0">δ����</option>
                </select>
              </td>
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
	if(!(isFloat(FormName.thj, "�˻����"))) {
		return false;
	}
	if(!(isDatetime(FormName.thrq, "�˻�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.thrq2, "�˻�����"))) {
		return false;
	}
	if(!(isFloat(FormName.sxj, "ʵ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.shrq, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.sfjs, "�Ƿ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
