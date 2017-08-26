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


String khxm=null;
String xb=null;
String  fwdz=null;
String  lxfs=null;
String  yxtxdz=null;
String sjs=null;
String hth=null;
String fwmj=null;
String zjxm=null;
String hxbm=null;
String hyh=null;

double qye=0;
double tchtje=0;
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
		
    ls_sql=" select tchtje,dj from  crm_tchtxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{    	
	
         tchtje=rs.getDouble("tchtje");
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
<table border="0" width="100%" cellspacing="0" cellpadding="1"   style='FONT-SIZE: 14px'>
       <tr bgcolor="#FFFFFF"> 
     <td align="left" colspan="4" height="35"><div align="center"><strong>《家庭居室装饰装修工程施工合同》套餐意向书标准文件</strong></div></td>
   </tr> 
   <tr bgcolor="#FFFFFF"> 
   
    <td align="left" colspan="3" height="35"><strong>合同编号：<u><%=hth%></u></strong>   </td>
   <td width="21%" align="center"></td>
   </tr> 
    <tr bgcolor="#FFFFFF"> 
	<td width="23%" height="35"><strong>1、合同双方</strong></td>
    <td width="34%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
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
    <td>建筑资质等级证书号： <u>B30340110108162 </u></td>
    <td></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">营业执照号：</td>
    <td ><u>110105005815247</u></td>
    <td colspan="2">&nbsp;</td>
  </tr>
   <tr bgcolor="#FFFFFF">
    <td height="30">办公地点：</td>
    <td colspan="2"><u>大连市西岗区东北路104号亿达新世界B座松下亿达丽泽店 </u></td>
    
    <td>&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="35"><p><strong>2.工程情况 </strong></p></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30">2.1 工程地点：</td>
    <td colspan="3"><u><%=fwdz%></u></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td height="30">工程户型:</td>
    <td><u>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%>
    </u></td>
    <td>工程套内建筑面积：</td>
    <td><u><%=fwmj%></u>平方米</td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35">套餐意向书金额：</td>
    <td><u><%=tchtje%></u></td>
    <td>大写：</td>
    <td><%=cf.NumToRMBStr(tchtje)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td height="35">会员卡号：</td>
  <td><%=hyh%></td>
  <td></td>
  <td></td>
  </tr>
     <tr bgcolor="#FFFFFF" >
       <td height="34"><strong>3.合同内容 </strong></td>
       <td></td>
       <td></td>
       <td>&nbsp;</td>
     </tr>
     <tr bgcolor="#FFFFFF" >
       <td height="53" colspan="4"><p align="left">经甲乙双方友好协商，就乙方承接甲方居室装饰装修工程施工达成如下协议： <br>
         3.1&nbsp;&nbsp;甲方选择乙方提供的松下亿达装修项目。 <br>
         3.2&nbsp;&nbsp;双方签订此意向书后，甲方交纳2000元（大写：贰仟元整）定金。 <br>
         3.3&nbsp;&nbsp;乙方自收到定金后，安排设计师上门测量，并陪同甲方根据其选定的套餐风格选择商品，出具施工图。 <br>
         3.4&nbsp;&nbsp;双方达成一致意见，签署施工合同。签订施工合同后，定金转为工程首付款。 <br>
         3.5&nbsp;&nbsp;甲方在乙方安排设计师上门测量前可随时要求退还此定金。办理定金退还手续时，甲方需持该意向书原件和交款凭证办理。如乙方已安排测量，退还定金1000元。<br>3.6&nbsp;&nbsp;该意向书一式3份，甲方持1份，乙方持2份</p>           </td>
  </tr>
  <tr>
    <td colspan="4" height="70"></td>
  </tr>

   <tr bgcolor="#FFFFFF" >
           <td colspan="2" height="100" align="center">甲方签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
           <td colspan="2" align="center">乙方签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
		  <tr bgcolor="#FFFFFF" >
           <td colspan="4"><strong>备注：此意向书在客户确定选择套餐方案时签署，一式三份，客户一份，其他随施工合同一并转财务。</strong></td>
         </tr>
</table>

</body>
</html>
