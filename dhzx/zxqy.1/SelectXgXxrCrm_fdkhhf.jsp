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
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_fdkhhfXgXxrList.jsp" name="selectform">
<div align="center">��Ϣ�˻طã��޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right">�����ֹ�˾</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
    <td align="right">��ѯ����</td>
    <td><select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <td align="right">�ͻ����</td>
    <td><input type="text" name="khbh" size="20" maxlength="20" >    </td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm" size="20" maxlength="50" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><input type="text" name="fwdz" size="73" maxlength="100" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ҵ��Ա</td>
    <td><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>>    </td>
    <td align="right">���ʦ</td>
    <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�طü�¼��</td> 
  <td width="31%"> 
    <input type="text" name="crm_fdkhhf_hfjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">�ط���</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_hfr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ط�ʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ط÷ɵ�ԭ��</td> 
  <td width="31%"> 
    <select name="crm_fdkhhf_hfsbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
    </select>  </td>
  <td align="right" width="19%">�ط÷ɵ��ͻ�����</td> 
  <td width="31%"> 
    <select name="crm_fdkhhf_hfsbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"'","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ط÷ɵ�ʱ��</td> 
  <td width="31%"> 
    <input type="text" name="crm_fdkhhf_hfsbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="19%">¼����</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����</td> 
  <td colspan="3"><%
	cf.radioToken(out, "crm_fdkhhf_lx","1+�ɵ��ط�&2+����ط�&3+��Ϣ�˻ط�","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="crm_fdkhhf_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_fdkhhf_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼�벿��</td> 
  <td width="31%"> 
    <select name="crm_fdkhhf_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
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
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_fdkhhf_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_hfsbsj, "�ط÷ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
