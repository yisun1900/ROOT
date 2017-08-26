<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String[] ygbh=request.getParameterValues("ygbh");
String[] bianhao=request.getParameterValues("bianhao");
String khzq=cf.GB2Uni(request.getParameter("khzq"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

String[] tslStr=request.getParameterValues("tsl");
String[] tslfsStr=request.getParameterValues("tslfs");
String[] ddjdfsStr=request.getParameterValues("ddjdfs");
String[] xtsyfsStr=request.getParameterValues("xtsyfs");
String[] tsclfsStr=request.getParameterValues("tsclfs");
String[] rcglfsStr=request.getParameterValues("rcglfs");
String[] lckhfsStr=request.getParameterValues("lckhfs");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	java.sql.Date khqssj=null;
	java.sql.Date khjzsj=null;
	ls_sql="select khqssj,khjzsj ";
	ls_sql+=" from  cw_jrkhzq";
	ls_sql+=" where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khqssj=rs.getDate("khqssj");
		khjzsj=rs.getDate("khjzsj");
	}
	rs.close();
	ps.close();

//	out.println(ls_sql);

	conn.setAutoCommit(false);


	for (int i=0;i<ygbh.length ;i++ )
	{

		String dwbh=null;
		String yhmc=null;
		String xzzwbm=null;
		String zwbm=null;

		ls_sql="select dwbh,yhmc,xzzwbm,zwbm ";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dwbh=rs.getString("dwbh");
			yhmc=rs.getString("yhmc");
			xzzwbm=rs.getString("xzzwbm");
			zwbm=cf.fillNull(rs.getString("zwbm"));
		}
		rs.close();
		ps.close();

		double tsl=0;
		if (!tslStr[i].trim().equals(""))
		{
			try{
				tsl=Double.parseDouble(tslStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}
		double tslfs=0;
		if (!tslfsStr[i].trim().equals(""))
		{
			try{
				tslfs=Double.parseDouble(tslfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}
		double ddjdfs=0;
		if (!ddjdfsStr[i].trim().equals(""))
		{
			try{
				ddjdfs=Double.parseDouble(ddjdfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}
		double xtsyfs=0;
		if (!xtsyfsStr[i].trim().equals(""))
		{
			try{
				xtsyfs=Double.parseDouble(xtsyfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}
		double tsclfs=0;
		if (!tsclfsStr[i].trim().equals(""))
		{
			try{
				tsclfs=Double.parseDouble(tsclfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}
		double rcglfs=0;
		if (!rcglfsStr[i].trim().equals(""))
		{
			try{
				rcglfs=Double.parseDouble(rcglfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}
		double lckhfs=0;
		if (!lckhfsStr[i].trim().equals(""))
		{
			try{
				lckhfs=Double.parseDouble(lckhfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}

		double khfs=tslfs+ddjdfs+xtsyfs+tsclfs+rcglfs+lckhfs;

		if (khfs<-100 || khfs>100)
		{
			conn.rollback();
			out.println("<BR>"+yhmc+"[考核分数]要在-100到100之间");
			return;
		}

		//家装工料分析表
		ls_sql="delete from cw_jrclyjxkh  ";
		ls_sql+=" where khzq='"+khzq+"' and ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into cw_jrclyjxkh ( khzq,khqssj,khjzsj,fgsbh,dwbh,ygbh,bianhao,yhmc,khfs,tsl,tslfs,ddjdfs,xtsyfs,tsclfs,rcglfs,lckhfs,lrr,lrsj,bz,clzt ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,'1' ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khzq);
		ps.setDate(2,khqssj);
		ps.setDate(3,khjzsj);
		ps.setString(4,fgsbh);
		ps.setString(5,dwbh);
		ps.setString(6,ygbh[i]);
		ps.setString(7,bianhao[i]);
		ps.setString(8,yhmc);
		ps.setDouble(9,khfs);
		ps.setDouble(10,tsl);
		ps.setDouble(11,tslfs);
		ps.setDouble(12,ddjdfs);
		ps.setDouble(13,xtsyfs);
		ps.setDouble(14,tsclfs);
		ps.setDouble(15,rcglfs);
		ps.setDouble(16,lckhfs);
		ps.setString(17,lrr);
		ps.setString(18,"");
		ps.executeUpdate();
		ps.close();
	}


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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>