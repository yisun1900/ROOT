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
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	String ssfgs=(String)session.getAttribute("ssfgs");

	//����Ƿ�����ĩ��ת
	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("����û�н��С���ת����");
		return;
	}
	else if (count==-1)
	{
		out.println("����");
		return;
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_yhlzjlCxrzList.jsp" name="selectform">
  <div align="center">
  ��ְԱ��������ְ
  <P>
    <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td width="42%" align="right" height="40"><font color="#CC0000">*</font>���������ְ��˾</td>
        <td width="58%" height="40">
          <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (kfgssq.equals("2"))//2����Ȩ����ֹ�˾
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
          </select>
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="42%" align="right" height="40">Ա������</td>
        <td width="58%" height="40"> 
          <input type="text" name="yhmc" size="20" maxlength="50" >
        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="42%" align="right" height="46">���֤�� </td>
        <td width="58%" height="46"> 
          <input type="text" name="sfzh" size="20" maxlength="20" >
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center" height="49"> 
          <input type="button"  value="��ѯ" onClick="f_do(selectform)">
          <input type="reset"  value="����">
        </td>
      </tr>
    </table>
  
  </div>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[������˾]��");
		FormName.fgsbh.focus();
		return false;
	}

	if(FormName.yhmc.value==""  && FormName.sfzh.value=="") 
	{
		alert("������[Ա������]��[���֤��]��");
		FormName.sfzh.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
