<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
  <style media="print">

    .noprint { display: none }

  </style>

</head>


<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String ssfgs=null;
String dwbh=null;
String bjjb=null;
String jjrksg=null;
String jjrksgmc=null;
String fwdz=null;
String  gj=null;
String  dd=null;
String  sgd=null;
String  sgdmc="";
String sgbz=null;
String khxm=null;
String lxfs=null;
String kgrq=null;
String jgrq=null;
String sjs=null;

String sjsdh="";
String gjdh="";
String dddh="";
String sgddh="";
String sgbzdh="";

String wysjs="";
String wysjsdh="";
String cgsjs="";
String cgsjsdh="";
String jjsjs="";
String jjsjsdh="";

String logo=null;

int width=10;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,lxfs,bjjb,jjrksg,DECODE(jjrksg,'1','�ڡ����ղ���ʩ��','2','���ղ���ʩ��','9','�ڡ����տ�ʩ��') jjrksgmc,fwdz,gj,dd,sgd,sgbz,khxm,kgrq,jgrq,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		jjrksg=cf.fillNull(rs.getString("jjrksg"));
		jjrksgmc=cf.fillHtml(rs.getString("jjrksgmc"));

		fwdz=rs.getString("fwdz");
		gj=cf.fillHtml(rs.getString("gj"));
		dd=cf.fillHtml(rs.getString("dd"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=rs.getString("khxm");
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjs=rs.getString("sjs");
	}
	rs.close();
	ps.close();


	//ȡ�Ҿ����ʦ++++++++++++++++++++��ʼ
	String custId=null;
	ls_sql="select boloni_khbh from crm_zxkhxx where  khbh='"+khbh+"'";
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
	String orderType=null;// ��������

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

		designer=obj[i].getDesigner();// ���ʦ����


		desId=designer.getDesId();//���ʦ���
		desName=designer.getDesName();//���ʦ����
		desMobilePhone=designer.getDesMobilePhone();//���ʦ�ƶ��绰


		if (orderType.equals("��ԡ����"))
		{
			wysjs=desName;
			wysjs=desMobilePhone;
		}
		else if (orderType.equals("���񶩵�"))
		{
			cgsjs=desName;
			cgsjsdh=desMobilePhone;
		}
		else if (orderType.equals("�Ҿ߶���"))
		{
			jjsjs=desName;
			jjsjsdh=desMobilePhone;
		}
	}
	//ȡ�Ҿ����ʦ====================����



	//���ʦ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm in('23','04') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	//�ӳ��绰
	ls_sql=" select dh,sgdmc from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString("dh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();


	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgbzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//�ܼҵ绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+gj+"' and zwbm='06'";
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
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+dd+"' and zwbm='07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	
	if (bjjb.equals("A") || bjjb.equals("B") || bjjb.equals("C"))
	{
		logo="tellmach.jpg";
	} 
	else if (bjjb.equals("D") || bjjb.equals("E") || bjjb.equals("F"))
	{
		logo="boloni.jpg";
	} 

	int count=0;

	java.sql.Date date1=null;
	java.sql.Date date2=null;
	ls_sql="select min(jhkssj) ,max(jhjssj) ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		date1=rs.getDate(1);
		date2=rs.getDate(2);
	}
	rs.close();
	ps.close();

	if (date1==null || date2==null)
	{
		out.println("����δ¼��ʱ��");
		return;
	}

	if (date1.compareTo(date2)>0)
	{
		out.println("���󣡼ƻ���������С�ڿ�ʼ����");
		return;
	}

	//��������
	int rqzl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2�����ղ���ʩ��
	{
		ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
	}
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rqzl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (rqzl<10)
	{
		width=80;
	}
	else if (rqzl<20)
	{
		width=65;
	}
	else if (rqzl<30)
	{
		width=50;
	}
	else if (rqzl<40)
	{
		width=30;
	}
	else if (rqzl<50)
	{
		width=25;
	}
	else if (rqzl<60)
	{
		width=22;
	}
	else if (rqzl<70)
	{
		width=19;
	}
	else if (rqzl<80)
	{
		width=16;
	}
	else if (rqzl<90)
	{
		width=13;
	}
	else if (rqzl<110)
	{
		width=10;
	}
	else if (rqzl<150)
	{
		width=9;
	}
	else
	{
		width=8;
	}
