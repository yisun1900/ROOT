<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�����û���Ȩ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC">�ֹ�˾</td>
              <td width="32%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,sq_yhxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>              </td>
              <td width="18%" align="right">������λ</td>
              <td width="32%"> 
                <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2','Y0') and cxbz='N' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">��λ����</td>
              <td><select name="sq_dwxx_dwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="A0">�ܲ�</option>
                <option value="A1">�ܲ�������</option>
                <option value="F0">�ֹ�˾</option>
                <option value="F1">�ֹ�˾������</option>
                <option value="F2">����</option>
                <option value="F3">����С��</option>
              </select></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">Ա�����</td>
              <td width="32%"> 
                <input type="text" name="ygbh" size="20" maxlength="8" >              </td>
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <input type="text" name="bianhao" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">Ա������</td>
              <td width="32%"><input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" ></td>
              <td width="18%" align="right">�û���ɫ</td>
              <td width="32%"><select name="sq_yhxx_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="A0">�ܲ�</option>
                <option value="A1">�ܲ�������</option>
                <option value="F0">�ֹ�˾</option>
                <option value="F1">�ֹ�˾������</option>
                <option value="F2">����</option>
                <option value="F3">����С��</option>
                <option value="J0">������</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">ְ��</td>
              <td width="32%"> 
                <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
                </select>              </td>
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�ɵ�½ϵͳ��־</td>
              <td>
				  <input type="radio" name="kdlxtbz" value="Y">�ɵ�½
				  <input name="kdlxtbz" type="radio" value="N">
				  ���ɵ�½			  </td>
              <td align="right">�ɿ�����־</td>
              <td>
				  <input type="radio" name="kkbbz" value="Y">�ɿ���
				  <input type="radio" name="kkbbz" value="N">���ɿ���			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�鿴�ͻ��绰��־</td>
              <td>
				  <input type="radio" name="khdhbz" value="Y">�ɿ�
				  <input type="radio" name="khdhbz" value="N">���ɿ�			  </td>
              <td align="right">�ͻ�������Ȩ��Χ</td>
              <td><select name="kfgssq" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="0">����Ȩ</option>
                <option value="1">��Ȩ�����ֹ�˾</option>
                <option value="2">��Ȩ����ֹ�˾</option>
                <option value="3">��Ȩ��������</option>
                <option value="4">��Ȩĳһ�ֹ�˾�������</option>
                <option value="5">��Ȩ����ֹ�˾�������</option>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ¼��ʱ�� ��              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
                ��              </td>
              <td width="32%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="sq_yhxx.ssfgs">�����ֹ�˾</option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.ygbh">Ա�����</option>
                  <option value="sq_yhxx.zwbm">����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.ssfgs">�����ֹ�˾</option>
                  <option value="sq_yhxx.dwbh" selected>������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.ygbh">Ա�����</option>
                  <option value="sq_yhxx.zwbm">����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.ssfgs">�����ֹ�˾</option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc" selected>Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.ygbh">Ա�����</option>
                  <option value="sq_yhxx.zwbm">����</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"><input name="button" type="button" onClick="f_do(selectform)"  value="��ѯ">
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
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="PlYhSqList.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
