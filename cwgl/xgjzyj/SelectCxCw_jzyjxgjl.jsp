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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jzsjxgjlCxList.jsp" name="selectform">
  <div align="center">��ѯ����תʱ���޸ļ�¼ </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">�ֹ�˾</div>
      </td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
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
      <td width="20%"> 
        <div align="right">ǩԼ����</div>
      </td>
      <td width="30%"> 
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">��ͬ��</td>
      <td width="32%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="20%" align="right">�ͻ����</td>
      <td width="30%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">���ʦ</td>
      <td width="32%"> 
        <input type="text" name="sjs" size="20" maxlength="20">
      </td>
      <td width="20%" align="right">�ʼ�</td>
      <td width="30%"> 
        <input type="text" name="zjxm" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
      <td width="32%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="20%" align="right">�ͻ�����</td>
      <td width="30%"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
      <td width="20%"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="30%"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="71" maxlength="100">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">���ݵ�ַ</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�޸�ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="cw_jzsjxgjl_xgsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="cw_jzsjxgjl_xgsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�޸���</td>
      <td width="32%"> 
        <input type="text" name="cw_jzsjxgjl_xgr" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">�޸�����</td>
      <td width="30%"><%
	cf.radioToken(out, "cw_jzsjxgjl_xglx","1+�޸�&2+ɾ��&3+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ԭǩ����תʱ��</td>
      <td width="32%"> 
        <input type="text" name="yqdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">�޸ĺ�ǩ����תʱ��</td>
      <td width="30%"> 
        <input type="text" name="xghqdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ԭ�˵���תʱ��</td>
      <td width="32%"> 
        <input type="text" name="ytdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">�޸ĺ��˵���תʱ��</td>
      <td width="30%"> 
        <input type="text" name="xghtdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.cw_jzsjxgjl_xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzsjxgjl_xgsj2, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yqdjzsj, "ԭǩ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghqdjzsj, "�޸ĺ�ǩ����תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ytdjzsj, "ԭ�˵���תʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghtdjzsj, "�޸ĺ��˵���תʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
