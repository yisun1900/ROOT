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
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE4 {font-size: 18px; font-weight: bold; }
.STYLE6 {font-size: 14px}
.STYLE7 {font-size: 22px}
.STYLE8 {font-size: 22px; font-weight: bold; }
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

String dwmc=null;
String hth=null;
String khjl=null;
String clgw=null;
String khxm=null;
String qyrq=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jpmzjdjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
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

	
	ls_sql="SELECT dwmc,hth,khjl,clgw,khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,crm_zxkhxx.ssfgs,fwmj,bjbbh,hxbm,zxdm,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		hth=cf.fillHtml(rs.getString("hth"));
		khjl=cf.fillHtml(rs.getString("khjl"));
		clgw=cf.fillHtml(rs.getString("clgw"));
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


<THEAD bgcolor="#FFFFFF" style="display:table-header-group;font-weight:bold">
<tr><td>

<table border="0" width="94%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center" class="STYLE8">松下亿达二次装修品质升级产品选购合同</p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" class="STYLE3" >顾客姓名：<u><%=khxm%></u>(以下简称“甲方”)</td>
    </tr>
	 <tr bgcolor="#FFFFFF">
      <td width="43%" class="STYLE3" >送货地址：<u><%=fwdz%></u></td>
      <td class="STYLE3" >联系电话：<u><%=lxfs%></u></td>
      </tr>
	 <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
	 <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="left" class="STYLE2" ><p align="left" class="STYLE3">乙方：松下亿达装饰工程（大连）有限公司（以下简称 “乙方”）</p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="left" class="STYLE2" ><p align="left" class="STYLE3">地址：十里河桥东吕营大街家居大道松下亿达家装6s店 </p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td height="22" colspan="2" align="center" class="STYLE2" ><div align="left">
      <p><span class="STYLE6"><strong>第一条：</strong>乙方本着为甲方提供整体服务、节省甲方时间、替甲方监督、检查、控制产品质量和售后服务的原则，为甲方提供二次装修品质升级项目，主要内容包括：<br> 
	  1、基础施工□，2、健康计划□，3、静音计划□，4、色彩计划□，5、温暖计划□<br>
	  其中 第1项 基础施工项与快捷家装一起签订施工合同，2-5项以本合同为订购依据。请在签约的选项后面打√。</span></p>
      
    </div></td>
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left">&nbsp;</p></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left"><span class="STYLE6"><strong>第二条：品质升级产品供货</strong><br>
1、产品价格<br>
&nbsp;&nbsp;&nbsp;&nbsp;本合同产品内容及其价格：详见《二次装修品质升级产品订货明细》（附件一）。在本合同签订之日，甲方应向乙方付清上述所选产品的总价款。
<br>2、送货/安装约定<br><strong>&nbsp;&nbsp;&nbsp;&nbsp;本合同内各项产品送货日期为:</strong><br>&nbsp;&nbsp;a、温暖计划产品签约付款日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日，安装日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日；<br>&nbsp;&nbsp;b、静音计划产品签约付款日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日，安装日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日；<br>&nbsp;&nbsp;c、色彩计划产品签约付款日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日，安装日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日；<br>&nbsp;&nbsp;d、健康计划产品签约付款日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日，安装日期为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日。<br>&nbsp;&nbsp;&nbsp;品质升级产品送货安装工期不计入快捷家装合同工期，若因甲方工地现场进度原因，不具备送货安装条件或甲方无法接货等原因导致本合同产品安装延误，乙方不承担本合同延期责任。<br>3、运输费用<br>&nbsp;&nbsp;a、如果送货地点在6环以内则免费送货，6环外需由甲方自行承担远程费用，<strong>远程费<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>元</strong><br>&nbsp;&nbsp;b、由于甲方自己原因造成的运输费用，由甲方承担。<br>4、产品质量标准：符合该产品的国家规定标准。<br>5、产品验收<br>&nbsp;&nbsp;&nbsp;&nbsp;甲方同意在乙方将产品送达或安装完毕在双方约定地点当日内，甲方应按照本合同约定的产品质量标准进行验收和签字确认。如果甲方不在现场，甲方应指定其委托人代为验收并签字确认，如果乙方按照本合同甲方所留地址进行送货安装之日起三日内，甲方未签字验收的，自上述期限届满日起产品视为甲方已验收合格。<br><strong>第三条：二次装修品质升级各项产品说明</strong></span></p>     </td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><table width="638" height="143" border="1" align="left">
      <tr>
        <td width="121" height="17"><div align="center"><strong>项目</strong></div></td>
        <td width="501"><div align="center"><strong>注意事项</strong></div></td>
      </tr>
      <tr>
        <td height="31"><div align="center"><font size="2"><strong>健康计划
