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

<form method="post" action="Sq_yhxxMllList.jsp" name="selectform">
      <div align="center">���ۣ���Ȩ</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">������˾</td>
              <td width="30%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
				</select>
				</td>
              <td width="21%" align="right">��������</td>
              <td width="29%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(selectform)">
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
					}
					else if (kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
					}
					else{
						out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
						return;
					}
					%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" height="2" bgcolor="#FFFFCC"> 
                <div align="right">��������С��</div>              </td>
              <td width="30%" height="2"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
              <td width="21%" height="2">&nbsp;</td>
              <td width="29%" height="2">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">�û���ɫ</td>
              <td width="30%"> 
                <select name="sq_yhxx_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="A0">�ܲ�</option>
                  <option value="A1">�ܲ�������</option>
                  <option value="F0">�ֹ�˾</option>
                  <option value="F1">�ֹ�˾������</option>
                  <option value="F2">����</option>
                  <option value="F3">���С��</option>
                  <option value="F4">�г�С��</option>
                  <option value="F5">����С��</option>
                </select>              </td>
              <td width="21%" align="right">�ͻ�������Ȩ��Χ</td>
              <td width="29%"> 
                <select name="kfgssq" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">����Ȩ</option>
                  <option value="1">��Ȩ�����ֹ�˾</option>
                  <option value="2">��Ȩ����ֹ�˾</option>
                  <option value="3">��Ȩ��������</option>
                  <option value="4">��Ȩĳһ�ֹ�˾�������</option>
                  <option value="5">��Ȩ����ֹ�˾�������</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ְ��</td>
              <td><select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%>
              </select></td>
              <td align="right">����</td>
              <td><select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">����ۿ� ��</td>
              <td><input type="text" name="zkl" size="20" maxlength="17" >              </td>
              <td align="right">��</td>
              <td><input type="text" name="zkl2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ë���� ��</td>
              <td><input type="text" name="zdmll" size="20" maxlength="17" >              </td>
              <td align="right">��</td>
              <td><input type="text" name="zdmll2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ÿ�����������ۿ۴��� ��</td>
              <td><input type="text" name="sqtszkcs" size="20" maxlength="17" >              </td>
              <td align="right">��</td>
              <td><input type="text" name="sqtszkcs2" size="20" maxlength="17" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">Ա�����</td>
              <td width="30%"> 
                <input type="text" name="ygbh" size="20" maxlength="8" >              </td>
              <td width="21%" align="right">����</td>
              <td width="29%"> 
                <input type="text" name="bianhao" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�û���½��</div>              </td>
              <td width="30%"> 
                <input type="text" name="sq_yhxx_yhdlm" size="20" maxlength="16" >              </td>
              <td width="21%" align="right">Ա������</td>
              <td width="29%"> 
                <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">���ʦ���ۼ���<br>
                ����ͬʱ�������ֱ��ۣ�</td>
              <td width="30%"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>              </td>
              <td width="21%" align="right">���ʦ���ۼ���<br>
                ������ĳһ�ֱ��ۼ��ɣ�</td>
              <td width="29%"> 
                <select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
                  <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�Ƿ�ɿ����Ϸ���</td>
              <td width="30%"><input type="radio" name="kkglfx" value="Y">
�ɿ�
  <input type="radio" name="kkglfx" value="N">
���ɿ� </td>
              <td width="21%"> 
                <div align="right">������Ȩ��</div>              </td>
              <td width="29%"> 
                <select name="yhzbh" style="FONT-SIZE:12px;WIDTH:152px" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhzbh,yhzmc from sq_yhz order by yhzmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">����鿴�۸���ϸ</td>
              <td width="30%"> 
                <input type="radio" name="ckjgbz"  value="Y">
                �ɿ� 
                <input type="radio" name="ckjgbz"  value="N">
                ���ɿ� </td>
              <td width="21%" align="right">�ص��û���־</td>
              <td width="29%"> 
                <input type="radio" name="zdyhbz"  value="Y">
                �ص��û� 
                <input type="radio" name="zdyhbz"  value="N">
                ���ص��û� </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">�ɵ�½ϵͳ��־</td>
              <td width="30%"> 
                <input type="radio" name="kdlxtbz"  value="Y">
                �ɵ�½ 
                <input type="radio" name="kdlxtbz"  value="N">
                ���ɵ�½ </td>
              <td width="21%" align="right">�Ƿ���Ȩ</td>
              <td width="29%"> 
                <input type="radio" name="sfsq"  value="Y">
                ����Ȩ 
                <input type="radio" name="sfsq"  value="N">
                δ��Ȩ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ɿ�����־</td>
              <td width="30%"> 
                <input type="radio" name="kkbbz" value="Y">
                �ɿ��� 
                <input type="radio" name="kkbbz" value="N">
                ���ɿ��� </td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">ʱ�����Ʊ�־</td>
              <td width="30%"> 
                <input type="radio" name="sjxzbz" value="Y">
                ���� 
                <input type="radio" name="sjxzbz" value="N">
                ������ </td>
              <td width="21%" align="right">�鿴�ͻ��绰��־</td>
              <td width="29%"> 
                <input type="radio" name="khdhbz" value="Y">
                �ɿ� 
                <input type="radio" name="khdhbz" value="N">
                ���ɿ� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�ϰ�ʱ��</td>
              <td width="30%"> 
                <input type="text" name="sbsj" size="10" maxlength="8"  value="" >
                ��24Сʱ������</td>
              <td width="21%" align="right">�°�ʱ��</td>
              <td width="29%"> 
                <input type="text" name="xbsj" size="10" maxlength="8"  value="" >
                ��24Сʱ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">¼��ʱ�� ��</div>              </td>
              <td width="30%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >              </td>
              <td width="21%"> 
                <div align="right">��</div>              </td>
              <td width="29%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >              </td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����"></td>
            </tr>
          </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	czlx=1;

	FormName.dwbh.length=1;
	FormName.sjsbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	czlx=2;

	FormName.sjsbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+FormName.dwbh.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(!(isFloat(FormName.zkl, "����ۿ�"))) {
		return false;
	}
	if(!(isFloat(FormName.zkl2, "����ۿ�"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmll, "���ë����"))) {
		return false;
	}
	if(!(isFloat(FormName.zdmll2, "���ë����"))) {
		return false;
	}
	if(!(isNumber(FormName.sqtszkcs, "ÿ�����������ۿ۴���"))) {
		return false;
	}
	if(!(isNumber(FormName.sqtszkcs2, "ÿ�����������ۿ۴���"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="Sq_yhxxMllList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
