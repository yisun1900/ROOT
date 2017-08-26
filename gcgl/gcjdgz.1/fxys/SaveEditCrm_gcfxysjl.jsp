<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysxmflbm=null;
String gcysxmbm=null;
java.sql.Date yssj=null;
String ysr=null;
String sfkhbrqz=null;
String dqzysq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ysxmflbm=cf.GB2Uni(request.getParameter("ysxmflbm"));
gcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收时间]类型转换发生意外:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
sfkhbrqz=cf.GB2Uni(request.getParameter("sfkhbrqz"));
dqzysq=cf.GB2Uni(request.getParameter("dqzysq"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String ysjg=cf.GB2Uni(request.getParameter("ysjg"));
String sffszg=cf.GB2Uni(request.getParameter("sffszg"));
String yssm=cf.GB2Uni(request.getParameter("yssm"));

double ysdf=0;
ls=request.getParameter("ysdf");
try{
	if (!(ls.equals("")))  ysdf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ysdf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收得分]类型转换发生意外:"+e);
	return;
}


String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ysxmflmc=null;
	ls_sql="SELECT ysxmflmc";
	ls_sql+=" FROM dm_ysxmflbm ";
	ls_sql+=" where  ysxmflbm='"+ysxmflbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysxmflmc=cf.fillNull(rs.getString("ysxmflmc"));
	}
	rs.close();
	ps.close();

	String gcysxmmc=null;
	String dygcjdbm="";
	String getsfxhf="";
	String gethflxbm="";
	ls_sql="SELECT gcysxmmc,dygcjdbm,sfhf,hflxbm";
	ls_sql+=" FROM dm_gcysxm ";
	ls_sql+=" where  gcysxmbm='"+gcysxmbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		getsfxhf=cf.fillNull(rs.getString("sfhf"));
		gethflxbm=cf.fillNull(rs.getString("hflxbm"));
	}
	rs.close();
	ps.close();

	//获取验收记录信息
	String khbh=null;
	String oldgcysxmbm=null;
	String oldsfszhf=null;
	String oldhfszjlh=null;
	String oldgcjdbm=null;
	String oldygcjdbm=null;
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;
	String oldygcysxmbm=null;
	java.sql.Date oldyyssj=null;
	ls_sql="select khbh,gcysxmbm,sfszhf,hfszjlh,gcjdbm,ygcjdbm,ysfxhf,yhfrq,yhflxbm,ygcysxmbm,yyssj";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		oldgcysxmbm=rs.getString("gcysxmbm");
		oldsfszhf=cf.fillNull(rs.getString("sfszhf"));
		oldhfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		oldgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		oldygcjdbm=cf.fillNull(rs.getString("ygcjdbm"));
		oldysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		oldyhfrq=rs.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs.getString("yhflxbm"));
		oldygcysxmbm=cf.fillNull(rs.getString("ygcysxmbm"));
		oldyyssj=rs.getDate("yyssj");
	}
	else{
		out.println("错误！不存在的验收记录号："+ysjlh);
		return;
	}
	rs.close();
	ps.close();
	
	//获取最新工程进度
	String nowgcjdbm="";
	String nowzqysxmbm="";
	ls_sql="select gcjdbm,zqysxmbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
	}
	rs.close();
	ps.close();

	if (nowgcjdbm.equals("5"))
	{
		out.println("错误！已完结，不能再修改验收记录");
		return;
	}

	//如果不改工程进度，不设回访信息，可任意修改
	if (!gcysxmbm.equals(oldgcysxmbm))//改变验收项目
	{
		String oldgcysxmmc=null;
		String olddygcjdbm="";
		String oldgetsfxhf="";
		String oldgethflxbm="";
		ls_sql="SELECT gcysxmmc,dygcjdbm,sfhf,hflxbm";
		ls_sql+=" FROM dm_gcysxm ";
		ls_sql+=" where  gcysxmbm='"+oldgcysxmbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			oldgcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
			olddygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
			oldgetsfxhf=cf.fillNull(rs.getString("sfhf"));
			oldgethflxbm=cf.fillNull(rs.getString("hflxbm"));
		}
		rs.close();
		ps.close();

		if (!dygcjdbm.equals("") || getsfxhf.equals("Y") || !olddygcjdbm.equals("") || oldgetsfxhf.equals("Y"))
		{
			if (!nowzqysxmbm.equals(oldgcysxmbm))
			{
				out.println("错误！只能修改最新的验收项目");
				return;
			}
		}
	}
	else{
		if (!dygcjdbm.equals("") || getsfxhf.equals("Y"))
		{
			if (!nowzqysxmbm.equals(oldgcysxmbm))
			{
				out.println("错误！只能修改最新的验收项目");
				return;
			}
		}
	}

	
	
	


	//获取回访设置记录信息
	String getsfyhf="";//是否已回访 ,Y：回访；N：未回访
	String getzxszbz="";//最新设置标志  ,Y：是；N：否
	String yhfszjlh=null;
	ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl ";
	ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfyhf=cf.fillNull(rs.getString("sfyhf"));
		getzxszbz=cf.fillNull(rs.getString("zxszbz"));
		yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
	}
	rs.close();
	ps.close();

	//检查项目是否重复
	if (!gcysxmbm.equals(oldgcysxmbm))//改变验收项目
	{
		int count=0;
		ls_sql="SELECT count(*) ";
		ls_sql+=" FROM crm_gcfxysjl ";
		ls_sql+=" where  khbh='"+khbh+"' and gcysxmbm='"+gcysxmbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			out.println("错误！该项验收已录入");
			return;
		}
	}


	conn.setAutoCommit(false);

	if (!gcysxmbm.equals(oldgcysxmbm))//改变验收项目
	{
		//重新设置回访信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (oldsfszhf.equals("Y"))//以前设置过回访, Y：是；N：否
		{
			if (getsfyhf.equals("N"))//客服没有实际回访
			{
				if (getzxszbz.equals("Y"))//是最新记录，改变回访信息
				{
					if (getsfxhf.equals("Y"))//新的需设置回访:类型，时间
					{
						ls_sql="update crm_khxx set hflxbm=?,hfrq=?+1";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,gethflxbm);
						ps.setDate(2,yssj);
						ps.executeUpdate();
						ps.close();

						ls_sql="update crm_hfszjl set hflxbm=?,hfsj=?+1,hfszr=?,hfszsj=SYSDATE";
						ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,gethflxbm);
						ps.setDate(2,yssj);
						ps.setString(3,lrr);
						ps.executeUpdate();
						ps.close();
					}
					else{//新的不需设置回访，删除回访设置,下一级与前一级关联,删除本级
						ls_sql="update crm_khxx set sfxhf=?,hflxbm=?,hfrq=?";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,oldysfxhf);
						ps.setString(2,oldyhflxbm);
						ps.setDate(3,oldyhfrq);
						ps.executeUpdate();
						ps.close();

						//删除回访设置记录
						ls_sql="delete from crm_hfszjl ";
						ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.executeUpdate();
						ps.close();

						ls_sql=" update crm_hfszjl set zxszbz='Y'";	
						ls_sql+=" where hfszjlh='"+yhfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.executeUpdate();
						ps.close();
					}
				}
				else{//不是最新记录，不改变回访信息
					if (getsfxhf.equals("Y"))//新的需设置回访:类型，时间
					{
						ls_sql="update crm_hfszjl set hflxbm=?,hfsj=?+1,hfszr=?,hfszsj=SYSDATE";
						ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,gethflxbm);
						ps.setDate(2,yssj);
						ps.setString(3,lrr);
						ps.executeUpdate();
						ps.close();
					}
					else{//新的不需设置回访，,下一级与前一级关联,删除本级
						//取下一级
						String nexthfszjlh=null;
						ls_sql="SELECT hfszjlh ";
						ls_sql+=" FROM crm_hfszjl ";
						ls_sql+=" where  khbh='"+khbh+"' and yhfszjlh='"+oldhfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						rs =ps.executeQuery();
						if (rs.next())
						{
							nexthfszjlh=cf.fillNull(rs.getString("hfszjlh"));
						}
						rs.close();
						ps.close();

						//下一级与前一级关联
						ls_sql=" update crm_hfszjl set yhfszjlh=?";	
						ls_sql+=" where hfszjlh='"+nexthfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,yhfszjlh);
						ps.executeUpdate();
						ps.close();

						//删除本级回访设置记录
						ls_sql="delete from crm_hfszjl ";
						ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.executeUpdate();
						ps.close();
					}
				}
			}
		}
		else{//以前未设置过回访
			if (getsfxhf.equals("Y"))//新的需设置回访，增加回访设置
			{
				ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?+1 ";
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,gethflxbm);
				ps.setDate(2,yssj);
				ps.executeUpdate();
				ps.close();

				//插入：回访设置记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
				String newyhfszjlh=null;
				ls_sql="select hfszjlh";
				ls_sql+=" from  crm_hfszjl";
				ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					newyhfszjlh=rs.getString("hfszjlh");
				}
				rs.close();
				ps.close();

				ls_sql=" update crm_hfszjl set zxszbz='N'";	
				ls_sql+=" where  khbh='"+khbh+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

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

				String hfszjlh=null;
				hfszjlh=khbh.trim()+cf.addZero(count+1,3);

				oldhfszjlh=hfszjlh;//回访设置记录号发生变化

				String hfszyy=ysjlh+":工程分项验收";
				ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
				ls_sql+=" values ( ?,?,?,?+1,?,SYSDATE,?,'5',?,'N','Y',?) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,hfszjlh);
				ps.setString(2,khbh);
				ps.setString(3,gethflxbm);
				ps.setDate(4,yssj);
				ps.setString(5,lrr);
				ps.setString(6,hfszyy);
				ps.setString(7,ysjlh);
				ps.setString(8,newyhfszjlh);
				ps.executeUpdate();
				ps.close();

				//插入：回访设置记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
			}
			else{//新的不需设置回访，不需做任何改变
			}
		}
		//重新设置回访信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


		//重新设置工程进度信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (!oldgcjdbm.equals(""))//以前设过
		{
			if (!oldgcjdbm.equals(nowgcjdbm))//设置的工程进度编码已改变，不能再修改
			{
				conn.rollback();
				out.println("错误！客户工程进度已改变，不能再修改");
				return;
			}
			else{//可修改
				//首先删除旧的＋＋＋＋＋＋＋＋＋＋＋＋＋开始
				if (oldgcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
				{
					ls_sql="update crm_khxx set gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("2"))
				{
					ls_sql="update crm_khxx set sjkgrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("6"))
				{
					ls_sql="update crm_khxx set sybgcrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("3"))
				{
					ls_sql="update crm_khxx set szqsj=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (oldgcjdbm.equals("4"))
				{
					ls_sql="update crm_khxx set sjjgrq=null,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,oldygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				//首先删除旧的＝＝＝＝＝＝＝＝＝＝＝＝＝结束
				
				//新的需要设置，检查是否可设置
				if (!dygcjdbm.equals(""))
				{
					if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
					{
						if (nowgcjdbm.equals("2") || nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
						{
							conn.rollback();
							out.println("错误！客户已开工，不能设置成未开工");
							return;
						}
					}
					else if (dygcjdbm.equals("2"))
					{
						if (nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
						{
							conn.rollback();
							out.println("错误！客户已经开工，不能重新设置");
							return;
						}
					}
					else if (dygcjdbm.equals("6"))
					{
						if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
						{
							conn.rollback();
							out.println("错误！客户已完工，设置错误！");
							return;
						}
					}
					else if (dygcjdbm.equals("3"))
					{
						if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
						{
							conn.rollback();
							out.println("错误！客户已完工，设置错误！");
							return;
						}
					}
					else if (dygcjdbm.equals("4"))
					{
						if (nowgcjdbm.equals("5"))
						{
							conn.rollback();
							out.println("错误！客户已完结，设置错误！");
							return;
						}
					}


					if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
					{
						ls_sql="update crm_khxx set gcjdbm=?";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,dygcjdbm);
						ps.executeUpdate();
						ps.close();
					}
					else if (dygcjdbm.equals("2"))
					{
						ls_sql="update crm_khxx set sjkgrq=?,gcjdbm=?";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yssj);
						ps.setString(2,dygcjdbm);
						ps.executeUpdate();
						ps.close();
					}
					else if (dygcjdbm.equals("6"))
					{
						ls_sql="update crm_khxx set sybgcrq=?,gcjdbm=?";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yssj);
						ps.setString(2,dygcjdbm);
						ps.executeUpdate();
						ps.close();
					}
					else if (dygcjdbm.equals("3"))
					{
						ls_sql="update crm_khxx set szqsj=?,gcjdbm=?";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yssj);
						ps.setString(2,dygcjdbm);
						ps.executeUpdate();
						ps.close();
					}
					else if (dygcjdbm.equals("4"))
					{
						ls_sql="update crm_khxx set sjjgrq=?,gcjdbm=?";
						ls_sql+=" where  khbh='"+khbh+"' ";
						ps= conn.prepareStatement(ls_sql);
						ps.setDate(1,yssj);
						ps.setString(2,dygcjdbm);
						ps.executeUpdate();
						ps.close();
					}
				}
			}
		}
		else{//以前未设过
			if (!dygcjdbm.equals(""))//新的需要设置，增加新设置，检查是否可设置
			{
				
				if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
				{
					if (nowgcjdbm.equals("2") || nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
					{
						conn.rollback();
						out.println("错误！客户已开工，不能设置成未开工");
						return;
					}
				}
				else if (dygcjdbm.equals("2"))
				{
					if (nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
					{
						conn.rollback();
						out.println("错误！客户已经开工，不能重新设置");
						return;
					}
				}
				else if (dygcjdbm.equals("6"))
				{
					if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
					{
						conn.rollback();
						out.println("错误！客户已完工，设置错误！");
						return;
					}
				}
				else if (dygcjdbm.equals("3"))
				{
					if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
					{
						conn.rollback();
						out.println("错误！客户已完工，设置错误！");
						return;
					}
				}
				else if (dygcjdbm.equals("4"))
				{
					if (nowgcjdbm.equals("5"))
					{
						conn.rollback();
						out.println("错误！客户已完结，设置错误！");
						return;
					}
				}


				if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
				{
					ls_sql="update crm_khxx set gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,dygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (dygcjdbm.equals("2"))
				{
					ls_sql="update crm_khxx set sjkgrq=?,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yssj);
					ps.setString(2,dygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (dygcjdbm.equals("6"))
				{
					ls_sql="update crm_khxx set sybgcrq=?,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yssj);
					ps.setString(2,dygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (dygcjdbm.equals("3"))
				{
					ls_sql="update crm_khxx set szqsj=?,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yssj);
					ps.setString(2,dygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
				else if (dygcjdbm.equals("4"))
				{
					ls_sql="update crm_khxx set sjjgrq=?,gcjdbm=?";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yssj);
					ps.setString(2,dygcjdbm);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{//新的不需要设置，不需做任何改变
			}
		}
		//重新设置工程进度信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


		ls_sql="update crm_gcfxysjl set ysxmflbm=?,ysxmflmc=?,gcysxmbm=?,gcysxmmc=?,yssj=?,ysr=?,ysjg=?,sffszg=?,yssm=?,sfkhbrqz=? ";
		ls_sql+=" ,dqzysq=?,lrr=?,lrsj=?,lrbm=?,bz=?,sfszhf=?,hfszjlh=?,gcjdbm=?,ysdf=?";
		ls_sql+=" where  ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysxmflbm);
		ps.setString(2,ysxmflmc);
		ps.setString(3,gcysxmbm);
		ps.setString(4,gcysxmmc);
		ps.setDate(5,yssj);
		ps.setString(6,ysr);
		ps.setString(7,ysjg);
		ps.setString(8,sffszg);
		ps.setString(9,yssm);
		ps.setString(10,sfkhbrqz);

		ps.setString(11,dqzysq);
		ps.setString(12,lrr);
		ps.setDate(13,lrsj);
		ps.setString(14,lrbm);
		ps.setString(15,bz);
		ps.setString(16,getsfxhf);
		ps.setString(17,oldhfszjlh);
		ps.setString(18,dygcjdbm);
		ps.setDouble(19,ysdf);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set szqsj=?,zqysxmbm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.setString(2,gcysxmbm);
		ps.executeUpdate();
		ps.close();
	}
	else{//未改变验收项目

		ls_sql="update crm_gcfxysjl set yssj=?,ysr=?,ysjg=?,sffszg=?,yssm=?,sfkhbrqz=?,dqzysq=?,lrr=?,lrsj=?,lrbm=?,bz=?,ysdf=? ";
		ls_sql+=" where  ysjlh='"+ysjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.setString(2,ysr);
		ps.setString(3,ysjg);
		ps.setString(4,sffszg);
		ps.setString(5,yssm);
		ps.setString(6,sfkhbrqz);
		ps.setString(7,dqzysq);
		ps.setString(8,lrr);
		ps.setDate(9,lrsj);
		ps.setString(10,lrbm);
		ps.setString(11,bz);
		ps.setDouble(12,ysdf);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set szqsj=? ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.executeUpdate();
		ps.close();

		//重新设置回访时间＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		if (oldsfszhf.equals("Y"))//是否设置回访  Y：是；N：否
		{
			if (getsfyhf.equals("N"))//客服没有实际回访
			{
				//修改回访设置记录
				ls_sql="update crm_hfszjl set hfsj=?+1,hfszr=?,hfszsj=SYSDATE";
				ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,yssj);
				ps.setString(2,lrr);
				ps.executeUpdate();
				ps.close();

				if (getzxszbz.equals("Y"))//是最新记录，修改回访时间
				{
					ls_sql="update crm_khxx set hfrq=?+1 ";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yssj);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		//重新设置回访时间＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		//重新设置工程进度时间＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		//设置过工程进度，需修改工程进度时间，根据不同工程进度，修改不同时间
		if (oldgcjdbm.equals("2"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
		{
			ls_sql="update crm_khxx set sjkgrq=?";
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yssj);
			ps.executeUpdate();
			ps.close();
		}
		else if (oldgcjdbm.equals("6"))
		{
			ls_sql="update crm_khxx set sybgcrq=?";
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yssj);
			ps.executeUpdate();
			ps.close();
		}
		else if (oldgcjdbm.equals("3"))
		{
			ls_sql="update crm_khxx set szqsj=?";
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yssj);
			ps.executeUpdate();
			ps.close();
		}
		else if (oldgcjdbm.equals("4"))
		{
			ls_sql="update crm_khxx set sjjgrq=?";
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yssj);
			ps.executeUpdate();
			ps.close();
		}
		//重新设置工程进度时间＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>