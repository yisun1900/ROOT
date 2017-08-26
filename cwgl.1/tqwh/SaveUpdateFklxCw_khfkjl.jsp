<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] fkxh=request.getParameterValues("fkxh");

String fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
	for (int i=0;i<fkxh.length ;i++ )
	{
		String khbh=null;
		String getfkkhxm=null;
		String getzffs=null;
		double fkje=0;
		ls_sql="select khbh,fkkhxm,zffs,fkje";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ls_sql+=" and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString("khbh").trim();
			getfkkhxm=rs.getString("fkkhxm");
			getzffs=rs.getString("zffs");
			fkje=rs.getDouble("fkje");
		}

		if (getzffs.equals("31"))
		{
			conn.rollback();
			out.println("错误！["+fkxh[i]+"]支付方式不能是：转换款项");
			return;
		}

			
		rs.close();
		ps.close();

		if (!getfkkhxm.equals(fklxbm))
		{
			//插入新记录
			String newfkxh=null;
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

			newfkxh=khbh+cf.addZero(count+1,3);

			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx  ,lrdw,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,zcgysbh,zcddbh,czlx,zrkdcpz,zckdcpz,scbz,sjr,sjsj    ,gljlbz,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
			ls_sql+=" select                khbh,?   ,sjbh,?     ,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,''    ,lrdw,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,zcgysbh,zcddbh,czlx,zrkdcpz,zckdcpz,scbz,sjr,sjsj    ,'N'   ,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where fkxh='"+fkxh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,newfkxh);
			ps.setString(2,fklxbm);
			ps.executeUpdate();
			ps.close();

			
			int glxh=0;//关联序号

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
			ps.setString(2,fkxh[i]);
			ps.executeUpdate();
			ps.close();

			ls_sql="update cw_khfkjl set zffs=?,zckx=?,glxh=? ";
			ls_sql+=" where fkxh='"+fkxh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,"31");//31:转换款项
			ps.setString(2,fklxbm);
			ps.setInt(3,glxh);
			ps.executeUpdate();
			ps.close();

				
			//插入关联付款记录 
			count=0;
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

			
			//插入转款记录
			ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje   ,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx  ,zcgysbh,zcddbh,lrdw,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,czlx,zrkdcpz,zckdcpz,scbz,sjr,sjsj    ,gljlbz,glxh,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ) ";
			ls_sql+=" select                khbh,?   ,sjbh,?     ,-1*fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,'31',fklxbm,gysbh  ,ddbh  ,lrdw,sjs,sjsbh,dwbh,fgsbh,sjfkzc   ,czlx,zrkdcpz,zckdcpz,scbz,sjr,sjsj    ,'Y'   ,?   ,skdd,dsksjbz,fkkhxm,fkfwdz,zzyhkh ";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where fkxh='"+fkxh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,newfkxh);
			ps.setString(2,fklxbm);
			ps.setInt(3,glxh);
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
	out.print("<BR>SQL=" +ls_sql);
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