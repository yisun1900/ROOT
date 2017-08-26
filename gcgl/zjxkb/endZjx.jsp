<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	double yqgcze=0;//增减前工程费总额
	double yglf=0;//增减前管理费总额
	double ysuijin=0;//增减前税金总额

	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;

	double gczxzk=10;
	double gcjxzk=10;
	double zxglfzk=10;
	double jxglfzk=10;
	double zxsjzk=10;
	double jxsjzk=10;
	ls_sql="select sfwc,khbh,zjxjme,glfjmje,sjjmje,gczxzk,gcjxzk,zxglfzk,jxglfzk,zxsjzk,jxsjzk,yqgcze,yglf,ysuijin";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
		zjxjme=rs.getDouble("zjxjme");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");

		gczxzk=rs.getDouble("gczxzk");
		gcjxzk=rs.getDouble("gcjxzk");
		zxglfzk=rs.getDouble("zxglfzk");
		jxglfzk=rs.getDouble("jxglfzk");
		zxsjzk=rs.getDouble("zxsjzk");
		jxsjzk=rs.getDouble("jxsjzk");

		yqgcze=rs.getDouble("yqgcze");
		yglf=rs.getDouble("yglf");
		ysuijin=rs.getDouble("ysuijin");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


	double glfbfb=0;
	double suijinbfb=0;
	String fgsbh=null;
	ls_sql="select glfbfb,suijinbfb,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		glfbfb=rs.getDouble("glfbfb");
		suijinbfb=rs.getDouble("suijinbfb");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	double jxglfbfb=0;
	ls_sql="select jxglfbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglfbfb=rs.getDouble("jxglfbfb");//减项扣管理费百分比
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

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set sfwc='Y'";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	
	//获取最新工程总价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	//初始化
	dzbj.Zjx dzbj=new dzbj.Zjx();
	//更新报价折扣
//	dzbj.updateZjxBjZkl(conn,khbh,zjxxh,"yz");
	//更新其它收费项目，调整收费百分比
//	dzbj.updateZjxSfxm(conn,khbh,zjxxh,"yz");



	double gcze=dzbj.getZjxHZqGczjf(conn,khbh,zjxxh,"yz");//增减项工程直接费－折前

	double gczxzq=dzbj.getZqGcZx(conn,khbh,zjxxh,"yz");//工程增项－折前
	double gcjxzq=dzbj.getZqGcJx(conn,khbh,zjxxh,"yz");//工程减项－折前


	double gczxzh=gczxzq*gczxzk/10;//工程增项－折后
	double gcjxzh=gcjxzq*gcjxzk/10;//工程减项－折后

	double zjje=0;//增减工程费－折前
	double jzjje=0;//增减工程费－折后
	zjje=gczxzq-gcjxzq;//增减工程费－折前
	jzjje=gczxzh-gcjxzh;//增减工程费－折后

	double glfze=dzbj.getZjxHZqGlfJe(conn,khbh,zjxxh,"yz");//『增减后』折前『管理费金额』
	double sjze=dzbj.getZjxHZqSuijinJe(conn,khbh,zjxxh,"yz");//『增减后』折前『税金金额』

	//获取电子报价金额
	double zqguanlif=0;//折前-增减项管理费
	double zhguanlif=0;//折后-增减项管理费

	zqguanlif=gczxzq*glfbfb/100-gcjxzq*glfbfb/100;//折前-增减项管理费
	zhguanlif=gczxzq*glfbfb/100*zxglfzk/10-gcjxzq*glfbfb/100*jxglfzk/10;//折后管理费


	double zqzjxsuijin=0;//折前-增减项税金
	double zjxsuijin=0;//折后-增减项税金

	zqzjxsuijin=gczxzq*suijinbfb/100-gcjxzq*suijinbfb/100+zqguanlif*suijinbfb/100;//折前-增减项税金
	zjxsuijin=gczxzq*suijinbfb/100*zxsjzk/10+gczxzq*glfbfb/100*suijinbfb/100*zxsjzk/10 -gcjxzq*suijinbfb/100*jxsjzk/10-gcjxzq*glfbfb/100*suijinbfb/100*jxsjzk/10;//折后税金

	double kglf=0;
	double zjxrzf=0;
	double zjxdjjje=0;

	if (zjje<0)
	{
		zjxdjjje=-1*zjje*djjbfb/100;
	}

	kglf=gcjxzq*jxglfbfb/100;
	zjxrzf=gcjxzh*rzfbfb/100;


	//增减项发生额
	ls_sql="update crm_zjxdj set zjje=?,jzjje=?,zqguanlif=?,zhguanlif=?,zqzjxsuijin=?,zjxsuijin=?";
	ls_sql+=" ,gczxzq=?,gcjxzq=?,gczxzh=?,gcjxzh=?,kglf=?,zjxrzf=?,zjxdjjje=?";
	ls_sql+=" where  zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjje);
	ps.setDouble(2,jzjje);
	ps.setDouble(3,zqguanlif);
	ps.setDouble(4,zhguanlif);
	ps.setDouble(5,zqzjxsuijin);
	ps.setDouble(6,zjxsuijin);

	ps.setDouble(7,gczxzq);
	ps.setDouble(8,gcjxzq);
	ps.setDouble(9,gczxzh);
	ps.setDouble(10,gcjxzh);

	ps.setDouble(11,kglf);
	ps.setDouble(12,zjxrzf);
	ps.setDouble(13,zjxdjjje);


	ps.executeUpdate();
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

	ls_sql="update crm_khxx set zjxje=?,zhzjxje=?,zqzjxsuijin=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
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
	alert("存盘成功！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>