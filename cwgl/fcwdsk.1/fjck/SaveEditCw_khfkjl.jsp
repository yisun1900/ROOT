<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sjbh=null;
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
sjbh=cf.GB2Uni(request.getParameter("sjbh"));
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
String zckx=request.getParameter("zckx");
String lrdw=request.getParameter("lrdw");
String gysbh=cf.GB2Uni(request.getParameter("gysbh"));
String zcgysbh=cf.GB2Uni(request.getParameter("zcgysbh"));
String zzyhkh=cf.GB2Uni(request.getParameter("zzyhkh"));

String zffs=request.getParameter("zffs");
String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double bqyfkze=0;
double bqljyfkze=0;
double bqyfkbl=0;
String fkbz=null;

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

	String fkkhxm=null;
	String fkfwdz=null;
	String scbz=null;
	String czlx=null;
	String glxh=null;
	String sjs=null;
	String sjsbh=null;
	String dwbh=null;
	String fgsbh=null;
	String yjjzsj=null;
	String getdsksjbz="";

	String oldgysbh=null;
	String oldddbh=null;
	String oldzjxbh=null;
	String oldzcgysbh=null;
	String oldzcddbh=null;
	String oldzczjxbh=null;

	ls_sql="select fkkhxm,fkfwdz,scbz,czlx,glxh,sjs,sjsbh,dwbh,fgsbh,yjjzsj,dsksjbz,gysbh,ddbh,zjxbh,zcgysbh,zcddbh,zczjxbh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fkkhxm=rs.getString("fkkhxm");
		fkfwdz=rs.getString("fkfwdz");

		scbz=rs.getString("scbz");
		czlx=rs.getString("czlx");
		glxh=rs.getString("glxh");
		sjs=rs.getString("sjs");
		sjsbh=rs.getString("sjsbh");
		dwbh=rs.getString("dwbh");
		fgsbh=rs.getString("fgsbh");
		yjjzsj=cf.fillNull(rs.getString("yjjzsj"));
		getdsksjbz=cf.fillNull(rs.getString("dsksjbz"));

		oldgysbh=cf.fillNull(rs.getString("gysbh"));
		oldddbh=cf.fillNull(rs.getString("ddbh"));
		oldzjxbh=cf.fillNull(rs.getString("zjxbh"));
		oldzcgysbh=cf.fillNull(rs.getString("zcgysbh"));
		oldzcddbh=cf.fillNull(rs.getString("zcddbh"));
		oldzczjxbh=cf.fillNull(rs.getString("zczjxbh"));
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！不存在的收款序号："+fkxh);
		return;
	}
	rs.close();
	ps.close();

	if (getdsksjbz.equals("Y"))//N: 未审核；Y: 审核通过；M:审核未通过
	{
		out.println("错误！已审核通过，不能再修改");
		return;
	}

	if (!yjjzsj.equals(""))
	{
//		out.println("收款记录已结转，不能再修改，结转时间："+yjjzsj);
//		return;
	}

	if (scbz.equals("Y"))
	{
		out.println("错误！收款序号["+fkxh+"]已被删除");
		return;
	}
	if (!czlx.equals("1"))//1：录入；2：导出；3：导入
	{
		out.println("错误！收款序号["+fkxh+"]凭证已导出，不能修改");
		return;
	}

	//判断转出款是否充足
	if (zffs.equals("31"))//31：转出
	{
		//转集成款
		if (zckx.equals("23"))//23:主材
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
					ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
					ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
				ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
					out.print("错误！转出款不足，可转金额："+(yfk-ddje)+"，品牌["+zcgysbh+"]已付款："+yfk+"，品牌订货金额："+ddje);
					return;
				}
			}
			else if (zcmmbz.equals("M"))//Y：取订单；N：取数据字典；M：可空
			{
				double yfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and scbz='N'";
				ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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
					out.print("错误！转出款不足，可转金额："+(yfk-ddje)+"，主材已付款："+yfk+"，主材付款金额："+ddje);
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
			ls_sql+=" and fkxh not in(select fkxh from cw_glfkjl where glxh="+glxh+")";
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

	ls_sql="update cw_khfkjl set sjbh=?,fklxbm=?,fkje=?,jkr=?,skr=?,sksj=?,skdw=?,bz=?,zffs=?,zckx=?,gysbh=?,ddbh=?,zjxbh=?,zcgysbh=?,zcddbh=?,zczjxbh=?,dsksjbz=?,sjr=?,sjsj=?,shsj=null,shyj=null,zzyhkh=?";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjbh);
	ps.setString(2,fklxbm);
	ps.setDouble(3,fkje);
	ps.setString(4,jkr);
	ps.setString(5,skr);
	ps.setDate(6,sksj);
	ps.setString(7,skdw);
	ps.setString(8,bz);
	ps.setString(9,zffs);
	ps.setString(10,zckx);
	ps.setString(11,gysbh);
	ps.setString(12,ddbh);
	ps.setString(13,zjxbh);
	ps.setString(14,zcgysbh);
	ps.setString(15,zcddbh);
	ps.setString(16,zczjxbh);
	ps.setString(17,dsksjbz);
	ps.setString(18,sjr);
	ps.setDate(19,sjsj);
	ps.setString(20,zzyhkh);
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

		if (sskje<0)
		{
			conn.rollback();
			out.println("错误！该订单累计付款总额不能为负数:"+sskje);
			return;
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
			if (sskje<0)
			{
				conn.rollback();
				out.println("错误！该订单累计付款总额不能为负数:"+sskje);
				return;
			}

		}


		ls_sql="update jc_zcdd set sskje=? ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();

	}


	//修改关联记录，原来『支付方式＝31：转出』，所以有关联记录
	if (glxh!=null)
	{
		if (zffs.equals("31") )//转帐款项，生成关联记录，『支付方式』未发生变化
		{
			ls_sql="update cw_khfkjl set sjbh=?,fklxbm=?,fkje=?,jkr=?,skr=?,sksj=?,skdw=?,bz=?,zffs=?,zckx=?   ,gysbh=?,ddbh=?,zjxbh=?,zcgysbh=?,zcddbh=?,zczjxbh=?,dsksjbz=?,sjr=?,sjsj=?,shsj=null,shyj=null,zzyhkh=?";
			ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjbh);
			ps.setString(2,zckx);
			ps.setDouble(3,-1*fkje);
			ps.setString(4,jkr);
			ps.setString(5,skr);
			ps.setDate(6,sksj);
			ps.setString(7,skdw);
			ps.setString(8,bz);
			ps.setString(9,zffs);
			ps.setString(10,fklxbm);

			ps.setString(11,zcgysbh);
			ps.setString(12,zcddbh);
			ps.setString(13,zczjxbh);
			ps.setString(14,gysbh);
			ps.setString(15,ddbh);
			ps.setString(16,zjxbh);
			ps.setString(17,dsksjbz);
			ps.setString(18,sjr);
			ps.setDate(19,sjsj);
			ps.setString(20,zzyhkh);
			ps.executeUpdate();
			ps.close();
		}
		else{//『支付方式』发生变化，由转款-->非转款
			ls_sql="update cw_khfkjl set glxh=null";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="delete from cw_khfkjl ";
			ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		
			ls_sql="delete from cw_glfkjl ";
			ls_sql+=" where glxh="+glxh;
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
	}
	else{//原来『支付方式＝非转出』，所以无关联记录
		//转换付款方式，生成关联记录
		int newglxh=0;//关联序号
		int count=0;
		
		//由非转款-->转款
		if (zffs.equals("31") )//转帐款项，生成关联记录
		{
			//获取关联序号
			ls_sql="select NVL(max(glxh),0)";
			ls_sql+=" from  cw_glfkjl";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				newglxh=rs.getInt(1);
			}
			rs.close();
			ps.close();

			newglxh++;

			//插入关联记录 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,newglxh);
			ps.setString(2,fkxh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update cw_khfkjl set glxh=?";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,newglxh);
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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,zjxbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh,zczjxbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh) ";
			ls_sql+=" values (              ?,?,?,?,?,?,?,?,?,?                                ,?,?,?,?,?                ,'N'    ,?,?,?,?,?,?,?,?,?,?                                            ,'1','0','0',?,?,?                     ,'Y',?,?,?,?,?) ";//1：财务收款；2：非财务代收款
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
			ps.setInt(28,newglxh);

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
			ps.setInt(1,newglxh);
			ps.setString(2,newfkxh);
			ps.executeUpdate();
			ps.close();
		}

	}



	//处理原订单付款＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (!oldzjxbh.equals(""))
	{
		double sskje=0;//实收款金额
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and zjxbh='"+oldzjxbh+"'";
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
			conn.rollback();
			out.println("错误！该订单累计付款总额不能为负数:"+sskje);
			return;
		}

		ls_sql="update jc_zczjx set sskje=? ";
		ls_sql+=" where zjxbh='"+oldzjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}
	else if (!oldddbh.equals(""))
	{
		double sskje=0;//实收款金额
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and ddbh='"+oldddbh+"'";
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
		ls_sql+=" where ddbh='"+oldddbh+"'";
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
			if (sskje<0)
			{
				conn.rollback();
				out.println("错误！该订单累计付款总额不能为负数:"+sskje);
				return;
			}
		}




		ls_sql="update jc_zcdd set sskje=? ";
		ls_sql+=" where ddbh='"+oldddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}

	//处理原订单付款＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//处理原订单付款＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (!oldzczjxbh.equals(""))
	{
		double sskje=0;//实收款金额
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and zjxbh='"+oldzczjxbh+"'";
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
			conn.rollback();
			out.println("错误！该订单累计付款总额不能为负数:"+sskje);
			return;
		}


		ls_sql="update jc_zczjx set sskje=? ";
		ls_sql+=" where zjxbh='"+oldzczjxbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}
	else if (!oldzcddbh.equals(""))
	{
		double sskje=0;//实收款金额
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and ddbh='"+oldzcddbh+"'";
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
			conn.rollback();
			out.println("错误！该订单累计付款总额不能为负数:"+sskje);
			return;
		}


		ls_sql="update jc_zcdd set sskje=? ";
		ls_sql+=" where ddbh='"+oldzcddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sskje);
		ps.executeUpdate();
		ps.close();
	}

	//处理原订单付款＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//付款方式可能在非转款和转款之间改变，所有情况都要重新计算
	if (true)//11：家装款
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
				conn.rollback();
				out.println("错误！该订单累计付款总额不能为负数:"+sskje);
				return;
			}

			ls_sql="update jc_zczjx set sskje=? ";
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

			if (sskje<0)
			{
				conn.rollback();
				out.println("错误！该订单累计付款总额不能为负数:"+sskje);
				return;
			}

			ls_sql="update jc_zcdd set sskje=? ";
			ls_sql+=" where ddbh='"+zcddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sskje);
			ps.executeUpdate();
			ps.close();
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
	out.print("Exception: " + e);
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