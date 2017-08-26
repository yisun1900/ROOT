<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String zjxxh=request.getParameter("zjxxh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String khbh=null;
	double zjxjme=10;
	double glfjmje=10;
	double sjjmje=10;

	double kqtk=10;
	ls_sql="select sfwc,khbh,zjxjme,glfjmje,sjjmje,kqtk";
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

		kqtk=rs.getDouble("kqtk");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}


	String fgsbh=null;
	String bjjb = null;
	ls_sql="select fgsbh,bjjb";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
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

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_khzctcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and cpbm is null ";
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
		out.println("错误！主材套餐中多选一项目，未选择型号");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_zjxdj set sfwc='Y'";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	
	//获取最新工程总价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	//初始化
	dzbj.Zjx zjx=new dzbj.Zjx();


	double zxcbj=zjx.getCbj(conn,khbh,zjxxh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	double zxgcjcbj=zjx.getGcjcbj(conn,khbh,zjxxh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

	double zxhtjz=zjx.getHtjz(conn,khbh,zjxxh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券
	double zxsgcbj=zjx.getSgcbj(conn,khbh,zjxxh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	double zxmle=cf.round(zxhtjz-zxsgcbj,2);//毛利额=合同净值－施工成本价
	double zxmll=cf.round(zxmle/zxhtjz*100,2);//毛利率＝毛利额÷合同净值
	
	double wjryjje=0;//未记入业绩项目
	ls_sql="SELECT sum(sfje)";
	ls_sql+=" FROM bj_sfxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sfjrqye='2'";
	//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wjryjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	double yjjzcs=0;//业绩净值参数
	double mll=0;//合同毛利率
	ls_sql="SELECT yjjzcs,mll";
	ls_sql+=" FROM crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzcs=rs.getDouble(1);
		mll=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double zxyjjz=cf.round((zxmle-wjryjje)*100/yjjzcs,2);//业绩净值=毛利额÷核算净值参数

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//最低折扣
		zdmll=rs.getDouble("zdmll");//签单最低毛利率
	}
	rs.close();
	ps.close();



	double tcbzjg=0;
	double tcmjzjje=0;
	double tczcsjcj=0;
	double tczccljj=0;
	double tcxsfzc=0;
	double tczcjm=0;
	double tcdpsj=0;
	double tcdpdlsf=0;
	double tcxpx=0;
	double tcwzjzc=0;
	double tcqtsf=0;
	double zctcje=0;
	double wntcje=0;
	double jytcje=0;
	double sctcje=0;
	double jktcje=0;

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcbzjg=tc.getBzjgH(conn,zjxxh,khbh,"yz");//获取:套餐标准价格
		tcmjzjje=tc.getMjzjjeH(conn,zjxxh,khbh,"yz");//获取:面积增加金额

		tczcsjcj=tc.getZcsjcjH(conn,zjxxh,khbh,"yz");//获取:主材升级差价

		tczccljj=tc.getZccljjH(conn,zjxxh,khbh,"yz");//获取:主材超量加价
		tcxsfzc=tc.getXsfzcH(conn,zjxxh,khbh,"yz");//获取:需收费主材
		tczcjm=tc.getZcjmH(conn,zjxxh,khbh,"yz");//获取:主材减免
		tcdpsj=tc.getDpsjH(conn,zjxxh,khbh,"yz");//获取:顶配升级
		tcdpdlsf=tc.getDpdlsfH(conn,zjxxh,khbh,"yz");//获取:顶配独立收费
		tcxpx=tc.getXpxH(conn,zjxxh,khbh,"yz");//获取:选配项
		tcwzjzc=tc.getZjzcH(conn,zjxxh,khbh,"yz");//获取:套餐外增加主材
		tcqtsf=tc.getTcqtsfH(conn,zjxxh,khbh,"yz");//获取:套餐－其它收费

		zctcje=tc.getZctcjeH(conn,zjxxh,khbh,"yz");//获取:主材套餐金额
		wntcje=tc.getWntcjeH(conn,zjxxh,khbh,"yz");//获取:温暖套餐金额
		jytcje=tc.getJytcjeH(conn,zjxxh,khbh,"yz");//获取:静音套餐金额
		sctcje=tc.getSctcjeH(conn,zjxxh,khbh,"yz");//获取:色彩套餐金额
		jktcje=tc.getJktcjeH(conn,zjxxh,khbh,"yz");//获取:健康套餐金额

		ls_sql=" update crm_tckhqyeh set tcbzjg=?,tcmjzjje=?,tczcsjcj=?,tczccljj=?,tcxsfzc=?,tczcjm=?,tcdpsj=?,tcdpdlsf=?,tcxpx=?,tcwzjzc=?,tcqtsf=?,zctcje=?,wntcje=?,jytcje=?,sctcje=?,jktcje=?";
		ls_sql+=" where  zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,tcbzjg);
		ps.setDouble(2,tcmjzjje);
		ps.setDouble(3,tczcsjcj);
		ps.setDouble(4,tczccljj);
		ps.setDouble(5,tcxsfzc);
		ps.setDouble(6,tczcjm);
		ps.setDouble(7,tcdpsj);
		ps.setDouble(8,tcdpdlsf);
		ps.setDouble(9,tcxpx);
		ps.setDouble(10,tcwzjzc);
		ps.setDouble(11,tcqtsf);
		ps.setDouble(12,zctcje);
		ps.setDouble(13,wntcje);
		ps.setDouble(14,jytcje);
		ps.setDouble(15,sctcje);
		ps.setDouble(16,jktcje);
		ps.executeUpdate();
		ps.close();

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

		
		tcbzjg=tc.getBzjgZjx(conn,zjxxh,khbh,"yz");//获取:套餐标准价格
		tcmjzjje=tc.getMjzjjeZjx(conn,zjxxh,khbh,"yz");//获取:面积增加金额
		tczcsjcj=tc.getZcsjcjZjx(conn,zjxxh,khbh,"yz");//获取:主材升级差价
		tczccljj=tc.getZccljjZjx(conn,zjxxh,khbh,"yz");//获取:主材超量加价
		tcxsfzc=tc.getXsfzcZjx(conn,zjxxh,khbh,"yz");//获取:需收费主材
		tczcjm=tc.getZcjmZjx(conn,zjxxh,khbh,"yz");//获取:主材减免
		tcdpsj=tc.getDpsjZjx(conn,zjxxh,khbh,"yz");//获取:顶配升级
		tcdpdlsf=tc.getDpdlsfZjx(conn,zjxxh,khbh,"yz");//获取:顶配独立收费
		tcxpx=tc.getXpxZjx(conn,zjxxh,khbh,"yz");//获取:选配项
		tcwzjzc=tc.getZjzcZjx(conn,zjxxh,khbh,"yz");//获取:套餐外增加主材
		tcqtsf=tc.getTcqtsfZjx(conn,zjxxh,khbh,"yz");//获取:套餐－其它收费
		zctcje=tc.getZctcjeZjx(conn,zjxxh,khbh,"yz");//获取:主材套餐金额
		wntcje=tc.getWntcjeZjx(conn,zjxxh,khbh,"yz");//获取:温暖套餐金额

		jytcje=tc.getJytcjeZjx(conn,zjxxh,khbh,"yz");//获取:静音套餐金额
		sctcje=tc.getSctcjeZjx(conn,zjxxh,khbh,"yz");//获取:色彩套餐金额
		jktcje=tc.getJktcjeZjx(conn,zjxxh,khbh,"yz");//获取:健康套餐金额

		ls_sql=" insert into crm_zjxtckhqye (zjxxh,khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje)  ";
		ls_sql+=" values ( ?,?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setDouble(3,tcbzjg);
		ps.setDouble(4,tcmjzjje);
		ps.setDouble(5,tczcsjcj);
		ps.setDouble(6,tczccljj);
		ps.setDouble(7,tcxsfzc);
		ps.setDouble(8,tczcjm);
		ps.setDouble(9,tcdpsj);
		ps.setDouble(10,tcdpdlsf);
		ps.setDouble(11,tcxpx);
		ps.setDouble(12,0);
		ps.setDouble(13,0);
		ps.setDouble(14,tcwzjzc);
		ps.setDouble(15,0);
		ps.setDouble(16,tcqtsf);
		ps.setDouble(17,zctcje);
		ps.setDouble(18,wntcje);
		ps.setDouble(19,jytcje);
		ps.setDouble(20,sctcje);
		ps.setDouble(21,jktcje);
		ps.executeUpdate();
		ps.close();
	}



	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		//增减项套餐主材订单分解
		zjx.ZjxTcDdfj(conn,khbh,zjxxh,yhmc,lrbm,"yz");
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