%>
<OBJECT id="WebBrowser" height="0" width="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
  </OBJECT>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  <div>
   <table width="100%" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
	<tr>
	   <td width="5%">
	   <center class=noprint><input type=button name="" value="����" onClick="javascript:window.open('xmrwglToExcel.jsp?khbh=<%=khbh%>');">
	   <input onClick="document.all.WebBrowser.ExecWB(6,1)" type="button" value="��ӡ">
	     <input onClick="document.all.WebBrowser.ExecWB(8,1)" type="button" value="ҳ������">
		<input onClick="document.all.WebBrowser.ExecWB(7,1)" type="button" value="��ӡԤ��">
		</center>

	 </td>
     </tr>
	 <tr><td width="100%">
   
	 <table  border="1" width="<%=(15+105+15+45+45+20+rqzl*width)%>px" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px;table-layout:fixed'>
	 <tr>
	   <td width="22%" rowspan="2" valign="middle">
	   <image src="/images/<%=logo%>" height='30px'> <span class="STYLE1">������Ŀ���ȱ�</span></td>
	 
	     <td width="13%" >����:<%=khxm%></td>
		 <td colspan="2" >ʵ�ʹ���:<%=kgrq%>��<%=jgrq%></td>
		 <td width="12%" >��װ���ʦ:<%=sjs%><%=sjsdh%></td>
		 <td width="12%" >��/�����ʦ:<%=cgsjs%><%=cgsjsdh%></td>
		 <td width="12%" >��ԡ���ʦ:<%=wysjs%><%=wysjsdh%></td>
		 <td width="12%" >�Ҿ����ʦ:<%=jjsjs%><%=jjsjsdh%></td>
	    </tr>
	   <tr >
	     <td colspan="2">��ַ:<%=fwdz%></td>
		 <td width="11%"><%=jjrksgmc%></td>
		 <td>��Ŀ�ܼ�:<%=gj%><%=gjdh%></td>
		 <td>�󹤳�:<%=sgdmc%><%=sgddh%></td>
		 <td>�ֳ�������:<%=sgbz%><%=sgbzdh%></td>
		 <td>��װ��ԼרԱ:<%=dd%><%=dddh%></td>
	    </tr>
	 </table>
   </td></tr>
  </div>
<tr><td width="100%">
  <table border="1" width="<%=(15+105+15+45+45+20+rqzl*width)%>px" cellspacing="0" cellpadding="0"  style='FONT-SIZE:8px;table-layout:fixed ' >
    <tr  align="center" bgcolor="#FFFFCC"> 
		<td width="15px" rowspan="3">���</td>
		
		<td width="105px" rowspan="3" >��������</td>
		<td width="15px" rowspan="3">����</td>
		<td width="45"rowspan="3">�ƻ���ʼ</td>
		<td width="45px"rowspan="3">�ƻ�����</td>
		<td width="20px" rowspan="3">��ע</td>
	

