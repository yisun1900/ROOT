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
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String sql=null;
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

<form method="post" action="Crm_hfjlClList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="30%"> 
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('F1','F2') and cxbz='N' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_hfjl_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> 
              </td>
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and cxbz='N' and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
		cf.selectItem(out,sql,"");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+dwbh+"' ","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�طü�¼��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfjlh" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">�ط�����</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ʦ��Ʒ���</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_sjfa" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�ط���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ʦ���ڷ���</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_hqfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">���ʦ�������</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_jdqk" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���̵�������</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_zjyfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">���̵�����λ</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_zjydw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���̵�������</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_zjyjz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">ʩ���ӷ�������</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_fwsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ʩ����ʩ������</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_sgzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">ʩ���ӹ�������</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_grsz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ɼҾ����ʦ</div>
              </td>
              <td width="30%"> 
                <select name="jcjjsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">���ɼҾӹ���</div>
              </td>
              <td width="31%"> 
                <select name="jsjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">������ĿרԱ</div>
              </td>
              <td width="30%"> 
                <select name="jcxmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">���ɲ�Ʒ�ͻ���װ</div>
              </td>
              <td width="31%"> 
                <select name="jcshaz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ɲ�Ʒ����</div>
              </td>
              <td width="30%"> 
                <select name="jccpzl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ʦ�ط�����</td>
              <td colspan="3"> 
                <input type="text" name="sjshfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���̵����ط�����</td>
              <td colspan="3"> 
                <input type="text" name="zjyhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ʩ���ӻط�����</td>
              <td colspan="3"> 
                <input type="text" name="sgdhfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ɼҾӻط�����</td>
              <td colspan="3"> 
                <input type="text" name="jchfnr" size="73" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�Ƿ�����ط�</div>
              </td>
              <td width="30%"><%
	cf.radioToken(out, "crm_hfjl_sfjxhf","Y+��ط�&N+����ط�","");
%> </td>
              <td width="19%"> 
                <div align="right">�´λط�����</div>
              </td>
              <td width="31%"> 
                <select name="crm_hfjl_xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�´λط����� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_xchfrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_xchfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">����ʽ</div>
              </td>
              <td width="30%"> 
                <select name="crm_hfjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">������ز���</option>
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�طò���</div>
              </td>
              <td width="31%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");

		cf.selectItem(out,sql,"");

	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1') and ssdw='"+ssfgs+"'";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";

		out.println("<option value=\"\"></option>");
		cf.selectItem(out,sql,"");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����״̬</td>
              <td width="30%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">δ����</option>
                </select>
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ط�ʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_hfjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="crm_hfjl_hfsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.crm_hfjl_hfjlh, "�طü�¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_xchfrq, "�´λط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_xchfrq2, "�´λط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hfjl_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
