<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
String fwdz=null;
String hth=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String fbjgrq=null;
String sgd=null;
String sgdmc="";
String sgddh="";
double sgcbj=0;
double rgf=0;
double flf=0;


String zjdh="";
String ssfgs=null;
String dwbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,fwdz,hth,kgrq,jgrq-10 as fbjgrq,sgd,fgsbh,dwbh";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=rs.getString("hth");
		
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		fbjgrq=cf.fillNull(rs.getDate("fbjgrq"));
		sgd=cf.fillNull(rs.getString("sgd"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
	}
	 rs.close();
	 ps.close();

	
	ls_sql="SELECT dh";
	ls_sql+=" FROM sq_sgd";
    ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	ls_sql=" select zjxm from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
	
	}
	rs.close();
	ps.close();
	
	
	
//工程担当电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where  yhmc ='"+zjxm+"' and  zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	

	ls_sql=" select sgcbj ";
	ls_sql+=" from crm_khqye";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
	}
	rs.close();
	ps.close();
	
	rgf=cf.round(sgcbj*0.5,0);
	flf=cf.round(sgcbj-rgf,0);	

	}	
  catch (Exception e) {
	//out.print("Exception: " + e);
    out.print("Exception: " + ls_sql);
	return;
 
   
	
	}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		 if (conn != null) cf.close(conn); 
	}
}

%>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

