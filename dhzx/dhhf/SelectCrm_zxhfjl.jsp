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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
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
<form method="post" action="Crm_zxhfjlList.jsp" name="selectform">
  <div align="center">�ط�ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">�ͻ������ֹ�˾</td>
      <td width="31%"> 
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
      <td align="right" width="17%">��ѯ����</td>
      <td width="33%"> 
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
      <td align="right" width="19%">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_khbh" size="20" maxlength="7" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">�ͻ�����</font></b></td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
      <td width="17%"> 
        <div align="right">�ͻ�����</div>
      </td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">��ϵ��ʽ</font></b></td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="50" >
      </td>
      <td width="17%" align="right">��ϵ��ʽ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_lxfs2" size="10" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">���ݵ�ַ</font></b></td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td width="17%" align="right">���ݵ�ַ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_fwdz2" size="10" maxlength="100" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ʦ</td>
      <td width="31%"> 
        <input type="text" name="sjs" value="" size="20" maxlength="100" >
      </td>
      <td align="right" width="17%">ҵ��Ա</td>
      <td width="33%"> 
        <input type="text" name="ywy" value="" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="26" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�طü�¼��</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_hfjlh" size="20" maxlength="9" >
      </td>
      <td align="right" width="17%">�طô���</td>
      <td width="33%"> 
        <select name="hfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+��1��&2+��2��&3+��3��&4+��4��&5+��5��&6+��6��&7+��7��&8+��8��&9+��9��&10+��10��&11+��11��&12+��12��&13+��13��&14+��14��","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������־</td>
      <td width="31%"><%
	cf.radioToken(out, "crm_zxhfjl_lfbz","N+δ����&Y+������","");
%> </td>
      <td align="right" width="17%">����ʱ��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_lfsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ƽ��ͼ��־</td>
      <td width="31%"><%
	cf.radioToken(out, "crm_zxhfjl_ctbz","N+δ��ͼ&Y+�ѳ�ͼ","");
%> </td>
      <td align="right" width="17%">��ƽ��ͼʱ��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_ctsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">Ҫ���������</td>
      <td width="31%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghdm","N+��Ҫ��&Y+Ҫ�����","");
%> </td>
      <td align="right" width="17%">Ҫ��������ʦ</td>
      <td width="33%"><%
	cf.radioToken(out, "crm_zxhfjl_yqghsjs","N+��Ҫ��&Y+Ҫ�����","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ʦרҵˮƽ</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_sjszysp" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='3' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">���ʦ����</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_sjsfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='4' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������Ա����</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_qtryfw" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='5' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">���̱���</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_gcbj" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='6' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��˾����ӡ��</td>
      <td width="31%"> 
        <select name="crm_zxhfjl_gsztyx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='7' order by hfjgbm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">ϣ���Ľ�����</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_xwgjfm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='8' order by hfjgbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ�����ط�</td>
      <td width="31%"><%
	cf.radioToken(out, "crm_zxhfjl_sfjxhf","Y+�����ط�&N+�طý���","");
%> </td>
      <td align="right" width="17%">�´λط�����</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_xchfrq" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ط�ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_hfsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxhfjl_hfsj2" size="20" maxlength="10" >
      </td>
    </tr>
<%
if (yhjs.equals("A0"))
{
	%>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ط���</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_hfr" size="20" maxlength="20" value="" >
      </td>
      <td align="right" width="17%">�طò���</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
        </select>
      </td>
    </tr>
	<%
}
else{
	%>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ط���</td>
      <td width="31%"> 
        <input type="text" name="crm_zxhfjl_hfr" size="20" maxlength="20" value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="17%">�طò���</td>
      <td width="33%"> 
        <select name="crm_zxhfjl_hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
		%> 
        </select>
      </td>
    </tr>
	<%
}
%>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ�����������</td>
      <td colspan="3"> 
        <INPUT type="radio" name="crm_zxhfjl_clfs" value="0">
        ������ 
        <INPUT type="radio" name="crm_zxhfjl_clfs" value="1">
        ���ѵ��� 
        <INPUT type="radio" name="crm_zxhfjl_clfs" value="2">
        �������ʦ </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
