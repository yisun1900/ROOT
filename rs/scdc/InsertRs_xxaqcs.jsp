<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_xxaqcs.jsp" name="insertform" target="_blank">
<div align="center">��Ϣ��ȫ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC" align="center">
  <td width="7%" >������</td>
  <td width="70%" >����</td>
  <td width="23%" >��ע</td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >1
    <input type="hidden" name="wtbh" value="1"  >  </td>
  <td  >���ڲ��ŵ��Թ���<br>
    ��ѡ���ճ����������д������ʱ��ǡ����ѡ�
    <input type="hidden" name="wt" value="���ڲ��ŵ��Թ���<br>
    ��ѡ���ճ����������д������ʱ��ǡ����ѡ�" >	

	<BR>
	<input type="radio" name="da1"  value="1���趨�������趨5���ӣ�">���趨�������趨5���ӣ�<br>
    <input type="radio" name="da1"  value="2�ڵ����õ��������ã��°�ؼ�ʱ�ػ�">�ڵ����õ��������ã��°�ؼ�ʱ�ػ�<br>
    <input type="radio" name="da1"  value="3�۱ʼǱ�����ʹ��ʱ�õ��������ã��ؼ�ʱ��ȥ�������������벻͸���Ĺ���������">�۱ʼǱ�����ʹ��ʱ�õ��������ã��ؼ�ʱ��ȥ�������������벻͸���Ĺ���������<br>
    <input type="radio" name="da1"  value="4������ʱ��Ϊ�˷����¼�ļ���������VAϵͳ����ORACLEϵͳ������ϵͳ����ʱ�ڱ�ǩ��д��ID�����룬ճ����������">������ʱ��Ϊ�˷����¼�ļ���������VAϵͳ����ORACLEϵͳ������ϵͳ����ʱ�ڱ�ǩ��д��ID�����룬ճ����������	</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >2
    <input type="hidden" name="wtbh" value="2"  >  </td>
  <td  >����������Թ���<BR>��������ʱ����ѡ��ǡ���Ĵ���
    <input type="hidden" name="wt" value="����������Թ���<BR>��������ʱ����ѡ��ǡ���Ĵ���" >	

	<BR>
	<input type="radio" name="da2"  value="1�ٵ��Դ�������ʱ��������װSafe Boot��PC���õ���˾���">�ٵ��Դ�������ʱ��������װSafe Boot��PC���õ���˾���<br>
    <input type="radio" name="da2"  value="2�����ô������Թ���̨�ˣ���ȷ˭��ʲôʱ��ʹ�ã������������������磬���²����Բ����">�����ô������Թ���̨�ˣ���ȷ˭��ʲôʱ��ʹ�ã������������������磬���²����Բ����<br>
    <input type="radio" name="da2"  value="3���ھƵ�ȳ���ʹ�ù���WiFiʱ�����ʹ�ð�ȫ���ƶ����ӣ�ͨ�ż��ܣ�">���ھƵ�ȳ���ʹ�ù���WiFiʱ�����ʹ�ð�ȫ���ƶ����ӣ�ͨ�ż��ܣ�<br>
    <input type="radio" name="da2"  value="4�ܴ���ʱ�����Ԥ�����ƣ�Ϊ�˱��ⶪʧ�������������İ���">�ܴ���ʱ�����Ԥ�����ƣ�Ϊ�˱��ⶪʧ�������������İ���</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>


<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >3
    <input type="hidden" name="wtbh" value="3"  >  </td>
  <td  >����˽����Ϣ�豸�����ԡ������ֻ��ȣ�
�� ˽���ֻ�����������ȣ�����������ʱ��Ҫ�õ���ɡ�
�� ����ʱ����ѡ��ǡ����ѡ�
    <input type="hidden" name="wt" value="����˽����Ϣ�豸�����ԡ������ֻ��ȣ�
