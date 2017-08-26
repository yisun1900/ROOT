<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String zxdm=cf.GB2Uni(request.getParameter("zxdm"));
String sjsbh=cf.GB2Uni(request.getParameter("sjsbh"));


String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String yzxdm=null;
java.sql.Date yzxdmfpsj=null;
java.sql.Date zxdmfpsj=null;

int count=0;

try {
	conn=cf.getConnection();

	if (zxdm==null || zxdm.equals(""))
	{
		out.println("错误！咨询店面为空");
		return;
	}

	int fpsj=0;
	String yzxzt=null;
	String ssfgs=null;
	String ykhfwjlh=null;
	String ydmjdjlh=null;
	ls_sql="select zxzt,ssfgs,zxdm,zxdmfpsj,SYSDATE-zxdmfpsj fpsj,khfwjlh,dmjdjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yzxzt=rs.getString("zxzt");
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yzxdm=cf.fillNull(rs.getString("zxdm"));
		yzxdmfpsj=rs.getDate("zxdmfpsj");
		fpsj=rs.getInt("fpsj");
		ykhfwjlh=rs.getString("khfwjlh");
		ydmjdjlh=rs.getString("dmjdjlh");
	}
	ps.close();
	rs.close();
	if (yzxdmfpsj==null)
	{
		fpsj=20;
	}




	String zt="";
	ls_sql="select zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=rs.getString("zt");
	}
	rs.close();
	ps.close();

	String dmjdjlh=null;//操作序号
	ls_sql="select NVL(max(substr(dmjdjlh,8,3)),0)";
	ls_sql+=" from  crm_dmjdjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	dmjdjlh=wherekhbh+cf.addZero(count+1,3);

	String khfwjlh=null;//操作序号
	ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	khfwjlh=wherekhbh+cf.addZero(count+1,3);


	conn.setAutoCommit(false);
	String zxzt="1";//1: 分配店面

	if (yzxdm.equals(zxdm))//未改变
	{
		ls_sql="update crm_zxkhxx set sjsbh=?,sjs=null,sjsfpsj=null,zxzt=?";//zxzt,0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		ls_sql+=" where  (khbh='"+wherekhbh+"')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjsbh);
		ps.setString(2,zxzt);
		ps.executeUpdate();
		ps.close();
	}
	else{
		zxdmfpsj=cf.getDate();

		if (fpsj<2)//2天内不插入新记录，只做修改
		{
			ls_sql="update crm_dmjdjl set zxdm=?";
			ls_sql+=" where  (dmjdjlh='"+ydmjdjlh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhfwjl set zxdm=?";
			ls_sql+=" where  (khfwjlh='"+ykhfwjlh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set zxdm=?,zxdmfpsj=?,sjsbh=?,sjs=null,sjsfpsj=null,zxzt=?";//zxzt,0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
			ls_sql+=" where  (khbh='"+wherekhbh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setDate(2,zxdmfpsj);
			ps.setString(3,sjsbh);
			ps.setString(4,zxzt);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//插入：店面接单记录（crm_dmjdjl）
			ls_sql="insert into crm_dmjdjl (dmjdjlh,khbh,ssfgs,zxdm,kssj,kslrr,ydmjdjlh,zxzt)";
			ls_sql+=" values ( ?,?,?,?,TRUNC(SYSDATE),?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,dmjdjlh);
			ps.setString(2,wherekhbh);
			ps.setString(3,ssfgs);
			ps.setString(4,zxdm);
			ps.setString(5,yhmc);
			ps.setString(6,ydmjdjlh);
			ps.setString(7,zxzt);
			ps.executeUpdate();
			ps.close();


			//插入表：咨询客户服务记录（crm_zxkhfwjl）
			ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,czlx,xzxzt,yzxzt,yzxdm,lrr,lrsj,lrbm,ykhfwjlh)";
			ls_sql+=" values ( ?,?,?,?,'5',?,?,?,?,TRUNC(SYSDATE),?,?)";//5: 分配店面
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khfwjlh);
			ps.setString(2,wherekhbh);
			ps.setString(3,ssfgs);
			ps.setString(4,zxdm);
			ps.setString(5,zxzt);
			ps.setString(6,yzxzt);
			ps.setString(7,yzxdm);
			ps.setString(8,yhmc);
			ps.setString(9,dwbh);
			ps.setString(10,ykhfwjlh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set zxdm=?,zxdmfpsj=?,sjsbh=?,sjs=null,sjsfpsj=null,zxzt=?,khfwjlh=?,dmjdjlh=?";//zxzt,0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
			ls_sql+=" where  (khbh='"+wherekhbh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setDate(2,zxdmfpsj);
			ps.setString(3,sjsbh);
			ps.setString(4,zxzt);
			ps.setString(5,khfwjlh);
			ps.setString(6,dmjdjlh);
			ps.executeUpdate();
			ps.close();
		}
	}

	ls_sql="update crm_khxx set fgsbh=?,dwbh=?,sjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();

//		out.println(ls_sql);

	//更新集成订单＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
	ls_sql="update jc_jcdd set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmydd set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_mmzjx set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_cgdd set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_cgzjx set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjdd set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_jjzjx set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_zcdd set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	ls_sql="update jc_zczjx set fgsbh=?,qddm=?,jzsjs=''";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,zxdm);
	ps.executeUpdate();
	ps.close();
	//更新集成订单－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－


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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>