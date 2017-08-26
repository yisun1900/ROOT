<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE4 {font-size: 18px; font-weight: bold; }
.STYLE6 {font-size: 14px}
.STYLE7 {font-size: 22px}
.STYLE8 {font-size: 22px; font-weight: bold; }
</style>

</head>


<%
//�����İ�������ʾ����
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String dwmc=null;
String hth=null;
String khjl=null;
String clgw=null;
String khxm=null;
String qyrq=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jpmzjdjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	
	ls_sql="SELECT dwmc,hth,khjl,clgw,khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,crm_zxkhxx.ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��')ysshbz";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		hth=cf.fillHtml(rs.getString("hth"));
		khjl=cf.fillHtml(rs.getString("khjl"));
		clgw=cf.fillHtml(rs.getString("clgw"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
	}
	rs.close();
	ps.close();
	
	//��ѯǩԼ����
	ls_sql="SELECT qyrq from crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


%>


<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="94%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center" class="STYLE8">�����ڴ����װ��Ʒ��������Ʒѡ����ͬ</p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" class="STYLE3" >�˿�������<u><%=khxm%></u>(���¼�ơ��׷���)</td>
    </tr>
	 <tr bgcolor="#FFFFFF">
      <td width="43%" class="STYLE3" >�ͻ���ַ��<u><%=fwdz%></u></td>
      <td class="STYLE3" >��ϵ�绰��<u><%=lxfs%></u></td>
      </tr>
	 <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
	 <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="left" class="STYLE2" ><p align="left" class="STYLE3">�ҷ��������ڴ�װ�ι��̣����������޹�˾�����¼�� ���ҷ�����</p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="left" class="STYLE2" ><p align="left" class="STYLE3">��ַ��ʮ����Ŷ���Ӫ��ּҾӴ�������ڴ��װ6s�� </p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td height="22" colspan="2" align="center" class="STYLE2" ><div align="left">
      <p><span class="STYLE6"><strong>��һ����</strong>�ҷ�����Ϊ�׷��ṩ������񡢽�ʡ�׷�ʱ�䡢��׷��ල����顢���Ʋ�Ʒ�������ۺ�����ԭ��Ϊ�׷��ṩ����װ��Ʒ��������Ŀ����Ҫ���ݰ�����<br> 
	  1������ʩ������2�������ƻ�����3�������ƻ�����4��ɫ�ʼƻ�����5����ů�ƻ���<br>
	  ���� ��1�� ����ʩ�������ݼ�װһ��ǩ��ʩ����ͬ��2-5���Ա���ͬΪ�������ݡ�����ǩԼ��ѡ������̡�</span></p>
      
    </div></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left">&nbsp;</p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left"><span class="STYLE6"><strong>�ڶ�����Ʒ��������Ʒ����</strong><br>
1����Ʒ�۸�<br>
&nbsp;&nbsp;&nbsp;&nbsp;����ͬ��Ʒ���ݼ���۸����������װ��Ʒ��������Ʒ������ϸ��������һ�����ڱ���ͬǩ��֮�գ��׷�Ӧ���ҷ�����������ѡ��Ʒ���ܼۿ
<br>2���ͻ�/��װԼ��<br><strong>&nbsp;&nbsp;&nbsp;&nbsp;����ͬ�ڸ����Ʒ�ͻ�����Ϊ:</strong><br>&nbsp;&nbsp;a����ů�ƻ���ƷǩԼ��������Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ���װ����Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ�<br>&nbsp;&nbsp;b�������ƻ���ƷǩԼ��������Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ���װ����Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ�<br>&nbsp;&nbsp;c��ɫ�ʼƻ���ƷǩԼ��������Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ���װ����Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ�<br>&nbsp;&nbsp;d�������ƻ���ƷǩԼ��������Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�գ���װ����Ϊ<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>�ա�<br>&nbsp;&nbsp;&nbsp;Ʒ��������Ʒ�ͻ���װ���ڲ������ݼ�װ��ͬ���ڣ�����׷������ֳ�����ԭ�򣬲��߱��ͻ���װ������׷��޷��ӻ���ԭ���±���ͬ��Ʒ��װ�����ҷ����е�����ͬ�������Ρ�<br>3���������<br>&nbsp;&nbsp;a������ͻ��ص���6������������ͻ���6�������ɼ׷����ге�Զ�̷��ã�<strong>Զ�̷�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>Ԫ</strong><br>&nbsp;&nbsp;b�����ڼ׷��Լ�ԭ����ɵ�������ã��ɼ׷��е���<br>4����Ʒ������׼�����ϸò�Ʒ�Ĺ��ҹ涨��׼��<br>5����Ʒ����<br>&nbsp;&nbsp;&nbsp;&nbsp;�׷�ͬ�����ҷ�����Ʒ�ʹ��װ�����˫��Լ���ص㵱���ڣ��׷�Ӧ���ձ���ͬԼ���Ĳ�Ʒ������׼�������պ�ǩ��ȷ�ϡ�����׷������ֳ����׷�Ӧָ����ί���˴�Ϊ���ղ�ǩ��ȷ�ϣ�����ҷ����ձ���ͬ�׷�������ַ�����ͻ���װ֮���������ڣ��׷�δǩ�����յģ����������޽��������Ʒ��Ϊ�׷������պϸ�<br><strong>������������װ��Ʒ�����������Ʒ˵��</strong></span></p>     </td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><table width="638" height="143" border="1" align="left">
      <tr>
        <td width="121" height="17"><div align="center"><strong>��Ŀ</strong></div></td>
        <td width="501"><div align="center"><strong>ע������</strong></div></td>
      </tr>
      <tr>
        <td height="31"><div align="center"><font size="2"><strong>�����ƻ�
(��������
+ˮ����)
</strong></font></div></td>
        <td><font size="1">1.ÿ�������������������װ�ü�ˮ����װ��Ϊ��һ�ף��������ӣ�������ƣ�<br>2.	�·�ϵͳ����������90ƽ�����»��ͣ����������·�ڡ������ڲ��ܡ����������������װ��<br>3.	�·�ϵͳ��Ҫ�������ֳ���������׷��������·�ڣ��谴�г��ۼ۲������.</font></td>
      </tr>
      <tr>
        <td height="85"><font size="2"><strong>��ů�ƻ�
()     (ɢ����)
</strong></font></td>
        <td><font size="1">1.	���ײͰ����ͼ�����Ƽۣ�����ɢ������׼������ϣ�������������ɸ���ʵ���������ɢ�������������Ӳ��ַ�����ơ�<br>2.	�ײͼ۸�������ã�ɢ�������������Ĺܡ���װ�˹��ѣ�������Ϸѣ�2���������ܹ��򷧡�2���������ܹܹܼ���2���������ܹܣ�
<br>
&nbsp;&nbsp;&nbsp;��ע���簲װ���ó������䲿�ְ��շѱ�׼ʵ��ʵ�ա�<br>
3.	�ײͽ���ԭ�ظ�ů��������Ųλ�ã��Ĺܷ������<br>4.	�ײ��нӿڷ�ʽ���������׽��׳����ӿڴ�ֱ���棩���������Ͻ��³����½��³����ӿ�ƽ�е��棩��<br>5.	ɢ�������ò���������/�鷿��120-140W/�O������/����/������/����:80-100W/�O������ڱ���ɢ��������Ļ����ϣ����ݾ������������Ʒ�߶ȣ�300mm-1800mm)�����ײͰ�����������Ʒ��
</font></td>
      </tr>


    </table>    
    <p align="left"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><br><br><br><br>
	<table width="638" height="143" border="1" align="left">
      <tr>
        <td width="121"><strong>ɫ�ʼƻ�
