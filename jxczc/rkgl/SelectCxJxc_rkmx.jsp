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
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_rkmxCxList.jsp" name="selectform">
<div align="center">�����ϸ����ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">�������</td>
    <td><input type="text" name="jxc_rkmx_rkph" size="20" maxlength="11" ></td>
    <td align="right">��Դ����</td>
    <td><input type="text" name="jxc_rkd_lydh" size="20" maxlength="50" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�������</td>
    <td><select name="jxc_rkd_rklx" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <option value="C">�ɹ����</option>
        <option value="T">�˻����</option>
        <option value="R">�������</option>
        <option value="S">�깺���</option>
        <option value="J">����ȯ�˻����</option>
        <option value="D">���Ķ����˻�</option>
        <option value="P">ֱ�����</option>
    </select></td>
    <td align="right">��ⵥ״̬</td>
    <td><select name="jxc_rkd_rkdzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <option value="0">δ�ύ</option>
        <option value="1">�ȴ����</option>
        <option value="2">�ȴ����</option>
        <option value="3">�����</option>
        <option value="4">�ѽ���</option>
        <option value="6">�ȴ��ܲ����</option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����</td>
    <td><select name="jxc_rkd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(selectform)">
        <%
	if (yhjs.equals("A0"))
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqmc","");
	}
	else
	{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqmc","");
	}
%>
    </select></td>
    <td align="right">���ֿ�</td>
    <td><select name="jxc_rkd_ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
		cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc,jxc_kgy where jxc_ckmc.ckbh=jxc_kgy.ckbh and  jxc_kgy.yhdlm='"+yhdlm+"' order by dqbm,ckmc","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><select name="jxc_rkmx_hjbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select hjbh,hjmc from jxc_hjmc order by hjbh","");
%>
      </select>    </td>
    <td align="right">����λ</td>
    <td><select name="jxc_rkmx_hwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select hwbh,hwmc from jxc_hwmc order by hwbh","");
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������λ</td>
    <td colspan="3"><select name="jxc_rkd_gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
        <%
	if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
	}
	else
	{
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select gysmc mc,gysmc from jxc_gysxx,jxc_ppgysdzb where jxc_gysxx.gysbm=jxc_ppgysdzb.gysbm and jxc_ppgysdzb.ssfgs='"+ssfgs+"'  order by gysmc","");
	}
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������λ</td>
    <td><input type="text" name="jxc_rkd_gysmc2" size="20" maxlength="13" >
      ��ģ����ѯ��</td>
    <td align="right">�����</td>
    <td><input type="text" name="jxc_rkd_rkr" value="" size="20" maxlength="50" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ʱ�� ��</td>
    <td><input type="text" name="jxc_rkd_rksj" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="jxc_rkd_rksj2" size="20" maxlength="10"  onDblClick="JSCalendar(this)"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ϱ���</td> 
  <td width="32%"> 
    <input type="text" name="jxc_rkmx_clbm" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clbm_clmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">Ʒ��</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clbm_ppmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clbm_xh" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clbm_gg" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_clbm_nbbm" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������� ��</td> 
  <td width="32%"><input type="text" name="jxc_rkmx_scrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jxc_rkmx_scrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_rkmx_scph" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="jxc_rkmx_rkxh" size="20" maxlength="8" ></td>
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
	if(!(isDatetime(FormName.jxc_rkd_rksj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_rkd_rksj2, "���ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.jxc_rkmx_rkxh, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_rkmx_scrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_rkmx_scrq2, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
