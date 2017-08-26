<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>合并客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String khbh1=cf.GB2Uni(request.getParameter("khbh1"));
String khbh2=cf.GB2Uni(request.getParameter("khbh2"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	int count=0;

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh1+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count<1)
	{
		out.println("错误！【删除客户】不存在");
		return;
	}

	String fgsbh=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	String sgd=null;

	ls_sql="select fgsbh,dwbh,sjsbh,sjs,sgd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh2+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		dwbh=rs.getString("dwbh");
		sjsbh=rs.getString("sjsbh");
		sjs=rs.getString("sjs");
		sgd=rs.getString("sgd");
	}
	else{
		out.println("错误！【保留客户】不存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	
	//合并客户付款记录
	String fkxh=null;

	ls_sql="SELECT fkxh";
	ls_sql+=" FROM cw_khfkjl";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh1+"'";
	ls_sql+=" order by cw_khfkjl.fkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkxh=rs.getString("fkxh");

		String newfkxh=null;

		ls_sql="select NVL(max(substr(fkxh,8,2)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh2+"'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		newfkxh=khbh2+cf.addZero(count+1,2);

		ls_sql="update cw_khfkjl ";
		ls_sql+=" set fkxh=?,khbh=?,sjs=?,sjsbh=?,dwbh=?,fgsbh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newfkxh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,sjsbh);
		ps1.setString(5,dwbh);
		ps1.setString(6,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update cw_glfkjl ";
		ls_sql+=" set fkxh=?";
		ls_sql+=" where fkxh='"+fkxh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newfkxh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//家装款更新+++++++++++++++++++++++++++++++++++++++开始
	double getsfke=0;//
	java.sql.Date getjzkfksj=null;//家装最近收款时间
	java.sql.Date getjzkscsj=null;//首次付家装款时间
	String getjzkfkxh=null;//家装最近收款序号
	int getjzkfkcs=0;//家装收款期数
	ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and fklxbm='11' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfke=rs.getDouble(1);//已收工程款
		getjzkfksj=rs.getDate(2);
		getjzkscsj=rs.getDate(3);
		getjzkfkxh=rs.getString(4);
		getjzkfkcs=rs.getInt(5);
	}
	rs.close();
	ps.close();


	//取财务收款情况
	double getcwsfke=0;//
	java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
	java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
	String getcwjzkfkxh=null;//财务家装最近收款序号
	int getcwjzkfkcs=0;//财务家装收款期数

	ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and fklxbm='11' and scbz='N'";
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getcwsfke=rs.getDouble(1);//已收工程款
		getcwjzkfksj=rs.getDate(2);
		getcwjzkscsj=rs.getDate(3);
		getcwjzkfkxh=rs.getString(4);
		getcwjzkfkcs=rs.getInt(5);
	}
	rs.close();
	ps.close();



	String getsfyjqk=null;//N：未交全款；Y：已交全款
	int qkcount=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and sfyjqk='Y' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qkcount=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (qkcount>0)
	{
		getsfyjqk="Y";
	}
	else{
		getsfyjqk="N";
	}

	if (getsfke<0)
	{
		out.println("<P>警告！！！家装收款已为负数，请仔细检查是否有错误，客户编号："+khbh2);
	}

	//更新：工程款实收款率、工程款实收款额
	ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,sfyjqk=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?";
	ls_sql+=" where khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,getsfke);
	ps.setInt(2,getjzkfkcs);
	ps.setString(3,getjzkfkxh);
	ps.setDate(4,getjzkfksj);
	ps.setString(5,getsfyjqk);
	ps.setDate(6,getjzkscsj);

	ps.setDouble(7,getcwsfke);
	ps.setInt(8,getcwjzkfkcs);
	ps.setString(9,getcwjzkfkxh);
	ps.setDate(10,getcwjzkfksj);
	ps.setDate(11,getcwjzkscsj);
	
	ps.executeUpdate();
	ps.close();

	//家装款更新--------------------------------------------完成



	//设计费更新+++++++++++++++++++++++++++++++++++++++开始
	double sfke=0;
	double maxsfke=0;
	java.sql.Date jsjfsj=null;
	String sjfbz="N";
	ls_sql="select sum(fkje),max(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and fklxbm='53' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfke=rs.getDouble(1);//设计费
		maxsfke=rs.getDouble(2);//最大设计费
		jsjfsj=rs.getDate(3);//交设计费时间
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
	}
	else 
	{
		if (maxsfke>0)
		{
			sjfbz="T";
		}
		else{
			sjfbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
	ls_sql+=" where khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjfbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jsjfsj);
	ps.executeUpdate();
	ps.close();

	//设计费更新--------------------------------------------完成

//

	//量房订金更新+++++++++++++++++++++++++++++++++++++++开始
	sfke=0;
	maxsfke=0;
	java.sql.Date jlfdjsj=null;
	String lfdjbz="N";
	ls_sql="select sum(fkje),max(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and fklxbm='52' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfke=rs.getDouble(1);//量房订金
		maxsfke=rs.getDouble(2);//最大量房订金
		jlfdjsj=rs.getDate(3);//交量房订金时间
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
	}
	else 
	{
		if (maxsfke>0)
		{
			lfdjbz="T";
		}
		else{
			lfdjbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";
	ls_sql+=" where khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,lfdjbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jlfdjsj);
	ps.executeUpdate();
	ps.close();

	//量房订金更新--------------------------------------------完成

	//促销活动订金更新+++++++++++++++++++++++++++++++++++++++开始
	sfke=0;
	maxsfke=0;
	java.sql.Date jhddjsj=null;
	String hddjbz="N";
	ls_sql="select sum(fkje),max(fkje),min(sksj)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh2+"' and fklxbm='51' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfke=rs.getDouble(1);//活动订金
		maxsfke=rs.getDouble(2);//最大活动订金
		jhddjsj=rs.getDate(3);//交活动订金时间
	}
	rs.close();
	ps.close();

	if (sfke>0)
	{
		hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
	}
	else 
	{
		if (maxsfke>0)
		{
			hddjbz="T";
		}
		else{
			hddjbz="N";
		}
	}

	ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";
	ls_sql+=" where khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hddjbz);
	ps.setDouble(2,sfke);
	ps.setDate(3,jhddjsj);
	ps.executeUpdate();
	ps.close();
	//促销活动订金更新--------------------------------------------完成


	//合并木门订单
	String yddbh=null;
	ls_sql="SELECT yddbh";
	ls_sql+=" FROM jc_mmydd  ";
	ls_sql+=" where jc_mmydd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_mmydd.yddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yddbh=rs.getString("yddbh");

		String newyddbh=null;

		ls_sql="select NVL(max(substr(yddbh,8,2)),0)";
		ls_sql+=" from  jc_mmydd";
		ls_sql+=" where khbh='"+khbh2+"'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		newyddbh=khbh2+cf.addZero(count+1,2);

		ls_sql="update jc_mmydd ";
		ls_sql+=" set yddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmazsjjl ";
		ls_sql+=" set yddbh=?,khbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.setString(2,khbh2);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmydmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmccd ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmfcd ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmdgdmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_wjjddmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_blddmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmzjx ";
		ls_sql+=" set yddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmzjxmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_wjzjxmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_blzjxmx ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmazfkd ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_mmazjl ";
		ls_sql+=" set yddbh=?";
		ls_sql+=" where yddbh='"+yddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newyddbh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//合并橱柜订单
	String ddbh=null;
	ls_sql="SELECT ddbh";
	ls_sql+=" FROM jc_cgdd  ";
	ls_sql+=" where jc_cgdd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_cgdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");

		String newddbh=null;

		ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
		ls_sql+=" from  jc_cgdd";
		ls_sql+=" where khbh='"+khbh2+"'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		newddbh=khbh2+cf.addZero(count+1,2);

		ls_sql="update jc_cgdd ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgsjsgpjl ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgsjslxjl ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgazsjjl ";
		ls_sql+=" set ddbh=?,khbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgazjl ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgdtmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgzjx ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cgzjxmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_yfcgdtmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_yfjgyqsm ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_yfsjbf ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_yfdgsp ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


	//合并家具订单
	ls_sql="SELECT ddbh";
	ls_sql+=" FROM jc_jjdd  ";
	ls_sql+=" where jc_jjdd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_jjdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");

		String newddbh=null;

		ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
		ls_sql+=" from  jc_jjdd";
		ls_sql+=" where khbh='"+khbh2+"'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		newddbh=khbh2+cf.addZero(count+1,2);

		ls_sql="update jc_jjdd ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjsjsgpjl ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjsjslxjl ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjazsjjl ";
		ls_sql+=" set ddbh=?,khbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjazjl ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjgtmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_gtbjmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_gtpjmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjxcmmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cpjjddmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_jjzjx ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_gtzjxmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_xcmzjxmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_cpjjzjxmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


	//合并主材订单
	ls_sql="SELECT ddbh";
	ls_sql+=" FROM jc_zcdd  ";
	ls_sql+=" where jc_zcdd.khbh='"+khbh1+"'";
	ls_sql+=" order by jc_zcdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=rs.getString("ddbh");

		String newddbh=null;

		ls_sql="select NVL(max(substr(ddbh,8,2)),0)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh2+"'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		newddbh=khbh2+cf.addZero(count+1,2);

		ls_sql="update jc_zcdd ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_zcddmx ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_zcshsjjl ";
		ls_sql+=" set ddbh=?,khbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_zctbhjl ";
		ls_sql+=" set ddbh=?,khbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_zczjx ";
		ls_sql+=" set ddbh=?,khbh=?,jzsjs=?,qddm=?,fgsbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.setString(2,khbh2);
		ps1.setString(3,sjs);
		ps1.setString(4,dwbh);
		ps1.setString(5,fgsbh);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update jc_zczjxmx ";
		ls_sql+=" set ddbh=?";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,newddbh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//修改增减项
	ls_sql="update crm_zjxdj ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zjxyydj ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_bjxmmxq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_khglfxbq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_fjxxq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_gclmxq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_dwgclzcylq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_zcbjmxq ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_bjxmmxh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_khglfxbh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_fjxxh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_gclmxh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_dwgclzcylh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_sfxmmxh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	ls_sql="update bj_zcbjmxh ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();

	//重新计算增减项＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	double allzjxje=0;
	double allkglf=0;
	double allkqtk=0;
	double alljzjje=0;
	double allzjxsuijin=0;

	ls_sql="select sum(zjje),sum(kglf),sum(kqtk),sum(jzjje),sum(zjxsuijin)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		allkglf=rs.getDouble(2);
		allkqtk=rs.getDouble(3);
		alljzjje=rs.getDouble(4);
		allzjxsuijin=rs.getDouble(5);
	}
	rs.close();
	ps.close();

	
	ls_sql="update crm_khxx set zjxje=?,kglf=?,kqtk=?,zhzjxje=?,zjxsuijin=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,allkglf);
	ps.setDouble(3,allkqtk);
	ps.setDouble(4,alljzjje);
	ps.setDouble(5,allzjxsuijin);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update crm_hfjl ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update crm_hfdjjl ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update crm_tsjl ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update crm_tshfjl ";
	ls_sql+=" set khbh=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update crm_wxfmx ";
	ls_sql+=" set khbh=?,sgd=?";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh2);
	ps.setString(2,sgd);
	ps.executeUpdate();
	ps.close();

	//重新计算增减项===================结束

	ls_sql="delete from crm_khxx";
	ls_sql+=" where khbh='"+khbh1+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	conn.commit();

	out.println("合并成功！");
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
	catch (Exception e)
	{
		if (conn != null) cf.close(conn); 
	}
}

%> 

</body>
</html>


