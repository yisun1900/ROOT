<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%	
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
%>


<form method="post" action="Rs_qjsqspbCxList.jsp" name="selectform">
<div align="center">�������--������ѯ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�������</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqspb_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">����������</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqspb_sqxh" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�걨��˾</td>
      <td width="32%"> 
        <select name="rs_qjsqd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">Ա�����</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqd_ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">Ա������</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqd_yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="18%">�Ա�</td>
      <td width="32%"> <%
	cf.radioToken(out, "rs_qjsqd_xb","M+��&W+Ů","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqspb_shr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">��˽���</td>
      <td width="32%"> 
        <select name="rs_qjsqspb_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqspb_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_qjsqspb_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��˺���״̬</td>
      <td width="32%"> 
        <select name="rs_qjsqspb_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+�ȴ�����&02+��������&03+����ͨ��&04+����ȡ��","");
%> 
        </select>
      </td>
      <td align="right" width="18%">��˺�����״̬</td>
      <td width="32%"> 
        <select name="rs_qjsqspb_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='10' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ϴδ���״̬</td>
      <td width="32%"> 
        <select name="rs_qjsqspb_yclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+�ȴ�����&02+��������&03+����ͨ��&04+����ȡ��","");
%> 
        </select>
      </td>
      <td align="right" width="18%">�ϴ�����״̬</td>
      <td width="32%"> 
        <select name="rs_qjsqspb_yztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='10' order by ztbm","");
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
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.rs_qjsqspb_spxh, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_qjsqd_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_qjsqd_lrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_qjsqd_lrsj2, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_qjsqspb_shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_qjsqspb_shsj2, "���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
