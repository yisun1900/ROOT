<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE5 {color: #000099; font-weight: bold; }
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double gcze=0;
double wdzgce=0;
double qye=0;
double zqsuijin=0;
double suijin=0;
double zqguanlif=0;
double guanlif=0;
double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;
double sfke=0;
double zjxssk=0;
double gczxzq=0;
double gcjxzq=0;

double gcjse=0;
double kzbjbl=3;
double zqje=0;
double jsbl=63;
double jsje=0;

double zjxbcbl=20;
double bzjsje=0;
double kzb=0;


double clfk=0;//材料评审处罚
double llje=0;//库房领料金额
double clyf=0;//材料运费
double yfgck=0;//已付工程款
double xcyxfy=0;//现场营销费用
double ykgccf=0;//已扣工程处罚
double bzybfje=0;//班长应拨付金额
double dzybfje=0;//队长应拨付金额
double gcsfje=0;//工程实付金额

double jzsqk=0;
double jzzqk=0;
double jzssk=0;
double sskbl=0;

double zqgczjf=0;
double zhgczjf=0;
double zjxje=0;
double zqsjgck=0;
double zhsjgck=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,qye,suijin,guanlif,zhzjxje,zjxsuijin,zjxguanlif,sfke,zjxssk";
	ls_sql+=" ,wdzgce,zqsuijin,zqguanlif,zqgczjf,zhgczjf,zjxje ";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zjxje=rs.getDouble("zjxje");
		wdzgce=rs.getDouble("wdzgce");
		zqsuijin=rs.getDouble("zqsuijin");
		zqguanlif=rs.getDouble("zqguanlif");

		
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		guanlif=rs.getDouble("guanlif");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		sfke=rs.getDouble("sfke");
		zjxssk=rs.getDouble("zjxssk");

		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	zqsjgck=zqgczjf+zjxje;
	zhsjgck=zhgczjf+zhzjxje;

	gcze=wdzgce-zqsuijin-zqguanlif;
	gcze=cf.round(gcze,2);

	if (!gdjsjd.equals("7"))//7：交齐完工结算资料
	{
		out.println("错误！结算进度不正确");
		return;
	}

	ls_sql="select sum(gczxzq),sum(gcjxzq) ";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"' and sfwc='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczxzq=rs.getDouble(1);
		gcjxzq=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	gcjse=gcze+gczxzq-gcjxzq;
	gcjse=cf.round(gcjse,2);

	jsje=gcjse*jsbl/100;
	jsje=cf.round(jsje,2);


	kzb=gcjse*kzbjbl/100;
	kzb=cf.round(kzb,2);

	//已付工程款
	ls_sql="select sum(jsje) ";
	ls_sql+=" from  cw_sgdzqjsjlKB";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//材料费
	ls_sql="select sum(pszje)";
	ls_sql+=" from  cl_psd";
	ls_sql+=" where cl_psd.khbh='"+khbh+"'";
	ls_sql+=" and cl_psd.pszt!='1' and cl_psd.lx='1'";//1：配货；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		llje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(pszje)";
	ls_sql+=" from  cl_psd";
	ls_sql+=" where cl_psd.khbh='"+khbh+"'";
	ls_sql+=" and cl_psd.pszt!='1' and cl_psd.lx='2'";//1：配货；2：退货
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		llje=llje-rs.getDouble(1);
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdwgjsjlKB";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_sgdwgjsjlkb.jsp" name="insertform" target="_blank">
<div align="center">施工队完工结算</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCFF"> 
  <td  width="15%"  align="center">合同号</td>
  <td  width="10%"  align="center">款项用途</td>
  <td  width="14%"  align="center">付款方式</td>
  <td  width="8%"  align="center">收款金额</td>
  <td  width="10%" align="center">收款日期</td>
  <td align="center">备注</td>
</tr>
<%
 //从松下亿达系统取家装实收款金额
	
	String contractId=null;
	String custId=request.getParameter("khbh");
	String orderId=hth;  //订单编号
	double allamount=0;
	
	Pay pay=new Pay();

	Double amount=0.0;// 收款金额
	java.util.Date payTime;// 收款日期
	String payType;// 付款方式
	String billNo;// 票据编号
	String payForUse;// 款项用途
	String remark;// 备注信息
	String person;// 录入人
	Date time;// 录入时间

	DateFormat f1;
	f1 = DateFormat.getDateInstance();
	

	
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
		 payTime=obj[i].getPayTime();// 收款日期
		 payForUse=obj[i].getPayForUse();// 款项用途
		 remark=obj[i].getRemark();// 备注信息
		 payType=obj[i].getPayType();// 付款方式

		 if (payForUse.equals("家装设计费"))
		 {
			 continue;
		 }

		 allamount=allamount+amount;

		 if (payForUse.equals("家装首期款") && !payType.equals("松下亿达优惠券付款") && !payType.equals("建材城优惠券付款"))
		 {
			 jzsqk+=amount;
		 }
		 if (payForUse.equals("家装中期款") && !payType.equals("松下亿达优惠券付款") && !payType.equals("建材城优惠券付款"))
		 {
			 jzzqk+=amount;
		 }

		%>
		<tr bgcolor="#CCCCFF"> 
		  <td align="center"><%=orderId%></td>
		  <td align="center"><%=payForUse%> </td>
		  <td align="center"><%=payType%> </td>
		  <td align="center"><%=amount%> </td>
		  <td align="center"><%=f1.format(payTime)%> </td>
		  <td align="center"><%=remark%> </td>
		</tr>
		<%
	}
					 
	jzssk=allamount;

	if (qye==0)
	{
		sskbl=0;
	}
	else{
		sskbl=cf.round(jzssk*100/qye,2);
	}

	zqje=jzzqk;

	jsje=cf.round(zqje*jsbl/100*0.88,2);
 //取家装款结束
 %>
 </table>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">结算记录号</td>
	<td  width="5%">结算日期</td>
	<td  width="6%">结算金额</td>
	<td  width="4%">结算比例</td>
	<td  width="6%">中期款</td>
	<td  width="13%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT cw_sgdzqjsjlkb.jsjlh,cw_sgdzqjsjlkb.jsrq,cw_sgdzqjsjlkb.jsje,cw_sgdzqjsjlkb.jsbl||'%',cw_sgdzqjsjlkb.jskjs,cw_sgdzqjsjlkb.bz  ";
	ls_sql+=" FROM cw_sgdzqjsjlkb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_sgdzqjsjlkb.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lx='2'";//2:松下亿达中期结算
    ls_sql+=" and cw_sgdzqjsjlkb.khbh='"+khbh+"'";

	ls_sql+=" order by cw_sgdzqjsjlkb.jsrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

