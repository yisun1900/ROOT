<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	
	String yhmc=(String)session.getAttribute("yhmc");
	String zwbm=(String)session.getAttribute("zwbm");
	String zjxm=yhmc;
	if (!zwbm.equals("05"))
	{
		zjxm="";
	}
	String sgd=yhmc;
	if (!zwbm.equals("11"))
	{
		sgd="";
	}
%>

<body bgcolor="#FFFFFF"  >
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���Ĵ���</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
                �ֹ�˾              </td>
              <td width="32%"> 
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
              <td width="16%" align="right"> 
                ǩԼ����              </td>
              <td width="34%"> 
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
              <td width="18%" align="right">��ͬ��</td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20">              </td>
              <td width="16%" align="right">�ͻ����</td>
              <td width="34%"> 
                <input type="text" name="khbh" size="20" maxlength="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ʦ</td>
              <td width="32%"> 
                <input type="text" name="sjs" size="20" maxlength="20">              </td>
              <td width="16%" align="right">�ʼ�</td>
              <td width="34%"> 
                <input type="text" name="zjxm" size="20"  value="<%=zjxm%>" maxlength="20" <% if (!zjxm.equals("")) out.println("readonly");%>  >              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
             
              <td width="16%" align="right">ʩ����</td>
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
			  <td width="18%" align="right">ʩ����</td>
              <td width="32%"><input type="text" name="sgdmc" size="20"  value="<%=sgd%>" maxlength="20" <% if (!sgd.equals("")) out.println("readonly");%>  ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>�ͻ�����</b></font></td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50">              </td>
              <td width="16%" align="right">�ͻ�����</td>
              <td width="34%"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#0000CC"><b>��ϵ��ʽ</b></font>              </td>
              <td width="32%"> 
                <input type="text" name="lxfs" size="20" maxlength="50">              </td>
              <td width="16%" align="right"> 
                ��ϵ��ʽ              </td>
              <td width="34%"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC"><b>���ݵ�ַ</b></font></td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="71" maxlength="100">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                ���ݵ�ַ              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                ��ģ����ѯ�� </td>
            </tr>
            <tr bgcolor="#CCCCCC">
              <td colspan="4" align="right">&nbsp;</td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ռ�¼��</td>
              <td width="32%"> 
                <input type="text" name="ysjlh" size="20" maxlength="11">              </td>
              <td width="16%" align="right">������Ŀ</td>
              <td width="34%"> 
                <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
				  <%
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where ysxmflbm='05'  order by gcysxmbm","");
					%>
				</select>              </td>
            </tr>
			<tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">��Ŀ����ʱ��</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="yssj" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="yssj2" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">¼��ʱ��</td>
              <td width="32%"><input type="text" name="lrsj" size="20" maxlength="20" onDblClick="JSCalendar(this)"></td>
              <td width="16%" align="right">��</td>
              <td width="34%"> 
                <input type="text" name="lrsj2" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
            </tr>
			<tr bgcolor="#FFFFCC">
              <td align="right">���Ľ���ʱ��</td>
			  <td><input type="text" name="jssj" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
			  <td align="right">��</td>
			  <td><input type="text" name="jssj2" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
		    </tr>
			<tr bgcolor="#FFFFFF">
              <td align="right">���Ĵ���ʱ��</td>
			  <td><input type="text" name="jjsj" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
			  <td align="right">��</td>
			  <td><input type="text" name="jjsj2" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
		    </tr>
			<tr bgcolor="#FFFFCC">
              <td align="right">��������ʱ��</td>
			  <td><input type="text" name="zgyssj" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
			  <td align="right">��</td>
			  <td><input type="text" name="zgyssj2" size="20" maxlength="20" onDblClick="JSCalendar(this)">              </td>
		    </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ŀ������</td>
              <td width="32%"> 
                <input type="text" name="ysr" size="20" maxlength="20">              </td>
              <td width="16%" align="right">¼����</td>
              <td width="34%"> 
                <input type="text" name="lrr" size="20" maxlength="20">              </td>
            </tr>
			<tr bgcolor="#FFFFFF">
			  <td align="right">���Ĵ���״̬</td>
			  <td><select name="clbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="9">¼��δ���</option>
                  <option value="0">û����</option>
                  <option value="1">����δ����</option>
                  <option value="2">����</option>
                  <option value="3">�ڴ���</option>
                  <option value="4">�ѽ��</option>
                  <option value="5">����ͨ��</option>
                  <option value="6">����δͨ��</option>
              </select></td>
			  <td align="right">���Ĵ���״̬</td>
			  <td><input type="radio" name="clbz1" value="Y">
			    �����ѽ��
			    <input type="radio" name="clbz1" value="N" >
			    δ���</td>
		    </tr>
			<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��Ƭɸѡ</td>
              <td width="32%"> 
                <input type="radio" name="zpsx" value="Y">
                ����Ƭ
                <input type="radio" name="zpsx" value="N">
                ����Ƭ</td>
              <td width="18%" align="right">���ս��</td>
              <td width="32%"> 
                <input type="radio" name="sjysjg" value="0">�ϸ�
				<input type="radio" name="sjysjg" value="1" >���ϸ�              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(selectform)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(!(isDatetime(FormName.yssj, "��Ŀ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj2, "��Ŀ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "���Ľ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "���Ľ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jjsj, "���Ĵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jjsj2, "���Ĵ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgyssj, "��������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgyssj2, "��������ʱ��"))) {
		return false;
	}

	FormName.action="Crm_heysjlClList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
