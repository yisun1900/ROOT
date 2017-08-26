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
String lxfs=null;
String fwdz=null;
String sjs=null;
String hth=null;
String zjxm=null;
String fwmj=null;
String email=null;
String kgrq=null;
String jgrq=null;
String gqts=null;
String sgd=null;
String sgdmc="";
String sgddh="";


String hxbm=null;
String hxmc=null;
String fkfabm=null;
double wdzgce=0;
double zqguanlif=0;
double zqsuijin=0;
double guanlif=0;
double suijin=0;
double qye=0;
double a=0;
double b=0;
double c=0;

String sjsdh="";
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
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,fwmj,email,hth,kgrq,jgrq,gqts,sgd,fgsbh,dwbh,hxbm,wdzgce,zqguanlif,zqsuijin";
	ls_sql+=" FROM crm_khxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		email=cf.fillNull(rs.getString("email"));
		hth=rs.getString("hth");
		
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		gqts=cf.fillNull(rs.getString("gqts"));
		sgd=cf.fillNull(rs.getString("sgd"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		wdzgce=rs.getDouble("wdzgce");
		zqguanlif=rs.getDouble("zqguanlif");
		zqsuijin=rs.getDouble("zqsuijin");
	}
	 rs.close();
	 ps.close();
	 
    ls_sql="select fkfabm";
	ls_sql+=" from  cw_khfkfa";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfabm=rs.getString("fkfabm");
	}
	rs.close();
	ps.close();
	if("01".equals(fkfabm))
	{
		ls_sql="select qye,guanlif,suijin from crm_khxx where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qye=rs.getDouble("qye");
			guanlif=rs.getDouble("guanlif");
			suijin=rs.getDouble("suijin");
		}
		a=qye;
		/*a=((qye+guanlif+suijin)*0.60);
		b=((qye+guanlif+suijin)*0.35);
		c=((qye+guanlif+suijin)*0.05);*/
		rs.close();
		ps.close();
	}
	if("02".equals(fkfabm))
	{
		ls_sql="select wdzgce,zqguanlif,zqsuijin from crm_khxx where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wdzgce=rs.getDouble("wdzgce");
			zqguanlif=rs.getDouble("zqguanlif");
			zqsuijin=rs.getDouble("zqsuijin");
		}
		a=wdzgce;
		/*a=((wdzgce+zqguanlif+zqsuijin)*0.60);
		b=((wdzgce+zqguanlif+zqsuijin)*0.35);
		c=((wdzgce+zqguanlif+zqsuijin)*0.05);*/
		rs.close();
		ps.close();
	}
	
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
	
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
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
    <td align="center" colspan="4" height="35"><strong>工程合同</strong>   </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 <td width="50%" height="35"  ><div align="right">合同编号：<u><%=hth%></u></div></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35" colspan="2"  ><strong>发包人（全称）：</strong>&nbsp;<u><%=khxm%></u>&nbsp;&nbsp;&nbsp;</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >通信地址：<u><%=fwdz%></u></td>
	 <td width="50%" height="35"  >邮编：</td>
   </tr>
  <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >联系方式：<u><%=lxfs%></u></td>
	 <td width="50%" height="35"  >E-MAIL：<u><%=email%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35" colspan="2"  ><strong>承包人（全称）：大连王的时尚装饰工程有限公司&nbsp;&nbsp;</strong>&nbsp;&nbsp;</td>
   </tr>
   </table>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;按照《中华人民共和国合同法》、《中华人民共和国建筑法》、《住宅室内装饰装修管理办法》及其他有关法律、行政法规的规定，遵循平等、自愿、公平和诚信的原则，结合本装饰装修工程施工具体情况，双方协商达成如下协议。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第1条&nbsp;工程概况</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1&nbsp;工程名称：<u><%=fwdz%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2&nbsp;工程地点：<u><%=fwdz%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3&nbsp;工程内容：房间类型<u>
      <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>
     </u>，数量<u>&nbsp;&nbsp;&nbsp;</u>套，总建筑面积<u><%=fwmj%></u>平方米。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4&nbsp;承包范围：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）根据发包人确认的设计施工图进行装修施工。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.5&nbsp;承包方式：双方商定采取下列第<u>&nbsp;&nbsp;&nbsp;</u>种承包方式：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）承包人包工包全部材料；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）承包人包工包部分材料；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）承包人包工、发包人包料；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（4）双方约定的其它承包方式：；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.6&nbsp;开工日期：<u><%=kgrq%></u>（签订合同、且发包人支付首付款后承包人开工，且竣工日期相应顺延）</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;竣工日期：<u><%=jgrq%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总日历工期（包括法定节假日）：<u><%=gqts%></u>日</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第2条&nbsp;合同价款与支付</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.1&nbsp;合同价款：大写人民币<u><%=cf.NumToRMBStr(qye)%></u>&nbsp;(RMB&nbsp;<u><%=cf.formatDouble(qye)%></u>元)。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.2&nbsp;合同价款采用方式：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;双方商定本合同人辅部分价款不可减项，水、电、主材部分按实结算。增加的工程项目在工程签证变更时即全额支付。支付后开始施工，如不交增项款，承包人有权不进行增项部分施工，如因增项部分工程影响整体工期，工期相应顺延，承包人不承担任何责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.3&nbsp;付款方式：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）合同签订后三日内，支付人辅部分合同价款的 60% （即：<u><%=cf.formatDouble((a+b+c)*0.6)%></u>元）作为首付款；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）土建部分完工三日内，支付人辅部分合同价款的 35% （即:<u><%=cf.formatDouble((a+b+c)*0.35)%></u>元）；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（3）水、电隐蔽工程结束后，需进行此次工程结算，该项结算款在支付前述第二笔款时多退少补一并结清；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（4）竣工验收后七日内，决算并结清余款，未结清尾款视为放弃保修，承包人对本项目不承担保修责任；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（5）增项工程款项（含主材部分）需全额支付后方可施工；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（6）因发包人提供的主材到场延迟，不影响承包人就已完工部分进行结算。如发包人以此为由不进行结算，每延期一天需支付给承包人50元滞纳金。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第3条&nbsp;施工图纸</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;双方商定施工图纸采取下列第<u>&nbsp;&nbsp;&nbsp;</u>种方式提供：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（1）发包人自行提供施工图纸，图纸一式二份，发包人、承包人各一份。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;（2）由承包人设计施工图纸，图纸一式二份，发包人、承包人各一份。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第4条&nbsp;发包人工作</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1&nbsp;指派<u><%=zjxm%>（<%=zjdh%>）</u>为发包人驻工地代表，负责合同履行。对工程质量、进度、材料进场进行监督检查，办理验收、变更、登记手续和其他事宜。该代表对工程质量、进度、材料及价款的签字确认均视为发包人的行为，由发包人承担责任。发包人变更前述代表的，需及时书面通知承包人，否则视为未变更。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2 &nbsp;开工三日前，发包人要为承包人入场施工创造条件，以不影响施工为原则。包括负责向物业或者房屋管理机构办理申报登记，并应当与物业管理单位签订装饰装修管理服务协议，主动接受监督管理，办理开工手续，并交纳发包人应支付的有关费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.3&nbsp;发包人应遵守房屋管理机构及物业等管理部门的各项规章制度。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.4&nbsp;如需要拆改原建筑主体和承重结构或设备管线（水、电、暖气、煤气管道），发包人负责到有关部门办理审批手续。发包人未办理有关手续，承包人有权对此部分不予施工。发包人擅自拆改原建筑物结构或设备管线或煤气表管，采暖、给排水主要管线，造成的损失和责任由发包人承担。原建筑主体和承重结构或设备管线（水、电、暖气、煤气管道）在签订合同前已被拆改过的，由发包人负责向承包人说明并承担责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.5&nbsp;向承包人提供施工所需的水源、电源，并说明使用注意事项。负责协调与周围邻里的关系。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.6&nbsp;负责清除影响施工的障碍物。对房屋中所滞留的家具、陈设等采取保护措施并承担费用，如施工过程中，因发包人未采取合理的保护措施导致财产损坏的，由发包人承担责任，与承包人无关。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.7&nbsp;开工前应确认施工图纸或作法说明，并向承包人进行现场交底。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.8&nbsp;负责装饰装修所产生垃圾的处理工作并承担因此所发生的费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.9&nbsp;发包人须按《自购商品及外包项目进场日期表》安排相关单位或产品准时进场，并按照承包人现场施工管理规定要求施工。否则由发包人承担相关责任及损失。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.10&nbsp;发包人不得将承包人提供的施工图纸、设计方案等资料擅自复制或转让给第三方，也不得用于本合同以外的项目。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.11&nbsp;发包人在与承包人首次接触至本合同履行完毕过程中不得有意刺探承包人的商业秘密（包括承包人的技术信息、经营信息及客户信息等）。如无意间知晓承包人的商业秘密，发包人须保证不得向第三方及承包人的同行泄露或告知，否则发包人须承担由此引发的法律责任，因此而给承包人造成损失的，由发包人承担赔偿责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.12&nbsp;施工过程中，发包人未与承包人代表协商私自要求工人更改施工内容，所引起的质量问题由发包人承担责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.13&nbsp;发包人负责自购商品的搬运、验收、退货、保修等事宜及承担相关费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.14&nbsp;未办理验收手续，发包人提前使用或擅自动用，视为工程已竣工并经发包人验收合格，由此产生的工程质量责任及造成损失由发包人负责。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.15&nbsp;在工程停工期间，由发包人负责对现场的一切设施和工程成品进行保护，在承包人再次进场施工时，双方对现场设施及工程成品进行交接确认。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.16&nbsp;由发包人自行施工的工程项目，应由发包人做好成品保护，如该部分工程发包人委托承包人保护，承包人将收取相应的费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.17&nbsp;发包人所留联系电话、通讯地址、E-mail 等信息须保证真实有效，承包人将通过发包人所留的联系电话、通讯地址、
