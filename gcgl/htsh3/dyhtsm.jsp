<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
//String yhdlm=(String)session.getAttribute("yhdlm");
//String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String xb=null;
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
String khjl=null;
String sjs=null;
String hth=null;

String gj=null;
String dd=null;
String hxbm=null;
String kgrq=null;
String jgrq=null;
String qyrq=null;
String jyjdrq=null;
double qye=0;
double guanlif=0;
double suijin=0;

String sjsdh="";
String gjdh="";
String khjldh="";
String sgddh="";
String dddh="";
String ssfgs=null;
String dwbh=null;
//String hxbm=null;
double fwmj=0;
double fj=0;
double zsbfb=0;
String sgd=null;
String bjjb=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,hth,lxfs,fwmj,hxbm,kgrq,jgrq,qye,fgsbh,dwbh,guanlif,suijin,khjl,hxbm,qyrq,jyjdrq,sgd,gj,dd,bjjbmc";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm";
    ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
		//ssfgs=rs.getString("ssfgs");
		hth=rs.getString("hth");
		//yxtxdz=cf.fillNull(rs.getString("yxtxdz"));
		//fwmj=cf.fillNull(rs.getString("fwmj"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
	    qye=rs.getDouble("qye");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		//dh=cf.fillNull(rs.getString("dh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		khjl=cf.fillNull(rs.getString("khjl"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getDouble("fwmj");
		sgd=cf.fillNull(rs.getString("sgd"));
		gj=cf.fillNull(rs.getString("gj"));
	    dd=cf.fillNull(rs.getString("dd"));
		bjjb=cf.fillNull(rs.getString("bjjbmc"));
	}
	 rs.close();
	 ps.close();

	ls_sql="select zsbfb";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsbfb=rs.getDouble("zsbfb");

	}
	rs.close();
	ps.close();

    ls_sql="select fj";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fj=rs.getDouble("fj");
	}
	rs.close();
	ps.close();
	
		
	/*ls_sql=" select zjxm from crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
	
	}
	rs.close();
	ps.close();
	*/
	
	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	


	//�ͻ�����绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where yhmc ='"+khjl+"'  and zwbm='03'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjldh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�����绰
	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	
	//�ܼҵ绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	//ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+gj+"' and zwbm='06'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//���ȵ绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	//ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+dd+"' and zwbm='07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
%>
<body>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><strong style="font-size:24px">��ͬ˵����</strong>   </td>
   
  </tr> 
    

  <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" > �������</td>
    <td  width="28%"  align="left">&nbsp;<%=hth%></td>
    <td width="24%" align="center" >�ͻ�����</td>
    <td width="25%" align="left">&nbsp;<%=khxm%></td>
	
  </tr>
   <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >�ͻ��绰</td>
    <td  colspan="3" align="left">&nbsp;<%=lxfs%></td>
    
	
  </tr>
  <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >���̵�ַ</td>
    <td  colspan="3" align="left">&nbsp;<%=fwdz%></td>
   
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >���۵���</td>
    <td  align="left">&nbsp;
      <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
	<td  width="23%"  align="center" >���ۼ���</td>
    <td  align="left">&nbsp;
     <%=bjjb%>
	</td>
  
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >�곤</td>
    <td  width="28%"  align="center">&nbsp;</td>
    <td width="24%" align="center" >��ϵ��ʽ</td>
    <td width="25%" align="center">&nbsp;</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >���ʦ</td>
    <td  width="28%"  align="left">&nbsp;<%=sjs%></td>
    <td width="24%" align="center" >��ϵ��ʽ</td>
    <td width="25%" align="left">&nbsp;<%=sjsdh%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >�ͻ�����</td>
    <td  width="28%"  align="left">&nbsp;<%=khjl%></td>
    <td width="24%" align="center" >��ϵ��ʽ</td>
    <td width="25%" align="left">&nbsp;<%=khjldh%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >���̻���</td>
    <td  width="28%"  align="left">&nbsp;
      <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
    <td width="24%" align="center" >ʹ�����</td>
    <td width="25%" align="left">&nbsp;<%=fwmj%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >��ͬ���</td>
    <td  width="28%"  align="left">&nbsp;<%=qye%></td>
    <td width="24%" align="center" >�Ż�����</td>
    <td width="25%" align="left">&nbsp;<%=zsbfb%>%������</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >��ͬ����</td>
    <td  width="28%"  align="left">&nbsp;<%=qyrq%></td>
    <td width="24%" align="center" >��������</td> 
    <td width="25%" align="left">&nbsp;<%=jyjdrq%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >ʩ������</td>
    <td  width="28%"  align="left">&nbsp;<%=kgrq%>��<%=jgrq%></td>
    <td width="24%" align="center" >���̹���</td>
    <td width="25%" align="center">&nbsp;</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >�˳�·��</td>
    <td  width="28%"  align="center">&nbsp;</td>
    <td width="24%" align="center" >��֤����</td>
    <td width="25%" align="center">&nbsp;</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >����</td>
    <td  width="28%"  align="left">&nbsp;  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
</td>
    <td width="24%" align="center" >��ϵ��ʽ</td>
    <td width="25%" align="left">&nbsp;<%=sgddh%></td>
  </tr>
     <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >��Ŀ����</td>
    <td  width="28%"  align="left">&nbsp;<%=dd%></td>
    <td width="24%" align="center" >��ϵ��ʽ</td>
    <td width="25%" align="left">&nbsp;<%=dddh%></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >��Ŀ�ܼ�</td>
    <td  width="28%"  align="left">&nbsp;<%=gj%></td>
    <td width="24%" align="center" >��ϵ��ʽ</td>
    <td width="25%" align="left">&nbsp;<%=gjdh%></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >סլ���ۼ�</td>
    <td   colspan="3"align="left">&nbsp;<%=fj%></td>
    
  </tr>
