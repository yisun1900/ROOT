<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");

String jc_zcdd_htshsj="";
String jc_zcdd_jkxz="";
String jc_zcdd_jkdd="";
String jc_zcdd_hkze="";
String jc_zcdd_bz="";
String qhtsj="";
String htshsj="";

String khxm="";
String lxfs="";
String fwdz="";
String sjs=null;
String sgd="";
String sgbz="";
String khbh=null;
String dwmc=null;
String bzdh="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select qhtsj,htshsj,khbh,htshsj,DECODE(jkxz,'1','δ����','2','ȫ��','3','�����������','4','Ԥ�������','5','�˻������') as jkxz,";
	ls_sql+="DECODE(jkdd,'1','�������ֳ������','2','�����տ�','3','��˾�����տ�') as jkdd,hkze,bz";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		jc_zcdd_htshsj=cf.fillNull(rs.getDate("htshsj"));
		jc_zcdd_jkxz=cf.fillNull(rs.getString("jkxz"));
		jc_zcdd_jkdd=cf.fillNull(rs.getString("jkdd"));
		jc_zcdd_hkze=cf.fillNull(rs.getString("hkze"));
		jc_zcdd_bz=cf.fillNull(rs.getString("bz"));   
		khbh=cf.fillNull(rs.getString("khbh"));   
		
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,lxfs,fwdz,sjs,sgd,sgbz,dwmc,lxfs";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.khbh='"+khbh+"' ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		  
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	   
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally   // ��ͬ���ȥ����  cf.NumToRMBStr(cf.doubleTrim(jc_zcdd_hkze,0))   ����  jc_zcdd_hkze��  
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		 if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
</head>

<body leftmargin="0" rightmargin="0" topmargin="0" >
<table width="99%" height="38" border="0">
  <tr> 
    <td><div align="center"><font size="5"><strong>�� �� �� Ȼ ֮ �� װ �� �� �� �� ˾
    �ۺϻ����Ʒ���������ͬ</strong></font></div></td>
  </tr>
</table>

<table width="99%" border="0" align="left">
  <tr> 
    <td width="46%"><font size="2">�׷���<u>&nbsp;<%=khxm%>&nbsp;</u> ��ϵ�绰��<u>&nbsp;<%=lxfs%>&nbsp;</u></font></td>
    <td width="54%"><font size="2">��װ��ַ��<u><%=fwdz%></u></font></td>
  </tr>
  <tr> 
  <td width="46%"><font size="2"> �ҷ���<u>�����ڴ�װ�ι��̣����������޹�˾</u></font></td>
    
   <%-- <td width="450"><font size="2">�ֳ��鳤/�绰��<u><%=sgbz%><%=bzdh%></u> </font></td>--%>
   <td width="54%"><font size="2"><u>��ַ�������з�̨����������·��27�������ڴ�</u> </font></td>
  </tr>
  
  <tr> 
    <td colspan="2" align="left"><font size="2">�ҷ�����Ϊ�׷��ṩ������񡢽�ʡ�׷�ʱ�䡢��׷��ල����顢���Ʋ�Ʒ�������ۺ�����ԭ�򣬾��ҷ�Ϊ�׷������ۺϻ����Ʒ���ˣ�˫���������Э�飺 </td>
  </tr>
  <tr valign="top"> 
    <td height="411" colspan="2"> <p><font size="2"><strong>��һ��������:</strong></font><font size="2"><br>
