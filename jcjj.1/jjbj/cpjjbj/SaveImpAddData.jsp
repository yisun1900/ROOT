<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");


String[] cpjjbh =request.getParameterValues("cpjjbh");
String[] cpjjfg =request.getParameterValues("cpjjfg");
String[] cpjjmc =request.getParameterValues("cpjjmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] cpjjxl =request.getParameterValues("cpjjxl");
String[] cpjjcz =request.getParameterValues("cpjjcz");

String[] dj =request.getParameterValues("dj");
String[] cpsm =request.getParameterValues("cpsm");
String[] bz =request.getParameterValues("bz");
String[] cktp =request.getParameterValues("cktp");
String[] cptp =request.getParameterValues("cptp");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����

	System.out.println("��ʼ���ӳ�Ʒ�Ҿ߱��ۣ������ˣ�"+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<cpjjbh.length ;i++ )
	{

		sql ="insert into jc_cpjjbj ( cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,dj,cktp,cptp,cpsm,dqbm,lrr,lrsj,bz)";
		sql+=" values('"+cf.GB2Uni(cpjjbh[i])+"','"+cf.GB2Uni(cpjjfg[i])+"','"+cf.GB2Uni(cpjjmc[i])+"','"+cf.GB2Uni(xh[i])+"'";
		sql+=" ,'"+cf.GB2Uni(gg[i])+"','"+cf.GB2Uni(cpjjxl[i])+"','"+cf.GB2Uni(cpjjcz[i])+"'";
		sql+=" ,"+cf.GB2Uni(dj[i])+",'"+cf.GB2Uni(cktp[i])+"','"+cf.GB2Uni(cptp[i])+"','"+cf.GB2Uni(cpsm[i])+"'";
		sql+=" ,'"+dqbm+"','"+yhmc+"',SYSDATE,'"+cf.GB2Uni(bz[i])+"'";
		sql+="  )";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (i%200==0)
		{
			System.out.println(cpjjbh[i]);
		}
	}
	
	conn.commit();

	System.out.println("���ӳ�Ʒ�Ҿ߱�����ɣ������ˣ�"+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("���̳ɹ���");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>��Ʒ�Ҿ߱�ţ�" + cpjjbh[i]);
	out.print("<P>����ʧ��,��������: " + e);
	out.print("<P>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
