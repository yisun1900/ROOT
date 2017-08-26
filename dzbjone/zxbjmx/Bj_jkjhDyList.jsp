<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
//把主材按房间显示数量
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String khxm=null;
String qyrq=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String clgw=null;
int fwmj=0;

String bjbbh=null;
String dqbm =null;
String hxbm =null;
String bjjbmc  =null;
String bjjbbm  =null;
String ysshr="";
String ysshbz="";

try {
	conn=cf.getConnection();

	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	   
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		qydmbh=cf.fillNull(rs.getString("zxdm"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		
	}
	rs.close();
	ps.close();
	
	//查询签约店面
	ls_sql="SELECT qyrq from crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs,fwmj";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
	}
	rs.close();
	ps.close();


%>
<body >

<TABLE border="0" cellspacing="0" cellpadding="0" width="100%" cellspacing="0 style='FONT-SIZE: 14px'">

<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" align="center" class="STYLE2" ><p align="center"><b>松下亿达健康套餐选购合同</b></p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="50%" >顾客姓名：<%=khxm%></td>
    <td width="35%" >顾客电话：<%=lxfs%></td>
    <td width="28%" >签约日期:<%=qyrq%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td width="50%" >送货地址：<%=fwdz%></td>
	<td width="35%" ></td>
	<td width="28%" >送货日期:</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="3" ><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">为方便顾客正确选择家具套餐产品、减少纠纷、维护您的合法权益，针对家具套餐选购过程中大家比较关注的问题，进行如下特别说明和约定，请您在签订协议之前仔细阅读下列内容：<br><b>1.环保问题。</b>由于家具的生产是执行《室内装饰装修材料木家具中有害物质限量》标准，而室内空气质量执行《室内空气质量标准》，两个标准的制订部门不同，中间又缺乏有效的衔接，因此根据家具的环保标准生产的合格家具在搬到居室后，由于叠加效应的影响，按《室内空气质量标准》检测，结论有可能是空气质量超标。松下亿达从维护您的健康的角度出发，提醒您一是要尽可能选购标准化家具，二是单位房间内摆放的家具要适量，三是即便出现上述情况也不要惊慌，在家具送货验收之后180日内可以退换。<br>
	<b>2. 色差问题。</b>家具的实木贴面略有色差属正常现象，一般不属于质量问题；石材是天然生长材料，自然色差、不同纹理、正常纹裂与拼接是不可避免的，一般不属于质量问题；皮及皮革制品等不同批次的产品略有色差也属正常现象，一般不属于质量问题。<br>
	<b>3. 货款及验货。</b>顾客必须在送货之前付清全部货款及相关费用，否则松下亿达有权拒绝送货，由此造成的延期责任由顾客承担；送货时，顾客需现场验货签收，签收后出现商品数量短少或破损等问题，松下亿达及家具厂家不再承担任何责任。<br><b>4. 非质量问题换货退货。</b><br>&nbsp;&nbsp;&nbsp;&nbsp;4.1在商品验收后一个月内，在商品无任何损坏、不影响二次销售的情况下，顾客由于喜好等原因发生变化，可以要求换货退货（定制商品和专门为甲方订购的进口产品除外）；<br>&nbsp;&nbsp;&nbsp;&nbsp;4.2 家具套餐不可退单品，如需退货必须整套退货；退货必须通过松下亿达，直接退给厂家无法退还货款；<br>&nbsp;&nbsp;&nbsp;&nbsp;4.3 非质量问题退换货所产生的安装费用、往返运输费用和重新包装的费用由顾客承担，其中，运费参照本市搬家公司的费用标准，最高不超过________元；包装费按货款的3%计算，最高不超过_________元。<br><b>5. 家具“三包”规定（定制商品除外）。</b><br>&nbsp;&nbsp;&nbsp;&nbsp;5.1 家具三包有效期为一年。即90日内出现严重质量问题，甲方可以选择免费修理、换货或退货；180日内出现严重质量问题，甲方可以选择免费修理或换货；三包有效期余下的时间内出现质量问题，乙方负责免费修理。<br>&nbsp;&nbsp;&nbsp;&nbsp;5.2 定制家具的标准配件部分，遵照国家或行业“三包”规定执行；非标准配件部分出现质量问题，原则上只能修理而不能退换；只有在修理后仍无法恢复其正常功能情况下才予以退换。<br><b>6. 违约责任。</b><br>&nbsp;&nbsp;&nbsp;&nbsp;6.1在顾客按本合同约定支付货款及相关费用后，家具厂家未按期送货或完成安装，每延迟一天按已付货款的6‰向顾客支付违约金；超过15天，顾客有权终止本合同，松下亿达除返还顾客已付货款外，还须按本协议已付货款的30%赔偿顾客违约金。<br>&nbsp;&nbsp;&nbsp;&nbsp;6.2本协议内涉及到的商品产生延期责任的，以本协议约定为准，松下亿达不按照《家庭居室装饰装修工程施工合同》约定的延期责任进行赔付。<br>&nbsp;&nbsp;&nbsp;&nbsp;6.3未与顾客协商一致，松下亿达单方面解除本协议的，松下亿达除全额返还顾客已付货款外，还须按已付货款的50%支付违约金。<br>&nbsp;&nbsp;&nbsp;&nbsp;6.4超过本协议第4条非质量问题一个月内自由退换的期限，若非商品本身质量问题，原则上不予以换货退货；若甲方坚持换货退货，则顾客要赔偿松下亿达由此产生的损失，且赔付的金额不能低于货款金额的10%；顾客超过协议约定的送货时间6个月而未提货或不给松下亿达提供送货条件的，松下亿达有权单方面终止协议，顾客须按货款金额的10%承担违约金。<br><b>7. 纠纷解决程序.</b>商品出现质量或服务问题，松下亿达予以协调解决；顾客对松下亿达的处理意见不满意，可以向松下亿达所在地人民法院提起诉讼或到仲裁机构申请仲裁，松下亿达将根据法院判决结果或仲裁机构的仲裁意见向甲方进行赔付。<br>&nbsp;&nbsp;&nbsp;&nbsp;选购家具套餐明细如下，此合同经松下亿达盖章、顾客签字后生效，顾客按合同金额交齐全款后，松下亿达安排家具送货并安装：</font><br>
	</td>
	</tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="15%" >套餐名称</td>
    <td  width="8%" >价格</td>
    <td  width="15%" >产品名称</td>
    <td  width="15%" >品牌</td>
    <td  width="20%" >型号</td>
	<td  width="15%" >规格</td>
    <td  width="6%" >单位</td>
    <td  width="6%" >数量</td>
  </tr>

	
<%
	int i=0;
	String tcbm=null;
	String tcmc=null;
	double yj=0;
	double tcj=0;
	double alltcj=0;
	String bz=null;
	ls_sql="SELECT tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmc ";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and lx='2' ";//1：家具套餐；2：健康计划
	ls_sql+=" order by tcbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		yj=rs.getDouble("yj");
		tcj=rs.getDouble("tcj");
		bz=cf.fillHtml(rs.getString("bz"));

		alltcj+=tcj;

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)
		{
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=tcmc%></td>
				<td ><%=tcj%></td>
				<td colspan="6" align="left"><B>未选择主材</B></td>
			  </tr>
			<%
			continue;
		}

		String cpbm=null;
		String cpmc=null;
		String ppmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		ls_sql="SELECT cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ls_sql+=" order by cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>未选择主材</B></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td rowspan="<%=count%>"><%=tcmc%></td>
					<td rowspan="<%=count%>"><%=tcj%></td>
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}


		}

		while (rs1.next())
		{
			cpbm=rs1.getString("cpbm");
			cpmc=rs1.getString("cpmc");
			ppmc=rs1.getString("ppmc");
			xh=cf.fillNull(rs1.getString("xh"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldw=rs1.getString("jldw");
			sl=rs1.getDouble("sl");

			if (sl==0)
			{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td colspan="5" align="left"><B>未选择主材</B></td>
				  </tr>
				<%
			}
			else{
				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td><%=cpmc%></td>
					<td><%=ppmc%></td>
					<td><%=xh%></td>
					<td><%=gg%></td>
					<td><%=jldw%></td>
					<td><%=cf.formatDouble(sl)%></td>
				  </tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td><B>小 计</B></td>
	<td><B><%=alltcj%></B></td>
	<td><B>大 写</B></td>
	<td colspan="5"><b><font size="2"><%=cf.NumToRMBStr(alltcj)%>;<font></b></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td colspan="3" height="42"><strong><font size="3">注：本合同一式叁份，顾客执一份，松下亿达执贰份。</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
    <td width="50%"><strong><font size="3">顾客签字：<font></strong></td>
    <td width="50%"><strong><font size="3">松下亿达（盖章）： <font></strong><br>
    <strong><font size="3">松下亿达委托代理人： <font></strong><br>
    <strong><font size="3">设计师签字： <font></strong></td>
    </tr>
</table>

</td></tr>
</TBODY>

</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






