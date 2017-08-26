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

String spxh=cf.GB2Uni(request.getParameter("spxh"));
String xgztbm=cf.GB2Uni(request.getParameter("xgztbm"));

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

	ls_sql="select spxh,clzt,ztbm,shjl,shyj,shr,shsj   ,bdqsfzszg,dwbh,zwbm,bdqgwgz,bdqjbgz,bdqkhgz,bdqbuzhu,bdqjtbt,bdqcb,bdqdhbt,ybdxh  ,ygbh,dwbh2,zwbm2,bdhgwgz,bdhjbgz,bdhkhgz,bdhbuzhu,bdhjtbt,bdhcb,bdhdhbt,bdxz,bdsxrq,lrbm";
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

	if (!yspxh.equals(spxh))
	{
		out.println("删除错误！审批已改变");
		return;
	}


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


	String shclzt=null;
	String shztbm=null;
	String shyztbm=null;

	ls_sql="select clzt,ztbm,yztbm";
	ls_sql+=" from  rs_bdsh";
	ls_sql+=" where spxh="+yspxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shclzt=cf.fillNull(rs.getString("clzt"));
		shztbm=cf.fillNull(rs.getString("ztbm"));
		shyztbm=cf.fillNull(rs.getString("yztbm"));
	}
	rs.close();
	ps.close();


	if (!yclzt.equals(shclzt))
	{
		out.println("删除错误！处理状态已改变");
		return;
	}

	if (!yztbm.equals(shztbm))
	{
		out.println("删除错误！审批状态已改变");
		return;
	}

	if (!shyztbm.equals(xgztbm))
	{
		out.println("错误！『审批状态』已改变，不能再修改");
		return;
	}



	//取下一状态
	String xyztbm=null;
	if (shjl.equals("1"))//0:取消;1:审批通过
	{
		ls_sql="select ztbm";
		ls_sql+=" from  rs_ygbdsplc";
		ls_sql+=" where bdxh='"+bdxh+"' and ztbm>'"+shyztbm+"'";
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

	String sjszdgh="";//设计师换部门咨询客户自动更换
	String sjszdjz="";//设计师换部门自动兼职
	String ywyzdgh="";//业务员换部门咨询客户自动更换
	String khjlzdgh="";//客户经理换部门咨询客户自动更换
	String khjlzdjz="";//客户经理换部门自动兼职
	ls_sql="select sjszdgh,ywyzdgh,sjszdjz,khjlzdgh,khjlzdjz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjszdgh=cf.fillNull(rs.getString("sjszdgh"));
		ywyzdgh=cf.fillNull(rs.getString("ywyzdgh"));
		sjszdjz=cf.fillNull(rs.getString("sjszdjz"));
		khjlzdgh=cf.fillNull(rs.getString("khjlzdgh"));
		khjlzdjz=cf.fillNull(rs.getString("khjlzdjz"));
	}
	rs.close();
	ps.close();

	String yhmc="";
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//还原
	if (yclzt.equals("03"))//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
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

		ls_sql="update rs_ygjbgzb set gwgz=?,jbgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=? ";
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

		//修改授权和客户资料＋＋＋＋＋＋＋＋开始	
		if (gzbm.equals("04"))//04:家装设计师
		{
			if (!dwbh.equals(dwbh2) )//换部门
			{
				if (sjszdgh.equals("Y"))//设计师换部门咨询客户自动更换
				{
					ls_sql="update crm_zxkhxx set zxdm=?,sjsbh=? ";
					ls_sql+=" where zxdm='"+dwbh+"' and sjs='"+yhmc+"'";
					ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,dwbh2);
					ps.setString(2,"");
					ps.executeUpdate();
					ps.close();
				}
			}


			if (!dwbh.equals(dwbh2) )//换部门
			{
				if (sjszdjz.equals("Y"))//设计师换部门自动兼职
				{
					ls_sql="delete from sq_sqbm";
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+dwbh2+"','"+ygbh+"','"+ssfgs+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+dwbh+"','"+ygbh+"','"+ssfgs+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update sq_yhxx set kfgssq='4'";//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{
					ls_sql="delete from sq_sqbm";
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+dwbh2+"','"+ygbh+"','"+ssfgs+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update sq_yhxx set kfgssq='3'";//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		else if (gzbm.equals("03"))//03:客户经理
		{
			if (!dwbh.equals(dwbh2) )//换部门
			{

				if (khjlzdgh.equals("Y"))//客户经理换部门咨询客户自动更换
				{
					ls_sql="update crm_zxkhxx set zxdm=? ";
					ls_sql+=" where zxdm='"+dwbh+"' and khjl='"+yhmc+"'";
					ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,dwbh2);
					ps.executeUpdate();
					ps.close();
				}
			}


			if (!dwbh.equals(dwbh2) )//换部门
			{
				if (khjlzdjz.equals("Y"))//客户经理换部门自动兼职
				{
					ls_sql="delete from sq_sqbm";
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+dwbh2+"','"+ygbh+"','"+ssfgs+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+dwbh+"','"+ygbh+"','"+ssfgs+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update sq_yhxx set kfgssq='4'";//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
				else{
					ls_sql="delete from sq_sqbm";
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+dwbh2+"','"+ygbh+"','"+ssfgs+"')";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="update sq_yhxx set kfgssq='3'";//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		else if (gzbm.equals("19"))//19:业务员
		{
			if (!dwbh.equals(dwbh2) )//换部门
			{
				if (ywyzdgh.equals("Y"))//业务员换部门咨询客户自动更换
				{
					ls_sql="update crm_zxkhxx set ywybm=?,ywyssxz=? ";
					ls_sql+=" where ywybm='"+dwbh+"' and ywy='"+yhmc+"'";
					ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,dwbh2);
					ps.setString(2,"");
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		//修改授权和客户资料＝＝＝＝＝＝＝＝结束	
	
	
	}
	
	ls_sql="update rs_bdsh set shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=?";
	ls_sql+=" where spxh="+spxh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shr);
	ps.setDate(2,shsj);
	ps.setString(3,shjl);
	ps.setString(4,shyj);
	ps.setString(5,sqzt);
	ps.setString(6,xyztbm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update rs_ygbdsqb set shr=?,shsj=?,shjl=?,shyj=?,clzt=?,ztbm=? ";
	ls_sql+=" where bdxh='"+bdxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shr);
	ps.setDate(2,shsj);
	ps.setString(3,shjl);
	ps.setString(4,shyj);
	ps.setString(5,sqzt);
	ps.setString(6,xyztbm);
	ps.executeUpdate();
	ps.close();

	if (sqzt.equals("03"))//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
	{
		ssfgs=null;
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
			conn.rollback();
			out.println("存盘失败！无【所属分公司】");
			return;
		}

		gzbm=null;
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
			conn.rollback();
			out.println("错误！工种不存在："+ls_sql);
			return;
		}

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