<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dwbh = request.getParameter("dwbh");


//String[] xuhao =request.getParameterValues("xuhao");
String[] clbm =request.getParameterValues("clbm");
String[] clmc =request.getParameterValues("clmc");
String[] clgg =request.getParameterValues("clgg");
//String[] cldj =request.getParameterValues("cldj");
String[] jldwmc =request.getParameterValues("jldwmc");
String[] lrjsfs =request.getParameterValues("lrjsfs");

String[] lrbfb =request.getParameterValues("lrbfb");
String[] cldlmc =request.getParameterValues("cldlmc");
String[] bz =request.getParameterValues("bz");
String[] lrr =request.getParameterValues("lrr");
String[] lrsj =request.getParameterValues("lrsj");
String[] paixu =request.getParameterValues("paixu");
String[] lx =request.getParameterValues("lx");

String[] wxr =request.getParameterValues("wxr");

  String[] gdj =request.getParameterValues("gdj");
  String[] cbj =request.getParameterValues("cbj");
  String[] xmzl=request.getParameterValues("xmzl");
  String[] ppmc=request.getParameterValues("ppmc");
//////////////////////////////////////////////////////  

String ls_sql = null;
String sql=null;
Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs = null;
String jgdwbh=null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加辅材报价，操作人："+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<clbm.length ;i++ )
	{


		java.sql.Date lrsj2=null;
		double gdj2=0;
		double cbj2=0;
		double lrbfb2=0;
	

		
	
		if (lrsj[i]!=null && !lrsj[i].equals(""))
		{
			lrsj2=java.sql.Date.valueOf(lrsj[i]);
		}
		
	
		if (gdj[i]!=null && !gdj[i].equals(""))
		{
			gdj2=Double.parseDouble(gdj[i]);
		}
		if (cbj[i]!=null && !cbj[i].equals(""))
		{
			cbj2=Double.parseDouble(cbj[i]);
		}
		
		if (lrbfb[i]!=null && !lrbfb[i].equals(""))
		{
			lrbfb2=Double.parseDouble(lrbfb[i]);
		}
		if(clmc[i]!=null&&!"".equals(clmc[i]))
		clmc[i]=new String(clmc[i].getBytes("iso-8859-1"),"gbk");
		if(clgg[i]!=null&&!"".equals(clgg[i]))
		clgg[i]=new String(clgg[i].getBytes("iso-8859-1"),"gbk");
		if(jldwmc[i]!=null&&!"".equals(jldwmc[i]))
		jldwmc[i]=new String(jldwmc[i].getBytes("iso-8859-1"),"gbk");
		if(lrjsfs[i]!=null&&!"".equals(lrjsfs[i]))
		lrjsfs[i]=new String(lrjsfs[i].getBytes("iso-8859-1"),"gbk");
		if(cldlmc[i]!=null&&!"".equals(cldlmc[i]))
		cldlmc[i]=new String(cldlmc[i].getBytes("iso-8859-1"),"gbk");
		if(bz[i]!=null&&!"".equals(bz[i]))
		bz[i]=new String(bz[i].getBytes("iso-8859-1"),"gbk");
		if(lx[i]!=null&&!"".equals(lx[i]))
		{
			lx[i]=new String(lx[i].getBytes("iso-8859-1"),"gbk");
			if("常用".equals(lx[i]))
				lx[i]="1";
			else
				lx[i]="2";
		}else
		{
			lx[i]="2";
		}
		if(lrr[i]!=null&&!"".equals(lrr[i]))
		lrr[i]=new String(lrr[i].getBytes("iso-8859-1"),"gbk");
		if(wxr[i]!=null&&!"".equals(wxr[i]))
		wxr[i]=new String(wxr[i].getBytes("iso-8859-1"),"gbk");
		if(ppmc[i]!=null&&!"".equals(ppmc[i]))
		ppmc[i]=new String(ppmc[i].getBytes("iso-8859-1"),"gbk");
		if(xmzl[i]!=null&&!"".equals(xmzl[i]))
		xmzl[i]=new String(xmzl[i].getBytes("iso-8859-1"),"gbk");
		
	ls_sql="insert into cl_clbm ( clbm,clmc,clgg,jldwmc,lrjsfs,lrbfb,cldlmc,bz,lrr,lrsj,wxr,lx,paixu,ppmc,xmzl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clbm[i]);
	ps.setString(2,clmc[i]);
	ps.setString(3,clgg[i]);
	//ps.setDouble(4,cldj2);
	ps.setString(4,jldwmc[i]);
	ps.setString(5,lrjsfs[i]);
	ps.setDouble(6,lrbfb2);
	ps.setString(7,cldlmc[i]);
	ps.setString(8,bz[i]);
	ps.setString(9,lrr[i]);
	ps.setDate(10,lrsj2);
	ps.setString(11,wxr[i]);
	ps.setString(12,lx[i]);
	ps.setString(13,paixu[i]);
	ps.setString(14,ppmc[i]);
	ps.setString(15,xmzl[i]);
	ps.executeUpdate();
	ps.close();

		
		//初始化材料价格明细（cl_jgmx）
	ls_sql="select dwbh ";
	ls_sql+=" from sq_dwxx ";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgdwbh=rs.getString(1);

		sql=" insert into cl_jgmx ( clbm,dwbh,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj,sfycx ) ";
		sql+=" values ( ?,?,0,?,0,?,'请录入仓库','Y',?,?,'N' ) ";
		ps1= conn.prepareStatement(sql);
		ps1.setString(1,clbm[i]);
		ps1.setString(2,jgdwbh);
		ps1.setDouble(3,cbj2);
		ps1.setDouble(4,gdj2);
		ps1.setString(5,lrr[i]);
		ps1.setDate(6,lrsj2);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
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
