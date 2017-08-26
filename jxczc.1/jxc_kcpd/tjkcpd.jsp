<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=null;
String xuhao=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String clbm=null;
String gg =null;
String xh=null;
String nbbm=null;
String clmc=null;
double pdzcyl=0;
double kczcpsl =0;
double kcccpsl =0;
double kcbfpsl =0;
double pdzcpsl =0;
double pdccpsl =0;
double pdbfpsl =0;
double pdcl=0;
double zcppdcyl=0;
double pdkczsl=0;
double sjkczsl=0;
String pdjg="3";
long pdxh=0;
long longpdph=0;
int bbu=0;  
int ssds=0;
int sj=0;
String pdph=null;
pdph=cf.GB2Uni(request.getParameter("pdph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	//检查是否录入了数据
	ls_sql=" select count(pdph) sj";
	ls_sql+=" from jxc_kcpdmx ";
	ls_sql+=" where pdph='"+pdph+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	if (rs.next())
	{
		sj=rs.getInt("sj");
	}
	rs.close();
	ps.close();
	if (sj<=0)
	{
		out.print("您还没有录入数据，不能提交！！！");
		return;
	}
	else
	{
		//修改盘点批号状态
		ls_sql="update jxc_kcpdjl set pdzt='2' ";
		ls_sql+=" where  (pdph='"+pdph+"')  ";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			out.println("<BR>存盘失败！");
		}
		else
		{
		}
			if (ps != null) ps.close();
	}
	//查询地区编码
	ls_sql="select ckbh,dqbm,pdph ";
	ls_sql+=" from jxc_kcpdjl ";
	ls_sql+=" where  (pdph='"+pdph+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ckbh=cf.fillNull(rs.getString("ckbh"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		longpdph=rs.getLong("pdph");
	}
	rs.close();
	ps.close();
	//生成盘点序号
	ls_sql="select MAX(pdxh)+1 pdxh ";
	ls_sql+=" from  jxc_kcpdmx";
	ls_sql+=" where  (pdph="+pdph+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdxh=rs.getLong("pdxh");
		if (pdxh==0)
		{pdxh=pdxh+1;}
	}
	rs.close();
	ps.close();
	//查询地区内的材料编码
	ls_sql="select jxc_cljgb.clbm clbm,clmc,xh,gg,nbbm ";
	ls_sql+=" from jxc_cljgb,jxc_clbm ";
	ls_sql+=" where  (dqbm='"+dqbm+"') and jxc_clbm.clbm=jxc_cljgb.clbm and cllb='0' and xsfs in ('2','3') ";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery(ls_sql);
	while (rs2.next())
	{
		
		clbm=cf.fillNull(rs2.getString("clbm"));
		clmc=cf.fillNull(rs2.getString("clmc"));
		xh=cf.fillNull(rs2.getString("xh"));
		gg=cf.fillNull(rs2.getString("gg"));
		nbbm=cf.fillNull(rs2.getString("nbbm"));
		//查询盘点记录里面是否已经盘点了此条码
		ls_sql="select count(*) ";
		ls_sql+=" from jxc_kcpdmx ";
		ls_sql+=" where  (pdph='"+pdph+"') and clbm='"+clbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ssds=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (ssds<=0)//说明没有盘点 写入数据
		{
			
			for (int m=1;m<4;m++)//1：正常品；2：残次品；3：报废品；
			{
				ls_sql="SELECT sum(kcsl) kcsl ";
				ls_sql+=" FROM jxc_kcb ";
				ls_sql+=" where jxc_kcb.ckbh='"+ckbh+"' and cllb='0' and clbm='"+clbm+"' and zljb='"+m+"'  ";
				ps= conn.prepareStatement(ls_sql+"<br>");
				rs =ps.executeQuery(ls_sql);
	//			out.print(ls_sql);
				if (rs.next())
				{
					if (m==1)
					{
						kczcpsl=rs.getDouble("kcsl");
					}
					else if (m==2)
					{
						kcccpsl=rs.getDouble("kcsl");
					}
					else if (m==3)
					{
						kcbfpsl=rs.getDouble("kcsl");
					}
				}
				else
				{
					if (m==1)
					{kczcpsl=0;}
					else if (m==2)
					{kcccpsl=0;}
					else if (m==3)
					{kcbfpsl=0;}
				}
				rs.close();
				ps.close();
			}
			zcppdcyl=pdzcpsl-kczcpsl;
			sjkczsl=kczcpsl+kcccpsl+kcbfpsl;
			pdkczsl=pdzcpsl+pdccpsl+pdbfpsl;
			pdzcyl=pdkczsl-sjkczsl;
			if (pdzcyl>0)//1：盘盈；2：盘亏；3：盘平
			{pdjg="1";}
			else if (pdzcyl<0)
			{pdjg="2";}
			else
			{pdjg="3";}
			//将盘点结果写入数据库
			ls_sql="insert into jxc_kcpdmx ( pdph,pdxh,dqbm,ckbh,clbm,clmc,xh,gg,nbbm,kczcpsl,kcccpsl,kcbfpsl,pdzcpsl,pdccpsl,pdbfpsl,zcppdcyl,pdzcyl,pdjg ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,longpdph);
			ps.setLong(2,pdxh);
			ps.setString(3,dqbm);
			ps.setString(4,ckbh);
			ps.setString(5,clbm);
			ps.setString(6,clmc);
			ps.setString(7,xh);
			ps.setString(8,gg);
			ps.setString(9,nbbm);

			ps.setDouble(10,kczcpsl);
			ps.setDouble(11,kcccpsl);
			ps.setDouble(12,kcbfpsl);
			ps.setDouble(13,pdzcpsl);
			ps.setDouble(14,pdccpsl);
			ps.setDouble(15,pdbfpsl);

			ps.setDouble(16,zcppdcyl);
			ps.setDouble(17,pdzcyl);
			ps.setString(18,pdjg);
			if (ps.executeUpdate()!=1)
			{
				out.println("<BR>存盘失败！");
				conn.rollback();return;
			}
			if (ps != null) ps.close(); 
		}
		pdxh++;
	}
	rs2.close();
	ps2.close();
	//检查地区材料里面存在的材料

	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
		alert("存盘成功！！");
		window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>