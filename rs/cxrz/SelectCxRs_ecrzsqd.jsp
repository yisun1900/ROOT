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
	String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));

	//����Ƿ�����ĩ��ת
	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("����û�н��С���ת����");
		return;
	}
	else if (count==-1)
	{
		out.println("����");
		return;
	}

%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ecrzsqdCxList.jsp" name="selectform">
  <div align="center">
    ��ְԱ��������ְ
    <BR>
    <b><font color="#000099">��ע�⣺������ְ��������������ְ���롢�������� <BR>
    λ�ã����¹���>Ա������>������ְ����</font></b> </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">Ա�����</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">Ա������</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�Ա�</td>
      <td width="33%"> <%
	cf.radioToken(out, "rs_ecrzsqd_xb","M+��&W+Ů","");
%> </td>
      <td align="right" width="18%">ԭ�ֹ�˾</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_yfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">ԭ����</td>
      <td width="33%"> 
        <select name="rs_ecrzsqd_ydwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else{
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">ԭְλ</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_yxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ϴ���ְ����</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_yrzsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">��ְ����</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_ylzrq" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="31">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�������</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_sqxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">�걨��˾</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���������ְ����</td>
      <td width="33%"> 
        <select name="rs_ecrzsqd_xdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="18%">���������ְְλ</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_xxzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼����</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">¼�벿��</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
		cf.selectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' and a.ssfgs='"+ssfgs+"' order by a.ssfgs,a.dwlx,a.dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼��ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�������� ��</td>
      <td width="33%"> 
        <input type="text" name="sqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="sqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="32">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����״̬</td>
      <td width="33%"> 
        <select name="rs_ecrzsqd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">��������</option>
          <option value="03">����ͨ��</option>
        </select>
      </td>
      <td align="right" width="18%">����״̬</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='06' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�������</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">��˽���</td>
      <td width="32%"> 
        <select name="rs_ecrzsqd_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select shjl,shjlmc from rs_shjlbm order by shjl","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_ecrzsqd_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�����</td>
      <td width="33%"> 
        <input type="text" name="rs_ecrzsqd_shr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
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
	if(!(isNumber(FormName.rs_ecrzsqd_ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_yrzsj, "�ϴ���ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_ylzrq, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq2, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_ecrzsqd_spxh, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_ecrzsqd_shsj2, "���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