&nbsp;&nbsp;&nbsp;&nbsp;���Ǳ���ͬ������ָ�����¶�������ڶԱ���ͬ��ʹ�����ʵĽ��͡�<br>
&nbsp;&nbsp;&nbsp;&nbsp;1��	�׷���ֱָ�ӿͻ���<br>
&nbsp;&nbsp;&nbsp;&nbsp;2��	�ҷ��������ڴ�װ�ι��̣����������޹�˾��<br>
&nbsp;&nbsp;&nbsp;&nbsp;3��	��ͬ˫����ָǩ������ͬ�׷����ҷ���<br>
&nbsp;&nbsp;&nbsp;&nbsp;4��	�����̣�ָ��Ʒ�����ϵ�������ҵ������Ȩ������ҵ��<br>
        <strong>�ڶ������ҷ����������Ʒ�Ĺ���</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1����Ʒ�۸�<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ͬ��Ʒ���ݼ���۸�����������ڴ����Ĳ�Ʒ������ϸ����Ϊ����һ�����ڱ���ͬǩ��֮�գ��׷�Ӧ���ҷ���������ȫ����Ʒ���ܼۿ<br> &nbsp;&nbsp;&nbsp;&nbsp;2��	�����ص㣺�ס���˫��ͬ���Ʒ�Ľ�����<u><%=fwdz%></u><br>
&nbsp;&nbsp;&nbsp;&nbsp;3��	�ͻ����ڣ�<u>&nbsp;&nbsp;&nbsp;<%=htshsj%>&nbsp;&nbsp;&nbsp;</u><br>
&nbsp;&nbsp;&nbsp;&nbsp;4��	��װ����Ϊ:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<strong>��ע��</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1.	1.	���˫����ǩ������ͬͬʱ��֮�󣬼׷��빤�̹�˾ǩ���ˡ������м�ͥ����װ��װ�޹���ʩ����ͬ�������¼�ơ���װ��ͬ�������򱾺�ͬ�в�Ʒ�������ͻ����ڸ��ݡ���װ��ͬ����ʩ�����ȱ��������������װ��ͬ���������±���ͬ�ͻ���װ�������ڵģ��ҷ��Դ˲��е�����ͬ���µĳ������Σ��򱾺�ͬ����һ�������ͻ���װʱ����Ч��<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.	2.	����׷��빤�̹�˾ǩ���ˡ���װ��ͬ�����ڼ�װ���̿�����˫����ǩ���˱���ͬ���򱾺�ͬ��Ʒ�����ͻ���װ���ڽ��Ը����Ʒ���ͻ����ں���������Ϊ������ȷ��ʵ���ͻ���װ���ڣ������װ���̽���ͬ����ɡ���װ����ʩ�����ȱ����涨�ı���ͬ��Ʒ���볡������Ϊ��Ч������Ϊ����ͬ��Ʒ���ͻ����ڡ��ɴ�����ɼ�װ��������Ʒ�������ڵģ��׷�����׷���ҷ����������Ρ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.	�������<br>
&nbsp;&nbsp;&nbsp;&nbsp;A)	����׷�������Ʒ���С�������5000Ԫ����׷���е��ɴ˲�����������á����˫��Լ���Ľ����ص��ڱ���������Ͻ�����ڣ��׷�ÿ��Ӧ��ǰ֧�����ҷ��˷�����ҷ���Ԫ������200.00�������˫��Լ���Ľ����ص��ڱ���������Ͻ�����⣬�׷�Ӧ���ге��ҷ�Ϊ������Ĳ�Ʒ����ʵ������Ѽ�������ط��á�<br>
&nbsp;&nbsp;&nbsp;&nbsp;B)	���ڼ׷��Լ�ԭ����ɵ�������ã��ɼ׷��е���<br>
&nbsp;&nbsp;&nbsp;&nbsp;4. ��Ʒ������׼���ס���˫��ͬ�Ȿ��ͬ��Ʒ����Ӧ���ϸò�Ʒ�Ĺ��ҹ涨��׼��<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.��Ʒ����<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�׷�ͬ�����ҷ�����Ʒ�ʹﵽ��װ�����˫��Լ���ص㵱���ڣ��׷�Ӧ���ձ���ͬԼ���Ĳ�Ʒ������׼�������պ�ǩ��ȷ�ϡ�����׷������ֳ����׷�Ӧָ����ί���˴�Ϊ���ղ�ǩ��ȷ�ϣ���Ӧ��ǰ����ί�����˴�Ϊ���յ���������������Ȩί�����ṩ�ҷ���������ҷ����ձ���ͬ�׷�������ַ��׷�������������֪֮ͨ���������ڣ��׷�δ���յģ����������޽��������Ʒ��Ϊ�׷��������Ҳ�Ʒ�ϸ�<br>



        <strong>��������Ȩ��������</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1��	�׷���Ȩ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)	�׷���ȨҪ���ҷ����ձ���ͬԼ���Ĳ��ϻ���������в�Ʒ���������á�<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)	�׷���Ȩ���ձ���ͬ�ڶ������Ŀ�Լ���Ĳ�Ʒ������׼���ҷ���������������飬��Ҫ���Ʒ���ϵڶ������Ŀ�ı�׼��<br>
