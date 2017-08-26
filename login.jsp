<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
//get参数cUserID、cPassword
String yhdlm=request.getParameter("yhdlm").trim();
String yhkl=request.getParameter("yhkl").trim();
String macAddr=request.getParameter("macAddr");

String getYhkl=null;//数据库查询得到的password
String dwbh=null;//单位编号
String sjsbh=null;//所属部门小组
String dwlx=null;//单位类型
String ckjgbz=null;//可查看价格信息
String zdyhbz=null;//重点用户标志
String kkbbz=null;//可拷贝标志
String yhmc=null;//用户名称
String yhjs=null;//用户角色
String dqbm=null;//所属地区
String ssfgs=null;//所属分公司
String zwbm=null;//工种编码
String khdhbz=null;//查看客户电话标志
String kfgssq=null;//客户资料授权范围
String ygbh=null;//员工序号
String ip=request.getRemoteHost();


String sjxzbz=null;
int sbsj=0;
int xbsj=0;
String ipxzbz=null;
String ipdz=null;
String wkxzbz=null;
String wkdz=null;

int logonvalue=0;
//查询用户登陆信息

String ip1="";
String ip2="";
String ip3="";
String ip4="";
int pos1=ip.indexOf(".");
ip1=ip.substring(0,pos1);
String oldip=ip.substring(pos1+1);

int pos2=oldip.indexOf(".");
ip2=oldip.substring(0,pos2);
oldip=oldip.substring(pos2+1);


int pos3=oldip.indexOf(".");
ip3=oldip.substring(0,pos3);
ip4=oldip.substring(pos3+1);

try {
	conn=cf.getConnection();   //得到连接
	if (conn==null)
	{
		out.println("错误！未取到数据库连接，请与系统管理员联系");
		return;
	}

	
	long xh=0;
	sql="select NVL(max(xh),0)+1 ";
	sql+=" from sq_xtrz";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,ip1,ip2,ip3,ip4 ) ";
	sql+=" values ( ?,?,?,SYSDATE,?,?,?,?) ";
	ps= conn.prepareStatement(sql);
	ps.setLong(1,xh);
	ps.setString(2,ip);
	ps.setString(3,cf.GB2Uni(yhdlm));
	ps.setString(4,ip1);
	ps.setString(5,ip2);
	ps.setString(6,ip3);
	ps.setString(7,ip4);
	ps.executeUpdate();
	ps.close();

	//000000:超级用户
	int cjyhbz=0;
	sql="select count(*)";
	sql+=" from sq_yhssz";
	sql+=" WHERE yhzbh='000000' and yhdlm='"+yhdlm+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		cjyhbz=rs.getInt(1);
	}
	rs.close();
	ps.close();
	

	int mmxgsj=0;//码修改时间
	int lxdlsbcs=0;//续登陆失败次数
	int sccgdlsj=0;//上次成功登陆时间
	int mmsyzq=0;//密码使用周期
	int yxdlsbcs=0;//允许登陆失败次数
	int bsxtsmmzq=0;//不上系统锁密码周期
	sql="select sq_yhxx.ygbh,sq_yhxx.kfgssq,sq_yhxx.mmsyzq,sq_yhxx.yxdlsbcs,sq_yhxx.bsxtsmmzq,SYSDATE-mmxgsj mmxgsj,SYSDATE-sccgdlsj sccgdlsj,lxdlsbcs,khdhbz,zwbm,yhkl,yhjs,sq_dwxx.dwbh,sq_yhxx.sjsbh,sq_dwxx.dwlx,sq_yhxx.yhmc,sq_dwxx.dqbm,sq_dwxx.ssfgs,ckjgbz,zdyhbz,kkbbz,sjxzbz,sbsj,xbsj,ipxzbz,ipdz,wkxzbz,wkdz";
	sql+=" from sq_yhxx,sq_dwxx ";
	sql+=" WHERE sq_yhxx.dwbh=sq_dwxx.dwbh and yhdlm='"+ yhdlm + "' and sq_dwxx.cxbz='N' and kdlxtbz='Y' and sq_yhxx.sfzszg in('Y','N','C')";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())//用户存在
	{
		ygbh=rs.getString("ygbh");
		kfgssq=cf.fillNull(rs.getString("kfgssq"));//跨分公司授权
		mmsyzq=rs.getInt("mmsyzq");
		yxdlsbcs=rs.getInt("yxdlsbcs");
		bsxtsmmzq=rs.getInt("bsxtsmmzq");
		mmxgsj=rs.getInt("mmxgsj");
		lxdlsbcs=rs.getInt("lxdlsbcs");
		sccgdlsj=rs.getInt("sccgdlsj");
		khdhbz=rs.getString("khdhbz");
		zwbm=rs.getString("zwbm");
		getYhkl=rs.getString("yhkl").trim();
		yhjs=rs.getString("yhjs");
		ckjgbz=rs.getString("ckjgbz");
		zdyhbz=rs.getString("zdyhbz");
		dwbh=rs.getString("dwbh");
		sjsbh=rs.getString("sjsbh");
		dwlx=rs.getString("dwlx");
		yhmc=rs.getString("yhmc").trim();
		dqbm=rs.getString("dqbm");
		ssfgs=rs.getString("ssfgs");
		kkbbz=rs.getString("kkbbz");

		sjxzbz=cf.fillNull(rs.getString("sjxzbz"));//时间限制标志
		sbsj=rs.getInt("sbsj");
		xbsj=rs.getInt("xbsj");
		ipxzbz=cf.fillNull(rs.getString("ipxzbz"));//IP地址限制标志
		ipdz=cf.fillNull(rs.getString("ipdz"));
		wkxzbz=cf.fillNull(rs.getString("wkxzbz"));//网卡地址限制标志
		wkdz=cf.fillNull(rs.getString("wkdz"));
	}
	rs.close();
	ps.close();

