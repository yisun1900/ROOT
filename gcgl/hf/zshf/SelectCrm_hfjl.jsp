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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_hfjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �طü�¼��              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="9" >
              </td>
              <td width="19%" align="right"> 
                �ط�����              </td>
              <td width="29%"> 
                <select name="crm_hfjl_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �ͻ����              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right"> 
                �ͻ�����              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%" align="right"> 
                ��ϵ��ʽ              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ���ʦ��Ʒ���              </td>
              <td width="31%"> 
                <select name="crm_hfjl_sjfa" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">              </td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ���ʦ���ڷ���              </td>
              <td width="31%"> 
                <select name="crm_hfjl_hqfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ���ʦ�������              </td>
              <td width="29%"> 
                <select name="crm_hfjl_jdqk" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ���̵�������              </td>
              <td width="31%"> 
                <select name="crm_hfjl_zjyfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ���̵�����λ              </td>
              <td width="29%"> 
                <select name="crm_hfjl_zjydw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ���̵�������              </td>
              <td width="31%"> 
                <select name="crm_hfjl_zjyjz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ʩ���ӷ�������              </td>
              <td width="29%"> 
                <select name="crm_hfjl_fwsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ʩ����ʩ������              </td>
              <td width="31%"> 
                <select name="crm_hfjl_sgzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ʩ���ӹ�������              </td>
              <td width="29%"> 
                <select name="crm_hfjl_grsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ���ɼҾ����ʦ              </td>
              <td width="30%"> 
                <select name="jcjjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ���ɼҾӹ���              </td>
              <td width="31%"> 
                <select name="jsjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ������ĿרԱ              </td>
              <td width="30%"> 
                <select name="jcxmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ���ɲ�Ʒ�ͻ���װ              </td>
              <td width="31%"> 
                <select name="jcshaz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ���ɲ�Ʒ����              </td>
              <td width="30%"> 
                <select name="jccpzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���ʦ�ط�����</td>
              <td colspan="3"> 
                <input type="text" name="sjshfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���̵����ط�����</td>
              <td colspan="3"> 
                <input type="text" name="zjyhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">ʩ���ӻط�����</td>
              <td colspan="3"> 
                <input type="text" name="sgdhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ɼҾӻط�����</td>
              <td colspan="3"> 
                <input type="text" name="jchfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�����´λط�ʱ��</td>
              <td width="31%"><input type="radio" name="sfjxhf"  value="Y" >
����
  <input type="radio" name="sfjxhf"  value="N" >
������
<input type="radio" name="sfjxhf"  value="F" >
���»ط�</td>
              <td width="19%" align="right"> 
                �´λط�����              </td>
              <td width="29%"> 
                <select name="crm_hfjl_xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �´λط����� ��              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_xchfrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="29%"> 
                <input type="text" name="crm_hfjl_xchfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ����ʽ              </td>
              <td width="31%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+���账��&1+������ز���","");
%> 
                </select>
              </td>
              <td width="19%" align="right"> 
                ��������              </td>
              <td width="29%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	String sql=null;

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	}
	cf.selectItem(out,sql,"");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">����״̬</td>
              <td width="31%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="Y">��ز����Ѵ���</option>
                  <option value="N">��ز���δ����</option>
                </select>
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �ط�ʱ�� ��              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="29%"> 
                <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�طò���</td>
              <td width="31%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="19%" align="right">�ط���</td>
              <td width="29%"> 
                <input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" >
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

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_hfjl_hfjlh, "�طü�¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_xchfrq, "�´λط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_xchfrq2, "�´λط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
