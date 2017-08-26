<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String xh = request.getParameter("xh");

String[] ygbh =request.getParameterValues("ygbh");
String[] cqts =request.getParameterValues("cqts");
String[] sjts =request.getParameterValues("sjts");
String[] bjts =request.getParameterValues("bjts");
String[] jxfz =request.getParameterValues("jxfz");
String[] jbf =request.getParameterValues("jbf");
String[] yjsxe =request.getParameterValues("yjsxe");
String[] tc =request.getParameterValues("tc");
String[] jf =request.getParameterValues("jf");

String[] cjkk =request.getParameterValues("cjkk");
String[] qtkk =request.getParameterValues("qtkk");
String[] bz =request.getParameterValues("bz");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<ygbh.length ;i++ )
	{
	
		//查询品名编码
		sql=" select count(*) " ;
		sql+=" from rs_yggzb" ;
		sql+=" where  (xh='"+xh+"') and  (ygbh="+ygbh[i]+")  ";
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			conn.rollback();
			out.println("！！！错误,不存在的员工序号！"+ygbh[i]);
			return;
		}


		sql="update rs_yggzb set cqts=?,sjts=?,bjts=?,jxfz=?,jbf=?,yjsxe=?,tc=?,jf=?,cjkk=?,qtkk=?,bz=? ";
		sql+=" where  (xh='"+xh+"') and  (ygbh="+ygbh[i]+")  ";
		ps= conn.prepareStatement(sql);
		ps.setString(1,cqts[i]);
		ps.setString(2,sjts[i]);
		ps.setString(3,bjts[i]);
		ps.setString(4,jxfz[i]);
		ps.setString(5,jbf[i]);
		ps.setString(6,yjsxe[i]);
		ps.setString(7,tc[i]);
		ps.setString(8,jf[i]);
		ps.setString(9,cjkk[i]);
		ps.setString(10,qtkk[i]);
		ps.setString(11,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();


	}
	
	sql="update rs_yggzb set kgts=qqts-cqts-sjts-bjts ";
	sql+=" where  (xh='"+xh+"') ";
	ps= conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
