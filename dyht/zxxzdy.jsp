<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ע��1���ˡ��ͻ�סլװ����֪�������ݣ������ҹ�˾Ӫҵ��������Ϊ���ж�������ϸ����</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

<tr bgcolor="#FFFFFF"> 
    <td colspan="7"><span lang=EN-US></span></td>
    <!--  <td align="right">http://pesyddl.panasonic.cn/</td> -->
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong><div><font size="6" color="">�ͻ�װ����֪</font></div></strong></p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ȣ����ĵظ�л�����ҹ�˾�����Σ����ǽ�ȫ���Թ�լ������ơ�ʩ���������������ʡ���ܰ��סլ�ռ䡣</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>��һ����&nbsp;&nbsp;��Ҫ��ʾ</strong></p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;һ�����ڳ�ŵ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��˾���е��Żݻ����ͬ����Ŀ��������������յ��Ⱦ���������ʽ�ṩ�������κ�Ա���Ŀ�ͷ��ŵ������Ϊ��˾��Ϊ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����������ƣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ʦ���������й�ͨʱ�����漰��һЩ���ĸ�����˽���ϣ��磺��ͥ��Ա��������;����������ȣ�����˾��ŵ�������ĸ������ϱ��ܡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��������ʩ����Χ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;1�����ڷ��ɡ������ֹ��ʩ����Ŀ���磺�������ǽ������ˮ���ܺͲ�ů�ܵ������ȡ�ú������ȣ����ҹ�˾����ʩ����</strong></span></b></p>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2������ҵ�����ʩ����Ŀ�����ӶԽ���λ������ϵͳ��װ�޲��ϵ�װ�ȣ����ҹ�˾����ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�ġ����ڷ�Ʊ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�������Ʊ���ÿ�ʽ����վݣ����̿�������ʱ����ƾ�����վݰ�����㣬��������ٲ������������ȡ��ʽ��Ʊ��ԭ�����վ�����˾�ջء����������ṩ�����ѿ���ȫ�������վݣ���˾��������˿��Ʊ��ȡ������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�塢����Ͷ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��Ϊ���ṩ��������������У���������κβ���֮����������飬��ӭ��ʱ�µ磺<span
lang=EN-US>0411-84450300</span>����˾��ר�˸������</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>�ڶ�����&nbsp;&nbsp;���̽���</strong></p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;һ���ɴ�׶�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1�����壺����ǩ����ƺ�ͬ���յ���լԿ�׺����ǽ���<u><span lang=EN-US>&nbsp;&nbsp;&nbsp;
</span></u>���������ڰ���רҵ�������Ա�Թ�լ���г�������������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1��Ϊ�˽�ʡ���ı���ʱ�䣬ͬʱΪ�˷�����˾��Ա�Ĺ������ţ���������ṩ��լ��Կ�׼����ͽṹͼ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2��Ϊ����������������ⷢ������Ҫ��ì�ܣ�������סլ�ڴ������Ʒ������ؽ���Ʒ������ٽ�Կ���ṩ����˾��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;������ƽ׶�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1�����壺</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1������ǩ����ƺ�ͬ�����ǻ�ָ��רҵ���ʦΪ���ṩ��Ʒ�������շѱ�׼Ϊ<span lang=EN-US>30-200</span>Ԫ<span
lang=EN-US>\</span>ƽ���ף������ʦ�������Ҿ������������ͬʱ���ṩЧ��ͼ������ͼƬ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2������ǰ�ڲ��߱��ɴ�������λ�ã����¥�ȣ�������©�ʩ��ʱ���ֳ�ʵ�����Ϊ׼�����ʦ���������Ʒ��������ۣ��ɿͻ�ȷ�Ϻ�ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3��Ϊ�˱�������۸���켰��Ʒ���������⣬��˾��������˾Ա����ͬ���ɹ��κ���Ʒ������˽��ί����˾Ա������װ��Ʒ���ɴ���ɵ�һ�к���ҹ�˾�������κ����Ρ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1�������ʦ�Ĺ�����Ҫһ���Ķ����ռ��ʱ������˼���ʹ�����ϣ������������ʦ����Լ����ʱ����棬��������������뾡������ǰ<span
lang=EN-US>2</span>��<span lang=EN-US>3</span>��ͬ���ʦԤԼ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2����������ȷ���ļҾ߿�ʽ���ߴ��֪���ʦ���Ա������ʦ��ϵ������ȥ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3�������в�����Ʒ��Ҫ�Թ������������ǩ��ʩ����ͬǰ�ṩ�����Ʒ�����ϣ�Ʒ�ƹ���ͺż����˵�������Ա����ʦ�ܹ�˳����Ϊ���ṩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��4�������������У����ʦ��Ҫ������ͼֽ�Լ�̸����¼����ǩ��ȷ�ϣ�������ϡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�������۽׶�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���壺��Ʒ���ȷ�����ҹ�˾������ʱ���ϸԤ�㡣�����������ǩ��ʩ����ͬ��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��������Ʒ���磺��ˮ�����յ��ȣ�������ʼ����Ϊ��װ֮�գ�����������������ȡ���ŷ���ѡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�ġ�ʩ���׶�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1�����壺</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1�����ڣ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����һ������£����������<span
 lang=EN-US>200m<sup>2</sup></span>����סլ������Ϊ<span lang=EN-US>105</span>�������գ����������<span
 lang=EN-US>200m<sup>2</sup></span>���ϵ�סլ������Ϊ<span lang=EN-US>120</span>�������գ���������Ϊ<span
