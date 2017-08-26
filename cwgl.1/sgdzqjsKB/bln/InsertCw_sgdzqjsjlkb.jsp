<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {
	color: #990033;
	font-weight: bold;
}
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

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double wdzgce=0;
double qye=0;
double zqgczjf=0;
double zhgczjf=0;
double zjxje=0;
double zhzjxje=0;

double zqsjgck=0;
double zhsjgck=0;

double jzsqk=0;
double jzzqk=0;
double jzssk=0;
double sskbl=0;


double zqje=0;
double jsbl=50;
double jsje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,qye,zqgczjf,zhgczjf,zjxje,zhzjxje";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
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


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("1"))//1:交齐中期结算资料
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}

	zqsjgck=zqgczjf+zjxje;
	zhsjgck=zhgczjf+zhzjxje;

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


	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdzqjsjlKB";
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
<form method="post" action="SaveInsertCw_sgdzqjsjlkb.jsp" name="insertform" >
<div align="center"><strong>松下亿达中期结算</strong></div>
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
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
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
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">结算记录号</span></td> 
  <td width="31%"> 
    <input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">客户编号</span></td> 
  <td width="31%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span><span class="STYLE2">施工队</span></td> 
  <td width="31%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select>  </td>
  <td align="right" width="19%"><span class="STYLE2">现场负责人</span></td> 
  <td width="31%"> 
    <input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>结算日期</td> 
  <td width="31%"> 
    <input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>结算款基数</td> 
  <td width="31%"> 
    <input type="text" name="jskjs" value="<%=zqje%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>结算比例</td> 
  <td width="31%"> 
    <input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %  </td>
  <td align="right" width="19%"><span class="STYLE1">*</span>结算金额</td> 
  <td width="31%"> 
    <input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" >  </td>
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
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	var jsje=0;//材料费
	jsje=FormName.jskjs.value*FormName.jsbl.value/100*0.88;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;
}

function f_do(FormName)//参数FormName:Form的名称
{
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
/*
	if(	javaTrim(FormName.sgbz)=="") {
		alert("请输入[现场负责人]！");
		FormName.sgbz.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[结算日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jskjs)=="") {
		alert("请输入[结算款基数]！");
		FormName.jskjs.focus();
		return false;
	}
	if(!(isFloat(FormName.jskjs, "结算款基数"))) {
		return false;
	}
	if (parseFloat(FormName.jskjs.value)==0)
	{
		alert("错误！[结算款基数]不能为0");
		FormName.jskjs.select();
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}
	if (parseFloat(FormName.jsbl.value)==0)
	{
		alert("错误！[结算比例]不能为0");
		FormName.jsbl.select();
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
