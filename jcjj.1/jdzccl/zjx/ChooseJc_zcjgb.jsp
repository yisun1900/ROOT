<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
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
	for (int i=0;i<zcbm.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zczjxmx,jc_zcddmx";
		ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh and zcbm='"+zcbm[i]+"'";
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
			out.println("错误！主材编码【"+zcbm[i]+"】已被选择");
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
		rs =ps.executeQuery(ls_sql);
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

			ls_sql ="insert into jc_zcddmx (xh,ddbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg   ,zcysbm,jldwbm,cbj,lsj,yhj,bzcbj,bzcxhdbl,sfycx,cxj,cxcbj,lscxhdbl,cxkssj,cxjzsj,xzjg   ,dj,sfbhpj,pjts,sl,je,ycf,qtfyje,zjhsl,zjhje,zjhycf   ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,khbh,fgsbh,qddm,jzsjs    ) ";
			ls_sql+=" select ?,?,?,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg                              ,zcysbm,jldwbm,cxcbj,lsj,yhj,cbj,cxhdbl,sfycx,cxj,cxcbj,lscxhdbl,cxkssj,cxjzsj,'2'       ,cxj,sfbhpj,pjts,0,0,0,0,0,0,0                         ,0,0,0                   ,'2',?,?,?,SYSDATE,'1',?,?,?,?  ";
			ls_sql+=" from  jc_zcjgb";
			ls_sql+=" where zcbm='"+zcbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,(xh+i));
			ps.setString(2,ddbh);
			ps.setString(3,zcbm[i]);
			ps.setString(4,cxhdbz);
			ps.setDouble(5,lscxhdbl);
			ps.setString(6,yhmc);
			ps.setString(7,khbh);
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

			ls_sql ="insert into jc_zcddmx (xh,ddbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg   ,zcysbm,jldwbm,cbj,lsj,yhj,bzcbj,bzcxhdbl,sfycx,cxj,cxcbj,lscxhdbl,cxkssj,cxjzsj,xzjg   ,dj,sfbhpj,pjts,sl,je,ycf,qtfyje,zjhsl,zjhje,zjhycf   ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,khbh,fgsbh,qddm,jzsjs    ) ";
			ls_sql+=" select ?,?,?,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg                              ,zcysbm,jldwbm,cbj,lsj,yhj,cbj,cxhdbl,sfycx,cxj,cxcbj,lscxhdbl,cxkssj,cxjzsj,'1'   ,yhj,sfbhpj,pjts,0,0,0,0,0,0,0   ,0,0,0,'2',?,?,?,SYSDATE,'1',?,?,?,?  ";
			ls_sql+=" from  jc_zcjgb";
			ls_sql+=" where zcbm='"+zcbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,(xh+i));
			ps.setString(2,ddbh);
			ps.setString(3,zcbm[i]);
			ps.setString(4,cxhdbz);
			ps.setDouble(5,cxhdbl);
			ps.setString(6,yhmc);
			ps.setString(7,khbh);
			ps.setString(8,fgsbh);
			ps.setString(9,qddm);
			ps.setString(10,jzsjs);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql ="insert into jc_zczjxmx (ddbh,zjxbh,xh,zjsl,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje,lx,sxbz) ";
		ls_sql+=" values( ?,?,?,0,0,0,0,0,0,'2','1')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,zjxbh);
		ps.setInt(3,(xh+i));
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