<tr bgcolor="#FFFFFF"> 
    <td colspan="7"><span lang=EN-US></span></td>
    <!--  <td align="right">http://pesyddl.panasonic.cn/</td> -->
  </tr>

   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><strong>分包合同（散装）</strong>   </td>
   </tr> 
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>甲方:</b>   <u>大连王的時尚装饰有限公司</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>联系电话：</b><u>0411-84547066</u> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>传真：</b><u>0411-84547575</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>乙方：</b><u><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><b>联系电话：</b><u><%=sgddh%></u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>传真：</b><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;按照《中华人民共和国合同法》、《中华人民共和国劳动合同法》、《中华人民共和国建筑法》及其它有关法律、行政法规，遵循平等、自愿、公平和诚实信用的原则，结合本分项工程具体情况，经甲、乙双方协商一致，签订本合同并严格遵守履行。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1、工程概况</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1&nbsp;工程名称：<u><%=fwdz%>(<%=khxm%>)</u>（工程合同编号:<u><%=hth%></u>）</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2&nbsp;工程地点：<u><%=fwdz%>(<%=khxm%>)</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3&nbsp;开工日期：<u><%=kgrq%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;竣工日期：<u><%=fbjgrq%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4&nbsp;质量标准：达到国家装饰装修工程合格标准；分项工程评定须确保优良标准。 </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>2、施工内容</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;施工范围：<u><%=fwdz%></u>（部位、房号或户型）。属施工图纸范围内的全部内容（除甲方指定的单独外委施工分项等有关内容外），以及文明施工、材料倒运、临时设</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >施以及全部成品保护、卫生清洁等，施工工具自备。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>3、合同费用</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.1&nbsp;本合同暂定总价为<u><%=cf.formatDouble(sgcbj,"#########")%></u>元，其中人工费固定为<u><%=cf.formatDouble(rgf,"#########")%></u>元，辅材费暂定为<u><%=cf.formatDouble(flf,"#########")%></u>元。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2&nbsp;人工费核算标准：人工费中已包含乙方承包范围内的所有工作内容。整个施工期间，所有价格不可调整，包死不变。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;辅材费核算标准：工程完工后，水电部分、签证增减部分、公司专供辅材扣减部分根据甲方造价部、工程部核定的数量及单价，按实结算;</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;特殊项目单价在施工前双方共同确认，专供辅材部分（水电管、大白胶、防水材料等）必须从甲方领用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3&nbsp;支付方式：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;预付款：按照合同总价的<u>18％</u>支付人工预付款；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;进度款：当工程量进行到<u>80％</u>时，支付剩余人工费（即合同暂定总价的<u>32%</u>），同时扣除人工费总额的<u>2.3%</u>作为管理费；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;结算款：工程交工后，经甲方组织验收合格、并办理完成竣工决算凭工程决算书<u>15个</u>工作日内，甲方支付至合同结算额的<u>100%</u>。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.4&nbsp;发票约定 </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;乙方在领取辅材款前必须向甲方出具与业务相一致的等额合法材料发票，否则甲方有权拒付，由此产生的责任及损失由乙方承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>4、保修</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;工程保修期自工程竣工验收合格之日起计算，其中装饰装修工程保修期限为二年，屋面防水工程、有防水要求的厨房、卫生间和外墙面的防渗漏为五年。保修期间发生的所有因乙方施工</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >质量原因产生的费用，均在施工保证金中扣除，如施工保证金不够扣除，则从乙方其它分包工程款中扣除；如乙方施工保证金及分包工程款不够扣除，甲方有继续追索的权利。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>5、驻工地代表及职责</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.1&nbsp;甲方驻工地代表姓名：<u><%=zjxm%>（<%=zjdh%>）</u>。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.2&nbsp;甲方驻工地代表职责：按合同约定，受公司法人委托，及时提供给乙方所需指令、标准、图纸并履行其它合同约定的义务。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.3&nbsp;乙方驻工地代表姓名：<u><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgddh%>）</u>。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.4&nbsp;乙方驻工地代表职责：按甲方确定的施工进度计划、甲方编制的施工技术措施、技术交底、质量目标和甲方代表依据合同发出的指令、要求等组织施工，履行双方合同中规定的其它</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >权利和义务，遵守甲方项目部的各项管理规定。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>6、甲方权利义务</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.1&nbsp;甲方为乙方提供相关的施工图纸、施工方案、施工技术措施及施工进度计划；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >乙方进场后，甲方必须对乙方进行详细的施工技术、质量、安全及文明施工交底。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.2&nbsp;甲方负责施工期间对乙方的施工进度、质量、安全及文明施工等方面进行监督、检查、验收。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.3&nbsp;甲方按本合同的有关规定对乙方做出的罚款处理决定，以送达乙方时即生效，甲方有权将罚款在乙方的工程款中直接扣除，无需另行通知乙方。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>7、乙方权利义务</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.1&nbsp;乙方必须具备一定的专业技术和力量。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.2&nbsp;乙方必须接受甲方项目部、工程担当人员、甲方其他相关人员及业主的监督管理。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.3&nbsp;乙方必须服从甲方项目部管理人员的协调指挥，严格按照设计图纸、施工验收规范、有关技术要求及施工组织设计精心组织施工，确保工程质量达到约定的标准；科学安排作业计划</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >，投入足够的人力，物力，保证工期；加强安全教育，认真执行安全技术规范，严格遵守安全制度，落实安全措施，确保施工安全；加强现场管理，严格执行建设主管部门及环保、消防</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >、环卫等有关部门对施工现场的管理规定，做到文明施工；承担由于自身责任造成的质量修改、返工、工期拖延、安全事故、现场脏乱造成的损失及各种罚款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.4&nbsp;乙方在施工现场必须遵守甲方项目部制定的各种规章制度，并按照甲方项目部的现场管理要求做好现场材料、机具的合理堆放等，严禁浪费材料，同时乙方要做好施工现场已完工程</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >部分的成品保护工作，因乙方自身及管理不到位责任发生的损坏，乙方自行承担由此引起的一切经济损失及各种罚款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.5&nbsp;乙方在工程施工前必须作好工程样板，经甲方项目部及工程担当人员验收达到质量标准后，方可按工程样板质量标准进行大面积施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.6&nbsp;乙方负责对施工现场甲方所提供的临时设施及其他关联施工单位成品的保护工作，承担由于乙方自身原因造成损坏的返修、赔偿责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.7&nbsp;乙方不得将本分项工程另行转包或分包，如有发生，甲方有权解除合同，且对已完工工程不予结算，不支付任何款项，同时乙方要承担相关的法律责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.8&nbsp;由于乙方的原因致使甲方遭到业主及相关管理单位罚款的，全部责任由乙方承担，包括但不限于施工进度、工程质量、安全生产、文明施工等方面，甲方有权在乙方的工程款中予以</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >扣除。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.9&nbsp;乙方不得对原工程设计进行变更，因乙方擅自变更设计发生的费用和由此导致甲方的各种损失，均由乙方承担，耽误的工期不予顺延。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.10&nbsp;因乙方自身原因导致的工程变更，乙方无权要求追加报酬。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.11&nbsp;乙方根据清单要求需要提供的辅料等，必须满足甲方及国家和行业的相关规定，否则由此而引起的相关责任由乙方自行承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.12&nbsp;各项目进场前2日，乙方应将驻地代表以及现场施工人员名单即《现场施工人员明细表》报送给甲方备案并按规定及时办理相关保险手续，未办理相关保险手续人员不得进场施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >如因乙方未按时、准确提供甲方现场施工人员名单影响办理相关保险手续即进场施工引发的事故及相关责任与赔偿，由乙方自行承担全部责任，与甲方无关，因此给甲方造成损失，甲方</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >有权追偿。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>8、施工工期与进度</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.1&nbsp;乙方必须严格按照甲方项目部正式下发的总体施工进度计划、施工进度月计划及施工进度周计划等组织施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.2&nbsp;由于乙方自身原因造成整个工程没有按照确定总体进度计划完成的，甲方有权扣除乙方合同结算总价款的<u>5 %</u>作为工期违约金；由于乙方自身原因没有按照甲方经确认下发的施工进</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >度计划完成的，甲方将视情节给予乙方<u>500~1,000元/次</u>的进度违约罚款处理。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.3&nbsp;在本合同规定的乙方施工内容未全部施工完毕前，乙方无故停工造成甲方损失的，应承担赔偿责任；若乙方无故停工超过<u>3日</u>仍未复工的，则甲方有权解除合同，另行挑选第三方完成</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >未完工工程，且甲方对乙方已完工程不予结算，不支付任何费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.4&nbsp;非乙方原因的其它因素（如停水、停电超过8小时、甲方未及时提供主材、重大设计变更、政府有关规定及不可抗力等）造成的不能正常施工情况，工期可以顺延，产生的相关损失甲</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >乙双方协商解决。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>9、质量验收与检查</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.1&nbsp;乙方必须严格按照施工图纸、样板间及甲方项目部的要求进行施工，整体工程质量验收标准要达到国家验收合格标准。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.2&nbsp;分项工程的施工质量评定必须达到<b><u>优良</u></b>标准；工程一次交验合格率达到<u>100%</u>，质量问题整改率达到<u>100%</u>。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.3&nbsp;乙方必须严格按照甲方项目部下发的施工技术措施和质量标准进行施工，不得随意更改甲方项目部下发的施工技术措施和质量标准。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.4&nbsp;乙方分项工程验收质量等级如果低于上述约定的质量标准等级，甲方有权扣除乙方合同结算总价款的<u><b>5 %</b></u>作为质量违约金，且甲方有权选择第三方进行维修和补救，所发生的费用全</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >部由乙方承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.5&nbsp;甲方工程担当人员对乙方施工的分项工程进行跟踪检查，对施工质量不符合要求的，乙方必须无条件地及时整改；否则，甲方将视情节给予乙方<u>500-1,000元/次</u>的质量罚款处理。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;乙方不得随意更改甲方提供的辅材品牌，如确需更换同档次材料，须报甲方工程担当人员批准后调换，同时将相应信息报甲方造价部，如发现未经审批擅自更换，将从辅材款中扣除该项材料</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >款并予以处罚。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>10、安全生产与文明施工</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.1&nbsp;乙方应严格遵守国家及地方关于安全生产及文明施工的各项法律、法规及条例，同时乙方应严格遵守甲方在本工程中对安全生产及文明施工的具体要求；如产生安全事故，首先确定</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >甲乙双方责任归属，造成的法律责任和经济责任由责任方自行承担，如有争议可经法律程序按照国家有关规定依法解决；在施工期间乙方出现任何社会治安问题，均由乙方自行承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.2&nbsp;乙方的施工人员进场前，必须经过三级安全教育和安全技术交底培训，考试合格后方可上岗工作，特殊工种须持有效上岗证件方可上岗操作。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.3&nbsp;乙方施工人员在施工时，应严格执行甲方项目部制定的安全技术措施和安全技术交底的各项要求，严格遵守相关的安全技术操作规程及各项安全规定，爱护生产设备、安全防护装备</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >和设施。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.4&nbsp;乙方进入施工现场作业的所有人员，必须接受甲方现场管理人员的安全管理和监督；对于不服从甲方项目部管理人员管理、违反现场安全生产及文明施工管理规定的，甲方将视情节</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >给予乙方<u>100~500元/人次</u>的罚款处理；对态度野蛮或屡教不改的人员，甲方将给予乙方加倍罚款并责成乙方将相关责任人员清出施工现场。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.5&nbsp;非特种人员不得从事特种作业，其他人员严禁乱动施工现场的临水、临电线路及各种机械设备，否则，发生一切后果及责任由乙方自行承担；由于乙方自身施工原因所产生的漏水、</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >漏电及火灾事故等，其责任及造成的各种损失均由乙方自行承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.6&nbsp;乙方的任何人员不得随意拆除、移动现场已有的为确保施工安全所设置的一切防护设施，否则甲方将视情节给予乙方<u>200~500元/次</u>的罚款处理，由此造成的安全责任由乙方自行承担</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.7&nbsp;在施工中乙方人员、第三人、甲方工作人员出现伤亡的，按国家相关规定区分责任归属，同时按照国家法律规定进行理赔，如有争议双方可经法律途径解决。 </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.8&nbsp;乙方有责任对已完工程成品进行保护，如发现对成品保护不利或对产品造成破坏的，除恢复原状外，甲方将视情节给予乙方<u>500元～1,000元/次</u>罚款处理。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.9&nbsp;乙方不得随意变卖现场原有设施，如护栏、暖气等，否则除恢复原状外，甲方将视情节给予乙方罚款处理。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>11、用工管理</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.1&nbsp;乙方须严格遵守关于施工企业用工管理的相关法律、法规及条例，遵守国家及地方关于农民工用工管理的相关规定；任何由于乙方违反上述法律、法规、条例及规定，造成的经济责</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >任及法律责任均由乙方承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>12、施工现场管理</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.1&nbsp;乙方必须遵守国家、地方及甲方关于现场施工管理的各项规定及制度，在设施的投入、现场的布置等各方面都要严格按照甲方的规定执行。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.2&nbsp;乙方现场的所有施工人员必须统一穿着甲方规定的服装，配戴甲方规定的防护用具；达不到要求的，甲方将视情况处以<u>50~100元/人次</u>的罚款处理。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.3&nbsp;乙方应该采取一切合理的措施防止其工人发生任何违法犯罪或妨害社会治安和公共安全的行为，并有完全的责任和义务保护周围其他人员和财产免受上述行为的危害，由此造成一切</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >后果由乙方负责。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.4&nbsp;乙方应严格遵守大连市及甲方有关施工现场消防、保卫、交通安全、环卫及社会治安方面的规定；凡是由于乙方自身原因而造成的一切事故、灾害、案件、事件等，其经济责任及法</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >律责任由乙方独自承担；由此造成甲方的损失由乙方赔偿，甲方有权对其进行处罚。如给客户造成损失，乙方必须自收到罚单起3日之内缴款，如未按期缴纳，甲方有权从当期应付款中</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >扣除。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.5&nbsp;乙方要及时清理自身施工区域的施工垃圾，做到工完场清；若由于乙方的原因没有及时清运施工垃圾的，甲方将视情况给予<u>500~1,000元/次</u>的罚款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.6&nbsp;乙方确定的现场负责人必须保证时刻在工地现场，未经甲方代表的同意不得随意离开现场，否则甲方将给予乙方<u>500元/次</u>的罚款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.7&nbsp;乙方确定的现场负责人必须准时参加甲方项目部组织的有关施工生产、安全、质量等方面的会议，对乙方人员无故迟到的，甲方将视情节给予<u>100~200元/次</u>的罚款，对乙方人员无故</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >缺席的，甲方将视情节给予<u>200~500元/次</u>的罚款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>13、合同生效与终止</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;本合同自签字盖章之日起生效，至甲乙双方履行完各自的权利义务或按本合同有关规定解除合同后，本合同即告终止。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>14、争议的解决方法</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;本合同在履行过程中，若发生争议，由甲乙双方协商解决；协商不成的，依法向甲方所在地人民法院起诉。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;<b>15、合同份数</b></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;本合同一式贰份；甲方执壹份，乙方执壹份。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >（以下无正文）</td>
   </tr>
   </table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >甲方：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	   <td width="50%"  height="40" >乙方：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <BR>  
     <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >大连王的時尚装饰有限公司 </td>
	   <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >法定代表人： </td>
       <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >总经理： </td>
       <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >主管领导：</td>
       <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >经&nbsp;办&nbsp;人：  </td>
	   <td width="50%"  height="40" >&nbsp;</td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >签订日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日   </td>
	   <td width="50%"  height="40" >&nbsp;</td>
  </tr>
</table>
</body>
</html> 

