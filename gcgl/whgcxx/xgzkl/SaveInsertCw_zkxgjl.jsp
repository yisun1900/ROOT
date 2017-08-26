<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String zklx=request.getParameter("zklx");
String xgr=null;
java.sql.Date xgsj=null;
xgr=cf.GB2Uni(request.getParameter("xgr"));
ls=request.getParameter("xgsj");
try{
	if (!(ls.equals("")))  xgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改时间]类型转换发生意外:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));

String khbh=request.getParameter("khbh");
String khxm=cf.GB2Uni(request.getParameter("khxm"));

double gxqzkl=0;
double gxhzkl=0;
ls=request.getParameter("gxqzkl");
try{
	if (!(ls.equals("")))  gxqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxqzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新前直接费折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzkl");
try{
	if (!(ls.equals("")))  gxhzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxhzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后直接费折扣率]类型转换发生意外:"+e);
	return;
}


double gxqcdzwjmje=0;
ls=request.getParameter("gxqcdzwjmje");
try{
	if (!(ls.equals("")))  gxqcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxqcdzwjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新前合同减免额]类型转换发生意外:"+e);
	return;
}
double gxhcdzwjmje=0;
ls=request.getParameter("gxhcdzwjmje");
try{
	if (!(ls.equals("")))  gxhcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxhcdzwjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后合同减免额]类型转换发生意外:"+e);
	return;
}

double gxqzjxzkl=0;
double gxhzjxzkl=0;
ls=request.getParameter("gxqzjxzkl");
try{
	if (!(ls.equals("")))  gxqzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxqzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新前增减项折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzjxzkl");
try{
	if (!(ls.equals("")))  gxhzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxhzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后增减项折扣率]类型转换发生意外:"+e);
	return;
}
double gxqglfjmje=0;
ls=request.getParameter("gxqglfjmje");
try{
	if (!(ls.equals("")))  gxqglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxqglfjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新前管理费减免额]类型转换发生意外:"+e);
	return;
}
double gxqsjjmje=0;
ls=request.getParameter("gxqsjjmje");
try{
	if (!(ls.equals("")))  gxqsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxqsjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新前税金减免额]类型转换发生意外:"+e);
	return;
}
double gxhglfjmje=0;
ls=request.getParameter("gxhglfjmje");
try{
	if (!(ls.equals("")))  gxhglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxhglfjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后管理费减免额]类型转换发生意外:"+e);
	return;
}
double gxhsjjmje=0;
ls=request.getParameter("gxhsjjmje");
try{
	if (!(ls.equals("")))  gxhsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gxhsjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后税金减免额]类型转换发生意外:"+e);
	return;
}


