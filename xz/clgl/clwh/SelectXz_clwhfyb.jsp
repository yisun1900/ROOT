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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Xz_clwhfybList.jsp" name="selectform">
  <div align="center">�������ӷ��޸�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">�����ֹ�˾</td>
      <td width="32%">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");

		out.println("        <select name=\"xz_clwhfyb_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_clwhfyb_ssfgs,fyfsbm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
		out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xz_clwhfyb_ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>	  
	  </td>
      <td align="right" width="18%">���÷�������</td>
      <td width="32%">
        <select name="fyfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�Ǽ����</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_djxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">�����ƺ�</td>
      <td width="32%"> 
        <select name="xz_clwhfyb_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm order by qcph","");
	}
	else{
		cf.selectItem(out,"select qcph c1,qcph||'��'||qcxh c2 from xz_qcdm where ssfgs='"+ssfgs+"' order by qcph","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����ͺ�</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
      <td align="right" width="18%">Ŀǰ˾������</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_sjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��Ŀ</td>
      <td width="32%"> 
        <select name="xz_clwhfyb_xm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select clfjfmc c1,clfjfmc c2 from dm_clfjfbm order by clfjfbm","");
%> 
        </select>
      </td>
      <td align="right" width="18%">����</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_fy" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���÷������� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_djrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_djrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_jsr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">��׼��</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_pzr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%">
        <input type="text" name="xz_clwhfyb_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="xz_clwhfyb_lrsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.xz_clwhfyb_djxh, "�Ǽ����"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_clwhfyb_fy, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_djrq, "���÷�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_djrq2, "���÷�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_clwhfyb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
