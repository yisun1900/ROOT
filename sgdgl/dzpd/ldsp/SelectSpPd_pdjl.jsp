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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Pd_pdjlSpList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="34%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������</div>
              </td>
              <td width="33%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="34%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >
              </td>
              <td width="16%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">ǩԼ�� ��</td>
              <td width="33%"> 
                <input type="text" name="qye" size="20" maxlength="8" >
              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="qye2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">ǩԼ���� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">Ӧ�������� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="kgrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
              </td>
              <td width="34%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">�ֹ�˾</td>
              <td width="33%">
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
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
              <td width="16%" align="right">ǩԼ����</td>
              <td width="34%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"'  order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="33%">
                <input type="text" name="sjs" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">�ʼ�</div>
              </td>
              <td width="34%">
                <input type="text" name="zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">¼��ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ص���־</div>
              </td>
              <td width="33%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="34%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�ɵ�ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="pdsj" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="pdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">����ʩ����</td>
              <td width="33%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
%> 
                </select>
              </td>
              <td width="16%" align="right">�ɵ�״̬</td>
              <td width="34%"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="3">�ܾ��ɵ�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�Ƿ��ʵ</td>
              <td width="33%"> 
                <select name="sfhs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">��ʵ</option>
                </select>
              </td>
              <td width="16%" align="right">�쵼��������</td>
              <td width="34%"> 
                <select name="ldspjl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="0">δ����</option>
                  <option value="Y">ͬ�����</option>
                  <option value="N">����ԭ��</option>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.qye, "ǩԼ��"))) {
		return false;
	}
	if(!(isNumber(FormName.qye2, "ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq2, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "�ɵ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "�ɵ�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
