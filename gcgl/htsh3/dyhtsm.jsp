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
	
	//设计师电话
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
	
	


	//客户经理电话
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
	
	//工长电话
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
	
	
	//管家电话
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
	
	//调度电话
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
    <td align="center" colspan="4" height="35"><strong style="font-size:24px">合同说明表</strong>   </td>
   
  </tr> 
    

  <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" > 订单编号</td>
    <td  width="28%"  align="left">&nbsp;<%=hth%></td>
    <td width="24%" align="center" >客户姓名</td>
    <td width="25%" align="left">&nbsp;<%=khxm%></td>
	
  </tr>
   <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >客户电话</td>
    <td  colspan="3" align="left">&nbsp;<%=lxfs%></td>
    
	
  </tr>
  <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >工程地址</td>
    <td  colspan="3" align="left">&nbsp;<%=fwdz%></td>
   
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >销售店面</td>
    <td  align="left">&nbsp;
      <%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
	<td  width="23%"  align="center" >报价级别</td>
    <td  align="left">&nbsp;
     <%=bjjb%>
	</td>
  
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >店长</td>
    <td  width="28%"  align="center">&nbsp;</td>
    <td width="24%" align="center" >联系方式</td>
    <td width="25%" align="center">&nbsp;</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >设计师</td>
    <td  width="28%"  align="left">&nbsp;<%=sjs%></td>
    <td width="24%" align="center" >联系方式</td>
    <td width="25%" align="left">&nbsp;<%=sjsdh%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >客户经理</td>
    <td  width="28%"  align="left">&nbsp;<%=khjl%></td>
    <td width="24%" align="center" >联系方式</td>
    <td width="25%" align="left">&nbsp;<%=khjldh%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >工程户型</td>
    <td  width="28%"  align="left">&nbsp;
      <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
    <td width="24%" align="center" >使用面积</td>
    <td width="25%" align="left">&nbsp;<%=fwmj%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >合同金额</td>
    <td  width="28%"  align="left">&nbsp;<%=qye%></td>
    <td width="24%" align="center" >优惠内容</td>
    <td width="25%" align="left">&nbsp;<%=zsbfb%>%返积分</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >合同日期</td>
    <td  width="28%"  align="left">&nbsp;<%=qyrq%></td>
    <td width="24%" align="center" >交底日期</td> 
    <td width="25%" align="left">&nbsp;<%=jyjdrq%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >施工日期</td>
    <td  width="28%"  align="left">&nbsp;<%=kgrq%>至<%=jgrq%></td>
    <td width="24%" align="center" >工程工艺</td>
    <td width="25%" align="center">&nbsp;</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >乘车路线</td>
    <td  width="28%"  align="center">&nbsp;</td>
    <td width="24%" align="center" >认证店面</td>
    <td width="25%" align="center">&nbsp;</td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >工长</td>
    <td  width="28%"  align="left">&nbsp;  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>
</td>
    <td width="24%" align="center" >联系方式</td>
    <td width="25%" align="left">&nbsp;<%=sgddh%></td>
  </tr>
     <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >项目调度</td>
    <td  width="28%"  align="left">&nbsp;<%=dd%></td>
    <td width="24%" align="center" >联系方式</td>
    <td width="25%" align="left">&nbsp;<%=dddh%></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >项目管家</td>
    <td  width="28%"  align="left">&nbsp;<%=gj%></td>
    <td width="24%" align="center" >联系方式</td>
    <td width="25%" align="left">&nbsp;<%=gjdh%></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
	<td  width="23%"  align="center" >住宅销售价</td>
    <td   colspan="3"align="left">&nbsp;<%=fj%></td>
    
  </tr>
</table>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%" height="55" align="right" ></td>
    <td   align="center">工程管理部签字/日期:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
  </tr>
</table>


