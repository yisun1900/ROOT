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

<form method="post" action="Ybj_fpybjCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ybj_fpybj_sqbh" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ybj_fpybj_fpr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="ybj_fpybj_fpsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="ybj_fpybj_fpsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>
              </td>
              <td width="31%"> 
                <select name="ybj_cgsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ybj_cgsq_sqr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">����ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="ybj_cgsq_sqsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="ybj_cgsq_sqsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="31%"> 
                <select name="ybj_fpybj_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">δд��ִ</option>
                  <option value="Y">��д��ִ</option>
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�����ͻ�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">������ַ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="18%"> 
                <div align="right">����仧��</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">������λ</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <select name="crm_khxx_hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�������ɫ</div>
              </td>
              <td width="32%"> 
                <select name="crm_khxx_ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
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

	  
	  </div>
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
	if(!(isNumber(FormName.ybj_fpybj_sqbh, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_fpybj_fpsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_fpybj_fpsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_cgsq_sqsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_cgsq_sqsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
