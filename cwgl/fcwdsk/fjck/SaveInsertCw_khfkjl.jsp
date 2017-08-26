<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String fkxh=null;
String sjbh=null;
String jsjlh=null;
String fklxbm=null;
double fkje=0;
String jkr=null;
String skr=null;
java.sql.Date sksj=null;
String skdw=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
fkxh=cf.GB2Uni(request.getParameter("fkxh"));
sjbh=cf.GB2Uni(request.getParameter("sjbh"));
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收款金额]类型转换发生意外:"+e);
	return;
}
jkr=cf.GB2Uni(request.getParameter("jkr"));
skr=cf.GB2Uni(request.getParameter("skr"));
ls=request.getParameter("sksj");
try{
	if (!(ls.equals("")))  sksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sksj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收款时间]类型转换发生意外:"+e);
	return;
}
skdw=cf.GB2Uni(request.getParameter("skdw"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String zffs=request.getParameter("zffs");
String zckx=request.getParameter("zckx");
String lrdw=request.getParameter("lrdw");
String gysbh=cf.GB2Uni(request.getParameter("gysbh"));

String sjs=cf.GB2Uni(request.getParameter("sjs"));
String sjsbh=request.getParameter("sjsbh");
String dwbh=request.getParameter("dwbh");
String fgsbh=request.getParameter("fgsbh");
String zcgysbh=cf.GB2Uni(request.getParameter("zcgysbh"));
String zzyhkh=cf.GB2Uni(request.getParameter("zzyhkh"));
String fkkhxm=cf.GB2Uni(request.getParameter("fkkhxm"));
String fkfwdz=cf.GB2Uni(request.getParameter("fkfwdz"));

String skdd="2";//是否需审核  1：不需审核；2：需审核
String dsksjbz="N";//审核标志  N: 未审核；Y: 已审核
String sjr=null;
java.sql.Date sjsj=null;

/*
财务收款
String skdd="1";//是否需审核  1：不需审核；2：需审核
String dsksjbz="";//审核标志  N: 未审核；Y: 已审核
String sjr=skr;
java.sql.Date sjsj=sksj;
*/

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//检查客户结算＋＋＋＋＋＋＋＋＋＋＋＋开始
	String getkhjsbz="";
	ls_sql=" select khjsbz ";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhjsbz=cf.fillNull(rs.getString("khjsbz"));
	}
	rs.close();
	ps.close();

	if (getkhjsbz.equals("Y") || getkhjsbz.equals("2") )//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	{
		out.println("<font color=\"#FF0000\">错误！客户已结算</font>:"+getkhjsbz);
		return;
	}
	//检查客户结算＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	String zcddbh="";
	String zczjxbh="";
	int pos=zcgysbh.indexOf("*");
	if (pos!=-1)
	{
		zcddbh=zcgysbh.substring(pos+1);
		zcgysbh=zcgysbh.substring(0,pos);
	}
	pos=zcddbh.indexOf("*");
	if (pos!=-1)
	{
		zczjxbh=zcddbh.substring(pos+1);
		zcddbh=zcddbh.substring(0,pos);
	}

	String ddbh="";
	String zjxbh="";
	pos=gysbh.indexOf("*");
	if (pos!=-1)
	{
		ddbh=gysbh.substring(pos+1);
		gysbh=gysbh.substring(0,pos);
	}
	pos=ddbh.indexOf("*");
	if (pos!=-1)
	{
		zjxbh=ddbh.substring(pos+1);
		ddbh=ddbh.substring(0,pos);
	}

	//判断转出款是否充足
	if (zffs.equals("31"))//31：转出
	{
		if (zckx.equals("23"))//21:木门；22:橱柜；23:主材；24：家具
		{
			String zcmmbz="";//主材收款检查
			ls_sql=" select zcmmbz ";
			ls_sql+=" from sq_dwxx";
			ls_sql+=" where dwbh='"+fgsbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
			}
			rs.close();
			ps.close();

			if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
			{
				if (zczjxbh.equals(""))
				{
					double yfk=0;
					ls_sql="select sum(fkje)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and ddbh='"+zcddbh+"' and zjxbh is null and scbz='N'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						yfk=rs.getDouble(1);//已收转出款
					}
					rs.close();
					ps.close();

					double ddje=0;
					ls_sql="select sum(hkze)";
					ls_sql+=" from  jc_zcdd";
					ls_sql+=" where ddbh='"+zcddbh+"'";
					ls_sql+=" and clzt not in('98','99')";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						ddje=rs.getDouble(1);//订单金额
					}
					rs.close();
					ps.close();

					if (fkje>(yfk-ddje))
					{
						out.print("错误！转出款不足，可转金额："+(yfk-ddje)+"，订单["+zcddbh+"]已付款："+yfk+"，订单金额："+ddje);
						return;
					}

				}
				else{
					double yfk=0;
					ls_sql="select sum(fkje)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and ddbh='"+zcddbh+"' and zjxbh='"+zczjxbh+"' and scbz='N'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						yfk=rs.getDouble(1);//已收转出款
					}
					rs.close();
					ps.close();

					double ddje=0;
					ls_sql="select sum(zjxze)";
					ls_sql+=" from  jc_zczjx";
					ls_sql+=" where zjxbh='"+zczjxbh+"'";
					ls_sql+=" and clzt not in('00','99')";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						ddje=rs.getDouble(1);//订单金额
					}
					rs.close();
					ps.close();

					if (fkje>(yfk-ddje))
					{
						out.print("错误！转出款不足，可转金额："+(yfk-ddje)+"，增减项["+zczjxbh+"]已付款："+yfk+"，订单金额："+ddje);
						return;
					}
				}
			}
			else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
			{
				double yfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and gysbh='"+zcgysbh+"' and scbz='N'";
		//		out.println(ls_sql);
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					yfk=rs.getDouble(1);//已收转出款
				}
				rs.close();
				ps.close();

				double ddje=0;
				ls_sql="select sum(hkze+zjhze)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and ppbm='"+zcgysbh+"'";
				ls_sql+=" and clzt not in('98','99')";
				ls_sql+=" and (hkze!=0 OR hkze!=0)";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ddje=rs.getDouble(1);//订单金额
				}
				rs.close();
				ps.close();

				if (fkje>(yfk-ddje))
				{
					out.print("错误！转出款不足，可转金额："+cf.round(yfk-ddje,2)+"，品牌["+zcgysbh+"]已付款："+yfk+"，品牌订货金额："+ddje);
					return;
				}
			}
			else if (zcmmbz.equals("M"))//Y：取订单；N：取数据字典；M：可空
			{
				double yfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and scbz='N'";
		//		out.println(ls_sql);
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					yfk=rs.getDouble(1);//已收转出款
				}
				rs.close();
				ps.close();

				double ddje=0;
				ls_sql="select sum(hkze+zjhze)";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and clzt not in('98','99')";
				ls_sql+=" and (hkze!=0 OR hkze!=0)";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ddje=rs.getDouble(1);//订单金额
				}
				rs.close();
				ps.close();

				if (fkje>(yfk-ddje))
				{
					out.print("错误！转出款不足，可转金额："+cf.round(yfk-ddje,2)+"，主材已付款："+yfk+"，主材付款金额："+ddje);
					return;
				}
			}
			
		}
		//转其他款
		else 
		{
			double yfk=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				yfk=rs.getDouble(1);//已收转出款
			}
			rs.close();
			ps.close();

			if (fkje>yfk)
			{
				out.print("错误！转出款不足，[转出款]可用金额："+yfk);
				return;
			}
		}
	}

	conn.setAutoCommit(false);

	ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,zjxbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh,zczjxbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
	ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?,?,?                                            ,'1','0','0',?,?                  ,'N',?,?,?,?,?) ";//1：财务收款；2：非财务代收款
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,fkxh);
	ps.setString(3,sjbh);
	ps.setString(4,fklxbm);
	ps.setDouble(5,fkje);
	ps.setString(6,jkr);
	ps.setString(7,skr);
	ps.setDate(8,sksj);
	ps.setString(9,skdw);
	ps.setString(10,lrr);

	ps.setDate(11,lrsj);
	ps.setString(12,bz);
	ps.setString(13,zffs);
	ps.setString(14,zckx);
	ps.setString(15,lrdw);

	ps.setString(16,gysbh);
	ps.setString(17,ddbh);
	ps.setString(18,zjxbh);
	ps.setString(19,sjs);
	ps.setString(20,sjsbh);
	ps.setString(21,dwbh);
	ps.setString(22,fgsbh);
	ps.setString(23,zcgysbh);
	ps.setString(24,zcddbh);
	ps.setString(25,zczjxbh);

	ps.setString(26,sjr);
	ps.setDate(27,sjsj);

	ps.setString(28,skdd);
	ps.setString(29,dsksjbz);
	ps.setString(30,fkkhxm);
	ps.setString(31,fkfwdz);
	ps.setString(32,zzyhkh);
	ps.executeUpdate();
	ps.close();


	if (!zjxbh.equals(""))
	{
		double sskje=0;//实收款金额
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and zjxbh='"+zjxbh+"'";
		ls_sql+=" and fklxbm='23'";//23:主材
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sskje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (fkje<0 && sskje<0)
		{
			out.println("提醒！该订单累计付款总额为负数:"+sskje);
		}


		ls_sql="update jc_zczjx set sskje=? ";
		ls_sql+=" where zjxbh='"+zjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}
	else if (!ddbh.equals(""))
	{
		double sskje=0;//实收款金额
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and ddbh='"+ddbh+"'";
		ls_sql+=" and zjxbh is null";
		ls_sql+=" and fklxbm='23'";//23:主材
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sskje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		String getddlx="";
		ls_sql="select ddlx";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getddlx=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (!getddlx.equals("E") && !getddlx.equals("5"))
		{
			if (fkje<0 && sskje<0)
			{
				out.println("提醒！该订单累计付款总额为负数:"+sskje);
			}
		}


		ls_sql="update jc_zcdd set sskje=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}


	//转换付款方式，生成关联记录
	int glxh=0;//关联序号
	int count=0;

	if (zffs.equals("31") )//转帐款项，生成关联记录
	{
		//获取关联序号
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,fkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		
		//插入关联付款记录 
		String newfkxh=null;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//增加glxh
		//增加gljlbz
		//增加gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=gysbh
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,zjxbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh,zczjxbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh) ";
		ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?               ,'N'   ,?,?,?,?,?,?,?,?,?,?                                            ,'1','0','0',?,?,?                    ,'Y',?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,sjbh);
		ps.setString(4,zckx);
		ps.setDouble(5,-1*fkje);
		ps.setString(6,jkr);
		ps.setString(7,skr);
		ps.setDate(8,sksj);
		ps.setString(9,skdw);
		ps.setString(10,lrr);

		ps.setDate(11,lrsj);
		ps.setString(12,bz);
		ps.setString(13,zffs);
		ps.setString(14,fklxbm);
		ps.setString(15,lrdw);

		ps.setString(16,zcgysbh);
		ps.setString(17,zcddbh);
		ps.setString(18,zczjxbh);
		ps.setString(19,sjs);
		ps.setString(20,sjsbh);
		ps.setString(21,dwbh);
		ps.setString(22,fgsbh);
		ps.setString(23,gysbh);
		ps.setString(24,ddbh);
		ps.setString(25,zjxbh);

		ps.setString(26,sjr);
		ps.setDate(27,sjsj);
		ps.setInt(28,glxh);

		ps.setString(29,skdd);
		ps.setString(30,dsksjbz);
		ps.setString(31,fkkhxm);
		ps.setString(32,fkfwdz);
		ps.setString(33,zzyhkh);
		ps.executeUpdate();
		ps.close();

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();
	}


	if (zffs.equals("31"))//转帐款项
	{
		if ( zckx.equals("11"))//11：家装款
		{
			//家装款更新+++++++++++++++++++++++++++++++++++++++
			double getsfke=0;//
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getsfke=rs.getDouble(1);//已收工程款
			}
			rs.close();
			ps.close();

			//取财务收款情况
			double getcwsfke=0;//

			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
			ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getcwsfke=rs.getDouble(1);//已收工程款
			}
			rs.close();
			ps.close();

			double getzjxssk=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxssk=rs.getDouble(1);//增减项实收款
			}
			rs.close();
			ps.close();

			//更新：工程款实收款率、工程款实收款额
			ls_sql="update crm_khxx set sfke=?,cwsfke=?,zjxssk=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,getsfke);
			ps.setDouble(2,getcwsfke);
			ps.setDouble(3,getzjxssk);
			ps.executeUpdate();
			ps.close();

			//家装款更新--------------------------------------------
		}
		else if (zckx.equals("52"))//52：量房订金
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jlfdjsj=null;
			String lfdjbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//量房订金
				maxsfke=rs.getDouble(2);//最大量房订金
				jlfdjsj=rs.getDate(3);//交量房订金时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					lfdjbz="T";
				}
				else{
					lfdjbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,lfdjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jlfdjsj);
			ps.executeUpdate();
			ps.close();
		}
		else if (zckx.equals("51"))//51：促销活动订金
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jhddjsj=null;
			String hddjbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//活动订金
				maxsfke=rs.getDouble(2);//最大活动订金
				jhddjsj=rs.getDate(3);//交活动订金时间
			}
			rs.close();
			ps.close();

			if (sfke>0)
			{
				hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
			}
			else 
			{
				if (maxsfke>0)
				{
					hddjbz="T";
				}
				else{
					hddjbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//设计费是否可转出
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hddjbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jhddjsj);
			ps.executeUpdate();
			ps.close();
		}
		else if (zckx.equals("53"))//53：设计费
		{
			double sfke=0;
			double maxsfke=0;
			java.sql.Date jsjfsj=null;
			String sjfbz="N";
			ls_sql="select sum(fkje),max(fkje),min(sksj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfke=rs.getDouble(1);//设计费
				maxsfke=rs.getDouble(2);//最大设计费
				jsjfsj=rs.getDate(3);//交设计费时间
			}
			rs.close();
			ps.close();


			if (sfke>0)
			{
				sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
			}
			else 
			{
				if (maxsfke>0)
				{
					sjfbz="T";
				}
				else{
					sjfbz="N";
				}
			}

			ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjfbz);
			ps.setDouble(2,sfke);
			ps.setDate(3,jsjfsj);
			ps.executeUpdate();
			ps.close();

		}
		else if (zckx.equals("23"))//23:主材
		{
			if (!zczjxbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and zjxbh='"+zczjxbh+"'";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (fkje<0 && sskje<0)
				{
					out.println("提醒！该订单累计付款总额为负数:"+sskje);
				}

				ls_sql="update jc_zczjx set sskje=?";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.executeUpdate();
				ps.close();
			}
			else if (!zcddbh.equals(""))
			{
				double sskje=0;//实收款金额
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
				ls_sql+=" and ddbh='"+zcddbh+"'";
				ls_sql+=" and zjxbh is null";
				ls_sql+=" and fklxbm='23'";//23:主材
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					sskje=rs.getDouble(1);
				}
				rs.close();
				ps.close();

				if (fkje<0 && sskje<0)
				{
					out.println("提醒！该订单累计付款总额为负数:"+sskje);
				}

				ls_sql="update jc_zcdd set sskje=? ";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDouble(1,sskje);
				ps.executeUpdate();
				ps.close();

			}
		}
	}
	
	double getkhfkze=0;
	java.sql.Date minkhsksj=null;
	java.sql.Date maxkhsksj=null;
	ls_sql="select sum(fkje),min(sksj),max(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getkhfkze=rs.getDouble(1);
		minkhsksj=rs.getDate(2);
		maxkhsksj=rs.getDate(3);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_zxkhxx set scfksj=?,zjfksj=?,fkze=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,minkhsksj);
	ps.setDate(2,maxkhsksj);
	ps.setDouble(3,getkhfkze);
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
	out.print("存盘失败,发生意外: " + e);
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