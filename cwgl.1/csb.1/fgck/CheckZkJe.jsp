<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
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
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zckx=cf.GB2Uni(request.getParameter("zckx"));
String zcgysbh=cf.GB2Uni(cf.getParameter(request,"zcgysbh"));
String fkxh=cf.GB2Uni(request.getParameter("fkxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

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

	String glxh=null;
	ls_sql="select glxh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		glxh=rs.getString("glxh");
	}
	rs.close();
	ps.close();

	//转集成款
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
			double yfk=0;
			double ddje=0;
			if (!zczjxbh.equals(""))
			{
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and fklxbm='"+zckx+"' and zjxbh='"+zczjxbh+"' and scbz='N'";
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

				if (fkje>yfk)
				{
					out.print("警告！转出款不足，转款金额："+cf.formatDouble(fkje)+"，增减项["+zczjxbh+"]已付款："+yfk);
					return;
				}

				ls_sql="select zjxze";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where zjxbh='"+zczjxbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ddje=rs.getDouble(1);//订单金额
				}
				rs.close();
				ps.close();

				if (fkje>cf.round(yfk-ddje,2))
				{
					out.print("警告！转出款不足，可转余额："+cf.round(yfk-ddje,2)+"，增减项["+zczjxbh+"]已付款："+yfk+"，增减项金额："+ddje);
					return;
				}

			}
			else{
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

				if (fkje>yfk)
				{
					out.print("警告！转出款不足，转款金额："+cf.formatDouble(fkje)+"，订单["+zcddbh+"]已付款："+yfk);
					return;
				}

				ls_sql="select hkze";
				ls_sql+=" from  jc_zcdd";
				ls_sql+=" where ddbh='"+zcddbh+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ddje=rs.getDouble(1);//订单金额
				}
				rs.close();
				ps.close();

				if (fkje>cf.round(yfk-ddje,2))
				{
					out.print("警告！转出款不足，可转余额："+cf.round(yfk-ddje,2)+"，订单["+zcddbh+"]已付款："+yfk+"，订单金额："+ddje);
					return;
				}

			}


			if (ddje>0)
			{
				yfk=0;
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

				ddje=0;
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
					out.print("警告！转出款不足，可转金额："+cf.round(yfk-ddje,2)+"，品牌["+zcgysbh+"]已付款："+yfk+"，品牌订货金额："+ddje);
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
				out.print("警告！转出款不足，可转金额："+cf.round(yfk-ddje,2)+"，品牌["+zcgysbh+"]已付款："+yfk+"，品牌订货金额："+ddje);
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
				out.print("警告！转出款不足，可转金额："+cf.round(yfk-ddje,2)+"，主材已付款："+yfk+"，主材付款金额："+ddje);
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
			out.print("警告！转出款不足，[转出款]可用金额："+yfk);
			return;
		}
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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