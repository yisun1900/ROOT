<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");

String jc_zcdd_htshsj="";
String jc_zcdd_jkxz="";
String jc_zcdd_jkdd="";
String jc_zcdd_hkze="";
String jc_zcdd_bz="";
String qhtsj="";
String htshsj="";

String khxm="";
String lxfs="";
String fwdz="";
String sjs=null;
String sgd="";
String sgbz="";
String khbh=null;
String dwmc=null;
String bzdh="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select qhtsj,htshsj,khbh,htshsj,DECODE(jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出','5','退货款减出') as jkxz,";
	ls_sql+="DECODE(jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款') as jkdd,hkze,bz";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		jc_zcdd_htshsj=cf.fillNull(rs.getDate("htshsj"));
		jc_zcdd_jkxz=cf.fillNull(rs.getString("jkxz"));
		jc_zcdd_jkdd=cf.fillNull(rs.getString("jkdd"));
		jc_zcdd_hkze=cf.fillNull(rs.getString("hkze"));
		jc_zcdd_bz=cf.fillNull(rs.getString("bz"));   
		khbh=cf.fillNull(rs.getString("khbh"));   
		
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,lxfs,fwdz,sjs,sgd,sgbz,dwmc,lxfs";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.khbh='"+khbh+"' ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		  
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	   
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally   // 合同金额去掉了  cf.NumToRMBStr(cf.doubleTrim(jc_zcdd_hkze,0))   （￥  jc_zcdd_hkze）  
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		 if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
</head>

<body leftmargin="0" rightmargin="0" topmargin="0" >
<table width="99%" height="38" border="0">
  <tr> 
    <td><div align="center"><font size="5"><strong>北 京 居 然 之 家 装 饰 有 限 公 司
    综合机电产品代购服务合同</strong></font></div></td>
  </tr>
</table>

<table width="99%" border="0" align="left">
  <tr> 
    <td width="46%"><font size="2">甲方：<u>&nbsp;<%=khxm%>&nbsp;</u> 联系电话：<u>&nbsp;<%=lxfs%>&nbsp;</u></font></td>
    <td width="54%"><font size="2">安装地址：<u><%=fwdz%></u></font></td>
  </tr>
  <tr> 
  <td width="46%"><font size="2"> 乙方：<u>松下亿达装饰工程（大连）有限公司</u></font></td>
    
   <%-- <td width="450"><font size="2">现场组长/电话：<u><%=sgbz%><%=bzdh%></u> </font></td>--%>
   <td width="54%"><font size="2"><u>地址：北京市丰台区西三环南路甲27号松下亿达</u> </font></td>
  </tr>
  
  <tr> 
    <td colspan="2" align="left"><font size="2">乙方本着为甲方提供整体服务、节省甲方时间、替甲方监督、检查、控制产品质量和售后服务的原则，就乙方为甲方代购综合机电产品事宜，双方达成以下协议： </td>
  </tr>
  <tr valign="top"> 
    <td height="411" colspan="2"> <p><font size="2"><strong>第一条：定义:</strong></font><font size="2"><br>
&nbsp;&nbsp;&nbsp;&nbsp;除非本合同另有所指，以下定义仅限于对本合同所使用名词的解释。<br>
&nbsp;&nbsp;&nbsp;&nbsp;1、	甲方：指直接客户。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2、	乙方：松下亿达装饰工程（大连）有限公司。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3、	合同双方：指签订本合同甲方和乙方。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4、	供货商：指产品、材料的生产企业，或授权代理企业。<br>
        <strong>第二条：乙方代购服务产品的供货</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1、产品价格：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本合同产品内容及其价格：详见《松下亿达主材产品订货明细》（为附件一）。在本合同签订之日，甲方应向乙方付清上述全部产品的总价款。<br> &nbsp;&nbsp;&nbsp;&nbsp;2、	交货地点：甲、乙双方同意产品的交货地<u><%=fwdz%></u><br>
