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

String[] sjss=request.getParameterValues("sjs");
String sjs=cf.GB2Uni(sjss[0]);


String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ysjs=null;
java.sql.Date ysjsfpsj=null;
java.sql.Date sjsfpsj=null;

int count=0;
String sjsgh="";

try {
	conn=cf.getConnection();

	int fpsj=0;
	String yzxdm=null;
	String yzxzt=null;
	String ssfgs=null;
	String ykhfwjlh=null;
	String ysjsjdjlh=null;
	ls_sql="select zxdm,zxzt,ssfgs,sjs,sjsfpsj,SYSDATE-sjsfpsj fpsj,khfwjlh,sjsjdjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yzxdm=rs.getString("zxdm");
		yzxzt=rs.getString("zxzt");
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ysjs=cf.fillNull(rs.getString("sjs"));
		ysjsfpsj=rs.getDate("sjsfpsj");
		fpsj=rs.getInt("fpsj");
		ykhfwjlh=rs.getString("khfwjlh");
		ysjsjdjlh=rs.getString("sjsjdjlh");
	}
	ps.close();
	rs.close();
	if (ysjsfpsj==null)
	{
		fpsj=20;
	}

	if (sjs==null || sjs.equals(""))
	{
		out.println("错误！设计师为空");
		return;
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

	String sjsjdjlh=null;//操作序号
	ls_sql="select NVL(max(substr(sjsjdjlh,8,3)),0)";
	ls_sql+=" from  crm_sjsjdjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	sjsjdjlh=wherekhbh+cf.addZero(count+1,3);

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

	ls_sql="delete from crm_jzsjs  ";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	int row=0;
	for (int i=1;i<sjss.length ;i++ )
	{
		if (sjss[i].equals(""))
		{
			continue;
		}

		row++;

		ls_sql="insert into crm_jzsjs  (khbh,sjs,xh)";
		ls_sql+=" values ( ?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,wherekhbh);
		ps.setString(2,cf.GB2Uni(sjss[i]));
		ps.setInt(3,row);
		ps.executeUpdate();
		ps.close();

	}

	ls_sql="select count(*)";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+wherekhbh+"'  and sjs='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		conn.rollback();
		out.println("错误！主设计师与其他设计师重复");
		return;
	}

	if (ysjs.equals(sjs))//未改变
	{
		sjsfpsj=ysjsfpsj;

		ls_sql="update crm_zxkhxx set sjsbh=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
		ls_sql+=" where  (khbh='"+wherekhbh+"')";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjsbh);
		ps.executeUpdate();
		ps.close();
	}
	else{
		sjsfpsj=cf.getDate();

		ls_sql="select sq_yhxx.ygbh";
		ls_sql+=" from  sq_yhxx,sq_sqbm";
		ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' ";
		ls_sql+=" and sq_yhxx.yhmc ='"+sjs+"' and sq_yhxx.zwbm in('23','04') and sq_yhxx.sfzszg in('Y','N')";//04:设计师
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsgh=cf.fillNull(rs.getString("ygbh"));
		}
		else{
			conn.rollback();
			out.println("<BR>错误！该单位无此设计师");
			return;
		}
		rs.close();
		ps.close();


		if (fpsj<2)//2天内不做记录
		{
			ls_sql="update crm_sjsjdjl set sjs=?,kslrr=?,kssj=TRUNC(SYSDATE)";
			ls_sql+=" where  (sjsjdjlh='"+ysjsjdjlh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjs);
			ps.setString(2,yhmc);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhfwjl set sjs=?,lrr=?,lrsj=TRUNC(SYSDATE),lrbm=?";
			ls_sql+=" where  (khfwjlh='"+ykhfwjlh+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjs);
			ps.setString(2,yhmc);
			ps.setString(3,dwbh);
			ps.executeUpdate();
			ps.close();


			ls_sql="update crm_zxkhxx set sjs=?,sjsfpsj=?,sjsbh=?,sjsgh=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
			ls_sql+=" where  (khbh='"+wherekhbh+"')";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjs);
			ps.setDate(2,sjsfpsj);
			ps.setString(3,sjsbh);
			ps.setString(4,sjsgh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			//插入表：设计师接单记录（crm_sjsjdjl）
			ls_sql="insert into crm_sjsjdjl  (sjsjdjlh,khbh,ssfgs,zxdm,sjs,kssj,kslrr,zxzt)";
			ls_sql+=" values ( ?,?,?,?,?,TRUNC(SYSDATE),?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjsjdjlh);
			ps.setString(2,wherekhbh);
			ps.setString(3,ssfgs);
			ps.setString(4,zxdm);
			ps.setString(5,sjs);
			ps.setString(6,yhmc);
			ps.setString(7,yzxzt);
			ps.executeUpdate();
			ps.close();


			//插入表：咨询客户服务记录（crm_zxkhfwjl）
			ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,czlx,xzxzt,yzxzt,yzxdm,ysjs,lrr,lrsj,lrbm,ykhfwjlh)";
			ls_sql+=" values ( ?,?,?,?,?,'7',?,?,?,?,?,TRUNC(SYSDATE),?,?)";//7: 分配设计师
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khfwjlh);
			ps.setString(2,wherekhbh);
			ps.setString(3,ssfgs);
			ps.setString(4,zxdm);
			ps.setString(5,sjs);
			ps.setString(6,yzxzt);
			ps.setString(7,yzxzt);
			ps.setString(8,yzxdm);
			ps.setString(9,ysjs);
			ps.setString(10,yhmc);
			ps.setString(11,dwbh);
			ps.setString(12,ykhfwjlh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update crm_zxkhxx set sjs=?,sjsfpsj=?,sjsbh=?,khfwjlh=?,sjsjdjlh=?,sjsgh=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
			ls_sql+=" where  (khbh='"+wherekhbh+"')";
		//	out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sjs);
			ps.setDate(2,sjsfpsj);
			ps.setString(3,sjsbh);
			ps.setString(4,khfwjlh);
			ps.setString(5,sjsjdjlh);
			ps.setString(6,sjsgh);
			ps.executeUpdate();
			ps.close();
		}



		ls_sql="update crm_khxx set sjs=?,sjsgh=?,sjsbh=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.setString(3,sjsgh);
		ps.setString(2,sjsbh);
		ps.executeUpdate();
		ps.close();

		//更新集成订单＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋
		ls_sql="update jc_jcdd set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_mmydd set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_mmzjx set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_cgdd set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_cgzjx set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_jjdd set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_jjzjx set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update jc_zcdd set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_zcddmx set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		ls_sql="update jc_zczjx set jzsjs=?";
		ls_sql+=" where  khbh='"+wherekhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjs);
		ps.executeUpdate();
		ps.close();
		//更新集成订单－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
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