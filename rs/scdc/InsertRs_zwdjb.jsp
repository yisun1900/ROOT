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
<form method="post" action="SaveInsertRs_zwdjb.jsp" name="insertform" target="_blank">
<div align="center">���ҵ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC" align="center">
  <td width="8%" >&nbsp;</td>
  <td width="8%" >�����Ŀ���</td>
  <td width="47%" >�����Ŀ</td>
  <td width="15%" >����</td>
  <td width="11%" >�����</td>
  <td width="19%" >��ע</td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="4" align="center"  >��Ϣ�ʲ�����</td>
  <td align="center"  >A-1
    <input type="hidden" name="djxmbh" value="A-1"  >  </td>
  <td  >
  �൱��ConfIDential(����)��������Ϣ����(�ձ�����ΪConfIDential-P)��Strictly ConfIDential(����)����Ϣ�ϱ�עȫ��˾��׼���ܱ�־�����ػ�����������<br>
    (ע1)ְ���������ֱ��м��ص���Ϣ�����������ݣ�<br>
    a) ֽ��ý�顢���ӻ���Ϣ������Ʒ��<br>
    b) CD��DVD�ȼ���ý�屣�ܵĻ�����Ϣ��

    <input type="hidden" name="djxm" value="�൱��ConfIDential(����)��������Ϣ����(�ձ�����ΪConfIDential-P)��Strictly ConfIDential(����)����Ϣ�ϱ�עȫ��˾��׼���ܱ�־�����ػ�����������
(ע1)ְ���������ֱ��м��ص���Ϣ�����������ݣ�
a) ֽ��ý�顢���ӻ���Ϣ������Ʒ��
b) CD��DVD�ȼ���ý�屣�ܵĻ�����Ϣ��" >	</td>
  <td align="left">
      5.1.2-4)<br>5.1.2-5)
      <input type="hidden" name="gj" value="5.1.2-4)<br>5.1.2-5)"  >  </td>

  <td  >
	<input type="radio" name="djjg1"  value="1">��<BR>
	<input type="radio" name="djjg1"  value="2">��<BR>
	<input type="radio" name="djjg1"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >A-2
    <input type="hidden" name="djxmbh" value="A-2"  >  </td>
  <td  >������������Ļ�����Ϣ�ļ�����Ʒ�ȣ�����ʱ���뿪��λ���°�ؼҵȲ�ʹ��ʱ�������ܹ������İ칫��������ļ���ȣ�����������
���⣬�������Ե��趨�ȣ��Ƿ��������״̬(�������桢������Ļ)��
?û���ڰ칫�������Լ������ϡ��������С����ܱߵȵط����û�����Ϣ(ֽ����Ϣ������Ʒ��)��
?û���ڴ�ӡ��������ĳ�ֽ�������ļ��ȡ�
?�ڵ�����������Ļ���������룬������ʱ������Ϊ5�������¡�
?�뿪��λʱ�ֶ�������Ļ�����ػ��棬�趨Ϊ�޷�����״̬��
    <input type="hidden" name="djxm" value="������������Ļ�����Ϣ�ļ�����Ʒ�ȣ�����ʱ���뿪��λ���°�ؼҵȲ�ʹ��ʱ�������ܹ������İ칫��������ļ���ȣ�����������
���⣬�������Ե��趨�ȣ��Ƿ��������״̬(�������桢������Ļ)��
?û���ڰ칫�������Լ������ϡ��������С����ܱߵȵط����û�����Ϣ(ֽ����Ϣ������Ʒ��)��
?û���ڴ�ӡ��������ĳ�ֽ�������ļ��ȡ�
?�ڵ�����������Ļ���������룬������ʱ������Ϊ5�������¡�
?�뿪��λʱ�ֶ�������Ļ�����ػ��棬�趨Ϊ�޷�����״̬��" >  </td><td align="left">
5.1.2-4)
5.1.2-5)
7.4.2
      <input type="hidden" name="gj" value="5.1.2-4)
