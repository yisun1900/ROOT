<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String khbh2=request.getParameter("khbh2");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String hth=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	ls_sql="select hth,dwbh,sjsbh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString("hth");
		dwbh=rs.getString("dwbh");
		sjsbh=rs.getString("sjsbh");
		sjs=rs.getString("sjs");
	}
	else{
		out.println("错误！保留客户信息不存在");
		return;
	}
	rs.close();
	ps.close();

	String hth2=null;
	ls_sql="select hth";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  fgsbh='"+fgsbh+"' and khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth2=rs.getString(1);
	}
	else{
		out.println("错误！删除客户信息不存在");
		return;
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//更新集成订单＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	ls_sql="update jc_jcdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmydd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_mmzjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_cgzjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_jjzjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_zcdd set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set fgsbh=?,qddm=?,jzsjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khbh);
	ps.executeUpdate();
	ps.close();
	//更新集成订单－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

	ls_sql="update crm_hthxx set sybz='N',khbh=null ";;
	ls_sql+=" where  hth='"+hth2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly ";;
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from  crm_khxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//增减项＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update crm_zjxdj set khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	double allzjxje=0;
	double allkglf=0;
	double allkqtk=0;
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzjxguanlif=0;

	ls_sql="select sum(zjje),sum(kglf),sum(kqtk),sum(jzjje),sum(zjxsuijin),sum(zhguanlif)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		allkglf=rs.getDouble(2);
		allkqtk=rs.getDouble(3);
		alljzjje=rs.getDouble(4);
		allzjxsuijin=rs.getDouble(5);
		allzjxguanlif=rs.getDouble(6);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zjxje=?,kglf=?,kqtk=?,zhzjxje=?,zjxsuijin=?,zjxguanlif=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,allkglf);
	ps.setDouble(3,allkqtk);
	ps.setDouble(4,alljzjje);
	ps.setDouble(5,allzjxsuijin);
	ps.setDouble(6,allzjxguanlif);
	ps.executeUpdate();
	ps.close();
	//增减项＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	//删除咨询客户信息
	ls_sql="delete from crm_dmjdjl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_sjsjdjl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zxkhfwjl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khxxly ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_zxkhxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_dzyhsq ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_dxdzyh ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//删除电子报价＋＋＋＋＋＋＋＋＋＋＋＋开始

	//电子报价--项目明细
	ls_sql="delete from bj_bjxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//电子报价--工料分析表
	ls_sql="delete from bj_khglfxb ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//电子报价--房间信息
	ls_sql="delete from bj_fjxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//电子报价--工程量明细
	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//电子报价--主材用量
	ls_sql="delete from bj_zcbjmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//电子报价--其它收费项目明细
	ls_sql="delete from bj_sfxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//删除电子报价========================完成


	//删除临时报价＋＋＋＋＋＋＋＋＋＋＋＋开始

	//临时报价--项目明细
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工料分析表
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--房间信息
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工程量明细
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--主材用量
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--其它收费项目明细
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//删除临时报价========================完成


	//修改财务信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始	
	ls_sql="update cw_khfkjl set fgsbh=?,dwbh=?,sjsbh=?,sjs=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjsbh);
	ps.setString(4,sjs);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	//家装款更新+++++++++++++++++++++++++++++++++++++++
	double getsfke=0;//
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfke=rs.getDouble(1);//已收工程款
	}
	rs.close();
	ps.close();

	//取财务收款情况
	double getcwsfke=0;//

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcwsfke=rs.getDouble(1);//已收工程款
	}
	rs.close();
	ps.close();

	double getzjxssk=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(7,8)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzjxssk=rs.getDouble(1);//增减项实收款
	}
	rs.close();
	ps.close();

	//更新：工程款实收款率、工程款实收款额
	ls_sql="update crm_khxx set sfke=?,cwsfke=?,zjxssk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,getsfke);
	ps.setDouble(2,getcwsfke);
	ps.setDouble(3,getzjxssk);
	ps.executeUpdate();
	ps.close();

	//家装款更新--------------------------------------------

	double sfke=0;
	java.sql.Date jlfdjsj=null;
	String lfdjbz="N";
	ls_sql="select sum(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//量房订金
		jlfdjsj=rs.getDate(2);//交量房订金时间
	}
	rs.close();
	ps.close();

	int tkjls=0;//退款记录数
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
	ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tkjls=rs.getInt(1);//退款记录数
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
	}
	else 
	{
		if (tkjls>0)
		{
			lfdjbz="T";
		}
		else{
			lfdjbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lfdjbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jlfdjsj);
	ps.executeUpdate();
	ps.close();

	//51：促销活动订金

	sfke=0;
	java.sql.Date jhddjsj=null;
	String hddjbz="N";
	ls_sql="select sum(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//活动订金
		jhddjsj=rs.getDate(2);//交活动订金时间
	}
	rs.close();
	ps.close();

	tkjls=0;//退款记录数
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
	ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tkjls=rs.getInt(1);//退款记录数
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
	}
	else 
	{
		if (tkjls>0)
		{
			hddjbz="T";
		}
		else{
			hddjbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//设计费是否可转出
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hddjbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jhddjsj);
	ps.executeUpdate();
	ps.close();

	//53：设计费
	sfke=0;
	java.sql.Date jsjfsj=null;
	String sjfbz="N";
	ls_sql="select sum(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//设计费
		jsjfsj=rs.getDate(2);//交设计费时间
	}
	rs.close();
	ps.close();

	tkjls=0;//退款记录数
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
	ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tkjls=rs.getInt(1);//退款记录数
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
	}
	else 
	{
		if (tkjls>0)
		{
			sjfbz="T";
		}
		else{
			sjfbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjfbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jsjfsj);
	ps.executeUpdate();
	ps.close();

	//修改财务信息========================完成	

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("合并成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
