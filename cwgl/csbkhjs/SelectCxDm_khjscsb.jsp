<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_khjscsbCxList.jsp" name="selectform"  onChange="changeFgs(selectform)">
<div align="center">�ͻ������������ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  <td align="right" width="18%">���������ۿ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sftzk","1+��&3+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��з�ȯ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyfq","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
  <td align="right" width="18%">�Ƿ��ж�������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydjfx","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��е���ȯ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydyq","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
  <td align="right" width="18%">�Ƿ��д���Ʒ����</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydxpzc","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��д�������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfydgzc","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
  <td align="right" width="18%">�Ƿ������ķ���</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyzcfk","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��пͻ��⳥��</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfykhpc","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
  <td align="right" width="18%">�Ƿ��н��㹤���Ż�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyjsgcyh","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ������ڷ�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyyqf","1+�ֹ�¼��&2+�Զ���ȡ&3+��","");
%>
  </td>
  <td align="right" width="18%">�����շ���Ŀ1</td> 
  <td width="32%"> 
    <select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����շ���Ŀ2</td> 
  <td width="32%"> 
    <select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
    </select>
  </td>
  <td align="right" width="18%">�����շ���Ŀ3</td> 
  <td width="32%"> 
    <select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���������1</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx1","1+��&3+��","");
%>
  </td>
  <td align="right" width="18%">������1����</td> 
  <td width="32%"> 
    <input type="text" name="qtx1mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���������2</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx2","1+��&3+��","");
%>
  </td>
  <td align="right" width="18%">������2����</td> 
  <td width="32%"> 
    <input type="text" name="qtx2mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ���������3</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfyqtx3","1+��&3+��","");
%>
  </td>
  <td align="right" width="18%">������3����</td> 
  <td width="32%"> 
    <input type="text" name="qtx3mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�������</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsp","1+��&3+��","");
%>
  </td>
  <td align="right" width="18%">�Ƿ��������Ȩ</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sfxsq","1+��&3+��","");
%>
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
	cf.ajax(out);//����AJAX
%>


function changeFgs(FormName) 
{
	FormName.sfxmbm1.length=1;
	FormName.sfxmbm2.length=1;
	FormName.sfxmbm3.length=1;

	if (FormName.fgsbh.value=="")
	{
		return;
	}

	var sql;
	sql="select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm in(select dqbm from sq_dwxx where dwbh='"+FormName.fgsbh.value+"') order by sfxmmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.sfxmbm1,ajaxRetStr);
	strToSelect(selectform.sfxmbm2,ajaxRetStr);
	strToSelect(selectform.sfxmbm3,ajaxRetStr);
}
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