5.1.2-5)
7.4.2"  >
  </td>

  <td>
	<input type="radio" name="djjg2"  value="1">��<BR>
	<input type="radio" name="djjg2"  value="2">��<BR>
	<input type="radio" name="djjg2"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >A-3
    <input type="hidden" name="djxmbh" value="A-3"  >  </td>
  <td  >
����ConfIDential(����)����Ʒ(����ǰ���²�Ʒ��)�Թ�˾�ⲿ����ʱ����һ����ȡ��ְ��������������
    <input type="hidden" name="djxm" value="����ConfIDential(����)����Ʒ(����ǰ���²�Ʒ��)�Թ�˾�ⲿ����ʱ����һ����ȡ��ְ��������������" >  </td>
  <td align="left">
5.1.2-5)-i)
      <input type="hidden" name="gj" value="5.1.2-5)-i)"  >  </td>

  <td>
	<input type="radio" name="djjg3"  value="1">��<BR>
	<input type="radio" name="djjg3"  value="2">��<BR>
	<input type="radio" name="djjg3"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >A-4
    <input type="hidden" name="djxmbh" value="A-4"  >  </td>
  <td  >
��ͻ������ȡ�ÿͻ�������Ϣʱ���Ƿ���ǰ��ͻ���֪ʹ��Ŀ�Ĳ�ȡ�ÿͻ�ͬ�⣿
���⣬������ȡ�õĸ�����Ϣ�������ڸ�֪Ŀ�����⣿
    <input type="hidden" name="djxm" value="��ͻ������ȡ�ÿͻ�������Ϣʱ���Ƿ���ǰ��ͻ���֪ʹ��Ŀ�Ĳ�ȡ�ÿͻ�ͬ�⣿
���⣬������ȡ�õĸ�����Ϣ�������ڸ�֪Ŀ�����⣿" >  </td>
  <td align="left">
(������Ϣ����������̵�15����17����18��)
      <input type="hidden" name="gj" value="(������Ϣ����������̵�15����17����18��)"  >  </td>

  <td>
	<input type="radio" name="djjg4"  value="1">��<BR>
	<input type="radio" name="djjg4"  value="2">��<BR>
	<input type="radio" name="djjg4"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>



<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="2" align="center"  >����ȫ</td>
  <td align="center"  >P-1
    <input type="hidden" name="djxmbh" value="P-1"  >  </td>
  <td  >
����C�����ϵĵص㣬�Ƿ�ʱ����ؿ�����Я��ID����
���⣬����B�����ϳ���ʱ���Ƿ�����ˢID�����򱣰���Ա��ʾ��������򣿡�
��ֹδ����������򣬸������˽���(��ν�ĸ������)��ID���Ľ��á����Ƿ�ȫ�������ˣ�
    <input type="hidden" name="djxm" value="����C�����ϵĵص㣬�Ƿ�ʱ����ؿ�����Я��ID����
���⣬����B�����ϳ���ʱ���Ƿ�����ˢID�����򱣰���Ա��ʾ��������򣿡�
��ֹδ����������򣬸������˽���(��ν�ĸ������)��ID���Ľ��á����Ƿ�ȫ�������ˣ�" >  </td>
  <td align="left">
6.3.2-2)-d)-(1)
7.1.2-3)-b)-��
(�����ձ�������ȫָ����׼4-2-1��4��������ʹ���)
      <input type="hidden" name="gj" value="6.3.2-2)-d)-(1)
7.1.2-3)-b)-��
(�����ձ�������ȫָ����׼4-2-1��4��������ʹ���)"  >  </td>

  <td>
	<input type="radio" name="djjg5"  value="1">��<BR>
	<input type="radio" name="djjg5"  value="2">��<BR>
	<input type="radio" name="djjg5"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >P-2
    <input type="hidden" name="djxmbh" value="P-2"  >  </td>
  <td  >
