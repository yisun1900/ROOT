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
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	
	String zwbm=(String)session.getAttribute("zwbm");
	String yhmc=(String)session.getAttribute("yhmc");
	String zjxm=yhmc;
	if (!zwbm.equals("05"))
	{
		zjxm="";
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_heysjlCxList.jsp" name="selectform">
<div align="center">�������ռ�¼����ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right" >��ʾ���</td>
	  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
		��ҳ
		<input type="radio" name="xsfg" value="2">
		EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
		<input type="text" name="myxssl" size="7" maxlength="13" value="25">              </td>
	</tr>
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
    <td align="right"> ǩԼ���� </td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
    <td align="right">��ͬ��</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">�ͻ����</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ʦ</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ʩ����</td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%>
    </select></td>
    <td align="right">����</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20" value="<%=zjxm%>" <% if (!zjxm.equals("")) out.println("readonly");%>></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> ��ϵ��ʽ </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ���ݵ�ַ </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ռ�¼��</td> 
  <td width="32%"> 
    <input type="text" name="ysjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">���մ�����¼��</td> 
  <td width="32%"> 
    <input type="text" name="yscsjlh" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���հ汾��</td> 
  <td width="32%"> 
	<select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<%
		cf.selectItem(out,"select gcysbbh,gcysbbmc||'('||DECODE(sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','��ͣ��')||')' from dm_hegcysbb order by gcysbbh","");
	%>
    </select>  </td>
  <td align="right" width="18%">���Ĵ���״̬</td> 
  <td width="32%"><select name="clbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"9+¼��δ���&0+û����&1+����δ����&2+����&3+�Ѵ���&4+�ѽ��&5+����ͨ��&6+����δͨ��","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������Ŀ</td>
  <td><select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm where gcysbbh in(select gcysbbh from dm_hegcysbb where sfzybb='2') order by gcysxmbm","");
%>
  </select></td>
  <td align="right">������Ŀ����</td>
  <td><input type="text" name="gcysxmmc" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ŀ����ʱ���</td> 
  <td width="32%"><input type="text" name="yssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="yssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ŀ������</td> 
  <td width="32%"> 
    <input type="text" name="ysr" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">��Ŀ���ս��</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "sjysjg","0+�ϸ�&1+������","");
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ����ʱ�� ��</td>
  <td><input type="text" name="jhjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jhjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���Ĵ����¼��</td> 
  <td width="32%"><input type="text" name="zgcljlh" size="20" maxlength="25" ></td>
  <td align="right" width="18%">���Ľ�����</td> 
  <td width="32%"> 
    <input type="text" name="jsr" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���Ľ���ʱ�� ��</td>
  <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"><%
	cf.radioToken(out, "cljg","3+�ڴ���&4+�ѽ��","");
%></td>
  <td align="right" width="18%">���Ĵ�����</td> 
  <td width="32%"><input type="text" name="jjr" size="20" maxlength="100" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���Ĵ���ʱ���</td> 
  <td width="32%"><input type="text" name="jjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������ս��</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "zgysjg","5+�ϸ�&6+���ϸ�","");
%>  </td>
  <td align="right" width="18%">����������</td> 
  <td width="32%"> 
    <input type="text" name="zgysr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������ʱ���</td>
  <td><input type="text" name="zgyssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="zgyssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ����ûط�</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfszhf","Y+��&N+��","");
%></td>
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ƭ���� ��</td>
  <td><input type="text" name="zpsl" size="20" maxlength="10"  ></td>
  <td align="right">��</td>
  <td><input type="text" name="zpsl2" size="20" maxlength="10"  ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ��ɿ���Ƭ���� ��</td>
  <td><input type="text" name="khkkzpsl" size="20" maxlength="10"  ></td>
  <td align="right">��</td>
  <td><input type="text" name="khkkzpsl2" size="20" maxlength="10"  ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ϸ���Ƭ���� ��</td>
  <td><input type="text" name="bhgzpsl" size="20" maxlength="10"  ></td>
  <td align="right">��</td>
  <td><input type="text" name="bhgzpsl2" size="20" maxlength="10"  ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ���¼���־</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "padlrbz","0+����&1+�ͻ���","");
%>  </td>
  <td align="right" width="18%">�����ű�־ </td>
  <td width="32%"><%
	cf.radioToken(out, "fdxbz","1+δ����&2+����","");
%></td>
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


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

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

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.yssj, "��Ŀ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj2, "��Ŀ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj2, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "���Ľ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "���Ľ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jjsj, "���Ĵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jjsj2, "���Ĵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgyssj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgyssj2, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	if(!(isNumber(FormName.zpsl, "��Ƭ����"))) {
		return false;
	}
	if(!(isNumber(FormName.zpsl2, "��Ƭ����"))) {
		return false;
	}
	if(!(isNumber(FormName.khkkzpsl, "�ͻ��ɿ���Ƭ����"))) {
		return false;
	}
	if(!(isNumber(FormName.khkkzpsl2, "�ͻ��ɿ���Ƭ����"))) {
		return false;
	}
	if(!(isNumber(FormName.bhgzpsl, "���ϸ���Ƭ����"))) {
		return false;
	}
	if(!(isNumber(FormName.bhgzpsl2, "���ϸ���Ƭ����"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
