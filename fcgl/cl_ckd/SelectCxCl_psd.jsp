<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cl_psdCxList.jsp" name="selectform">
<div align="center">���͵�����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���͵���</td>
      <td width="31%"> 
        <input type="text" name="psdh" size="20" maxlength="11" >
      </td>
      <td align="right" width="18%">�ֹ�˾</td>
      <td width="33%"> <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
		%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����״̬</td>
      <td width="31%"> 
        <select name="pszt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="2">���ύ</option>
        </select>
      </td>
      <td align="right" width="18%">¼����</td>
      <td width="33%"> 
        <input type="text" name="lrr2" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">��ͬ��</td>
      <td width="31%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="18%" align="right">�ͻ����</td>
      <td width="33%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="31%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="18%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="33%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">���ݵ�ַ</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="73" maxlength="100">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���������� ��</td>
      <td width="31%"> 
        <input type="text" name="pszsl" size="20" maxlength="17" >
      </td>
      <td align="right" width="18%">��</td>
      <td width="33%"> 
        <input type="text" name="pszsl2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����ܽ�� ��</td>
      <td width="31%"> 
        <input type="text" name="pszje" size="20" maxlength="17" >
        <BR>
      </td>
      <td align="right" width="18%">��</td>
      <td width="33%"> 
        <input type="text" name="pszje2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="33%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="31%"> 
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ͷ�ʽ</td>
      <td width="31%"> 
        <input type="radio" name="psfs" value="1">
        ���� 
        <input type="radio" name="psfs" value="2">
        ���� 
        <input type="radio" name="psfs" value="9">
        ���� </td>
      <td align="right" width="18%">ʩ����</td>
      <td width="33%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh  order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
	else{
		
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ƻ��ͻ�ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="33%"> 
        <input type="text" name="jhshsj2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����</td>
      <td width="31%"> 
        <input type="radio" name="lx" value="1">
        ��� 
        <input type="radio" name="lx" value="2">
        �˻�</td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.pszsl, "����������"))) {
		return false;
	}
	if(!(isFloat(FormName.pszsl2, "����������"))) {
		return false;
	}
	if(!(isFloat(FormName.pszje, "�����ܽ��"))) {
		return false;
	}
	if(!(isFloat(FormName.pszje2, "�����ܽ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
