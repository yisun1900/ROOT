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
String xb=null;
String fwdz=null;
String lxfs=null;
String yxtxdz=null;
String sjs=null;
String hth=null;
String hyh=null;
String fwmj=null;
String zjxm=null;
String hxbm=null;


double qye=0;
double sjhtje=0;
double dj=0;
String sjsdh="";
String zjdh="";
String ssfgs=null;
String dwbh=null;
String fwytbm=null;
String sjsjb=null;

double a=0;
double b=0;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,lxfs,fwmj,hxbm,hth,fwytbm,hyh";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
		//ssfgs=rs.getString("ssfgs");  
	  
		fwmj=cf.fillNull(rs.getString("fwmj"));
		
		hxbm=cf.fillNull(rs.getString("hxbm"));
	
		hth=cf.fillNull(rs.getString("hth"));
		fwytbm=cf.fillNull(rs.getString("fwytbm"));
		hyh=cf.fillNull(rs.getString("hyh"));
	}
	 rs.close();
	 ps.close();


    ls_sql=" select sjhtje,dj from  crm_sjhtxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{    	
	
        sjhtje=rs.getDouble("sjhtje");
	    dj=rs.getDouble("dj");
	}
	rs.close();
	ps.close();
	a=(sjhtje*0.2);
	b=(sjhtje-sjhtje*0.2);	
	

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
    <td align="center" colspan="4" height="35"><p align="left"><strong>合同编号<u><%=hth%></u></strong></p></td>
   </tr> 
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>住宅室内装饰装修施工 </strong></p></td>
   </tr> 
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><p align="center"><strong>设计合同</strong></p></td>
   </tr> 
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >发包人（全称）：   <u><%=khxm%></u></td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >承包人（全称）：   <u>松下亿达装饰工程（大连）有限公司</u> </td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;按照《中华人民共和国合同法》及其他相关法律法规，发包人将位于<u><%=fwdz%></u>房屋的装饰装修设计委托给承包人。双方遵循平等自愿、公平诚信的原则，就设计事宜，经协商一致达成如下协议。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第1条&nbsp;&nbsp;工程概况：</td>
   </tr>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.1.项目名称：<u><%=fwdz%></u></td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.2.工程地点：<u><%=fwdz%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.3.建筑面积: <u><%=fwmj%></u>平方米</td>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;1.4.主案设计师：<u><%=sjs%></u>&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<u><%=sjsdh%></u></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第2条&nbsp;&nbsp;收费标准（按使用面积收取）</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.1.室内装饰设计收费标准为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>元/M2。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;2.2.软装设计收费标准为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>元/M2。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第3条&nbsp;&nbsp;合同额及付款方式</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.1.合同额</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;设计费总计人民币：<u><%=sjhtje%></u>元（大写：<u><%=cf.NumToRMBStr(sjhtje)%></u>）</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;其中：室内装饰设计费：人民币：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>元；软装设计费：人民币：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>元。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2．付款方式</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2.1. 合同签订当日发包人交纳设计费总额的20%作为设计定金：<u><%=cf.formatDouble(a,"#########")%></u>元。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.2.2.合同签订后三日内交纳设计费余款：<u><%=cf.formatDouble(b,"#########")%></u>元，发包人依约付清前述设计费余款同时，已付定金自动转化为设计费之部分。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3．图纸内容</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3.1. 承包人在收到设计费全款后，需在<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>个工作日完成施工图设计。图纸内容包括平面墙体改动图、平面布置图、效果图、顶面布置图、立面图、相关节点大样图。灯具控制图及插座定位图、水点定位图等，并完成工程预算。</td>
   </tr>
  <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;3.3.2.承包人在收到设计费全款后<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>个工作日完成软装设计意向方案。</td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第4条&nbsp;&nbsp;发包人、承包人双方权利与义务</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.发包人权利与义务</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.1. 发包人须在本合同签订后    日内按承包人的要求向承包人提供设计所需有关资料。包括但不限于：该工程/房屋原建筑平面图、立面图、水、电、空调配置图等。发包人应对前述资料的准确性、完整性负责，因发包人提交的前述资料错误或有瑕疵导致承包人出具的设计图纸错误或不准确的，承包人不承担任何责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.2.发包人应按约定时间与承包人共同进行方案讨论，提出异议，并约定修改设计的期限。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.3.发包人应按合同交纳设计费，设计费属于不退还费用。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.4.发包人需配合承包人履行合同中的各个环节工作，积极配合设计师量房、设计方案沟通、细化核定等。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.5.发包人配合监督承包人设计师的接待服务、解决方案、设计变更等工作质量。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.1.6.发包人若要求改动原有的承重结构及相关的下水位置等，需取得相关部门（包括物业管理、房地产开发商、房屋建筑设计单位及施工单位等）的书面同意，并自行承担相关费用及因改动而导致一切不利后果。承包人不承担由此发生的所有费用及责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.承包人权利与义务</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.1.承包人应根据发包人的设计需要及发包人提供的施工有关资料、现场测量的实际尺寸在双方约定的时间内，完成各个阶段的设计工作（设计图纸及预算），并双方交流后进行修改，达到发包人满意。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.2.承包人负责施工中的设计交底，办理设计变更洽商，参加验收。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.3. 根据国家规定，承包人无权设计修改原有的承重墙体结构，下水位置等，此部分设计内容需发包人另行委托房地产开发商、房屋建筑设计单位及施工单位等负责完</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;成，并由发包人承担相关责任及费用，承包人不承担因此发生的任何费用。</td>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.4.承包人按本合同规定向发包人提供的所有设计文件仅供发包人用于本合同内确定委托承包人设计的工程项目中，非经承包人书面同意，发包人不得擅自更改套用，</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;并移至其他工地使用，扩大该设计文件的应用范围，亦不得转让第三方（仅限发包人在本委托设计项目使用）。以保证承包人的设计版权。否则发包人应支付承包人相当</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;于本合同费用总额30%的违约金，并赔偿承包人因此而产生的一切损失。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.5.本工程设计文件发包人审定后，若发包人提出变更设计需承包人重做设计时，承包人相应顺延向发包人提交设计文件的日期，若重新提供效果图，费用需按标准另计。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;4.2.6.承包人在收到发包人全部设计费后，才能向发包人提供全套设计文本（含图纸、预算）。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第5条&nbsp;&nbsp;违约责任</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;5.1 发包人逾期付款的，每逾期一日，按应付未付款项的【0.02】%支付违约金，逾期达【10】日，承包人有权解除合同定金不予退还。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第6条&nbsp;&nbsp;其他约定</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.1.发包人在认可设计文件及预算的基础上，可与承包人签订工程合同。双方签订工程合同后，本设计合同自动终止，后续工作参见工程合同。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.2.合同履行中所有内容以本合同书为准，任何口头协议及个人行为均视为无效。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.3.本合同自双方签字且加盖承包人公司合同专用章后生效。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;6.4.发包人如未交清设计费，承包人不提供设计文件。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第7条&nbsp;&nbsp;合同违约、终止及争议解决</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.1.如本合同履行过程遇不可抗力因素使合同无法继续履行，本合同终止，双方互不承担违约责任。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.2.本合同执行过程中，如发生争议，双方应尽力协商解决。如协商不成，双方均可向承包人所在地人民法院起诉。</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;7.3.本合同一式贰份，双方各执一份，具有同等法律效力。</td>
   </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >发&nbsp;&nbsp;包&nbsp;&nbsp;人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="40" >承&nbsp;&nbsp;包&nbsp;&nbsp;人：松下亿达装饰工程（大连）有限公司</td>
  </tr>
  <BR>  
     <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >有效证件号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="40" >法定代表人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >授权委托人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="50%"  height="40" >总&nbsp;&nbsp;经&nbsp;&nbsp;理 ：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >有效证件号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="50%"  height="40" >经&nbsp;&nbsp;办&nbsp;&nbsp;人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
  <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="40" >日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
       <td width="50%"  height="40" >日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <BR>  
