<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE3 {
	font-size: 30px;
	font-weight: bold;
	font-family: "宋体";
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
String cxhdbm="";
String cxhdbmxq="";
String cxhdbmzh="";
String sjkgrq="";
String sjjgrq="";

String bxkssj="";
String bxjzsj="";


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

	ls_sql="SELECT bxkssj,bxjzsj,sjkgrq,sjjgrq,khxm,lxfs,fwdz,sjs,lxfs,hth,cxhdbm,cxhdbmxq,cxhdbmzh,crm_khxx.fgsbh,sfzhm,fwmj,hxmc,dianz,qdr,dwmc";
	ls_sql+=" FROM crm_khxx,dm_hxbm,sq_dwxx";
    ls_sql+=" where crm_khxx.hxbm=dm_hxbm.hxbm(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	    sjs=cf.fillNull(rs.getString("sjs"));
	  
		hth=cf.fillNull(rs.getString("hth"));

	    cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		dianz=cf.fillNull(rs.getString("dianz"));
		qdr=cf.fillNull(rs.getString("qdr"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
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
<div align="center" class="STYLE3">家装工程保修单</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
        
    
       <tr bgcolor="#FFFFFF">
         <td height="44" align="right">甲方</td>
         <td height="44"><%=khxm%></td>
         <td height="44" align="right">合同号：</td>
         <td height="44"><%=hth%></td>
       </tr>
  <tr bgcolor="#FFFFFF">
    <td height="43" align="right">甲方代理人</td>
    <td width="30%" height="43">&nbsp;</td>
    <td width="20%" align="right">联系电话：</td>
    <td width="30%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="44" align="right">乙方：</td>
    <td height="44" colspan="3">松下亿达<%=fgsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td align="right">法定代表人：</td>
    <td><strong>&nbsp;</strong></td>
    <td align="right">联系电话：</td>
    <td>8008106655</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td  align="right">家装工程地址</td>
    <td  colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td align="right">开工日期</td>
    <td><%=cf.formatDate(sjkgrq)%></td>
    <td align="right">竣工日期</td>
    <td><%=cf.formatDate(sjjgrq)%></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td width="20%" align="right">保修期限</td>
    <td colspan="3">自&nbsp;<%=cf.formatDate(bxkssj)%>&nbsp;&nbsp;&nbsp;至&nbsp;<%=cf.formatDate(bxjzsj)%></td>
  </tr>
</table>

<BR>
<BR>  
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 16px'>
  
  <tr bgcolor="#FFFFFF">
    <td ><p>备注： </p></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td >1、自竣工验收之日起，计算装饰装修保修期为两年，有防水要求的厨房、卫生间防渗</td>
  </tr>
  
  <tr  bgcolor="#FFFFFF">
    <td >&nbsp;&nbsp;&nbsp;漏工程保修期为五年；保修项目为合同约定施工项目，因减项变更的项目不在保修</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td >&nbsp;&nbsp;&nbsp;范围内；</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
  <td >2、保修期内因乙方施工、用料不当的原因造成的装饰装修质量问题，乙方须及时无条 </td>
  </tr>

  <tr  bgcolor="#FFFFFF">
    <td  >&nbsp;&nbsp;&nbsp;件进行维修；</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td  >3、保修期内因甲方使用、维护不当造成饰面损坏或不能正常使用，乙方酌情收费维修； </td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td  >4、超过报修期，乙方将按现行报价收取维修费用。</td>
  </tr>
  <tr  bgcolor="#FFFFFF">
    <td  >5、本保修单作为售后维修的唯一凭证。</td>
  </tr>
</table>


</body>
</html>
 


