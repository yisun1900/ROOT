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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_gdzcbCxList.jsp" name="selectform">
  <div align="center">
    �ƽ��Ǽ�
    <BR>
    ��<font color="#0000CC"><b>���Ȳ�ѯ�����ƽ���Ʒ��Ȼ����еǼ�</b></font>�� </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">��ǰ���ֹܷ�˾</td>
      <td width="30%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(xz_gdzcb_fgsbh,xz_gdzcb_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"xz_gdzcb_fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td align="right" width="21%">��ǰ���ܲ���</td>
      <td width="29%"> 
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
      <td align="right" width="20%">�̶��ʲ����</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_gsbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="21%">�̶��ʲ�����</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_gdzcmc" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�����ڲ����</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_bmbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="21%">�̶��ʲ�����</td>
      <td width="29%"> 
        <select name="xz_gdzcb_gdzcflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gdzcflbm,gdzcflmc from xz_gdzcflbm order by gdzcflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�ͺ�</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_xh" size="20" maxlength="30" >
      </td>
      <td align="right" width="21%">Ʒ��</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_pp" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">����ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_grsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="21%">��</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_grsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�Ƿ��ѱ���</td>
      <td width="30%"> <%
	cf.radioToken(out, "xz_gdzcb_sfybf","Y+��&N+��","");
%> </td>
      <td align="right" width="21%">������</td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_bgr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">�ƽ�ʱ�� ��</td>
      <td width="30%"> 
        <input type="text" name="yjsj" value="" size="20" maxlength="10" >
      </td>
      <td align="right" width="21%">��</td>
      <td width="29%"> 
        <input type="text" name="yjsj2" value="" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">¼��ʱ��</td>
      <td width="30%"> 
        <input type="text" name="xz_gdzcb_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="21%">¼���� </td>
      <td width="29%"> 
        <input type="text" name="xz_gdzcb_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="20%">��ѯ�������</td>
      <td colspan="3">��һ�� 
        <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value="xz_gdzcb.gdzcflbm">�̶��ʲ�����</option>
          <option value="xz_gdzcb.gsbh">�̶��ʲ����</option>
          <option value="xz_gdzcb.gdzcmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.bmbh">�����ڲ����</option>
          <option value="xz_gdzcb.xh">�ͺ�</option>
          <option value="xz_gdzcb.pp">Ʒ��</option>
          <option value="xz_gdzcb.sl">����</option>
          <option value="xz_gdzcb.grsj">����ʱ��</option>
          <option value="xz_gdzcb.yjsj">�ƽ�ʱ��</option>
          <option value="xz_gdzcb.grj">�����</option>
          <option value="xz_gdzcb.bgr">������</option>
          <option value="xz_gdzcb.dwbh">��ǰ���ܲ���</option>
          <option value="xz_gdzcb.sfybf">�Ƿ��ѱ���</option>
        </select>
        �ڶ��� 
        <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_gdzcb.gdzcflbm">�̶��ʲ�����</option>
          <option value="xz_gdzcb.gsbh">�̶��ʲ����</option>
          <option value="xz_gdzcb.gdzcmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.bmbh">�����ڲ����</option>
          <option value="xz_gdzcb.xh">�ͺ�</option>
          <option value="xz_gdzcb.pp">Ʒ��</option>
          <option value="xz_gdzcb.sl">����</option>
          <option value="xz_gdzcb.grsj">����ʱ��</option>
          <option value="xz_gdzcb.yjsj">�ƽ�ʱ��</option>
          <option value="xz_gdzcb.grj">�����</option>
          <option value="xz_gdzcb.bgr">������</option>
          <option value="xz_gdzcb.dwbh">��ǰ���ܲ���</option>
          <option value="xz_gdzcb.sfybf">�Ƿ��ѱ���</option>
        </select>
        ������ 
        <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
          <option value=""></option>
          <option value="xz_gdzcb.gdzcflbm">�̶��ʲ�����</option>
          <option value="xz_gdzcb.gsbh">�̶��ʲ����</option>
          <option value="xz_gdzcb.gdzcmc">�̶��ʲ�����</option>
          <option value="xz_gdzcb.bmbh">�����ڲ����</option>
          <option value="xz_gdzcb.xh">�ͺ�</option>
          <option value="xz_gdzcb.pp">Ʒ��</option>
          <option value="xz_gdzcb.sl">����</option>
          <option value="xz_gdzcb.grsj">����ʱ��</option>
          <option value="xz_gdzcb.yjsj">�ƽ�ʱ��</option>
          <option value="xz_gdzcb.grj">�����</option>
          <option value="xz_gdzcb.bgr">������</option>
          <option value="xz_gdzcb.dwbh">��ǰ���ܲ���</option>
          <option value="xz_gdzcb.sfybf">�Ƿ��ѱ���</option>
        </select>
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
	if(!(isDatetime(FormName.xz_gdzcb_grsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_grsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj2, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_gdzcb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