E-mail等渠道发送包括但不限于验收通知、催款通知等在内的一切文件。如因所留信息有误，发包人未接到承包人发出的通知，将视为发包人已收到承包人所发出的通知并认可通知内容，不会因通知内容而追究承包人相关责任。承包人依据发包人所留上述联系方式发送的相应通知、函件等所有材料与本合同具有同等法律效力。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第5条&nbsp;承包人工作</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.1&nbsp;指派<u><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgddh%>）</u>为承包人驻工地代表，按要求组织施工，保质、保量、按期完成施工任务。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.2&nbsp;严格按照图纸或作法说明及质量标准进行施工，做好各项质量检查记录。严格执行施工规范、安全操作规程、防火安全规定、环境保护规定。参加竣工验收，编制工程结算。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.3&nbsp;承包人向发包人推荐使用不符合国家标准的装饰装修材料，造成经济损失的，由承包人承担相应责任，但事先经发包人认可的，承包人免于承担责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.4&nbsp;严格遵守规定的装饰装修施工时间，降低施工噪音，减少环境污染。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.5&nbsp;未经发包人同意及有关部门批准，施工中不得随意拆改原建筑物结构及各种设备管线。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.6&nbsp;除合同第4.6条、第4.15条和第4.16条约定外，工程竣工未移交发包人之前，除不可抗力事件外，负责对现场的一切设施和工程成品进行保护。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第6条&nbsp;材料供应</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.1&nbsp;装饰装修工程使用的材料和设备必须符合国家标准。禁止使用国家明令淘汰的建筑装饰装修材料和设备。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.2&nbsp;由发包人供应的材料、设备发生了质量问题或规格差异，对工程造成损失，责任由发包人承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.3&nbsp;凡由承包人采购的材料、设备应按照设计和规范要求采购工程需要的材料，如不符合质量要求或规格有差异，应禁止使用。若已使用，对工程造成的经济损失由承包人承担相应责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第7条&nbsp;安全生产和防火</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.1&nbsp;发包人提供的施工图纸或作法说明，应符合《中华人民共和国消防法》和有关防火设计规范。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.2&nbsp;发包人提供确认的图纸或作法说明，违反有关安全操作规程、消防规定和防火设计规范，导致发生安全或火灾事故，发包人应承担由此产生的一切经济损失。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.3&nbsp;承包人进行装饰装修活动，要严格遵守施工安全操作规程，按照规定采取必要的安全防护和消防措施，不得擅自动用明火和进行焊接作业，保证作业人员和周围住房及财产的安全。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.4&nbsp;由于承包人在装饰装修设计和施工过程中违反消防法及有关安全操作规程，导致发生安全或火灾事故，应承担由此引发的一切经济损失。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第8条&nbsp;工程质量及验收</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.1&nbsp;双方约定本工程质量应达到国家质量评定合格标准。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.2&nbsp;优良工程等级增加的经济支出按省市有关规定执行。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.3&nbsp;本工程以施工图纸、作法说明、设计变更及国家制定的现行装饰装修施工及验收规范为质量评定验收标准。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.4&nbsp;发承包双方应及时办理隐蔽工程和中间的检查与验收手续。承包人于验收前1天通知发包人，发包人不按时参加隐蔽工程和中间验收，承包人可自行验收，视为发包人确认承包人的验收意见。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.5&nbsp;工程竣工日即验收日（如有工期变更，以最后一次批准的变更日期为准），发包人应进行竣工验收。如发包人不按时进行竣工验收，视为发包人确认承包人的验收意见。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.6&nbsp;在竣工验收中双方确认的工程质量问题，承包人负责维修，但维修期间不计入工期。维修结束日即为验收日。发包人应进行竣工验收。如发包人不按时进行竣工验收，视为发包人确认承包人的验收意见。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;8.7&nbsp;装饰装修工程竣工后，承包人负责采购的电器设备，应当向发包人提交已从材料供应商处取得的相关文件。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第9条&nbsp;工程变更</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.1&nbsp;发包人对工程项目及施工方式如需变更，双方均应及时办理变更洽商签证，方能进行对变更项目施工，并以此为依据变更相应价款及工期。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.2&nbsp;承包人提出合理化建议涉及到设计变更和对原定材料的换用，需与发包人协商解决。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;9.3&nbsp;按照合同规定，增项工程款未全额支付前，增项工程不予施工，由此拖延的工期及其它损失由发包人承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第10条&nbsp;结算</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.1&nbsp;发包人未按时进行竣工验收的，承包人验收合格后，将通知发包人进行工程结算，自承包人通知7日内，发包人未按时与承包人进行竣工结算，视为发包人认可承包人的工程决算额，发包人不得再就竣工结算数额提出异议。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.2&nbsp;发包人按时进行竣工验收的，应在工程竣工验收合格后7日内与承包人进行工程结算，发包人未按时与承包人进行竣工结算，视为发包人认可承包人的工程决算额，发包人不得再就竣工结算数额提出异议。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;10.3&nbsp;工程结算意见确认后（即10.1条、10.2条的情况下），发包人即时向承包人结清工程尾款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第11条&nbsp;工程保修</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.1&nbsp;工程款应按合同约定的时间全部结清。发包人拒绝或逾期支付剩余工程款的，视为发包人放弃保修，承包人对本项目不承担保修责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.2&nbsp;承包人对住宅室内 装饰装修工程 保修期为二年，装修材料及部品保修期为一年，光源保修期为三个月，防水五年，终身有偿维护，自装修工程竣工验收合格之日起计算。发包人要求维修时，请向承包人提交结算发票及保修凭证。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;11.3&nbsp;保修期内由于承包人施工质量问题，承包人负责维修。非保修范围，发包人不享受免费维修或更换服务。（详见附件
1 质量保修书）</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第12条&nbsp;违约责任</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.1&nbsp;由于发包人原因导致延期开工或中途停工，应承担违约责任。每停工或窝工一天，发包人支付给承包人RMB50.00元违约金，但违约金总额不超过5000元。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.2&nbsp;由于承包人原因致使工期延误，每延误一天，承包人支付给发包人RMB50.00元违约金，但违约金总额不超过5000元。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.3&nbsp;发包人在接到承包人的进度款付款通知3日内，应全额支付工程进度款，逾期不交，承包人有权停工。如停工日达到10日发包人仍未支付进度款，承包人有权终止合同，终止合同后，双方就已施工部分进行结算。发包人交款后，因停工造成的工程延期，工期应顺延。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.4&nbsp;因一方原因，合同无法继续履行时，应提前十日以书面形式通知对方，办理合同终止协议，并由责任方赔偿对方由此造成的经济损失。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.5&nbsp;发包人不按时结算，需向承包人支付违约金，从承包人通知结算之日起，每延误一天，发包人支付给承包人RMB50.00元违约金，但违约金总额不超过5000元。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.6&nbsp;合同签订后，双方不得无故解除合同。若一方解除合同，需向对方支付违约金，违约金额为合同金额的30%如工程已开工，发包人需向承包人支付已施工部分的工程款。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.7&nbsp;合同签订后，因发包人原因更退产品（未拆改包装），按照减项处理，发包人需向承包人支付欲退产品金额的30%的管理费用，如该笔费用低于给承包人造成的实际损失，发包人还需补足差额部分。对于拆改包装或已使用的产品，承包人不予退货。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;12.8&nbsp;因不可抗力的原因引起承包人无法履行合同义务，不承担违约责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第13条&nbsp;争议的解决方式</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;13.1&nbsp;本合同在履行过程中发生的争议，由双方协商解决，也可由有关部门调解；协商或调解不成的，依法向承包人所在地人民法院起诉。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第14条&nbsp;不可抗力</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;14.1&nbsp;本合同中的不可抗力包括战争、动乱、空中飞行物坠落或其他非发包人、承包人责任造成的爆炸、火灾，以及风、雨、洪、震等自然灾害事件。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;14.2&nbsp;不可抗力事件发生后，双方当事人应尽力采取补救措施，但仍未能避免损失的情况下，可不负赔偿责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第15条&nbsp;保险</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;15.1&nbsp;承包人负责办理施工人员意外伤害保险。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第16条&nbsp;附则</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;16.1&nbsp;本合同未尽事宜，双方可协商签订补充条款，补充条款视为本合同的组成部分，效力等同。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;16.2&nbsp;本合同附件：</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;附件1：住宅室内装饰装修质量保修书</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;附件2：室内装饰装修施工图</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;附件3：装修工程（预）算书</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;附件4：松下整体橱柜客户须知、图纸、报价单</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第17条&nbsp;合同生效</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;17.1&nbsp;自双方签字盖章之日起，合同生效， 双方签字盖章日期不一致的，以最后签字盖章的日期为准。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第18条&nbsp;合同份数</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;本合同正本叁份，具有同等效力，由发包人保存壹份，承包人保存贰份。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;第19条&nbsp;合同备案、鉴证</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;合同备案、鉴证：（现场签字）</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >（以下无正文）</td>
   </tr>