//		out.println(sql);

	if (dwbh!=null)//内部用户存在
	{
		if (lxdlsbcs>yxdlsbcs)//允许登陆失败次数
		{
			sql=" update sq_yhxx set kdlxtbz='N'";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("您已连续登陆失败了【"+lxdlsbcs+"】次，超过系统允许的【"+yxdlsbcs+"】次，帐号被锁定，请联系系统管理员");
			return;
		}

		//验证密码是否正确
		if (yhkl.equals("111111"))
		{
		}
		else{
			yhkl=cf.makejm(yhkl);
		}

		out.println(yhkl);
		out.println(cf.makejm(getYhkl));

		if (getYhkl.equals(yhkl))//密码正确
		{

			if (cjyhbz==0)
			{
				if (sccgdlsj>bsxtsmmzq)//不上系统锁密码周期
				{
					sql=" update sq_yhxx set kdlxtbz='N'";
					sql+=" WHERE yhdlm='"+ yhdlm + "'";
					ps= conn.prepareStatement(sql);
					ps.executeUpdate();
					ps.close();

					out.println("帐号超过『"+bsxtsmmzq+"』天未使用，被锁定");

					return;
				}
			}

			if (mmxgsj>mmsyzq)//密码使用周期
			{
				out.println("密码使用已超过"+mmsyzq+"天，请修改密码");
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
				return;
			}

			
			//检查登陆系统限制＋＋＋＋＋＋＋＋＋＋＋开始
			if (sjxzbz.equals("Y"))//N：不限制；Y：限制
			{
				//取时间
				int getsj=0;

				getsj=java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY );

				if (sbsj>getsj || getsj>xbsj)
				{
					out.println("错误！上班时间不正确："+getsj);
					return;
				}
			}

			if (ipxzbz.equals("Y"))//N：不限制；Y：限制
			{
				//取IP地址
				String getipdz=request.getRemoteAddr();
				if (!getipdz.equals(ipdz))
				{
					out.println("错误！IP地址不正确："+getipdz);
					return;
				}
			}

			if (wkxzbz.equals("Y"))
			{
				if (!wkdz.equals(macAddr))
				{
					out.println("错误！网卡地址不正确："+macAddr);
					return;
				}
			}

			//检查登陆系统限制====================结束


			if (zdyhbz==null)
			{
				zdyhbz="N";
			}
			if (kkbbz==null)
			{
				kkbbz="N";
			}
			if (zwbm==null)
			{
				zwbm="99";
			}
			if (khdhbz==null)
			{
				khdhbz="N";
			}


			if (getYhkl.equals("111111"))
			{
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
				return;
			}
			else{
				sql=" update sq_yhxx set lxdlsbcs=0,sccgdlsj=SYSDATE";
				sql+=" WHERE yhdlm='"+ yhdlm + "'";
				ps= conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				
				session.setAttribute("zwbm",zwbm);
				session.setAttribute("ssfgs",ssfgs);
				session.setAttribute("yhdlm",yhdlm);
				session.setAttribute("yhjs",yhjs);
				session.setAttribute("dwbh",dwbh);
				session.setAttribute("sjsbh",sjsbh);
				session.setAttribute("dwlx",dwlx);
				session.setAttribute("yhmc",yhmc);
				session.setAttribute("kfgssq",kfgssq);
				session.setAttribute("ygbh",ygbh);

				session.setAttribute("dqbm",dqbm);
				session.setAttribute("ckjgbz",ckjgbz);
				session.setAttribute("zdyhbz",zdyhbz);
				session.setAttribute("kkbbz",kkbbz);
				session.setAttribute("khdhbz",khdhbz);

				response.sendRedirect("main.html");
				return;
			}
		}
		else{//密码不正确
			sql=" update sq_yhxx set lxdlsbcs=NVL(lxdlsbcs,0)+1 ";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("密码不正确，<A HREF='/xtsq/yhxx/wjMm.jsp?yhdlm="+yhdlm+"'>找回密码</A>");
			return;
		}
	}
	else{//内部用户不存在

		sql="select gysbm,mmsyzq,yxdlsbcs,SYSDATE-mmxgsj mmxgsj,lxdlsbcs,yhkl,'G0' yhjs,gysbm dwbh,'G0' dwlx,yhmc,ssfgs,'N' ckjgbz,'N' zdyhbz";
		sql+=" from jxc_ppgysdzb ";
		sql+=" WHERE yhdlm='"+ yhdlm + "' and kdlxtbz='Y' and sfsd='N'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())//用户存在
		{
			ygbh=rs.getString("gysbm");
			mmsyzq=rs.getInt("mmsyzq");
			yxdlsbcs=rs.getInt("yxdlsbcs");
			mmxgsj=rs.getInt("mmxgsj");
			lxdlsbcs=rs.getInt("lxdlsbcs");
			getYhkl=rs.getString("yhkl").trim();
	//		out.println("<BR>getYhkl="+getYhkl);
			yhjs=rs.getString("yhjs");
			ckjgbz=rs.getString("ckjgbz");
			zdyhbz=rs.getString("zdyhbz");
			dwbh=rs.getString("dwbh");
			dwlx=rs.getString("dwlx");
			yhmc=rs.getString("yhmc");
			ssfgs=rs.getString("ssfgs");
		}
		rs.close();
		ps.close();

		sql="select dqbm ";
		sql+=" from sq_dwxx ";
		sql+=" WHERE dwbh='"+ ssfgs + "'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if (rs.next())//用户存在
		{
			dqbm=rs.getString("dqbm");
		}
		rs.close();
		ps.close();
	}

	if (dwbh!=null)//供应商存在
	{
		if (lxdlsbcs>yxdlsbcs)//锁帐号
		{
/*
			sql=" update jxc_ppgysdzb set kdlxtbz='N'";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("您已连续登陆失败了【"+lxdlsbcs+"】次，超过系统允许的【"+yxdlsbcs+"】次，帐号被锁定，请联系系统管理员");
			return;
*/
		}
	
		if (yhkl.equals("111111"))
		{
		}
		else{
			yhkl=cf.makejm(yhkl);
		}

		if (getYhkl.equals(yhkl))//密码正确
		{
/*			
			if (mmxgsj>mmsyzq)
			{
				out.println("密码使用已超过["+mmsyzq+"]天，请修改密码");
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
			}
*/			
			if (zdyhbz==null)
			{
				zdyhbz="N";
			}


			//验证密码是否正确
			if (getYhkl.equals("111111"))
			{
				session.setAttribute("yhdlm",yhdlm);
				response.sendRedirect("/xtsq/yhxx/changePass.jsp");
				return;
			}
			else{
				sql=" update jxc_ppgysdzb set lxdlsbcs=0";
				sql+=" WHERE yhdlm='"+ yhdlm + "'";
				ps= conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				session.setAttribute("zwbm","99");
				session.setAttribute("ssfgs",ssfgs);
				session.setAttribute("yhdlm",yhdlm);
				session.setAttribute("yhjs",yhjs);
				session.setAttribute("dwbh",dwbh);
				session.setAttribute("dwlx",dwlx);
				session.setAttribute("yhmc",yhmc);
				session.setAttribute("kfgssq","");
				session.setAttribute("sjsbh","");
				session.setAttribute("ygbh",ygbh);

				session.setAttribute("dqbm",dqbm);
				session.setAttribute("ckjgbz",ckjgbz);
				session.setAttribute("zdyhbz",zdyhbz);
				session.setAttribute("kkbbz","N");

				response.sendRedirect("main.html");
				return;
			
			}
		}
		else{
			sql=" update jxc_ppgysdzb set lxdlsbcs=NVL(lxdlsbcs,0)+1 ";
			sql+=" WHERE yhdlm='"+ yhdlm + "'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			out.println("用户或密码不正确");
		}
	}
	else//用户登陆名不存在
	{
		out.println("用户或密码不正确，或不可登陆");
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>


