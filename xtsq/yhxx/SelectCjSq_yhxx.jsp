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
//20100904
String kfgssq=(String)session.getAttribute("kfgssq");
String ygbh=(String)session.getAttribute("ygbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");

%>
<body bgcolor="#FFFFFF">

<form method="post" action="Sq_yhxxCjList.jsp" name="selectform">
      <div align="center">�û���Ȩ</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right" bgcolor="#FFFFCC">������˾</td>
              <td width="30%"> 
             <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
               <!--<option value=""></option>-->
                <%
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
//%> 
<%
	if (kfgssq.equals("2"))//2����Ȩ����ֹ�˾
	{
		out.println("<option value=\"\"></option>");
		//cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
                </select>              </td>
              <td width="21%" align="right">��������</td>
              <td width="29%"> 
            <!--   <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(selectform)">-->
				<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <!--  <option value=""></option>-->
				                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	/*else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}*/
%> 
                </select>             </td>
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
              <td width="20%" align="right">IP��ַ���Ʊ�־</td>
              <td width="30%"> 
                <input type="radio" name="ipxzbz" value="Y">
                ���� 
                <input type="radio" name="ipxzbz" value="N">
                ������ </td>
              <td width="21%" align="right">IP��ַ</td>
              <td width="29%"> 
                <input type="text" name="ipdz" size="20" maxlength="20"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">������ַ���Ʊ�־</td>
              <td width="30%"> 
                <input type="radio" name="wkxzbz" value="Y">
                ���� 
                <input type="radio" name="wkxzbz" value="N">
                ������ </td>
              <td width="21%" align="right">������ַ</td>
              <td width="29%"> 
                <input type="text" name="wkdz" size="20" maxlength="20"  value="" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���ѷ�ʽ</td>
              <td colspan="3"><input type="radio" name="txfs"  value="1">
                ϵͳ
                <input type="radio" name="txfs"  value="2">
                �绰
                <input type="radio" name="txfs"  value="3">
                ����
                <input type="radio" name="txfs"  value="4">
                ����
                <input type="radio" name="txfs"  value="9">
                ȫ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">���Ѽ�� ��</td>
              <td><input name="txjg" type="text" id="txjg" size="20" maxlength="10" ></td>
              <td align="right">��</td>
              <td><input name="txjg2" type="text" id="txjg2" size="20" maxlength="10" ></td>
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
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">��ѯ�������</td>
              <td colspan="3"> ��һ�� 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.bjjb">���ʦ���ۼ���</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.zwbm">����</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                </select>
                �ڶ��� 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.bjjb">���ʦ���ۼ���</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.zwbm">����</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                </select>
                ������ 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.bjjb">���ʦ���ۼ���</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.zwbm">����</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                </select>
                <br>
                ������ 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.bjjb">���ʦ���ۼ���</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.zwbm">����</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                </select>
                ������ 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.bjjb">���ʦ���ۼ���</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.zwbm">����</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                </select>
                ������ 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">������λ</option>
                  <option value="sq_yhxx.yhmc">Ա������</option>
                  <option value="sq_yhxx.bianhao">����</option>
                  <option value="sq_yhxx.yhdlm">ERP�û���</option>
                  <option value="sq_yhxx.sjsjb">���ʦְ��</option>
                  <option value="sq_yhxx.bjjb">���ʦ���ۼ���</option>
                  <option value="sq_yhxx.ygbh">���</option>
                  <option value="sq_yhxx.zwbm">����</option>
                  <option value="sq_yhxx.kdlxtbz">�ɵ�½</option>
                  <option value="sq_yhxx.yhjs">�û���ɫ</option>
                  <option value="sq_yhxx.sfzszg">Ա��״̬</option>
                </select>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
                <input type="button" onClick="f_do1(selectform)"  value="�����������ʦ�ɲ������ۼ���">
                <input type="button" onClick="f_do2(selectform)"  value="�������õ�½ʱ��"></td>
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
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.txjg, "���Ѽ��"))) {
		return false;
	}

	FormName.action="Sq_yhxxCjList.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="ChooseBjjb.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}

	FormName.action="EnterDlsj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
