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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> Ͷ�߱��޻ط�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_tsjlCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right"> 
                �ֹ�˾              </td>
              <td width="30%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
				%> 
				</select>
			  </td>
              <td width="20%" align="right"> 
                ǩԼ����              </td>
              <td width="30%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                Ͷ�߼�¼��              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="10" >
              </td>
              <td width="20%" align="right"> 
                Ͷ����Դ              </td>
              <td width="30%"> 
                <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �ͻ����              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_khbh" size="20" maxlength="20" >
              </td>
              <td width="20%" align="right"> 
                ��ͬ��              </td>
              <td width="30%"> 
                <input type="text" name="hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ͻ�����</td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_khxm" size="20" maxlength="20" >
              </td>
              <td width="20%" align="right">��ϵ��ʽ</td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_lxfs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                ���ݵ�ַ              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_fwdz" size="20" maxlength="100" >
              </td>
              <td width="20%" align="right"> 
                ���ʦ              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �ʼ�Ա              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_zjy" size="20" maxlength="20" >
              </td>
              <td width="20%" align="right"> 
                ʩ����              </td>
              <td width="30%"> 
                <select name="crm_tsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where ssfgs='"+ssfgs+"' order by sgdmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �Ƿ���ط�              </td>
              <td width="30%"> 
                <select name="crm_tsjl_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">��ط�</option>
                </select>
              </td>
              <td width="20%" align="right"> 
                ��������              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_jgrq" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ط�ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_hfsj2" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �ͷ�����ʱ�� ��              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="20%" align="right"> 
                ��              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">Ҫ����ʱ�� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                �ͷ�������              </td>
              <td width="30%"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="20" >
              </td>
              <td width="20%" align="right"> 
                ���س̶�              </td>
              <td width="30%"> 
                <select name="yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�᰸״̬</td>
              <td width="30%"> 
                <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">������</option>
                  <option value="2">�ڴ���</option>
                </select>
              </td>
              <td width="20%" align="right">���β��Ŵ���״̬</td>
              <td width="30%"> 
                <select name="zrbmclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">δ����</option>
                  <option value="2">�ڴ���</option>
                  <option value="3">�ѽ��</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����</td>
              <td width="30%"> 
                <input type="radio" name="lx" value="1">
                Ͷ�� 
                <input type="radio" name="lx" value="2">
                ���� </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.crm_tsjl_tsjlh, "Ͷ�߼�¼��"))) {
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