��ֹ�����˵��ԡ�����USB�ȵ��Ӽ���ý����빫˾�ڣ����Ƿ������ˣ�
�����ֻ������ܵ绰���������ġ����������ƽ����ԡ���Ϸ���ȵ����豸���빫˾�ڲ�ʱ��ÿ����ȡ��1�����ϵ�ְ����������ɣ�������������������
(1)�����ӹ�˾�ڲ����ԡ������豸��
(2)�����湫˾��Ϣ��
    <input type="hidden" name="djxm" value="��ֹ�����˵��ԡ�����USB�ȵ��Ӽ���ý����빫˾�ڣ����Ƿ������ˣ�
�����ֻ������ܵ绰���������ġ����������ƽ����ԡ���Ϸ���ȵ����豸���빫˾�ڲ�ʱ��ÿ����ȡ��1�����ϵ�ְ����������ɣ�������������������
(1)�����ӹ�˾�ڲ����ԡ������豸��
(2)�����湫˾��Ϣ��" >  </td>
  <td align="left">
7.2.2
      <input type="hidden" name="gj" value="7.2.2"  >  </td>

  <td>
	<input type="radio" name="djjg6"  value="1">��<BR>
	<input type="radio" name="djjg6"  value="2">��<BR>
	<input type="radio" name="djjg6"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="2" align="center"  >�˵İ�ȫ</td>
  <td align="center"  >H-1
    <input type="hidden" name="djxmbh" value="H-1"  >  </td>
  <td  >
���ڲ����й���Ϣ��ȫ��e��������
    <input type="hidden" name="djxm" value="���ڲ����й���Ϣ��ȫ��e��������" >  </td>
  <td align="left">
6.1.2
      <input type="hidden" name="gj" value="6.1.2"  >  </td>

  <td>
	<input type="radio" name="djjg7"  value="1">��<BR>
	<input type="radio" name="djjg7"  value="2">��<BR>
	<input type="radio" name="djjg7"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >H-2
    <input type="hidden" name="djxmbh" value="H-2"  >  </td>
  <td  >
���Ƿ��˽���Ϊ��˾�ʲ��ĵ��Ի�USB�洢����ʧʱ�����߻�����Ϣ��������Ϣ�ȶ�ʧʱ����ְ�������˻㱨��������
    <input type="hidden" name="djxm" value="���Ƿ��˽���Ϊ��˾�ʲ��ĵ��Ի�USB�洢����ʧʱ�����߻�����Ϣ��������Ϣ�ȶ�ʧʱ����ְ�������˻㱨��������" >  </td>
  <td align="left">
10.1.2
      <input type="hidden" name="gj" value="10.1.2"  >  </td>

  <td>
	<input type="radio" name="djjg8"  value="1">��<BR>
	<input type="radio" name="djjg8"  value="2">��<BR>
	<input type="radio" name="djjg8"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>


<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="7" align="center"  >IT��ȫ</td>
  <td align="center"  >IT-1
    <input type="hidden" name="djxmbh" value="IT-1"  >  </td>
  <td  >
���ĵ������Ƿ�������OS���룿�����õĵ������Ƿ�װ��McAfee��Endpoint Encryption(�ɳ�SafeBoot(HDD�������))�����⣬�������������������������Ƿ��ǰ���ָ����׼�й涨�ķ����趨�ģ�
a)������Ӣ����������ϣ�6λ���ϡ�
b)���붨�ڸ��£�����30����һ�Ρ�
c)���벻�ø�֪���ˡ�
d)û���ñ�ǩֽ�����ڵ����ϣ��������ڵ����������Զ���¼��
    <input type="hidden" name="djxm" value="���ĵ������Ƿ�������OS���룿�����õĵ������Ƿ�װ��McAfee��Endpoint Encryption(�ɳ�SafeBoot(HDD�������))�����⣬�������������������������Ƿ��ǰ���ָ����׼�й涨�ķ����趨�ģ�
a)������Ӣ����������ϣ�6λ���ϡ�
b)���붨�ڸ��£�����30����һ�Ρ�
c)���벻�ø�֪���ˡ�
d)û���ñ�ǩֽ�����ڵ����ϣ��������ڵ����������Զ���¼��" >  </td>
  <td align="left">
