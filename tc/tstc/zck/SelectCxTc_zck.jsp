<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Tc_zckCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="tc_zck_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
  <td align="right">���ۼ���</td>
  <td><select name="tc_zck_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"><input type="text" name="tc_zck_cpbm" size="20" maxlength="13" ></td>
  <td align="right" width="18%">�ڲ�����</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_nbbm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <select name="cldl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(selectform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>  </td>
  <td align="right" width="18%">��ƷС��</td> 
  <td width="32%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
//	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm order by clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_cpmc" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">�ͺ�</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_xh" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_gg" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">Ʒ��</td> 
  <td width="32%"> 
    <select name="tc_zck_ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��</td> 
  <td colspan="3"> 
    <select name="tc_zck_gysmc" style="FONT-SIZE:12PX;WIDTH:522PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('1','3') order by gysmc","");
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������λ</td> 
  <td width="32%"><select name="tc_zck_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right" width="18%">�µ�������λ</td> 
  <td width="32%"><select name="tc_zck_xdjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��账��С��</td>
  <td colspan="3"><%
	cf.radioToken(out, "tc_zck_sfxclxs","1+����ȡ��&2+����ȡ��&3+4��5��&4+������","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "tc_zck_lx","1+�ײ���&2+������&3+�����&4+�ײ���","");
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����Ŀ����</td> 
  <td width="32%"><input type="text" name="tc_zck_lbxmbm" size="20" maxlength="6" ></td>
  <td align="right" width="18%">������Ŀ����</td> 
  <td width="32%"><input type="text" name="tc_zck_cxxmbm" size="20" maxlength="6" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ���Ч</td>
  <td colspan="3"><%
	cf.radioToken(out, "tc_zck_sfyx","1+��������&2+ֹͣ����&3+�׶�����&4+��ǰ��ʵ","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ч��ʼʱ�� ��</td> 
  <td width="32%"><input type="text" name="tc_zck_yxkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="tc_zck_yxkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ч����ʱ�� ��</td>
  <td><input type="text" name="tc_zck_yxjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="tc_zck_yxjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="tc_zck_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="tc_zck_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="tc_zck_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	//����Ajax
	cf.ajax(out);
%>

function changeDl(FormName)
{
	FormName.clxl.length=1;

	if (FormName.cldl.value=="")
	{
		return;
	}

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldl.value+"' order by clxlmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.clxl,ajaxRetStr);
}
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.tc_zck_yxkssj, "��Ч��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_yxkssj2, "��Ч��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_yxjzsj, "��Ч����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_yxjzsj2, "��Ч����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_zck_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