//设置列超级连接
	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();

%>
 </table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">开工日期</span></td>
    <td><%=sjkgrq%></td>
    <td align="right"><span class="STYLE2">竣工日期</span></td>
    <td><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同总额（折前）</font></td>
    <td><%=wdzgce%></td>
    <td align="right"><font color="#0000FF">合同总额（</font>折后<font color="#0000FF">）</font></td>
    <td><%=qye%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">工程合同额（折前）</font></td>
    <td><%=zqgczjf%></td>
    <td align="right"><font color="#0000FF">工程合同额（</font>折后<font color="#0000FF">）</font></td>
    <td><%=zhgczjf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">工程增减项（折前）</font></td>
    <td><%=zjxje%></td>
    <td align="right"><font color="#0000FF">工程增减项（</font>折后<font color="#0000FF">）</font></td>
    <td><%=zhzjxje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">实际工程款（折前）</font></td>
    <td><%=zqsjgck%></td>
    <td align="right"><font color="#0000FF">实际工程款（</font>折后<font color="#0000FF">）</font></td>
    <td><%=zhsjgck%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">家装首期款</span></td>
    <td><%=jzsqk%></td>
    <td align="right"><span class="STYLE2">家装中期款</span></td>
    <td><%=jzzqk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE4">累计家装实收款</span></td>
    <td><%=jzssk%></td>
    <td align="right"><span class="STYLE4">实收款比例</span></td>
    <td><%=sskbl%>%</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE2">结算记录号</span></td> 
  <td width="31%" bgcolor="#E8E8FF"> 
    <input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>  </td>
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE2">客户编号</span></td> 
  <td width="31%" bgcolor="#E8E8FF"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE2">施工队</span></td> 
  <td width="31%" bgcolor="#E8E8FF"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select>  </td>
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE2">现场负责人</span></td> 
  <td width="31%" bgcolor="#E8E8FF"> 
    <input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>合同金额</td> 
  <td width="31%" bgcolor="#E8E8FF"><input type="text" name="htje" value="<%=wdzgce%>" size="20" maxlength="17" readonly></td>
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>扣除税金管理费工程额</td> 
  <td width="31%" bgcolor="#E8E8FF"><input name="gcze" type="text" id="gcze" value="<%=gcze%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>税金</td> 
  <td width="31%" bgcolor="#E8E8FF"> 
    <input type="text" name="suijin" value="<%=zqsuijin%>" size="20" maxlength="17" readonly>  </td>
  <td width="19%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>管理费</td> 
  <td width="31%" bgcolor="#E8E8FF"> 
    <input type="text" name="glf" value="<%=zqguanlif%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>折前工程增项金额</td>
  <td bgcolor="#E8E8FF"><input name="gczxzq" type="text" id="gczxzq" value="<%=gczxzq%>" size="20" maxlength="17" readonly></td>
  <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>折前工程减项金额</td>
  <td bgcolor="#E8E8FF"><input name="gcjxzq" type="text" id="gcjxzq" value="<%=gcjxzq%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE5">工程结算额</span></td>
  <td colspan="3" bgcolor="#E8E8FF"><input type="text" name="gcjse" value="<%=gcjse%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">工程结算额＝扣除税金管理费工程额＋折前工程增项金额―折前工程减项金额</span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span>承包结算比例</td>
  <td bgcolor="#E8E8FF"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
