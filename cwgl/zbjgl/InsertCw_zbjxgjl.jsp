<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String sgd=cf.GB2Uni(request.getParameter("sgd"));
%>
<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="5%">ʩ����</td>
	<td  width="6%">����</td>
	<td  width="9%">���</td>
	<td  width="10%">�ʱ������ԭ��</td>
	<td  width="7%">�����¼��</td>
	<td  width="8%">Ͷ�߱��޼�¼��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>
	<td  width="38%">��ע</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	ls_sql="SELECT cw_zbjxgjl.xuhao,sq_sgd.sgdmc,DECODE(cw_zbjxgjl.lx,'1','�ֹ�¼��','2','�깤����','3','����ά��') lx,cw_zbjxgjl.je,dm_zbjjsyybm.zbjjsyymc,cw_zbjxgjl.jsjlh,cw_zbjxgjl.tsjlh,cw_zbjxgjl.lrr,cw_zbjxgjl.lrsj,dwmc,cw_zbjxgjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjxgjl,sq_dwxx  ";
    ls_sql+=" where cw_zbjxgjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjxgjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjxgjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_zbjxgjl.sgd='"+sgd+"'";
    ls_sql+=" and cw_zbjxgjl.scbz='N'";
    ls_sql+=" order by cw_zbjxgjl.xuhao";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>
	</table>

<form method="post" action="SaveInsertCw_zbjxgjl.jsp" name="insertform" >
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">ʩ����</span></td>
      <td width="32%">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd  where sgd='"+sgd+"' ","");
%> 
        </select>      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span>���</td>
      <td width="32%"><input type="text" name="je" value="" size="20" maxlength="17" ></td>
      <td align="right" width="18%">�ʱ������ԭ��</td>
      <td width="32%"><select name="zbjjsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select zbjjsyybm,zbjjsyymc from dm_zbjjsyybm order by zbjjsyybm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
      <td width="32%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
      <td colspan="3"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+lrbm+"' ","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" name="bc" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset"></td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "���"))) {
		return false;
	}

	if (parseFloat(FormName.je.value)<0)
	{
		if(	javaTrim(FormName.zbjjsyybm)=="") {
			alert("��ѡ��[�ʱ������ԭ��]��");
			FormName.zbjjsyybm.focus();
			return false;
		}
	}
	else{
		FormName.zbjjsyybm.value="";
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("��ѡ��[��ע]��");
		FormName.bz.focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
