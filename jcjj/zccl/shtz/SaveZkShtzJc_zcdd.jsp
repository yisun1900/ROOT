<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String ddbh=request.getParameter("ddbh");
String tzshr=cf.GB2Uni(request.getParameter("tzshr"));

java.sql.Date tzshsj=null;
ls=request.getParameter("tzshsj");
try{
	if (!(ls.equals("")))  tzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tzshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发送货通知时间]类型转换发生意外:"+e);
	return;
}

String[] zkfklxbm=request.getParameterValues("fklxbm");
double sfkje=0;
ls=request.getParameter("sfkje");
try{
	if (!(ls.equals("")))  sfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sfkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预付款转出额]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String khbh=null;
	String clzt=null;
	String ppbm=null;
	double hkze=0;
	double zjhze=0;
	ls_sql =" select khbh,clzt,ppbm,hkze,zjhze";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh").trim();
		clzt=rs.getString("clzt");
		ppbm=rs.getString("ppbm");
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("15"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}

	String fgsbh=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	ls_sql="select fgsbh,dwbh,sjsbh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();
	ps.close();

	if (zkfklxbm!=null)
	{
		//检查金额是否足够＋＋＋＋＋＋＋＋＋＋＋＋开始	
		double yfk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
		ls_sql+=" and "+cf.arrayToInSQL(zkfklxbm,"fklxbm");
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfk=rs.getDouble(1);//已收转出款
		}
		rs.close();
		ps.close();

		if (yfk<sfkje)
		{
			out.println("<BR>错误，转款不足！需转款＝"+sfkje+"；可用预付款＝"+yfk);
			return;
		}

		//检查金额是否足够----------------------结束	
	}


	if (zkfklxbm!=null)
	{
		if (zkfklxbm.length>1)
		{
			for (int ii=0;ii<zkfklxbm.length ;ii++ )
			{
				for (int jj=ii+1;jj<zkfklxbm.length ;jj++ )
				{
					if (zkfklxbm[ii].equals(zkfklxbm[jj]))
					{
						out.println("KS:"+ii+";"+jj);
						out.println("<BR>错误，转款类型重复："+zkfklxbm[ii]);
						return;
					}
				}
			}
		}
	}

	
	conn.setAutoCommit(false);

	ls_sql="update jc_zcdd set tzshr=?,tzshsj=SYSDATE,ddshbz='3',clzt='17'";
	ls_sql+=" where ddbh='"+ddbh+"' and  clzt='15' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzshr);
	ps.executeUpdate();
	ps.close();

	if (zkfklxbm!=null)
	{
		for (int i=0;i<zkfklxbm.length ;i++ )
		{
			if (sfkje<=0)
			{
				continue;
			}

		
			//本次付款金额
			double bcfkje=0;
			double kyje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
			ls_sql+=" and fklxbm='"+zkfklxbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				kyje=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if (kyje>sfkje)
			{
				bcfkje=sfkje;
			}
			else{
				bcfkje=kyje;
			}

			sfkje=sfkje-bcfkje;

			//插入付款记录 
			String fkxh=null;
			int count=0;
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

			fkxh=khbh+cf.addZero(count+1,3);

			String fklxbm="23";//23:主材

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?) ";//1：财务收款；2：非财务代收款
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,fkxh);
			ps.setString(3,"");
			ps.setString(4,fklxbm);
			ps.setDouble(5,bcfkje);
			ps.setString(6,"");
			ps.setString(7,tzshr);
			ps.setDate(8,tzshsj);
			ps.setString(9,lrbm);
			ps.setString(10,tzshr);

			ps.setDate(11,tzshsj);
			ps.setString(12,"主材送货通知自动转入");
			ps.setString(13,"31");//31:转换
			ps.setString(14,zkfklxbm[i]);
			ps.setString(15,lrbm);

			ps.setString(16,ppbm);
			ps.setString(17,ddbh);
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,"");
			ps.setString(23,"");

			ps.setString(24,tzshr);
			ps.setDate(25,tzshsj);

			ps.setString(26,"1");//1：财务收款；2：非财务代收款
			ps.setString(27,"");
			ps.executeUpdate();
			ps.close();

			
			//转换付款方式，生成关联记录
			int glxh=0;//关联序号
			count=0;

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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,newfkxh);
			ps.setString(3,"");
			ps.setString(4,zkfklxbm[i]);
			ps.setDouble(5,-1*bcfkje);
			ps.setString(6,"");
			ps.setString(7,tzshr);
			ps.setDate(8,tzshsj);
			ps.setString(9,lrbm);
			ps.setString(10,tzshr);

			ps.setDate(11,tzshsj);
			ps.setString(12,"主材送货通知自动转入");
			ps.setString(13,"31");
			ps.setString(14,fklxbm);
			ps.setString(15,lrbm);

			ps.setString(16,"");
			ps.setString(17,"");
			ps.setString(18,sjs);
			ps.setString(19,sjsbh);
			ps.setString(20,dwbh);
			ps.setString(21,fgsbh);
			ps.setString(22,ppbm);
			ps.setString(23,ddbh);

			ps.setString(24,tzshr);
			ps.setDate(25,tzshsj);
			ps.setInt(26,glxh);

			ps.setString(27,"1");//1：财务收款；2：非财务代收款
			ps.setString(28,"");
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

		//检查付款不能超出增减项金额
		double fkjeall=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//23:主材
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fkjeall=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (fkjeall>(hkze+zjhze))
		{
			conn.rollback();
			out.println("<BR>错误，付款金额["+fkjeall+"]不能超过订单金额["+(hkze+zjhze)+"]");
			return;
		}
	}

	//累计付款＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
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
//			conn.rollback();
//			out.println("错误！该订单累计付款总额不能为负数:"+sskje);
//			return;
		}
	}


	double shsskje=0;//财务审核实收款金额
	ls_sql="select sum(fkje)";
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
			yjjzsj=tzshsj;

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
	//累计付款＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		
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