</table>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;发&nbsp;&nbsp;包&nbsp;&nbsp;人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;承&nbsp;&nbsp;包&nbsp;&nbsp;人：松下亿达装饰工程 (大连)有限公司</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;有效证件号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;法定代表人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;授权委托人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;总&nbsp;&nbsp;经&nbsp;&nbsp;理：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;有效证件号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;主管&nbsp;&nbsp;领导：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;</td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;经&nbsp;&nbsp;办&nbsp;&nbsp;人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     <td width="50%" height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
     </table>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;
     <div align="center"><strong>附件1：住宅室内装饰装修质量保修书</strong></div></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;发包人（全称）：<u><%=khxm%></u></strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;承包人（全称）：松下亿达装饰工程（大连）有限公司</strong></td>
   </tr>

   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国建筑法》、《住宅室内装饰装修管理办法》及其他有关法律、行政法规的规定，经协商一致，对<u><%=fwdz%></u>（工程全称）签订装修质量保修书。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;一、装修工程质量保修范围和内容</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;承包人在质量保修期内，按照有关法律、法规、规章的管理规定和双方约定，承担本装修工程质量保修责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;质量保修范围为承包人按照工程合同为发包人购买的材料、设备安装及施工的工程项目，双方另有约定的除外。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;二、质量保修期</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;承包人对住宅室内装饰装修工程保修期为二年，装修材料及部品保修期为一年，光源保修期为三个月，防水五年，终身有偿维护，自装修工程竣工验收合格之日起计算。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;三、质量保修责任</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1．承包人接到报修及投拆电话后在规定的时间内到场访问，对影响生活方面的事故在6小时内到场给予处理，对于复杂的事故在三天至十天内解决。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2．质量保修完成后，由发包人组织验收。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3．电气设备类如热水器、燃气灶、排油烟机等，由发包人持保修卡直接向经销商报修，与承包方无关。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;四、保修费用</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.以下任何一种情况，发包人不能享受免费维修或更换，如需承包人维修，费用由发包人承担。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1&nbsp;由发包人自采材料、设备及外委工程；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2&nbsp;未按规定方法进行使用，自行改造而造成的故障或损坏；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3&nbsp;因火灾、地震、水灾、雷电或其它天灾、公害、潮湿、废气、异常电压、使用指定外电源（电压、频率）等造成的故障或损坏；</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4&nbsp;其它非因承包人责任的事由而造成的故障或损坏。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.5&nbsp;工程竣工验收后，若发包人超过6个月未入住，室内空气过于干燥造成的墙、顶面大面积开裂、翘皮，石膏板、木质吊顶变形开裂及木质家具变形开裂等现象。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2. 保修期内上门维修只负责对影响使用部位进行处理，不负责大面积整体维修和改变原设计方案；若因新旧及色差原因影响美观、发包人要求整体处理的，承包人需酌情收费。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3. 保修期内出现维修情况，承包人只负责维修，不负责赔偿等其他任何责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4. 保修期之后发包人需进行维修时，维修费用由发包人自行负担，收费标准按承包人收费标准执行。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><strong>&nbsp;&nbsp;&nbsp;&nbsp;五、其他</strong></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1．发包人在使用前，请仔细阅读“设备使用说明书”或与承包人施工部门进行咨询后，正确使用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2．在维修期间因承包人原因引起责任事故，造成停水时间、停电时间或维修时间超过十天，使发包人无法入住，由承包人给予相应的补偿，补偿费一次性为人民币1000元，该费用包括但不限于发包人及其亲属因此而发生的房屋租赁费、误工费、精神抚慰金等所有费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3. 保修书作为工程合同附件，其有效期至保修期满。</td>
   </tr>
 </table>
</body>
</html>
