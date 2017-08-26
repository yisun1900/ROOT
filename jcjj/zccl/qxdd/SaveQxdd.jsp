<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String ddbh=request.getParameter("ddbh");
String tdblr=cf.GB2Uni(request.getParameter("tdblr"));
String jctdyybm=cf.GB2Uni(request.getParameter("jctdyybm"));
String tdsm=cf.GB2Uni(request.getParameter("tdsm"));
double kclf=0;
java.sql.Date tdsj=null;

ls=request.getParameter("kclf");
try{
	if (!(ls.equals("")))  kclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣测量费]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("tdsj");
try{
	if (!(ls.equals("")))  tdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[退单时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String sfjs=null;
	String clzt=null;
	String ppbm=null;
	ls_sql="select clzt,sfjs,khbh,ppbm";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
	}
	rs.close();
	ps.close();

	if (!sfjs.equals("N"))
	{
		out.println("错误！已结算，不能退单");
		return;
	}

	if (clzt.equals("30"))
	{
		out.println("错误！已完结，不能退单");
		return;
	}

	String fgsbh=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	String fkkhxm=null;
	String fkfwdz=null;
	ls_sql="select fgsbh,dwbh,sjsbh,sjs,khxm,fwdz";
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
		fkkhxm=cf.fillNull(rs.getString("khxm"));
		fkfwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update jc_zczjx set clzt1=clzt,clzt='99',tdsj=?,tdblr=?";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tdsj);
	ps.setString(2,tdblr);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcdd set tdsj=?,tdblr=?,kclf=?,jctdyybm=?,tdsm=?,lsclzt=clzt,clzt='99'";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ls_sql+=" and jc_zcdd.clzt not in('00','03','05','07','19','21','23','30','98','99')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tdsj);
	ps.setString(2,tdblr);
	ps.setDouble(3,kclf);
	ps.setString(4,jctdyybm);
	ps.setString(5,tdsm);
	if (ps.executeUpdate()!=1)
	{
		ps.close();
		conn.rollback();
		out.println("<BR>退单失败！");
		return;
	}
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm ,pdgc,pdgcmc,gys,ppmc  ,zqje              ,zhje           ,cbje             ,fssj)";
	ls_sql+=" select ddbh,'4','3'           ,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm    ,'',ppbm,gys,ppmc      ,-1*(NVL(wdzje,0)+NVL(zqzjhze,0)),-1*(NVL(hkze,0)+NVL(zjhze,0)),-1*(NVL(cbze,0)+NVL(zjxcbze,0)),tdsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//处理增减项退款＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	String zjxbh="";
	ls_sql="select zjxbh";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zjxbh=rs.getString("zjxbh");

		double fkje=0;;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and zjxbh='"+zjxbh+"'";
		ls_sql+=" and scbz='N'";//N：未删除；Y：已删除
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (fkje!=0)
		{
			double bcfkje=fkje;

			//插入付款记录 
			String fkxh=null;
			int count=0;
			ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			fkxh=khbh+cf.addZero(count+1,3);

			String fklxbm="62";//62:主材预付款
			String zckx="23";//23:主材

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?,?,?,?,?) ";//1：财务收款；2：非财务代收款
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,khbh);
			ps1.setString(2,fkxh);
			ps1.setString(3,"");
			ps1.setString(4,fklxbm);
			ps1.setDouble(5,bcfkje);
			ps1.setString(6,"");
			ps1.setString(7,tdblr);
			ps1.setDate(8,tdsj);
			ps1.setString(9,lrbm);
			ps1.setString(10,tdblr);

			ps1.setDate(11,tdsj);
			ps1.setString(12,"退单自动退款");
			ps1.setString(13,"31");//31:转换
			ps1.setString(14,zckx);
			ps1.setString(15,lrbm);

			ps1.setString(16,"");
			ps1.setString(17,"");
			ps1.setString(18,sjs);
			ps1.setString(19,sjsbh);
			ps1.setString(20,dwbh);
			ps1.setString(21,fgsbh);
			ps1.setString(22,ppbm);
			ps1.setString(23,ddbh);

			ps1.setString(24,tdblr);
			ps1.setDate(25,tdsj);

			ps1.setString(26,"1");//1：财务收款；2：非财务代收款
			ps1.setString(27,"");
			ps1.setString(28,"");
			ps1.setString(29,zjxbh);
			ps1.setString(30,fkkhxm);
			ps1.setString(31,fkfwdz);
			ps1.executeUpdate();
			ps1.close();

			
			//转换付款方式，生成关联记录
			int glxh=0;//关联序号
			count=0;

			//获取关联序号
			ls_sql="select NVL(max(glxh),0)";
			ls_sql+=" from  cw_glfkjl";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				glxh=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			glxh++;


			//插入关联记录 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setInt(1,glxh);
			ps1.setString(2,fkxh);
			ps1.executeUpdate();
			ps1.close();

			ls_sql="update cw_khfkjl set glxh=?";
			ls_sql+=" where fkxh='"+fkxh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setInt(1,glxh);
			ps1.executeUpdate();
			ps1.close();

			//插入关联付款记录 
			String newfkxh=null;
			ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?,?,?) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,khbh);
			ps1.setString(2,newfkxh);
			ps1.setString(3,"");
			ps1.setString(4,zckx);
			ps1.setDouble(5,-1*bcfkje);
			ps1.setString(6,"");
			ps1.setString(7,tdblr);
			ps1.setDate(8,tdsj);
			ps1.setString(9,lrbm);
			ps1.setString(10,tdblr);

			ps1.setDate(11,tdsj);
			ps1.setString(12,"退单自动退款");
			ps1.setString(13,"31");
			ps1.setString(14,fklxbm);
			ps1.setString(15,lrbm);

			ps1.setString(16,ppbm);
			ps1.setString(17,ddbh);
			ps1.setString(18,sjs);
			ps1.setString(19,sjsbh);
			ps1.setString(20,dwbh);
			ps1.setString(21,fgsbh);
			ps1.setString(22,"");
			ps1.setString(23,"");

			ps1.setString(24,tdblr);
			ps1.setDate(25,tdsj);
			ps1.setInt(26,glxh);

			ps1.setString(27,"1");//1：财务收款；2：非财务代收款
			ps1.setString(28,"");
			ps1.setString(29,zjxbh);
			ps1.setString(30,"");
			ps1.setString(31,fkkhxm);
			ps1.setString(32,fkfwdz);
			ps1.executeUpdate();
			ps1.close();


			//插入关联记录 
			ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
			ls_sql+=" values ( ?,?) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setInt(1,glxh);
			ps1.setString(2,newfkxh);
			ps1.executeUpdate();
			ps1.close();
		}

		ls_sql="update jc_zczjx set sskje=?,shsskje=? ";
		ls_sql+=" where zjxbh='"+zjxbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,0);
		ps1.setDouble(2,0);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//处理增减项退款＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	//处理订单退款＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double fkje=0;;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and zjxbh is null";
	ls_sql+=" and scbz='N'";//N：未删除；Y：已删除
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (fkje!=0)
	{
		double bcfkje=fkje;

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

		String fklxbm="62";//62:主材预付款
		String zckx="23";//23:主材

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw   ,scbz   ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?    ,'N',?,?,?,?,?,?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,fkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm);
		ps.setDouble(5,bcfkje);
		ps.setString(6,"");
		ps.setString(7,tdblr);
		ps.setDate(8,tdsj);
		ps.setString(9,lrbm);
		ps.setString(10,tdblr);

		ps.setDate(11,tdsj);
		ps.setString(12,"退单自动退款");
		ps.setString(13,"31");//31:转换
		ps.setString(14,zckx);
		ps.setString(15,lrbm);

		ps.setString(16,"");
		ps.setString(17,"");
		ps.setString(18,sjs);
		ps.setString(19,sjsbh);
		ps.setString(20,dwbh);
		ps.setString(21,fgsbh);
		ps.setString(22,ppbm);
		ps.setString(23,ddbh);

		ps.setString(24,tdblr);
		ps.setDate(25,tdsj);

		ps.setString(26,"1");//1：财务收款；2：非财务代收款
		ps.setString(27,"");
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,fkkhxm);
		ps.setString(31,fkfwdz);
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

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw  ,scbz  ,gysbh,ddbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,zcddbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj,glxh   ,gljlbz,skdd,dsksjbz,zjxbh,zczjxbh,fkkhxm,fkfwdz) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?  ,'N'  ,?,?,?,?,?,?,?,?   ,'1','0','0',?,?,?    ,'Y',?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zckx);
		ps.setDouble(5,-1*bcfkje);
		ps.setString(6,"");
		ps.setString(7,tdblr);
		ps.setDate(8,tdsj);
		ps.setString(9,lrbm);
		ps.setString(10,tdblr);

		ps.setDate(11,tdsj);
		ps.setString(12,"退单自动退款");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,lrbm);

		ps.setString(16,ppbm);
		ps.setString(17,ddbh);
		ps.setString(18,sjs);
		ps.setString(19,sjsbh);
		ps.setString(20,dwbh);
		ps.setString(21,fgsbh);
		ps.setString(22,"");
		ps.setString(23,"");

		ps.setString(24,tdblr);
		ps.setDate(25,tdsj);
		ps.setInt(26,glxh);

		ps.setString(27,"1");//1：财务收款；2：非财务代收款
		ps.setString(28,"");
		ps.setString(29,"");
		ps.setString(30,"");
		ps.setString(31,fkkhxm);
		ps.setString(32,fkfwdz);
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

	ls_sql="update jc_zcdd set sskje=?,shsskje=? ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,0);
	ps.setDouble(2,0);
	ps.executeUpdate();
	ps.close();

	//处理订单退款＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("退单成功！");
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
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>