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
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">��ѯ��ȡ��ϸ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����ֹ�˾</td>
      <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"oa_xcplqsq_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(oa_xcplqsq_fgsbh,oa_xcplqsq_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"oa_xcplqsq_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="18%">���쵥λ</td>
      <td width="32%"> 
        <select name="oa_xcplqsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by ssfgs,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�������</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">������</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_slr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ƻ���ȡ���� ��</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_jhlqrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_jhlqrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼������ ��</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_lrrq" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lrrq2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">¼����</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">�Ƿ�������</td>
      <td width="32%"> <%
	cf.radioToken(out, "oa_xcplqsq_sfxsp","N+����Ҫ&Y+��Ҫ","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">һ��������</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_yjspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">һ����������</td>
      <td width="32%"> <%
	cf.radioToken(out, "oa_xcplqsq_yjspjl","1+ͬ��&2+�����ϼ�&3+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">һ������ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_yjspsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_yjspsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����������</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_ejspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">������������</td>
      <td width="32%"><%
	cf.radioToken(out, "oa_xcplqsq_ejspjl","1+ͬ��&2+�����ϼ�&3+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_ejspsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_ejspsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����������</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_sjspr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">������������</td>
      <td width="32%"><%
	cf.radioToken(out, "oa_xcplqsq_sjspjl","1+ͬ��&2+�����ϼ�&3+����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_sjspsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_sjspsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ȡʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_lqsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="oa_xcplqsq_lqsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <input type="text" name="oa_xcplqsq_blr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">��ȡ״̬</td>
      <td width="32%"> 
        <select name="oa_xcplqsq_lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+δ���&2+�������&3+һ������&4+��������&5+��������&6+����ȡ","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ӡˢƷ���루6λ��</td>
      <td width="31%"> 
        <input type="text" name="xcpbm" value="" size="20" maxlength="6" >
      </td>
      <td align="right" width="18%">ӡˢƷ����</td>
      <td width="32%"> 
        <input type="text" name="xcpmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">ӡˢƷ����</td>
      <td width="31%"> 
        <select name="xcpflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select xcpflbm,xcpflmc from oa_xcpflbm order by xcpflmc","");
%> 
        </select>
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">��ѯ�������</td>
      <td colspan="3"> ��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="oa_xcplqsq.sqxh desc">�������</option>
          <option value="oa_xcplqsq.dwbh">���쵥λ</option>
          <option value="oa_xcplqsq.fgsbh">�ֹ�˾</option>
          <option value="oa_xcplqsq.slr">������</option>
          <option value="oa_xcplqsq.jhlqrq">�ƻ���ȡ����</option>
          <option value="oa_xcplqsq.lrr">¼����</option>
          <option value="oa_xcplqsq.lrrq">¼������</option>
          <option value="oa_xcplqsq.sfxsp">�Ƿ�������</option>
          <option value="oa_xcplqsq.lqzt">��ȡ״̬</option>
          <option value="oa_xcplqsq.blr">������</option>
          <option value="oa_xcplqsq.lqsj">��ȡʱ��</option>
          <option value="oa_xcplqmx.xcpbm">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpmc">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpflbm">ӡˢƷ����</option>
        </select>
        �ڶ��� 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="oa_xcplqsq.sqxh desc">�������</option>
          <option value="oa_xcplqsq.dwbh">���쵥λ</option>
          <option value="oa_xcplqsq.fgsbh">�ֹ�˾</option>
          <option value="oa_xcplqsq.slr">������</option>
          <option value="oa_xcplqsq.jhlqrq">�ƻ���ȡ����</option>
          <option value="oa_xcplqsq.lrr">¼����</option>
          <option value="oa_xcplqsq.lrrq">¼������</option>
          <option value="oa_xcplqsq.sfxsp">�Ƿ�������</option>
          <option value="oa_xcplqsq.lqzt">��ȡ״̬</option>
          <option value="oa_xcplqsq.blr">������</option>
          <option value="oa_xcplqsq.lqsj">��ȡʱ��</option>
          <option value="oa_xcplqmx.xcpbm">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpmc">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpflbm">ӡˢƷ����</option>
        </select>
        ������ 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="oa_xcplqsq.sqxh desc">�������</option>
          <option value="oa_xcplqsq.dwbh">���쵥λ</option>
          <option value="oa_xcplqsq.fgsbh">�ֹ�˾</option>
          <option value="oa_xcplqsq.slr">������</option>
          <option value="oa_xcplqsq.jhlqrq">�ƻ���ȡ����</option>
          <option value="oa_xcplqsq.lrr">¼����</option>
          <option value="oa_xcplqsq.lrrq">¼������</option>
          <option value="oa_xcplqsq.sfxsp">�Ƿ�������</option>
          <option value="oa_xcplqsq.lqzt">��ȡ״̬</option>
          <option value="oa_xcplqsq.blr">������</option>
          <option value="oa_xcplqsq.lqsj">��ȡʱ��</option>
          <option value="oa_xcplqmx.xcpbm">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpmc">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpflbm">ӡˢƷ����</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">��ʾ���</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
        <input type="text" name="myxssl" size="7" maxlength="13" value="60">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
        <input type="reset"  value="����">
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">ͳ�Ʊ�</td>
      <td colspan="3"> ��һ�� 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="oa_xcplqmx.xcpbm">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpmc">ӡˢƷ����</option>
          <option value="xcpflmc">ӡˢƷ����</option>
          <option value="oa_xcplqsq.sqxh">�������</option>
          <option value="dwmc">���쵥λ</option>
          <option value="oa_xcplqsq.fgsbh">�ֹ�˾</option>
          <option value="oa_xcplqsq.slr">������</option>
          <option value="oa_xcplqsq.jhlqrq">�ƻ���ȡ����</option>
          <option value="oa_xcplqsq.lrr">¼����</option>
          <option value="oa_xcplqsq.lrrq">¼������</option>
          <option value="oa_xcplqsq.sfxsp">�Ƿ�������</option>
          <option value="DECODE(oa_xcplqsq.lqzt,'1','δ���','2','�������','3','һ������','4','��������','5','��������','6','����ȡ')">��ȡ״̬</option>
          <option value="oa_xcplqsq.blr">������</option>
          <option value="oa_xcplqsq.lqsj">��ȡʱ��</option>
        </select>
        �ڶ��� 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="oa_xcplqmx.xcpbm">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpmc">ӡˢƷ����</option>
          <option value="xcpflmc">ӡˢƷ����</option>
          <option value="oa_xcplqsq.sqxh">�������</option>
          <option value="dwmc">���쵥λ</option>
          <option value="oa_xcplqsq.fgsbh">�ֹ�˾</option>
          <option value="oa_xcplqsq.slr">������</option>
          <option value="oa_xcplqsq.jhlqrq">�ƻ���ȡ����</option>
          <option value="oa_xcplqsq.lrr">¼����</option>
          <option value="oa_xcplqsq.lrrq">¼������</option>
          <option value="oa_xcplqsq.sfxsp">�Ƿ�������</option>
          <option value="DECODE(oa_xcplqsq.lqzt,'1','δ���','2','�������','3','һ������','4','��������','5','��������','6','����ȡ')">��ȡ״̬</option>
          <option value="oa_xcplqsq.blr">������</option>
          <option value="oa_xcplqsq.lqsj">��ȡʱ��</option>
        </select>
        ������ 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="oa_xcplqmx.xcpbm">ӡˢƷ����</option>
          <option value="oa_xcplqmx.xcpmc">ӡˢƷ����</option>
          <option value="xcpflmc">ӡˢƷ����</option>
          <option value="oa_xcplqsq.sqxh">�������</option>
          <option value="dwmc">���쵥λ</option>
          <option value="oa_xcplqsq.fgsbh">�ֹ�˾</option>
          <option value="oa_xcplqsq.slr">������</option>
          <option value="oa_xcplqsq.jhlqrq">�ƻ���ȡ����</option>
          <option value="oa_xcplqsq.lrr">¼����</option>
          <option value="oa_xcplqsq.lrrq">¼������</option>
          <option value="oa_xcplqsq.sfxsp">�Ƿ�������</option>
          <option value="DECODE(oa_xcplqsq.lqzt,'1','δ���','2','�������','3','һ������','4','��������','5','��������','6','����ȡ')">��ȡ״̬</option>
          <option value="oa_xcplqsq.blr">������</option>
          <option value="oa_xcplqsq.lqsj">��ȡʱ��</option>
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">
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
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.oa_xcplqsq_sqxh, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_jhlqrq, "�ƻ���ȡ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_jhlqrq2, "�ƻ���ȡ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lrrq, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lrrq2, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_yjspsj, "һ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_yjspsj2, "һ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_ejspsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_ejspsj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_sjspsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_sjspsj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lqsj, "��ȡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_xcplqsq_lqsj2, "��ȡʱ��"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Oa_xcplqmxCxList.jsp"
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="Oa_xcplqmxTjb.jsp"
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
