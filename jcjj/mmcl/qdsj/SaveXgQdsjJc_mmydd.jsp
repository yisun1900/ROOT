<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));


String ls=null;
String kazsjstr=null;
kazsjstr=request.getParameter("kazsj");
java.sql.Date kazsj=null;
ls=request.getParameter("kazsj");
try{
	if (!(ls.equals("")))  kazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[协商安装时间]类型转换发生意外:"+e);
	return;
}
String khbh=null;
String lrr=null;
java.sql.Date lrsj=null;
String azsjbz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
azsjbz=cf.GB2Uni(request.getParameter("azsjbz"));
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;
String pdgc=null;
String oldkazsj=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,pdgc,kazsj";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
		pdgc=rs.getString("pdgc");
		oldkazsj=cf.fillNull(rs.getDate("kazsj"));
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("07"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}
	
	if (!oldkazsj.equals(ls))
	{
		int mrazhs=0;
		ls_sql="select mrazhs";
		ls_sql+=" from  sq_gysxx";
		ls_sql+=" where  gysbh='"+pdgc+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			mrazhs=rs.getInt("mrazhs");
		}
		rs.close();
		ps.close();

		if (mrazhs!=0)
		{
			int ydhs=0;
			ls_sql="select count(*)";
			ls_sql+=" from  jc_mmydd";
			ls_sql+=" where  pdgc='"+pdgc+"'  and clzt not in('15','98','99') and kazsj=TO_DATE('"+kazsjstr+"','YYYY-MM-DD')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				ydhs=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (ydhs+1>mrazhs)
			{
				out.println("！错误，超过每日安装限制，户数限制："+mrazhs+"户，目前已约定："+ydhs+"户");
				return;
			}
		}
	}

	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_mmazsjjl";
	ls_sql+=" where yddbh='"+yddbh+"' and kazsj=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,kazsj);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	if (count>0)
	{
		ls_sql="update jc_mmazsjjl set lrsj=?,lrr=?,bz=?";
		ls_sql+=" where yddbh='"+yddbh+"' and kazsj=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,lrsj);
		ps.setString(2,lrr);
		ps.setString(3,azsjbz);
		ps.setDate(4,kazsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="insert into jc_mmazsjjl (yddbh,kazsj,khbh,lrsj,lrr,bz)";
		ls_sql+=" values(?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yddbh);
		ps.setDate(2,kazsj);
		ps.setString(3,khbh);
		ps.setDate(4,lrsj);
		ps.setString(5,lrr);
		ps.setString(6,azsjbz);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="update jc_mmydd set kazsj=?,azsjbz=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='07' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,kazsj);
	ps.setString(2,azsjbz);
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