5.1.2-5)-b)-��Ϣϵͳ-i)
8.4.2-1)
(���ӻ���Ϣ�ʲ�ʹ��?����ָ����׼2.(2))
      <input type="hidden" name="gj" value="5.1.2-5)-b)-��Ϣϵͳ-i)
8.4.2-1)
(���ӻ���Ϣ�ʲ�ʹ��?����ָ����׼2.(2))"  >  </td>

  <td>
	<input type="radio" name="djjg9"  value="1">��<BR>
	<input type="radio" name="djjg9"  value="2">��<BR>
	<input type="radio" name="djjg9"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-2
    <input type="hidden" name="djxmbh" value="IT-2"  >  </td>
  <td  >
��ֹ�����������ҵ��û��ֱ�ӹ�ϵ�Ĺ�˾�ⲿ��վ�Լ����أ���װ�����ļ�������ȡ����Ƿ���������Щ�涨��
    <input type="hidden" name="djxm" value="��ֹ�����������ҵ��û��ֱ�ӹ�ϵ�Ĺ�˾�ⲿ��վ�Լ����أ���װ�����ļ�������ȡ����Ƿ���������Щ�涨��" >  </td>
  <td align="left">
6.3.2-2)-b)-(7) 
6.3.2-2)-c)-(6)(10)
      <input type="hidden" name="gj" value="6.3.2-2)-b)-(7) 
6.3.2-2)-c)-(6)(10)"  >  </td>

  <td>
	<input type="radio" name="djjg10"  value="1">��<BR>
	<input type="radio" name="djjg10"  value="2">��<BR>
	<input type="radio" name="djjg10"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-3
    <input type="hidden" name="djxmbh" value="IT-3"  >  </td>
  <td  >
���Ƿ��ڵ����а�װ��ʱɱ�����?
���⣬���ĵ��Ը�Ⱦ�����������б����ȷ�����������ʱ���Ƿ����������ж�LAN������ְ�������˺͵��Թ���Ա���棬�ȴ�����ָʾ�ȵĻ��������̣�
    <input type="hidden" name="djxm" value="���Ƿ��ڵ����а�װ��ʱɱ�����?
���⣬���ĵ��Ը�Ⱦ�����������б����ȷ�����������ʱ���Ƿ����������ж�LAN������ְ�������˺͵��Թ���Ա���棬�ȴ�����ָʾ�ȵĻ��������̣�" >  </td>
  <td align="left">
5.1.2-5)-b)-��Ϣϵͳ-i)
6.3.2-2)-c)-(5)
8.1.2-1)
      <input type="hidden" name="gj" value="5.1.2-5)-b)-��Ϣϵͳ-i)
6.3.2-2)-c)-(5)
8.1.2-1)"  >  </td>

  <td>
	<input type="radio" name="djjg11"  value="1">��<BR>
	<input type="radio" name="djjg11"  value="2">��<BR>
	<input type="radio" name="djjg11"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-4
    <input type="hidden" name="djxmbh" value="IT-4"  >  </td>
  <td  >
���ĵ����е��ļ��Ƿ��ڷǹ���״̬��
�����е��ļ�����Ϊ����״̬ʱ��Ӧ��Ϊ�ļ�������������Ҫ��ȡ��������ȫ�Ż�ָ����׼�м��صĹ���Բߡ�
    <input type="hidden" name="djxm" value="���ĵ����е��ļ��Ƿ��ڷǹ���״̬��
�����е��ļ�����Ϊ����״̬ʱ��Ӧ��Ϊ�ļ�������������Ҫ��ȡ��������ȫ�Ż�ָ����׼�м��صĹ���Բߡ�" >  </td>
  <td align="left">
(��������ȫ�Ż�ָ����׼)
      <input type="hidden" name="gj" value="(��������ȫ�Ż�ָ����׼)"  >  </td>

  <td>
	<input type="radio" name="djjg12"  value="1">��<BR>
	<input type="radio" name="djjg12"  value="2">��<BR>
	<input type="radio" name="djjg12"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-5
    <input type="hidden" name="djxmbh" value="IT-5"  >  </td>
  <td  >