&nbsp;&nbsp;&nbsp;&nbsp;3、	送货日期：<u>&nbsp;&nbsp;&nbsp;<%=htshsj%>&nbsp;&nbsp;&nbsp;</u><br>
&nbsp;&nbsp;&nbsp;&nbsp;4、	安装日期为:<br>
&nbsp;&nbsp;&nbsp;&nbsp;<strong>备注：</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1.	1.	如果双方在签订本合同同时或之后，甲方与工程公司签订了《北京市家庭居室装饰装修工程施工合同》（以下简称“家装合同”），则本合同中产品的所有送货日期根据“家装合同”的施工进度表来供货，但因家装合同工程延误导致本合同送货或安装日期延期的，乙方对此不承担本合同项下的迟延责任，则本合同附件一中所定送货或安装时间无效。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.	2.	如果甲方与工程公司签订了“家装合同”，在家装工程开工后，双方又签订了本合同，则本合同产品所有送货或安装日期将以各项产品的送货周期和生产周期为依据来确定实际送货安装日期，不与家装工程进度同步完成。家装工程施工进度表所规定的本合同产品的入场日期视为无效，不作为本合同产品的送货日期。由此所造成家装或其它产品工期延期的，甲方不得追究乙方的延期责任。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.	运输费用<br>
&nbsp;&nbsp;&nbsp;&nbsp;A)	如果甲方订购产品金额小于人民币5000元，则甲方需承担由此产生的运输费用。如果双方约定的交货地点在北京市行政辖区以内，甲方每次应提前支付给乙方运费人民币贰百元整（￥200.00）。如果双方约定的交货地点在北京市行政辖区以外，甲方应另行承担乙方为其代购的产品发生实际运输费及其他相关费用。<br>
&nbsp;&nbsp;&nbsp;&nbsp;B)	由于甲方自己原因造成的运输费用，由甲方承担。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4. 产品质量标准：甲、乙双方同意本合同产品质量应符合该产品的国家规定标准。<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.产品验收<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方同意在乙方将产品送达到或安装完毕在双方约定地点当日内，甲方应按照本合同约定的产品质量标准进行验收和签字确认。如果甲方不在现场，甲方应指定其委托人代为验收并签字确认，并应提前将已委托他人代为验收的相关情况和书面授权委托书提供乙方。如果经乙方按照本合同甲方所留地址向甲方发出书面验收通知之日起三日内，甲方未验收的，自上述期限届满日起产品视为甲方已验收且产品合格。<br>



        <strong>第三条：权利与义务</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1、	甲方的权利<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)	甲方有权要求乙方按照本合同约定的材料或配件，进行产品生产和配置。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)	甲方有权按照本合同第二条第四款约定的产品质量标准向乙方提出书面质量异议，并要求产品符合第二条第四款的标准。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2、	甲方的义务<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)	乙方根据甲方需求而专门进行测量定制的产品，在本合同签订后，如因甲方自身原因导致乙方必须对该产品设计进行修改的，甲方应在本合同签订之日起二日内向乙方书面提出明确修改要求；否则，甲方应自行承担由于产品已进入生产流程而导致乙方无法修改产品所产生的全部费用及其损失。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)	甲方有义务在签订本合同时一次性支付产品全部价款。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3)	甲方有权享有本合同附件三约定的、由供货商提供的保修服务。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4)	如果甲方的基础装修不符合安装本合同产品的要求，甲方应修改其基础装修，直至其达到安装本合同产品的要求，本合同产品的安装日期自动顺延，乙方对此不承担任何责任。<br>
&nbsp;&nbsp;&nbsp;&nbsp;5)	因甲方基础装修未按时完工或不符合安装的要求，导致乙方无法按时安装本合同产品，继而造成安装延期，由此发生的产品更改、安装工期延误和其他经济损失由甲方自行承担。<br>
&nbsp;&nbsp;&nbsp;&nbsp;6)	如供货商与甲方对安装条件等发生意见分歧，在供货商说明情况后，甲方仍坚持己见的，供货商可以按照甲方意见进行设计和配置，但前提条件是甲方要在供货商出具的文字说明上签字确认，并且甲方需书面承诺承担由此产生的一切责任。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3、	乙方的权利<br>
&nbsp;&nbsp;&nbsp;&nbsp;乙方在与甲方签订本合同后，乙方有权要求甲方按照本合同第三条的约定预先支付全部价款后，再进入产品生产程序。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4、	乙方的义务<br>
&nbsp;&nbsp;&nbsp;&nbsp;1）乙方执行本合同第二条第四款约定的产品质量标准，保证向甲方提供合格的产品。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2）除不可抗力或甲方自身原因外，乙方应按照本合同约定的时间交货，每延迟交付一天乙方需向甲方赔付订单金额的3‰（千分之三）。最高上限不可超过订单金额的30%。<br>

		
        <strong>第四条：退货、换货、补货</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;1、退货和换货<br>
&nbsp;&nbsp;&nbsp;&nbsp;1)甲方自提产品<br>
&nbsp;&nbsp;&nbsp;&nbsp;甲方应当在供应商存货现场当场检查验收产品。现场验收中，如发现产品有不符合本合同产品质量标准的情况，甲方有权拒绝收货或要求免费调换。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2)由供应商送货产品<br>
&nbsp;&nbsp;&nbsp;&nbsp;A)	非甲方定制的产品：如有换货，甲方应自付款之日起三日内书面要求更换，乙方可为甲方协调供货商资源更换现有的其他产品，但甲方应补足差价；超过三日的，甲方应向乙方支付该产品总金额30%的违约金；如有退货，甲方应向乙方支付退货产品总金额30%的违约金。<br>
&nbsp;&nbsp;&nbsp;&nbsp;B)甲方定制产品：不予退换货。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2、补货<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方在本合同签订后，如需要补订货品，双方需另行签订《综合机电产品代购服务合同》，该类产品的送货日期以补订产品清单所示送货日期为准，乙方根据供货周期及时通知供货商按时发货。<br>
        <strong>第五条：售后服务</strong> <BR>