</table>

<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0"  bgcolor="#000000" style='FONT-SIZE: 30px'>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF">
     <td align="center" colspan="4" height="35">&nbsp;</td>
   </tr>
   <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="4" height="35"><strong>室内装饰设计文本确认单</strong></td>
   </tr>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >发包人：<%=khxm%></td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >承包人：松下亿达装饰工程（大连）有限公司</td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="35" >项目名称：<%=fwdz%></td>
	   <td width="10%"  height="35" ><div align="center">建筑面积：</div></td>
       <td width="40%"  height="35" ><%=fwmj%>平方米</td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >工程地址：<%=fwdz%></td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >设计费总价：(人民币)<%=sjhtje%>元&nbsp;&nbsp;&nbsp;&nbsp;（大写）：<%=cf.NumToRMBStr(sjhtje)%></td>
  </tr> 
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >确认图纸内容：请在相应【&nbsp;&nbsp;&nbsp;&nbsp;】打“√” </td>
  </tr>  
</table>
<p>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px' rules=cols>
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >1.原始平面图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >调整图纸内容简述</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >2.平面布置图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >3.顶面布置图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >备注：</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >4.相关立面图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >此栏不填写视为图纸无调整</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >5.效果图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >6.室内装饰设计预算书：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >7.室内装饰设计主材明细及预算书：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >8.平面墙体改动图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >9.地面材质分布图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >10.灯具控制图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >11.插座定位图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >12.水点定位图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >13.暖气及空调定位图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" ><table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>发包人签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</table></td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >14.节点详图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" ><table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>主案设计师签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</table></td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="69%"  height="35" >15.其它图：【&nbsp;&nbsp;&nbsp;&nbsp;】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>张</td>
	   <td width="31%"  height="35" >设计主管签字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>  
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="9%"  height="35" ><div align="right">备注：&nbsp;</div></td>
	   <td width="91%"  height="35" >&nbsp;&nbsp;&nbsp;1-7为初步设计图纸内容：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1-15为施工图设计图纸内容：</td>
  </tr>  
</table> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px' rules=none> 
   <tr bgcolor="#FFFFFF" >
	   <td  height="35" colspan="3" >施工图图纸内容均已经发包人认可，同意交费&nbsp;&nbsp;</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="33%"  height="35" >发包人签字：</td>
       <td width="33%"  height="35" >主案设计师签字：</td>
	   <td width="34%"  height="35" >设计主管签字：</td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
	   <td width="33%"  height="35" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
	   <td width="33%"  height="35" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
       <td width="34%"  height="35" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</td>
  </tr>    
</table>
</body>
</html>