���ڽ����Ի��߼���ý��ȼ���Ϣ������˾ʱ���Ƿ����������¹涨��
?�������Ժ͵��Ӽ���ý��(�����������¼�����)ʱ��ȷ�ϵ���ʵʩHDD����(McAfee Endpoint Encryption(�ɳ�SafeBoot)��USB�洢�����м��ܹ��ܣ����д��������룬ȡ��ְ�������˵���ɣ�(�������Լ�����)
���⣬�Ƿ���������ʱ��ֹ���ƶ��ҽ����Ի��߼���ý��ȼ���Ϣ������
?����ֽ����Ϣ������Ʒ�Ȼ�����Ϣʱ��ʵʩ���������벢ȡ��ְ�������˵�������(�������Լ�����)
���⣬�Ƿ���������ʱ��ֹ���ƶ���ֽ����Ϣ������Ʒ�Ȼ�����Ϣ������
?���Ӽ���ý�塢���������¼������й黹ʱ���Ƿ�ɾ�������ݣ�
?����ʱ�Ƿ�ʱЯ�������ǲ���Я��ʱ�Ƿ񱣴����ܹ������ĳ�����
    <input type="hidden" name="djxm" value="���ڽ����Ի��߼���ý��ȼ���Ϣ������˾ʱ���Ƿ����������¹涨��
?�������Ժ͵��Ӽ���ý��(�����������¼�����)ʱ��ȷ�ϵ���ʵʩHDD����(McAfee Endpoint Encryption(�ɳ�SafeBoot)��USB�洢�����м��ܹ��ܣ����д��������룬ȡ��ְ�������˵���ɣ�(�������Լ�����)
���⣬�Ƿ���������ʱ��ֹ���ƶ��ҽ����Ի��߼���ý��ȼ���Ϣ������
?����ֽ����Ϣ������Ʒ�Ȼ�����Ϣʱ��ʵʩ���������벢ȡ��ְ�������˵�������(�������Լ�����)
���⣬�Ƿ���������ʱ��ֹ���ƶ���ֽ����Ϣ������Ʒ�Ȼ�����Ϣ������
?���Ӽ���ý�塢���������¼������й黹ʱ���Ƿ�ɾ�������ݣ�
?����ʱ�Ƿ�ʱЯ�������ǲ���Я��ʱ�Ƿ񱣴����ܹ������ĳ�����" >  </td>
  <td align="left">
5.1.2-4)-b)
5.1.2-5)-b)-��Ϣϵͳ-��)-(6)(9)(10)
6.3.2-2)-c)-(1) 6.3.2-2)-d-(4)
(���ӻ���Ϣ�ʲ�ʹ��?����ָ����׼2.(2))
      <input type="hidden" name="gj" value="5.1.2-4)-b)
5.1.2-5)-b)-��Ϣϵͳ-��)-(6)(9)(10)
6.3.2-2)-c)-(1) 6.3.2-2)-d-(4)
(���ӻ���Ϣ�ʲ�ʹ��?����ָ����׼2.(2))"  >  </td>

  <td>
	<input type="radio" name="djjg13"  value="1">��<BR>
	<input type="radio" name="djjg13"  value="2">��<BR>
	<input type="radio" name="djjg13"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-6
    <input type="hidden" name="djxmbh" value="IT-6"  >  </td>
  <td  >
�����ô��������ConfIDential(����)��Ϣʱ���Ƿ�������������ȡ�����磬ʵʩ���Է��͵�ȷ�ϲ������ͣ���������֮��Ҫ��Է�֪ͨ���Ž���أ�
    <input type="hidden" name="djxm" value="�����ô��������ConfIDential(����)��Ϣʱ���Ƿ�������������ȡ�����磬ʵʩ���Է��͵�ȷ�ϲ������ͣ���������֮��Ҫ��Է�֪ͨ���Ž���أ�" >  </td>
  <td align="left">
