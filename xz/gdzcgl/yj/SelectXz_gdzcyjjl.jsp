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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcyjjlList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">Ŀǰ���ֹܷ�˾</td>
      <td width="32%"> 
<%
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
%>		
      </td>
      <td align="right" width="18%">Ŀǰ���ܵ�λ</td>
      <td width="32%"> 
        <select name="xz_gdzcb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�̶��ʲ����</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">Ŀǰ������</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�̶��ʲ�����</td>
      <td colspan="3"> 
        <input type="text" name="xz_gdzcyjjl_gdzcmc" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ƽ�ʱ���</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_yjsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_yjsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_jsr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">�ƽ���</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_yjr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼�벿��</td>
      <td width="32%"> 
        <select name="xz_gdzcyjjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="xz_gdzcyjjl_lrr" size="20" maxlength="20" >
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.xz_gdzcyjjl_yjsj, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcyjjl_yjsj2, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcyjjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcyjjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
