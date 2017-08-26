<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String[] ygbh=request.getParameterValues("ygbh");
String[] bianhao=request.getParameterValues("bianhao");
String[] khfsStr=request.getParameterValues("khfs");
String khzq=cf.GB2Uni(request.getParameter("khzq"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));

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

		double khfs=0;
		if (!khfsStr[i].trim().equals(""))
		{
			try{
				khfs=Double.parseDouble(khfsStr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>"+yhmc+"[考核分数]不是数字类型:"+e);
				return;
			}
		}

		if (khfs<0 || khfs>100)
		{
			conn.rollback();
			out.println("<BR>"+yhmc+"[考核分数]要在0合100之间");
			return;
		}

		//家装工料分析表
		ls_sql="delete from cw_jrzjyjkh  ";
		ls_sql+=" where khzq='"+khzq+"' and ygbh='"+ygbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into cw_jrzjyjkh ( khzq,khqssj,khjzsj,fgsbh,dwbh,ygbh,bianhao,yhmc,khfs,lrr,lrsj,bz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,SYSDATE,? ) ";
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
		ps.setString(10,lrr);
		ps.setString(11,"");
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