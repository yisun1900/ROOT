<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String djjlh=null;
String khbh=null;
String gcjdbm=null;
java.sql.Date djsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
String bz=null;
djjlh=cf.GB2Uni(request.getParameter("djjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
gcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
ls=request.getParameter("djsj");
try{
	if (!(ls.equals("")))  djsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际开工时间]类型转换发生意外:"+e);
	return;
}
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
bz=cf.GB2Uni(request.getParameter("bz"));


String hfcsbz=request.getParameter("hfcsbz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ygcjdbm=null;
java.sql.Date yhfrq=null;
String yhflxbm=null;
String ysfxhf=null;

try {
	conn=cf.getConnection();


	ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		yhflxbm=cf.fillNull(rs.getString("hflxbm"));
		ysfxhf=cf.fillNull(rs.getString("sfxhf"));
		yhfrq=rs.getDate("hfrq");
	}
	rs.close();
	ps.close();

	if (!ygcjdbm.equals("2"))
	{
		out.println("<BR>！！！错误，工程进度不正确，不能进行【隐蔽工程完成登记】");
		return;
	}



	conn.setAutoCommit(false);


	//工程进度登记记录
	ls_sql="insert into crm_gcjddjjl (djjlh,khbh,gcjdbm,djsj,zpsl,ygcjdbm,ysfxhf,yhfrq,yhflxbm,sfszhf  ,lrr,lrsj,lrdw,bz) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,djjlh);
	ps.setString(2,khbh);
	ps.setString(3,gcjdbm);
	ps.setDate(4,djsj);
	ps.setInt(5,0);
	ps.setString(6,ygcjdbm);
	ps.setString(7,ysfxhf);
	ps.setDate(8,yhfrq);
	ps.setString(9,yhflxbm);
	ps.setString(10,hfcsbz);

	ps.setString(11,lrr);
	ps.setDate(12,lrsj);
	ps.setString(13,lrdw);
	ps.setString(14,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set sybgcrq=?,gcjdbm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,djsj);
	ps.setString(2,gcjdbm);
	ps.executeUpdate();
	ps.close();

	String hflxbm="22";
	if (hfcsbz.equals("1"))//自动设置回访
	{
		ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?+1 ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hflxbm);
		ps.setDate(2,djsj);
		ps.executeUpdate();
		ps.close();

	
		//插入：回访设置记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String yhfszjlh=null;
		ls_sql="select hfszjlh";
		ls_sql+=" from  crm_hfszjl";
		ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhfszjlh=rs.getString("hfszjlh");
		}
		rs.close();
		ps.close();

		ls_sql=" update crm_hfszjl set zxszbz='N'";	
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String hfszjlh=null;
		int count=0;
		ls_sql="select NVL(max(substr(hfszjlh,8,3)),0)";
		ls_sql+=" from  crm_hfszjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		hfszjlh=khbh+cf.addZero(count+1,3);

		String hfszyy=djjlh+":隐蔽工程完成登记";
		ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
		ls_sql+=" values ( ?,?,?,?+1,?,SYSDATE,?,'2',?,'N','Y',?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfszjlh);
		ps.setString(2,khbh);
		ps.setString(3,hflxbm);
		ps.setDate(4,djsj);
		ps.setString(5,lrr);
		ps.setString(6,hfszyy);
		ps.setString(7,djjlh);
		ps.setString(8,yhfszjlh);
		ps.executeUpdate();
		ps.close();
	
		ls_sql="update crm_gcjddjjl set hfszjlh=? ";
		ls_sql+=" where  djjlh='"+djjlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfszjlh);
		ps.executeUpdate();
		ps.close();
		//插入：回访设置记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
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
	out.print("存盘失败,发生意外: " + e);
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
