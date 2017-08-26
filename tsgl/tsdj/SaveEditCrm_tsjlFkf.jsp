<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String slfsbm=null;
String bz=cf.GB2Uni(request.getParameter("bz"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String yzcdbm=cf.GB2Uni(request.getParameter("yzcdbm"));
String tsnr=cf.GB2Uni(request.getParameter("tsnr"));
String sfla=cf.GB2Uni(request.getParameter("sfla"));
slfsbm=cf.GB2Uni(request.getParameter("slfsbm"));
java.sql.Date yqjjsj=null;
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户要求解决时间]类型转换发生意外:"+e);
	return;
}

java.sql.Date tsbxsj=null;
ls=request.getParameter("tsbxsj");
try{
	if (!(ls.equals("")))  tsbxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsbxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户投诉报修时间]类型转换发生意外:"+e);
	return;
}

String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
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


String jcppbz=request.getParameter("jcppbz");
String tspp=cf.GB2Uni(request.getParameter("tspp"));

String tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
String tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String dwbh=request.getParameter("dwbh");
String ssfgs=request.getParameter("ssfgs");
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));


String wheretsyybm=cf.GB2Uni(request.getParameter("wheretsyybm"));
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//投诉供应商
	String ppmc=null;
	String gys=null;

	if (tspp!=null && !tspp.equals(""))
	{
		if (!jcppbz.equals("N"))//是否启用集成订单:Y：启用；N：否，因有的供应商已删除，要从订单取
		{
			int pos=tspp.indexOf("*");
			ppmc=tspp.substring(pos+1);
			tspp=tspp.substring(0,pos);

			pos=ppmc.indexOf("*");
			gys=ppmc.substring(pos+1);
			ppmc=ppmc.substring(0,pos);
		}
		else{
			ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppgysdzb.ppmc='"+tspp+"' and jxc_ppgysdzb.ssfgs='"+ssfgs+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				ppmc=rs.getString("scsmc");
				gys=rs.getString("gysmc");
			}
			rs.close();
			ps.close();
		}
	}

	
	String zrr="";
	ls_sql="select yhmc";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrr=rs.getString("yhmc");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update crm_tsjl set slfsbm=?,yzcdbm=?,yqjjsj=?, bz=?,tsnr=?   ,tsbxsj=?,lrr=?";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,slfsbm);
	ps.setString(2,yzcdbm);
	ps.setDate(3,yqjjsj);
	ps.setString(4,bz);
	ps.setString(5,tsnr);

	ps.setDate(6,tsbxsj);
	ps.setString(7,lrr);
	ps.executeUpdate();
	ps.close();

	//客户投诉原因
	ls_sql="update crm_tsbm set tslxbm=?,tsxlbm=?,tsyybm=?,dwbh=?,tspp=?,ppmc=?,gys=?,rglrbz=?,zrr=?,ygbh=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+wheretsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tslxbm);
	ps.setString(2,tsxlbm);
	ps.setString(3,tsyybm);
	ps.setString(4,dwbh);
	ps.setString(5,tspp);
	ps.setString(6,ppmc);
	ps.setString(7,gys);
	ps.setString(8,"1");//1：系统取得；2：人工录入
	ps.setString(9,zrr);
	ps.setString(10,ygbh);
	if (ps.executeUpdate()!=1)
	{
		ps.close();
		conn.rollback();
		out.println("错误！投诉报修原因不正确，可能已修改，请刷新后重新存盘");
		return;
	}
	ps.close();

	//投诉问题回访明细
	ls_sql="update crm_tswthfmx set tsyybm=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+wheretsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsyybm);
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
	return;
}
finally 
{
	conn.setAutoCommit(true);
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