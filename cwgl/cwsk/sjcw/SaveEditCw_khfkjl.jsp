<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjr=null;
java.sql.Date sjsj=null;

sjr=cf.GB2Uni(request.getParameter("sjr"));
ls=request.getParameter("sjsj");
try{
	if (!(ls.equals("")))  sjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上缴时间]类型转换发生意外:"+e);
	return;
}


double fkje=0;
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
java.sql.Date shsj=null;
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
String dsksjbz=cf.GB2Uni(request.getParameter("dsksjbz"));
String shyj=cf.GB2Uni(request.getParameter("shyj"));


String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String skdd=null;
	String getdsksjbz=null;
	String scbz=null;
	String fklxbm=null;
	String glxh=null;
	String gysbh=null;
	String ddbh=null;
	String zjxbh=null;
	String zcgysbh=null;
	String zcddbh=null;
	String zczjxbh=null;

	ls_sql="select khbh,skdd,dsksjbz,scbz,fklxbm,glxh,gysbh,ddbh,zjxbh,zcgysbh,zcddbh,zczjxbh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		skdd=rs.getString("skdd");
		getdsksjbz=rs.getString("dsksjbz");
		scbz=rs.getString("scbz");
		fklxbm=rs.getString("fklxbm");
		glxh=rs.getString("glxh");
		gysbh=cf.fillNull(rs.getString("gysbh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxbh=cf.fillNull(rs.getString("zjxbh"));
		zcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		zcddbh=cf.fillNull(rs.getString("zcddbh"));
		zczjxbh=cf.fillNull(rs.getString("zczjxbh"));
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！不存在的收款序号");
		return;
	}
	rs.close();
	ps.close();

	if (scbz.equals("Y"))
	{
		out.println("错误！收款序号["+fkxh+"]已被删除");
		return;
	}

	if (skdd.equals("2"))//1：财务收款；2：非财务代收款
	{
		if (!getdsksjbz.equals("N"))//N:否；Y:是
		{
			out.println("错误！已审核");
			return;
		}
	}
	else{
		out.println("错误！是否需审核不正确");
		return;
	}
	
	conn.setAutoCommit(false);


	ls_sql="update cw_khfkjl set sjr=?,sjsj=?,fkje=?,shsj=SYSDATE,dsksjbz=?,shyj=?";
	ls_sql+=" where  (fkxh='"+fkxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjr);
	ps.setDate(2,sjsj);
	ps.setDouble(3,fkje);
	ps.setString(4,dsksjbz);
	ps.setString(5,shyj);
	ps.executeUpdate();
	ps.close();

	if (glxh!=null)
	{
		ls_sql="update cw_khfkjl set sjr=?,sjsj=?,fkje=?,shsj=SYSDATE,dsksjbz=?,shyj=?";
		ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjr);
		ps.setDate(2,sjsj);
		ps.setDouble(3,-1*fkje);
		ps.setString(4,dsksjbz);
		ps.setString(5,shyj);
		ps.executeUpdate();
		ps.close();
	}

	//财务收款，所有情况都要重新计算
	if ( true)//11：家装款
	{
		//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//增减项实收款
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//家装最近收款时间
		java.sql.Date getjzkscsj=null;//首次付家装款时间
		String getjzkfkxh=null;//家装最近收款序号
		int getjzkfkcs=0;//家装收款期数
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//已收工程款
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//取财务收款情况
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
		java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
		String getcwjzkfkxh=null;//财务家装最近收款序号
		int getcwjzkfkcs=0;//财务家装收款期数

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//已收工程款
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//家装款更新--------------------------------------------完成
	}

	if (true)//52：量房订金
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
	if (true)//51：促销活动订金
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
	if (true)//53：设计费
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

		//设置：设计费记入业绩时间＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		double sjhtje=0;
		java.sql.Date sjfjryjsj=null;
		ls_sql="select sjhtje,sjfjryjsj";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"' and qsjhtbz='Y'";//N：未签；Y：签合同
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjhtje=rs.getDouble(1);//设计合同金额
			sjfjryjsj=rs.getDate(2);//设计费记入业绩时间
		}
		rs.close();
		ps.close();

		double cwsssjf=0;
		java.sql.Date maxsjsj=null;
		ls_sql="select sum(fkje),max(sjsj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cwsssjf=rs.getDouble(1);//设计费
			maxsjsj=rs.getDate(2);
		}
		rs.close();
		ps.close();

		if (sjfjryjsj==null)
		{
			if (cwsssjf>=sjhtje)
			{
				sjfjryjsj=maxsjsj;
				ls_sql="update crm_zxkhxx set sjfjryjsj=?";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,sjfjryjsj);
				ps.executeUpdate();
				ps.close();
			}
		}
		else{
			if (cwsssjf<sjhtje)
			{
				sjfjryjsj=null;
				ls_sql="update crm_zxkhxx set sjfjryjsj=?";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setDate(1,sjfjryjsj);
				ps.executeUpdate();
				ps.close();
			}
		}
		//设置：设计费记入业绩时间＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}


	if (true)//23:主材
	{
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

			if (sskje<0)
			{
				out.println("提醒！该订单累计付款总额为负数:"+sskje);
			}

			double shsskje=0;//财务审核实收款金额
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and zjxbh='"+zjxbh+"'";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:主材
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
			ls_sql+=" where zjxbh='"+zjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double getzjxze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select zjxze,yjjzsj";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where zjxbh='"+zjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			if (yjjzsj==null)
			{
				if (shsskje>=getzjxze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				if (shsskje<getzjxze)
				{
					yjjzsj=null;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}

		
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

			if (sskje<0)
			{
				out.println("提醒！该订单累计付款总额为负数:"+sskje);
			}

			double shsskje=0;//财务审核实收款金额
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and ddbh='"+ddbh+"'";
			ls_sql+=" and zjxbh is null";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:主材
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double gethkze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select hkze,yjjzsj";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gethkze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();


			if (yjjzsj==null)
			{
				if (shsskje>=gethkze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();

				}
			}
			else{
				if (shsskje<gethkze)
				{
					yjjzsj=null;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
	}
	if (true)//23:主材
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

			if (sskje<0)
			{
				out.println("提醒！该订单累计付款总额为负数:"+sskje);
			}

			double shsskje=0;//财务审核实收款金额
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and zjxbh='"+zczjxbh+"'";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:主材
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
			ls_sql+=" where zjxbh='"+zczjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double getzjxze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select zjxze,yjjzsj";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where zjxbh='"+zczjxbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getzjxze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			if (yjjzsj==null)
			{
				if (shsskje>=getzjxze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zczjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{
				if (shsskje<getzjxze)
				{
					yjjzsj=null;

					ls_sql="update jc_zczjx set yjjzsj=?";
					ls_sql+=" where zjxbh='"+zczjxbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}

		
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

			if (sskje<0)
			{
				out.println("提醒！该订单累计付款总额为负数:"+sskje);
			}

			double shsskje=0;//财务审核实收款金额
			java.sql.Date maxsjsj=null;
			ls_sql="select sum(fkje),max(sjsj)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
			ls_sql+=" and ddbh='"+zcddbh+"'";
			ls_sql+=" and zjxbh is null";
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ls_sql+=" and fklxbm='23'";//23:主材
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				shsskje=rs.getDouble(1);
				maxsjsj=rs.getDate(2);
			}
			rs.close();
			ps.close();

			ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
			ls_sql+=" where ddbh='"+zcddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.setDouble(2,shsskje);
			ps.executeUpdate();
			ps.close();

			double gethkze=0;
			java.sql.Date yjjzsj=null;
			ls_sql="select hkze,yjjzsj";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where ddbh='"+zcddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				gethkze=rs.getDouble(1);
				yjjzsj=rs.getDate(2);
			}
			rs.close();
			ps.close();


			if (yjjzsj==null)
			{
				if (shsskje>=gethkze)
				{
					yjjzsj=maxsjsj;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+zcddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();

				}
			}
			else{
				if (shsskje<gethkze)
				{
					yjjzsj=null;

					ls_sql="update jc_zcdd set yjjzsj=?";
					ls_sql+=" where ddbh='"+zcddbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setDate(1,yjjzsj);
					ps.executeUpdate();
					ps.close();
				}
			}
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