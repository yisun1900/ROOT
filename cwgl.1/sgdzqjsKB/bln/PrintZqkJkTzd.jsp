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

	
	//查询:累计家装实收款+++++++++++++++++++++++++++++++++++++++开始
	String orderId=hth;  //订单编号

	double allamount=0;

	double amount=0.0;// 收款金额
	String payForUse;// 款项用途

	String url = cf.getValue("kb_url");
	Service service = new Service();
	Call call;
	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	QName qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
		new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//设定传入的参数，
	call.addParameter("orderId", qn, ParameterMode.IN);
	//设定返回的参数
	call.setReturnType(qn, Pay[].class);

	Pay obj[]  = (Pay[])call.invoke(new Object[]{orderId});
	for(int i=0;i<obj.length;i++)
	{
		 amount=obj[i].getAmont();
		 payForUse=obj[i].getPayForUse();// 款项用途

		if (!payForUse.equals("家装设计费"))
		{
			allamount=allamount+amount;
		}
	}

	sfke=allamount;
	//查询:累计家装实收款+++++++++++++++++++++++++++++++++++++++结束

%>
<html>
<head>
<title>中期款交款通知单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">中期款交款通知单</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>

  <tr height="35"> 
    <td width="15%" height="41" align="center"><b>客户姓名</b></td>
    <td width="15%"><%=khxm%></td>
    <td width="15%" align="center"><b>合同号</b></td>
    <td width="20%"><%=hth%></td>
    <td width="15%" align="center"><b>工长</b></td>
    <td width="20%"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgbz%>） </td>
</tr>
  <tr height="35">
    <td height="35" colspan="4">1.合同金额</td>
    <td colspan="2" align="center"><%=qye%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">2.工程增项金额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">3.工程减项金额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">4.实际工程额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(qye+zhzjxje+zjxsuijin+zjxguanlif+kglf+kqtk+zhwjrzjx)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4"">5.已收首期款</td>
    <td colspan="2" align="center"><%=cf.formatDouble(sfke)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">6.应收中期款=（1+2-3）X95%-5</td>
    <td colspan="2" align="center"><%=cf.formatDouble((qye+(zhzjxje+zjxsuijin+zjxguanlif))*95/100-sfke)%></td>
  </tr>
  </table>
<p align="left"> <strong>为了维护客户的权益，烦请您与我司工长核对该工程款项后，于&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日前亲自将款项交至我司财务部，否则由此所产生的经济与法律责任由您个人承担。</strong></p>
<table width="100%" height="72" border="0">
  <tr>
    <td>客户签字：</td>
    <td>工长签字：</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</div></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</div></td>
  </tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
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