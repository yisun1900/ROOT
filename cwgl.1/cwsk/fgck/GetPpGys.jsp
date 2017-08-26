<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String fklxbm=request.getParameter("fklxbm");
String fkxh=request.getParameter("fkxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String gysstr="";

try {
	conn=cf.getConnection();

	if (fklxbm.equals("21"))//木门款
	{
		String mmbz="";//木门收款检查
		ls_sql=" select mmbz ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			mmbz=cf.fillNull(rs.getString("mmbz"));
		}
		rs.close();
		ps.close();

		if (mmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			String ddbh=null;
			String gysmc=null;
			double ddje=0;
			String ls="";

			ls_sql="SELECT yddbh,pdgcmc,zjhze";
			ls_sql+=" FROM jc_mmydd ";
			ls_sql+=" where jc_mmydd.khbh='"+khbh+"'";
			ls_sql+=" and jc_mmydd.clzt not in('98','99')";
			ls_sql+=" and (jc_mmydd.htje!=0 OR jc_mmydd.zjhze!=0)";
			ls_sql+=" order by pdgcmc,yddbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				ddbh=rs.getString("yddbh");
				gysmc=cf.fillNull(rs.getString("pdgcmc"));
				ddje=rs.getDouble("zjhze");


				double zcfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where ddbh='"+ddbh+"' and fkxh!='"+fkxh+"' and scbz='N' and fklxbm='21'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zcfk=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				ls+="%"+gysmc+"*"+ddbh+"+"+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）";
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		else if (mmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			String gysmc=null;
			String ls="";

			ls_sql="select distinct jxc_ppgysdzb.ppmc ";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
			ls_sql+=" order  by jxc_ppgysdzb.ppmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				gysmc=rs.getString("ppmc");

				ls+="%"+gysmc+"+"+gysmc;
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
	}
	else if (fklxbm.equals("22"))//橱柜款
	{
		String cgjjbz="";//橱柜收款检查
		ls_sql=" select cgjjbz ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		}
		rs.close();
		ps.close();

		if (cgjjbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			String ddbh=null;
			String gysmc=null;
			double ddje=0;
			String ls="";

			ls="";
			ls_sql=" SELECT ddbh,pdgcmc,zjhze";
			ls_sql+=" FROM jc_cgdd ";
			ls_sql+=" where jc_cgdd.khbh='"+khbh+"'";
			ls_sql+=" and jc_cgdd.clzt not in('98','99')";
			ls_sql+=" and (jc_cgdd.htze!=0 OR jc_cgdd.zjhze!=0)";
			ls_sql+=" order by pdgcmc,ddbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				ddbh=rs.getString("ddbh");
				gysmc=cf.fillNull(rs.getString("pdgcmc"));
				ddje=rs.getDouble("zjhze");


				double zcfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where ddbh='"+ddbh+"' and fkxh!='"+fkxh+"' and scbz='N' and fklxbm='22'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zcfk=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				ls+="%"+gysmc+"*"+ddbh+"+"+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）";
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		else if (cgjjbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			String gysmc=null;
			String ls="";

			ls="";
			ls_sql="select distinct jxc_ppgysdzb.ppmc ";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
			ls_sql+=" order  by jxc_ppgysdzb.ppmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				gysmc=rs.getString("ppmc");

				ls+="%"+gysmc+"+"+gysmc;
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
	}
	else if (fklxbm.equals("23"))//主材款
	{
		String zcmmbz="";//主材收款检查
		ls_sql=" select zcmmbz ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		}
		rs.close();
		ps.close();

		if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			String ddbh=null;
			String gysmc=null;
			double ddje=0;
			String ls="";
			ls_sql=" SELECT ddbh,ppbm,hkze+zjhze ddje";
			ls_sql+=" FROM jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and jc_zcdd.clzt not in('98','99')";
			ls_sql+=" and (jc_zcdd.hkze!=0 OR jc_zcdd.zjhze!=0)";
			ls_sql+=" order by ppbm,ddbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				ddbh=rs.getString("ddbh");
				gysmc=rs.getString("ppbm");
				ddje=rs.getDouble("ddje");

				double zcfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where ddbh='"+ddbh+"' and fkxh!='"+fkxh+"' and scbz='N' and fklxbm='23' and gysbh='"+gysmc+"'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zcfk=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				ls+="%"+gysmc+"*"+ddbh+"+"+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）";
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			String gysmc=null;
			String ls="";

			ls="";

			ls_sql="select distinct jxc_ppgysdzb.ppmc ";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
			ls_sql+=" order  by jxc_ppgysdzb.ppmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				gysmc=rs.getString("ppmc");

				ls+="%"+gysmc+"+"+gysmc;
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		//收款品牌----------------------------
	}
	else if (fklxbm.equals("24"))//家具款
	{
		String jjbz="";//家具收款检查
		ls_sql=" select jjbz ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jjbz=cf.fillNull(rs.getString("jjbz"));
		}
		rs.close();
		ps.close();

		if (jjbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			String ddbh=null;
			String gysmc=null;
			String xcmgcmc=null;
			double ddje=0;
			String ls="";

			ls_sql=" SELECT ddbh,pdgcmc,xcmgcmc,zjhze";
			ls_sql+=" FROM jc_jjdd ";
			ls_sql+=" where jc_jjdd.khbh='"+khbh+"'";
			ls_sql+=" and jc_jjdd.clzt not in('98','99')";
			ls_sql+=" and (jc_jjdd.htze!=0 OR jc_jjdd.zjhze!=0)";
			ls_sql+=" order by pdgcmc,ddbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				ddbh=rs.getString("ddbh");
				gysmc=cf.fillNull(rs.getString("pdgcmc"));
				xcmgcmc=cf.fillNull(rs.getString("xcmgcmc"));
				ddje=rs.getDouble("zjhze");


				if (!gysmc.equals(""))
				{
					if (!xcmgcmc.equals(""))
					{
						gysmc=gysmc+"、"+xcmgcmc;
					}
				}
				else{
					if (!xcmgcmc.equals(""))
					{
						gysmc=xcmgcmc;
					}
				}

				double zcfk=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where ddbh='"+ddbh+"' and fkxh!='"+fkxh+"' and scbz='N' and fklxbm='24'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zcfk=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				ls+="%"+gysmc+"*"+ddbh+"+"+gysmc+"（单号:"+ddbh+"）（应付￥"+cf.round(ddje-zcfk,2)+"）（订货￥"+ddje+"、已付￥"+zcfk+"）";

			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		else if (jjbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			String gysmc=null;
			String ls="";

			ls_sql="select distinct jxc_ppgysdzb.ppmc ";
			ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
			ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppxx.pplb in('1','3') and jxc_ppgysdzb.ssfgs='"+fgsbh+"' ";
			ls_sql+=" order  by jxc_ppgysdzb.ppmc";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				gysmc=rs.getString("ppmc");

				ls+="%"+gysmc+"+"+gysmc;
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
	}

	//收款品牌----------------------------
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>