5.4.2-4)-b)-V
      <input type="hidden" name="gj" value="5.4.2-4)-b)-V"  >  </td>

  <td>
	<input type="radio" name="djjg14"  value="1">��<BR>
	<input type="radio" name="djjg14"  value="2">��<BR>
	<input type="radio" name="djjg14"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >IT-7 
    <input type="hidden" name="djxmbh" value="IT-7 "  >  </td>
  <td  >
? ���������ļ�ͨ���ʼ���������ʱ�����ͨ��McAfee Endpoint Encryption (������SafeBoot)����SWDTE���ܣ�����PW�ò�ͬ�ʼ���������
?����з����ˡ������˶����Է��ʵ��ļ���������Lotus Notesʱ����ʹ���ʼ�������ʽ���ǽ����ӻ���Ϣ���ܵ��ļ���������Lotus Notes��,��ȡ֪ͨ������URL��Lotus Notesͼ�����ʽ����
?��Ӧ�ù��������ַ�Ĺ�˾�����һͬ�����ʼ�ʱ�������ַ�Ƿ�ʹ��Bcc�������Ƿ�ͨ��ʹ��ͬʱ�����ʼ�ר��������Է�ֹ�����ַй©��
    <input type="hidden" name="djxm" value="? ���������ļ�ͨ���ʼ���������ʱ�����ͨ��McAfee Endpoint Encryption (������SafeBoot)����SWDTE���ܣ�����PW�ò�ͬ�ʼ���������
?����з����ˡ������˶����Է��ʵ��ļ���������Lotus Notesʱ����ʹ���ʼ�������ʽ���ǽ����ӻ���Ϣ���ܵ��ļ���������Lotus Notes��,��ȡ֪ͨ������URL��Lotus Notesͼ�����ʽ����
?��Ӧ�ù��������ַ�Ĺ�˾�����һͬ�����ʼ�ʱ�������ַ�Ƿ�ʹ��Bcc�������Ƿ�ͨ��ʹ��ͬʱ�����ʼ�ר��������Է�ֹ�����ַй©��" >  </td>
  <td align="left">
5.1.2-4)-b)-v)
5.1.2-4)-e)-v)
(�����ʼ�ʹ��ָ����׼3.AIR)
      <input type="hidden" name="gj" value="5.1.2-4)-b)-v)
5.1.2-4)-e)-v)
(�����ʼ�ʹ��ָ����׼3.AIR)"  >  </td>

  <td>
	<input type="radio" name="djjg15"  value="1">��<BR>
	<input type="radio" name="djjg15"  value="2">��<BR>
	<input type="radio" name="djjg15"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>


<tr align="left" bgcolor="#FFFFFF">
  <td rowspan="3" align="center"  >IT��ȫ</td>
  <td align="center"  >ES-1
    <input type="hidden" name="djxmbh" value="ES-1"  >  </td>
  <td  >
�黹������������ʱ���Ƿ�ȷ�����Ѿ�ɾ���˲���Ҫ���ļ���������˻���վ��
    <input type="hidden" name="djxm" value="�黹������������ʱ���Ƿ�ȷ�����Ѿ�ɾ���˲���Ҫ���ļ���������˻���վ��" >  </td>
  <td align="left">
ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)
      <input type="hidden" name="gj" value="ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)"  >  </td>

  <td>
	<input type="radio" name="djjg16"  value="1">��<BR>
	<input type="radio" name="djjg16"  value="2">��<BR>
	<input type="radio" name="djjg16"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ES-2
    <input type="hidden" name="djxmbh" value="ES-2"  >  </td>
  <td  >
���ӻ�������Ϣ���Ƿ�δ���浽�����ϣ�����������ͳһ�ļ���������(����ͬ���ĺϹ������)��
    <input type="hidden" name="djxm" value="���ӻ�������Ϣ���Ƿ�δ���浽�����ϣ�����������ͳһ�ļ���������(����ͬ���ĺϹ������)��" >  </td>
  <td align="left">
ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)
      <input type="hidden" name="gj" value="ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)"  >  </td>

  <td>
	<input type="radio" name="djjg17"  value="1">��<BR>
	<input type="radio" name="djjg17"  value="2">��<BR>
	<input type="radio" name="djjg17"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ES-3
    <input type="hidden" name="djxmbh" value="ES-3"  >  </td>
  <td  >
