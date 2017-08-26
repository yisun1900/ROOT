<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
double hkze=0;
double wdzje=0;
double htcxhdje=0;
String lrr=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
String zt=request.getParameter("zt");
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hkze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同总额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htcxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));

String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppmc=null;
	String gys=null;
	ls_sql="select sq_gysxx.ppmc,sq_gysxx.gys ";
	ls_sql+=" from  sq_gysxx,sq_ppgyssqfgs";
	ls_sql+=" where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh ";
	ls_sql+=" and sq_ppgyssqfgs.ssfgs='"+fgsbh+"' and sq_gysxx.gysmc='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		ppmc = rs.getString("ppmc");			    
		gys = rs.getString("gys");			    
	}
	rs.close();
	ps.close();

	if (ppmc==null)
	{
		out.println("<BR>！！！错误，[品牌供应商名称]："+ppbm+"无对应的：供应商、品牌");
		return;
	}



	ls_sql="insert into jc_zcysd ( ddbh,khbh,zcdlbm,zcxlbm,ppbm,gys,ppmc,wdzje,hkze,htcxhdje ";
	ls_sql+=" ,zqclf,zhclf,ycf,qtf,lrr,lrsj,dwbh,fgsbh,bz,clzt ) ";
	ls_sql+=" values (?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,khbh);
	ps.setString(3,zcdlbm);
	ps.setString(4,zcxlbm);
	ps.setString(5,ppbm);
	ps.setString(6,gys);
	ps.setString(7,ppmc);
	ps.setDouble(8,wdzje);
	ps.setDouble(9,hkze);
	ps.setDouble(10,htcxhdje);

	ps.setDouble(11,0);
	ps.setDouble(12,0);
	ps.setDouble(13,0);
	ps.setDouble(14,0);
	ps.setString(15,lrr);
	ps.setDate(16,lrsj);
	ps.setString(17,dwbh);
	ps.setString(18,fgsbh);
	ps.setString(19,bz);
	ps.setString(20,"00");

	ps.executeUpdate();
	ps.close();



	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>