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
String xmstr=cf.getItemData("select xm as xmbm,xm as xmmc,dwbh from oa_bgypbz order by dwbh,xm");
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

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">���쵥λ</div>
              </td>
              <td width="29%"> 
                <select name="oa_lqsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(oa_lqsq_dwbh,oa_lqsq_slr,<%=xmstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%">
                <select name="oa_lqsq_slr" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("00"))
	{
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select xm as bm,xm as mc from oa_bgypbz where dwbh='"+dwbh+"' order by dwbh,xm","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�칫��Ʒ</div>
              </td>
              <td width="29%"> 
                <select name="oa_lqsq_bgypbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bgypbm,bgypmc||'��'||dj||'Ԫ��' from oa_bgypbm order by bgypbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_lrr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">¼������ ��</td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_lrrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_lrrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">�ƻ���ȡ���� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_jhlqsl" size="20" maxlength="8" >
                <BR>
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_jhlqsl2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�ƻ���ȡ���� ��</td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_jhlqrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_jhlqrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ȡ״̬</div>
              </td>
              <td width="29%"> 
                <input type="radio" name="oa_lqsq_lqzt" value="N">
                δ��ȡ 
                <input type="radio" name="oa_lqsq_lqzt" value="Y">
                ����ȡ </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_blr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">ʵ��ȡ���� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_slqsl" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_slqsl2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ȡʱ�� ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="oa_lqsq_lqsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="oa_lqsq_lqsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ȡ����</td>
              <td width="29%"> 
                <input type="radio" name="lqlx" value="1">
                ������ȡ 
                <input type="radio" name="lqlx" value="2">
                ������ȡ </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="oa_lqsq.xh desc">�������</option>
                  <option value="sq_dwxx.dwmc">���õ�λ</option>
                  <option value="oa_lqsq.slr">������</option>
                  <option value="oa_bgypbm.bgypmc">�칫��Ʒ</option>
                  <option value="oa_lqsq.jhlqsl">�ƻ���ȡ����</option>
                  <option value="oa_lqsq.jhlqrq">�ƻ���ȡ����</option>
                  <option value="oa_lqsq.lrr">¼����</option>
                  <option value="oa_lqsq.lrrq">¼������</option>
                  <option value="oa_lqsq.lqzt">��ȡ״̬</option>
                  <option value="oa_lqsq.slqsl">ʵ��ȡ����</option>
                  <option value="oa_lqsq.blr">������</option>
                  <option value="oa_lqsq.lqsj">��ȡʱ��</option>
                  <option value="oa_bgypbm.dj">����</option>
                  <option value="oa_lqsq.lqlx">��ȡ����</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="oa_lqsq.xh desc">�������</option>
                  <option value="sq_dwxx.dwmc">���õ�λ</option>
                  <option value="oa_lqsq.slr">������</option>
                  <option value="oa_bgypbm.bgypmc">�칫��Ʒ</option>
                  <option value="oa_lqsq.jhlqsl">�ƻ���ȡ����</option>
                  <option value="oa_lqsq.jhlqrq">�ƻ���ȡ����</option>
                  <option value="oa_lqsq.lrr">¼����</option>
                  <option value="oa_lqsq.lrrq">¼������</option>
                  <option value="oa_lqsq.lqzt">��ȡ״̬</option>
                  <option value="oa_lqsq.slqsl">ʵ��ȡ����</option>
                  <option value="oa_lqsq.blr">������</option>
                  <option value="oa_lqsq.lqsj">��ȡʱ��</option>
                  <option value="oa_bgypbm.dj">����</option>
                  <option value="oa_lqsq.lqlx">��ȡ����</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="oa_lqsq.xh desc">�������</option>
                  <option value="sq_dwxx.dwmc">���õ�λ</option>
                  <option value="oa_lqsq.slr">������</option>
                  <option value="oa_bgypbm.bgypmc">�칫��Ʒ</option>
                  <option value="oa_lqsq.jhlqsl">�ƻ���ȡ����</option>
                  <option value="oa_lqsq.jhlqrq">�ƻ���ȡ����</option>
                  <option value="oa_lqsq.lrr">¼����</option>
                  <option value="oa_lqsq.lrrq">¼������</option>
                  <option value="oa_lqsq.lqzt">��ȡ״̬</option>
                  <option value="oa_lqsq.slqsl">ʵ��ȡ����</option>
                  <option value="oa_lqsq.blr">������</option>
                  <option value="oa_lqsq.lqsj">��ȡʱ��</option>
                  <option value="oa_bgypbm.dj">����</option>
                  <option value="oa_lqsq.lqlx">��ȡ����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">��ʾ���</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ���� 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform,'cx')">
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
function f_do(FormName,lx)//����FormName:Form������
{
	if(!(isDatetime(FormName.oa_lqsq_lrrq, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lrrq2, "¼������"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_jhlqsl, "�ƻ���ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_jhlqsl2, "�ƻ���ȡ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_jhlqrq, "�ƻ���ȡ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_jhlqrq2, "�ƻ���ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_slqsl, "ʵ��ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_slqsl2, "ʵ��ȡ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lqsj, "��ȡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lqsj2, "��ȡʱ��"))) {
		return false;
	}

	FormName.action="Oa_lqsqCxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
