<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


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
<form method="post" action="Crm_tgglCxList.jsp" name="selectform">
<div align="center">ͣ������ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> �ֹ�˾ </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
      </select>    </td>
    <td align="right"> ǩԼ���� </td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ǩԼ���� ��</td>
    <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">��</td>
    <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ��</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">�ͻ����</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ʦ</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">���̵���</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ܼ�</td>
    <td><input type="text" name="gj" size="20" maxlength="20"></td>
    <td align="right">����</td>
    <td><input type="text" name="dd" size="20" maxlength="20"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> ��ϵ��ʽ </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ݵ�ַ </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ǼǱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_djbh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">ͣ��������</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_tgsqr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ͣ������ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_tgsqsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">ͣ�������</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_tgshr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ͣ�����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_tgshsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">ͣ����˽��</td> 
  <td width="32%"> 
	<INPUT type="radio" name="crm_tggl_tgshjg" value="Y">ͨ��
    <INPUT type="radio" name="crm_tggl_tgshjg" value="N">δͨ��
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ͣ��ԭ��</td> 
  <td width="32%"> 
    <select name="crm_tggl_tgyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm order by tgyybm","");
%>
    </select>  </td>
  <td align="right" width="18%">ͣ��¼����</td> 
  <td width="32%"><input type="text" name="crm_tggl_tglrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ͣ����ʼʱ�� ��</td>
  <td><input type="text" name="crm_tggl_tgkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_tggl_tgkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���Ƹ������� ��</td>
  <td><input type="text" name="crm_tggl_gjfgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_tggl_gjfgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ�ʸ������� ��</td> 
  <td width="32%"><input type="text" name="crm_tggl_sjfgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="crm_tggl_sjfgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ͣ��¼��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_tglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">����¼��ʱ��</td> 
  <td width="32%"><input type="text" name="crm_tggl_fglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����¼����</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_fglrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">״̬</td> 
  <td width="32%"> 
    <select name="crm_tggl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="5">ͣ������</option>
    <option value="6">ͣ������</option>
    <option value="7">����ͣ��</option>
    <option value="8">������</option>
    </select>  </td>
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_tggl_lrsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <select name="crm_tggl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
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


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

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
	if(!(isDatetime(FormName.crm_tggl_tgsqsj, "ͣ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_tgshsj, "ͣ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_tgkssj, "ͣ����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_tgkssj2, "ͣ����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_gjfgsj, "���Ƹ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_gjfgsj2, "���Ƹ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_tglrsj, "ͣ��¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_sjfgsj, "ʵ�ʸ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_sjfgsj2, "ʵ�ʸ�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_fglrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tggl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