%</td>
  <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">*</span><span class="STYLE5">结算总额</span></td>
  <td bgcolor="#E8E8FF"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td colspan="3" bgcolor="#E8E8FF"><span class="STYLE5">结算金额＝工程结算额×承包结算比例</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>应扣质保金比例</td> 
  <td width="31%" bgcolor="#FFFFCC"><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="17" onChange="f_jsje(insertform)">
  %</td>
  <td width="19%" align="right" bgcolor="#FFFFCC">&nbsp;</td> 
  <td width="31%" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>扣质保金</td>
  <td colspan="3" bgcolor="#FFFFCC"><input type="text" name="kzb" value="<%=kzb%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">扣质保金=工程结算额×应扣质保金比例</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>工程管理处罚</td> 
  <td width="31%" bgcolor="#FFFFCC"><input type="text" name="gcglfk" value="" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td width="19%" align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>工程其它处罚</td> 
  <td width="31%" bgcolor="#FFFFCC"><input type="text" name="gcqtfk" value="" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="19%" align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span><span class="STYLE5">结算应付金额</span></td> 
  <td colspan="3" bgcolor="#FFFFCC"><input type="text" name="jsyfje" value="" size="20" maxlength="17" readonly>
    <span class="STYLE5">结算应付金额＝结算总额－扣质保金－工程管理处罚－工程其它处罚</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>材料评审处罚</td>
  <td bgcolor="#FFFFCC"><input type="text" name="clfk" size="20" maxlength="17"  value="<%=clfk%>" onChange="f_jsje(insertform)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>库房领料金额</td>
  <td bgcolor="#FFFFCC"><input type="text" name="llje" size="20" maxlength="17"  value="<%=llje%>" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>已付工程款</td>
  <td bgcolor="#FFFFCC"><input type="text" name="yfgck" size="20" maxlength="17"  value="<%=yfgck%>" onChange="f_jsje(insertform)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>已扣工程处罚</td>
  <td bgcolor="#FFFFCC"><input name="ykgccf" type="text" onChange="f_jsje(insertform)" size="20" maxlength="17"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>其它扣款</td>
  <td bgcolor="#FFFFCC"><input name="qtkk" type="text" onChange="f_jsje(insertform)" size="20" maxlength="17"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>现场营销费用</td>
  <td bgcolor="#FFFFCC"><input type="text" name="xcyxfy" size="20" maxlength="17"  value="<%=xcyxfy%>" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>材料运费</td>
  <td bgcolor="#FFFFCC"><input type="text" name="clyf" size="20" maxlength="17"  value="<%=clyf%>" onChange="f_jsje(insertform)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE5"><span class="STYLE1">*</span>工程实付金额</span></td>
  <td bgcolor="#FFFFCC"><input type="text" name="gcsfje" size="20" maxlength="17"  value="<%=gcsfje%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFFCC"><span class="STYLE5">工程实付金额＝结算应付金额－材料评审处罚－库房领料金额－已付工程款＋已扣工程处罚-其它扣款-现场营销费用-材料运费</span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFFF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><span class="STYLE1">*</span>结算日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input name="button" type="button" onClick="window.open('ViewCw_sgdwgjsjlkb.jsp?jsjlh=<%=jsjlh%>')"  value="打印">
	<input name="button2" type="button" onClick="window.open('ViewExcelCw_sgdwgjsjlkb.jsp?jsjlh=<%=jsjlh%>')"  value="Excel"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)
{
	var jsje=0;
	jsje=FormName.gcjse.value*FormName.jsbl.value/100;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;
	
	var kzb=0;
	kzb=FormName.gcjse.value*FormName.kzbjbl.value/100;
	kzb=round(kzb,2);
	FormName.kzb.value=kzb;
	
	//结算应付金额＝结算总额－扣质保金－工程管理处罚－工程其它处罚
	var jsyfje=0;
	jsyfje=FormName.jsje.value*1.0-FormName.kzb.value*1.0-FormName.gcglfk.value*1.0-FormName.gcqtfk.value*1.0;
	jsyfje=round(jsyfje,2);
	FormName.jsyfje.value=jsyfje;

	//工程实付金额＝结算应付金额－材料评审处罚－库房领料金额－已付工程款+已扣工程处罚-其它扣款-现场营销费用-材料运费
	var gcsfje=0;
	gcsfje=FormName.jsyfje.value*1.0-FormName.clfk.value*1.0-FormName.llje.value*1.0-FormName.yfgck.value*1.0+FormName.ykgccf.value*1.0-FormName.qtkk.value*1.0-FormName.xcyxfy.value*1.0-FormName.clyf.value*1.0;
	gcsfje=round(gcsfje,2);
	FormName.gcsfje.value=gcsfje;

}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}

	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[结算日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("请输入[合同金额]！");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.focus();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[管理费]！");
		FormName.glf.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.gczxzq)=="") {
		alert("请输入[工程增项]！");
		FormName.gczxzq.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzq, "工程增项"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxzq)=="") {
		alert("请输入[工程减项]！");
		FormName.gcjxzq.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzq, "工程减项"))) {
		return false;
	}

	if(	javaTrim(FormName.gcjse)=="") {
		alert("请输入[工程结算额]！");
		FormName.gcjse.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjse, "工程结算额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[承包结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "承包结算比例"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[结算金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算金额"))) {
		return false;
	}


	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("请输入[应扣质保金比例]！");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "应扣质保金比例"))) {
		return false;
	}
	if(	javaTrim(FormName.kzb)=="") {
		alert("请输入[扣质保金]！");
		FormName.kzb.focus();
		return false;
	}
	if(!(isFloat(FormName.kzb, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.gcglfk)=="") {
		alert("请输入[工程管理处罚]！");
		FormName.gcglfk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcglfk, "工程管理处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.gcqtfk)=="") {
		alert("请输入[工程其它处罚]！");
		FormName.gcqtfk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcqtfk, "工程其它处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyfje)=="") {
		alert("请输入[结算应付金额]！");
		FormName.jsyfje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyfje, "结算应付金额"))) {
		return false;
	}


	if(	javaTrim(FormName.clfk)=="") {
		alert("请输入[材料评审处罚]！");
		FormName.clfk.focus();
		return false;
	}
	if(!(isFloat(FormName.clfk, "材料评审处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.llje)=="") {
		alert("请输入[库房领料金额]！");
		FormName.llje.focus();
		return false;
	}
	if(!(isFloat(FormName.llje, "库房领料金额"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgck)=="") {
		alert("请输入[已付工程款]！");
		FormName.yfgck.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgck, "已付工程款"))) {
		return false;
	}

	if(	javaTrim(FormName.ykgccf)=="") {
		alert("请输入[已扣工程处罚]！");
		FormName.ykgccf.focus();
		return false;
	}
	if(!(isFloat(FormName.ykgccf, "已扣工程处罚"))) {
		return false;
	}
	if(	javaTrim(FormName.qtkk)=="") {
		alert("请输入[其它扣款]！");
		FormName.qtkk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtkk, "其它扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.xcyxfy)=="") {
		alert("请输入[现场营销费用]！");
		FormName.xcyxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.xcyxfy, "现场营销费用"))) {
		return false;
	}
	if(	javaTrim(FormName.clyf)=="") {
		alert("请输入[材料运费]！");
		FormName.clyf.focus();
		return false;
	}
	if(!(isFloat(FormName.clyf, "材料运费"))) {
		return false;
	}

	if(	javaTrim(FormName.gcsfje)=="") {
		alert("请输入[工程实付金额]！");
		FormName.gcsfje.focus();
		return false;
	}
	if(!(isFloat(FormName.gcsfje, "工程实付金额"))) {
		return false;
	}
	
	
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
