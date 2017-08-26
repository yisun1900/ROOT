<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
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
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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

	if (!clzt.equals("07"))
	{
		out.println("<BR>错误，不能再进行修改！合同已完成");
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
		ls_sql+=" from  jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh+"' and zcbm='"+clbm[i]+"'";
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
			conn.rollback();
			out.println("<BR>错误！该种主材【"+clbm[i]+"】已被选择");
			return;
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
			out.println("<BR>订单[品牌:"+ppbm+"]、[供应商:"+gys+"]、[生产商:"+ppmc+"]");
			out.println("<BR>价格表[品牌:"+getppmc+"]、[供应商:"+getgysmc+"]、[生产商:"+getscsmc+"]");
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
			ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg                                                             ,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg                                                                                                                                       ,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts                                                                    ,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf          ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,qddm,jzsjs,sftjcp   ,zxqdl,xsxh,sfzp,zsdj,cksl,ckje) ";
			ls_sql+=" select ?,?,?,?,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,'2'    ,jxc_cljgb.cxj,10,jxc_cljgb.cxj,jxc_cljgb.cxcbj,NVL(jxc_cljgb.cxjsbl,0),jxc_clbm.sfbhpj,jxc_clbm.pjts ,0,0,0,0,0,0,0,0,0                                         ,0,0,0                   ,'1',?,?,?           ,SYSDATE,'1',?,?,?,jxc_cljgb.sftjcp  ,jxc_cljgb.zxqdl,jxc_clbm.nbbm,'N',0,0,0 ";//xzjg 1:销售限价；2:促销价
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
		else//无促销
		{
			if (cxhdbl>0)
			{
				cxhdbz="Y";
			}
			else{
				cxhdbz="N";
			}

			//dj=销售限价
			ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg                                                             ,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg                                                                                                                                       ,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts                                                          ,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf         ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,qddm,jzsjs,sftjcp   ,zxqdl,xsxh,sfzp,zsdj,cksl,ckje  ) ";
			ls_sql+=" select ?,?,?,?,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,'1'    ,jxc_cljgb.xsj,10,jxc_cljgb.xsj,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_clbm.sfbhpj,jxc_clbm.pjts  ,0,0,0,0,0,0,0,0,0                                        ,0,0,0                   ,'1',?,?,?           ,SYSDATE,'1',?,?,?,jxc_cljgb.sftjcp  ,jxc_cljgb.zxqdl,jxc_clbm.nbbm,'N',0,0,0 ";//xzjg 1:销售限价；2:促销价
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