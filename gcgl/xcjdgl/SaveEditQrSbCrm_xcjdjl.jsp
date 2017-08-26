<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
java.sql.Date jhjdrq=null;
long jhjdsj=0;
String sqsm=null;
java.sql.Date zcwcsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
sqr=cf.GB2Uni(request.getParameter("sqr"));
sqrlxdh=cf.GB2Uni(request.getParameter("sqrlxdh"));
sfxtp=cf.GB2Uni(request.getParameter("sfxtp"));
ls=request.getParameter("jhjdrq");
try{
	if (!(ls.equals("")))  jhjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhjdrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划交底日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhjdsj");
try{
	if (!(ls.equals("")))  jhjdsj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhjdsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划交底时间]类型转换发生意外:"+e);
	return;
}
sqsm=cf.GB2Uni(request.getParameter("sqsm"));
ls=request.getParameter("zcwcsj");
try{
	if (!(ls.equals("")))  zcwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zcwcsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最迟完成时间]类型转换发生意外:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String jdlxbm=cf.GB2Uni(request.getParameter("jdlxbm"));
String[] jdxmbm=request.getParameterValues("jdxmbm");

String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt=null;
	String jdqrjg=null;
	String tpsftg=null;
	java.sql.Date yjdrq=null;
	double yjdsj=0;
	ls_sql="SELECT khbh,clzt,jdqrjg,tpsftg,jhjdrq,jhjdsj";
	ls_sql+=" FROM crm_xcjdjl";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		clzt=rs.getString("clzt");
		jdqrjg=cf.fillNull(rs.getString("jdqrjg"));
		tpsftg=cf.fillNull(rs.getString("tpsftg"));
		yjdrq=rs.getDate("jhjdrq");
		yjdsj=rs.getDouble("jhjdsj");
	}
	rs.close();
	ps.close();

	if (clzt.equals("2"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底
	{
		if (!jdqrjg.equals("N"))
		{
			out.println("错误！确认已通过");
			return;
		}
	}
	else if (clzt.equals("4"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底
	{
		if (!tpsftg.equals("N"))
		{
			out.println("错误！特批已通过");
			return;
		}
	}
	else{
		out.println("错误！状态不正确");
		return;
	}

	String sfycp="1";//1：有产品、2：无产品
	String cplx="";//产品类型
	for (int i=0;i<jdxmbm.length ;i++ )
	{
		if (jdxmbm[i].equals("00"))
		{
			sfycp="2";
			cplx="无产品";
		}
		else{
			ls_sql="SELECT jdxmmc";
			ls_sql+=" FROM dm_jdxmbm";
			ls_sql+=" where jdxmbm='"+jdxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cplx+=rs.getString("jdxmmc")+"、";
			}
			rs.close();
			ps.close();
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_xcjdjl set sqrq=?,sqr=?,sqrlxdh=?,sfxtp=?,jhjdrq=?,jhjdsj=?,sqsm=?,zcwcsj=?,jdlxbm=?,sfycp=?,cplx=?,clzt='1',jdqrcs=jdqrcs+1,jdqrjg=null,jdqrwcsj=null ";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqrq);
	ps.setString(2,sqr);
	ps.setString(3,sqrlxdh);
	ps.setString(4,sfxtp);
	ps.setDate(5,jhjdrq);
	ps.setLong(6,jhjdsj);
	ps.setString(7,sqsm);
	ps.setDate(8,zcwcsj);
	ps.setString(9,jdlxbm);
	ps.setString(10,sfycp);
	ps.setString(11,cplx);
	ps.executeUpdate();
	ps.close();

	ls_sql=" insert into crm_jdsjxgjl (jdjlh,xgsj,xgyy,yjdrq,yjdsj,xjdrq,xjdsj,lrr,lrsj,lrbm)";
	ls_sql+=" values(?,SYSDATE,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jdjlh);
	ps.setString(2,"确认失败");
	ps.setDate(3,yjdrq);
	ps.setDouble(4,yjdsj);
	ps.setDate(5,jhjdrq);
	ps.setLong(6,jhjdsj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.executeUpdate();
	ps.close();

		
	if (sfycp.equals("1"))//1：有产品、2：无产品
	{
		ls_sql="delete from crm_jdxmmx ";
		ls_sql+=" where jdjlh='"+jdjlh+"' and "+cf.arrayToNotInSQL(jdxmbm,"jdxmbm");
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		for (int i=0;i<jdxmbm.length ;i++ )
		{
			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_jdxmmx";
			ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count==0)
			{
				ls_sql="insert into crm_jdxmmx ( jdjlh,jdxmbm,jdry,jdrydh,jdnr,clzt) ";
				ls_sql+=" values('"+jdjlh+"','"+jdxmbm[i]+"','0','0','0','1')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}
	}
	else{
		ls_sql="delete from crm_jdxmmx ";
		ls_sql+=" where jdjlh='"+jdjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_jdxmmx set clzt='1'";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	String setxcjdbz="";//0：未申请；1：普通申请；2：特批申请；3：确认通过；4：确认失败；5：部分确认；6：特批完成；7：发布；8：交底成功；9：交底失败；A：失败已出方案
	if (sfxtp.equals("Y"))//Y：是；N：否
	{
		setxcjdbz="2";
	}
	else{
		setxcjdbz="1";
	}

	
	ls_sql="update crm_khxx set xcjdbz='"+setxcjdbz+"' ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>出错:" + e);
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