?̨ʽ���ԡ��ʼǱ��������ֶ��÷��������󶨣���������û�а������ŵ�����ж���ĵط��ɣ�
?���Է���������Կ�ף�û�зŵ��������İ칫���������ɣ�
?�°�ؼ�ʱ�ʼǱ������������������
    <input type="hidden" name="djxm" value="?̨ʽ���ԡ��ʼǱ��������ֶ��÷��������󶨣���������û�а������ŵ�����ж���ĵط��ɣ�
?���Է���������Կ�ף�û�зŵ��������İ칫���������ɣ�
?�°�ؼ�ʱ�ʼǱ������������������" >  </td>
  <td align="left">
ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)
      <input type="hidden" name="gj" value="ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)"  >  </td>

  <td>
	<input type="radio" name="djjg18"  value="1">��<BR>
	<input type="radio" name="djjg18"  value="2">��<BR>
	<input type="radio" name="djjg18"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>



<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >����Ʒ</td>
  <td align="center"  >ES-4
    <input type="hidden" name="djxmbh" value="ES-4"  >  </td>
  <td  >
?���ܵĻ���Ʒ��A�������ܵĻ���Ʒ��B�������ϣ�����֯�ܹ����յĻ�����ʵ������������
?���ڴ����޷���������ʱ��ʵ�����ڸǵ�ʹ�ⲿ�޷������Ĺ�������
?ÿ��ʵʩ���������̵㣬ʵ��̨�˹�����ȡ��ְ�������˵���������
?ʵ�г��衢����������ȡ��ְ�������˵���������
?��͵��뿪��λʱ��ʵ��������������
?��������ʱ��ʵ���������ƻ�������̨������ȡ��¼����
    <input type="hidden" name="djxm" value="?���ܵĻ���Ʒ��A�������ܵĻ���Ʒ��B�������ϣ�����֯�ܹ����յĻ�����ʵ������������
?���ڴ����޷���������ʱ��ʵ�����ڸǵ�ʹ�ⲿ�޷������Ĺ�������
?ÿ��ʵʩ���������̵㣬ʵ��̨�˹�����ȡ��ְ�������˵���������
?ʵ�г��衢����������ȡ��ְ�������˵���������
?��͵��뿪��λʱ��ʵ��������������
?��������ʱ��ʵ���������ƻ�������̨������ȡ��¼����" >  </td>
  <td align="left">
ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)
      <input type="hidden" name="gj" value="ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)"  >  </td>

  <td>
	<input type="radio" name="djjg19"  value="1">��<BR>
	<input type="radio" name="djjg19"  value="2">��<BR>
	<input type="radio" name="djjg19"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ֽ����Ϣ����</td>
  <td align="center"  >ES-5
    <input type="hidden" name="djxmbh" value="ES-5"  >  </td>
  <td  >
?������Ϣ��������Ϣ��������Ϣ�Լ��Ĵ���Ϣ��ÿ�ζ�����ֽ��������
?�ۺ�����ֽ�����ܽ⴦��ʱ����ʱ��������B�������ϣ���������������
    <input type="hidden" name="djxm" value="?������Ϣ��������Ϣ��������Ϣ�Լ��Ĵ���Ϣ��ÿ�ζ�����ֽ��������
?�ۺ�����ֽ�����ܽ⴦��ʱ����ʱ��������B�������ϣ���������������" >  </td>
  <td align="left">
ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)
      <input type="hidden" name="gj" value="ISO27001��ˡ��ڲ���顢���������ϵĿ�������(��������û�а�������Ŀ)"  >  </td>

  <td>
	<input type="radio" name="djjg20"  value="1">��<BR>
	<input type="radio" name="djjg20"  value="2">��<BR>
	<input type="radio" name="djjg20"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ID��</td>
  <td align="center"  >ES-6
    <input type="hidden" name="djxmbh" value="ES-6"  >  </td>
  <td  >
