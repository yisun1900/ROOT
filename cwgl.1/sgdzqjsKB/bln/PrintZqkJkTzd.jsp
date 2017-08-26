<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String hth=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;

double qye=0;
double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;
double sfke=0;
double kglf=0;
double kqtk=0;
double zhwjrzjx=0;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,crm_khxx.dwbh,khxm,hth,crm_khxx.sgd,sgdmc,sgbz,qye,zhzjxje,zjxsuijin,zjxguanlif,sfke,kglf,kqtk,zhwjrzjx";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		
		qye=rs.getDouble("qye");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		sfke=rs.getDouble("sfke");
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		zhwjrzjx=rs.getDouble("zhwjrzjx");
		
	}
	rs.close();
	ps.close();

	
	//��ѯ:�ۼƼ�װʵ�տ�+++++++++++++++++++++++++++++++++++++++��ʼ
	String orderId=hth;  //�������

	double allamount=0;

	double amount=0.0;// �տ���
	String payForUse;// ������;

	String url = cf.getValue("kb_url");
	Service service = new Service();
	Call call;
	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	QName qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
		new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//�趨����Ĳ�����
	call.addParameter("orderId", qn, ParameterMode.IN);
	//�趨���صĲ���
	call.setReturnType(qn, Pay[].class);

	Pay obj[]  = (Pay[])call.invoke(new Object[]{orderId});
	for(int i=0;i<obj.length;i++)
	{
		 amount=obj[i].getAmont();
		 payForUse=obj[i].getPayForUse();// ������;

		if (!payForUse.equals("��װ��Ʒ�"))
		{
			allamount=allamount+amount;
		}
	}

	sfke=allamount;
	//��ѯ:�ۼƼ�װʵ�տ�+++++++++++++++++++++++++++++++++++++++����

%>
<html>
<head>
<title>���ڿ��֪ͨ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">���ڿ��֪ͨ��</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>

  <tr height="35"> 
    <td width="15%" height="41" align="center"><b>�ͻ�����</b></td>
    <td width="15%"><%=khxm%></td>
    <td width="15%" align="center"><b>��ͬ��</b></td>
    <td width="20%"><%=hth%></td>
    <td width="15%" align="center"><b>����</b></td>
    <td width="20%"><%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>��<%=sgbz%>�� </td>
</tr>
  <tr height="35">
    <td height="35" colspan="4">1.��ͬ���</td>
    <td colspan="2" align="center"><%=qye%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">2.����������</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">3.���̼�����</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">4.ʵ�ʹ��̶�</td>
    <td colspan="2" align="center"><%=cf.formatDouble(qye+zhzjxje+zjxsuijin+zjxguanlif+kglf+kqtk+zhwjrzjx)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4"">5.�������ڿ�</td>
    <td colspan="2" align="center"><%=cf.formatDouble(sfke)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">6.Ӧ�����ڿ�=��1+2-3��X95%-5</td>
    <td colspan="2" align="center"><%=cf.formatDouble((qye+(zhzjxje+zjxsuijin+zjxguanlif))*95/100-sfke)%></td>
  </tr>
  </table>
<p align="left"> <strong>Ϊ��ά���ͻ���Ȩ�棬����������˾�����˶Ըù��̿������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��ǰ���Խ��������˾���񲿣������ɴ��������ľ����뷨�������������˳е���</strong></p>
<table width="100%" height="72" border="0">
  <tr>
    <td>�ͻ�ǩ�֣�</td>
    <td>����ǩ�֣�</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
  </tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>