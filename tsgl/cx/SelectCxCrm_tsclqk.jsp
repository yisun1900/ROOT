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
	String pqstr=cf.getItemData("select tsyybm,tsyymc,tslxbm from dm_tsyybm  order by tslxbm,tsyybm");
%>
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

<form method="post" action="Crm_tsclqkCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱��޼�¼��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">Ͷ����Դ</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴���</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsjl_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsjl_tslxbm,crm_tsjl_tsyybm,<%=pqstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">Ͷ�߱���С��</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_fwdz" size="20" maxlength="100" >
              </td>
              <td width="16%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_sjs" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
					if (yhjs.equals("A0") || yhjs.equals("A1"))
					{
						cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��'||DECODE(sq_sgd.cxbz,'Y','��������','N','') from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
					}
					else{
						cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��'||DECODE(sq_sgd.cxbz,'Y','��������','N','') from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sq_sgd.cxbz,sgdmc","");
					}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ʼ�Ա</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_zjy" size="20" maxlength="20" >
              </td>
              <td width="16%"> 
                <div align="right">��������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_jgrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">�ֹ�˾</div>
              </td>
              <td width="31%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,qydm,<%=dwstr%>)">
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
              <td width="17%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="33%"> 
                <select name="qydm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="19%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsjl_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ط�&N+����ط�","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">�ͷ�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">�ط�ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_hfsj" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_hfsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ͷ�����ʱ�� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">¼�벿��</td>
              <td width="33%"> 
                <select name="slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2')";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
		cf.selectItem(out,sql,"");
	}
	else{
		String sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and ssdw='"+ssfgs+"' ";
		sql+=" union ";
		sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
		cf.selectItem(out,sql,"");
	}
%> 
                </select>
              </td>
              <td width="16%" align="right">Ͷ�߱��޲���</td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
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
              <td width="19%" align="right">Ҫ����ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">��</td>
              <td width="32%"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="33%"> 
                <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">�ǿͷ��Ǽ�</option>
                  <option value="1">�ͷ�����</option>
                  <option value="2">�ڴ���</option>
                  <option value="3">�᰸</option>
                </select>
              </td>
              <td width="16%"> 
                <div align="right">�ͻ������</div>
              </td>
              <td width="32%"> 
                <select name="crm_tsjl_zzjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">Ͷ�߱�������</td>
              <td width="33%"> 
                <input type="text" name="crm_tsjl_tsnr" size="20" value="">
              </td>
              <td width="16%" align="right">���س̶�</td>
              <td width="32%"> 
                <select name="yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
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
	if(!(isNumber(FormName.crm_tsjl_tsjlh, "Ͷ�߱��޼�¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jgrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj2, "�ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "�ͷ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj, "Ҫ����ʱ�� "))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj2, "Ҫ����ʱ�� "))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