lang=EN-US>180</span>�������ա�������ʩ���ر��ӣ����ڻ���Ӧ���ӳ���</span><span style='font-size:
12.0pt;line-height:150%;font-family:����_GB2312'>���幤��Э��ȷ��<span style='color:black'>��</span>��ͬǩ���������Ϊ������ʼ���ڣ�����������飩��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����������������Ҫ�����̹��ڣ���˾���ж��Ƿ���в���������ȡ��Ӧ�Ĺ�����á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;����˾���ṩһ�����Թ���Ʒ�������Ŀ�Ľ������ڱ������Թ���Ʒδ����Ԥ�������ڽ��������ʩ����Աδ����Ԥ��ʱ�������ʩ��������е���Ӧ�����μ����ã������ڷ���50Ԫ/�죩��������¡�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2��ǩ��ʩ����ͬ����˾��ָ��һ�����̼�������ʩ���ֳ���ʩ��������֤�ֳ��ܹ���ʱ�����ʵ�˳��ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3��Ϊ�˾����ܵ�ά������Ȩ�棬��˾�ϸ�涨��������ʩ����Ա�����������¾��󷹼�ס�ޡ����������������󣬿�ֱ����0411-84450300Ͷ�ߣ���˾������������������д�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��4��ʩ��ʱ����˾�Ĺ��������ϸ�Ԥ������Ϊ׼���������빫˾Ա���Ŀ�ͷ������Լ�����ݾ��������ǵ�ʩ����Χ������������˾Ա����������׷�Ӵ�����Ŀ����Ŀ����������ɾܾ�������˾0411-84450300Ͷ�ߡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��5����˾��ʩ���л���ֳ�ԭ����ʩ�Ƚ��б�������������𻵡�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2��������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1��ʩ��������Ҫ�����Ʒ��������Ŀ��������д��������������������������ǩ��ȷ�ϣ���˾���ɽ���ʩ����Ϊ���ⷢ������Ҫ�ľ��ף����ܴ��������˻�ʵ���ǩ������Ϊ��Ч����������ί���߳��⡣����ǩ֤������ȷ��֮ǰ�����й�˾�ڲ�ȷ�ϣ����̡���ơ�Ԥ�㵣��ȷ�ϣ��������յ��ı�����޹�˾ȷ�ϣ����÷ݱ������Ч�������ɾ�ǩ������0411-84450300Ͷ�ߡ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�����Թ�����Ŀ�������Ҫ��ģ�����̿�������ȫ��֧������˾����ʩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;������������ԭ��Թ�����Ŀ�������Ҫ��ģ������漰�ķ����糬����ͬ�ۿ��10%ʱ������֧������˾�����30%�Ĺ�����á�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2�����ڲ�����Ʒ���ڶ�������Ʒ���磺��ɫ�齺�ᡢ����������Ʒ�����³�����ԡ���������¹񡢹��š������ţ�������ǩ��ʩ����ͬ�������Ʒ�����ܽ����޳���������ٻ��������������¡�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3����������ǩ��ʩ����ͬ����ز����Ѿ����������Զ����˻��Ĳ�Ʒ��δ��İ�װ�����ռ����������֧������˾�˻���Ʒ���30%�Ĺ�����ã���ñʷ��õ��ڸ���˾��ɵ�ʵ����ʧ�������貹����֣�������£�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ڲ�����װ�Ĳ�Ʒ����˾�����˻���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���Ʒ����һ���Ķ������ڣ���������Ʒ�����ʩ�����ڽ����ղ�Ʒ�ĵ�����˳�ӣ�����Ϊ�����ڵ������ж���</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��4����ʩ���������������պͿ������ջ��ڣ��������Ե������գ���˾���Ե绰������ԤԼ����ʽ��ǰ֪ͨ������ʱ�䣬������ϣ������������Ե������գ���˾���������ղ���Ϊ�����պϸ�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��5������Ҫ�ṩһ���̶��ĳ��õ绰���뼰��ס����ϵ��ַ�������µ�ַʱ����ǰ����֪ͨ�ҹ�˾�����������ṩ�µ�ַ������£��ҹ�˾���н������˻�ֶ�������ϵ��������������Ҫ�е�������μ������ʧ��������¡�</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��6�������ķֶο���δ����ͬԼ��֧�����ֳ����ᱻ��ͣ������˾���ڿ��3-5���ڻָ�ʩ����������Ӧ˳�ӡ�ͬʱ��˾������׷����������ε�Ȩ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;�塢�ۺ����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��1�����̿������ҹ�˾Ϊ�ͻ��ṩ���̳������ࡣ��סǰ��������רҵ���๫˾����ȱ��࣬���ܴﵽ��ס��׼��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��2��Ϊ�˱������ĺϷ�Ȩ�棬�����ڹ��̿������ս׶��ϸ���ʩ���淶�������գ�ȫ�����̺ϸ�󷽿�ǩ�����ա����ڿ������յ���ǩ�ֺ���˾����Ϊ�����պϸ��������պ�ͬ�涨������㣬֧�����¹��̿��ȡ��Ʊ��װ�޽׶���ɡ���ʱ������������˾�ṩ���ۺ����׶Σ�����ò����ڵ��ۺ�������պ���ֵ��������⣬�ۺ�ά��ʱ������ʾ���㷢Ʊ������ƾ֤��������˾������ά�ޣ������ʧ�����е����ۺ��޵绰��0411-84547733��</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��3���������ڿ������պ���п���������⣨��Ƹ�����CMA��֤�Ŀ���������ⵥλ������׼������м�⣩��������������������֧�����粻���Ͽ����������ձ�׼�����ý����ҹ�˾�е����������ġ������ڽ��п����������ʱ���Ѱ������Թ��ļҾ߻�����ʩ����Ŀ�������ṩ�Ľ��ģ���˾�����Լ�����е��κ����Σ������½⡣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;������������</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���п���������ͨ���������л��������л����д��ǻ��򵽹�˾����ֱ�Ӹ������ַ�ʽ֧����</td>
   </tr>   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;������ϸ�Ķ�����֪�������������������顣</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�а�����</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;_____________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
�����ڴ�װ�ι��̣����������޹�˾</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;���ڣ�______________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ڣ�____________ </td>
   </tr>
   </table>
</body>
</html>