(����)
        </strong></td>
        <td width="501"><font size="1">1.	��ͬ���ͱ��䴰��������ͬ�����磺2���ұ���Ϊ��1����������+2�����Ҵ������������������涨��Χ�ĳߴ硣<br>
          2.	�ײͼ۸񺬣���������1.9�ס���ͷһ�ԡ�����һ�ԡ����׻������ײ���������Ǧ�߷��ã�ͬʱ�����ֳ�������2�ΰ�װ��<br>
3.	�ײ��к��������������޶�������г�����������ơ�<br>
4.	������Ʒ����ָ����Ʒ���ͺŷ�Χ����ѡ��<br>
5.	���ϱ��ۿ�ʹ��ŷ������ȯ��ÿ��ÿ�ݺ�ͬ����ʹ��1�š� </font></td>
      </tr>
      <tr>
        <td><strong>�����ƻ�
    (����)
        </strong></td>
        <td><font size="1">1.	�ִܸ�����AD58ϵ�У�����������63ϵ�У�<br>
2.	�������䣺5mm+9A+5mm��5mm+12A+5mm��ͨ�пգ�<br>
3.	�������Ϊ���¹�ŵ�У�<br>
4.	�����ƻ����˿�������������Ƽۣ����г���������������ۼ۲���ۡ�<br>
&nbsp;&nbsp;�ײͱ��䣺һ���ң�0+1��1+1��: 2�O��������3�O�̶���,<br>
&nbsp;&nbsp;&nbsp;�����ң�2+1��2+2��: 5�O��������7�O�̶���,<br>&nbsp;&nbsp;&nbsp;�����ң�3+1��3+2��: 7�O��������13�O�̶���,<br> &nbsp;&nbsp;&nbsp;�ľ��ң�4+1��4+2��: 12�O��������18�O�̶���<br>5.	�����ƻ��۸��а������涨����ڵĴ������������ֺ�ɴ���������ֻ�����������װ������ɴ���<br>6.	���ϲ������ڣ�90��ת�ǡ����ɽǡ���ǿƴ�ӡ��Ǳ��䲣�����Ŵ���Ϳ����Ĥ�ȣ�<br>7.	����������1ƽ�װ���1ƽ�׼Ƽۣ��̶�������0.5ƽ�װ���0.5ƽ�ס�����0.5ƽ�ײ���1ƽ�װ� ��1ƽ�׼Ƽۣ�<br>8.	��ȼ��߶ȳ���1.8�ף������п������������Ҫ��ǿƴ�ӣ�<br>9.	�˾����ƻ������������������������ܸ��Ż�������ţ�<br>10.	������������Ŀ���細����ת�ǣ��������ǿƴ�ӵ������������Ʒ�.</font></td>
      </tr>
    </table>    
    <p align="left"></p>
    <p align="left"></p>
    <p align="left"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left" class="STYLE6"><strong>��������Ȩ��������</strong><br>1���׷���Ȩ��<br>