产品订货情况
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#cccccc" align="center"> 
	<td width="11%">订单类型</td>
	<td width="16%">订单编号</td>
	<td width="11%">订单状态</td>
	<td width="9%">订单金额</td>
	<td width="9%">实收金额</td>
	<td width="8%">设计人员</td>
	<td width="22%">设计人员联系方式</td>
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
	Customer customer=new Customer();// 客户对象
	Order order=new Order();

	Call call=null;
	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );

	//关联本地类:Customer
	QName qn = new QName("urn:BeanService", "Customer");
	call.registerTypeMapping(Customer.class, qn, new BeanSerializerFactory(Customer.class, qn), 
	new BeanDeserializerFactory(Customer.class, qn));

	//关联本地类:Designer
	qn = new QName("urn:BeanService", "Designer");
	call.registerTypeMapping(Designer.class, qn, new BeanSerializerFactory(Designer.class, qn), 
	new BeanDeserializerFactory(Designer.class, qn));

	//关联本地类:Order
	qn = new QName("urn:BeanService", "Order");
	call.registerTypeMapping(Order.class, qn, new BeanSerializerFactory(Order.class, qn), 
	new BeanDeserializerFactory(Order.class, qn));

	//接口方法名：listOrderByCustId
	call.setOperationName(new QName("Order", "listOrderByCustId"));
	//设定返回的参数
	call.setReturnType(qn, Order[].class);

	//设定传入的参数，
	call.addParameter("custId", qn, ParameterMode.IN);

	//执行
	Order[] obj  = (Order[])call.invoke(new Object[]{custId});


	call = (Call) service.createCall();
	call.setTargetEndpointAddress(new java.net.URL(url) );
	qn = new QName("urn:BeanService", "Pay");
	call.registerTypeMapping(Pay.class, qn, new BeanSerializerFactory(Pay.class, qn), 
	new BeanDeserializerFactory(Pay.class, qn));

	call.setOperationName(new QName("Pay", "listPayByContractId"));
	//设定传入的参数，
	call.addParameter("orderId", qn, ParameterMode.IN);
	//设定返回的参数
	call.setReturnType(qn, Pay[].class);


	String orderId=null;//订单编号
	String orderState=null;// 订单状态
	String orderType=null;// 订单类型
	String jjsjs=null;// 设计人员
	String jjsjsLxfs=null;// 设计人员联系方式
	String store=null;//销售店面
	double orderAmount=0.00;//订单金额
	String YblState="";
	String kbkhbh="";//松下亿达客户编号
	String kbkhxm="";//松下亿达客户姓名
	Designer designer=new Designer();// 设计师对象
	String desId="" ;  //设计师编号
	String desName="";//设计师姓名
	String desMobilePhone="";//设计师移动电话

	double allamount=0;// 收款金额
	double allorderAmount=0.00;//订单金额
	for(int i=0;i<obj.length;i++)
	{
		orderType=obj[i].getOrderType();// 订单类型
		if(orderType.equals("家装订单"))
		{
			continue;
		}
		orderId=obj[i].getOrderId();  //订单编号
		orderState=obj[i].getOrderState();// 订单状态

		customer=obj[i].getCustomer();// 客户对象
		store=obj[i].getStore();//销售店面
		if(store==null)
		{
			store="";
		}
		orderAmount=obj[i].getOrderAmount();//订单金额

		kbkhbh=customer.getCustId();//松下亿达客户编号
		kbkhxm=customer.getCustName();//松下亿达客户姓名

		designer=obj[i].getDesigner();// 设计师对象
		desId=designer.getDesId();//设计师编号
		desName=designer.getDesName();//设计师姓名
		desMobilePhone=designer.getDesMobilePhone();//设计师移动电话

		double amount=0;// 收款金额

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
		<td>小 计</td>
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
	out.print("失败: " + e);
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
主材代购产品
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
    <tr align="center">
      <td width="18%">主材名称</td>
      <td width="15%">是否交款</td>
      <td width="18%">主材名称</td>
      <td width="15%">是否交款</td>
      <td width="19%">主材名称</td>
      <td width="15%">是否交款</td>
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
    <td   align="center">设计师签字/日期:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
  </tr>
</table>
<BR>
附件
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
    <tr >
      <td width="20%">合同说明：&nbsp;&nbsp;&nbsp;&nbsp;张</td>
      <td width="20%">报价单：&nbsp;&nbsp;&nbsp;&nbsp;张</td>
      <td width="20%">图纸：&nbsp;&nbsp;&nbsp;&nbsp;张</td>
      <td width="20%">材料单：&nbsp;&nbsp;&nbsp;&nbsp;张</td>
      <td width="20%">工艺说明：&nbsp;&nbsp;&nbsp;&nbsp;张</td>
    </tr>
</table>
</table>
  <table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
    <tr bgcolor="#FFFFFF"> 
	<td  width="23%" height="55" align="right" ></td>
    <td   align="center">工程督导签字/日期:&nbsp;&nbsp;&nbsp;&nbsp;</td>
    
  </tr>
</table>
</body>
</html>
