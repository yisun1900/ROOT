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
<form method="post" action="Gdm_gdjcjlCxList.jsp" name="selectform">
<div align="center">���ؼ���¼����ѯ</div>
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
  <td align="right" width="18%">����¼��</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_jcjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʩ����</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_sgd" size="20" maxlength="5" >  </td>
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ݵ�ַ</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">���ʦ</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_xjr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_xjsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_xjsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ϣ��Դ</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xxlybm,xxlymc from gdm_xxlybm order by xxlybm","");
%>
    </select>  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_jclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jclxbm,jclxmc from gdm_jclxbm order by jclxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_jcjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jcjgbm,jcjgmc from gdm_jcjgbm order by jcjgbm","");
%>
    </select>  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <select name="gdm_gdjcjl_jcwtflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jcwtflbm,jcwtflmc from gdm_jcwtflbm order by jcwtflbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������־</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_cfspbz","1+��������&2+δ����&3+����ͨ��&4+����δͨ��","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_spsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_spsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_spr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">�Ƿ�������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_sffszg","Y+����&N+δ����","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ�Ҫ����ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_yqjjsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_yqjjsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���β���</td> 
  <td width="32%"><select name="gdm_gdjcjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
  </select></td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_zrr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ����쵼����</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_sfxldcl","Y+��Ҫδ����&N+����Ҫ&C+�Ѵ���","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�쵼Ҫ����ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_ldyqjjsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_ldyqjjsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�쵼������</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_ldclr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�쵼����ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_ldclsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_ldclsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_jssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_jssj2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ�������ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_jhcfasj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_jhcfasj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_jsr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">��������¼��</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_cfajlh" size="20" maxlength="13" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ�ʳ�����ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_sjcfasj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_sjcfasj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ�ʳ�������</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_sjcfar" size="20" maxlength="20" ></td>
  <td align="right" width="18%">���������</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_shr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ����ʱ���</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_jhjjsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_jhjjsj2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�������ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_shsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_shsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���´���ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_clsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_clsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����¼��</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_cljlh" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">���´�����</td> 
  <td width="32%"><input type="text" name="gdm_gdjcjl_clr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����״̬</td> 
  <td colspan="3"><%
	cf.radioToken(out, "gdm_gdjcjl_clzt","1+δ����&2+�ѽ��յȴ�������&D+�ѽ��ղ��������&7+�ѳ������ȴ����&8+�ѳ������������&9+�������ͨ��&A+�������δͨ��&3+�ѽ��&B+�ڴ���","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������־</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_kpbz","N+δ����&Y+�ѿ���","");
%>  </td>
  <td align="right" width="18%">������¼��</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_kpjlh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����־</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "gdm_gdjcjl_jsbz","N+δ����&Y+�ѽ���","");
%>  </td>
  <td align="right" width="18%">�����¼��</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_jsjlh" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ���</td>
  <td><input type="text" name="gdm_gdjcjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="gdm_gdjcjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="gdm_gdjcjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	if(!(isDatetime(FormName.gdm_gdjcjl_xjsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_xjsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_spsj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_spsj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_yqjjsj, "�ͻ�Ҫ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_yqjjsj2, "�ͻ�Ҫ����ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.gdm_gdjcjl_ldyqjjsj, "�쵼Ҫ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_ldyqjjsj2, "�쵼Ҫ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_ldclsj, "�쵼����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_ldclsj2, "�쵼����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jssj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jhcfasj, "�ƻ�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jhcfasj2, "�ƻ�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_sjcfasj, "ʵ�ʳ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_sjcfasj2, "ʵ�ʳ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_jhjjsj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_shsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_shsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_clsj, "���´���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_clsj2, "���´���ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.gdm_gdjcjl_kpjlh, "������¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdm_gdjcjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
