<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String khlxbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String bz=null;
java.sql.Date csrq=null;
String zybm=request.getParameter("zybm");
int fj=0;
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String xmzy=cf.GB2Uni(request.getParameter("xmzy"));

khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));


ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上报日期]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量csrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出生日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("fj");
try{
	if (!(ls.equals("")))  fj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[房价]类型转换发生意外:"+e);
	return;
}



String khbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where fwdz='"+fwdz+"' and zt='4'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>错误！此房屋地址已存在");
		return;
	}


	//客户编号
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_zxkhxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	khbh=cf.addZero(xh,7);

	//客户编号
	while (true)
	{
		khbh=cf.addZero(xh,7);

		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			xh++;
		}
		else{
			break;
		}
	}


	ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,lrsj,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,sfyjqk,wtkhbz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?  ,'4','N','4','N'   ,'N','Y','N','0','0','Y'  ,'N','N','1','0','0','0','0','1',?,'1','N','N','N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setString(6,khlxbm);
	ps.setString(7,cqbm);
	ps.setDate(8,csrq);
	ps.setString(9,zybm);
	ps.setInt(10,fj);
	ps.setString(11,dwbh);
	ps.setString(12,fgsbh);
	ps.setDate(13,lrsj);
	ps.setString(14,lrr);
	ps.setString(15,bz);
	ps.setString(16,xmzy);
	
	
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！生成客户编号<<%=khbh%>>");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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