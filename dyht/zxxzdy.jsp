<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>注：1、此《客户住宅装修须知》的内容，将由我公司营业担当逐条为您诵读并作详细解释</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

<tr bgcolor="#FFFFFF"> 
    <td colspan="7"><span lang=EN-US></span></td>
    <!--  <td align="right">http://pesyddl.panasonic.cn/</td> -->
  </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong><div><font size="6" color="">客户装修须知</font></div></strong></p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;首先，衷心地感谢您对我公司的信任，我们将全力对贵宅进行设计、施工，向您呈上舒适、温馨的住宅空间。</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>第一部分&nbsp;&nbsp;重要提示</strong></p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;一、关于承诺：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;我司所有的优惠活动、合同、项目变更单、竣工验收单等均以书面形式提供给您，任何员工的口头承诺均不作为公司行为。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;二、关于设计：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;设计师在与您进行沟通时，会涉及到一些您的个人隐私资料（如：家庭成员、房屋用途及初步设想等），我司承诺：对您的个人资料保密。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;三、关于施工范围：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;1．对于法律、法规禁止的施工项目（如：拆除承重墙、给排水主管和采暖管道、地热、煤气改造等），我公司不予施工。</strong></span></b></p>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2．由物业负责的施工项目（可视对讲移位，安防系统、装修材料吊装等），我公司不予施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;四、关于发票：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;请您妥善保管每笔交款收据，工程竣工结算时，须凭交款收据办理结算，款项多退少补，并按结算金额换取正式发票，原交款收据由我司收回。如您不能提供上述已开具全部交款收据，我司不予办理退款及发票换取手续。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;五、关于投诉</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;在为您提供服务的整个过程中，如果您有任何不满之处或意见建议，欢迎随时致电：<span
lang=EN-US>0411-84450300</span>。我司将专人负责办理。</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>第二部分&nbsp;&nbsp;流程解析</strong></p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;一、采寸阶段</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1、释义：与您签订设计合同并收到贵宅钥匙后，我们将于<u><span lang=EN-US>&nbsp;&nbsp;&nbsp;
</span></u>个工作日内安排专业的设计人员对贵宅进行初步测量工作。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2、配合事项：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）为了节省您的宝贵时间，同时为了方便我司人员的工作安排，请您配合提供贵宅的钥匙及房型结构图。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）为方便测量工作，避免发生不必要的矛盾，若您的住宅内存放着物品，请务必将物品搬离后，再将钥匙提供给我司。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;二、设计阶段</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1、释义：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）与您签订设计合同后，我们会指派专业设计师为您提供设计服务。设计收费标准为<span lang=EN-US>30-200</span>元<span
lang=EN-US>\</span>平方米，由设计师根据您家具体情况而定，同时会提供效果图及意向图片。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）对于前期不具备采寸条件的位置（如阁楼等），如有漏项，施工时以现场实际情况为准。设计师将深化具体设计方案及报价，由客户确认后施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）为了避免产生价格差异及商品质量的问题，我司不鼓励公司员工陪同您采购任何商品。如您私自委托我司员工购买安装产品，由此造成的一切后果我公司将不负任何责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2、配合事项：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）因设计师的工作需要一定的独立空间和时间用来思考和创作，希望您能配合设计师按照约定的时间见面，若有特殊情况，请尽可能提前<span
lang=EN-US>2</span>－<span lang=EN-US>3</span>天同设计师预约。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）请您将已确定的家具款式及尺寸告知设计师，以便于设计师结合到设计中去。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）若您有部分商品需要自购，请您务必在签订施工合同前提供相关商品的资料（品牌规格、型号及相关说明），以便设计师能够顺利地为您提供服务。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（4）在整个过程中，设计师会要求您对图纸以及谈话记录进行签字确认，敬请配合。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;三、报价阶段</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;释义：设计方案确定后，我公司会给您呈报详细预算。无异议后，请您签订施工合同。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;电器类商品（如：热水器、空调等）保修起始日期为安装之日，超过保修期限需收取上门服务费。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;四、施工阶段</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1、释义：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）工期：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;①在一般情况下，建筑面积在<span
 lang=EN-US>200m<sup>2</sup></span>以内住宅，工期为<span lang=EN-US>105</span>个工作日，建筑面积在<span
 lang=EN-US>200m<sup>2</sup></span>以上的住宅，工期为<span lang=EN-US>120</span>个工作日，别墅工期为<span
