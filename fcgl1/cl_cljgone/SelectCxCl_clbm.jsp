<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_clbmCxList.jsp" name="selectform">
<div align="center">���ϼ۸�¼��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span>�ֹ�˾</td>
      <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%>
      </select></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ϱ���</td>
      <td width="32%"><input type="text" name="clbm" size="20" maxlength="20" ></td>
      <td align="right" width="18%">��������</td>
      <td width="32%"><input type="text" name="clmc" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        ���ϴ���      </td>
      <td width="32%"> 
        <select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
				%> 
      </select>      </td>
      <td width="18%" align="right">���Ϲ�� </td>
      <td width="32%"><input type="text" name="clgg" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������㷽ʽ</td>
      <td width="32%"> 
        <select name="lrjsfs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">��۷�ʽ</option>
          <option value="2">�ٷֱȷ�ʽ</option>
      </select>      </td>
      <td width="18%" align="right"> 
        ������λ      </td>
      <td width="32%"> 
        <select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
				%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ٷֱ� ��</td>
      <td width="32%"> 
        <input type="text" name="lrbfb" size="20" maxlength="9" >
      % </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="lrbfb2" size="20" maxlength="9" >
      % </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����</td>
      <td width="32%"> 
        <input type="radio" name="lx" value="1">
        ���� 
        <input type="radio" name="lx" value="2">
      �ǳ��� </td>
      <td align="right" width="18%">ά����</td>
      <td width="32%">
        <input type="text" name="wxr" size="20" maxlength="20" value="">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}

	if(!(isFloat(FormName.lrbfb, "����ٷֱ�"))) {
		return false;
	}
	if(!(isFloat(FormName.lrbfb2, "����ٷֱ�"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
