<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String[] zcbm=request.getParameterValues("zcbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	String fgsbh=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,ppbm,gys,ppmc";
	ls_sql+=" from jc_zcysd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！已完成");
		return;
	}

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_zcysdmx";
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
	for (int i=0;i<zcbm.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zcysdmx";
		ls_sql+=" where ddbh='"+ddbh+"' and zcbm='"+zcbm[i]+"'";
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
			out.println("<BR>错误！该种主材【"+zcbm[i]+"】已被选择");
			return;
		}

		String sfycx=null;
		String cxkssj=null;
		String cxjzsj=null;
		String sfyh=null;
		double cxhdbl=0;
		double lscxhdbl=0;
		String cxhdbz="N";//Y：参加；N：不参加
		String getppbm=null;
		String getgys=null;
		String getppmc=null;
		ls_sql="select sfycx,cxkssj,cxjzsj,sfyh,cxhdbl,lscxhdbl,dwbh,gys,ppmc";
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where zcbm='"+zcbm[i]+"'";
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
			getppbm=cf.fillNull(rs.getString("dwbh"));
			getgys=cf.fillNull(rs.getString("gys"));
			getppmc=cf.fillNull(rs.getString("ppmc"));
		}
		else{
			conn.rollback();
			out.println("错误！该种主材【"+zcbm[i]+"】不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!getppbm.equals(ppbm) || !getgys.equals(gys) || !getppmc.equals(ppmc))
		{
			conn.rollback();
			out.println("主材【"+zcbm[i]+"】错误！[品牌供应商、供应商、品牌]与订单不一致");
			return;
		}


		if (!sfyh.equals("Y"))
		{
			conn.rollback();
			out.println("错误！该种主材【"+zcbm[i]+"】无货");
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

			ls_sql ="insert into jc_zcysdmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg  ,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts  ,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf   ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,sftjcp   ) ";
			ls_sql+=" select ?,?,?,?,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg                                ,zcysbm,jldwbm,lsj,yhj,cbj,jsbl,cxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,'2'         ,cxj,10,cxj,cxcbj,cxjsbl,sfbhpj,pjts,0,0,0,0,0,0,0,0,0                                  ,0,0,0                   ,'1',?,?,?           ,SYSDATE,'1',?,sftjcp   ";//xzjg 1:销售限价；2:促销价
			ls_sql+=" from  jc_zcjgb";
			ls_sql+=" where zcbm='"+zcbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,(xh+i));
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,zcbm[i]);
			ps.setString(5,cxhdbz);
			ps.setDouble(6,lscxhdbl);
			ps.setString(7,yhmc);
			ps.setString(8,fgsbh);
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
			ls_sql ="insert into jc_zcysdmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg   ,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg   ,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf   ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,sftjcp     ) ";
			ls_sql+=" select ?,?,?,?,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg                                 ,zcysbm,jldwbm,lsj,yhj,cbj,jsbl,cxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,'1'          ,yhj,10,yhj,cbj,jsbl,sfbhpj,pjts  ,0,0,0,0,0,0,0,0,0                                  ,0,0,0                   ,'1',?,?,?           ,SYSDATE,'1',?,sftjcp    ";
			ls_sql+=" from  jc_zcjgb";
			ls_sql+=" where zcbm='"+zcbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,(xh+i));
			ps.setString(2,ddbh);
			ps.setString(3,khbh);
			ps.setString(4,zcbm[i]);
			ps.setString(5,cxhdbz);
			ps.setDouble(6,cxhdbl);
			ps.setString(7,yhmc);
			ps.setString(8,fgsbh);
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