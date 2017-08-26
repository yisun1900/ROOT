<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] bdxh = request.getParameterValues("bdxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<bdxh.length ;i++ )
	{
		String getclzt=null;
		String getbdxz=null;
		String getbdqsfzszg=null;
		String getbdhsfzszg=null;
		String getdwbh=null;
		String dwbh2=null;
		String getzwbm=null;
		double getbdqgwgz=0;
		double getbdqjbgz=0;
		double getbdqkhgz=0;
		double getbdqbuzhu=0;
		double getbdqjtbt=0;
		double getbdqcb=0;
		double getbdqdhbt=0;
		String ybdxh=null;
		String ygbh=null;
		ls_sql="select clzt,bdxz,bdqsfzszg,bdhsfzszg,dwbh2,dwbh,zwbm,bdqgwgz,bdqjbgz,bdqkhgz,bdqbuzhu,bdqjtbt,bdqcb,bdqdhbt,ybdxh,ygbh";
		ls_sql+=" from  rs_ygbdsqb";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getclzt=cf.fillNull(rs.getString("clzt"));
			getbdxz=cf.fillNull(rs.getString("bdxz"));
			getbdqsfzszg=cf.fillNull(rs.getString("bdqsfzszg"));
			getbdhsfzszg=cf.fillNull(rs.getString("bdhsfzszg"));
			getdwbh=cf.fillNull(rs.getString("dwbh"));
			dwbh2=cf.fillNull(rs.getString("dwbh2"));
			getzwbm=cf.fillNull(rs.getString("zwbm"));
			getbdqgwgz=rs.getDouble("bdqgwgz");
			getbdqjbgz=rs.getDouble("bdqjbgz");
			getbdqkhgz=rs.getDouble("bdqkhgz");
			getbdqbuzhu=rs.getDouble("bdqbuzhu");
			getbdqjtbt=rs.getDouble("bdqjtbt");
			getbdqcb=rs.getDouble("bdqcb");
			getbdqdhbt=rs.getDouble("bdqdhbt");
			ybdxh=cf.fillNull(rs.getString("ybdxh"));
			ygbh=cf.fillNull(rs.getString("ygbh"));
		}
		else{
			conn.rollback();
			out.println("错误！变动序号『"+bdxh[i]+"』不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!getclzt.equals("00") && !getclzt.equals("01"))//01：等待审批
		{
			conn.rollback();
			out.println("错误！处理状态不正确");
			return;
		}

		String mqsfzszg="";
		String mqbdxh="";
		ls_sql="select sfzszg,bdxh";
		ls_sql+=" from  sq_yhxx";
		ls_sql+=" where ygbh='"+ygbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mqsfzszg=cf.fillNull(rs.getString(1));
			mqbdxh=cf.fillNull(rs.getString(2));
		}
		rs.close();
		ps.close();

		if (!mqsfzszg.equals(getbdhsfzszg))
		{
			conn.rollback();
			out.println("错误！『员工状态』已改变");
			return;
		}
		if (!mqbdxh.equals(bdxh[i]))
		{
			out.println("错误！只能删除最新的变动记录『"+mqbdxh+"』");
			return;
		}

		String gzbm=null;
		ls_sql="select gzbm";
		ls_sql+=" from  dm_xzzwbm";
		ls_sql+=" where xzzwmc='"+getzwbm+"'";
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

		String ssfgs=null;
		ls_sql="select ssfgs";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
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

		
		
		
		//还原
		if (getclzt.equals("00"))//00：不需审批；01：等待审批；02：正在审批；03：审批通过；04：审批取消
		{
			ls_sql="update sq_yhxx set dwbh=?,xzzwbm=?,zwbm=?,ssfgs=?,bdxh=? ";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,getdwbh);
			ps.setString(2,getzwbm);
			ps.setString(3,gzbm);
			ps.setString(4,ssfgs);
			ps.setString(5,ybdxh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update rs_ygjbgzb set gwgz=?,jbgz=?,khgz=?,buzhu=?,jtbt=?,cb=?,dhbt=?";
			ls_sql+=" where ygbh='"+ygbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,getbdqgwgz);
			ps.setDouble(2,getbdqjbgz);
			ps.setDouble(3,getbdqkhgz);
			ps.setDouble(4,getbdqbuzhu);
			ps.setDouble(5,getbdqjtbt);
			ps.setDouble(6,getbdqcb);
			ps.setDouble(7,getbdqdhbt);
			ps.executeUpdate();
			ps.close();


			if (getbdxz.equals("01"))//01:转正；02:调薪；03:升职；04:降职；05:调职；06:调动；07:升级；08:降级；99:其他
			{
				ls_sql="update sq_yhxx set zzxh=null,zzrq=null,zzpzbm=null,sfzszg=?";
				ls_sql+=" where ygbh='"+ygbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,getbdqsfzszg);
				ps.executeUpdate();
				ps.close();
			}


			//修改授权和客户资料＋＋＋＋＋＋＋＋开始	
			if (gzbm.equals("04"))//04:家装设计师
			{
				if (!getdwbh.equals(dwbh2) )//换部门
				{
					if (sjszdgh.equals("Y"))//设计师换部门咨询客户自动更换
					{
						ls_sql="update crm_zxkhxx set zxdm=?,sjsbh=? ";
						ls_sql+=" where zxdm='"+dwbh2+"' and sjs='"+yhmc+"'";
						ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,getdwbh);
						ps.setString(2,"");
						ps.executeUpdate();
						ps.close();
					}
				}


				if (!getdwbh.equals(dwbh2) )//换部门
				{
					ls_sql="delete from sq_sqbm";
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+getdwbh+"','"+ygbh+"','"+ssfgs+"')";
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
			else if (gzbm.equals("03"))//03:客户经理
			{
				if (!getdwbh.equals(dwbh2) )//换部门
				{

					if (khjlzdgh.equals("Y"))//客户经理换部门咨询客户自动更换
					{
						ls_sql="update crm_zxkhxx set zxdm=? ";
						ls_sql+=" where zxdm='"+dwbh2+"' and khjl='"+yhmc+"'";
						ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,getdwbh);
						ps.executeUpdate();
						ps.close();
					}
				}


				if (!getdwbh.equals(dwbh2) )//换部门
				{
					ls_sql="delete from sq_sqbm";
					ls_sql+=" where ygbh="+ygbh;
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql="insert into sq_sqbm (dwbh,ygbh,ssfgs ) ";
					ls_sql+=" values('"+getdwbh+"','"+ygbh+"','"+ssfgs+"')";
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
			else if (gzbm.equals("19"))//19:业务员
			{
				if (!getdwbh.equals(dwbh2) )//换部门
				{
					if (ywyzdgh.equals("Y"))//业务员换部门咨询客户自动更换
					{
						ls_sql="update crm_zxkhxx set ywybm=?,ywyssxz=? ";
						ls_sql+=" where ywybm='"+dwbh2+"' and ywy='"+yhmc+"'";
						ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";//0：未分配店面；1: 分配店面；2: 飞单审核未通过；3：已签约；4：飞单；5：飞单审核未通过
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,getdwbh);
						ps.setString(2,"");
						ps.executeUpdate();
						ps.close();
					}
				}
			}
			//修改授权和客户资料＝＝＝＝＝＝＝＝结束	
		}

		ls_sql="delete from rs_ygbdsplc";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from rs_bdsh";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from rs_ygbdsqb";
		ls_sql+=" where bdxh='"+bdxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
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