<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String[] xuhao =request.getParameterValues("xuhao");
String[] xcmlxbm =request.getParameterValues("xcmlxbm");
String[] bklxxh =request.getParameterValues("bklxxh");
String[] mbcl =request.getParameterValues("mbcl");
String[] xbpz =request.getParameterValues("xbpz");
String[] zsxt =request.getParameterValues("zsxt");
String[] jjfs =request.getParameterValues("jjfs");
String[] pmdj =request.getParameterValues("pmdj");
String[] ymdj =request.getParameterValues("ymdj");
String[] zpmc =request.getParameterValues("zpmc");
String[] bz =request.getParameterValues("bz");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加[壁柜门]报价，操作人："+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		String xcmbm="";
		int count=0;
		sql="select NVL(max(TO_NUMBER(SUBSTR(xcmbm,3,4))),0)";
		sql+=" from  jc_bgmbj";
		sql+=" where xcmlxbm='"+xcmlxbm[i]+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		xcmbm=xcmlxbm[i]+cf.addZero(count+1,4);

		sql ="insert into jc_bgmbj (xcmbm,xcmlxbm,bklxxh,mbcl,xbpz,zsxt,jjfs,pmdj,ymdj,zpmc,lrr,lrsj,bz)";
		sql+=" values('"+xcmbm+"','"+cf.GB2Uni(xcmlxbm[i])+"','"+cf.GB2Uni(bklxxh[i])+"','"+cf.GB2Uni(mbcl[i])+"','"+cf.GB2Uni(xbpz[i])+"','"+cf.GB2Uni(zsxt[i])+"','"+cf.GB2Uni(jjfs[i])+"','"+pmdj[i]+"','"+ymdj[i]+"','"+cf.GB2Uni(zpmc[i])+"','"+yhmc+"',SYSDATE,'"+cf.GB2Uni(bz[i])+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (i%40==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("增加[壁柜门]报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加报价]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + xuhao[i]);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + sql);
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
