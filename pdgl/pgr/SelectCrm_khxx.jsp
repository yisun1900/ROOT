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
	
	String yhjs=(String)session.getAttribute("yhjs");
	String yhmc=(String)session.getAttribute("yhmc");
	String zwbm=(String)session.getAttribute("zwbm");
	String sgd=yhmc;
	if (!zwbm.equals("11"))
	{
		sgd="";
	}
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�ɹ���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right"> 
                �ֹ�˾              </td>
              <td width="29%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
				</select>			  </td>
              <td width="19%" align="right"> 
                ǩԼ����              </td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �ͻ����              </td>
              <td width="29%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td width="19%" align="right">��ͬ��</td>
              <td width="31%"><input type="text" name="hth" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
              <td><input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td align="right">�ͻ�����</td>
              <td><input type="text" name="khxm2" size="10" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>��ϵ��ʽ</b></font> </td>
              <td><input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td align="right"> ��ϵ��ʽ </td>
              <td><input type="text" name="lxfs2" size="10" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
              <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"> ���ݵ�ַ </td>
              <td colspan="3"><input type="text" name="fwdz2" size="63" maxlength="100" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ʦ</td>
              <td><input type="text" name="sjs" size="20" maxlength="20">              </td>
              <td align="right">�ʼ�</td>
              <td><input type="text" name="zjxm" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                ǩԼ���� ��              </td>
              <td width="29%"> 
                <input type="text" name="qyrq" size="20" maxlength="10" >              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                Ӧ�������� ��              </td>
              <td width="29%"> 
                <input type="text" name="kgrq" size="20" maxlength="10" >              </td>
              <td width="19%" align="right"> 
                ��              </td>
              <td width="31%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">���齻������ ��</td>
              <td width="29%"> 
                <input type="text" name="jyjdrq" size="20" maxlength="10" >              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="jyjdrq2" size="20" maxlength="10" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right" bgcolor="#FFFFCC">¼��ʱ�� ��</td>
              <td width="29%" bgcolor="#FFFFCC"> 
                <input type="text" name="lrsj" size="20" maxlength="10" value="">              </td>
              <td width="19%" align="right">��</td>
              <td width="31%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��Ŀ�ܼ�</td>
              <td width="34%"><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%>
              </select></td> 
			  <td width="18%" align="right">��Ŀ�ܼ�</td>
              <td width="32%"><input type="text" name="sgdmc" size="20"  value="<%=sgd%>" maxlength="20" <% if (!sgd.equals("")) out.println("readonly");%>  ></td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="�ɵ�" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
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
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq2, "���齻������"))) {
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

	FormName.action="Crm_khxxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
