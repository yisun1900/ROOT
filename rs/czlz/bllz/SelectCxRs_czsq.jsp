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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_czsqCxList.jsp" name="selectform">
  <div align="center">������ְ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">�����ֹ�˾</td>
      <td width="33%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="changeFgs(selectform)">
<%
	if (kfgssq.equals("2"))//2����Ȩ����ֹ�˾
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">��������</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	if (!kfgssq.equals("2"))//2����Ȩ����ֹ�˾
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">Ա�����</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="18%">Ա������</td>
      <td width="32%"> 
        <input type="text" name="rs_czsq_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�Ա�</td>
      <td width="33%"> <%
	cf.radioToken(out, "rs_czsq_xb","M+��&W+Ů","");
%> </td>
      <td align="right" width="18%">ְ��</td>
      <td width="32%"> 
        <select name="rs_czsq_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="31">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ְ�������</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_sqxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">��ְԭ�����</td>
      <td width="32%">
        <select name="lzyyflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm order by lzyyflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">¼����</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">¼�벿��</td>
      <td width="32%"> 
        <select name="rs_czsq_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
        <input type="text" name="rs_czsq_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_czsq_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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
        <select name="rs_czsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">��������</option>
          <option value="03">����ͨ��</option>
        </select>
      </td>
      <td align="right" width="18%">����״̬</td>
      <td width="32%"> 
        <select name="rs_czsq_ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='13' order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�������</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_spxh" size="20" maxlength="16" >
      </td>
      <td align="right" width="18%">��˽���</td>
      <td width="32%"> 
        <select name="rs_czsq_shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
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
        <input type="text" name="rs_czsq_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="rs_czsq_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�����</td>
      <td width="33%"> 
        <input type="text" name="rs_czsq_shr" size="20" maxlength="20" >
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

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(!(isNumber(FormName.rs_czsq_ygbh, "Ա�����"))) {
		return false;
	}

	if(!(isDatetime(FormName.rs_czsq_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_czsq_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqrq2, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_czsq_spxh, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_czsq_shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_czsq_shsj2, "���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
