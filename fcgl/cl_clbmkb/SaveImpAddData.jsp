<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String[] cldlmc =request.getParameterValues("cldlmc");
String[] clbm =request.getParameterValues("clbm");
String[] clmc =request.getParameterValues("clmc");
String[] clgg =request.getParameterValues("clgg");
String[] jldwmc =request.getParameterValues("jldwmc");
String[] gdj =request.getParameterValues("gdj");
String[] cbj =request.getParameterValues("cbj");
String[] lx =request.getParameterValues("lx");
String[] bjjbbm=request.getParameterValues("bjjbbm");
String[] ppmc=request.getParameterValues("ppmc");
String[] wxr =request.getParameterValues("wxr");
String[] bz =request.getParameterValues("bz");
String[] paixu =request.getParameterValues("paixu");


//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
String jgdwbh=null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加辅材报价，操作人："+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<clbm.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from cl_clbm " ;
		sql+=" where clbm='"+clbm[i]+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);			    
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			ls_sql="update cl_clbm set clmc=?,clgg=?,jldwmc=?,cldlmc=?,lx=?,ppmc=?,wxr=?,bz=?,paixu=?,lrr=?,lrsj=SYSDATE";
			ls_sql+=" where clbm='"+clbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,cf.GB2Uni(clmc[i]));
			ps.setString(2,cf.GB2Uni(clgg[i]));
			ps.setString(3,cf.GB2Uni(jldwmc[i]));
			ps.setString(4,cf.GB2Uni(cldlmc[i]));
			ps.setString(5,lx[i]);
			ps.setString(6,cf.GB2Uni(ppmc[i]));
			ps.setString(7,cf.GB2Uni(wxr[i]));
			ps.setString(8,cf.GB2Uni(bz[i]));
			ps.setString(9,paixu[i]);
			ps.setString(10,yhmc);
			ps.executeUpdate();
			ps.close();

		}
		else{
			ls_sql="insert into cl_clbm ( clbm,clmc,clgg,jldwmc,cldlmc,lx,ppmc,wxr,bz,paixu,lrr,lrsj ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,SYSDATE ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,clbm[i]);
			ps.setString(2,cf.GB2Uni(clmc[i]));
			ps.setString(3,cf.GB2Uni(clgg[i]));
			ps.setString(4,cf.GB2Uni(jldwmc[i]));
			ps.setString(5,cf.GB2Uni(cldlmc[i]));
			ps.setString(6,lx[i]);
			ps.setString(7,cf.GB2Uni(ppmc[i]));
			ps.setString(8,cf.GB2Uni(wxr[i]));
			ps.setString(9,cf.GB2Uni(bz[i]));
			ps.setString(10,paixu[i]);
			ps.setString(11,yhmc);
			ps.executeUpdate();
			ps.close();
		}

		//初始化材料价格明细（cl_jgmx）
		ls_sql="select dwbh ";
		ls_sql+=" from sq_dwxx ";
		ls_sql+=" where dwlx='F0' and cxbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			jgdwbh=rs.getString(1);

			ls_sql="delete from cl_jgmx ";
			ls_sql+=" where dwbh='"+jgdwbh+"' and clbm='"+clbm[i]+"' and bjjbbm='"+bjjbbm[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			ls_sql=" insert into cl_jgmx ( clbm,dwbh,bjjbbm,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj,sfycx ) ";
			ls_sql+=" values ('"+clbm[i]+"','"+jgdwbh+"','"+bjjbbm[i]+"',0,"+cbj[i]+",0,"+gdj[i]+",'请录入仓库','Y','"+yhmc+"',SYSDATE,'N' ) ";
			ps1= conn.prepareStatement(sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();

		String getbjjbmc="";
		ls_sql="select bjjbmc";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm in(select bjjbbm from cl_jgmx where clbm='"+clbm[i]+"')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while(rs.next())
		{
			getbjjbmc+=rs.getString("bjjbmc")+"、";
		}
		rs.close();
		ps.close();

		ls_sql="update cl_clbm set bjjb=?";
		ls_sql+=" where clbm='"+clbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,getbjjbmc);
		ps.executeUpdate();
		ps.close();
	}

	
	conn.commit();

	System.out.println("增加辅材报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加新的辅材报价]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + i);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + ls_sql);
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
