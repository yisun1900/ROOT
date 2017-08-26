<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String sfxhf=cf.GB2Uni(request.getParameter("sfxhf"));

String ls=null;
java.sql.Date hfrq=null;
ls=request.getParameter("hfrq");
try{
	if (!(ls.equals("")))  hfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访日期]类型转换发生意外:"+e);
	return;
}

String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		String ssfgs=null;
		String yzxdm=null;
		String yzxzt=null;
		String ysjs=null;
		String ysfxhf=null;
		java.sql.Date yhfrq=null;
		String ydmjdjlh=null;
		String ysjsjdjlh=null;
		String ykhfwjlh=null;
		String ysbyybm=null;

		ls_sql="select ssfgs,zxdm,zxzt,sjs,sbyybm,sfxhf,hfrq,khfwjlh,dmjdjlh,sjsjdjlh";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			yzxdm=rs.getString("zxdm");
			yzxzt=rs.getString("zxzt");
			ysjs=rs.getString("sjs");
			ysbyybm=cf.fillNull(rs.getString("sbyybm"));
			ysfxhf=rs.getString("sfxhf");
			yhfrq=rs.getDate("hfrq");
			ykhfwjlh=cf.fillNull(rs.getString("khfwjlh"));
			ydmjdjlh=cf.fillNull(rs.getString("dmjdjlh"));
			ysjsjdjlh=cf.fillNull(rs.getString("sjsjdjlh"));
		}
		else{
			conn.rollback();
			out.println("错误！不存在的客户编号:"+khbh[i]);
			return;
		}
		rs.close();
		ps.close();

		String khfwjlh=null;//操作序号
		int count=0;
		ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
		ls_sql+=" from  crm_zxkhfwjl";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		khfwjlh=khbh[i]+cf.addZero(count+1,3);


		//插入表：咨询客户服务记录（crm_zxkhfwjl）
		ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,sbyybm,sbyyxs,czlx,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,ysbyybm,ykhfwjlh,lrr,lrsj,lrbm)";
		ls_sql+=" values ( ?,?,?,?,?,?,?,'A',?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),?)";//A:设回访时间
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khfwjlh);
		ps.setString(2,khbh[i]);
		ps.setString(3,ssfgs);
		ps.setString(4,yzxdm);
		ps.setString(5,ysjs);
		ps.setString(6,"");
		ps.setString(7,"回访时间："+hfrq);
		ps.setString(8,yzxzt);
		ps.setString(9,yzxzt);
		ps.setString(10,ysfxhf);
		ps.setDate(11,yhfrq);
		ps.setString(12,yzxdm);
		ps.setString(13,ysjs);
		ps.setString(14,ysbyybm);
		ps.setString(15,ykhfwjlh);
		ps.setString(16,yhmc);
		ps.setString(17,dwbh);
		ps.executeUpdate();
		ps.close();



		ls_sql="update crm_zxkhxx set sfxhf=?,hfrq=?,khfwjlh=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
		ls_sql+=" where  (khbh='"+khbh[i]+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfxhf);
		ps.setDate(2,hfrq);
		ps.setString(3,khfwjlh);
		ps.executeUpdate();
		ps.close();
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
	out.print("Exception: " + e);
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