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
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
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
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
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
    /*ls_sql="select zjxm";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();
	*/
		
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
	
	ls_sql=" select	sjsjb from sq_yhxx";
	ls_sql+=" where yhmc ='"+sjs+"' and zwbm='04'";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
	  sjsjb=cf.fillNull(rs.getString("sjsjb"));
	}
	rs.close();
	ps.close();
	
	
//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+zjxm+"' and zwbm='05'";
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
 
   


	//设计师电话

	/*	ls_sql=" select dh from sq_yhxx";
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

	//工长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	//ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ls_sql+=" where  ssfgs='"+ssfgs+"' and   yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();*/
	
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

%>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
       <tr bgcolor="#FFFFFF"> 
   
    <td align="center" colspan="4" height="35"><strong><u>《住宅室内装饰设计委托合同》机打标准附件</u></strong>   </td>
 
   </tr> 
   <tr bgcolor="#FFFFFF"> 
   
    <td align="center" colspan="4" height="35"><strong>合同编号：<u><%=hth%></u></strong>   </td>
  
   </tr> 
    <tr bgcolor="#FFFFFF"> 
	<td width="23%" height="35"><strong>1、合同双方</strong></td>
    <td width="36%">&nbsp;</td>
    <td width="20%">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">委托方（甲方）：</td>
    <td><u><%=khxm%></u></td>
    <td>联系电话：</td>
    <td><u><%=lxfs%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">甲方代理人：</td>
    <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
    <td>联系电话：</td>
    <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">地址:</td>
    <td colspan="3"><u><%=fwdz%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">承接方（乙方）：</td>
    <td><u>松下亿达装饰工程（大连）有限公司 </u></td>
    <td></td>
    <td></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">营业执照号：</td>
    <td ><u>110105005815247</u></td>
    <td colspan="2">建筑资质等级证书号：
  <u>B30340110108162 </u></td>
  </tr>
   <tr bgcolor="#FFFFFF">
    <td height="30">办公地点：</td>
    <td colspan="2"><u>大连市西岗区东北路104号亿达新世界B座松下亿达 </u></td>
    
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">工程设计人：<u><%=sjs%></u></td>
    <td>联系电话：<u><%=sjsdh%></u></td>
    <td>设计师级别：</td>
    <td><u><%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb,true);
%></u></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="35"><p><strong>2.项目概况 </strong></p></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">2.1 设计项目地址：</td>
    <td colspan="3"><u><%=fwdz%></u></td>
    
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td height="30">房型:<u>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%></u></td>
    <td>用途：<u><%
	cf.selectItem(out,"select fwytbm,fwytmc from dm_fwytbm order by fwytbm",fwytbm,true);
%></u></td>
    <td colspan="2">套内建筑面积：<u><%=fwmj%></u>平方米</td>
  
  </tr>
  <tr bgcolor="#FFFFFF">
  <td>会员卡号：</td>
  <td><%=hyh%></td>
  <td></td>
  <td></td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"><strong>3．设计收费及支付方式 </strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="30" colspan="4" >3.1.5 甲方委托乙方室内设计，其设计收费标准按套内建筑面积计算，费用为每平方米
     ￥<u><%=dj%></u>元，乙方收取设计费共计￥<u><%=sjhtje%></u>元。</td>
  </tr>
 
   <tr  bgcolor="#FFFFFF">
     <td height="30" colspan="4" >&nbsp;</td>
  </tr> <tr  bgcolor="#FFFFFF">
     <td height="30" colspan="4"  >（大写:<%=cf.NumToRMBStr(sjhtje)%>）</td>
  </tr>
     <tr bgcolor="#FFFFFF" >
           <td height="300">&nbsp;</td>
           <td></td>
           <td></td>
           <td>&nbsp;</td>
  </tr>
   <tr bgcolor="#FFFFFF" >
           <td height="100">&nbsp;</td>
           <td>甲方签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
           <td colspan="2">乙方签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
          
  </tr>
		  <tr bgcolor="#FFFFFF" >
           <td colspan="4"><b> 备注：此面朝上，装订于《住宅室内装饰设计委托合同》最后一页</b></td>
         </tr>
</table>

</body>
</html>
