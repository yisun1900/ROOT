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
<form method="post" action="Crm_scbkhxxAllYjList.jsp" name="selectform">
<div align="center">�г����ͻ����ƽ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr align="center">
    <td colspan="4"><input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">�����ֹ�˾</td>
    <td bgcolor="#FFFFCC">
		<select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%> 
		</select>
 
	  </td>
    <td align="right" bgcolor="#FFFFCC">¼�벿��</td>
    <td bgcolor="#FFFFCC">
	  <select name="crm_scbkhxx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
		}
		else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='07' and  cxbz='N' and ssfgs='"+ssfgs+"' order by cxbz,dwbh","");
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
		%> 
	  %> 
	  </select>
	</td>
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
    <INPUT type="radio" name="crm_scbkhxx_zt" value="6">
    ׼��ʧ��
  </td>
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
  <td align="right"><span class="STYLE3">�����绰</span></td>
  <td><input type="text" name="crm_scbkhxx_qtdh" size="20" maxlength="50" ></td>
  <td align="right">�����绰</td>
  <td><input type="text" name="crm_scbkhxx_qtdh2" size="14" maxlength="50" >
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
  <select name="crm_scbkhxx_ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
     <option value=""></option>
      <%
		String sql=null;
		sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqfgs ";
		sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.ssfgs='"+ssfgs+"'";

		sql+=" UNION ALL ";

		sql+=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' c2";
		sql+=" from sq_yhxx,sq_sqbm ";
		sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' ";
		sql+=" and sq_yhxx.zwbm in('19','24') and sq_yhxx.sfzszg in('Y','N') ";
		sql+=" and sq_yhxx.ssfgs='"+ssfgs+"'";

		sql+=" ORDER BY c1";

		cf.selectItem(out,sql,"");
%>
    </select>	
  
  
  </td>
  <td align="right" bgcolor="#FFFFFF"><strong>ҵ��Ա����С��</strong></td>
  <td>
  <select name="crm_scbkhxx_ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
     <option value=""></option>
   <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F4' and ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
%>
  </select>
  </td>
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
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
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
<%
	//����Ajax
	cf.ajax(out);
%>
function changeFgs(FormName)
{
	FormName.crm_scbkhxx_lrbm.length=1;

	if (FormName.crm_scbkhxx_ssfgs.value=="")
	{
		return;
	}


	var sql;
	sql="select dwbh,dwmc from sq_dwxx where dwflbm='07' and  cxbz='N' and ssfgs='"+FormName.crm_scbkhxx_ssfgs.value+"' order by cxbz,dwbh";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.crm_scbkhxx_lrbm,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
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