String[] sfxmbm =request.getParameterValues("sfxmbm");
String[] gxqdxzklstr =request.getParameterValues("gxqdxzkl");
String[] gxhdxzklstr =request.getParameterValues("gxhdxzkl");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String fgsbh =null;
	double suijinbfb=0;
	int fwmj=0;
	ls_sql="select suijinbfb,fwmj,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		suijinbfb=rs.getDouble("suijinbfb");
		fwmj=rs.getInt("fwmj");
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();

	
	double qdhdzk=10;
	double glfzk=10;
	double zjxhdzk=10;
	ls_sql="select qdhdzk,glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
		zjxhdzk=rs.getDouble("zjxhdzk");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//修改记录＋＋＋＋＋＋＋＋＋＋＋
	ls_sql ="insert into cw_zkxgjl (khbh,xgsj,khxm,fgsbh,xgr,zklx,gxqzkl,gxqzjxzkl,gxqcdzwjmje,gxqglfjmje,gxqsjjmje   ,gxhzkl,gxhzjxzkl,gxhcdzwjmje,gxhglfjmje,gxhsjjmje,bz)";
	ls_sql+=" values(?,SYSDATE,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,fgsbh);
	ps.setString(4,xgr);
	ps.setString(5,zklx);
	ps.setDouble(6,gxqzkl);
	ps.setDouble(7,gxqzjxzkl);
	ps.setDouble(8,gxqcdzwjmje);
	ps.setDouble(9,gxqglfjmje);
	ps.setDouble(10,gxqsjjmje);

	ps.setDouble(11,gxhzkl);
	ps.setDouble(12,gxhzjxzkl);
	ps.setDouble(13,gxhcdzwjmje);
	ps.setDouble(14,gxhglfjmje);
	ps.setDouble(15,gxhsjjmje);
	ps.setString(16,bz);
	ps.executeUpdate();
	ps.close();


	if (sfxmbm!=null)
	{
		for (int i=0;i<sfxmbm.length ;i++ )
		{
			double gxqdxzkl=0;
			double gxhdxzkl=0;

			try{
				gxqdxzkl=Double.parseDouble(gxqdxzklstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[更新前单项折扣率]类型转换发生意外");
				return;
			}

			try{
				gxhdxzkl=Double.parseDouble(gxhdxzklstr[i]);
			}
			catch (Exception e){
				conn.rollback();
				out.println("<BR>[更新后单项折扣率]类型转换发生意外");
				return;
			}


			if (gxhdxzkl<0 || gxhdxzkl>10)
			{
				conn.rollback();
				out.println("错误！『更新后单项折扣率』只能在0和10之间");
				return;
			}


			ls_sql="update bj_sfxmmx set dxzkl=?,sfje=zqsfje*cxhdzkl/10.0*?/10.0";
			ls_sql+=" where  khbh='"+khbh+"' and  sfxmbm='"+sfxmbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,gxhdxzkl);
			ps.setDouble(2,gxhdxzkl);
			ps.executeUpdate();
			ps.close();

			ls_sql ="insert into cw_dxzkxgmx (khbh,xgsj,sfxmbm,gxqdxzkl,gxhdxzkl)";
			ls_sql+=" values(?,SYSDATE,?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,sfxmbm[i]);
			ps.setDouble(3,gxhdxzkl);
			ps.setDouble(4,gxhdxzkl);
			ps.executeUpdate();
			ps.close();
		}
	}

	//修改记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


	//更新增减项＋＋＋＋＋＋＋＋＋＋＋
	double guanlifzk=10;//管理费折扣
	ls_sql="SELECT dxzkl";
	ls_sql+=" FROM bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"' and sflx='5'";//1：直接费百分比；2：固定金额(可改)；3：税金(百分比)；4：固定金额(不可改)；5：管理费(百分比)
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		guanlifzk=rs.getDouble("dxzkl");
	}
	rs.close();
	ps.close();

	
	//修改增减项
	String zjxxh=null;
	double zjje=0;//折前增减项发生额
	double zqzjxguanlif=0;//折前增减项管理费
	ls_sql="select zjxxh,zjje,zqguanlif";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zjxxh=rs.getString("zjxxh");
		zjje=rs.getDouble("zjje");
		zqzjxguanlif=rs.getDouble("zqguanlif");

		double jzjje=zjje*gxhzjxzkl/10;//折后增减项发生额
		jzjje=jzjje*zjxhdzk/10;//促销活动折上折
		jzjje=cf.round(jzjje,2);


		double zjxguanlif=zqzjxguanlif*guanlifzk/10*zjxhdzk/10;
		zjxguanlif=cf.round(zjxguanlif,2);


		double zjxsuijin=(jzjje+zjxguanlif)*suijinbfb/100;//增减项税金
		zjxsuijin=cf.round(zjxsuijin,2);

		ls_sql=" update crm_zjxdj set jzjje=?,zhguanlif=?,zjxsuijin=?";
		ls_sql+=" where zjxxh='"+zjxxh+"'";
		ps1=conn.prepareStatement(ls_sql);
		ps1.setDouble(1,jzjje);
		ps1.setDouble(2,zjxguanlif);
		ps1.setDouble(3,zjxsuijin);
		ps1.executeUpdate();
		ps1.close();
	
	}
	rs.close();
	ps.close();
	
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzhguanlif=0;

	ls_sql="select sum(jzjje),sum(zjxsuijin),sum(zhguanlif)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljzjje=rs.getDouble(1);
		allzjxsuijin=rs.getDouble(2);
		allzhguanlif=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	//更新增减项＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


	//更新签约额＋＋＋＋＋＋＋＋＋＋＋

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");

	ls_sql="update crm_zxkhxx set spzkl=?,zjxzkl=?,zklx=?,dzbjze=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzkl);
	ps.setDouble(2,gxhzjxzkl);
	ps.setString(3,zklx);
	ps.setDouble(4,dzbjze);
	ps.executeUpdate();
	ps.close();


	double qye=dzbj.getZhBjje(conn,khbh,"sxyd");//获取『折后』电子报价金额，直接费＋其它收费，不包括【不记入签约额】项目
	qye=qye-gxhcdzwjmje;//除打折外减免金额
	qye=cf.round(qye,2);

	double guanlif=dzbj.getZhGlfJe(conn,khbh,"yz");//获取折后『管理费金额』
	guanlif=guanlif-gxhglfjmje;//除打折外减免金额
	guanlif=cf.round(guanlif,2);

	double suijin=dzbj.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』
	suijin=suijin-gxhsjjmje;//除打折外减免金额
	suijin=cf.round(suijin,2);

	double zhwjrqyexm=dzbj.getZhWjrJe(conn,khbh,"yz");//获取『未记入签约额项目名称』，不包括税金、管理费、设计费

	
	String xghzxjwbm=null;
	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xghzxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	int xghpmjj=0;
	if (fwmj==0)
	{
		xghpmjj=0;
	}
	else{
		xghpmjj=(int)qye/fwmj;
	}
	
	ls_sql=" update crm_khxx set zkl=?,zjxzkl=?,qye=?,cdzwjmje=?,guanlif=?,glfjmje=?,suijin=?,sjjmje=?  ,zhzjxje=?,zjxsuijin=?,zjxguanlif=?,zhwjrqyexm=?  ,pmjj=?,zxjwbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzkl);
	ps.setDouble(2,gxhzjxzkl);
	ps.setDouble(3,qye);
	ps.setDouble(4,gxhcdzwjmje);
	ps.setDouble(5,guanlif);
	ps.setDouble(6,gxhglfjmje);
	ps.setDouble(7,suijin);
	ps.setDouble(8,gxhsjjmje);

	ps.setDouble(9,alljzjje);
	ps.setDouble(10,allzjxsuijin);
	ps.setDouble(11,allzhguanlif);
	ps.setDouble(12,zhwjrqyexm);

	ps.setInt(13,xghpmjj);
	ps.setString(14,xghzxjwbm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql=" update cw_qmjzmx set zkl=?,zjxzkl=?,qye=?,cdzwjmje=?,guanlif=?,glfjmje=?,suijin=?,sjjmje=?  ,zhzjxje=?,zjxsuijin=?,zjxguanlif=?,zhwjrqyexm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzkl);
	ps.setDouble(2,gxhzjxzkl);
	ps.setDouble(3,qye);
	ps.setDouble(4,gxhcdzwjmje);
	ps.setDouble(5,guanlif);
	ps.setDouble(6,gxhglfjmje);
	ps.setDouble(7,suijin);
	ps.setDouble(8,gxhsjjmje);

	ps.setDouble(9,alljzjje);
	ps.setDouble(10,allzjxsuijin);
	ps.setDouble(11,allzhguanlif);
	ps.setDouble(12,zhwjrqyexm);
	ps.executeUpdate();
	ps.close();

	
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
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>