&nbsp;&nbsp;&nbsp;&nbsp;2��	�׷�������<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)	�ҷ����ݼ׷������ר�Ž��в������ƵĲ�Ʒ���ڱ���ͬǩ��������׷�����ԭ�����ҷ�����Ըò�Ʒ��ƽ����޸ĵģ��׷�Ӧ�ڱ���ͬǩ��֮������������ҷ����������ȷ�޸�Ҫ�󣻷��򣬼׷�Ӧ���ге����ڲ�Ʒ�ѽ����������̶������ҷ��޷��޸Ĳ�Ʒ��������ȫ�����ü�����ʧ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)	�׷���������ǩ������ͬʱһ����֧����Ʒȫ���ۿ<br>
&nbsp;&nbsp;&nbsp;&nbsp;3)	�׷���Ȩ���б���ͬ������Լ���ġ��ɹ������ṩ�ı��޷���<br>
&nbsp;&nbsp;&nbsp;&nbsp;4)	����׷��Ļ���װ�޲����ϰ�װ����ͬ��Ʒ��Ҫ�󣬼׷�Ӧ�޸������װ�ޣ�ֱ����ﵽ��װ����ͬ��Ʒ��Ҫ�󣬱���ͬ��Ʒ�İ�װ�����Զ�˳�ӣ��ҷ��Դ˲��е��κ����Ρ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;5)	��׷�����װ��δ��ʱ�깤�򲻷��ϰ�װ��Ҫ�󣬵����ҷ��޷���ʱ��װ����ͬ��Ʒ���̶���ɰ�װ���ڣ��ɴ˷����Ĳ�Ʒ���ġ���װ�������������������ʧ�ɼ׷����ге���<br>
&nbsp;&nbsp;&nbsp;&nbsp;6)	�繩������׷��԰�װ�����ȷ���������磬�ڹ�����˵������󣬼׷��Լ�ּ����ģ������̿��԰��ռ׷����������ƺ����ã���ǰ�������Ǽ׷�Ҫ�ڹ����̳��ߵ�����˵����ǩ��ȷ�ϣ����Ҽ׷��������ŵ�е��ɴ˲�����һ�����Ρ�<br>
&nbsp;&nbsp;&nbsp;&nbsp;3��	�ҷ���Ȩ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;�ҷ�����׷�ǩ������ͬ���ҷ���ȨҪ��׷����ձ���ͬ��������Լ��Ԥ��֧��ȫ���ۿ���ٽ����Ʒ��������<br>
&nbsp;&nbsp;&nbsp;&nbsp;4��	�ҷ�������<br>
&nbsp;&nbsp;&nbsp;&nbsp;1���ҷ�ִ�б���ͬ�ڶ������Ŀ�Լ���Ĳ�Ʒ������׼����֤��׷��ṩ�ϸ�Ĳ�Ʒ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;2�������ɿ�����׷�����ԭ���⣬�ҷ�Ӧ���ձ���ͬԼ����ʱ�佻����ÿ�ӳٽ���һ���ҷ�����׷��⸶��������3�루ǧ��֮������������޲��ɳ�����������30%��<br>

		
        <strong>���������˻�������������</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1���˻��ͻ���<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)�׷������Ʒ<br>