lang=EN-US>180</span>个工作日。若您的施工特别复杂，工期会相应地延长，</span><span style='font-size:
12.0pt;line-height:150%;font-family:仿宋_GB2312'>具体工期协商确定<span style='color:black'>。</span>合同签订后第七天为工期起始日期（特殊情况另议）。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;②如果您有特殊情况要求缩短工期，我司会判断是否可行并会向您收取相应的管理费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;③我司将提供一份您自购商品及外包项目的进场日期表。若您自购商品未能在预定日期内进场或外包施工人员未能在预定时间内完成施工，您须承担相应的责任及费用（延误工期费用50元/天），敬请见谅。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）签订施工合同后，我司将指定一名工程监理负责您施工现场的施工管理，保证现场能够按时、按质的顺利施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）为了尽可能的维护您的权益，我司严格规定市内四区施工人员不得在您的新居煮饭及住宿。若您发现上述现象，可直接向0411-84450300投诉，我司将对相关责任者作进行处罚。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（4）施工时，我司的工作内容严格按预算内容为准；其它您与公司员工的口头、书面约定内容均不属我们的施工范围。若您发现我司员工擅自向您追加此类项目的项目变更单，您可拒绝并向我司0411-84450300投诉。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（5）我司在施工中会对现场原有设施等进行保护，以免造成损坏。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2、配合事项：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）施工中您如要变更产品或增减项目，必须填写《工程增减项变更单》，并需您签字确认，我司方可进行施工。为避免发生不必要的纠纷，不能代表您本人或实体的签名均视为无效，有您书面委托者除外。所有签证单在您确认之前都先有公司内部确认（工程、设计、预算担当确认）。若您收到的变更单无公司确认（即该份变更单无效），您可拒签，并向0411-84450300投诉。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;如您对工程项目提出增项要求的，增项工程款项需您全额支付后我司方可施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;如由于您个人原因对工程项目提出减项要求的，减项涉及的费用如超过合同价款的10%时，您需支付给我司减项款30%的管理费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）由于部分商品属于定制类商品（如：彩色乳胶漆、松下特殊商品、松下橱柜、淋浴房、整体衣柜、柜门、隔断门），您在签订施工合同后该类商品将不能进行无偿变更（减少或更换），敬请见谅。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）由于您在签订施工合同后相关材料已经订购，所以对于退货的产品（未拆改包装）按照减项处理，即您需支付给我司退货商品金额30%的管理费用，如该笔费用低于给我司造成的实际损失，您还需补足差额部分，敬请见谅！</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;对于拆改外包装的产品，我司不予退货。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;因产品存在一定的订货周期，若发生产品变更，施工工期将按照产品的到货期顺延，不作为延误工期的责任判定。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（4）在施工过程中隐蔽验收和竣工验收环节，需您亲自到场验收，我司会以电话或书面预约的形式提前通知您到场时间，敬请配合，如您不能亲自到场验收，我司将自行验收并视为您验收合格。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（5）您需要提供一个固定的常用电话号码及常住的联系地址，如变更新地址时请提前三天通知我公司。若在您不提供新地址的情况下，我公司如有紧急事宜或分段验收联系不到您，您将需要承担相关责任及相关损失，敬请见谅。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（6）若您的分段款项未按合同约定支付，现场将会被迫停工。我司将在款到后3-5天内恢复施工，工期相应顺延。同时我司将保留追究您相关责任的权利。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;五、售后服务</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）工程竣工后，我公司为客户提供工程初步保洁。入住前您还需请专业保洁公司作深度保洁，方能达到入住标准。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）为了保护您的合法权益，请您在工程竣工验收阶段严格按照施工规范进行验收，全部工程合格后方可签字验收。您在竣工验收单上签字后，我司既视为您验收合格。请您按照合同规定办理决算，支付余下工程款，换取发票，装修阶段完成。此时，您将进入我司提供的售后服务阶段，并获得不定期的售后服务。验收后出现的质量问题，售后维修时请您出示结算发票及保修凭证，否则我司将不予维修，相关损失由您承担。售后报修电话：0411-84547733。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）如您需在竣工验收后进行空气质量检测（请聘请具有CMA认证的空气质量检测单位，按标准程序进行检测），空气质量检测费用由您支出，如不符合空气质量验收标准，费用将由我公司承担并进行整改。若您在进行空气质量检测时，已搬入您自购的家具或室内施工项目中有您提供的建材，我司将不对检测结果承担任何责任，敬请谅解。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;六、其他事宜</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;所有款项您可以通过华夏银行汇款、民生银行汇款、银行贷记汇款或到公司财务部直接付款四种方式支付。</td>
   </tr>   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;您已详细阅读本须知，并对上述内容无异议。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;发包方：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;承包方：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;_____________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
松下亿达装饰工程（大连）有限公司</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;日期：______________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：____________ </td>
   </tr>
   </table>
</body>
</html>
