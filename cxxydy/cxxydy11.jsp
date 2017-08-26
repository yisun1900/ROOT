<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 18px;
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
String zjxm=null;

String ssfgs=null;
String dwbh=null;
String fwytbm=null;
String cxhdbm="";
String cxhdbmxq="";
String cxhdbmzh="";



String fgsmc="";
String sfzhm="";
String fwmj="";
String hxmc="";
String dianz="";
String qdr="";
String dwmc="";

double dj=0;
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,lxfs,hth,fwytbm,cxhdbm,cxhdbmxq,cxhdbmzh,crm_zxkhxx.ssfgs,sfzhm,fwmj,hxmc,dianz,qdr,dwmc";
	ls_sql+=" FROM crm_zxkhxx,dm_hxbm,sq_dwxx";
    ls_sql+=" where crm_zxkhxx.hxbm=dm_hxbm.hxbm(+) and crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
	  
		hth=cf.fillNull(rs.getString("hth"));
		fwytbm=cf.fillNull(rs.getString("fwytbm"));

	    cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		dianz=cf.fillNull(rs.getString("dianz"));
		qdr=cf.fillNull(rs.getString("qdr"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	double ssdj=0;
	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm in('51')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select dwmc ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();


	
	//提取公司促销活动备注
	 ls_sql="select  dj";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  cxhdmc='"+cxhdbm+"' and  fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dj=rs.getDouble("dj");
	}
	rs.close();
	ps.close();
	

	if (ssdj<dj)
	{
		out.println("错误！实收订金不足，实收："+ssdj+"，应收："+dj);
		return;
	}


	
	
}	
catch (Exception e) {
    out.print("Exception: " + e);
    out.print("<BR>SQL=" + ls_sql);
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

%>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
       <tr bgcolor="#FFFFFF"> 
   
    <td align="left"  height="35" colspan="4"><div align="center" class="STYLE2">松下亿达<%=fgsmc%>促销活动协议书</u></strong> </div>
      </div></td>
   </tr> 
    
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2">委托方(甲方)：<u><%=khxm%></u></td>
    <td colspan="2">联系电话：<u><%=lxfs%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="2">身份证号：<strong><u><%=sfzhm%></u></strong></td>
    <td height="35">户型结构：<u><%=hxmc%></u></td>
    <td height="35">建筑面积：<u><%=fwmj%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="4">甲方工程地址：<u><%=fwdz%></u></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" colspan="4">承接方（乙方）：松下亿达<%=fgsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" height="35">营业经理：<u><%=dianz%></u></td>
    <td width="20%">洽谈人员：<u><%=qdr%></u></td>
    <td width="33%">签约店面：<u><%=dwmc%></u></td>
    <td width="22%">签约时间：<u><%=cf.today()%></u></td>
  </tr>
</table>
<BR>  
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  
  <tr bgcolor="#FFFFFF">
    <td height="35" >
      &nbsp;&nbsp;&nbsp;&nbsp;尊敬的客户，感谢您选择松下亿达装饰，为了您享受更优质的服务，方便您参加促销活动，    </td>
  </tr>


  <tr bgcolor="#FFFFFF">
    <td height="35" >敬请您关注以下几点：</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="35" >一、本次促销活动的主题是<U><B>&nbsp;<%=cxhdbm%>&nbsp;</B></U>，具体内容以松下亿达公司促销细则为准；</td>
  </tr>
  
  <tr  bgcolor="#FFFFFF">
  <td height="35" >二、甲方诚意参加乙方的<U><B>&nbsp;<%=cxhdbm%>&nbsp;</B></U>促销活动，并交纳促销活动定金<U><B>&nbsp;￥<%=cf.formatDouble(dj,"###")%>&nbsp;</B></U>元，</td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td height="35"  >&nbsp;&nbsp;&nbsp;&nbsp;作为甲方参加本次促销活动的资格保证；</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td height="35"  >三、乙方服务人员上门测量完毕后，于测量<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日后为甲方出具相关设计图纸；</td>
  </tr>
 
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >四、如甲方对乙方设计方案不满意，可及时向乙方店面营业经理提出申请更换人员；</td>
  </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">五、定金用于装修工程完工后冲抵家装合同尾款； </p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">六、按照合同法规定，定金交纳后不予退还；</p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">七、甲方确认参加的促销活动，乙方已按促销活动方案做好筹划工作，甲方不能以任何理由进行更换； </p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">八、甲方必须将款项直接交至乙方财务部，并取得正式收款凭证，收款凭证须盖有收款专用章；</p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">九、本次促销活动的解释权归松下亿达公司所有； </p></td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  >十、本协议一式两份，甲乙双方各执一份，双方发生争议时，应协商解决，若诉讼由乙方所在地</td>
   </tr>
   <tr  bgcolor="#FFFFFF">
     <td height="35"  ><p align="left">&nbsp;&nbsp;&nbsp;&nbsp;人民法院管辖。</p></td>
   </tr>
</table>

<BR>  
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="35" >甲方签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="35" >乙方代表签字（盖章）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
   <tr bgcolor="#FFFFFF" >
	   <td width="50%"  height="35" >日&nbsp;&nbsp;&nbsp;&nbsp;期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	   <td width="50%"  height="35" >日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
  </tr>
</table>

</body>
</html>
 


