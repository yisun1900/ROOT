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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_zqkzjxdjCxList.jsp" name="selectform">
<div align="center"><strong>���ڿ�������Ǽ�-��ѯ</strong></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td bgcolor="#FFFFCC"><div align="right">�ֹ�˾</div></td>
    <td><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' and cxbz='N' order by ssdw,dwbh");

        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>    </td>
    <td><div align="right">ǩԼ����</div></td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ͬ��</td>
    <td><input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">    </td>
    <td align="right">�ͻ����</td>
    <td><input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ʦ</td>
    <td><input type="text" name="sjs" size="20" maxlength="20" >    </td>
    <td align="right">���̵���</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20" >    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><div align="right">�ͻ�����</div></td>
    <td><input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)">    </td>
    <td><div align="right">��ϵ��ʽ</div></td>
    <td><input type="text" name="lxfs" size="20" maxlength="50"  onkeyup="keyGo(fwdz)">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ�����</td>
    <td><input type="text" name="khxm2" size="12" maxlength="50" >
      ��ģ����ѯ�� </td>
    <td align="right">���ݵ�ַ</td>
    <td><input type="text" name="fwdz2" size="20" maxlength="50">
      ��ģ����ѯ�� </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><div align="right">���ݵ�ַ</div></td>
    <td colspan="3"><input type="text" name="fwdz" size="72" maxlength="100" onKeyUp="keyGo(butt)" >    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="29" colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%">һ�ڿ�ʵ�ս��</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_yqkje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ڿ�Ӧ�ս��</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_eqkje" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">ʵ��Ӧ�ս��</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_sjysje" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"> 
    <input type="text" name="cw_zqkzjxdj_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"><select name="cw_zqkzjxdj_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="cw_zqkzjxdj_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_zqkzjxdj_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ڿ�Ӧ��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="cw_zqkzjxdj_eqksj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td>
  <td width="32%"><input type="text" name="cw_zqkzjxdj_eqksj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.cw_zqkzjxdj_yqkje, "һ�ڿ�ʵ�ս��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_eqksj, "���ڿ�Ӧ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_eqksj2, "���ڿ�Ӧ��ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zqkzjxdj_eqkje, "���ڿ�Ӧ�ս��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zqkzjxdj_sjysje, "ʵ��Ӧ�ս��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zqkzjxdj_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
