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
	String zt=cf.GB2Uni(request.getParameter("zt"));
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����տ�޸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_khfkjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right" bgcolor="#CCFFFF"><font color="#FF0000"><b>�ͻ�����</b></font></td>
              <td width="33%" bgcolor="#CCFFFF"> <font color="#FF0000"><b> <%
	cf.radioToken(out, "zt","1+ǩ���ͻ�&2+��ǩ���ͻ�",zt,true);
%> </b></font></td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �ͻ����              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_khbh" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                ��ͬ��              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><strong><span class="STYLE1"> �ͻ����� </span></strong></font></td>
              <td><input type="text" name="khxm" size="20" maxlength="50" >              </td>
              <td align="right"> �ͻ����� </td>
              <td><input type="text" name="khxm2" size="18" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><strong><span class="STYLE1">���ݵ�ַ</span></strong></font></td>
              <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
              <td align="right">���ݵ�ַ</td>
              <td><input type="text" name="fwdz2" size="18" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><strong><span class="STYLE1">��ϵ��ʽ</span></strong></font></td>
              <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
              <td align="right">��ϵ��ʽ</td>
              <td><input type="text" name="lxfs2" size="18" maxlength="50" >
                ��ģ����ѯ��</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�տ����</td>
              <td width="33%"><input type="text" name="cw_khfkjl_fkxh" size="20" maxlength="10" ></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �����¼��              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_jsjlh" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"> 
                �վݱ��              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sjbh" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �տ�����              </td>
              <td width="33%"> 
                <select name="fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where fkdl not in('1','2')","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                �տ���              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_fkje" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�տ�ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_sksj" size="20" maxlength="10" >              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_sksj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �տ���              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_skr" size="20" maxlength="20" >              </td>
              <td width="18%" align="right"> 
                ������              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_jkr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ¼�뵥λ              </td>
              <td width="33%"> 
                <select name="cw_khfkjl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1") || yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                ¼����              </td>
              <td width="32%"> 
                <input type="text" name="cw_khfkjl_lrr" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                ¼��ʱ��              </td>
              <td width="33%"> 
                <input type="text" name="cw_khfkjl_lrsj" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
                ֧����ʽ              </td>
              <td width="32%"> 
                <select name="zffs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zffsbm,zffsmc from cw_zffsbm order by zffsbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                �Ƿ������              </td>
              <td width="33%"> 
                <select name="skdd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="2">�����</option>
                </select>              </td>
              <td width="18%" align="right"> 
                ת�ʿ���              </td>
              <td width="32%"> 
                <select name="zckx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm order by fklxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" bgcolor="#FFFFFF" align="right">��˱�־</td>
              <td width="33%"><%
	cf.radioToken(out,"dsksjbz","N+δ���&M+���δͨ��","");
%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" bgcolor="#FFFFFF" align="right">ɾ����־</td>
              <td width="33%"> 
                <select name="scbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">δɾ��</option>
                </select>              </td>
              <td width="18%" align="right">�Ƿ��ѵ���ƾ֤</td>
              <td width="32%"> 
                <input type="radio" name="czlx" value="1" checked>
                û�е���</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
