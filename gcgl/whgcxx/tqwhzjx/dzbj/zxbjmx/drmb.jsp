<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����ģ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%

	String yhdlm=(String)session.getAttribute("yhdlm");
	String khbh=request.getParameter("khbh");
	String dqbm=request.getParameter("dqbm");
	String ssfgs=cf.executeQuery("select ssfgs from crm_zxkhxx where khbh='"+khbh+"'");
	String zxdm=cf.executeQuery("select zxdm from crm_zxkhxx where khbh='"+khbh+"'");
	String sjs=cf.executeQuery("select sjs from crm_zxkhxx where khbh='"+khbh+"'");
	String xqbm=cf.executeQuery("select xqbm from crm_zxkhxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<div align="center"> </div>
<form method="post" action="" name="editform" >
	<input name="fgsbh" type="hidden" value="<%=ssfgs%>">
  <input type="hidden" name="khbh" value="<%=khbh%>">
  <input type="hidden" name="dqbm" value="<%=dqbm%>">
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>1����ģ��--&gt;���뱨��</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"><font color="#FF0000">˵������ģ��ġ�������Ŀ���͡�������Ϣ�������뵽Ŀǰ�����У�ģ����</font></td>
    </tr>
    <tr> 
      <td width="33%" height="65" align="right">ģ������</td>
      <td width="67%" height="65"> 
        <select name="mbmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct mbmc||'+'||yhdlm c1,mbmc||DECODE(bj_bjmbfjxx.mblx,'1','������ģ�壩','2','��˽��ģ�壩') c2  from bj_bjmbfjxx where (yhdlm='"+yhdlm+"' and mblx='2') OR mblx='1' order by c1","");
%> 
        </select>
        <input type="button"  value="����" onClick="f_drmb(editform)" >
        <input type="button"  value="�鿴ģ��" onClick="f_ckmb(editform)">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>2������ʱ����--&gt;����</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"><font color="#FF0000">˵��������ǰ�������ʱ���ۣ��滻Ŀǰ����</font>
	  
	  </td>
    </tr>
    <tr> 
      <td width="33%" height="65" align="right">��ʱ��������</td>
      <td width="67%" height="65"> 
        <select name="sclsbjmc" style="FONT-SIZE:12PX;WIDTH:224PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct mbmc c1,mbmc c2  from bj_mbbjxmmx where khbh='"+khbh+"' order by mbmc","");
%> 
        </select>
        <input type="button"  value="����" onClick="f_drlsbj(editform)" name="button">
        <input type="button"  value="�鿴��ʱ����" onClick="f_cklsbj(editform)" name="button2">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>3�����Ʊ��ۡ���ͬ���ʦ��Ҳ�ɸ��Ʊ��ۡ���<font color="#FF0000">˵������ĳ���ͻ��ı��ۣ��滻Ŀǰ����</font>��</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"> 
	   ͬС���ͻ�����
        <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="6%">�ͻ����</td>
			<td  width="8%">����</td>
			<td  width="8%">����</td>
			<td  width="14%">С��/�ֵ�</td>
			<td  width="9%">��ѯ״̬</td>
			<td  width="10%">���ӱ����ܶ�</td>
			<td  width="7%">���ۼ���</td>
			<td  width="6%">��װ��־</td>
			<td  width="12%">��ѯ����</td>
			<td  width="7%">���ʦ</td>
			<td  width="9%">¼��ʱ��</td>
		</tr>
		<%
			ybl.common.PageObject pageObj=new ybl.common.PageObject();
			String ls_sql=null;

			ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm,cqmc,crm_zxkhxx.xqbm,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),dzbjze,bjjbmc,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),sq_dwxx.dwmc as zxdm,sjs,lrsj";
			ls_sql+=" FROM crm_zxkhxx,sq_dwxx,bdm_bjjbbm,dm_cqbm ";
			ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and crm_zxkhxx.cqbm=dm_cqbm.cqbm(+)";
			ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
			ls_sql+=" and crm_zxkhxx.zxdm='"+zxdm+"' and crm_zxkhxx.sjs='"+sjs+"'";
			ls_sql+=" order by crm_zxkhxx.khxm";
//			out.println(ls_sql);
			pageObj.sql=ls_sql;
		//���ж����ʼ��
			pageObj.initPage("","","","");
			pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��


		//��������
			String[] keyName={"khbh"};
			pageObj.setKey(keyName);

			pageObj.out=out;
			pageObj.getDate(1);

			pageObj.displayDate();

		%>
		</table>	  
	  
	  
	  
	  </td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="65">�ͻ������ֹ�˾ <%
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	%> �ͻ���� 
        <input type="text" name="copykhbh" maxlength="7" size="10">
        �ͻ����� 
        <input type="text" name="khxm" maxlength="20" size="20">
        <input type="button"  value="����" onClick="f_copy(editform)" name="button">
      </td>
    </tr>
  </table>
  <HR>
  <table width="100%" border="0">
    <tr> 
      <td height="23" colspan="2" align="center"><b>4�����±���</b></td>
    </tr>
    <tr> 
      <td height="5" colspan="2" align="center"><font color="#FF0000">˵�������ڱ��۵���������ԭ����Ҫ�Ըÿͻ������б�����Ŀ�������µı����滻</font></td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="65">
        <input type="button"  value="���±���" onClick="f_update(editform)" name="button">
      </td>
    </tr>
  </table>
  <HR>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_drmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("��ѡ����[ģ������]��");
		FormName.mbmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveDrmb.jsp";
	FormName.submit();
	return true;
}
function f_drlsbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("������[��ʱ��������]��");
		FormName.sclsbjmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveDrlsbj.jsp";
	FormName.submit();
	return true;
}
function f_ckmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.mbmc)=="") {
		alert("��ѡ����[ģ������]��");
		FormName.mbmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ViewBj_bjmb.jsp";
	FormName.submit();
	return true;
}
function f_cklsbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sclsbjmc)=="") {
		alert("������[��ʱ��������]��");
		FormName.sclsbjmc.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="ViewBj_lsbj.jsp";
	FormName.submit();
	return true;
}
function f_copy(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ͻ������ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.copykhbh)=="") {
		alert("������[�ͻ����]��");
		FormName.copykhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}

	FormName.target="";
	FormName.action="Crm_zxkhxxCxList.jsp";
	FormName.submit();
	return true;
}
function f_update(FormName)//����FormName:Form������
{
	if ( !confirm("ע�⣡�޸ĺ󲻿ɻָ���ȷʵҪ������?") )	
	{
		return;
	}

	FormName.target="";
	FormName.action="UpdateAllXmbj.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
