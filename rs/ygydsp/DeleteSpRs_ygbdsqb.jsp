<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bdxh=request.getParameterValues("bdxh");
String scztbm=request.getParameter("ztbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<bdxh.length ;i++ )
	{
		String ygbh=null;
		String bdxz=null;
		String spxh=null;
		String clzt=null;
		String ztbm=null;
		String shr=null;

		String bdqsfzszg=null;
		String dwbh=null;
		String zwbm=null;	
		double bdqgwgz=0;
		double bdqjbgz=0;
		double bdqkhgz=0;
		double bdqbuzhu=0;
		double bdqjtbt=0;
		double bdqcb=0;
		double bdqdhbt=0;
		String ybdxh=null;

		ls_sql="select ygbh,bdxz,spxh,clzt,ztbm,shr   ,bdqsfzszg,dwbh,zwbm,bdqgwgz,bdqjbgz,bdqkhgz,bdqbuzhu,bdqjtbt,bdqcb,bdqdhbt,ybdxh";
		ls_sql+=" from  rs_ygbdsqb";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ygbh=cf.fillNull(rs.getString("ygbh"));
			bdxz=cf.fillNull(rs.getString("bdxz"));
			spxh=cf.fillNull(rs.getString("spxh"));
			clzt=cf.fillNull(rs.getString("clzt"));
			ztbm=cf.fillNull(rs.getString("ztbm"));
			shr=cf.fillNull(rs.getString("shr"));

			bdqsfzszg=cf.fillNull(rs.getString("bdqsfzszg"));
			dwbh=cf.fillNull(rs.getString("dwbh"));
			zwbm=cf.fillNull(rs.getString("zwbm"));
			bdqgwgz=rs.getDouble("bdqgwgz");
			bdqjbgz=rs.getDouble("bdqjbgz");
			bdqkhgz=rs.getDouble("bdqkhgz");
			bdqbuzhu=rs.getDouble("bdqbuzhu");
			bdqjtbt=rs.getDouble("bdqjtbt");
			bdqcb=rs.getDouble("bdqcb");
			bdqdhbt=rs.getDouble("bdqdhbt");
			ybdxh=cf.fillNull(rs.getString("ybdxh"));
		}
		rs.close();
		ps.close();

		if (spxh.equals(""))
		{
			continue;
		}

		String shclzt=null;
		String shztbm=null;
		String shshr=null;

		String yspxh=null;
		String yclzt=null;
		String yztbm=null;
		String yshjl=null;
		String yshyj=null;
		String yshr=null;
		java.sql.Date yshsj=null;

		ls_sql="select clzt,ztbm,shr, yspxh,yclzt,yztbm,yshjl,yshyj,yshr,yshsj";
		ls_sql+=" from  rs_bdsh";
		ls_sql+=" where spxh="+spxh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shclzt=cf.fillNull(rs.getString("clzt"));
			shztbm=cf.fillNull(rs.getString("ztbm"));
			shshr=cf.fillNull(rs.getString("shr"));

			yspxh=cf.fillNull(rs.getString("yspxh"));
			yclzt=cf.fillNull(rs.getString("yclzt"));
			yztbm=cf.fillNull(rs.getString("yztbm"));
			yshjl=cf.fillNull(rs.getString("yshjl"));
			yshyj=cf.fillNull(rs.getString("yshyj"));
			yshr=cf.fillNull(rs.getString("yshr"));
			yshsj=rs.getDate("yshsj");
		}
		rs.close();
		ps.close();


		String gzbm=null;
		ls_sql="select gzbm";
		ls_sql+=" from  dm_xzzwbm";
		ls_sql+=" where xzzwmc='"+zwbm+"'";
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
		ls_sql+=" where dwbh='"+dwbh+"'";
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

		if (!shshr.equals(shr))
		{
			conn.rollback();
			out.println("删除错误！『审核人』已改变");
			return;
		}

		if (!shclzt.equals(clzt))
		{
			conn.rollback();
			out.println("删除错误！『处理状态』已改变");
			return;
		}

		if (!shztbm.equals(ztbm))
		{
			conn.rollback();
			out.println("删除错误！『审批状态』已改变");
			return;
		}

		if (!scztbm.equals(yztbm))
		{
			conn.rollback();
			out.println("删除错误！『审批状态』不正确");
			return;
		}


		//还原
		if (clzt.equals("03"))//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
		{
			ls_sql="update sq_yhxx set dwbh=?,xzzwbm=?,zwbm=?,ssfgs=?,bdxh=? ";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,dwbh);
			ps.setString(2,zwbm);
			ps.setString(3,gzbm);
			ps.setString(4,ssfgs);
			ps.setString(5,ybdxh);
			ps.executeUpdate();
			ps.close();


			ls_sql="update rs_ygbdsqb set gwgz=?,jbgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=? ";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,bdqgwgz);
			ps.setDouble(2,bdqjbgz);
			ps.setDouble(3,bdqkhgz);
			ps.setDouble(4,bdqbuzhu);
			ps.setDouble(5,bdqjtbt);
			ps.setDouble(6,bdqcb);
			ps.setDouble(7,bdqdhbt);
			ps.executeUpdate();
			ps.close();


			if (bdxz.equals("01"))//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			{
				ls_sql="update sq_yhxx set zzxh=null,zzrq=null,zzpzbm=null,sfzszg=?";
				ls_sql+=" where ygbh='"+ygbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,bdqsfzszg);
				ps.executeUpdate();
				ps.close();
			}
		}

		ls_sql="delete from rs_bdsh ";
		ls_sql+=" where spxh="+spxh;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="update rs_ygbdsqb set spxh=?,shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yspxh);
		ps.setString(2,yshr);
		ps.setDate(3,yshsj);
		ps.setString(4,yshjl);
		ps.setString(5,yshyj);
		ps.setString(6,yclzt);
		ps.setString(7,yztbm);
		ps.executeUpdate();
		ps.close();
	}


	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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