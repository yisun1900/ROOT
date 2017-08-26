<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String shr=null;
java.sql.Date shsj=null;
String shjl=null;
String shyj=null;

shr=cf.GB2Uni(request.getParameter("shr"));
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}

shjl=cf.GB2Uni(request.getParameter("shjl"));
shyj=cf.GB2Uni(request.getParameter("shyj"));

String ztbm=cf.GB2Uni(request.getParameter("ztbm"));

String bdxh=cf.GB2Uni(request.getParameter("bdxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String yspxh=null;
	String yclzt=null;
	String yztbm=null;
	String yshjl=null;
	String yshyj=null;
	String yshr=null;
	java.sql.Date yshsj=null;

	String ygbh=null;
	String dwbh2=null;
	String zwbm2=null;	
	double bdhgwgz=0;
	double bdhjbgz=0;
	double bdhkhgz=0;
	double bdhbuzhu=0;
	double bdhjtbt=0;
	double bdhcb=0;
	double bdhdhbt=0;
	String bdxz=null;	
	java.sql.Date bdsxrq=null;
	String lrbm=null;	

	ls_sql="select spxh,clzt,ztbm,shjl,shyj,shr,shsj  ,ygbh,dwbh2,zwbm2,bdhgwgz,bdhjbgz,bdhkhgz,bdhbuzhu,bdhjtbt,bdhcb,bdhdhbt,bdxz,bdsxrq,lrbm";
	ls_sql+=" from  rs_ygbdsqb";
	ls_sql+=" where bdxh='"+bdxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yspxh=cf.fillNull(rs.getString("spxh"));
		yclzt=cf.fillNull(rs.getString("clzt"));
		yztbm=cf.fillNull(rs.getString("ztbm"));
		yshjl=cf.fillNull(rs.getString("shjl"));
		yshyj=cf.fillNull(rs.getString("shyj"));
		yshr=cf.fillNull(rs.getString("shr"));
		yshsj=rs.getDate("shsj");

		ygbh=rs.getString("ygbh");
		dwbh2=rs.getString("dwbh2");
		zwbm2=rs.getString("zwbm2");
		bdhgwgz=rs.getDouble("bdhgwgz");
		bdhjbgz=rs.getDouble("bdhjbgz");
		bdhkhgz=rs.getDouble("bdhkhgz");
		bdhbuzhu=rs.getDouble("bdhbuzhu");
		bdhjtbt=rs.getDouble("bdhjtbt");
		bdhcb=rs.getDouble("bdhcb");
		bdhdhbt=rs.getDouble("bdhdhbt");
		bdxz=rs.getString("bdxz");
		bdsxrq=rs.getDate("bdsxrq");
		lrbm=rs.getString("lrbm");
	}
	rs.close();
	ps.close();

	String gzbm=null;
	ls_sql="select gzbm";
	ls_sql+=" from  dm_xzzwbm";
	ls_sql+=" where xzzwmc='"+zwbm2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gzbm=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (gzbm==null)
	{
		out.println("错误！工种不存在："+ls_sql);
		return;
	}

	String ssfgs=null;
	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();
	if (ssfgs==null)
	{
		out.println("存盘失败！无【所属分公司】");
		return;
	}


	if (!yclzt.equals("01") && !yclzt.equals("02"))//01：等待审批,02：正在审批
	{
		out.println("错误！处理状态不正确");
		return;
	}

	if (!yztbm.equals(ztbm))
	{
		out.println("错误！『审批状态』已改变");
		return;
	}

	//取下一状态
	String xyztbm=null;
	if (shjl.equals("1"))//0:取消;1:审批通过
	{
		ls_sql="select ztbm";
		ls_sql+=" from  rs_ygbdsplc";
		ls_sql+=" where bdxh='"+bdxh+"' and ztbm>'"+yztbm+"'";
		ls_sql+=" order by xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xyztbm=cf.fillNull(rs.getString("ztbm"));
		}
		rs.close();
		ps.close();

		if (xyztbm==null)
		{
			xyztbm="0398";//审批通过且审批结束
		}
	}
	else{
		xyztbm="0399";//审批取消且审批结束
	}

	String sqzt=null;
	ls_sql="select sqzt";
	ls_sql+=" from  rs_ztbm";
	ls_sql+=" where ztbm='"+xyztbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqzt=cf.fillNull(rs.getString("sqzt"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//取审核表序号
	long spxh=0;
	ls_sql="select max(spxh)  from rs_bdsh ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		spxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	spxh++;
	
	ls_sql="insert into rs_bdsh (spxh,bdxh,shjl,shyj,shr,shsj,clzt,ztbm   ,yspxh,yclzt,yztbm,yshjl,yshyj,yshr,yshsj)";
	ls_sql+=" values("+spxh+",?,?,?,?,?,?,?   ,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bdxh);
	ps.setString(2,shjl);
	ps.setString(3,shyj);
	ps.setString(4,shr);
	ps.setDate(5,shsj);
	ps.setString(6,sqzt);
	ps.setString(7,xyztbm);

	ps.setString(8,yspxh);
	ps.setString(9,yclzt);
	ps.setString(10,yztbm);
	ps.setString(11,yshjl);
	ps.setString(12,yshyj);
	ps.setString(13,yshr);
	ps.setDate(14,yshsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_ygbdsqb set spxh=?,shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
	ls_sql+=" where bdxh='"+bdxh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,spxh);
	ps.setString(2,shr);
	ps.setDate(3,shsj);
	ps.setString(4,shjl);
	ps.setString(5,shyj);
	ps.setString(6,sqzt);
	ps.setString(7,xyztbm);
	ps.executeUpdate();
	ps.close();

	
	if (sqzt.equals("03"))//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
	{
		ls_sql="update sq_yhxx set ssfgs=?,dwbh=?,xzzwbm=?,zwbm=?,bdxh=? ";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,dwbh2);
		ps.setString(3,zwbm2);
		ps.setString(4,gzbm);
		ps.setString(5,bdxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update rs_ygjbgzb set gwgz=?,jbgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=? ";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,bdhgwgz);
		ps.setDouble(2,bdhjbgz);
		ps.setDouble(3,bdhkhgz);
		ps.setDouble(4,bdhbuzhu);
		ps.setDouble(5,bdhjtbt);
		ps.setDouble(6,bdhcb);
		ps.setDouble(7,bdhdhbt);
		ps.executeUpdate();
		ps.close();


		if (bdxz.equals("01"))//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
		{
			String bdhsfzszg="Y";
			ls_sql="update sq_yhxx set zzxh=?,zzrq=?,zzpzbm=?,sfzszg=?";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,bdxh);
			ps.setDate(2,bdsxrq);
			ps.setString(3,lrbm);
			ps.setString(4,bdhsfzszg);
			ps.executeUpdate();
			ps.close();

			ls_sql="update rs_ygbdsqb set bdhsfzszg=?";
			ls_sql+=" where bdxh='"+bdxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,bdhsfzszg);
			ps.executeUpdate();
			ps.close();
		}
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>