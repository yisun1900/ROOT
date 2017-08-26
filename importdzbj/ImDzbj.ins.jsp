<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
String lrr=(String)session.getAttribute("yhdlm");
java.sql.Date lrsj=cf.getDate();


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String shbz="Y";
String bjlx="1";
String xmdlbm="02";
String dqbm="01";
String xmxlbm=null;
String xmxlbmstr=null;
String smbm=null;
String smbmstr=null;
String xmbh=null;
String oldxmbh=null;
String xmmc=null;
String jldwbmstr=null;
String jldwbm=null;
double dj=0;
String gycl=null;
String wybh=null;
String lrxh=null;
int xh=0;
int start=2911;


int count=0;

String ls=null;

try {
	//得到ORACLE连接
	conn=cf.getConnection();    

	
	
	conn.setAutoCommit(false);

	int jsq=0;
	//中级报价
	ls_sql ="select xh,UPPER(imbj_dzbj.xmbh) xmbh,imbj_dzbj.xmmc,imbj_dzbj.jldwbm,smbm,imbj_dzbj.dj,imbj_dzbj.gycl";
	ls_sql+=" from imbj_dzbj ";
	ls_sql+=" order by imbj_dzbj.xh";
//	out.println(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		count++;

		lrxh=rs1.getString("xh");
		xmbh=cf.fillNull(rs1.getString("xmbh"));
		smbmstr=cf.fillNull(rs1.getString("smbm"));
		dj=rs1.getDouble("dj");

		xmmc=rs1.getString("xmmc");
		jldwbmstr=cf.fillNull(rs1.getString("jldwbm"));
		gycl=rs1.getString("gycl");

/*
		if (!xmbh.equals(""))
		{
			jsq=1;
			xmmc=rs1.getString("xmmc");
			jldwbmstr=cf.fillNull(rs1.getString("jldwbm"));
			gycl=rs1.getString("gycl");
			oldxmbh=xmbh;
		}
		else{
			jsq++;
			xmbh=oldxmbh;
		}

		xmbh=xmbh+"-"+jsq;
*/

		ls_sql ="select zjmc";
		ls_sql+=" from imbj_dezm ";
		ls_sql+=" where debh='"+xmbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			xmxlbmstr=rs.getString("zjmc");
		}
		else{
			conn.rollback();
			out.println("<BR>[提醒]无项目编号:"+xmbh);
			return;
		}
		rs.close();
		ps.close();


//		out.println("<BR>zcmc="+zcmc+";xh="+xh);


		ls_sql ="select xmxlbm";
		ls_sql+=" from bdm_xmxlbm ";
		ls_sql+=" where xmxlmc='"+xmxlbmstr+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			xmxlbm=rs.getString("xmxlbm");
		}
		else{
			conn.rollback();
			out.println("<BR>lrxh="+lrxh);
			out.println("<BR>[提醒]无项目小类编码:"+xmxlbmstr);
			return;
		}
		rs.close();
		ps.close();

		ls_sql ="select jldwbm";
		ls_sql+=" from jdm_jldwbm ";
		ls_sql+=" where jldwmc='"+jldwbmstr+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			jldwbm=rs.getString("jldwbm");
		}
		else{
			conn.rollback();
			out.println("<BR>lrxh="+lrxh);
			out.println("<BR>[提醒]无计量单位编码:"+jldwbmstr);
			return;
		}
		rs.close();
		ps.close();

		if (!smbmstr.equals(""))
		{
			ls_sql ="select smbm";
			ls_sql+=" from bdm_smbm ";
			ls_sql+=" where smmc='"+smbmstr+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				smbm=rs.getString("smbm");
			}
			else{
				conn.rollback();
				out.println("<BR>lrxh="+lrxh);
				out.println("<BR>[提醒]无饰面编码:"+smbmstr);
				return;
			}
			rs.close();
			ps.close();
		}
		else{
			smbm="";
		}


		wybh=cf.addZero(count+start,6);
		xh=count+start;
	

		ls_sql="insert into bj_jzbjb (wybh,dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,abj,bbj,cbj,bjlx,lrr,lrsj,shbz,agycl,bgycl,cgycl,xh) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wybh);
		ps.setString(2,dqbm);
		ps.setString(3,xmbh);
		ps.setString(4,xmmc);
		ps.setString(5,xmdlbm);
		ps.setString(6,xmxlbm);
		ps.setString(7,smbm);
		ps.setString(8,jldwbm);
		ps.setDouble(9,dj);
		ps.setDouble(10,0);
		ps.setDouble(11,0);
		ps.setString(12,bjlx);
		ps.setString(13,lrr);
		ps.setDate(14,lrsj);
		ps.setString(15,shbz);
		ps.setString(16,gycl);
		ps.setString(17,"");
		ps.setString(18,"");
		ps.setInt(19,xh);
			
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	
	conn.commit();

	out.print("<BR>数据导入成功，共导入记录数："+count);
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	out.println("<BR>lrxh="+lrxh);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