&nbsp;&nbsp;��1���׷���ȨҪ���ҷ����ձ���ͬԼ���Ĳ��ϻ�������в�Ʒ���������á�<br>&nbsp;&nbsp;��2���׷���Ȩ���б���ͬԼ���ġ��ɹ������ṩ�ı��޷���<br>2��	�׷�������<br>��1��	 �׷���������ǩ������ͬʱһ����֧����Ʒȫ�����<br>
��2�� �ҷ����ݼ׷������ר�Ž��в������ƵĲ�Ʒ���ڱ���ͬǩ��������׷�����ԭ�����ҷ�����Ըò�Ʒ��ƽ����޸ĵġ��׷�Ӧ�ڱ���ͬǩ��֮������������ҷ����������ȷ�޸�Ҫ�󣻷��򣬼׷�Ӧ���ге����ڲ�Ʒ�ѽ����������̶������ҷ��޷��޸Ĳ�Ʒ��������ȫ�����ü�����ʧ��<br>��3��	�����ʩ���ֳ������޷���װ������ͬ��Ʒ�İ�װ�����Զ�˳�ӣ��ҷ��Դ˲��е��κ����Ρ�<br>
��4��	�繩������׷��԰�װ�����ȷ���������磬�ڹ�����˵������󣬼׷��Լ�ּ����ģ������̿��԰��ռ׷����������ƺ����á����׷����ڹ����̳��ߵ�����˵����ǩ��ȷ�ϣ����е�������Ρ�<br>3�� �ҷ���Ȩ��<br>&nbsp;&nbsp;�ҷ�����׷�ǩ������ͬ���ҷ���ȨҪ��׷����ձ���ͬԼ��Ԥ��֧��ȫ���ۿ���ٽ����Ʒ��������<br>4���ҷ�������<br>&nbsp;&nbsp;1���ҷ�������ͬ����1��Լ���Ĳ�Ʒ��ϸ�����ͻ�����֤��׷��ṩ�ϸ�Ĳ�Ʒ��<br>
&nbsp;&nbsp;�����ɿ�����׷�����ԭ���⣬�ҷ�Ӧ���ձ���ͬԼ����ʱ�佻����ÿ�ӳٽ���һ���ҷ�����׷��⸶��������<strong>3�루ǧ��֮������������޲��ɳ�����������30%��</strong>���ڼ׷������ӳٻ�����������ɵ����ڲ��ٴ˷�Χ�ڡ�<br><strong>���������˻�������������</strong><br>1��	�˻��ͻ���<br>��1���׷������Ʒ<br>&nbsp;&nbsp;�׷�Ӧ���ڹ�Ӧ�̴���ֳ�����������ղ�Ʒ���ֳ������У��緢�ֲ�Ʒ���������⣬�׷���Ȩ�ܾ��ջ���Ҫ����ѵ�����<br>��2��	�ɹ�Ӧ���ͻ���Ʒ<br>&nbsp;&nbsp;a���Ǽ׷����ƵĲ�Ʒ����Ʒ�Ѱ�װ���������ϲ�õȷ��������⣬�����˻�����<br>&nbsp;&nbsp;b���׷����Ʋ�Ʒ����Ʒ���µ������������˻�����<br>2������<br>&nbsp;&nbsp;�׷��ڱ���ͬǩ��������Ҫ������Ʒ�������Ʒ���ͻ������Բ�����Ʒ�嵥��ʾ�ͻ�����Ϊ׼���ҷ����ݹ������ڼ�ʱ֪ͨ�����̰�ʱ������<br><strong>���������ۺ����</strong><br>1.	�ͻ���װ�ɹ����̸���<br>2.	�����̷��񲻵�λ�򱾺�ͬ��Ʒ������Ȩ��������������������ģ��ҷ�������Э�������̼�ʱ���д���<br>3.	���޼�ά���ɹ����̸��𣬱��������Թ����̹涨������Ϊ׼��<br><strong>������������ƾ֤</strong><br>����ͬ�����Ʒ��������:<br>&nbsp;&nbsp;a����ů�ƻ���ɢ����<strong>2��</strong>���ޣ�����ά����������ϵ�绰��010-84871218<br>&nbsp;&nbsp;b�������ƻ����ִܸ���������������<strong>1��</strong>��������ϵ�绰��010-88873058<br>&nbsp;&nbsp;c��ɫ�ʼƻ���<strong>1��</strong>�ڴ����˳��ֵ��ᡢ�̶����ɶ����������⣨��Ϊ�𻵳��⣩�����ޡ�������ϵ�绰��15210365935
<br>&nbsp;&nbsp;d�������ƻ�����ˮװ��<strong>2��</strong>���ޣ��·�װ��<strong>1��</strong>���ޣ�����ά����������ϵ�绰��010-57228286 <br><strong>�ڰ�����������</strong><br>
&nbsp;&nbsp;�����б���ͬ���뱾��ͬ�й����ˣ�˫��Ӧ�Ѻ�Э�̽������Э�̲��ɣ��׷���Ȩ�������ڴ����ڵ�����Ժ�������ϻ��ٲû��������ٲ�.�����ڴｫ���ݷ�Ժ�о�������ٲû������ٲ������׷������⸶��<br><strong>�ھ��� ��ͬ�ı�</strong><br>&nbsp;&nbsp;����ͬһʽ���ݣ��׷����ҷ�˫������һ�ݣ���˫��ǩ�ָ���֮������Ч��<br><strong>��ʮ�� ����</strong><br>&nbsp;&nbsp;����ͬ�������и�����Ϊ����ͬ���ɷָ����ɲ��֣��뱾��ͬ���е�ͬ����Ч����<br>&nbsp;&nbsp;����һ��������װ��Ʒ��������Ʒ������ϸ��<br><strong>��ʮһ�� ����</strong><br>&nbsp;&nbsp;����ͬδ���ס���˫������һ��ͬ�⣬�κ�һ�����ñ�����޸Ļ���������ͬδ�����ˣ��ס���˫��������ǩ�����油��Э�飬����Э���뱾��ͬ����ͬ�ȷ���Ч����<br>�������Э���뱾Э�����ݲ�һ�µģ��Բ���Э����Ӧ����Ϊ׼��</p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="left"><font size="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;�׷�:</strong></font><br>
      &nbsp;&nbsp;&nbsp; <font size="2"><strong>��Ȩ����ǩ�֣�</strong></font></p></td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong> �ҷ��������ڴ�װ�ι��̣����������޹�˾:</strong></font></div>      <div align="left"></div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="center"><font size="4"><strong></strong></font></p>      </td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong>����Ա��ǩ�֣�</strong></font>:</div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="center"><font size="2"><strong></strong></font></p></td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong>���澭��ǩ�֣�</strong></font>:</div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="left"><font size="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;���ڣ�</strong></font></p></td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong>���ڣ�</strong></font></div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p><BR>
      </p></td>
  </tr>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left"><font size="2"><strong>����һ��</strong></font></p></td>
    </tr>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center" class="STYLE4"><font size="2"><span class="STYLE7"><strong>����װ��Ʒ������������ϸ</strong><font></span></p>
    </td>
  </tr>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
    </tr>
