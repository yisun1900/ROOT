<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ckdCxList.jsp" name="selectform">
<div align="center">�����������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">


<tr bgcolor="#FFFFFF">
  <td align="right">Ŀ�ĵ���</td>
  <td>
  <select name="mddqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select distinct dm_dqbm.dqbm,dm_dqbm.dqmc from dm_dqbm,sq_dwxx where dm_dqbm.dqbm=sq_dwxx.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select distinct dm_dqbm.dqbm,dm_dqbm.dqmc from dm_dqbm,sq_dwxx where dm_dqbm.dqbm=sq_dwxx.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select distinct dm_dqbm.dqbm,dm_dqbm.dqmc from dm_dqbm,sq_dwxx where dm_dqbm.dqbm=sq_dwxx.dqbm and dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%>
  </select></td>
  <td align="right">��������</td>
  <td><select name="jxc_ckd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="jxc_ckd_ckph" size="20" maxlength="11" ></td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <select name="jxc_ckd_cklx" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="D">��������</option>
		<option value="B">���ϳ���</option>
		<option value="T">�˻�����</option>
		<option value="S">�깺����</option>
		<option value="P">���ϵ�����</option>
		<option value="J">���Ĵ���ȯ����</option>
		<option value="X">���۳���</option>
		<option value="R">��������</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ⷽʽ</td>
  <td colspan="3"><%
	cf.radioToken(out, "jxc_ckd_ckfs","1+�Զ����⣨�������ȳ��⣩&2+�Զ����⣨������ȳ��⣩&3+�ֹ�����","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ͷ�ʽ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jxc_ckd_psfs","0+��������&1+��˾�ͻ�&2+��ȡ","");
%>  </td>
  <td align="right" width="18%">���ⵥ״̬</td> 
  <td width="32%"><select name="jxc_ckd_ckdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="9">�������</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ��ͻ�ʱ�� ��</td>
  <td><input type="text" name="jxc_ckd_jhshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_ckd_jhshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Դ����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_lydh" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_ddbh" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�˻������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_thdbh" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">�깺����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_sgph" size="20" maxlength="13" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���͵���</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_psph" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">����ȯ���</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_czxh" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_xsph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_dbph" size="20" maxlength="13" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_rkph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_ckr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="jxc_ckd_jsr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="jxc_ckd_cksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_ckd_cksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "jxc_ckd_sfjz","Y+����&N+δ����","");
%>  </td>
  <td align="right" width="18%">�Ƿ����</td> 
  <td width="32%"><%
	cf.radioToken(out, "jxc_ckd_sfth","Y+���&N+δ���","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��и����</td>
  <td colspan="3"><%
	cf.radioToken(out, "jxc_ckd_sfyfkc","1+�޸����&2+�����δ���&3+��������","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="jxc_ckd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_ckd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_ckd_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"><select name="jxc_ckd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isDatetime(FormName.jxc_ckd_jhshsj, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_jhshsj2, "�ƻ��ͻ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_cksj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_ckd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>