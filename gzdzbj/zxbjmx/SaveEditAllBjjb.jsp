<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));

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

double abj=0;
String agycl=null;
double bbj=0;
String bgycl=null;
double cbj=0;
String cgycl=null;

double azcf=0;
double aclf=0;
double argf=0;
double ajjf=0;
double aglfbl=0;

double bzcf=0;
double bclf=0;
double brgf=0;
double bjjf=0;
double bglfbl=0;

double czcf=0;
double cclf=0;
double crgf=0;
double cjjf=0;
double cglfbl=0;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//更新报价
	if (jzbz.equals("1"))//1：家装；2：公装
	{
		//删除客户工料分析表（bj_khglfxb）
		ls_sql="delete from bj_khglfxb";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//报价项目明细
		ls_sql="select bj_bjxmmx.xmbh,bj_jzbjb.ckxm,bj_jzbjb.bjlx,bj_jzbjb.xmmc,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_bjxmmx.dqbm";
		ls_sql+=" ,abj,agycl,bbj,bgycl,cbj,cgycl";
		ls_sql+=" from  bj_bjxmmx,bj_jzbjb";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.xmbh=bj_jzbjb.xmbh and bj_bjxmmx.dqbm=bj_jzbjb.dqbm";
		ls_sql+=" order by bj_bjxmmx.xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmbh=rs1.getString("xmbh");
			ckxm=rs1.getString("ckxm");
			bjlx=rs1.getString("bjlx");
			xmmc=rs1.getString("xmmc");
			xmdlbm=rs1.getString("xmdlbm");
			xmxlbm=rs1.getString("xmxlbm");
			dqbm=rs1.getString("dqbm");

			abj=rs1.getDouble("abj");
			agycl=cf.fillNull(rs1.getString("agycl"));
			bbj=rs1.getDouble("bbj");
			bgycl=cf.fillNull(rs1.getString("bgycl"));
			cbj=rs1.getDouble("cbj");
			cgycl=cf.fillNull(rs1.getString("cgycl"));

			if (bjjb.equals("A"))//A:中级;B:中高级;C:峰翼
			{
				ls_sql="update bj_bjxmmx";
				ls_sql+=" set bjjb='A'"+",dj="+abj+",gycl='"+agycl+"'";
				ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (bjjb.equals("B"))//A:中级;B:中高级;C:峰翼
			{
				ls_sql="update bj_bjxmmx";
				ls_sql+=" set bjjb='B'"+",dj="+bbj+",gycl='"+bgycl+"'";
				ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (bjjb.equals("C"))//A:中级;B:中高级;C:峰翼
			{
				ls_sql="update bj_bjxmmx";
				ls_sql+=" set bjjb='C'"+",dj="+cbj+",gycl='"+cgycl+"'";
				ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				conn.rollback();
				out.println("<BR>错误！无报价级别");
				return;
			}

			//客户工料分析表（bj_khglfxb）
			if (bjlx.equals("1"))//1:标准项目;2:自定义项目
			{
				ls_sql="insert into bj_khglfxb (khbh,bjjb,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
				ls_sql+=" select ?,?,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
				ls_sql+=" from bj_jzglfxb ";
				ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjb='"+bjjb+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,bjjb);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into bj_khglfxb (khbh,bjjb,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
				ls_sql+=" select ?,?,glbxh,?,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
				ls_sql+=" from bj_jzglfxb ";
				ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjb='"+bjjb+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,bjjb);
				ps.setString(3,dqbm);
				ps.setString(4,xmbh);
				ps.executeUpdate();
				ps.close();
			}
		
		}
		rs1.close();
		ps1.close();

	}
	else{
		//删除客户工料分析表（bj_khglfxb）
		ls_sql="delete from bj_khglfxb";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//报价项目明细
		ls_sql="select bj_bjxmmx.xmbh,bj_gzbjb.ckxm,bj_gzbjb.bjlx,bj_gzbjb.xmmc,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_bjxmmx.dqbm";
		ls_sql+=" ,abj,agycl,bbj,bgycl,cbj,cgycl";
		ls_sql+=" ,azcf,aclf,argf,ajjf,aglfbl,bzcf,bclf,brgf,bjjf,bglfbl,czcf,cclf,crgf,cjjf,cglfbl";
		ls_sql+=" from  bj_bjxmmx,bj_gzbjb";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.xmbh=bj_gzbjb.xmbh and bj_bjxmmx.dqbm=bj_gzbjb.dqbm";
		ls_sql+=" order by bj_bjxmmx.xh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			xmbh=rs1.getString("xmbh");
			ckxm=rs1.getString("ckxm");
			bjlx=rs1.getString("bjlx");
			xmmc=rs1.getString("xmmc");
			xmdlbm=rs1.getString("xmdlbm");
			xmxlbm=rs1.getString("xmxlbm");
			dqbm=rs1.getString("dqbm");

			abj=rs1.getDouble("abj");
			agycl=cf.fillNull(rs1.getString("agycl"));
			bbj=rs1.getDouble("bbj");
			bgycl=cf.fillNull(rs1.getString("bgycl"));
			cbj=rs1.getDouble("cbj");
			cgycl=cf.fillNull(rs1.getString("cgycl"));

			azcf=rs1.getDouble("azcf");
			aclf=rs1.getDouble("aclf");
			argf=rs1.getDouble("argf");
			ajjf=rs1.getDouble("ajjf");
			aglfbl=rs1.getDouble("aglfbl");

			bzcf=rs1.getDouble("bzcf");
			bclf=rs1.getDouble("bclf");
			brgf=rs1.getDouble("brgf");
			bjjf=rs1.getDouble("bjjf");
			bglfbl=rs1.getDouble("bglfbl");

			czcf=rs1.getDouble("czcf");
			cclf=rs1.getDouble("cclf");
			crgf=rs1.getDouble("crgf");
			cjjf=rs1.getDouble("cjjf");
			cglfbl=rs1.getDouble("cglfbl");

			if (bjjb.equals("A"))//A:中级;B:中高级;C:峰翼
			{
				ls_sql="update bj_bjxmmx";
				ls_sql+=" set bjjb='A'"+",dj="+abj+",gycl='"+agycl+"'";
				ls_sql+=" ,zcf="+azcf+",fcf="+aclf+",rgf="+argf+",jjf="+ajjf+",glfbl="+aglfbl;
				ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (bjjb.equals("B"))//A:中级;B:中高级;C:峰翼
			{
				ls_sql="update bj_bjxmmx";
				ls_sql+=" set bjjb='B'"+",dj="+bbj+",gycl='"+bgycl+"'";
				ls_sql+=" ,zcf="+bzcf+",fcf="+bclf+",rgf="+brgf+",jjf="+bjjf+",glfbl="+bglfbl;
				ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else if (bjjb.equals("C"))//A:中级;B:中高级;C:峰翼
			{
				ls_sql="update bj_bjxmmx";
				ls_sql+=" set bjjb='C'"+",dj="+cbj+",gycl='"+cgycl+"'";
				ls_sql+=" ,zcf="+czcf+",fcf="+cclf+",rgf="+crgf+",jjf="+cjjf+",glfbl="+cglfbl;
				ls_sql+=" where  khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				conn.rollback();
				out.println("<BR>错误！无报价级别");
				return;
			}


			//客户工料分析表（bj_khglfxb）
			if (bjlx.equals("1"))//1:标准项目;2:自定义项目
			{
				ls_sql="insert into bj_khglfxb (khbh,bjjb,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
				ls_sql+=" select ?,?,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
				ls_sql+=" from bj_gzglfxb ";
				ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjb='"+bjjb+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,bjjb);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql="insert into bj_khglfxb (khbh,bjjb,glbxh,dqbm,xmbh,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj) ";
				ls_sql+=" select ?,?,glbxh,?,?,glflbm,glmc,pp,xhgg,jldwbm,xhl,dj";
				ls_sql+=" from bj_gzglfxb ";
				ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+ckxm+"' and bjjb='"+bjjb+"' ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,bjjb);
				ps.setString(3,dqbm);
				ps.setString(4,xmbh);
				ps.executeUpdate();
				ps.close();
			}
		}
		rs1.close();
		ps1.close();

	}


	//获取：电子报价总额
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	double dzbjze=dzbj.getBjje(conn,khbh,"hd");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,jzbz=?,bjjb=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.setString(2,jzbz);
	ps.setString(3,bjjb);
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

