<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Sq_grxxbList.jsp" name="selectform">
<div align="center">ά��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">�ֹ�˾</td>
    <td>
	  <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      </select>	</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right">�����ӳ�</td> 
  <td width="32%"><select name="sq_grxxb_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeSgd(selectform)">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else 
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select sgd,sgdmc||'��'||DECODE(sq_sgd.cxbz,'Y','����,')||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
	}
%>
  </select></td>
  <td width="18%" align="right">�����೤</td> 
  <td width="32%"> 
    <select name="sq_grxxb_bzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <input type="text" name="sq_grxxb_xm" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�Ա�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sq_grxxb_xb","��+��&Ů+Ů","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <input type="text" name="sq_grxxb_jg" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">סַ</td> 
  <td width="32%"><input type="text" name="sq_grxxb_zz" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "sq_grxxb_gz","ľ��+ľ��&ˮ�繤+ˮ�繤&���Ṥ+���Ṥ&�߹�+�߹�&�ӹ�+�ӹ�","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ϸ�֤���</td>
  <td><input name="sgzbh" type="text" id="sgzbh" value="" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������� �� </td>
  <td><input type="text" name="sq_grxxb_csrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="sq_grxxb_csrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ְʱ�� ��</td>
  <td><input type="text" name="sq_grxxb_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="sq_grxxb_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ְʱ�� ��</td>
  <td><input type="text" name="lzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="lzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ȼ�</td> 
  <td width="32%"> 
    <input type="text" name="sq_grxxb_dj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <INPUT type="radio" name="sq_grxxb_lx" value="��ʱ">��ʱ
    <INPUT type="radio" name="sq_grxxb_lx" value="����">����
    <INPUT type="radio" name="sq_grxxb_lx" value="��ְ">��ְ  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���֤��</td> 
  <td width="32%"> 
    <input type="text" name="sq_grxxb_sfzh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">�绰</td> 
  <td width="32%"><input type="text" name="sq_grxxb_dh" size="20" maxlength="20" ></td>
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

var fieldName="";

<%
	//����Ajax
	cf.ajax(out);
%>
function changeFgs(FormName) 
{
	FormName.sq_grxxb_sgd.length=1;
	FormName.sq_grxxb_bzmc.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="fgs";

	var sql;
	sql="select sgd,sgdmc||'��'||DECODE(sq_sgd.cxbz,'Y','����,')||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+FormName.fgs.value+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeSgd(FormName) 
{
	FormName.sq_grxxb_bzmc.length=1;

	if (FormName.sq_grxxb_sgd.value=="")
	{
		return;
	}

	fieldName="sgd";


	var sql;
	sql="select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+FormName.sq_grxxb_sgd.value+"' order by bzmc";


	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="fgs")
	{
		strToSelect(selectform.sq_grxxb_sgd,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.sq_grxxb_bzmc,ajaxRetStr);
	}
}



function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.sq_grxxb_csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_grxxb_csrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_grxxb_rzsj, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_grxxb_rzsj2, "��ְʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