?Ա��֤ID����PAL������ȫ���ȵ�ID���Ƿ�ʹ�õ�����ס���Է�ֹ���䡢��ʧ���ڹ�����ʱ���������ܾ����е�У���ô�ڲ���ʹ�õ���ʱ���Ƿ��ȡ��������ֹ���䡢��ʧ�Ĵ�ʩ��
?�°���Ƿ�ʵʩ��ID���ȷ���Ƥ���ڲ�Ĵ������Ŀڴ����С��Է�ֹ��ʧ�Ķ��ù���
?�ڲ���Ҫ������˾����ĩ����Ϣ�յ�ʱ��������ID�����Ƿ�ʵʩ��ֹ�ڼ�����ʧ�Ķ��ù���
    <input type="hidden" name="djxm" value="?Ա��֤ID����PAL������ȫ���ȵ�ID���Ƿ�ʹ�õ�����ס���Է�ֹ���䡢��ʧ���ڹ�����ʱ���������ܾ����е�У���ô�ڲ���ʹ�õ���ʱ���Ƿ��ȡ��������ֹ���䡢��ʧ�Ĵ�ʩ��
?�°���Ƿ�ʵʩ��ID���ȷ���Ƥ���ڲ�Ĵ������Ŀڴ����С��Է�ֹ��ʧ�Ķ��ù���
?�ڲ���Ҫ������˾����ĩ����Ϣ�յ�ʱ��������ID�����Ƿ�ʵʩ��ֹ�ڼ�����ʧ�Ķ��ù���" >  </td>
  <td align="left">
��ֹ��Ϣ��ȫ�¹ʡ��¼�
      <input type="hidden" name="gj" value="��ֹ��Ϣ��ȫ�¹ʡ��¼�"  >  </td>

  <td>
	<input type="radio" name="djjg21"  value="1">��<BR>
	<input type="radio" name="djjg21"  value="2">��<BR>
	<input type="radio" name="djjg21"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>
<tr align="left" bgcolor="#FFFFFF">
  <td align="center"  >ҵ�����ֻ�</td>
  <td align="center"  >ES-7
    <input type="hidden" name="djxmbh" value="ES-7"  >  </td>
  <td  >
?ҵ�����ֻ������������Ƿ񱣳���Ч��
?�Ƿ�ʹ�õ����������ֻ�������
?�°�ʱ�Ȳ���Ҫʹ�ø��ֻ�ʱ���Ƿ���������ӵĳ�����У���ʵʩ��������
?��ĩ����Ϣ�յȲ���Ҫ��ҵ�����ֻ���������ʱ���Ƿ�ʵʩ��ֹ��ʧ�Ķ��ù���
    <input type="hidden" name="djxm" value="?ҵ�����ֻ������������Ƿ񱣳���Ч��
?�Ƿ�ʹ�õ����������ֻ�������
?�°�ʱ�Ȳ���Ҫʹ�ø��ֻ�ʱ���Ƿ���������ӵĳ�����У���ʵʩ��������
?��ĩ����Ϣ�յȲ���Ҫ��ҵ�����ֻ���������ʱ���Ƿ�ʵʩ��ֹ��ʧ�Ķ��ù���" >  </td>
  <td align="left">
��ֹ��Ϣ��ȫ�¹ʡ��¼�
      <input type="hidden" name="gj" value="��ֹ��Ϣ��ȫ�¹ʡ��¼�"  >  </td>

  <td>
	<input type="radio" name="djjg22"  value="1">��<BR>
	<input type="radio" name="djjg22"  value="2">��<BR>
	<input type="radio" name="djjg22"  value="3">������<BR>  </td>
  <td align="center" valign="top">
     <textarea name="bz" cols="15" rows="3"></textarea>  </td>
</tr>

    <tr align="center"> 
      <td colspan="6"> 
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
	for (var i=1;i<=22 ;i++ )
	{
		if(	!radioChecked( eval("FormName.djjg"+i) )) {
			alert("��"+i+"��δѡ��[�����]��");
			eval("FormName.djjg"+i+".focus()");
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
