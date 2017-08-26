<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String oldcpbm=cf.GB2Uni(request.getParameter("oldcpbm"));
String cpbm=cf.GB2Uni(request.getParameter("cpbm"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String oldsxh=cf.GB2Uni(request.getParameter("sxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
	}
	rs.close();
	ps.close();
	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}


 	String getcpbm="";
	String zclx="";
	ls_sql="select cpbm,zclx";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where sxh="+oldsxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcpbm=rs.getString(1);
		zclx=cf.fillNull(rs.getString("zclx"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (getcpbm.equals(cpbm))//产品未发生变化
	{
		ls_sql=" update bj_khzcxm set sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sl);
		ps.setDouble(2,sl);
		ps.setString(3,ptcpsm);
		ps.executeUpdate();
		ps.close();
	}
	else{//产品已更换
		//获取新产品信息
		String tccpdlbm=null;
//		String tccplbbm=null;
		String cpmc=null;
		String ppmc=null;
		String gysmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		String xdjldw=null;
		double xdb=0;

		String sfxclxs=null;
		String sfyx=null;
		java.sql.Date yxkssj=null;
		java.sql.Date yxjzsj=null;
		double dj=0;
		String jsfs=null;
		double jsj=0;
		double jsbl=0;
		String jjfs=null;
		double sh=0;

		String bz=null;
		String sfkgdj=null;

		String sfycx="";
		String cxkssj="";
		String cxjssj="";
		double cxj=0;
		double cxjsj=0;
		double cxjsbl=0;

		ls_sql=" select tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb ";
		ls_sql+=" ,sfxclxs,sfyx,yxkssj,yxjzsj,dj,jsfs,jsj,jsbl,jjfs,sh   ,bz,sfkgdj ";
		ls_sql+=" ,sfycx,cxkssj,cxjssj,cxj,cxjsj,cxjsbl";
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			sfycx=cf.fillNull(rs.getString("sfycx"));
			cxkssj=cf.fillNull(rs.getDate("cxkssj"));
			cxjssj=cf.fillNull(rs.getDate("cxjssj"));
			cxj=rs.getDouble("cxj");
			cxjsj=rs.getDouble("cxjsj");
			cxjsbl=rs.getDouble("cxjsbl");

			tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
			tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
			cpmc=cf.fillNull(rs.getString("cpmc"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			gysmc=cf.fillNull(rs.getString("gysmc"));
			xh=cf.fillNull(rs.getString("xh"));
			gg=cf.fillNull(rs.getString("gg"));
			jldw=cf.fillNull(rs.getString("jldw"));
			xdjldw=cf.fillNull(rs.getString("xdjldw"));
			xdb=rs.getDouble("xdb");

			sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
			sfyx=cf.fillNull(rs.getString("sfyx"));
			yxkssj=rs.getDate("yxkssj");
			yxjzsj=rs.getDate("yxjzsj");
			dj=rs.getDouble("dj");
			jsfs=cf.fillNull(rs.getString("jsfs"));
			jsj=rs.getDouble("jsj");
			jsbl=rs.getDouble("jsbl");
			jjfs=cf.fillNull(rs.getString("jjfs"));
			sh=rs.getDouble("sh");

			bz=cf.fillNull(rs.getString("bz"));
			sfkgdj=cf.fillNull(rs.getString("sfkgdj"));
		}
		rs.close();
		ps.close();

		if (sfycx.equals("Y"))//Y：有促销；N：无促销
		{
			if (cxkssj.compareTo(cf.today())<=0 && cxjssj.compareTo(cf.today())>=0)
			{
				dj=cxj;
				jsj=cxjsj;
				jsbl=cxjsbl;
			}
			else{
				sfycx="N";
			}
		}


		ls_sql=" update bj_khzcxm set cpbm=?,tccpdlbm=?,tccplbbm=?,cpmc=?,ppmc=?,gysmc=?,xh=?,gg=?,jldw=?,xdjldw=? ";
		ls_sql+=" ,xdb=?,sfxclxs=?,sfyx=?,yxkssj=?,yxjzsj=?,tcndj=?,tccldj=?,dj=?,jsfs=?,jsj=? ";
		ls_sql+=" ,jsbl=?,ddcljjfs=?,sh=?,sfcscp=?,bz=?,sfkgdj=?";
		ls_sql+=" ,sl=?,xdsl=?,ptcpsm=?";
		ls_sql+=" where sxh="+oldsxh;
		ps= conn.prepareStatement(ls_sql);

		ps.setString(1,cpbm);
		ps.setString(2,tccpdlbm);
		ps.setString(3,tccplbbm);
		ps.setString(4,cpmc);
		ps.setString(5,ppmc);
		ps.setString(6,gysmc);
		ps.setString(7,xh);
		ps.setString(8,gg);
		ps.setString(9,jldw);
		ps.setString(10,xdjldw);

		ps.setDouble(11,xdb);
		ps.setString(12,sfxclxs);
		ps.setString(13,sfyx);
		ps.setDate(14,yxkssj);
		ps.setDate(15,yxjzsj);
		ps.setDouble(16,dj);
		ps.setDouble(17,dj);
		ps.setDouble(18,dj);
		ps.setString(19,jsfs);
		ps.setDouble(20,jsj);

		ps.setDouble(21,jsbl);
		ps.setString(22,jjfs);
		ps.setDouble(23,sh);
		ps.setString(24,"N");//Y：是；N：否
		ps.setString(25,bz);
		ps.setString(26,sfkgdj);

		ps.setDouble(27,sl);
		ps.setDouble(28,sl);
		ps.setString(29,ptcpsm);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) ps.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>