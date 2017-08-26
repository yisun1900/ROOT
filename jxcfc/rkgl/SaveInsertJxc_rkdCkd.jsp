<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jzgl" scope="page" class="jxc.kcjz.Kcjz"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String rkr=cf.GB2Uni(request.getParameter("rkr"));
String rkrssbm=cf.GB2Uni(request.getParameter("rkrssbm"));
String rkrssfgs=cf.GB2Uni(request.getParameter("rkrssfgs"));
String ckbh=cf.GB2Uni(request.getParameter("ckbh"));
String dqbm=null;
String rkcllx=null;
String rklx=null;
String gysmc=null;
String lydh=null;
String bz=null;


dqbm=cf.GB2Uni(request.getParameter("dqbm"));
rkcllx=cf.GB2Uni(request.getParameter("rkcllx"));
rklx=cf.GB2Uni(request.getParameter("rklx"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
lydh=cf.GB2Uni(request.getParameter("lydh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String fkcrkbz=cf.GB2Uni(request.getParameter("fkcrkbz"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String nian=cf.today("YY");

try {
	conn=cf.getConnection();


	//���ɳ������ţ�F��Z��R+XX(����)+XX(��) +XXXXX����ˮ��
	String rkph=null;
	int count=0;
	ls_sql="select NVL(max(substr(rkph,7,5)),0)";
	ls_sql+=" from  jxc_rkd";
	ls_sql+=" where dqbm='"+dqbm+"' and rkcllx='"+rkcllx+"' and nian='"+nian+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	rkph="FR"+dqbm+nian+cf.addZero(count+1,5);


	ls_sql="insert into jxc_rkd ( rkph,dqbm,ckbh,rklx,rkcllx,gysmc,lydh,rkr,rkrssbm,rkrssfgs   ,rksj,bz,fkcrkbz,rkdzt,sfxyzbsh,rkzje,zcpzje,ccpzje,wldszje,thclzje,bfclzje,nian,sfxnrkd ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,SYSDATE,?,?,'0','N',0,0,0,0,0,0,?,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setString(2,dqbm);
	ps.setString(3,ckbh);
	ps.setString(4,rklx);
	ps.setString(5,rkcllx);
	ps.setString(6,gysmc);
	ps.setString(7,lydh);
	ps.setString(8,rkr);
	ps.setString(9,rkrssbm);
	ps.setString(10,rkrssfgs);

	ps.setString(11,bz);
	ps.setString(12,fkcrkbz);
	ps.setString(13,nian);
	ps.executeUpdate();
	ps.close();


	response.sendRedirect("EditJxc_rkdCkd.jsp?lx=1&rkph="+rkph);
}
catch (Exception e) {
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>