&nbsp;&nbsp;&nbsp;&nbsp;�׷�Ӧ���ڹ�Ӧ�̴���ֳ�����������ղ�Ʒ���ֳ������У��緢�ֲ�Ʒ�в����ϱ���ͬ��Ʒ������׼��������׷���Ȩ�ܾ��ջ���Ҫ����ѵ�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)�ɹ�Ӧ���ͻ���Ʒ<br>
&nbsp;&nbsp;&nbsp;&nbsp;A)	�Ǽ׷����ƵĲ�Ʒ�����л������׷�Ӧ�Ը���֮��������������Ҫ��������ҷ���Ϊ�׷�Э����������Դ�������е�������Ʒ�����׷�Ӧ�����ۣ��������յģ��׷�Ӧ���ҷ�֧���ò�Ʒ�ܽ��30%��ΥԼ�������˻����׷�Ӧ���ҷ�֧���˻���Ʒ�ܽ��30%��ΥԼ��<br>
&nbsp;&nbsp;&nbsp;&nbsp;B)�׷����Ʋ�Ʒ�������˻�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;2������<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�׷��ڱ���ͬǩ��������Ҫ������Ʒ��˫��������ǩ�����ۺϻ����Ʒ���������ͬ���������Ʒ���ͻ������Բ�����Ʒ�嵥��ʾ�ͻ�����Ϊ׼���ҷ����ݹ������ڼ�ʱ֪ͨ�����̰�ʱ������<br>
        <strong>���������ۺ����</strong> <BR>
&nbsp;&nbsp;&nbsp;&nbsp;1.�ͻ���װ�ɹ����̸���<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.�����̷��񲻵�λ�򱾺�ͬ��Ʒ������Ȩ��������������������ģ��ҷ�������Э�������̼�ʱ���д���<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.���޼�ά���ɹ����̸��𣬱��������Թ����̹涨������Ϊ׼��<br>
        <strong>������������ƾ֤ </strong> <BR>
&nbsp;&nbsp;&nbsp;&nbsp;����ͬ���²�Ʒ���ɹ�����ֱ�ӿ��߷�Ʊ���׷����׷����ҷ���Ʒ��Ӧ�̿��ݵĲ�Ʒ����ƾ֤��Ϊ����Ʒ����֮����<br>
        <strong>��������������</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;�����б���ͬ���뱾��ͬ�й����ˣ�˫��Ӧ�Ѻ�Э�̽������Э�̲��ɣ��κ�һ������Ȩ�������ύ�й����ʾ���ó���ٲ�ίԱ������ٲã��ٲõص㣺�������ٲòþ�Ϊ�վ��ԣ���˫������Լ���������߷�Ӧ�е�ʤ�߷���˷�����һ�з��ã��������������ٲ÷Ѻ���ʦ�ѡ�<br>
		<strong>�ڰ��� ��ͬ�ı�</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;����ͬһʽ���ݣ��׷����ҷ�˫������һ�ݣ���˫��ǩ��֮������Ч��<br>
		<strong>�ھ��� ����</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;����ͬ�������и�����Ϊ����ͬ���ɷָ����ɲ��֣��뱾��ͬ���е�ͬ����Ч����<br>
&nbsp;&nbsp;&nbsp;&nbsp;����һ���������ڴ����Ĳ�Ʒ������ϸ����/�������Ĳ�Ʒ��Ʒ�����<br>
&nbsp;&nbsp;&nbsp;&nbsp;����������Ȩί����<br>
&nbsp;&nbsp;&nbsp;&nbsp;�����������Ĵ�����Ʒ��������<br>
		<strong>��ʮ�� ����</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;����ͬδ���ס���˫������һ��ͬ�⣬�κ�һ�����ñ�����޸Ļ���������ͬδ�����ˣ��ס���˫��������ǩ�����油��Э�飬����Э���뱾��ͬ����ͬ�ȷ���Ч�����������Э���뱾Э�����ݲ�һ�µģ���
