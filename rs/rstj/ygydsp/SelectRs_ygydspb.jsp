<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ygydspbList.jsp" name="selectform">
<div align="center">Ա���䶯�Ǽ�ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�䶯���</td>
      <td width="32%"> 
        <input type="text" name="bdxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">Ա�����</td>
      <td width="32%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">Ա������</td>
      <td width="32%"> 
        <input type="text" name="yhmc" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">����</td>
      <td width="32%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�䶯����</td>
      <td width="32%"> 
        <select name="bdxz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+ת��&02+��н&03+��ְ&04+��ְ&05+��ְ&06+����&07+����&08+����&99+����","");
%> 
        </select>
      </td>
      <td align="right" width="18%">�䶯ԭ��</td>
      <td width="32%"> 
        <input type="text" name="bdyy" size="20" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�걨�ֹ�˾</td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','F0') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' ","");
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">�����</td>
      <td width="32%"> 
        <input type="text" name="tcf" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�䶯ǰ����</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A1','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}
	else
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}	
%> 
        </select>
      </td>
      <td align="right" width="18%">�䶯����</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A1','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}
	else
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}	
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�䶯ǰ��λ</td>
      <td width="32%"> 
        <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm","");
%> 
        </select>
      </td>
      <td align="right" width="18%">�䶯���λ</td>
      <td width="32%"> 
        <select name="zwbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�䶯��Чʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="bdsxrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="bdsxrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����״̬</td>
      <td width="32%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">��������</option>
          <option value="01">�ȴ�����</option>
        </select>
      </td>
      <td align="right" width="18%">����״̬</td>
      <td width="32%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='03' and  ztbm not in ('0388','0399') order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%">
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">��</td>
      <td width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input name="button" type="button" onClick="f_do(selectform)"  value="��ѯ">
        <input name="reset" type="reset"  value="����">
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
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.bdsxrq, "�䶯��Чʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.bdsxrq2, "�䶯��Чʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
