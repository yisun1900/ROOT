<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
int sjmj=0;
ls=request.getParameter("sjmj");
try{
	if (!(ls.equals("")))  sjmj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际面积]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khwntcmch";
    ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";//1：温暖套餐；2：静音套餐
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！已选择");
		return;
	}

	count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khwntcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lx='"+lx+"' and zjlx!='3'";//1：原套餐；3：删除套餐；4：新增套餐
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！只能选择一个");
		return;
	}

	String zcsfxxz="";
	ls_sql="SELECT zcsfxxz";
	ls_sql+=" FROM bj_wntcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
    ls_sql+=" and bj_wntcmc.lx='"+lx+"'";//1：温暖套餐；2：静音套餐
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsfxxz=rs.getString("zcsfxxz");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


	ls_sql="insert into bj_khwntcmch ( zjxxh,khbh,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,sjmj,zjlx ) ";
	ls_sql+=" select                   ?    ,?   ,dqbm,hxbm,tcmc,bzmj,tcjg,pmzjdj,mjsfkzj,zcsfxxz,lx,?   ,'4'";//1：原套餐；3：删除套餐；4：新增套餐
	ls_sql+=" FROM bj_wntcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setInt(3,sjmj);
	ps.executeUpdate();
	ps.close();

	if (zcsfxxz.equals("1"))//1：自动选择；2：人工选择
	{
		ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
		ls_sql+=" select                  ?    ,?   ,cpmc,1   ,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,''    ,?  ,SYSDATE,? ,bz,'Y'";
		ls_sql+=" FROM bj_wntczcmx";
		ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,yhmc);
		ps.setString(4,lx);//1：温暖套餐；2：静音套餐
		ps.executeUpdate();
		ps.close();

		double tcjg=0;
		ls_sql="SELECT tcjg";
		ls_sql+=" FROM bj_khwntcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcjg=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double tcmxj=0;
		ls_sql="SELECT sum(ROUND(tcdj*sl,2))";
		ls_sql+=" FROM bj_khwntcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcmxj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (tcjg!=tcmxj)
		{
			conn.rollback();
			out.println("错误！套餐总价["+tcjg+"]不等于明细之和["+tcmxj+"]");
			return;
		}
	}
	else{
		String cpmc=null;
		ls_sql="SELECT distinct cpmc";
		ls_sql+=" FROM bj_wntczcmx";
		ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
		ls_sql+=" order by cpmc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			cpmc=rs.getString("cpmc");


			int cpsl=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_wntczcmx";
			ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"' and cpmc='"+cpmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cpsl=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (cpsl==1)//只有一条不用选择
			{
				ls_sql="insert into bj_khwntcmxh (zjxxh,khbh,cpmc,cpsl,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
				ls_sql+=" select                  ?    ,?   ,cpmc,1   ,cpbm,dqbm,hxbm,tcmc,jgwzbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,''    ,?  ,SYSDATE,? ,bz,'Y'";
				ls_sql+=" FROM bj_wntczcmx";
				ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"' and cpmc='"+cpmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps.setString(1,zjxxh);
				ps.setString(2,khbh);
				ps1.setString(3,yhmc);
				ps1.setString(4,lx);//1：温暖套餐；2：静音套餐
				ps1.executeUpdate();
				ps1.close();

			}
			else{//多条需要选择
				ls_sql="insert into bj_khwntcmxh (zjxxh,khbh      ,cpmc      ,cpsl    ,dqbm      ,hxbm      ,tcmc      ,sl,lrr       ,lrsj   ,lx,sfbpx)";
				ls_sql+="            values('"+zjxxh+"','"+khbh+"','"+cpmc+"',"+cpsl+",'"+dqbm+"','"+hxbm+"','"+tcmc+"',0 ,'"+yhmc+"',SYSDATE,'"+lx+"','Y')";//1：家具套餐；2：健康计划
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}

		}
		rs.close();
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>