����Э����Ӧ����Ϊ׼��
<br>
	</font></p></td>
  </tr>
  <tr> 
    <td  width="46%">&nbsp;</td>
    <td width="54%">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="46%"><font size="2">�׷�ǩ�֣�</font></td>
    <td width="54%"><font size="2">�ҷ��������ڴ�װ�ι��̣����������޹�˾</font></td>
  </tr>
  <tr> 
    <td  width="46%">&nbsp;</td>
    <td width="54%">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="46%"><font size="2">��Ȩ����ǩ�֣���</font></td>
    <td width="54%"><font size="2">��Ȩ����ǩ�֣���</font></td>
  </tr>
  <tr> 
	  <td height="300" colspan="2"> <p><font size="2"><strong><br>��������</strong></font><font size="2"><br>
<strong><center>��Ȩί����</center></strong><br><br>
<font style="color:#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;Ϊ����<font color="#000000">���ۺϻ����Ʒ���������ͬ��</font>˫�������˵ĺϷ�Ȩ�棬����˫����ͨ�����õķ����������ߣ���׷�ǩ��������Ȩί���顷���Դ�ָ��������ԱΪ�����ҷ���<font color="#000000">���ۺϻ����Ʒ���������ͬ��</font>������ͬ�������˽��й�ͨ�Ĵ���</font><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;ί���ˣ��򷽣���<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;���֤�ţ�<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;��ϵ�绰��<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;��ί���ˣ�<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;���֤�ţ�<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;��ϵ�绰��<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;��    �棺<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;ס    ַ��<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;��ί��������ί���������������ڴ�װ�ι��̣����������޹�˾֮�� &nbsp;&nbsp;&nbsp;&nbsp; ��     &nbsp;&nbsp;&nbsp;&nbsp;    ��   &nbsp;&nbsp;&nbsp;&nbsp; ��ǩ���ġ��ۺϻ����Ʒ���������ͬ�����������У���Ϊ�ұ��˵Ĵ����ˡ�<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;�����˵�Ȩ��Ϊ:<br>
&nbsp;&nbsp;&nbsp;&nbsp;��Ϊ��������ȡ��������ͬ��Ʒ��Ƶ��޸���������պ�ͬ��Ʒ��ǩ�𡢽��պ�ͬ���¸����ļ�������Э�̡��Ա�ί�����������������������˻������ĺ�ȷ�ϲ�Ʒ��Ϣ���ݺ���Ʒ������˻���Ʒ�����˵�ȫȨ����<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;ί���ˣ��򷽣���<div align="right">  ��   &nbsp;&nbsp;&nbsp;&nbsp;   ��   &nbsp;&nbsp;&nbsp;&nbsp;   ��</div>
	  </font></p></td>
  <tr>
	<td height="50" colspan="2"><p><font size="2"><strong>��������</strong></font><font size="2"><br><br>
<strong><center>���Ĵ�����Ʒ��������</center></strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1.ů���ࣺ <font style="color:#FF0000">2�걣�ޣ�����ά����</font><br>
&nbsp;&nbsp;&nbsp;&nbsp;2.��ů�ࣺA:��ů����  �£�10�걣�ޣ�����ά����
�¿�����2�걣�ޣ�����ά����
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B��ˮů��2�걣�ޣ�����ά����<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.����յ����·�ϵͳ�ࣺ1�걣�ޣ�����ά����<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.ˮ�����ࣺ2�걣�ޣ�����ά����<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.���ܼҾ��ࣺ3�걣�ޣ�����ά����<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.�ֽṹ��1�걣�ޣ�����ά����<br>

    </font></p></td>
  </tr>
	 
</table>

</body>
</html>
 

