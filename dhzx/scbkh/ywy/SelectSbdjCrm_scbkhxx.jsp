<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>



<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
String dwbh=(String)session.getAttribute("dwbh");

String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String dqbm=(String)session.getAttribute("dqbm");
String zwbm=(String)session.getAttribute("zwbm");
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where yhdlm='"+yhdlm+"'"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhxxSbdjList.jsp" name="selectform">
<div align="center">�г����ͻ�����ʧ�ܵǼ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr align="center">
    <td colspan="4"><input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">�����ֹ�˾</td>
    <td bgcolor="#FFFFCC">
		<select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%> 
		</select>	  </td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>¼����</strong></td>
    <td><input type="text" name="crm_scbkhxx_lrr" size="20" maxlength="20" ></td>
    <td align="right">С������</td>
    <td><select name="crm_scbkhxx_xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�г����ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_scbkhbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_khbh" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">״̬</td>
  <td colspan="3">
    <INPUT type="radio" name="crm_scbkhxx_zt" value="1">
    ����
    <INPUT type="radio" name="crm_scbkhxx_zt" value="5">
    ׼���ƽ�
    <INPUT type="radio" name="crm_scbkhxx_zt" value="7">
    �ƽ�����
    <INPUT type="radio" name="crm_scbkhxx_zt" value="6">
    ׼��ʧ��  
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ�����</td>
  <td><select name="sckhyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <OPTION  value=""></OPTION>
    <%
	cf.selectItem(out,"select sckhyxbm,sckhyxmc from dm_sckhyxbm order by sckhyxbm","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ԤԼ����ʱ�� ��</td>
  <td><input type="text" name="yyddsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yyddsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�طü�� �� </td>
  <td><input name="hfjg" type="text"   value="" size="20" maxlength="10"></td>
  <td align="right">��</td>
  <td><input name="hfjg2" type="text" value="" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ���ط�</td>
  <td><input type="radio" name="crm_scbkhxx_sfxhf" value="Y">
    ��Ҫ
    <input type="radio" name="crm_scbkhxx_sfxhf" value="N">
    �� </td>
  <td align="right">�ͻ���Դ����</td>
  <td><select name="crm_scbkhxx_khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�´λط�ʱ�� ��</td>
  <td><input type="text" name="crm_scbkhxx_xchfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_scbkhxx_xchfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������ʱ�� ��</td>
  <td><input type="text" name="crm_scbkhxx_zjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_scbkhxx_zjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">�ͻ�����</span></td>
  <td><input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" ></td>
  <td align="right">�ͻ�����</td>
  <td><input type="text" name="crm_scbkhxx_khxm2" size="14" maxlength="50" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">��ϵ��ʽ</span></td>
  <td><input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" ></td>
  <td align="right">��ϵ��ʽ</td>
  <td><input type="text" name="crm_scbkhxx_lxfs2" size="14" maxlength="50" >
    ��ģ����ѯ��</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">���ݵ�ַ</span></td>
  <td><input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right">���ݵ�ַ</td>
  <td><input type="text" name="crm_scbkhxx_fwdz2" size="14" maxlength="100" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><select name="crm_scbkhxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%>
  </select></td>
  <td align="right">С��</td>
  <td><input type="text" name="crm_scbkhxx_xqbm" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ֵ�</td>
  <td><input type="text" name="crm_scbkhxx_jiedao" size="20" maxlength="50" ></td>
  <td align="right">¥��</td>
  <td><input type="text" name="crm_scbkhxx_louhao" size="20" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><strong>ҵ��Ա</strong></td>
  <td>
	  <input type="text" name="crm_scbkhxx_ywy" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><strong>ҵ��Ա����</strong></td>
  <td><select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
%>
  </select></td>
  <td align="right"><strong>ҵ��Ա����С��</strong></td>
  <td><select name="crm_scbkhxx_ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="crm_scbkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right">������������</td>
  <td><input type="text" name="crm_scbkhxx_jzdsmc" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������� ��</td>
  <td><input type="text" name="crm_scbkhxx_fwmj" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_scbkhxx_fwmj2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���� ��</td>
  <td><input type="text" name="crm_scbkhxx_fj" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_scbkhxx_fj2" size="20" maxlength="8" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">Ԥ��װ��ʱ�� ��</td>
  <td><input type="text" name="crm_scbkhxx_yjzxsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"> ��</td>
  <td><input type="text" name="crm_scbkhxx_yjzxsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƽ���</td>
  <td><input type="text" name="crm_scbkhxx_yjr" size="20" maxlength="20" ></td>
  <td align="right">�ƽ�����</td>
  <td>
    <select name="crm_scbkhxx_yjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
      <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx='F2' and cxbz='N' order by dwbh","");
	  %>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƽ�ʱ��</td>
  <td><input type="text" name="crm_scbkhxx_yjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">�Ƿ���С��</td>
  <td><input type="radio" name="crm_scbkhxx_sfxxq" value="Y">
    ��
    <input type="radio" name="crm_scbkhxx_sfxxq" value="N">
    ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������</td>
  <td><input type="text" name="crm_scbkhxx_jsr" size="20" maxlength="20" >  </td>
  <td align="right">����ʱ��</td>
  <td><input type="text" name="crm_scbkhxx_jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʧ��ԭ��</td> 
  <td width="32%"> 
    <select name="crm_scbkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sckhsbyybm order by sbyybm","");
%>
    </select>  </td>
  <td align="right" width="18%">ʧ�ܵǼ���</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_sbdjr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʧ�ܵǼ�ʱ�� ��</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_sbdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_sbdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td> 
  <td width="32%"><input type="text" name="crm_scbkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.yyddsj, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yyddsj2, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.hfjg, "�طü�� "))) {
		return false;
	}
	if(!(isNumber(FormName.hfjg2, "�طü�� "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_sbdjsj, "ʧ�ܵǼ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_sbdjsj2, "ʧ�ܵǼ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjsj, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fwmj, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fwmj2, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_scbkhxx_fj2, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjzxsj2, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_xchfsj, "�´λط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_xchfsj2, "�´λط�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
