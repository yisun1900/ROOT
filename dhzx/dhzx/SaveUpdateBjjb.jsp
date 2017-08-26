<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String bjjb=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xmbh=null;
String ckxm=null;
String bjlx=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqbm=null;

double bj=0;
String gycl=null;

double zcf=0;
double clf=0;
double rgf=0;
double jjf=0;
double glfbl=0;

String[] khbh = request.getParameterValues("khbh");

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		//更新报价
		String zxzt=null;
		String sfzdzbj=null;
		ls_sql="select zxzt,sfzdzbj";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxzt=cf.fillNull(rs.getString("zxzt"));
			sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		}
		rs.close();
		ps.close();

		if (zxzt.equals("3") || zxzt.equals("4"))//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		{
			conn.rollback();
			out.println("<BR>错误！已签约或签单失败不能再修改报价级别："+khbh[i]);
			return;
		}

		if (!sfzdzbj.equals("Y"))
		{
			out.println("<BR>提醒！客户没做电子报价，不需修改报价级别："+khbh[i]);
			continue;
		}

		//报价项目明细
		ls_sql="select bj_bjxmmx.xmbh,bj_bjxmmx.dqbm";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh[i]+"'";
		ls_sql+=" order by bj_bjxmmx.xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmbh=rs1.getString("xmbh");
			dqbm=rs1.getString("dqbm");


			ls_sql="select bj_jzbjb.xmmc,bj_jzbjb.bj,bj_jzbjb.gycl";
			ls_sql+=" from  bj_jzbjb";
			ls_sql+=" where bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.xmbh='"+xmbh+"' and bj_jzbjb.dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xmmc=rs.getString("xmmc");
				bj=rs.getDouble("bj");
				gycl=cf.fillNull(rs.getString("gycl"));
			}
			else{
				conn.commit();
				out.println("<BR>错误！项目编号["+xmbh+"]不存在");
				return;
			}
			rs.close();
			ps.close();

			ls_sql="update bj_bjxmmx";
			ls_sql+=" set bjjb='"+bjjb+"',xmmc='"+xmmc+"',dj="+bj+",gycl='"+gycl+"'";
			ls_sql+=" where  khbh='"+khbh[i]+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		rs1.close();
		ps1.close();


		//更新其它收费项目，调整收费百分比
		dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
		dzbj.updateSfxm(conn,khbh[i],"yz");

		//获取电子报价金额
		dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
		double dzbjze=dzbjje.getAllBjje(conn,khbh[i],"yz");


		//修改：电子报价总额
		ls_sql="update crm_zxkhxx set dzbjze=?,bjjb=?";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,dzbjze);
		ps.setString(2,bjjb);
		ps.executeUpdate();
		ps.close();
	}



	conn.commit();

	out.println("<P>更新成功！");

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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

