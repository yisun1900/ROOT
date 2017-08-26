<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010102")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%

String ls=null;
String dwbh=null;
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String bz=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
dwmc=cf.GB2Uni(request.getParameter("dwmc"));
dwjc=cf.GB2Uni(request.getParameter("dwjc"));
ssdw=cf.GB2Uni(request.getParameter("ssdw"));
dwlx=cf.GB2Uni(request.getParameter("dwlx"));
dwdz=cf.GB2Uni(request.getParameter("dwdz"));
dwfzr=cf.GB2Uni(request.getParameter("dwfzr"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
dwcz=cf.GB2Uni(request.getParameter("dwcz"));
email=cf.GB2Uni(request.getParameter("email"));
bz=cf.GB2Uni(request.getParameter("bz"));
String hthqz=cf.GB2Uni(request.getParameter("hthqz"));
String cxbz=cf.GB2Uni(request.getParameter("cxbz"));
String sfjms=cf.GB2Uni(request.getParameter("sfjms"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String bianma=cf.GB2Uni(request.getParameter("bianma"));
String ssdqbm=cf.GB2Uni(request.getParameter("ssdqbm"));
String dwflbm=cf.GB2Uni(request.getParameter("dwflbm"));
String dzbjbz=cf.GB2Uni(request.getParameter("dzbjbz"));
String ssfw=cf.GB2Uni(request.getParameter("ssfw"));
String dwjb=cf.GB2Uni(request.getParameter("dwjb"));

java.sql.Date kdsj=null;
java.sql.Date gdsj=null;
ls=request.getParameter("kdsj");
try{
	if (!(ls.equals("")))  kdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开店时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdsj");
try{
	if (!(ls.equals("")))  gdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[关店时间]类型转换发生意外:"+e);
	return;
}
String dmxs=cf.GB2Uni(request.getParameter("dmxs"));
int bzrs=0;
ls=request.getParameter("bzrs");
try{
	if (!(ls.equals("")))  bzrs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准人数]类型转换发生意外:"+e);
	return;
}
 

 
   

String kfdh=cf.GB2Uni(request.getParameter("kfdh"));
String xuhao=cf.GB2Uni(request.getParameter("xuhao"));
 
  
  String dhqh=cf.GB2Uni(request.getParameter("dhqh"));

String wheredwbh=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (wheredwbh.equals("99999"))
	{
		if (!wheredwbh.equals(dwbh))
		{
			out.println("错误！总部编码[99999]不能改变");
			return;
		}
	}
	if (dwbh.length()!=5)
	{
		out.println("错误！[单位编号]长度必须5位");
		return;
	}

	 conn.setAutoCommit(false);

	
	ls_sql="update sq_dwxx set dwbh=?,dwmc=?,dwjc=?,ssdw=?,dwlx=?,dwdz=?,dwfzr=?,dwdh=?,dwcz=?,email=?   ,bz=?,dqbm=?,sfjms=?,hthqz=?,cxbz=?,ssfgs=?,bianma=UPPER(?),ssdqbm=?,dwflbm=?,ssfw=?   ,dwjb=?,kdsj=?,gdsj=?,dmxs=?,bzrs=?,kfdh=?,xuhao=?,dhqh=?";
	ls_sql+=" where  (dwbh='"+wheredwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,dwmc);
	ps.setString(3,dwjc);
	ps.setString(4,ssdw);
	ps.setString(5,dwlx);
	ps.setString(6,dwdz);
	ps.setString(7,dwfzr);
	ps.setString(8,dwdh);
	ps.setString(9,dwcz);
	ps.setString(10,email);

	ps.setString(11,bz);
	ps.setString(12,dqbm);
	ps.setString(13,sfjms);
	ps.setString(14,hthqz);
	ps.setString(15,cxbz);
	ps.setString(16,ssfgs);
	ps.setString(17,bianma);
	ps.setString(18,ssdqbm);
	ps.setString(19,dwflbm);
	ps.setString(20,ssfw);

	ps.setString(21,dwjb);
	ps.setDate(22,kdsj);
	ps.setDate(23,gdsj);
	ps.setString(24,dmxs);
	ps.setInt(25,bzrs);
 	ps.setString(26,kfdh);
	ps.setString(27,xuhao);
	ps.setString(28,dhqh);
	ps.executeUpdate();
	ps.close();


	ls_sql="update sq_dwxx set ssdqbm=?,dqbm=?,sfjms=?";
	ls_sql+=" where ssfgs='"+wheredwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssdqbm);
	ps.setString(2,dqbm);
	ps.setString(3,sfjms);
	ps.executeUpdate();
	ps.close();


	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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






