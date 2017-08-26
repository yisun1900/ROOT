<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String shbz="";
	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;
	ls_sql="select shbz,sfwc,khbh,zjxjme,glfjmje,sjjmje";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shbz=rs.getString("shbz");
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N") )//N：未完成；Y：完成
	{
		out.println("错误！增减项未完成，不能删除");
		return;
	}

	if ( shbz.equals("Y") || shbz.equals("S"))//N：未审核；Y：审核通过；S：审核未通过；M：不需审核
	{
		out.println("错误！增减项已审核，不能删除");
		return;
	}


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

	if (sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		out.println("错误！设计师已结算，不能再删除");
		return;
	}
	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！施工队已结算，不能再删除");
		return;
	}


	ls_sql="select zjxxh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";//N：未完成；Y：已完成
	ls_sql+=" and lx in('3','4')";//1：工程增减项；2：工程增减项无明细；3：套餐退补货；4：套餐调换产品
	ls_sql+=" order by zjxxh desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		newzjxxh=rs.getString(1);
	}
	rs.close();
	ps.close();

	if (!newzjxxh.equals(zjxxh))
	{
		out.println("错误！只能删除最新的增减项记录:"+newzjxxh);
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="delete from crm_zjxtckhqye ";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//增减项发生额
	ls_sql="update crm_zjxdj set zjje=0,jzjje=0,zqguanlif=0,zhguanlif=0,zqzjxsuijin=0,zjxsuijin=0";
	ls_sql+=" ,gczxzq=0,gcjxzq=0,gczxzh=0,gcjxzh=0,kglf=0,zjxrzf=0,zjxdjjje=0";
	ls_sql+=" ,zqzjze=0,zhzjze=0  ,zqqtsf=0,zhqtsf=0,qtsfsm=null  ,zqwjrqyexm=0,zhwjrqyexm=0,wjrqyexmsm=null,zqsjf=0,zhsjf=0";
	ls_sql+=" ,sfwc='N',shbz='M'";//N：未审核；Y：审核；M：不需审核
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//不需审核，还原汇总信息
	if (shbz.equals("M"))//N：未审核；Y：审核通过；S：审核未通过；M：不需审核
	{

		String bjjb = null;
		ls_sql="select bjjb";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bjjb=rs.getString("bjjb");
		}
		rs.close();
		ps.close();

		String lx="";
		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjb+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			lx=rs.getString("lx");
		}
		rs.close();
		ps.close();

		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			dzbj.Tc tc=new dzbj.Tc();
			double zctcje=tc.getZctcjeQ(conn,zjxxh,khbh,"yz");//获取:主材套餐金额
			double wntcje=tc.getWntcjeQ(conn,zjxxh,khbh,"yz");//获取:温暖套餐金额
			double jytcje=tc.getJytcjeQ(conn,zjxxh,khbh,"yz");//获取:静音套餐金额
			double sctcje=tc.getSctcjeQ(conn,zjxxh,khbh,"yz");//获取:色彩套餐金额
			double jktcje=tc.getJktcjeQ(conn,zjxxh,khbh,"yz");//获取:健康套餐金额

			ls_sql=" update crm_tckhqye set zctcjezjx=?,wntcjezjx=?,jytcjezjx=?,sctcjezjx=?,jktcjezjx=? ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,zctcje);
			ps.setDouble(2,wntcje);
			ps.setDouble(3,jytcje);
			ps.setDouble(4,sctcje);
			ps.setDouble(5,jktcje);
			ps.executeUpdate();
			ps.close();

			
			//初始化
			dzbj.Zjx zjx=new dzbj.Zjx();
			//删除－增减项套餐主材订单分解
			zjx.DelZjxTcDdfj(conn,khbh,zjxxh,yhmc,lrbm,"yz");
		}
		
		
		//更新增减项汇总信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成
	}
	//还原汇总信息


	
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