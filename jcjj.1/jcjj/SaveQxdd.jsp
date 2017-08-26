<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=(String)session.getAttribute("dwbh");

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

	String khbh="";
	String getclzt="";
	String getsfjs="";
	ls_sql=" select clzt,sfjs,khbh ";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		getsfjs=cf.fillNull(rs.getString("sfjs"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (getclzt.equals("99"))
	{
		out.println("错误！已退单");
		return;
	}

	if (!getsfjs.equals("N") && !getsfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款；P：不需结算
	{
		out.println("错误！已结算，不能退单");
		return;
	}

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
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm ,pdgc,pdgcmc,gys,ppmc  ,zqje              ,zhje           ,cbje             ,fssj)";
	ls_sql+=" select ddbh,'4','3'           ,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm    ,'',ppbm,gys,ppmc      ,-1*(NVL(wdzje,0)+NVL(zqzjhze,0)),-1*(NVL(hkze,0)+NVL(zjhze,0)),-1*(NVL(cbze,0)+NVL(zjxcbze,0)),tdsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//付款信息转回预付款
	String getfkxh=null;
	String zffs=null;
	String zckx=null;
	ls_sql =" SELECT fkxh,zffs,zckx";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and  fklxbm='23'";//55：主材代金券;62：主材预付款;23:主材
	ls_sql+=" and  ddbh='"+ddbh+"'";
	ls_sql+=" and scbz='N'";
	ls_sql+=" and fkje>0";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		getfkxh=cf.fillNull(rs1.getString("fkxh"));
		zffs=cf.fillNull(rs1.getString("zffs"));
		zckx=cf.fillNull(rs1.getString("zckx"));


		if (zffs.equals("31") && zckx.equals("55"))//31:转换;//55：主材代金券
		{
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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,gysbh  ,ddbh  ,zffs,zckx  ,zcgysbh,zcddbh,skdd,dsksjbz,fkje,jkr,skr,sksj,skdw,lrr ,lrsj,lrdw,bz   ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ) ";
			ls_sql+=" select                khbh,?   ,sjbh,zckx  ,zcgysbh,zcddbh,zffs,fklxbm,gysbh  ,ddbh  ,?   ,?      ,fkje,jkr,?  ,?   ,?   ,?   ,?   ,?   ,?    ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where fkxh='"+getfkxh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,fkxh);
			ps.setString(2,"2");//1：财务收款；2：非财务代收款
			ps.setString(3,"N");//N: 未审核；Y: 审核通过；M:审核未通过
			ps.setString(4,tdblr);
			ps.setDate(5,tdsj);
			ps.setString(6,dwbh);
			ps.setString(7,tdblr);
			ps.setDate(8,tdsj);
			ps.setString(9,dwbh);
			ps.setString(10,"退单自动录入");
			ps.executeUpdate();
			ps.close();

			//转换付款方式，生成关联记录
			int glxh=0;//关联序号
			count=0;

			//获取关联序号
			ls_sql="select NVL(max(glxh),0)";
			ls_sql+=" from  cw_glfkjl";
			ps=conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,gysbh  ,ddbh  ,zffs,zckx  ,zcgysbh,zcddbh,skdd,dsksjbz,fkje   ,glxh,jkr,skr,sksj,skdw,lrr ,lrsj,lrdw,bz   ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ) ";
			ls_sql+=" select                khbh,?   ,sjbh,fklxbm,gysbh  ,ddbh  ,zffs,zckx  ,zcgysbh,zcddbh,?   ,?      ,-1*fkje,?   ,jkr,?  ,?   ,?   ,?   ,?   ,?   ,?    ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where fkxh='"+getfkxh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,newfkxh);
			ps.setString(2,"2");//1：财务收款；2：非财务代收款
			ps.setString(3,"N");//N: 未审核；Y: 审核通过；M:审核未通过
			ps.setInt(4,glxh);
			ps.setString(5,tdblr);
			ps.setDate(6,tdsj);
			ps.setString(7,dwbh);
			ps.setString(8,tdblr);
			ps.setDate(9,tdsj);
			ps.setString(10,dwbh);
			ps.setString(11,"退单自动录入");
			ps.executeUpdate();
			ps.close();
		}
		else{
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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,gysbh  ,ddbh  ,zffs,zckx  ,zcgysbh,zcddbh,skdd,dsksjbz,fkje,jkr,skr,sksj,skdw,lrr ,lrsj,lrdw,bz   ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ) ";
			ls_sql+=" select                khbh,?   ,sjbh,?     ,?      ,?     ,?   ,fklxbm,gysbh  ,ddbh  ,?   ,?      ,fkje,jkr,?  ,?   ,?   ,?   ,?   ,?   ,?    ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where fkxh='"+getfkxh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,fkxh);
			ps.setString(2,"62");//62：主材预付款
			ps.setString(3,"");
			ps.setString(4,"");
			ps.setString(5,"31");//31:转换;
			ps.setString(6,"2");//1：财务收款；2：非财务代收款
			ps.setString(7,"N");//N: 未审核；Y: 审核通过；M:审核未通过
			ps.setString(8,tdblr);
			ps.setDate(9,tdsj);
			ps.setString(10,dwbh);
			ps.setString(11,tdblr);
			ps.setDate(12,tdsj);
			ps.setString(13,dwbh);
			ps.setString(14,"退单自动录入");
			ps.executeUpdate();
			ps.close();

			//转换付款方式，生成关联记录
			int glxh=0;//关联序号
			count=0;

			//获取关联序号
			ls_sql="select NVL(max(glxh),0)";
			ls_sql+=" from  cw_glfkjl";
			ps=conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
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

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,gysbh  ,ddbh  ,zffs,zckx  ,zcgysbh,zcddbh,skdd,dsksjbz,fkje   ,glxh,jkr,skr,sksj,skdw,lrr ,lrsj,lrdw,bz   ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ) ";
			ls_sql+=" select                khbh,?   ,sjbh,fklxbm,gysbh  ,ddbh  ,?   ,?     ,?      ,?     ,?   ,?      ,-1*fkje,?   ,jkr,?  ,?   ,?   ,?   ,?   ,?   ,?    ,scbz   ,sjs,sjsbh,dwbh,fgsbh   ,czlx,zrkdcpz,zckdcpz,sjr,sjsj    ,gljlbz,fkkhxm,fkfwdz ";
			ls_sql+=" from cw_khfkjl ";
			ls_sql+=" where fkxh='"+getfkxh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,newfkxh);
			ps.setString(2,"31");//31:转换;
			ps.setString(3,"62");//62：主材预付款
			ps.setString(4,"");
			ps.setString(5,"");
			ps.setString(6,"2");//1：财务收款；2：非财务代收款
			ps.setString(7,"N");//N: 未审核；Y: 审核通过；M:审核未通过
			ps.setInt(8,glxh);
			ps.setString(9,tdblr);
			ps.setDate(10,tdsj);
			ps.setString(11,dwbh);
			ps.setString(12,tdblr);
			ps.setDate(13,tdsj);
			ps.setString(14,dwbh);
			ps.setString(15,"退单自动录入");
			ps.executeUpdate();
			ps.close();
		}
	}
	rs1.close();
	ps1.close();


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