�� ˽���ֻ�����������ȣ�����������ʱ��Ҫ�õ���ɡ�
�� ����ʱ����ѡ��ǡ����ѡ�" >	


	<BR>
	<input type="radio" name="da3"  value="1�ٽ�ֹ�����õ��ԣ���˽�˵��Է���ҵ�����ϵ��ʼ�">�ٽ�ֹ�����õ��ԣ���˽�˵��Է���ҵ�����ϵ��ʼ�<br>
    <input type="radio" name="da3"  value="2�ڲ���������ʩ��ʹ��˽���豸������Ƭ">�ڲ���������ʩ��ʹ��˽���豸������Ƭ<br>
    <input type="radio" name="da3"  value="3��˽�������豸�Ȳ����ӵ�����PC�ϣ�������磩">��˽�������豸�Ȳ����ӵ�����PC�ϣ�������磩<br>
    <input type="radio" name="da3"  value="4��˽����Ϣ�豸���豸ʹ��ʱ����صõ���˾���">��˽����Ϣ�豸���豸ʹ��ʱ����صõ���˾���</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >4
    <input type="hidden" name="wtbh" value="4"  >  </td>
  <td  > ���ڵ���ý���ʹ���Լ�����
�� ���ڵ��Ӽ���ý�壨USB�洢��SD���ȣ���ʹ���Լ�������ѡ��ǡ��������
    <input type="hidden" name="wt" value=" ���ڵ���ý���ʹ���Լ�����
�� ���ڵ��Ӽ���ý�壨USB�洢��SD���ȣ���ʹ���Լ�������ѡ��ǡ��������" >	


	<BR>
	<input type="radio" name="da4"  value="1����������̨�ˣ���ȷ˭ʲôʱ��ʹ��">����������̨�ˣ���ȷ˭ʲôʱ��ʹ��<br>
    <input type="radio" name="da4"  value="2�ڷֱ𱣴���ʹ���߱��˵����ӳ����н��и������">�ڷֱ𱣴���ʹ���߱��˵����ӳ����н��и������<br>
    <input type="radio" name="da4"  value="3��SD������ʵʩ���ܣ�ԭ���Ͻ�ֹʹ�ã���������������������ã�ʹ�ú�ɾ������">��SD������ʵʩ���ܣ�ԭ���Ͻ�ֹʹ�ã���������������������ã�ʹ�ú�ɾ������<br>
    <input type="radio" name="da4"  value="4��USB�洢������ʹ�ÿɼ��ܵ�">��USB�洢������ʹ�ÿɼ��ܵ�</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >5
    <input type="hidden" name="wtbh" value="5"  >  </td>
  <td  >�����ⷢ��E-Mailʱ��
    �����ⷢ���ʼ�ʱ����ΪӦ��ע��������ѡ��ǡ��������
    <input type="hidden" name="wt" value="�����ⷢ��E-Mailʱ��
    �����ⷢ���ʼ�ʱ����ΪӦ��ע��������ѡ��ǡ��������" >	

	<BR>
	<input type="radio" name="da5"  value="1�ٶ��ⷢ�͡�����Ϣ��ʱ����Ҫ�����ļ��У���ȡ��ʹ��������Ҳ����й¶��Ϣ�ĶԲ�">�ٶ��ⷢ�͡�����Ϣ��ʱ����Ҫ�����ļ��У���ȡ��ʹ��������Ҳ����й¶��Ϣ�ĶԲ�<br>
    <input type="radio" name="da5"  value="2��Ϊ�˱��������ʼ��������ʼ�ʱҪ�ر�ע��">��Ϊ�˱��������ʼ��������ʼ�ʱҪ�ر�ע��<br>
    <input type="radio" name="da5"  value="3�۷�����������ʼ�ʱ����ʹ�������ļ�ת������ʹ��Gift�����ڷ������ڹ���ƽ̨��">�۷�����������ʼ�ʱ����ʹ�������ļ�ת������ʹ��Gift�����ڷ������ڹ���ƽ̨��<br>
    <input type="radio" name="da5"  value="4�ܸ���������˷����ʼ�ʱ��Ϊ�˱��⻥�࿴�������ַ����ʹ��To��ʹ��Cc����д�����ַ����">�ܸ���������˷����ʼ�ʱ��Ϊ�˱��⻥�࿴�������ַ����ʹ��To��ʹ��Cc����д�����ַ����</td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  </td>
</tr>



<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >6
    <input type="hidden" name="wtbh" value="6"  >  
  </td>
  <td  >
