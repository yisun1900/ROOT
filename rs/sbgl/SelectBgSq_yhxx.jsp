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
<form method="post" action="Sq_yhxxBgList.jsp" name="selectform">
<div align="center">�籣���</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right">�ֹ�˾</td>
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
      <td width="20%" align="right">��������</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
			}
			else if (kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
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
      <td align="right" width="19%">Ա�����</td>
      <td width="31%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="20%">����</td>
      <td width="30%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">Ա������</td>
      <td width="31%"> 
        <input type="text" name="yhmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���֤��</td>
      <td width="31%"> 
        <input type="text" name="sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">����ְ��</td>
      <td width="30%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ�μӱ���</td>
      <td width="31%"><%
	cf.radioToken(out, "sfcjbx","Y+�α�&N+δ����&T+ͣ��&Z+ת��","");
%></td>
      <td align="right" width="20%">�Ƿ����ҽ�Ʊ���</td>
      <td width="30%"> 
        <input type="radio" name="ylbx" value="Y">
        �� 
        <input type="radio" name="ylbx" value="N">
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ�������ϱ���</td>
      <td width="31%"> 
        <input type="radio" name="jylbx" value="Y">
        �� 
        <input type="radio" name="jylbx" value="N">
        �� </td>
      <td align="right" width="20%">�Ƿ����ʧҵ����</td>
      <td width="30%"> 
        <input type="radio" name="sybx" value="Y">
        �� 
        <input type="radio" name="sybx" value="N">
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ���ɹ��˱���</td>
      <td width="31%"> 
        <input type="radio" name="gsby" value="Y">
        �� 
        <input type="radio" name="gsby" value="N">
        �� </td>
      <td align="right" width="20%">�Ƿ������������</td>
      <td width="30%"> 
        <input type="radio" name="syx" value="Y">
        �� 
        <input type="radio" name="syx" value="N">
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ᱣ�պ�</td>
      <td width="31%"> 
        <input type="text" name="shbxh" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">���ɻ���</td>
      <td width="30%"> 
        <input type="text" name="yjsxe" size="20" maxlength="16" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�籣����ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="sbblsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="sbblsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ͷ���ͬ���</td>
      <td width="31%"> 
        <input type="text" name="ldhtbh" value="" size="20" maxlength="14">
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ͷ���ͬ����</td>
      <td width="31%"> 
        <select name="ldhtlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtlx c1,ldhtlx c2 from dm_ldhtlx order by ldhtlxbm","");
%> 
        </select>
      </td>
      <td align="right" width="20%"><font color="#000099"></font>�Ͷ���ͬ����</td>
      <td width="30%"> 
        <select name="ldhtqx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ldhtqx c1,ldhtqx c2  from dm_ldhtqx order by ldhtqxbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ͬ��ʼ���� ��</td>
      <td width="31%"> 
        <input type="text" name="htksrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="htksrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ͬ�������� ��</td>
      <td width="31%"> 
        <input type="text" name="htdqrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">��</td>
      <td width="30%"> 
        <input type="text" name="htdqrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
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

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwlx,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq, "��ͬ��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq2, "��ͬ��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq, "��ͬ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq2, "��ͬ��������"))) {
		return false;
	}
	if(!(isFloat(FormName.yjsxe, "���ɻ���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
