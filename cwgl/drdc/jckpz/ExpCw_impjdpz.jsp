<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>ƾ֤����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ƾ֤����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
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
              <td width="19%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="31%"> 
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="18%" align="right">�ͻ�����</td>
              <td width="32%"> 
                <select name="khlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">��ѯ�ͻ�</option>
                  <option value="2">��װ�ͻ�</option>
                  <option value="4">�Ǽ�װ�ͻ�</option>
                </select>
              </td>
              <td width="19%" align="right">�տλ</td>
              <td width="31%"> 
                <select name="skdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">�տ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="crm_khxx_fwdz" size="68" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�����¼��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">�վݱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">�տ���</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >
              </td>
              <td align="right" width="19%">�տ�����</td>
              <td width="31%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where pzfl='2' order by fklxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">�տ�����</td>
              <td colspan="3"> 
                <input type="radio" name="pplx" value="21" >
                ľ�� 
                <input type="radio" name="pplx" value="22" >
                ���� 
                <input type="radio" name="pplx" value="23" >
                ���� 
                <input type="radio" name="pplx" value="24" >
                �Ҿ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">�������</td>
              <td width="32%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm order by zcdlbm","");
%> 
                </select>
              </td>
              <td align="right" width="19%">�տ�Ʒ��</td>
              <td width="31%"> 
                <input type="text" name="gysbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right">֧����ʽ</td>
              <td width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">ת�ʿ���</td>
              <td width="31%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�տ���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_jkr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">¼����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">¼�뵥λ</div>
              </td>
              <td width="31%"> 
                <select name="cw_khfkjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ƿ������</div>
              </td>
              <td width="32%"> 
                <input type="radio" name="skdd" value="1">
                �����տ� 
                <input type="radio" name="skdd" value="2">
                �ǲ�����տ� </td>
              <td width="19%"> 
                <div align="right">��˱�־</div>
              </td>
              <td width="31%"> 
                <input type="radio" name="dsksjbz" value="N">
                �� 
                <input type="radio" name="dsksjbz" value="Y">
                �� </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right">��ѯ�������</td>
              <td width="32%"> 
                <select name="pxzd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="fkxh">�տ����</option>
                  <option value="hth">��ͬ��</option>
                  <option value="khxm">�ͻ�����</option>
                  <option value="khlx">�ͻ�����</option>
                  <option value="dwmc">�տλ</option>
                  <option value="sksj">�տ�ʱ��</option>
                  <option value="fklxbm">�տ�����</option>
                  <option value="zffsmc">֧����ʽ</option>
                </select>
              </td>
              <td width="19%" align="right">ÿҳ��ʾ����</td>
              <td width="31%"> 
                <input type="text" name="myxssl" size="20" maxlength="13" value="30">
                &nbsp;&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%"> 
                <div align="right">¼��ʱ�� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">�տ�ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">�����</td>
              <td width="32%"> 
                <input type="text" name="sjr" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">���ʱ�� ��</td>
              <td width="32%"> 
                <input type="text" name="sjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="sjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">�Ƿ��ѵ���ƾ֤</td>
              <td width="32%"> 
                <input type="radio" name="czlx" value="1" checked>
                û�е��� 
                <input type="radio" name="czlx" value="2">
                �ѵ��� </td>
              <td width="19%" align="right">ɾ����־</td>
              <td width="31%"> 
                <input type="radio" name="scbz" value="N" checked>
                δɾ�� </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td width="18%" align="right" bgcolor="#CCFFFF">�տ�����</td>
              <td colspan="3"> 
                <input type="radio" name="pzfl" value="1" checked>
                �ռ��ɿ�ֽ� 
                <input type="radio" name="pzfl" value="2" >
                �ռ��ɿ���ֽ� 
                <input type="radio" name="pzfl" value="3" >
                ת�롢ת�����ɿ�</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����ƾ֤" onClick="f_do(selectform,'dc')" name="button">
                <input type="button"  value="��ѯ�տ���Ϣ" onClick="f_do(selectform,'cx')">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isNumber(FormName.cw_khfkjl_fkxh, "�տ����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_khfkjl_fkje, "�տ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj, "�տ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_sksj2, "�տ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_khfkjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjsj2, "���ʱ��"))) {
		return false;
	}

	if (lx=='cx')
	{
		FormName.action="Cw_khfkjlCxList.jsp";
	}
	else{
		FormName.action="ExpPz.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
