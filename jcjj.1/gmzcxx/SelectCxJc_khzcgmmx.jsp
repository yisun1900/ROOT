<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


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
<form method="post" action="" name="selectform">
<div align="center">���Ĺ�����ϸ����ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC">�ֹ�˾ </td>
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
    </select></td>
    <td align="right"> ǩԼ����</td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select></td>
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
    <td align="right">�ʼ�</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font></td>
    <td><input type="text" name="lxfs" size="20" maxlength="50"></td>
    <td align="right">��ϵ��ʽ</td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td height="23" colspan="4" align="right">&nbsp;</td> 
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���Ĵ���</td> 
  <td width="32%"> 
    <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(selectform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlmc","");
%>
    </select>  </td>
  <td align="right" width="19%">����С��</td> 
  <td width="31%"> 
    <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(selectform)">
    <option value=""></option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ʒ�ƹ�Ӧ������</td>
  <td colspan="3"><select name="ppgys" style="FONT-SIZE:12PX;WIDTH:531PX" onClick="getThis(selectform)">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ԭ��</td> 
  <td width="32%"> 
    <input type="text" name="jc_khzcgmmx_yj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">�ۺ��</td> 
  <td width="31%"> 
    <input type="text" name="jc_khzcgmmx_zhj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <input type="text" name="jc_khzcgmmx_dj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">ʵ�տ�</td> 
  <td width="31%"> 
    <input type="text" name="jc_khzcgmmx_ssk" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���� ��</td> 
  <td width="32%"><input type="text" name="jc_khzcgmmx_rq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">��</td> 
  <td width="31%"><input type="text" name="jc_khzcgmmx_rq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC">��ѯ�������</td>
  <td colspan="3"> ��һ��
    <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys" selected>Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
      </select>
    �ڶ���
    <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    ������
    <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    <BR>
    <BR>
    ������
    <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    ������
    <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    ������
    <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" >��ʾ���</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    ��ҳ
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
    <input type="text" name="myxssl" size="7" maxlength="13" value="25">  </td>
</tr>
<tr align="center">
  <td colspan="4"><input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
      <input type="reset"  value="����">  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">ͳ�Ʊ�</td>
  <td colspan="3"> ��һ��
    <input type="hidden" name="tj1name" value="">
      <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
        <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
      </select>
    �ڶ���
    <input type="hidden" name="tj2name" value="">
    <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    ������
    <input type="hidden" name="tj3name" value="">
    <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    <BR>
    <BR>
    ������
    <input type="hidden" name="tj4name" value="">
    <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    ������
    <input type="hidden" name="tj5name" value="">
    <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>
    ������
    <input type="hidden" name="tj6name" value="">
    <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
      <option value=""></option>
        <option value="zcdlbm">���Ĵ���</option>
        <option value="zcxlbm">����С��</option>
        <option value="ppgys">Ʒ�ƹ�Ӧ��</option>
        <option value="rq">����</option>
        <option value="crm_khxx.khbh">�ͻ����</option>
        <option value="khxm">�ͻ�����</option>
        <option value="fwdz">���ݵ�ַ</option>
        <option value="sjs">��װ���ʦ</option>
    </select>  </td>
</tr>
<tr align="center">
  <td colspan="4"><input type="button"  value="ͳ�Ʊ�" onClick="f_do(selectform,'tj')" name="button2">  </td>
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

var czlx;
var gysMark=0;

function changeFgs(FormName)
{
	if (FormName.fgs.value=="")
	{
		return;
	}

	gysMark=0;
	FormName.ppgys.length=1;

	czlx=1;

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

function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	FormName.ppgys.length=1;

	var sql="select zcxlmc from jdm_zcxlbm where zcdlmc='"+FormName.zcdlbm.value+"' order by zcxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;
//	window.open(actionStr);

	openAjax(actionStr);
}

function changeXl(FormName)
{
	gysMark=0;
	FormName.ppgys.length=1;
}

function getThis(FormName)
{
	if (FormName.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}

	czlx=3;

	if (gysMark==0)
	{
		FormName.ppgys.length=1;

		var sql="select sq_gysxx.gysmc c1,sq_gysxx.gysmc c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='"+FormName.fgs.value+"' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+FormName.zcxlbm.value+"' order by sq_gysxx.gysmc";
		var actionStr="/ajax/selectstr.jsp?sql="+sql;

		openAjax(actionStr);

		gysMark=1;
	}
}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToItem2(selectform.zcxlbm,ajaxRetStr);
	}
	else if (czlx==3)
	{
		strToSelect(selectform.ppgys,ajaxRetStr);
	}
}


function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isFloat(FormName.jc_khzcgmmx_yj, "ԭ��"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_khzcgmmx_zhj, "�ۺ��"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_khzcgmmx_dj, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_khzcgmmx_ssk, "ʵ�տ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmmx_rq, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_khzcgmmx_rq2, "����"))) {
		return false;
	}

	if (lx=="cx")
	{
		FormName.action="Jc_khzcgmmxCxList.jsp";
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="" && FormName.tj4.value=="" && FormName.tj5.value=="" && FormName.tj6.value=="")
		{
			alert("��ѡ��[ͳ����]��");
			FormName.tj1.focus();
			return false;
		}

		FormName.action="Jc_khzcgmmxTjList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
