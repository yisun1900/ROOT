<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<style type="text/css">
<!--
.STYLE1 {color: #0000CC; font-weight: bold; }
-->
</style>
<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
String dwbh=(String)session.getAttribute("dwbh");

String xzzwbm=cf.fillNull(cf.executeQuery("select xzzwbm from sq_yhxx where ygbh="+ygbh));

String zwbm=(String)session.getAttribute("zwbm");
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
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khsmjlCxList.jsp" name="selectform">
<div align="center">�ͻ����ż�¼����ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"> �����ֹ�˾ </td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      </select>    </td>
    <td align="right"> ��ѯ���� </td>
    <td><select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
      </select>    </td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC">�г���</td>
    <td bgcolor="#FFFFCC">
	<select name="ywybm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
		if (xzzwbm.equals("�г�������"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh",dwbh);
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc||'('||ssfgs||')' from sq_dwxx where dwflbm='07' and dwlx='F1' and ssfgs='"+ssfgs+"' order by ssfgs,dwbh","");
		}
		%>
    </select></td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_khbh" size="20" maxlength="20" ></td>
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">�ͻ�����</span></td>
  <td><input type="text" name="khxm" size="20" maxlength="20" >  </td>
  <td align="right">�ͻ�����</td>
  <td><input type="text" name="khxm2" size="14" maxlength="20" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">���ݵ�ַ </span></td>
  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
  <td align="right">���ݵ�ַ</td>
  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
    ��ģ����ѯ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">��ϵ��ʽ </span></td>
  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
  <td align="right">��ϵ��ʽ</td>
  <td><input type="text" name="lxfs2" size="14" maxlength="50" >
    ��ģ����ѯ��</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ</td> 
  <td width="32%"><input name="crm_zxkhxx_sjs" type="text"  value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>></td>
  <td align="right" width="18%">ҵ��Ա</td> 
  <td width="32%"><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">�Ӵ���</span></td>
  <td><select name="jdrbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
  </select></td>
  <td align="right">�Ӵ���</td>
  <td><input type="text" name="jdr" size="14" maxlength="20" >
    ��ģ����ѯ��</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��¼��</td>
  <td><input type="text" name="crm_khsmjl_jlh" size="20" maxlength="10" ></td>
  <td align="right">����Ŀ��</td>
  <td><select name="crm_khsmjl_smmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select smmd c1,smmd c2 from dm_smmd order by smmd","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� ��</td>
  <td><input type="text" name="crm_khsmjl_smsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_khsmjl_smsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ӵ����¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_jdjglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td> 
  <td width="32%"><input type="text" name="crm_khsmjl_jdjglrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ӵ����¼����</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_jdjglrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">�����</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_shr" size="20" maxlength="20" ></td> 
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ�� ��</td>
  <td><input type="text" name="crm_khsmjl_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_khsmjl_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�ط�</td>
  <td><INPUT type="radio" name="sfhf" value="Y">
�ط�
  <INPUT type="radio" name="sfhf" value="N">
δ�ط� </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="crm_khsmjl_lrr" size="20" maxlength="20" ></td>
  <td align="right">���Ŵ���</td>
  <td><select name="lfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+��һ��&2+�ڶ���&3+������&4+���Ĵ�&5+�����&6+������&7+���ߴ�&8+�ڰ˴�&9+�ھŴ�","");
%> 
        </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="crm_khsmjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">״̬</td>
  <td><INPUT type="radio" name="crm_khsmjl_zt" value="1">
    δ¼���
    <INPUT type="radio" name="crm_khsmjl_zt" value="2">
    ��¼���
    <INPUT type="radio" name="crm_khsmjl_zt" value="3">
    ����� </td>
  <td align="right">����Ƿ���ʵ</td>
  <td><input type="radio" name="crm_khsmjl_qksfss" value="Y">
    ��ʵ
    <input type="radio" name="crm_khsmjl_qksfss" value="N">
    ����ʵ </td>
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

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

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
	strToSelect(selectform.zxdm,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khsmjl_smsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_smsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.jdrbh, "�Ӵ��˱��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_jdjglrsj, "�Ӵ����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_jdjglrsj2, "�Ӵ����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_shsj2, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khsmjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
