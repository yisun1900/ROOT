<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String[] clbm=request.getParameterValues("clbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	String fgsbh=null;
	String qddm=null;
	String jzsjs=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,qddm,jzsjs,ppbm,gys,ppmc";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		qddm=rs.getString("qddm");
		jzsjs=rs.getString("jzsjs");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	String dqbm=null;
	ls_sql =" select dqbm ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_zcddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	xh++;

	conn.setAutoCommit(false);

	int count=0;
	for (int i=0;i<clbm.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zczjxmx,jc_zcddmx";
		ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh and zcbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("<BR>提醒！该种主材【"+clbm[i]+"】已被选择");
		}

		String sfycx=null;
		String cxkssj=null;
		String cxjzsj=null;
		String sfyh=null;
		double cxhdbl=0;
		double lscxhdbl=0;
		String cxhdbz="N";//Y：参加；N：不参加
		String getppmc=null;
		String getgysmc=null;
		String getscsmc=null;
		ls_sql="select sfycx,cxkssj,cxjzsj,sfyh,cxhdbl,lscxhdbl,ppmc,gysmc,scsmc";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		ls_sql+=" and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfycx=cf.fillNull(rs.getString("sfycx"));
			cxkssj=cf.fillNull(rs.getDate("cxkssj"));
			cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
			sfyh=cf.fillNull(rs.getString("sfyh"));
			cxhdbl=rs.getDouble("cxhdbl");
			lscxhdbl=rs.getDouble("lscxhdbl");
			getppmc=cf.fillNull(rs.getString("ppmc"));
			getgysmc=cf.fillNull(rs.getString("gysmc"));
			getscsmc=cf.fillNull(rs.getString("scsmc"));
		}
		else{
			conn.rollback();
			out.println("错误！该种主材【"+clbm[i]+"】不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!getppmc.equals(ppbm) || !getgysmc.equals(gys) || !getscsmc.equals(ppmc))
		{
			conn.rollback();
			out.println("主材【"+clbm[i]+"】错误！[品牌、供应商、生产商]与订单不一致");
			return;
		}

		if (!sfyh.equals("Y"))
		{
			conn.rollback();
			out.println("错误！该种主材【"+clbm[i]+"】无货");
			return;
		}

		//有促销，促销开始时间<=今天，and，促销结束时间>=今天，dj选择cxj
		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
		{
			if (lscxhdbl>0)
			{
				cxhdbz="Y";
			}
			else{
				cxhdbz="N";
			}

			ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg                                                             ,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg                                                                                                                                       ,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts                                                             ,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf          ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,qddm,jzsjs,sftjcp,cksl,ckje,shsl,sfzp,zsdj    ,jsfs,zdxsj,bzyjjrbl,cxyjjrbl,yjjrbl  ,htyjjrje,zjhyjjrje   ) ";
			ls_sql+=" select ?,?,?,?,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,'2'    ,jxc_cljgb.cxj,10,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_clbm.sfbhpj,jxc_clbm.pjts ,0,0,0,0,0,0          ,0,0,0                                         ,0,0,0                   ,'2',?,?,?           ,SYSDATE,'1',?,?,?,jxc_cljgb.sftjcp,0,0,0,'N',0      ,jsfs,zdxsj,yjjrbl  ,cxyjjrbl,cxyjjrbl,0       ,0";//xzjg 1:销售限价；2:促销价
			ls_sql+=" FROM jxc_clbm,jxc_cljgb";
			ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
			ls_sql+=" and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,(xh+i));
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,clbm[i]);
			ps.setString(5,cxhdbz);
			ps.setDouble(6,lscxhdbl);
			ps.setString(7,yhmc);
			ps.setString(8,fgsbh);
			ps.setString(9,qddm);
			ps.setString(10,jzsjs);
			ps.executeUpdate();
			ps.close();
		}
		else
		{
			if (cxhdbl>0)
			{
				cxhdbz="Y";
			}
			else{
				cxhdbz="N";
			}

			//dj=销售限价
			ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg                                                             ,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg                                                                                                                                       ,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts                                                          ,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf         ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,qddm,jzsjs,sftjcp,cksl,ckje,shsl,sfzp,zsdj    ,jsfs,zdxsj,bzyjjrbl,cxyjjrbl,yjjrbl,htyjjrje,zjhyjjrje ) ";
			ls_sql+=" select ?,?,?,?,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,'1'    ,jxc_cljgb.xsj,10,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_clbm.sfbhpj,jxc_clbm.pjts  ,0,0,0,0,0,0,0,0,0                                        ,0,0,0                   ,'2',?,?,?           ,SYSDATE,'1',?,?,?,jxc_cljgb.sftjcp,0,0,0,'N',0                ,jsfs,zdxsj,yjjrbl  ,cxyjjrbl,yjjrbl,0       ,0";//xzjg 1:销售限价；2:促销价
			ls_sql+=" FROM jxc_clbm,jxc_cljgb";
			ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
			ls_sql+=" and jxc_clbm.clbm='"+clbm[i]+"' and jxc_cljgb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,(xh+i));
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,clbm[i]);
			ps.setString(5,cxhdbz);
			ps.setDouble(6,cxhdbl);
			ps.setString(7,yhmc);
			ps.setString(8,fgsbh);
			ps.setString(9,qddm);
			ps.setString(10,jzsjs);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql ="insert into jc_zczjxmx (ddbh,zjxbh,xh,zjsl,zqzjje,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje,lx ,sxbz,zqsxdj,dpzkl,zhsxdj,cksl,ckje,shsl,zjyjjrje) ";
		ls_sql+=" select                 ?   ,?    ,xh,0   ,0     ,0   ,0       ,0    ,0     ,0     ,'2','1' ,zqdj  ,dpzk ,dj    ,0,0,0         ,0";
		ls_sql+=" from jc_zcddmx ";
		ls_sql+=" where xh="+(xh+i);
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,zjxbh);
		ps.executeUpdate();
		ps.close();
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
	out.print("存盘失败,发生意外: " + e);
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