<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh = request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double zjsl=0;
String jsbz=null;
String khbh=null;

String jgwzbm=null;
String wybh=null;
String xmbh=null;
double bjwclbj=0;//报价误差率报警
double wcl=0;//误差率
String bjbz=null;//报警标志
double ysl=0;
double xsl=0;


try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="select khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");//已完成标志
	}
	else{
		rs.close();
		ps.close();

		conn.rollback();
		out.println("错误！不存在的增减项序号:"+zjxxh);
		return;
	}
	rs.close();
	ps.close();

	double djjbfb=0;
	double rzfbfb=0;
	ls_sql="select djjbfb,rzfbfb";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjbfb=rs.getDouble("djjbfb");//代金券百分比
		rzfbfb=rs.getDouble("rzfbfb");//认证费百分比
	}
	rs.close();
	ps.close();

	String newzjxxh="";
	String gcjdbm="";
	String gdjsjd="";
	String sjsjsbz="";
	ls_sql="select gcjdbm,zjxxh,gdjsjd,sjsjsbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("5"))
	{
		conn.rollback();
		out.println("错误！客户已完结，不能再删除");
		return;
	}
	if (sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		conn.rollback();
		out.println("错误！设计师已结算，不能再删除");
		return;
	}
	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		conn.rollback();
		out.println("错误！施工队已结算，不能再删除");
		return;
	}
	if (!newzjxxh.equals(zjxxh))
	{
		conn.rollback();
		out.println("错误！只能删除最新的增减项记录:"+newzjxxh);
		return;
	}


	ls_sql="delete from crm_zjxdj ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zjxyydj ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_bjxmmxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglxmbq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglfxbq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_fjxxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmxq ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_bjxmmxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglxmbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglfxbh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_fjxxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmxh ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//还原
	String oldzjxxh=null;
	int count=0;
	ls_sql="select NVL(max(substr(zjxxh,8,2)),0)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		oldzjxxh="";
	}
	else{
		oldzjxxh=khbh.trim()+cf.addZero(count,2);
	}
	
	java.sql.Date fssj=null;
	ls_sql="select fssj";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+oldzjxxh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fssj=rs.getDate("fssj");
	}
	rs.close();
	ps.close();

	//更新增减项汇总信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double allzjxje=0;
	double alljzjje=0;
	double allzqzjxsuijin=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;
	double allzjxrzf=0;
	double allzjxdjjje=0;

	ls_sql="select sum(zjje),sum(jzjje),sum(zqzjxsuijin),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk),sum(zjxrzf)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzqzjxsuijin=rs.getDouble(3);
		allzjxsuijin=rs.getDouble(4);
		allzqguanlif=rs.getDouble(5);
		allzhguanlif=rs.getDouble(6);
		allkglf=rs.getDouble(7);
		allkqtk=rs.getDouble(8);
		allzjxrzf=rs.getDouble(9);
	}
	rs.close();
	ps.close();

	if (allzjxje<0)
	{
		allzjxdjjje=-1*allzjxje*djjbfb/100;
	}

	ls_sql="update crm_khxx set zjxxh=?,zjxsj=?,zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,oldzjxxh);
	ps.setDate(2,fssj);

	ps.setDouble(3,allzjxje);
	ps.setDouble(4,alljzjje);
	ps.setDouble(5,allzqzjxsuijin);
	ps.setDouble(6,allzjxsuijin);
	ps.setDouble(7,allzqguanlif);
	ps.setDouble(8,allzhguanlif);
	ps.setDouble(9,allkglf);
	ps.setDouble(10,allkqtk);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khqye set zjxrzf=?,zjxdjjje=? ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxrzf);
	ps.setDouble(2,allzjxdjjje);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzqzjxsuijin);
	ps.setDouble(4,allzjxsuijin);
	ps.setDouble(5,allzqguanlif);
	ps.setDouble(6,allzhguanlif);
	ps.setDouble(7,allkglf);
	ps.setDouble(8,allkqtk);
	ps.executeUpdate();
	ps.close();
	//更新增减项汇总信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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