</table>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%" height="55" align="right" ></td>
    <td   align="center">���̹���ǩ��/����:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
  </tr>
</table>


��Ʒ�������
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#cccccc" align="center"> 
	<td width="11%">��������</td>
	<td width="16%">�������</td>
	<td width="11%">����״̬</td>
	<td width="9%">�������</td>
	<td width="9%">ʵ�ս��</td>
	<td width="8%">�����Ա</td>
	<td width="22%">�����Ա��ϵ��ʽ</td>
  </tr>
<%
		
	String custId=khbh;


	ls_sql="select boloni_khbh from crm_zxkhxx where  khbh='"+custId+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{
		custId=rs.getString(1);
	}

	rs.close();
	ps.close();

	String url = cf.getValue("kb_url");
	Service service = new Service();
	Customer customer=new Customer();// �ͻ�����
	Order order=new Order();

	Call call=null;
	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );

	//����������:Customer
	QName qn = new QName("urn:BeanService", "Customer");
	call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
	new BeanDeserializerFactory(Customer.class, qn));

	//����������:Designer
	qn = new QName("urn:BeanService", "Designer");
	call.registerTypeMapping(Designer.class, qn, new BeanSerializerFactory(Designer.class, qn), 
	new BeanDeserializerFactory(Designer.class, qn));

	//����������:Order
	qn = new QName("urn:BeanService", "Order");
	call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
	new BeanDeserializerFactory(Order.class, qn));

	//�ӿڷ�������listOrderByCustId
	call.setOperationName(new QName("Order", "listOrderByCustId"));
	//�趨���صĲ���
	call.setReturnType(qn, Order[].class);

	//�趨����Ĳ�����
	call.addParameter("custId", qn, ParameterMode.IN);

	//ִ��
	Order[] obj  = (Order[])call.invoke(new Object[]{custId});


	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
	new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//�趨����Ĳ�����
	call.addParameter("orderId", qn, ParameterMode.IN);
	//�趨���صĲ���
	call.setReturnType(qn, Pay[].class);


	String orderId=null;//�������
	String orderState=null;// ����״̬
	String orderType=null;// ��������
	String jjsjs=null;// �����Ա
	String jjsjsLxfs=null;// �����Ա��ϵ��ʽ
	String store=null;//���۵���
	double orderAmount=0.00;//�������
	String YblState="";
	String kbkhbh="";//�����ڴ�ͻ����
	String kbkhxm="";//�����ڴ�ͻ�����
	Designer designer=new Designer();// ���ʦ����
	String desId="" ;  //���ʦ���
	String desName="";//���ʦ����
	String desMobilePhone="";//���ʦ�ƶ��绰

	double allamount=0;// �տ���
	double allorderAmount=0.00;//�������
	for(int i=0;i<obj.length;i++)
	{
		orderType=obj[i].getOrderType();// ��������
		if(orderType.equals("��װ����"))
		{
			continue;
		}
		orderId=obj[i].getOrderId();  //�������
		orderState=obj[i].getOrderState();// ����״̬

		customer=obj[i].getCustomer();// �ͻ�����
		store=obj[i].getStore();//���۵���
		if(store==null)
		{
			store="";
		}
		orderAmount=obj[i].getOrderAmount();//�������

		kbkhbh=customer.getCustId();//�����ڴ�ͻ����
		kbkhxm=customer.getCustName();//�����ڴ�ͻ�����

		designer=obj[i].getDesigner();// ���ʦ����
		desId=designer.getDesId();//���ʦ���
		desName=designer.getDesName();//���ʦ����
		desMobilePhone=designer.getDesMobilePhone();//���ʦ�ƶ��绰

		double amount=0;// �տ���

		Pay pay[]  = (Pay[])call.invoke(new Object[]{orderId});
		for(int j=0;j<pay.length;j++)
		{
			amount=amount+pay[j].getAmont();// 
		}

		allamount+=amount;
		allorderAmount+=orderAmount;

		
		YblState="&nbsp;";
		ls_sql="select ztmc from jc_order_ybl,dm_orderzt where jc_order_ybl.order_zt=dm_orderzt.ztbm and order_id='"+orderId+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			YblState=rs.getString(1);
		}
		rs.close();
		ps.close();

		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td><%=orderType%></td>
			<td><a href="OrderItemList.jsp?orderId=<%=orderId%>" target="_blank"><%=orderId%></a></td>
			<td><%=orderState%></td>
			<td><%=orderAmount%></td>
			<td><%=amount%></td>
			<td><%=desName%></td>
			<td><%=desMobilePhone%></td>
		</tr>
		<%
	}

	%>
	<tr align="center" bgcolor="#FFFFFF"> 
		<td>С ��</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allorderAmount%></td>
		<td><%=allamount%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%
}
catch (Exception e)
{
	out.print("ʧ��: " + e);
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
</table>

<BR>
���Ĵ�����Ʒ
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
    <tr align="center">
      <td width="18%">��������</td>
      <td width="15%">�Ƿ񽻿�</td>
      <td width="18%">��������</td>
      <td width="15%">�Ƿ񽻿�</td>
      <td width="19%">��������</td>
      <td width="15%">�Ƿ񽻿�</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
</table>
</table>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%" height="55" align="right" ></td>
    <td   align="center">���ʦǩ��/����:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
  </tr>
</table>
<BR>
����
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
    <tr >
      <td width="20%">��ͬ˵����&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="20%">���۵���&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="20%">ͼֽ��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="20%">���ϵ���&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td width="20%">����˵����&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    </tr>
</table>
</table>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%" height="55" align="right" ></td>
    <td   align="center">���̶���ǩ��/����:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
  </tr>
</table>
</body>
</html>
