<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����֪ͨ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
%>


<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbmCxList.jsp" name="selectform">
          
<div align="center">���޴���</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right" >���β��Ŵ���״̬</td>
      <td colspan="3" ><input type="radio" name="clzt" value="1" checked>
δ���
  <input type="radio" name="clzt" value="3">
�ѽ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >�ֹ�˾</td>
      <td width="32%" > 
		<select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		%> 
		</select>
	  </td>
      <td width="18%"  align="right">���޲���</td>
      <td width="32%" > 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
		%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC">��ͬ��</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">�ͻ����</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC">���ʦ</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="sjs" size="20" maxlength="20">
      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">�ʼ�</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="zjxm" size="20" maxlength="20">
      </td>
    </tr>
    <tr>
      <td width="18%" align="right" bgcolor="#FFFFCC">ʩ����</td>
      <td width="32%" bgcolor="#FFFFCC">
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
          <option value=""></option>
        </select>
      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">ʩ������</td>
      <td width="32%" bgcolor="#FFFFCC">
        <input type="text" name="sgbz" size="20" maxlength="20" >
      </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>�ͻ�����</b></font></td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="18%" align="right" bgcolor="#FFFFCC">�ͻ�����</td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></div>
      </td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right">��ϵ��ʽ</div>
      </td>
      <td width="32%" bgcolor="#FFFFCC"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        ��ģ����ѯ�� </td>
    </tr>
    <tr> 
      <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
      <td colspan="3" bgcolor="#FFFFCC"> 
        <input type="text" name="fwdz" size="71" maxlength="100">
      </td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right">���ݵ�ַ</div>
      </td>
      <td colspan="3" bgcolor="#FFFFCC"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >���޴���</td>
      <td width="32%" > 
        <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tslxbm')" onChange="tsxlbmMark=0;crm_tsbm_tsxlbm.length=1">
          <option value=""></option>
        </select>
      </td>
      <td width="18%"  align="right">����С��</td>
      <td width="32%" > 
        <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('tsxlbm')">
          <option value=""></option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#999999"> 
      <td width="18%" bgcolor="#E8E8FF" align="right"><b><font color="#0000CC">���ޱ���Ʒ��</font></b></td>
      <td width="32%" bgcolor="#E8E8FF"> 
        <input type="text" name="crm_tsbm_tspp" size="20" maxlength="50" >
      </td>
      <td width="18%" bgcolor="#E8E8FF" align="right">���ޱ���Ʒ��</td>
      <td width="32%" bgcolor="#E8E8FF"> 
        <input type="text" name="crm_tsbm_tspp2" size="14" maxlength="50" >
        ��ģ����ѯ�� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >�ͷ�����ʱ�� ��</td>
      <td  width="32%"> 
        <input type="text" name="slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td  align="right" width="18%">��</td>
      <td  width="32%"> 
        <input type="text" name="slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" >¼��ʱ�� ��</td>
      <td  width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td  align="right" width="18%">��</td>
      <td  width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" value="����" onClick="f_do(selectform)">
        <input type="reset" value="����">
      </td>
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

var sgdMark=0;
var tslxbmMark=0;
var tsxlbmMark=0;

var fieldName="";


function getThis(lx)
{
	var sql;
	fieldName=lx;

	if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'��'||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��')||'��'||DECODE(sq_sgd.cxbz,'N','','Y','��������') from sq_sgd where ssfgs='"+selectform.fgs.value+"' order by ssfgs,cxbz,sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}
	else if (lx=="tslxbm")
	{
		if (tslxbmMark==0)
		{
			var sql="select tslxbm,tslxmc from dm_tslxbm where tsdl='1' order by tslxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			tslxbmMark=1;
		}
	}
	else if (lx=="tsxlbm")
	{
		if (tsxlbmMark==0)
		{
			if (selectform.crm_tsbm_tslxbm.value=="")
			{
				selectform.crm_tsbm_tslxbm.focus();
				alert("��ѡ�񡾱��ޱ��޴��ࡿ");
				return;
			}

			sql="select tsxlbm,tsxlmc from dm_tsxlbm where tslxbm='"+selectform.crm_tsbm_tslxbm.value+"'  order by tsxlbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			tsxlbmMark=1;
		}
		else{
			tsxlbmMark=2;
		}
	}
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (fieldName=="sgd")
	{
		strToSelect(selectform.sgd,ajaxRetStr);
	}
	else if (fieldName=="tslxbm")
	{
		strToSelect(selectform.crm_tsbm_tslxbm,ajaxRetStr);
	}
	else if (fieldName=="tsxlbm")
	{
		strToSelect(selectform.crm_tsbm_tsxlbm,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.slsj, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.slsj2, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
