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
<form method="post" action="Cw_sgdjljlCxList.jsp" name="selectform">
<div align="center">ʩ���ӽ�������ѯ</div>
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
    <td align="right">ʩ����</td>
    <td><select name="cw_sgdjljl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changeSgd(selectform)">
      <option value=""></option>
      <%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','') from sq_sgd where ssfgs='"+ssfgs+"' order by cxbz,sgdmc","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������¼��</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdjljl_jlh" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">�೤</td> 
  <td width="31%"><select name="sgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="cw_sgdjljl_jlsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_sgdjljl_jlsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdjljl_jlr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">�������</td> 
  <td width="31%"> 
    <input type="text" name="cw_sgdjljl_jlje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdjljl_shr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">���ʱ��</td> 
  <td width="31%"> 
    <input type="text" name="cw_sgdjljl_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ�ۿ���</td> 
  <td width="32%"> 
    <input type="text" name="cw_sgdjljl_skkr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ�ۿ�ʱ�� ��</td>
  <td><input type="text" name="cw_sgdjljl_skksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_sgdjljl_skksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="cw_sgdjljl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_sgdjljl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="cw_sgdjljl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">¼�벿��</td> 
  <td width="31%"> 
    <select name="cw_sgdjljl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ɾ����־</td> 
  <td width="32%"> 
    <INPUT type="radio" name="cw_sgdjljl_scbz" value="N">δɾ��
    <INPUT type="radio" name="cw_sgdjljl_scbz" value="Y">��ɾ��  </td>
  <td align="right" width="19%">״̬</td> 
  <td width="31%"><input type="radio" name="cw_sgdjljl_zt" value="1">
    δ���
      <input type="radio" name="cw_sgdjljl_zt" value="2">
      ���
      <input type="radio" name="cw_sgdjljl_zt" value="3">
      ����
      </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ɾ����</td> 
  <td width="32%"><input type="text" name="cw_sgdjljl_scr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">ɾ��ʱ�� </td>
  <td width="31%"><input type="text" name="cw_sgdjljl_scsj" size="20" maxlength="10" ></td>
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

var mark;
function changeFgs(FormName) 
{
	mark=1;
	FormName.cw_sgdjljl_sgd.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select sgd,sgdmc from sq_sgd where  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by sgdmc";
	}
	else{
		sql="select sgd,sgdmc from sq_sgd where  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by sgdmc";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function changeSgd(FormName) 
{
	mark=2;
	FormName.sgbz.length=1;

	if (FormName.cw_sgdjljl_sgd.value=="")
	{
		return;
	}

	var sql;
	sql="select bzmc c1,bzmc c2 from sq_bzxx where sgd='"+FormName.cw_sgdjljl_sgd.value+"' and tdbz in('N','Y') order by bzmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (mark==1)
	{
		strToSelect(selectform.cw_sgdjljl_sgd,ajaxRetStr);
	}
	else if (mark==2)
	{
		strToSelect(selectform.sgbz,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.cw_sgdjljl_jlsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_jlsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdjljl_jlje, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_skksj, "ʵ�ۿ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_skksj2, "ʵ�ۿ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdjljl_scsj, "ɾ��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