��������Ϣ���������ݣ�����
������������Ϣ���������ݣ����ܣ���ѡ��ǡ��������
    <input type="hidden" name="wt" value="��������Ϣ���������ݣ�����
������������Ϣ���������ݣ����ܣ���ѡ��ǡ��������" >	


	<BR>
	<input type="radio" name="da6"  value="1��Ϊ����Ա����ʶ�����ǳ���Ҫ����Ϣ������Ҫ��д�������ޣ���ʾΪ��������Ϣ������û������ʱ����Ϊ�������ޡ���">��Ϊ����Ա����ʶ�����ǳ���Ҫ����Ϣ������Ҫ��д�������ޣ���ʾΪ��������Ϣ������û������ʱ����Ϊ�������ޡ���<br>
	<input type="radio" name="da6"  value="2�ڡ�����Ϣ���ı�ʾ�ڷ������Ӧҳ��ʾ�����ļ���Ҳ���ԣ�">�ڡ�����Ϣ���ı�ʾ�ڷ������Ӧҳ��ʾ�����ļ���Ҳ���ԣ�<br>
	<input type="radio" name="da6"  value="3�۱��ܳ���ԭ���ϱ�����ͳ�Ϸ������ϻ�Notes�����÷������ƣ����б���">�۱��ܳ���ԭ���ϱ�����ͳ�Ϸ������ϻ�Notes�����÷������ƣ����б���<br>
	<input type="radio" name="da6"  value="4�ܱ������Լ��ĵ��Ի��߲��Ź���ķ�������ʱ����Ϊ���ص����������ŷ��ʣ����Բ������÷�������">�ܱ������Լ��ĵ��Ի��߲��Ź���ķ�������ʱ����Ϊ���ص����������ŷ��ʣ����Բ������÷�������
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >7
    <input type="hidden" name="wtbh" value="7"  >  
  </td>
  <td  >
���ڴ�������Ϣ��ֽ�棩
��  ���ڴ�������Ϣ��ֽ�棩��ѡ��ǡ��������
    <input type="hidden" name="wt" value="���ڴ�������Ϣ��ֽ�棩
��  ���ڴ�������Ϣ��ֽ�棩��ѡ��ǡ��������" >	


	<BR>
	<input type="radio" name="da7"  value="1��Ϊ����Ա����ʶ�����ǳ���Ҫ����Ϣ������Ҫ��д�������ޣ���ʾΪ��������Ϣ������û������ʱ����Ϊ�������ޡ���">��Ϊ����Ա����ʶ�����ǳ���Ҫ����Ϣ������Ҫ��д�������ޣ���ʾΪ��������Ϣ������û������ʱ����Ϊ�������ޡ���<br>
	<input type="radio" name="da7"  value="2����C�������ϵĳ������ŵ���͸�����ļ���ʱ��������">����C�������ϵĳ������ŵ���͸�����ļ���ʱ��������<br>
	<input type="radio" name="da7"  value="3�۱�������Ϣ���ļ���Կ�׹���ֻ�б�Ҫ���˲��ܹ�����">�۱�������Ϣ���ļ���Կ�׹���ֻ�б�Ҫ���˲��ܹ�����<br>
	<input type="radio" name="da7"  value="4�ܴ���������Ϣ����ֽ�棩ʱ���������ͬ��Ҳ��Ҫ�õ���֯�����ߵ����.��C������˾�����ڡ������������⣨����Ӧ������ȣ�">�ܴ���������Ϣ����ֽ�棩ʱ���������ͬ��Ҳ��Ҫ�õ���֯�����ߵ����.��C������˾�����ڡ������������⣨����Ӧ������ȣ�
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >8
    <input type="hidden" name="wtbh" value="8"  >  
  </td>
  <td  >
�������桢�װ壨��������?����װ壩
������Ϣ��ȫ�ƽ��У������Լ����������Χ��5S�ȡ���������?����װ塹�ĸ���ǳ���Ҫ����������?����װ�Ĺ۵��У���ѡ��ǡ����������
    <input type="hidden" name="wt" value="�������桢�װ壨��������?����װ壩