<%

	int nian=0;
	int yue=0;
	int rqsl=0;
	ls_sql="select nian,yue,count(*) rqsl";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2�����ղ���ʩ��
	{
		ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
	}
	ls_sql+=" group by nian,yue";
	ls_sql+=" order by nian,yue";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=rs.getInt("nian");
		yue=rs.getInt("yue");
		rqsl=rs.getInt("rqsl");

		%>
		<td colspan="<%=rqsl%>"><%=yue%>��</td>
		<%
	}
	rs.close();
	ps.close();


	%>
	</TR>

    <tr  align="center" bgcolor="#FFFFCC"> 
	<%
	int ri=0;

	ls_sql="select nian,yue";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2�����ղ���ʩ��
	{
		ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
	}
	ls_sql+=" group by nian,yue";
	ls_sql+=" order by nian,yue";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=rs.getInt("nian");
		yue=rs.getInt("yue");

		
		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2�����ղ���ʩ��
		{
			ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri<10";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">0</td>
			<%
		}

		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2�����ղ���ʩ��
		{
			ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri>=10 and ri<20";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">1</td>
			<%
		}

		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2�����ղ���ʩ��
		{
			ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri>=20 and ri<30";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">2</td>
			<%
		}

		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2�����ղ���ʩ��
		{
			ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri>=30";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">3</td>
			<%
		}
	}
	rs.close();
	ps.close();


	%>
	</TR>

    <tr  align="center" bgcolor="#FFFFCC"> 
	<%

	ls_sql="select nian,yue,ri";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2�����ղ���ʩ��
	{
		ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
	}
	ls_sql+=" order by nian,yue,ri";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=rs.getInt("nian");
		yue=rs.getInt("yue");
		ri=rs.getInt("ri");

		if (ri<10)
		{
			%>
			<td width="<%=width%>px"><%=ri%></td>
			<%
		}
		else if (ri<20)
		{
			%>
			<td width="<%=width%>px"><%=(ri-10)%></td>
			<%
		}
		else if (ri<30)
		{
			%>
			<td width="<%=width%>px"><%=(ri-20)%></td>
			<%
		}
		else{
			%>
			<td width="<%=width%>px"><%=(ri-30)%></td>
			<%
		}
	}
	rs.close();
	ps.close();


	%>
	</TR>


	<%

	int rwxh=0;
	int row=0;
	String rwbm=null;
	String rwmc=null;

	java.sql.Date jhkssj=null;
	java.sql.Date jhjssj=null;
	int jhgzr=0;
	String sjkssj="";
	String sjjssj="";
	int sjgzr=0;
	ls_sql="select rwxh,rwbm,rwmc,jhkssj,jhjssj,jhgzr,sjkssj,sjjssj,sjgzr ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwxh=rs.getInt("rwxh");
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));

		jhkssj=rs.getDate("jhkssj");
		jhjssj=rs.getDate("jhjssj");
		jhgzr=rs.getInt("jhgzr");
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjgzr=rs.getInt("sjgzr");

		row++;


		int start=0;
		ls_sql="select count(*)";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<?";
		if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2�����ղ���ʩ��
		{
			ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
		}
		ls_sql+=" order by rq";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,jhkssj);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			start=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int len=0;
		ls_sql="select count(*)";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1���ڡ����ղ���ʩ��
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2�����ղ���ʩ��
		{
			ls_sql+=" and jjrlx not in('3','8')";//1��������2�����գ�3�����գ�8��������9���ǽڼ���
		}
		ls_sql+=" order by rq";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,jhkssj);
		ps1.setDate(2,jhjssj);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			len=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		%>
		<tr align="center"  > 
		<td rowspan="2"><%=row%></td>
		<td rowspan="2"><%=rwmc%></td>
		<td rowspan="2"><%=jhgzr%></td>
		<td rowspan="2"><%=cf.fillHtml(jhkssj)%></td>
		<td rowspan="2"><%=cf.fillHtml(jhjssj)%></td>
		<td >�ƻ�</td>
		<td align="left" valign="middle" colspan="<%=rqzl%>" >
			<%
			if (len==0)
			{
				%>
				&nbsp;
				<%
			}
			else{
				if (start==0)
				{
					%>
					<image  border="0" src="/images/bar2.gif" height='5px' width='<%=(len*width-2)%>px'>
					<%
				}
				else{
					%>
					<image src="/images/bar1.gif" height='5px' border="0" width='<%=(start*width-2)%>px'><image  border="0" src="/images/bar2.gif" height='5px' width='<%=(len*width-2)%>px'>
					<%
				}
			}
			%>
		</td>

		</tr>
		<%

		%>
		<tr align="center"  > 
		<td  >ʵ��</td>
		<td align="left" colspan="<%=rqzl%>">&nbsp;</td>
		</tr>
		<%
		
		
	}
	rs.close();
	ps.close();


%>

  <div   id="a"   style="position:absolute;font-size:9pt;display:none;border:1px   solid   black;background:lightyellow">   </div>   
</table>
</td></tr>
 </table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<script>   

    
  //ҳ����Ԫ�ص�onmouseover�¼��Ĵ�����   

//document.onmousemove=function()
document.onmouseover=function()
{   
	if(event.srcElement.hint) 
	{   
		a.style.display="block";   
		a.innerHTML=event.srcElement.hint;   
		a.style.left=window.event.clientX+10;   
		a.style.top=window.event.clientY+10;   
		setTimeout("a.style.display='none'",800000);   
	}
	else{   
		a.style.display="none"   
	}   
} 

</script>   