&nbsp;&nbsp;&nbsp;&nbsp;1.送货或安装由供货商负责。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.供货商服务不到位或本合同产品经国家权威机构检验有质量问题的，乙方有责任协调供货商及时进行处理。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.保修及维修由供货商负责，保修期限以供货商规定的期限为准。<br>
        <strong>第六条：保修凭证 </strong> <BR>
&nbsp;&nbsp;&nbsp;&nbsp;本合同项下产品均由供货商直接开具发票给甲方。甲方以乙方产品供应商开据的产品保修凭证作为今后产品保修之依据<br>
        <strong>第七条：争议解决</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;因履行本合同或与本合同有关事宜，双方应友好协商解决。如协商不成，任何一方均有权将争议提交中国国际经济贸易仲裁委员会进行仲裁，仲裁地点：北京。仲裁裁决为终局性，对双方具有约束力，败诉方应承担胜诉方因此发生的一切费用，包括但不限于仲裁费和律师费。<br>
		<strong>第八条 合同文本</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;本合同一式贰份，甲方、乙方双方各持一份，自双方签字之日起生效。<br>
		<strong>第九条 附件</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;本合同设有下列附件，为本合同不可分割的组成部分，与本合同具有等同法律效力：<br>
&nbsp;&nbsp;&nbsp;&nbsp;附件一：《松下亿达主材产品订货明细》或/及《主材产品设计方案》<br>
&nbsp;&nbsp;&nbsp;&nbsp;附件二：授权委托书<br>
&nbsp;&nbsp;&nbsp;&nbsp;附件三：主材代购产品保修期限<br>
		<strong>第十条 其他</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;本合同未经甲、乙双方书面一致同意，任何一方不得变更、修改或解除。本合同未尽事宜，甲、乙双方可另行签订书面补充协议，补充协议与本合同具有同等法律效力。如果补充协议与本协议内容不一致的，以
补充协议相应内容为准。
<br>
	</font></p></td>
  </tr>
  <tr> 
    <td  width="46%">&nbsp;</td>
    <td width="54%">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="46%"><font size="2">甲方签字：</font></td>
    <td width="54%"><font size="2">乙方：松下亿达装饰工程（大连）有限公司</font></td>
  </tr>
  <tr> 
    <td  width="46%">&nbsp;</td>
    <td width="54%">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="46%"><font size="2">授权代表（签字）：</font></td>
    <td width="54%"><font size="2">授权代表（签字）：</font></td>
  </tr>
  <tr> 
	  <td height="300" colspan="2"> <p><font size="2"><strong><br>附件二：</strong></font><font size="2"><br>
<strong><center>授权委托书</center></strong><br><br>
<font style="color:#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;为保护<font color="#000000">《综合机电产品代购服务合同》</font>双方当事人的合法权益，方便双方沟通，更好的服务于消费者，需甲方签订本《授权委托书》。以此指定下列人员为其与乙方就<font color="#000000">《综合机电产品代购服务合同》</font>（“合同”）事宜进行沟通的代表。</font><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;委托人（买方）：<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;身份证号：<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;受委托人：<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;身份证号：<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;传    真：<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;住    址：<br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;现委托上列受委托人在我与松下亿达装饰工程（大连）有限公司之间 &nbsp;&nbsp;&nbsp;&nbsp; 年     &nbsp;&nbsp;&nbsp;&nbsp;    月   &nbsp;&nbsp;&nbsp;&nbsp; 日签订的《综合机电产品代购服务合同》项下事宜中，作为我本人的代理人。<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;代理人的权限为:<br>
&nbsp;&nbsp;&nbsp;&nbsp;代为交付、收取货款，提出合同产品设计等修改意见；验收合同产品；签署、接收合同项下各类文件，进行协商。对本委托事宜做出包括但不限于退货、更改和确认产品信息数据和设计方案，退换产品等事宜的全权代理。<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;委托人（买方）：<div align="right">  年   &nbsp;&nbsp;&nbsp;&nbsp;   月   &nbsp;&nbsp;&nbsp;&nbsp;   日</div>
	  </font></p></td>
  <tr>
	<td height="50" colspan="2"><p><font size="2"><strong>附件三：</strong></font><font size="2"><br><br>
<strong><center>主材代购产品保修期限</center></strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;1.暖气类： <font style="color:#FF0000">2年保修，终身维护。</font><br>
&nbsp;&nbsp;&nbsp;&nbsp;2.地暖类：A:电暖：线  缆：10年保修，终身维护。
温控器；2年保修，终身维护。
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B：水暖：2年保修，终身维护。<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.中央空调、新风系统类：1年保修，终身维护。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.水处理类：2年保修，终身维护。<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.智能家居类：3年保修，终身维护。<br>
&nbsp;&nbsp;&nbsp;&nbsp;6.钢结构：1年保修，终身维护。<br>

    </font></p></td>
  </tr>
	 
</table>

</body>
</html>
 

