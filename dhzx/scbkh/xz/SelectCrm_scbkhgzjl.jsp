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
.STYLE1 {color: #0000CC}
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
<form method="post" action="Crm_scbkhgzjlList.jsp" name="selectform">
<div align="center">�ͻ��طã�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">�����ֹ�˾</td>
    <td bgcolor="#FFFFCC"><select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%>
      </select>    </td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3 STYLE1"><strong>�ͻ�����</strong></span></td>
    <td><input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" ></td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="crm_scbkhxx_khxm2" size="14" maxlength="50" >
      ��ģ����ѯ��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3 STYLE1"><strong>��ϵ��ʽ</strong></span></td>
    <td><input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" ></td>
    <td align="right">��ϵ��ʽ</td>
    <td><input type="text" name="crm_scbkhxx_lxfs2" size="14" maxlength="50" >
      ��ģ����ѯ��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE3 STYLE1"><strong>���ݵ�ַ</strong></span></td>
    <td><input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >    </td>
    <td align="right">���ݵ�ַ</td>
    <td><input type="text" name="crm_scbkhxx_fwdz2" size="14" maxlength="100" >
      ��ģ����ѯ��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">״̬</td>
    <td colspan="3"><INPUT type="radio" name="crm_scbkhxx_zt" value="1">
      ����
      <INPUT type="radio" name="crm_scbkhxx_zt" value="6">
      ׼��ʧ��
      <INPUT type="radio" name="crm_scbkhxx_zt" value="2">
      ʧ��
      <INPUT type="radio" name="crm_scbkhxx_zt" value="5">
      ׼���ƽ�
      <INPUT type="radio" name="crm_scbkhxx_zt" value="3">
      �ƽ�
      <INPUT type="radio" name="crm_scbkhxx_zt" value="4">
      �ѽ���
      <INPUT type="radio" name="crm_scbkhxx_zt" value="7">
      �ƽ����� </td>
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
    <td align="right"><strong>�г����ͻ����</strong></td>
    <td><input type="text" name="crm_scbkhxx_scbkhbh" size="20" maxlength="20" ></td>
    <td align="right"><strong>ҵ��Ա</strong></td>
  <td>
  <select name="crm_scbkhxx_ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
      <%
		out.println("<option value=\"\"></option>");
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.sjsbh='"+ywyssxz+"' ";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");
%>
    </select>	
  </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right">�طü�� �� </td>
    <td><input name="hfjg" type="text"   value="" size="20" maxlength="10"></td>
    <td align="right">��</td>
    <td><input name="hfjg2" type="text" value="" size="20" maxlength="10"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�������ʱ�� ��</td>
    <td><input type="text" name="crm_scbkhxx_zjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="crm_scbkhxx_zjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">С������</td>
    <td><select name="crm_scbkhxx_xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
    </select></td>
    <td align="right">�ͻ���Դ����</td>
    <td><select name="crm_scbkhxx_khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxz","");
%>
    </select></td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF">�ط���Ϣ</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��¼��</td>
  <td><input type="text" name="crm_scbkhgzjl_jlh" size="20" maxlength="10" ></td>
  <td align="right">�ͻ�����</td>
  <td><select name="sckhyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option  value=""></option>
    <%
	cf.selectItem(out,"select sckhyxbm,sckhyxmc from dm_sckhyxbm order by sckhyxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ���ط�</td>
  <td><%
	cf.radioToken(out, "sfxhf","Y+��Ҫ&N+��","");
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�´λط�ʱ��</td>
  <td><input type="text" name="xchfsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="xchfsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ԤԼ�ͻ�����ʱ��</td>
  <td><input type="text" name="yyddsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yyddsj2" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼����</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhgzjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"><select name="crm_scbkhgzjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼��ʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_scbkhgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td>
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.yyddsj2, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.hfjg, "�طü�� "))) {
		return false;
	}
	if(!(isNumber(FormName.hfjg2, "�طü�� "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_zjgzsj2, "�������ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.xchfsj, "�´λط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xchfsj2, "�´λط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yyddsj, "ԤԼ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yyddsj2, "ԤԼ����ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj2, "����¼��ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