<center>
  <table width="849" border="0" align="left">
    <tr>
      <td width="257" class="STYLE3">�˿�������<u><%=khxm%></u></td>
      <td width="321" class="STYLE3">��ϵ�绰��<u><%=lxfs%></u></td>
      <td width="445" class="STYLE3">��װ��ͬ���:<u><%=hth%></u></td>
    </tr>
    <tr>
      <td colspan="2" class="STYLE3"><u>װ�޵�ַ��<%=fwdz%></u></td>
      <td class="STYLE3">ǩԼ���棺<u><%=dwmc%></u></td>
    </tr>
    <tr>
      <td class="STYLE3">���ʦ��<u><%=sjs%></u></td>
      <td class="STYLE3">���Ϲ��ʣ�<u><%=clgw%></u></td>
      <td class="STYLE3">�ͻ�����<u><%=khjl%></u></td>
    </tr>
  </table>
</center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table border="1" width="86%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="12%" >�ƻ�����</td>
    <td  width="8%" >�۸�</td>
    <td  width="18%" >��Ʒ����</td>
    <td  width="15%" >Ʒ��</td>
    <td  width="20%" >�ͺ�</td>
	<td  width="15%" >���</td>
    <td  width="6%" >��λ</td>
    <td  width="6%" >����</td>
  </tr>

	
