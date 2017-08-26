<%@ page contentType="text/html;charset=GBK" %>
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
finally 
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
%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td width="35%"><img src="/images/tubiao.jpg"></td>
    <td width="65%"><font size="5"><strong>主材代购服务合同</strong></font></td>
  </tr>
</table>

<table width="100%" border="0">
  <tr align="right"> 
    <td colspan="2"> <div align="left"><font size="2">合同编号：<%=ddbh%></font></div></td>
  </tr>
  <tr> 
    <td width="517"><font size="2">甲方（客户）：<u>&nbsp;<%=khxm%>&nbsp;</u> 联系电话：<u>&nbsp;<%=lxfs%>&nbsp;</u></font></td>
    <td width="450"><font size="2"> 乙 方：松下亿达</font></td>
  </tr>
  <tr> 
    <td width="517"><font size="2">安装地址：<u>&nbsp;&nbsp;<%=fwdz%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></font></td>
    <td width="450"><font size="2">现场班长/电话：<u><%=sgbz%><%=bzdh%></u> </font></td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">送货日期：<u>&nbsp;&nbsp;&nbsp;<%=htshsj%>&nbsp;&nbsp;&nbsp; 
      &nbsp;&nbsp;&nbsp; </u></font></td>
    <td width="450"><font size="2">联系电话：010－84291188转项目管理部 </font></td>
  </tr>
  <tr> 
    <td colspan="2"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国消费者权益保护法》、《中华人民共和国合同法》、《中华人民共和国产品质量法》及有关规定，乙方为甲方提供完善的家庭装修配套服务，双方特签定《主材代购服务合同》,并共同遵守。</font></td>
  </tr>
  <tr valign="top"> 
    <td height="411" colspan="2"> <p><font size="2">一、甲方委托乙方代为购买居室装饰用主材，具体代购内容见附件</font><font size="2"><br>
        <strong>二、付款方式：</strong><br>
        &nbsp;&nbsp;&nbsp;&nbsp;1、本合同总金额人民币<u>&nbsp;&nbsp;&nbsp;<%=cf.NumToRMBStr(cf.doubleTrim(jc_zcdd_hkze,0))%>&nbsp;&nbsp;&nbsp;</u>（￥<%=jc_zcdd_hkze%>）。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2、付款方式：<br>
        &nbsp;&nbsp;&nbsp;&nbsp; （1）交付全款：甲方一次性支付给乙方所委托代购的主材全款，如实际数量与预估数量出现差额，按实际数量结算。<br>
        &nbsp;&nbsp;&nbsp;&nbsp; （2）先交定金，再补齐全款：个别代购产品（如：暖气类产品、乙方代购的定制式产品等）需上门测量出方案后方能计算出准确货款的，需由甲方先交定金200元。待准确金额核算出来后，签定代购合同补齐总货款。部分产品的安装费用，需要由厂商现场收取。<br>
        &nbsp; &nbsp;&nbsp;&nbsp;（3）特殊情况处理：对施工中需补货的产品（如：瓷砖类、铝扣板等产品），因客户不能及时到乙方财务补齐货款，乙方可以挪用甲方其它产品的退货款项补足；如甲方在乙方财务的材料委托购买款余额不足时，乙方有权单方中止委托购买行为，待余额补足后继续为甲方提供委托购买服务。由此造成的工程不能如期交工，则视为甲方同意工期顺延。<br>
        <strong>三、现场验货：</strong>主材到场后须经甲方或甲方委托人签字验收。如届时因甲方原因不能到达现场验收，则视为乙方将产品按甲方要求花色、型号、数量送达。<br>
        <strong>四、订购须知：</strong><br>
        &nbsp;&nbsp;&nbsp;&nbsp;1、因材料在施工过程中存在正常的损耗，如瓷砖、地板、壁纸等需以实际面积乘以1.1系数的比例订购。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2、实木地板类产品，因其用材为天然的实木，同一批次货品会存在纹理、颜色方面的差异，属合理范围。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;3、铺装实木地板时，为保证平整度，对地面未做找平处理的，需要采用加大龙骨的做法。加大龙骨是需要加收费用的。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;4、定尺寸加工或特殊加工的产品，一经加工不退不换。如：瓷砖切割成踢脚或造型拼花的；铝扣板定尺寸加工的；淋浴房定尺加工的，等等。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;5、有些产品因厂商经营策略的原因会阶段性的做促销活动，在此期间订购的产品，发生补货时，根据补货时期现行的价格补货。<br>
        <strong>五、服务承诺：</strong> <BR>
        &nbsp;&nbsp;&nbsp;&nbsp;1、除瓷砖类产品外，乙方的合作厂商仅提供一次免费运输服务。对于瓷砖类产品，乙方的合作厂商提供两次免费运输服务。即：送货一次，退货或补货一次，可退、补货期限为30天内。如自送货日起超过30天，乙方不再承担为甲方代办退、补货手续。对退回的货品要求：（1）保留原包装箱。（2）无工程使用痕迹（泡水、沾水泥），或缺角、断裂情况。（3）超次服务需付运费或自行退货。退货地点：厂商的库房或直营店。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;2、乙方所推荐的主材产品质量标准均以国家质量监督检测的行业标准为准。若乙方为甲方代购的主材，经权威机构检验确属质量问题的，乙方承诺甲方针对质量问题产品实行先行赔付，并有义务协助甲方追究厂商的产品质量责任。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;3、如因乙方合作厂商原因造成延迟供货，按合同价款的2‰赔偿违约金。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;4、代购主材保修期限依据产品销售方（厂商）对产品保修期的规定执行。<br>
        &nbsp;&nbsp;&nbsp;&nbsp;5、五环内免费运输服务，远郊区县收取运费。具体数额以乙方合作厂商库房距离甲方位置远近收取。<BR>
        <strong>六、纠纷解决方式</strong> <BR>
        &nbsp;&nbsp;&nbsp;&nbsp;1、因履行本合同所发生的任何争议双方应友好协商解决，协议不成的，任何一方均可向被告所在地人民法院起诉。<BR>
        &nbsp;&nbsp;&nbsp;&nbsp;2、甲乙双方可在不违背本合同的原则下签署补充协议，若补充协议与本合同有关条款相悖，按补充协议执行。<BR>
        <strong>七、本合同自双方签字、盖章且甲方支付全部货款后生效。本合同一式三份，甲方持有一份，乙方持有两份，各份具有相同的法律效力。</strong></font></p></td>
  </tr>
  <tr> 
    <td  width="517">&nbsp;</td>
    <td width="450">&nbsp;</td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">甲方签字：</font></td>
    <td width="450"><font size="2">乙方：松下亿达（盖章）</font></td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">&nbsp;&nbsp;</font></td>
    <td width="450"><font size="2">经办人：</font></td>
  </tr>
  <tr> 
    <td  width="517"><font size="2">签订日期：<%=qhtsj%></font></td>
    <td width="450"><font size="2">签订日期：<%=qhtsj%></font></td>
</table>
</body>
</html>