������Ϣ��ȫ�ƽ��У������Լ����������Χ��5S�ȡ���������?����װ塹�ĸ���ǳ���Ҫ����������?����װ�Ĺ۵��У���ѡ��ǡ����������" >	


	<BR>
	<input type="radio" name="da8"  value="1������Ϣ����ʱ����������ϡ�������������Ϣ��ҲҪѸ�ٴ���">������Ϣ����ʱ����������ϡ�������������Ϣ��ҲҪѸ�ٴ���<br>
	<input type="radio" name="da8"  value="2������ʱ�������ʱ�����Լ��ĳ�������">������ʱ�������ʱ�����Լ��ĳ�������<br>
	<input type="radio" name="da8"  value="3�۰װ��ʹ�ã�Ϊ�˲�й¶���޹��˻���һ��ʹ������Ϣʱ��Ѹ������װ�">�۰װ��ʹ�ã�Ϊ�˲�й¶���޹��˻���һ��ʹ������Ϣʱ��Ѹ������װ�<br>
	<input type="radio" name="da8"  value="4������Ϣ��������Ϣ���������������ϣ����ڰ칫���²������ֵĵط�">������Ϣ��������Ϣ���������������ϣ����ڰ칫���²������ֵĵط�
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >9
    <input type="hidden" name="wtbh" value="9"  >  
  </td>
  <td  >
����SNS��ʹ��
����ʹ��Facebook����΢���������������͵ȣ���LINE����΢�š����š�QQ�ȣ���SNSʱ����ѡ��ǡ��������
    <input type="hidden" name="wt" value="����SNS��ʹ��
����ʹ��Facebook����΢���������������͵ȣ���LINE����΢�š����š�QQ�ȣ���SNSʱ����ѡ��ǡ��������" >	


	<BR>
	<input type="radio" name="da9"  value="1�ٲ�����˾���̱ꡢ��˾���ơ���Ʒ���Ƶ����ڸ���ID������������">�ٲ�����˾���̱ꡢ��˾���ơ���Ʒ���Ƶ����ڸ���ID������������<br>
	<input type="radio" name="da9"  value="2���Ͻ���������Ϣ����������������Ƭ����Ƶ�����ϴ�">���Ͻ���������Ϣ����������������Ƭ����Ƶ�����ϴ�<br>
	<input type="radio" name="da9"  value="3����Ϊ���緽ʽʹ��ʱ������������Ա">����Ϊ���緽ʽʹ��ʱ������������Ա<br>
	<input type="radio" name="da9"  value="4�ܶ��������ˣ�������̰������ԵĹ���������">�ܶ��������ˣ�������̰������ԵĹ���������
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >10
    <input type="hidden" name="wtbh" value="10"  >  
  </td>
  <td  >
����������ʩ���豸����Ʒ��������Ƭ
   ��������������Ƭ����ѡ��ǡ��������
    <input type="hidden" name="wt" value="����������ʩ���豸����Ʒ��������Ƭ
   ��������������Ƭ����ѡ��ǡ��������" >	


	<BR>
	<input type="radio" name="da10"  value="1����ְ����ʱ���Բ���Ϊ�������ģ��������Լ���΢����">����ְ����ʱ���Բ���Ϊ�������ģ��������Լ���΢����<br>
	<input type="radio" name="da10"  value="2����Ҫ��������Ʒ�����ϣ��ù�˾�������������">����Ҫ��������Ʒ�����ϣ��ù�˾�������������<br>
	<input type="radio" name="da10"  value="3��Ϊ���ڻ��������Ͽ��ǻ��鳡�����õ����֮�������õ绰��������">��Ϊ���ڻ��������Ͽ��ǻ��鳡�����õ����֮�������õ绰��������<br>
	<input type="radio" name="da10"  value="4������������ʲô�ص�������㣬����Ҫ�õ������ߺ͹����ŵ����">������������ʲô�ص�������㣬����Ҫ�õ������ߺ͹����ŵ����
  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="20" rows="6"></textarea>  
  </td>
</tr>

    <tr align="center"> 
      <td colspan="3"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	for (var i=1;i<=10 ;i++ )
	{
		if(	!radioChecked( eval("FormName.da"+i) )) {
			alert("��"+i+"��δѡ��[�����]��");
			eval("FormName.da"+i+".focus()");
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
