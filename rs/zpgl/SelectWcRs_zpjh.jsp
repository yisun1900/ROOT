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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_zpjhWcList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ������</td> 
  <td width="35%"> 
    <input type="text" name="zpsqbh" size="20" maxlength="10" >
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
  <td align="right" width="15%">��Ƹ�ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,sqbm,<%=dwstr%>)">
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
    </select>
  </td>
  <td align="right" width="15%">���벿��</td> 
  <td width="35%"> 
    <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="15%">����Ա��</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+ȱԱ����&2+�������&3+��������","");
%>
    </select>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ϣ������ʱ�� ��</td> 
  <td width="35%"><input type="text" name="xwdgsj" size="20" maxlength="10" ></td> 
  <td align="right" width="15%">ϣ������ʱ�� ��</td>    
  <td width="35%"> 
	<input type="text" name="xwdgsj2" size="20" maxlength="10" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ա�Ҫ��</td> 
  <td width="35%"> 
    <select name="xbyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+��&2+Ů","");
%>
    </select>
  </td>
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <select name="hyyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+�ѻ�&2+δ��","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="nlyq" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">��������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ѧ��Ҫ��</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+����&1+��ר&2+��ѧ&3+˶ʿ","");
%>
    </select>
  </td>
  <td align="right" width="15%">רҵҪ��</td> 
  <td width="35%"> 
    <input type="text" name="zy" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="wy" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">���������Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="jsjnl" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="gx" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="jn" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����Ҫ��</td> 
  <td width="35%"> 
    <input type="text" name="qt" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">��Ƹ����״̬</td> 
  <td width="35%"> 
    <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"04+��ʼ��Ƹ","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ա��������</td> 
  <td width="35%"> 
	<input type="text" name="rygznr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
  	<input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
	<input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
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
  <td align="right" width="15%">����״̬����</td> 
  <td width="35%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm  order by ztbm","");
%>
    </select>
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.zprs, "����Ա��"))) {
		return false;
	}
	if(!(isFloat(FormName.zpfy, "��Ƹ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "ϣ������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj2, "ϣ������ʱ��"))) {
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