(空气净化
+水处理)
</strong></font></div></td>
        <td><font size="1">1.每套组合中所含空气净化装置及水处理装置为各一套，如需增加，费用另计；<br>2.	新风系统适用于套内90平米以下户型，包含三个新风口、房间内布管、控制器等配件及安装；<br>3.	新风系统需要供货商现场测量，如甲方需增加新风口，需按市场售价补交差价.</font></td>
      </tr>
      <tr>
        <td height="85"><font size="2"><strong>温暖计划
()     (散热器)
</strong></font></td>
        <td><font size="1">1.	此套餐按户型及面积计价，根据散热量标准进行组合，如有面积超出可根据实际情况增加散热器数量，增加部分费用另计。<br>2.	套餐价格包含费用：散热器、测量、改管、安装人工费；标配材料费（2个六分铝塑管球阀、2个六分铝塑管管件、2米六分铝塑管）
<br>
&nbsp;&nbsp;&nbsp;备注：如安装费用超出标配部分按收费标准实用实收。<br>
3.	套餐仅限原地改暖气，如需挪位置，改管费用另计<br>4.	套餐中接口方式：不包含底进底出（接口垂直地面），但包含上进下出、下进下出（接口平行地面）。<br>5.	散热量配置参数：卧室/书房：120-140W/㎡，客厅/餐厅/卫生间/厨房:80-100W/㎡。亦可在标配散热量不变的基础上，根据具体情况调整产品高度（300mm-1800mm)及本套餐包含的其它产品。
</font></td>
      </tr>


    </table>    
    <p align="left"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><br><br><br><br>
	<table width="638" height="143" border="1" align="left">
      <tr>
        <td width="121"><strong>色彩计划
(窗帘)
        </strong></td>
        <td width="501"><font size="1">1.	不同户型标配窗帘数量不同。例如：2居室报价为，1个客厅窗帘+2个卧室窗帘，所含窗帘包含规定范围的尺寸。<br>
          2.	套餐价格含：布、单杆1.9米、杆头一对、杆座一对、配套环、配套布带、配套铅线费用，同时包含现场测量及2次安装。<br>
3.	套餐中含窗帘布有米数限定，如果有超出，费用另计。<br>
4.	窗帘产品需在指定的品牌型号范围内挑选。<br>
5.	以上报价可使用欧美布艺券，每户每份合同仅限使用1张。 </font></td>
      </tr>
      <tr>
        <td><strong>静音计划
    (窗户)
        </strong></td>
        <td><font size="1">1.	塑钢窗标配AD58系列，断桥铝标配63系列；<br>
