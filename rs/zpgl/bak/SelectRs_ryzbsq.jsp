<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ryzbsqList.jsp" name="selectform">
<div align="center">��ѯ��Ա����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="sqbh" size="20" maxlength="8" >
  </td>
    <td align="right" width="15%">����ְ��</td> 
  <td width="35%"> 
           <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�걨�ֹ�˾</td> 
    <td width="35%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select></td>
    <td align="right" width="15%">���벿��</td> 
    <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
    </select>
    </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
    <option value=""></option>
<%
	cf.selectToken(out,"1+ȱԱ����&2+�������&3+��������&4+����","");
%>
    </select>
  </td>
    <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20"  disabled="ture">
    ѡ<span class="STYLE1">����</span>����д  </td>
</tr>
<tr bgcolor="#FFFFFF">

	  <td align="right" width="15%">����Ա��</td> 
  <td width="35%"> 
    <input type="text" name="zbye" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">����״̬</td> 
  <td width="35%"> 
    <select name="jhzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="1">¼�����</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ϣ������ʱ�� �� </td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
    <td align="right" width="15%">ϣ������ʱ�� �� </td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ա�</td> 
  <td width="35%"> 
    <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+������&1+��&2+Ů","");
%>
    </select>
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <select name="hy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+������&1+�ѻ�&2+δ��","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="nl" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">ѧ��</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+��ר&2+��ѧ&3+˶ʿ","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">רҵ</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="40" >
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���������</td> 
  <td width="35%"> 
    <input type="text" name="jsjjn" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="60" >
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200" >
  </td>
  <td>&nbsp;</td><td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
    <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
     <td align="right" width="15%">¼���˷ֹ�˾</td> 
  <td width="35%"> 
         <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� �� </td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
    <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "4")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.zbye, "����Ա��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "ϣ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
