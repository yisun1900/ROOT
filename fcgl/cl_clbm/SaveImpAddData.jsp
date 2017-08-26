<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String[] cldlmc =request.getParameterValues("cldlmc");
String[] clbm =request.getParameterValues("clbm");
String[] clmc =request.getParameterValues("clmc");
String[] clgg =request.getParameterValues("clgg");
String[] jldwmc =request.getParameterValues("jldwmc");
String[] lx =request.getParameterValues("lx");
String[] bz =request.getParameterValues("bz");
String[] paixu =request.getParameterValues("paixu");

  
//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加辅材，操作人："+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<clbm.length ;i++ )
	{
		ls_sql="insert into cl_clbm ( clbm,clmc,clgg,jldwmc,lrjsfs,lrbfb,cldlmc,bz,wxr,lx  ,paixu,lrr,lrsj )  ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,SYSDATE) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clbm[i]);
		ps.setString(2,cf.GB2Uni(clmc[i]));
		ps.setString(3,cf.GB2Uni(clgg[i]));
		ps.setString(4,cf.GB2Uni(jldwmc[i]));
		ps.setString(5,"1");//1：差价方式；2：百分比方式
		ps.setDouble(6,0);
		ps.setString(7,cf.GB2Uni(cldlmc[i]));
		ps.setString(8,cf.GB2Uni(bz[i]));
		ps.setString(9,"");
		ps.setString(10,cf.GB2Uni(lx[i]));

		ps.setString(11,paixu[i]);
		ps.setString(12,yhmc);
		ps.executeUpdate();
		ps.close();

		//初始化材料价格明细（cl_jgmx）
		String fgsbh=null;
		ls_sql="select dwbh ";
		ls_sql+=" from sq_dwxx ";
		ls_sql+=" where dwlx='F0' and cxbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			fgsbh=rs.getString(1);

			ls_sql=" insert into cl_jgmx ( clbm,dwbh,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj,sfycx,BJJBBM ) ";
			ls_sql+=" values ( ?,?,0,0,0,0,'请录入仓库','Y',?,SYSDATE,'N','0' ) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,clbm[i]);
			ps1.setString(2,fgsbh);
			ps1.setString(3,yhmc);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();

		if (i%200==0)
		{
			System.out.println(clbm[i]);
		}
	}


	conn.commit();

	System.out.println("增加辅材完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加新的辅材]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
//	out.print("<P>出错材料编码：" + clbm[i]);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