2.	玻璃标配：5mm+9A+5mm或5mm+12A+5mm普通中空；<br>
3.	五金配置为：德国诺托；<br>
4.	静音计划按顾客所做窗户面积计价，如有超出面积，按店面售价补差价。<br>
&nbsp;&nbsp;套餐标配：一居室（0+1、1+1）: 2㎡开启窗，3㎡固定窗,<br>
&nbsp;&nbsp;&nbsp;二居室（2+1、2+2）: 5㎡开启窗，7㎡固定窗,<br>&nbsp;&nbsp;&nbsp;三居室（3+1、3+2）: 7㎡开启窗，13㎡固定窗,<br> &nbsp;&nbsp;&nbsp;四居室（4+1、4+2）: 12㎡开启窗，18㎡固定窗<br>5.	静音计划价格中包含：规定面积内的窗户、开启部分含纱窗、玻璃钢化、测量、安装、拆除旧窗；<br>6.	辅料不含在内（90度转角、自由角、加强拼接、非标配玻璃、门窗喷涂、覆膜等）<br>7.	开启窗不足1平米按照1平米计价，固定窗不足0.5平米按照0.5平米、超出0.5平米不足1平米按 照1平米计价；<br>8.	宽度及高度超过1.8米，其中有开启的情况下需要加强拼接；<br>9.	此静音计划仅限制作窗户，不含制作塑钢门或断桥铝门；<br>10.	除以上所含项目，如窗户带转角，窗户需加强拼接等情况，需另外计费.</font></td>
      </tr>
    </table>    
    <p align="left"></p>
    <p align="left"></p>
    <p align="left"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left" class="STYLE6"><strong>第四条：权利与义务</strong><br>1、甲方的权利<br>
&nbsp;&nbsp;（1）甲方有权要求乙方按照本合同约定的材料或配件进行产品生产和配置。<br>&nbsp;&nbsp;（2）甲方有权享有本合同约定的、由供货商提供的保修服务。<br>2、	甲方的义务<br>（1）	 甲方有义务在签订本合同时一次性支付产品全部货款。<br>
（2） 乙方根据甲方需求而专门进行测量定制的产品，在本合同签订后，如因甲方自身原因导致乙方必须对该产品设计进行修改的。甲方应在本合同签订之日起二日内向乙方书面提出明确修改要求；否则，甲方应自行承担由于产品已进入生产流程而导致乙方无法修改产品所产生的全部费用及其损失。<br>（3）	如果因施工现场问题无法安装，本合同产品的安装日期自动顺延，乙方对此不承担任何责任。<br>
（4）	如供货商与甲方对安装条件等发生意见分歧，在供货商说明情况后，甲方仍坚持己见的，供货商可以按照甲方意见进行设计和配置。但甲方需在供货商出具的文字说明上签字确认，并承担相关责任。<br>3、 乙方的权利<br>&nbsp;&nbsp;乙方在与甲方签订本合同后，乙方有权要求甲方按照本合同约定预先支付全部价款后，再进入产品生产程序。<br>4、乙方的义务<br>&nbsp;&nbsp;1）乙方按本合同附件1中约定的产品明细进行送货，保证向甲方提供合格的产品。<br>
&nbsp;&nbsp;除不可抗力或甲方自身原因外，乙方应按照本合同约定的时间交货，每延迟交付一天乙方需向甲方赔付订单金额的<strong>3‰（千分之三）。最高上限不可超过订单金额的30%。</strong>由于甲方验收延迟或验收整改造成的延期不再此范围内。<br><strong>第五条：退货、换货、补货</strong><br>1、	退货和换货<br>（1）甲方自提产品<br>&nbsp;&nbsp;甲方应当在供应商存货现场当场检查验收产品。现场验收中，如发现产品有质量问题，甲方有权拒绝收货或要求免费调换。<br>（2）	由供应商送货产品<br>&nbsp;&nbsp;a、非甲方定制的产品：产品已安装，如因个人喜好等非质量问题，不予退换货。<br>&nbsp;&nbsp;b、甲方定制产品：产品已下单生产，不予退换货。<br>2、补货<br>&nbsp;&nbsp;甲方在本合同签订后，如需要补订产品，该类产品的送货日期以补订产品清单所示送货日期为准，乙方根据供货周期及时通知供货商按时发货。<br><strong>第六条：售后服务</strong><br>1.	送货或安装由供货商负责。<br>2.	供货商服务不到位或本合同产品经国家权威机构检验有质量问题的，乙方有责任协调供货商及时进行处理。<br>3.	保修及维修由供货商负责，保修期限以供货商规定的期限为准。<br><strong>第七条：保修凭证</strong><br>本合同各项产品保修年限:<br>&nbsp;&nbsp;a、温暖计划：散热器<strong>2年</strong>保修，终身维护；保修联系电话：010-84871218<br>&nbsp;&nbsp;b、静音计划：塑钢窗、断桥铝窗保修<strong>1年</strong>；保修联系电话：010-88873058<br>&nbsp;&nbsp;c、色彩计划：<strong>1年</strong>内窗帘杆出现掉漆、固定处松动等质量问题（人为损坏除外），包修。保修联系电话：15210365935
<br>&nbsp;&nbsp;d、健康计划：净水装置<strong>2年</strong>保修，新风装置<strong>1年</strong>保修，终身维护。保修联系电话：010-57228286 <br><strong>第八条：争议解决</strong><br>
&nbsp;&nbsp;因履行本合同或与本合同有关事宜，双方应友好协商解决。如协商不成，甲方有权向松下亿达所在地人民法院提起诉讼或到仲裁机构申请仲裁.松下亿达将根据法院判决结果或仲裁机构的仲裁意见向甲方进行赔付。<br><strong>第九条 合同文本</strong><br>&nbsp;&nbsp;本合同一式贰份，甲方、乙方双方各持一份，自双方签字盖章之日起生效。<br><strong>第十条 附件</strong><br>&nbsp;&nbsp;本合同设有下列附件，为本合同不可分割的组成部分，与本合同具有等同法律效力：<br>&nbsp;&nbsp;附件一：《二次装修品质升级产品订货明细》<br><strong>第十一条 其他</strong><br>&nbsp;&nbsp;本合同未经甲、乙双方书面一致同意，任何一方不得变更、修改或解除。本合同未尽事宜，甲、乙双方可另行签订书面补充协议，补充协议与本合同具有同等法律效力。<br>如果补充协议与本协议内容不一致的，以补充协议相应内容为准。</p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
  </tr><tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="left"><font size="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;甲方:</strong></font><br>
      &nbsp;&nbsp;&nbsp; <font size="2"><strong>授权代表（签字）</strong></font></p></td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong> 乙方：松下亿达装饰工程（大连）有限公司:</strong></font></div>      <div align="left"></div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="center"><font size="4"><strong></strong></font></p>      </td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong>材料员（签字）</strong></font>:</div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="center"><font size="2"><strong></strong></font></p></td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong>店面经理（签字）</strong></font>:</div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" class="STYLE2" ><p align="left"><font size="2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;日期：</strong></font></p></td>
    <td align="center" class="STYLE2" ><div align="left"><font size="2"><strong>日期：</strong></font></div></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p><BR>
      </p></td>
  </tr>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="left"><font size="2"><strong>附件一：</strong></font></p></td>
    </tr>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center" class="STYLE4"><font size="2"><span class="STYLE7"><strong>二次装修品质升级订购明细</strong><font></span></p>
    </td>
  </tr>
<tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="center" class="STYLE2" ><p align="center"></p></td>
    </tr>
<center>
  <table width="849" border="0" align="left">
    <tr>
      <td width="257" class="STYLE3">顾客姓名：<u><%=khxm%></u></td>
      <td width="321" class="STYLE3">联系电话：<u><%=lxfs%></u></td>
      <td width="445" class="STYLE3">家装合同编号:<u><%=hth%></u></td>
    </tr>
    <tr>
      <td colspan="2" class="STYLE3"><u>装修地址：<%=fwdz%></u></td>
      <td class="STYLE3">签约店面：<u><%=dwmc%></u></td>
    </tr>
    <tr>
      <td class="STYLE3">设计师：<u><%=sjs%></u></td>
      <td class="STYLE3">材料顾问：<u><%=clgw%></u></td>
      <td class="STYLE3">客户经理：<u><%=khjl%></u></td>
    </tr>
  </table>
</center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table border="1" width="86%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="12%" >计划名称</td>
    <td  width="8%" >价格</td>
    <td  width="18%" >产品名称</td>
    <td  width="15%" >品牌</td>
    <td  width="20%" >型号</td>
	<td  width="15%" >规格</td>
    <td  width="6%" >单位</td>
    <td  width="6%" >数量</td>
  </tr>

	
