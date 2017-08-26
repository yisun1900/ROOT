<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String xh = request.getParameter("xh");

String[] id =request.getParameterValues("id");
String[] ygbh =request.getParameterValues("ygbh");
String[] bianhao =request.getParameterValues("bianhao");
String[] glgz =request.getParameterValues("glgz");
String[] gwgz =request.getParameterValues("gwgz");
String[] jbgz =request.getParameterValues("jbgz");
String[] jtbt =request.getParameterValues("jtbt");
String[] cb =request.getParameterValues("cb");
String[] dhbt =request.getParameterValues("dhbt");
String[] yjsxe =request.getParameterValues("yjsxe");

String[] jj =request.getParameterValues("jj");
String[] qtbt =request.getParameterValues("qtbt");
String[] qtkk =request.getParameterValues("qtkk");
String[] tc =request.getParameterValues("tc");
String[] sqgz =request.getParameterValues("sqgz");
String[] ksk =request.getParameterValues("ksk");
String[] shgz =request.getParameterValues("shgz");
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
			out.println("！！！错误，序号["+id[i]+"]不存在的员工序号！"+ygbh[i]);
			return;
		}


		sql="update rs_yggzb set glgz=?,gwgz=?,jbgz=?,jtbt=?,cb=?,dhbt=?,yjsxe=?,jj=?,qtbt=?,qtkk=?,tc=?,sqgz=?,ksk=?,shgz=?,bz=? ";
		sql+=" where  (xh='"+xh+"') and  (ygbh="+ygbh[i]+")  ";
		ps= conn.prepareStatement(sql);
		ps.setString(1,glgz[i]);
		ps.setString(2,gwgz[i]);
		ps.setString(3,jbgz[i]);
		ps.setString(4,jtbt[i]);
		ps.setString(5,cb[i]);
		ps.setString(6,dhbt[i]);
		ps.setString(7,yjsxe[i]);
		ps.setString(8,jj[i]);
		ps.setString(9,qtbt[i]);
		ps.setString(10,qtkk[i]);
		ps.setString(11,tc[i]);
		ps.setString(12,sqgz[i]);
		ps.setString(13,ksk[i]);
		ps.setString(14,shgz[i]);
		ps.setString(15,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();

	}
	
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
