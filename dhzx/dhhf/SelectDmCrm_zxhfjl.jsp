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
<form method="post" action="Crm_zxhfjlDmList.jsp" name="selectform">
<div align="center">�ͻ��ط÷�����Ϣ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="17%">�ͻ������ֹ�˾</td>
      <td width="33%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
        </select>
      </td>
      <td align="right" width="19%">��ѯ����</td>
      <td width="31%"> 
        <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ͻ����</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_khbh" size="20" maxlength="7" >
      </td>
      <td align="right" width="19%">�ͻ�����</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���ݵ�ַ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="19%">��ϵ��ʽ</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���ʦ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_sjs" value="" >
      </td>
      <td align="right" width="19%">ҵ��Ա</td>
      <td width="31%"> 
        <input type="text" name="ywy" value="" size="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�طü�¼��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������־</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_lfbz","N+δ����&Y+������","");
%> </td>
      <td align="right" width="19%">����ʱ��</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_lfsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��ƽ��ͼ��־</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_ctbz","N+δ��ͼ&Y+�ѳ�ͼ","");
%> </td>
      <td align="right" width="19%">��ƽ��ͼʱ��</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_ctsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">Ҫ���������</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghdm","N+��Ҫ��&Y+Ҫ�����","");
%> </td>
      <td align="right" width="19%">Ҫ��������ʦ</td>
      <td width="31%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghsjs","N+��Ҫ��&Y+Ҫ�����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">���ʦרҵˮƽ</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_sjszysp" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='3' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">���ʦ����</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_sjsfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='4' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������Ա����</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_qtryfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='5' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">���̱���</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_gcbj" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='6' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��˾����ӡ��</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_gsztyx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='7' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="19%">ϣ���Ľ�����</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_xwgjfm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='8' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�Ƿ�����ط�</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_sfjxhf","Y+�����ط�&N+�طý���","");
%> </td>
      <td align="right" width="19%">�´λط�����</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_xchfrq" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ط�ʱ�� ��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_hfsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�ط���</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�Ƿ�����������</td>
      <td width="33%"> 
        <INPUT type="radio" name="crm_zxhfjl_clfs" value="1" checked>
        ������ز���</td>
      <td align="right" width="19%">��������</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">�鿴��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_ckr" size="20" maxlength="16" >
      </td>
      <td align="right" width="19%">�鿴ʱ��</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_cksj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_zxkhxx_zxdm.length=1;

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
	strToSelect(selectform.crm_zxkhxx_zxdm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_zxhfjl_lfsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_ctsj, "��ƽ��ͼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_xchfrq, "�´λط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxhfjl_cksj, "�鿴ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
