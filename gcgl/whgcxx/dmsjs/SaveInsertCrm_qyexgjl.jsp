<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xgjlh=null;
String khbh=null;

String xgqfgsbh=null;
String xgqdwbh=null;
String xgqsjs=null;

String xghfgsbh=null;
String xghdwbh=null;
String xghsjs=null;

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
xgjlh=cf.GB2Uni(request.getParameter("xgjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));

xgqfgsbh=cf.GB2Uni(request.getParameter("xgqfgsbh"));
xgqdwbh=cf.GB2Uni(request.getParameter("xgqdwbh"));
xgqsjs=cf.GB2Uni(request.getParameter("xgqsjs"));

xghfgsbh=cf.GB2Uni(request.getParameter("xghfgsbh"));
xghdwbh=cf.GB2Uni(request.getParameter("xghdwbh"));
xghsjs=cf.GB2Uni(request.getParameter("xghsjs"));

String xgqkhjl=cf.GB2Uni(request.getParameter("xgqkhjl"));
String xghkhjl=cf.GB2Uni(request.getParameter("xghkhjl"));

lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String xghsjsgh=null;
	ls_sql="select sq_yhxx.ygbh";
	ls_sql+=" from  sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+xghdwbh+"' ";
	ls_sql+=" and sq_yhxx.zwbm='04' and sq_yhxx.sfzszg in('Y','N') ";
	ls_sql+=" and sq_yhxx.yhmc ='"+xghsjs+"' and zwbm='04' ";//04:设计师
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xghsjsgh=cf.fillNull(rs.getString("ygbh"));
	}
	else{
		out.println("<BR>错误！该单位无此设计师");
		return;
	}
	rs.close();
	ps.close();



	conn.setAutoCommit(false);


	ls_sql ="insert into crm_dmsjsxgjl (xgjlh,khbh,xgqfgsbh,xgqdwbh,xgqsjs,xgqkhjl,xghfgsbh,xghdwbh,xghsjs,xghsjsgh,xghkhjl,lrr,lrsj,lrbm,bz) ";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,xgqfgsbh);
	ps.setString(4,xgqdwbh);
	ps.setString(5,xgqsjs);
	ps.setString(6,xgqkhjl);
	ps.setString(7,xghfgsbh);
	ps.setString(8,xghdwbh);
	ps.setString(9,xghsjs);
	ps.setString(10,xghsjsgh);
	ps.setString(11,xghkhjl);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,lrbm);
	ps.setString(15,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update crm_khxx set fgsbh=?,dwbh=?,sjs=?,sjsgh=?,khjl=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghsjsgh);
	ps.setString(5,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_zxkhxx set ssfgs=?,zxdm=?,sjs=?,sjsgh=?,khjl=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghsjsgh);
	ps.setString(5,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_jcdd set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_zcdd set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_zczjx set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_mmydd set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_mmzjx set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_cgdd set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_cgzjx set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_jjdd set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_jjzjx set fgsbh=?,qddm=?,jzsjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();



	ls_sql=" update cw_qmjzmx set fgsbh=?,dwbh=?,sjs=?,khjl=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghfgsbh);
	ps.setString(2,xghdwbh);
	ps.setString(3,xghsjs);
	ps.setString(4,xghkhjl);
	ps.executeUpdate();
	ps.close();


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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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