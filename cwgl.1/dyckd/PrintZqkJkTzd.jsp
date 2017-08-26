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
double zjxdjjje=0;
double zjxrzf=0;

double sfke=0;
double kglf=0;
double kqtk=0;
double zhwjrzjx=0;

double allsjgck=0;
double yszqk=0;

java.text.DecimalFormat   df=new   java.text.DecimalFormat( "0.00 "); 

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,crm_khxx.dwbh,khxm,hth,crm_khxx.sgd,sgdmc,sgbz,qye,zhzjxje,zjxsuijin,zjxguanlif,sfke,kglf,kqtk";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"'  and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		
		qye=rs.getDouble("qye");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		sfke=rs.getDouble("sfke");
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(zjxrzf) zjxrzf,sum(zjxdjjje) zjxdjjje";
	ls_sql+=" from crm_khqye";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxrzf=rs.getDouble("zjxrzf");
		zjxdjjje=rs.getDouble("zjxdjjje");
	}
	rs.close();
	ps.close();


	double gczxzh=0;
	double gcjxzh=0;
	ls_sql="select sum(gczxzh) gczxzh,sum(gcjxzh) gcjxzh";
	ls_sql+=" from crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"' and sfwc='Y'";//N��δ��ɣ�Y�������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczxzh=rs.getDouble("gczxzh");
		gcjxzh=rs.getDouble("gcjxzh");
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
		if (payForUse.equals("��װ���ڿ�"))
		{
			sfke+=amount;
		}
	}

	//��ѯ:�ۼƼ�װʵ�տ�+++++++++++++++++++++++++++++++++++++++����

	allsjgck=qye+zhzjxje+zjxsuijin+zjxguanlif+zjxdjjje+zjxrzf;
	yszqk=allsjgck*95/100-sfke;
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<BR>
<table width="100%" border="0">
  <tr>
    <td><img src="logo.JPG"> </td>
  </tr>
  <tr>
    <td><div align="center"><b><font size="6" face="����_GB2312">���ڿ��֪ͨ��</font></b></div></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 18px'>
  <tr height="35"> 
    <td width="12%" height="41" align="center"><b>�ͻ�����</b></td>
    <td width="27%" align="center"><b><%=khxm%></b></td>
    <td width="12%" align="center"><b>��ͬ��</b></td>
    <td width="22%" align="center"><%=hth%></td>
    <td width="11%" align="center"><b>����</b></td>
    <td width="16%" align="center"><%=sgdmc%></td>
  </tr>
  
  <tr height="35">
    <td colspan="2"  align="center">(1)��ͬ���</td>
    <td colspan="4" align="center"><%=qye%></td>
  </tr>
  <tr height="35">
    <td rowspan="7"  align="center"><p>��</p>
      <p>��</p>
      <p>��</p>
    <p>��</p></td>
    <td align="center">(2)��������</td>
    <td colspan="4" align="center"><%=df.format(gczxzh)%></td>
  </tr>
  <tr height="35">
    <td align="center">(3)���̼���</td>
    <td colspan="4" align="center"><%=df.format(-1*gcjxzh)%></td>
  </tr>
  <tr height="35">
    <td align="center">(4)���С��</td>
    <td colspan="4" align="center"><%=df.format(zhzjxje)%></td>
  </tr>
  <tr height="35">
    <td align="center">(5)��������</td>
    <td colspan="4" align="center"><%=df.format(zjxguanlif)%></td>
  </tr>
  <tr height="35">
    <td align="center">(6)���˰��</td>
    <td colspan="4" align="center"><%=df.format(zjxsuijin)%></td>
  </tr>
  <tr height="35">
    <td align="center">(7)������Ż�</td>
    <td colspan="4" align="center"><%=df.format(zjxdjjje)%></td>
  </tr>
  <tr height="35">
    <td align="center">(8)�����֤��</td>
    <td colspan="4" align="center"><%=df.format(zjxrzf)%></td>
  </tr>
  
  
  <tr height="35">
    <td colspan="2"  align="center">(9)ʵ�ʹ��̶�</td>
    <td colspan="4" align="center"> <%=df.format(allsjgck)%></td>
  </tr>
  <tr height="35">
    <td height="16" colspan="2" align="center">(10)�������ڿ�</td>
    <td colspan="4" align="center"><%=df.format(sfke)%></td>
  </tr>
  <tr height="35">
    <td height="16" colspan="2" align="center">(11)Ӧ�����ڿ�=(9)*95%-(10)</td>
    <td colspan="4" align="center"><%=df.format(yszqk)%></td>
  </tr>
</table>
<p align="left">
&nbsp;&nbsp;&nbsp;&nbsp;Ϊ��ά���ͻ���Ȩ�棬����������˾�����˶Ըù��̿������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��ǰ���Խ��������˾���񲿣������ɴ��������ľ����뷨�������������˳е���</p>
<table width="100%" height="72" border="0">
  <tr align="center">
    <td width="50%">�ͻ�ǩ�֣�</td>
    <td width="50%">����ǩ�֣�</td>
  </tr>
  <tr align="center">
    <td>&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    <td>&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
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