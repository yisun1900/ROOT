<%@ page contentType="text/html;charset=GBK" %>
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
finally 
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
%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td width="35%"><img src="/images/tubiao.jpg"></td>
    <td width="65%"><font size="5"><strong>���Ĵ��������ͬ</strong></font></td>
  </tr>
</table>

<table width="100%" border="0">
  <tr align="right"> 
    <td colspan="2"> <div align="left"><font size="2">��ͬ��ţ�<%=ddbh%></font></div></td>
  </tr>
  <tr> 
    <td width="517"><font size="2">�׷����ͻ�����<u>&nbsp;<%=khxm%>&nbsp;</u> ��ϵ�绰��<u>&nbsp;<%=lxfs%>&nbsp;</u></font></td>
    <td width="450"><font size="2"> �� ���������ڴ�</font></td>
  </tr>
  <tr> 
    <td width="517"><font size="2">��װ��ַ��<u>&nbsp;&nbsp;<%=fwdz%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></font></td>
    <td width="450"><font size="2">�ֳ��೤/�绰��<u><%=sgbz%><%=bzdh%></u> </font></td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">�ͻ����ڣ�<u>&nbsp;&nbsp;&nbsp;<%=htshsj%>&nbsp;&nbsp;&nbsp; 
      &nbsp;&nbsp;&nbsp; </u></font></td>
    <td width="450"><font size="2">��ϵ�绰��010��84291188ת��Ŀ���� </font></td>
  </tr>
  <tr> 
    <td colspan="2"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹�������Ȩ�汣�����������л����񹲺͹���ͬ���������л����񹲺͹���Ʒ�����������йع涨���ҷ�Ϊ�׷��ṩ���Ƶļ�ͥװ�����׷���˫����ǩ�������Ĵ��������ͬ��,����ͬ���ء�</font></td>
  </tr>
  <tr valign="top"> 
    <td height="411" colspan="2"> <p><font size="2">һ���׷�ί���ҷ���Ϊ�������װ�������ģ�����������ݼ�����</font><font size="2"><br>
        <strong>�������ʽ��</strong><br>
        &nbsp;&nbsp;&nbsp;&nbsp;1������ͬ�ܽ�������<u>&nbsp;&nbsp;&nbsp;<%=cf.NumToRMBStr(cf.doubleTrim(jc_zcdd_hkze,0))%>&nbsp;&nbsp;&nbsp;</u>����<%=jc_zcdd_hkze%>����<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2�����ʽ��<br>
        &nbsp;&nbsp;&nbsp;&nbsp; ��1������ȫ��׷�һ����֧�����ҷ���ί�д���������ȫ���ʵ��������Ԥ���������ֲ���ʵ���������㡣<br>
        &nbsp;&nbsp;&nbsp;&nbsp; ��2���Ƚ������ٲ���ȫ����������Ʒ���磺ů�����Ʒ���ҷ������Ķ���ʽ��Ʒ�ȣ������Ų������������ܼ����׼ȷ����ģ����ɼ׷��Ƚ�����200Ԫ����׼ȷ�����������ǩ��������ͬ�����ܻ�����ֲ�Ʒ�İ�װ���ã���Ҫ�ɳ����ֳ���ȡ��<br>
        &nbsp; &nbsp;&nbsp;&nbsp;��3���������������ʩ�����貹���Ĳ�Ʒ���磺��ש�ࡢ���۰�Ȳ�Ʒ������ͻ����ܼ�ʱ���ҷ����������ҷ�����Ų�ü׷�������Ʒ���˻�����㣻��׷����ҷ�����Ĳ���ί�й��������ʱ���ҷ���Ȩ������ֹί�й�����Ϊ������������Ϊ�׷��ṩί�й�������ɴ���ɵĹ��̲������ڽ���������Ϊ�׷�ͬ�⹤��˳�ӡ�<br>
        <strong>�����ֳ������</strong>���ĵ������뾭�׷���׷�ί����ǩ�����ա����ʱ��׷�ԭ���ܵ����ֳ����գ�����Ϊ�ҷ�����Ʒ���׷�Ҫ��ɫ���ͺš������ʹ<br>
        <strong>�ġ�������֪��</strong><br>
        &nbsp;&nbsp;&nbsp;&nbsp;1���������ʩ�������д�����������ģ����ש���ذ塢��ֽ������ʵ���������1.1ϵ���ı���������<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2��ʵľ�ذ����Ʒ�������ò�Ϊ��Ȼ��ʵľ��ͬһ���λ�Ʒ�����������ɫ����Ĳ��죬������Χ��<br>
        &nbsp;&nbsp;&nbsp;&nbsp;3����װʵľ�ذ�ʱ��Ϊ��֤ƽ���ȣ��Ե���δ����ƽ����ģ���Ҫ���üӴ����ǵ��������Ӵ���������Ҫ���շ��õġ�<br>
        &nbsp;&nbsp;&nbsp;&nbsp;4�����ߴ�ӹ�������ӹ��Ĳ�Ʒ��һ���ӹ����˲������磺��ש�и���߽Ż�����ƴ���ģ����۰嶨�ߴ�ӹ��ģ���ԡ�����߼ӹ��ģ��ȵȡ�<br>
        &nbsp;&nbsp;&nbsp;&nbsp;5����Щ��Ʒ���̾�Ӫ���Ե�ԭ���׶��Ե�����������ڴ��ڼ䶩���Ĳ�Ʒ����������ʱ�����ݲ���ʱ�����еļ۸񲹻���<br>
        <strong>�塢�����ŵ��</strong> <BR>
        &nbsp;&nbsp;&nbsp;&nbsp;1������ש���Ʒ�⣬�ҷ��ĺ������̽��ṩһ�����������񡣶��ڴ�ש���Ʒ���ҷ��ĺ��������ṩ�������������񡣼����ͻ�һ�Σ��˻��򲹻�һ�Σ����ˡ���������Ϊ30���ڡ������ͻ����𳬹�30�죬�ҷ����ٳе�Ϊ�׷������ˡ��������������˻صĻ�ƷҪ�󣺣�1������ԭ��װ�䡣��2���޹���ʹ�úۼ�����ˮ��մˮ�ࣩ����ȱ�ǡ������������3�����η����踶�˷ѻ������˻����˻��ص㣺���̵Ŀⷿ��ֱӪ�ꡣ<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2���ҷ����Ƽ������Ĳ�Ʒ������׼���Թ��������ල������ҵ��׼Ϊ׼�����ҷ�Ϊ�׷����������ģ���Ȩ����������ȷ����������ģ��ҷ���ŵ�׷�������������Ʒʵ�������⸶����������Э���׷�׷�����̵Ĳ�Ʒ�������Ρ�<br>
        &nbsp;&nbsp;&nbsp;&nbsp;3�������ҷ���������ԭ������ӳٹ���������ͬ�ۿ��2���⳥ΥԼ��<br>
        &nbsp;&nbsp;&nbsp;&nbsp;4���������ı����������ݲ�Ʒ���۷������̣��Բ�Ʒ�����ڵĹ涨ִ�С�<br>
        &nbsp;&nbsp;&nbsp;&nbsp;5���廷������������Զ��������ȡ�˷ѡ������������ҷ��������̿ⷿ����׷�λ��Զ����ȡ��<BR>
        <strong>�������׽����ʽ</strong> <BR>
        &nbsp;&nbsp;&nbsp;&nbsp;1�������б���ͬ���������κ�����˫��Ӧ�Ѻ�Э�̽����Э�鲻�ɵģ��κ�һ�������򱻸����ڵ�����Ժ���ߡ�<BR>
        &nbsp;&nbsp;&nbsp;&nbsp;2������˫�����ڲ�Υ������ͬ��ԭ����ǩ�𲹳�Э�飬������Э���뱾��ͬ�й�������㣣�������Э��ִ�С�<BR>
        <strong>�ߡ�����ͬ��˫��ǩ�֡������Ҽ׷�֧��ȫ���������Ч������ͬһʽ���ݣ��׷�����һ�ݣ��ҷ��������ݣ����ݾ�����ͬ�ķ���Ч����</strong></font></p></td>
  </tr>
  <tr> 
    <td  width="517">&nbsp;</td>
    <td width="450">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">�׷�ǩ�֣�</font></td>
    <td width="450"><font size="2">�ҷ��������ڴ���£�</font></td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">&nbsp;&nbsp;</font></td>
    <td width="450"><font size="2">�����ˣ�</font></td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">ǩ�����ڣ�<%=qhtsj%></font></td>
    <td width="450"><font size="2">ǩ�����ڣ�<%=qhtsj%></font></td>
</table>
</body>
</html>
