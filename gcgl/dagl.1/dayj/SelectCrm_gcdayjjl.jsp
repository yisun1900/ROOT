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
	String dmstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
%>

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_gcdayjjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ͬ��</td>
              <td width="33%"> 
                <input type="text" name="hth" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">              </td>
              <td width="16%" align="right">�ͻ����</td>
              <td width="34%"> 
                <input type="text" name="khbh" size="20" maxlength="20" onKeyUp="keyGo(lxfs)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�ͻ�����</div>              </td>
              <td width="33%"><input type="text" name="khxm" size="20" maxlength="50" onKeyUp="keyGo(lxfs)"></td>
              <td width="16%"> 
                <div align="right">��ϵ��ʽ</div>              </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  >              </td>
            </tr>

            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ֹ�˾</div>              </td>
              <td width="31%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dmstr%>)">
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
                </select>              </td>
              <td width="17%"> 
                <div align="right">ǩԼ����</div>              </td>
              <td width="33%"> 
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>              </td>
            </tr>


          <tr bgcolor="#FFFFFF">
            <td width="17%" align="right">������ϸ</td>
            <td width="33%"><select name="damxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
              <option value=""></option>
              <%
	cf.selectItem(out,"select damxbm,damxmc from dm_damxbm order by damxbm","");
%>
            </select></td>
            <td width="16%" align="right"><div align="right">������</div></td>
            <td width="34%"><input name="jsr" type="text" id="bgr" onKeyUp="keyGo(lrr)" size="20" maxlength="50"></td>
          </tr>
          <tr bgcolor="#FFFFCC">
            <td width="19%"><div align="right">���շֹ�˾</div></td>
            <td width="31%">
              <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"jsrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(jsrfgs,jsrdw,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"jsrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
            </select>            </td>
            <td width="17%"><div align="right">���յ�λ</div></td>
            <td width="33%"><select name="jsrdw" id="jsrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
              <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%>
            </select>            </td>
          </tr>
		            <tr bgcolor="#FFFFCC">
            <td width="19%"><div align="right">�ƽ��ֹ�˾</div></td>
            <td width="31%">
              <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"yjrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(yjrfgs,yjrdw,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"yjrfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
            </select>            </td>
            <td width="17%"><div align="right">�ƽ���λ</div></td>
            <td width="33%"><select name="yjrdw" id="yjrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
              <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
%>
            </select>            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="17%" align="right">�ƽ���</td>
            <td width="33%"><input name="yjr" type="text" id="bgr2" onKeyUp="keyGo(lrr)" size="20" maxlength="50"></td>
            <td width="16%"><div align="right">¼����</div></td>
            <td width="34%"><input name="lrr" type="text" id="lrr"  onKeyUp="keyGo(lrsj)" size="20" maxlength="50">            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="17%"><div align="right">¼��ʱ��&nbsp;��</div></td>
            <td width="33%"><input name="lrsj" type="text" id="lrsj" onKeyUp="keyGo(lrsj2)" size="20" maxlength="50">            </td>
            <td width="16%"><div align="right">��</div></td>
            <td width="34%"><input name="lrsj2" type="text" id="lrsj2"  onKeyUp="keyGo(khbh)" size="20" maxlength="50">            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td width="17%"><div align="right">�ƽ�ʱ��&nbsp;��</div></td>
            <td width="33%"><input name="yjsj" type="text" id="yjsj" onKeyUp="keyGo(lrsj2)" size="20" maxlength="50">            </td>
            <td width="16%"><div align="right">��</div></td>
            <td width="34%"><input name="yjsj2" type="text" id="yjsj2"  onKeyUp="keyGo(khbh)" size="20" maxlength="50">            </td>
          </tr>



            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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
	if(!(isDatetime(FormName.yjsj, "�ƽ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjsj2, "�ƽ�ʱ��"))) {
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
