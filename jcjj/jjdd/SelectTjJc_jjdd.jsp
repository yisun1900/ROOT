<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by ssfgs,dwbh");
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dlxmzy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='10'");
	if (dlxmzy==null)
	{
		dlxmzy="";
	}
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�Ҿ߶�����ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="307" > 
      <div align="center">

<form method="post" action="Jc_jjddCxListTj.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">�ֹ�˾</td>
              <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,jc_jjdd_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
              <td width="19%" align="right">¼�벿��</td>
              <td width="31%"> 
                <select name="jc_jjdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssdw='"+ssfgs+"' order by dwbh","");
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
              <td width="19%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="31%"> 
                <select name="jc_jjdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_jjddzt order by clzt","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�˵�ԭ��</div>
              </td>
              <td width="31%"> 
                <select name="jc_jjdd_jjtdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ƿ��������ʦ</td>
              <td width="31%"> 
                <input type="radio" name="sfpsjs" value="1">
                �� 
                <input type="radio" name="sfpsjs" value="2">
                �� </td>
              <td width="19%" align="right">�ͻ�����</td>
              <td width="31%"> 
                <input type="radio" name="jc_jjdd_khlx" value="2">
                ��װ�ͻ� 
                <input type="radio" name="jc_jjdd_khlx" value="4">
                �Ǽ�װ�ͻ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�Ҿ߹���</td>
              <td width="31%"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%> 
                </select>
              </td>
              <td width="19%" align="right">�Ͳ��Ź���</td>
              <td width="31%"> 
                <select name="xcmgc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' order by ssfgs,gysmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and ssfgs='"+ssfgs+"' order by gysmc","");
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">פ��Ҿӹ���</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
              <td width="19%" align="right">չ���Ҿӹ���</td>
              <td width="31%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' order by yhmc","");
	}
	else{
		cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='08' and ssfgs='"+ssfgs+"' order by yhmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ĿרԱ</div>
              </td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dlxmzy.equals(""))
	{
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='10' order by sq_dwxx.ssdw,yhmc","");
		}
		else{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssdw='"+ssfgs+"' and zwbm='10' order by yhmc","");
		}
	}
	else{
		out.println("<option value=\""+dlxmzy+"\">"+dlxmzy+"</option>");
	}
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�Ҿ����ʦ&nbsp;</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jjsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%"> 
                <div align="right">�ƻ�����ʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%"> 
                <div align="right">ʵ����ʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">ǩ��ͬʱ�� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">�ƻ���װ���� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%"> 
                <div align="right">ʵ��װ���� ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼��ʱ�� ��</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrsj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">�˵�ʱ�� ��</td>
              <td width="31%">
                <input type="text" name="jc_jjdd_tdsj" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">��</td>
              <td width="31%">
                <input type="text" name="jc_jjdd_tdsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">¼����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jc_jjdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" >��ʾ���</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
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
	if(!(isDatetime(FormName.jc_jjdd_jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhccsj2, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sccsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sccsj2, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_qhtsj2, "ǩ��ͬʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhazrq, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_jhazrq2, "�ƻ���װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sazrq, "ʵ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_sazrq2, "ʵ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_tdsj, "�˵�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_jjdd_tdsj2, "�˵�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
