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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�ɹܼ�--��ѯ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                �ֹ�˾              </td>
              <td width="31%"> 
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
              <td width="20%" align="right"> 
                ǩԼ����              </td>
              <td width="30%"> 
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
              <td align="right">��ͬ��</td>
              <td><input type="text" name="hth" size="20" maxlength="20">              </td>
              <td align="right">�ͻ����</td>
              <td><input type="text" name="khbh" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ʦ</td>
              <td><input type="text" name="sjs" size="20" maxlength="20">              </td>
              <td align="right">�ʼ�</td>
              <td><input type="text" name="zjxm" size="20" maxlength="20">              </td>
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
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                ǩԼ���� ��              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
              <input type="text" name="qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right" bgcolor="#FFFFCC"> 
                ��              </td>
              <td width="30%" bgcolor="#FFFFCC"> 
              <input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFFF"> 
                Ӧ�������� ��              </td>
              <td width="31%"> 
              <input type="text" name="kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right"> 
                ��              </td>
              <td width="30%"> 
              <input type="text" name="kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">���齻������ ��</td>
              <td width="31%"> 
              <input type="text" name="jyjdrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right">��</td>
              <td width="30%"> 
              <input type="text" name="jyjdrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFFF">¼��ʱ�� ��</td>
              <td width="31%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
              <td width="20%" align="right" bgcolor="#FFFFFF">��</td>
              <td width="30%" bgcolor="#FFFFFF"> 
              <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC">�ɹܼ�ʱ�� ��</td>
              <td><input type="text" name="pgjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right">��</td>
              <td><input type="text" name="pgjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">��ͬ��˱�־</td>
              <td width="31%"> 
                <select name="htshbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">δ���</option>
                  <option value="P">�ɿ���</option>
                  <option value="Y">������</option>
              </select>              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFFF">
              <td align="right">�������</td>
              <td colspan="3" bgcolor="#CCFFFF"> ��һ��
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:130PX">
                    <option value="crm_khxx.pgjsj desc">�ɹܼ�ʱ��</option>
                    <option value="crm_khxx.jyjdrq ">���齻������</option>
                    <option value="crm_khxx.khbh ">�ͻ����</option>
                    <option value="crm_khxx.khxm">�ͻ�����</option>
                    <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                    <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                    <option value="crm_khxx.sjs">���ʦ</option>
                    <option value="crm_khxx.sgd">ʩ����</option>
                    <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                    <option value="crm_khxx.hth">��ͬ��</option>
                    <option value="crm_khxx.gcjdbm">���̽���</option>
                    <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                    <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                    <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                    <option value="crm_khxx.dwbh">ǩԼ����</option>
                    <option value="crm_khxx.cxhdbm">�μӴ����</option>
                    <option value="crm_khxx.jzbz">��װ��־</option>
                  </select>
                �ڶ���
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:130PX">
                  <option value=""></option>
                    <option value="crm_khxx.pgjsj desc">�ɹܼ�ʱ��</option>
                    <option value="crm_khxx.jyjdrq">���齻������</option>
                    <option value="crm_khxx.khbh ">�ͻ����</option>
                    <option value="crm_khxx.khxm">�ͻ�����</option>
                    <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                    <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                    <option value="crm_khxx.sjs">���ʦ</option>
                    <option value="crm_khxx.sgd">ʩ����</option>
                    <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                    <option value="crm_khxx.hth">��ͬ��</option>
                    <option value="crm_khxx.gcjdbm">���̽���</option>
                    <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                    <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                    <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                    <option value="crm_khxx.dwbh">ǩԼ����</option>
                    <option value="crm_khxx.cxhdbm">�μӴ����</option>
                    <option value="crm_khxx.jzbz">��װ��־</option>
                </select>
                ������
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:130PX">
                  <option value=""></option>
                    <option value="crm_khxx.pgjsj desc">�ɹܼ�ʱ��</option>
                    <option value="crm_khxx.jyjdrq ">���齻������</option>
                    <option value="crm_khxx.khbh ">�ͻ����</option>
                    <option value="crm_khxx.khxm">�ͻ�����</option>
                    <option value="crm_khxx.lxfs">��ϵ��ʽ</option>
                    <option value="crm_khxx.fwdz">���ݵ�ַ</option>
                    <option value="crm_khxx.sjs">���ʦ</option>
                    <option value="crm_khxx.sgd">ʩ����</option>
                    <option value="crm_khxx.zjxm">�ʼ�Ա</option>
                    <option value="crm_khxx.hth">��ͬ��</option>
                    <option value="crm_khxx.gcjdbm">���̽���</option>
                    <option value="crm_khxx.qyrq desc">ǩԼ����</option>
                    <option value="crm_khxx.jgrq desc">��ͬ��������</option>
                    <option value="crm_khxx.sjkgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjjgrq desc">ʵ�ʿ�������</option>
                    <option value="crm_khxx.sjwjrq desc">ʵ���������</option>
                    <option value="crm_khxx.dwbh">ǩԼ����</option>
                    <option value="crm_khxx.cxhdbm">�μӴ����</option>
                    <option value="crm_khxx.jzbz">��װ��־</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">              </td>
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
	if(!(isDatetime(FormName.pgjsj, "�ɹܼ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.pgjsj2, "�ɹܼ�ʱ��"))) {
		return false;
	}

	FormName.action="Crm_khxxCxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
