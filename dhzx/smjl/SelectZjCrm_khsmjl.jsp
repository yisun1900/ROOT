<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<style type="text/css">
<!--
.STYLE1 {color: #0000CC; font-weight: bold; }
-->
</style>
<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khsmjlZjList.jsp" name="selectform">
<div align="center">ά���������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">�����ֹ�˾</td>
    <td bgcolor="#FFFFCC">
	<select name="crm_khsmjl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%>
      </select>	  </td>
    <td align="right" bgcolor="#FFFFCC">�Ӵ��˲��� </td>
    <td bgcolor="#FFFFCC">
	<select name="crm_khsmjl_jdrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeBm(selectform)">
        <%
		if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
		}
		else if (kfgssq.equals("1") )
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx not in('F3','F4') and ssfgs='"+ssfgs+"' order by dwlx desc,dwbh","");
		}
		else if (kfgssq.equals("3"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
		}
		else if (kfgssq.equals("4"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwlx desc,dwbh ","");
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
		%>
    </select>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">�Ӵ���</span></td>
    <td><select name="jdrbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
    </select></td>
    <td align="right">�Ӵ���</td>
    <td><input type="text" name="jdr" size="14" maxlength="20" >
    ��ģ����ѯ��</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��¼��</td> 
  <td width="32%"> 
    <input type="text" name="crm_khsmjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="crm_khsmjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">�ͻ�����</span></td>
  <td><input type="text" name="khxm" size="20" maxlength="20" >  </td>
  <td align="right">�ͻ�����</td>
  <td><input type="text" name="khxm2" size="14" maxlength="20" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">���ݵ�ַ </span></td>
  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
  <td align="right">���ݵ�ַ</td>
  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">��ϵ��ʽ </span></td>
  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
  <td align="right">��ϵ��ʽ</td>
  <td><input type="text" name="lxfs2" size="14" maxlength="50" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ</td> 
  <td width="32%"> 
    <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">����Ŀ��</td> 
  <td width="32%">
  <select name="crm_khsmjl_smmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select smmd c1,smmd c2 from dm_smmd order by smmd","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="crm_khsmjl_smsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_khsmjl_smsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<%
if (yhjs.equals("A0"))
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right">¼����</td>
	  <td><input type="text" name="crm_khsmjl_lrr" size="20" maxlength="20" value=""></td>
	  <td align="right">¼�벿��</td>
	  <td>
		<select name="crm_khsmjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
		</select>	  </td>
	</tr>
	<%
}
else {
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right">¼����</td>
	  <td><input type="text" name="crm_khsmjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly></td>
	  <td align="right">¼�벿��</td>
	  <td>
		<select name="crm_khsmjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
			<%
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
			%>
		</select>	  </td>
	</tr>
	<%
}
%>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">״̬</td>
  <td><INPUT type="radio" name="crm_khsmjl_zt" value="2" checked>
    ��¼���	</td>
  <td align="right">
  ���Ŵ���
  </td>
  <td><select name="lfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
   <option value=""></option>
        <%
	cf.selectToken(out,"1+��һ��&2+�ڶ���&3+������&4+���Ĵ�&5+�����&6+������&7+���ߴ�&8+�ڰ˴�&9+�ھŴ�","");
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
<%
	cf.ajax(out);//����AJAX
%>

var lx;

function changeFgs(FormName) 
{
	FormName.crm_khsmjl_jdrbm.length=1;

	if (FormName.crm_khsmjl_ssfgs.value=="")
	{
		return;
	}

	lx="1";

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx not in('F3','F4') and ssfgs='"+FormName.crm_khsmjl_ssfgs.value+"' order by cxbz,dwlx desc,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx not in('F3','F4') and ssfgs='"+FormName.crm_khsmjl_ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwlx desc,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeBm(FormName) 
{
	FormName.jdrbh.length=1;

	if (FormName.crm_khsmjl_jdrbm.value=="")
	{
		return;
	}

	lx="2";

	var sql;
	sql =" select sq_yhxx.ygbh,sq_yhxx.yhmc||'��'||xzzwbm||'��' c1";
	sql+=" from sq_yhxx ";
	sql+=" where sq_yhxx.dwbh='"+FormName.crm_khsmjl_jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" UNION ";

	sql+=" select sq_yhxx.ygbh,sq_yhxx.yhmc||'��'||xzzwbm||'��' c1";
	sql+=" from sq_yhxx,sq_sqbm ";
	sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+FormName.crm_khsmjl_jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" ORDER BY c1";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		strToSelect(selectform.crm_khsmjl_jdrbm,ajaxRetStr);
	}
	else{
		strToSelect(selectform.jdrbh,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khsmjl_smsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_smsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.jdrbh, "�Ӵ��˱��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
