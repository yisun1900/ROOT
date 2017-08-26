<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,webservice.bean.*,java.util.*,org.apache.axis.client.Call,org.apache.axis.client.Service,java.text.SimpleDateFormat,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*' %>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String psdh=cf.GB2Uni(request.getParameter("psdh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double pszsl = 0;
double pszje = 0;

try {
	conn=cf.getConnection();

	String khbh="";
	String pszt="";
	ls_sql=" SELECT khbh,pszt FROM cl_psd where (psdh='"+psdh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh = rs.getString("khbh");
		pszt = rs.getString("pszt");
	}
	rs.close();
	ps.close();
	if (!pszt.equals("1"))//1：未提交；2：已提交；3：已配送
	{
		out.println("错误!已提交");
		return;
	}

	double wdzgce = 0;
	double zjxje = 0;
	ls_sql=" SELECT wdzgce,zjxje FROM crm_khxx where (khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		wdzgce = rs.getDouble("wdzgce");
		zjxje = rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();

	double phzje = 0;
	ls_sql=" SELECT sum(psje) ";
	ls_sql+=" FROM cl_psd,cl_psdmx ";
	ls_sql+=" where cl_psd.psdh=cl_psdmx.psdh and cl_psd.khbh='"+khbh+"' and lx='1'";//1：配货；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		phzje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double thzje = 0;
	ls_sql=" SELECT sum(psje) ";
	ls_sql+=" FROM cl_psd,cl_psdmx ";
	ls_sql+=" where cl_psd.psdh=cl_psdmx.psdh and cl_psd.khbh='"+khbh+"' and lx='2'";//1：配货；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		thzje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	// 配送比例公式应调整为：（配送累计金额－退货累计金额）/工程费，其中工程费＝合同原造价＋增减项折前造价

	double psbl=cf.round((phzje-thzje)*100/(wdzgce+zjxje),1);


	if (psbl>25 || psbl<18)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		//alert("材料配送比例提醒！当前配送比例<%=psbl%>%，合同原造价＋增减项折前造价『<%=(wdzgce+zjxje)%>』，配送累计金额－退货累计金额『<%=(phzje-thzje)%>』");
		//window.close();
		//-->
		</SCRIPT>
		<%
	}


	ls_sql=" SELECT sum(pssl),sum(psje) FROM cl_psdmx where (psdh='"+psdh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pszsl = rs.getDouble(1);
		pszje = rs.getDouble(2);
	}
	rs.close();
	ps.close();

/*******************************************************************************\
|		提交时初始化审核总数量，审核中金额为出库总数量，出库总金额						|
\*******************************************************************************/
String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String dh=null;
String psfs=null;
String lrsj=null;
String zjxm=null;
String sgbz=null;
String dh2=null;
String bjjbmc=null;
String lx="";

double yf=0;
double qtsf=0;

	java.util.Date date=new java.util.Date();
	String bz=null;
	String lrr=null;
	ls_sql="SELECT cl_psd.lrr,cl_psd.lx,hth,zjxm,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh dh,DECODE(psfs,'1','配送','2','自提','9','其他') psfs,cl_psd.lrsj,pszje,yf,qtsf,sgbz,sq_bzxx.dh dh2,bjjbmc,cl_psd.bz  ";
	ls_sql+=" FROM cl_psd,crm_khxx,sq_sgd,sq_bzxx,bdm_bjjbbm ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=cl_psd.khbh(+) and  crm_khxx.sgd=sq_bzxx.sgd(+)";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and cl_psd.psdh='"+psdh+"' ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	
	if (rs.next())
	{
		lrr=cf.fillNull(rs.getString("lrr"));
		lx=cf.fillNull(rs.getString("lx"));
		hth=cf.fillNull(rs.getString("hth"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dh=cf.fillNull(rs.getString("dh"));
		dh2=cf.fillNull(rs.getString("dh2"));
		psfs=cf.fillNull(rs.getString("psfs"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		//pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
		sgbz=cf.fillNull(rs.getString("sgbz"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

//	out.println(bjjbmc);
		
	ls_sql="SELECT count(*)  ";
	ls_sql+=" FROM cl_psdmx ";
	ls_sql+=" where  cl_psdmx.psdh='"+psdh+"' ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	int m=0;
	if (rs.next())
	{
		m=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (lx.equals("1"))
	{
		MtrRequestDetail[] mrds=new MtrRequestDetail[m];	//要货明细

		ls_sql="SELECT clbm,pssl  ";
		ls_sql+=" FROM cl_psdmx ";
		ls_sql+=" where  cl_psdmx.psdh='"+psdh+"' ";
		//out.print(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		int i=0;
		String MtrId="";
		while (rs.next())
		{
			MtrRequestDetail obj=new MtrRequestDetail();
			MtrId=rs.getString(1).replace(" ","");
			//long c = Long.parseLong(MtrId);
			obj.setMtrId(MtrId);
			obj.setMrqNum(rs.getDouble(2));
			//obj.setRemark("");
			mrds[i]=obj;
			i++;
		}
		rs.close();
		ps.close();


		SimpleDateFormat sdf  =   new  SimpleDateFormat("yyyy-MM-dd");
		//java.util.Date yfksj = sdf.parse(yfksj2);
		long mrqId=0;//要货编号
		String contractId=hth;  //订单编号
		java.util.Date planDate = new java.util.Date();// 要货日期

		java.util.Date delvDate=null;// 要求交付日期
		if (!lrsj.equals(""))
		{

			delvDate=sdf.parse(lrsj);// 要求交付日期
		}

//		out.println(contractId);



		String reqUser=lrr;// 要货人员
		String contactUser=sgbz;// 联系人员
		String contactPhone=dh;//联系电话
		String delvAddr=fwdz;	//送货地址
		String remark=bz;	//要货描述

		//MtrRequestDetail[] mrds;	//要货明细
		 MtrRequest mtrRequest=new MtrRequest();
		 mtrRequest.setContractId(contractId);
		 mtrRequest.setMrqId(mrqId);
		 mtrRequest.setPlanDate(planDate);
		 mtrRequest.setDelvDate(delvDate);
		 mtrRequest.setReqUser(reqUser);
		 mtrRequest.setContactUser(contactUser);
		 mtrRequest.setContactPhone(contactPhone);
		 mtrRequest.setDelvAddr(delvAddr);
		 mtrRequest.setRemark(remark);
		 mtrRequest.setMrds(mrds);


		String url = cf.getValue("kb_url");

		Service service = new Service();
		Call call;
		call = (Call) service.createCall();

		call.setTargetEndpointAddress(new java.net.URL(url) );
		QName qn = new QName("urn:BeanService", "MtrRequestDetail");
		call.registerTypeMapping(MtrRequestDetail.class, qn, new BeanSerializerFactory(MtrRequestDetail.class, qn), 
			new BeanDeserializerFactory(MtrRequestDetail.class, qn));

		qn = new QName("urn:BeanService", "MtrRequest");
		call.registerTypeMapping(MtrRequest.class, qn, new BeanSerializerFactory(MtrRequest.class, qn), 
			new BeanDeserializerFactory(MtrRequest.class, qn));
		call.setOperationName(new QName("MtrRequest", "newMtrRequest"));


		String res = "";
		res =  call.invoke(new Object[]{mtrRequest}).toString();
	}

	ls_sql="update cl_psd set pszt='2',pszsl="+pszsl+",pszje="+pszje;
	ls_sql+=" where  (psdh='"+psdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
	
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提交成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
//	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>