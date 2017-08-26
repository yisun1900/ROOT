<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
String lrr=(String)session.getAttribute("yhdlm");
java.sql.Date lrsj=cf.getDate();


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String shbz="Y";
String bjlx="1";
String xmdlbm="02";
String dqbm="01";
String xmxlbm=null;
String xmxlbmstr=null;
String smbm=null;
String smbmstr=null;
String xmbh=null;
String oldxmbh=null;
String xmmc=null;
String jldwbmstr=null;
String jldwbm=null;
double dj=0;
String gycl=null;
String wybh=null;
String lrxh=null;
int xh=0;
int start=2911;


int count=0;

String ls=null;

try {
	//得到ORACLE连接
	conn=cf.getConnection();    


	
	conn.setAutoCommit(false);

	int jsq=0;
	//中级报价
	ls_sql ="select xh,UPPER(imbj_dzbj.xmbh) xmbh,imbj_dzbj.xmmc,imbj_dzbj.jldwbm,smbm,imbj_dzbj.dj,imbj_dzbj.gycl";
	ls_sql+=" from imbj_dzbj ";
	ls_sql+=" order by imbj_dzbj.xh";
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		count++;

		lrxh=rs1.getString("xh");
		xmbh=cf.fillNull(rs1.getString("xmbh"));
		smbmstr=cf.fillNull(rs1.getString("smbm"));
		dj=rs1.getDouble("dj");

		xmmc=rs1.getString("xmmc");
		jldwbmstr=cf.fillNull(rs1.getString("jldwbm"));
		gycl=rs1.getString("gycl");



//		out.println("<BR>xmbh="+xmbh);

	

		ls_sql="update bj_jzbjb set cbj=?,cgycl=? ";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dj);
		ps.setString(2,gycl);
			
		ps.executeUpdate();
		ps.close();
/*
*/	
	}
	rs1.close();
	ps1.close();

	conn.commit();

	out.print("<BR>数据导入成功，共导入记录数："+count);
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	out.println("<BR>lrxh="+lrxh);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
