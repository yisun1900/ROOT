<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String[] khbh=request.getParameterValues("khbh");
String zxdm=cf.GB2Uni(request.getParameter("zxdm"));
String ghdmyy=cf.GB2Uni(request.getParameter("ghdmyy"));
String dianz=cf.GB2Uni(request.getParameter("dianz"));

if (zxdm==null || zxdm.equals(""))
{
	out.println("错误！咨询店面为空");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;
java.sql.Date zxdmfpsj=null;

try {
	conn=cf.getConnection();

	int fpsj=0;

	String ssfgs=null;
	String yzxzt=null;
	String ysfxhf=null;
	java.sql.Date yhfrq=null;
	String yzxdm=null;
	String ysjs=null;
	String ysbyybm=null;
	String ykhfwjlh=null;
	String ydmjdjlh=null;
	String ysjsjdjlh=null;
	java.sql.Date yzxdmfpsj=null;

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="select ssfgs,zxzt,sfxhf,hfrq,zxdm,sjs,sbyybm,khfwjlh,dmjdjlh,sjsjdjlh,zxdmfpsj,SYSDATE-zxdmfpsj fpsj";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			yzxzt=rs.getString("zxzt");
			ysfxhf=rs.getString("sfxhf");
			yhfrq=rs.getDate("hfrq");
			yzxdm=cf.fillNull(rs.getString("zxdm"));
			ysjs=cf.fillNull(rs.getString("sjs"));
			ysbyybm=cf.fillNull(rs.getString("sbyybm"));
			ykhfwjlh=cf.fillNull(rs.getString("khfwjlh"));
			ydmjdjlh=cf.fillNull(rs.getString("dmjdjlh"));
			ysjsjdjlh=cf.fillNull(rs.getString("sjsjdjlh"));
			yzxdmfpsj=rs.getDate("zxdmfpsj");
			fpsj=rs.getInt("fpsj");
		}
		ps.close();
		rs.close();

		if (yzxdmfpsj==null)
		{
			fpsj=20;
		}

		String dmjdjlh=null;//操作序号
		ls_sql="select NVL(max(substr(dmjdjlh,8,3)),0)";
		ls_sql+=" from  crm_dmjdjl";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		dmjdjlh=khbh[i]+cf.addZero(count+1,3);

		String khfwjlh=null;//操作序号
		ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
		ls_sql+=" from  crm_zxkhfwjl";
		ls_sql+=" where khbh='"+khbh[i]+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		khfwjlh=khbh[i]+cf.addZero(count+1,3);


		String zxzt="5";


		zxdmfpsj=cf.getDate();

		if (!yzxzt.equals("2") && fpsj<2 )//2天内只做修改，0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
		{
			ls_sql="update crm_dmjdjl set zxdm=?,kslrr=?,kssj=TRUNC(SYSDATE)";
			ls_sql+=" where  (dmjdjlh='"+ydmjdjlh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setString(2,yhmc);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhfwjl set zxdm=?,lrr=?,lrsj=TRUNC(SYSDATE),lrbm=?";
			ls_sql+=" where  (khfwjlh='"+ykhfwjlh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setString(2,yhmc);
			ps.setString(3,dwbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set zxdm=?,zxdmfpsj=?";//zxzt,0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
			ls_sql+=" where  (khbh='"+khbh[i]+"') ";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setDate(2,zxdmfpsj);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//结束：店面接单记录（crm_dmjdjl）
			ls_sql="update crm_dmjdjl set jssj=TRUNC(SYSDATE),jslrr=?,sbyyxs='"+ghdmyy+"'";
			ls_sql+=" where  dmjdjlh='"+ydmjdjlh+"' and jssj is null";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,yhmc);
			ps.executeUpdate();
			ps.close();


			//插入：店面接单记录（crm_dmjdjl）
			ls_sql="insert into crm_dmjdjl (dmjdjlh,khbh,ssfgs,zxdm,kssj,kslrr,ydmjdjlh,zxzt)";
			ls_sql+=" values ( ?,?,?,?,TRUNC(SYSDATE),?,?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,dmjdjlh);
			ps.setString(2,khbh[i]);
			ps.setString(3,ssfgs);
			ps.setString(4,zxdm);
			ps.setString(5,yhmc);
			ps.setString(6,ydmjdjlh);
			ps.setString(7,zxzt);
			ps.executeUpdate();
			ps.close();


			//插入表：咨询客户服务记录（crm_zxkhfwjl）
			ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,czlx,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,ysbyybm,ykhfwjlh,lrr,lrsj,lrbm)";
			ls_sql+=" values ( ?,?,?,?,'6',?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),?)";//6：换店面
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khfwjlh);
			ps.setString(2,khbh[i]);
			ps.setString(3,ssfgs);
			ps.setString(4,zxdm);
			ps.setString(5,zxzt);
			ps.setString(6,yzxzt);
			ps.setString(7,ysfxhf);
			ps.setDate(8,yhfrq);
			ps.setString(9,yzxdm);
			ps.setString(10,ysjs);
			ps.setString(11,ysbyybm);
			ps.setString(12,ykhfwjlh);
			ps.setString(13,yhmc);
			ps.setString(14,dwbh);
			ps.executeUpdate();
			ps.close();
		

			ls_sql="update crm_zxkhxx set zxdm=?,zxdmfpsj=?,zxzt=?,khfwjlh=?,dmjdjlh=?";//zxzt,0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
			ls_sql+=" where  (khbh='"+khbh[i]+"') ";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,zxdm);
			ps.setDate(2,zxdmfpsj);
			ps.setString(3,zxzt);
			ps.setString(4,khfwjlh);
			ps.setString(5,dmjdjlh);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql="update crm_zxkhxx set gdczlx='6',dianz=?,gdczr=?,gdczsj=SYSDATE";
		ls_sql+=" where  khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dianz);
		ps.setString(2,yhmc);
		ps.executeUpdate();
		ps.close();


		ls_sql="update crm_khxx set fgsbh=?,dwbh=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();

//			out.println(ls_sql);

		//更新集成订单＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
		ls_sql="update jc_jcdd set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_mmydd set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_mmzjx set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_cgdd set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_cgzjx set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_jjdd set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_jjzjx set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_zcdd set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_zcddmx set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_zczjx set fgsbh=?,qddm=?";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ssfgs);
		ps.setString(2,zxdm);
		ps.executeUpdate();
		ps.close();
		//更新集成订单－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
	}



	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("更换成功！");
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