<%
	int i=0;

	String tcmc=null;
	double tcjg=0;
	double bzmj=0;
	double pmzjdj=0;
	double sjmj=0;
	String mjsfkzj=null;

	double alltcjg=0;
	ls_sql="SELECT distinct tcmc,tcjg,bzmj,pmzjdj,sjmj,mjsfkzj";
	ls_sql+=" FROM bj_khwntcmch ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by tcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		tcjg=rs.getDouble("tcjg");
		bzmj=rs.getDouble("bzmj");
		pmzjdj=rs.getDouble("pmzjdj");
		sjmj=rs.getDouble("sjmj");
		mjsfkzj=rs.getString("mjsfkzj");

		if (sjmj>bzmj)
		{
			tcjg+=(sjmj-bzmj)*pmzjdj;
			tcjg=cf.round(tcjg,2);
		}

		alltcjg+=tcjg;

		double tcmxjg=0;
		ls_sql="SELECT distinct sum(round(tcdj*sl,2))";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcmxjg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (tcmxjg!=tcjg)
		{
			out.println("<span class='STYLE3'>�����ײ�["+tcmc+"]�ܼ�["+tcjg+"]����ϸ["+tcmxjg+"]��һ��</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT distinct count(*)";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcjg%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT distinct cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


	String tcbm=null;
	double yj=0;
	double tcj=0;
	String bz=null;
	ls_sql="SELECT distinct tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmch ";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and lx='2' ";//1���Ҿ��ײͣ�2�������ƻ�
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		alltcjg+=tcj;

		double tcmxjg=0;
		ls_sql="SELECT distinct sum(round(tcdj*sl,2))";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcmxjg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (tcmxjg!=tcj)
		{
			out.println("<span class=\"STYLE3\">���󣡽����ƻ��ײ�["+tcbm+"]�ܼ�["+tcj+"]����ϸ["+tcmxjg+"]��һ��</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT distinct count(*)";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT distinct cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();


	ls_sql="SELECT distinct tcmc,tcjg";
	ls_sql+=" FROM bj_khcltcmch ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by tcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		tcjg=rs.getDouble("tcjg");

		alltcjg+=tcjg;

		double zsl=0;
		ls_sql="SELECT distinct sum(bzsl)";
		ls_sql+=" FROM bj_khcltcfjslh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		double mxsl=0;
		ls_sql="SELECT distinct sum(sl)";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			mxsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (mxsl!=zsl)
		{
			out.println("<span class=\"STYLE3\">����ɫ�ʼƻ��ײ�["+tcmc+"]������["+zsl+"]����ϸ����["+mxsl+"]��һ��</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT distinct count(*)";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcjg%></td>
				<td colspan="6" align="left"><B>δѡ������</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT distinct cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcjg%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>δѡ������</B></td>
				  </tr>
				<%
			}
			else{
				//���ÿ������
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>С ��</B></td>
	<td><B><%=alltcjg%></B></td>
	<td><B>�� д</B></td>
	<td colspan="5"><b><font size="2"><%=cf.NumToRMBStr(alltcjg)%>;<font></b></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td width="100%" ><span class="STYLE6">˵���� </span><br>
    <span class="STYLE6">1.�������Ʒ�辭�׷���ͼֽ������ǩ��ȷ�Ϻ󷽿���Ч��<br>2.������ϸ��ʾ�����ͺż������������Ʒ��ϸ����׷�ǩ��ȷ�ϵ�ͼֽ��������<br>3.�׷�Ӧ������ͬ������ҷ�����ȫ�����������ҷ����Ź����̽����������ͻ�����</span>    </tr>
</table>

</td></tr>
</TBODY>

</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