<%
	int i=0;

	String tcmc=null;
	double tcjg=0;
	double bzmj=0;
	double pmzjdj=0;
	double sjmj=0;
	String mjsfkzj=null;

	double alltcjg=0;
	ls_sql="SELECT distinct tcmc,tcjg,bzmj,pmzjdj,sjmj,mjsfkzj";
	ls_sql+=" FROM bj_khwntcmch ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by tcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		tcjg=rs.getDouble("tcjg");
		bzmj=rs.getDouble("bzmj");
		pmzjdj=rs.getDouble("pmzjdj");
		sjmj=rs.getDouble("sjmj");
		mjsfkzj=rs.getString("mjsfkzj");

		if (sjmj>bzmj)
		{
			tcjg+=(sjmj-bzmj)*pmzjdj;
			tcjg=cf.round(tcjg,2);
		}

		alltcjg+=tcjg;

		double tcmxjg=0;
		ls_sql="SELECT distinct sum(round(tcdj*sl,2))";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcmxjg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (tcmxjg!=tcjg)
		{
			out.println("<span class='STYLE3'>错误！套餐["+tcmc+"]总价["+tcjg+"]与名细["+tcmxjg+"]不一致</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT distinct count(*)";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
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
				<td ><%=tcjg%></td>
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
		ls_sql="SELECT distinct cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
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
					<td rowspan="<%=count%>"><%=tcjg%></td>
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
					<td rowspan="<%=count%>"><%=tcjg%></td>
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


	String tcbm=null;
	double yj=0;
	double tcj=0;
	String bz=null;
	ls_sql="SELECT distinct tcbm,tcmc,yj,tcj,bz";
	ls_sql+=" FROM bj_khzctcmch ";
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

		alltcjg+=tcj;

		double tcmxjg=0;
		ls_sql="SELECT distinct sum(round(tcdj*sl,2))";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tcmxjg=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (tcmxjg!=tcj)
		{
			out.println("<span class=\"STYLE3\">错误！健康计划套餐["+tcbm+"]总价["+tcj+"]与名细["+tcmxjg+"]不一致</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT distinct count(*)";
		ls_sql+=" FROM bj_khzctcmxh";
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
		ls_sql="SELECT distinct cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khzctcmxh";
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


	ls_sql="SELECT distinct tcmc,tcjg";
	ls_sql+=" FROM bj_khcltcmch ";
    ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by tcmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcmc=rs.getString("tcmc");
		tcjg=rs.getDouble("tcjg");

		alltcjg+=tcjg;

		double zsl=0;
		ls_sql="SELECT distinct sum(bzsl)";
		ls_sql+=" FROM bj_khcltcfjslh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		double mxsl=0;
		ls_sql="SELECT distinct sum(sl)";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			mxsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (mxsl!=zsl)
		{
			out.println("<span class=\"STYLE3\">错误！色彩计划套餐["+tcmc+"]总数量["+zsl+"]与名细数量["+mxsl+"]不一致</span>");
//			return;
		}

		int count=0;
		ls_sql="SELECT distinct count(*)";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
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
				<td ><%=tcjg%></td>
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
		ls_sql="SELECT distinct cpbm,cpmc,ppmc,xh,gg,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr,lrsj,bz";
		ls_sql+=" FROM bj_khcltcmxh";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and tcmc='"+tcmc+"'";
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
					<td rowspan="<%=count%>"><%=tcjg%></td>
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
					<td rowspan="<%=count%>"><%=tcjg%></td>
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
	<td><B><%=alltcjg%></B></td>
	<td><B>大 写</B></td>
	<td colspan="5"><b><font size="2"><%=cf.NumToRMBStr(alltcjg)%>;<font></b></td>
	</tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF">
    <td width="100%" ><span class="STYLE6">说明： </span><br>
    <span class="STYLE6">1.定做类产品需经甲方对图纸及方案签字确认后方可生效；<br>2.以上明细显示订购型号及数量，具体产品明细详见甲方签字确认的图纸及方案；<br>3.甲方应按本合同金额向乙方缴纳全部货款，交款后，乙方安排供货商进行生产及送货服务；</span>    </tr>
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






