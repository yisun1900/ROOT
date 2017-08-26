<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=request.getParameter("fgsbh");
String khbh=request.getParameter("khbh");
String khbh2=request.getParameter("khbh2");
String khxm=cf.GB2Uni(request.getParameter("khxm"));


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
	String khjl=null;
	ls_sql="select hth,zxdm,sjsbh,sjs,khjl";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  ssfgs='"+fgsbh+"' and khxm='"+khxm+"' and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=rs.getString("hth");
		dwbh=rs.getString("zxdm");
		sjsbh=rs.getString("sjsbh");
		sjs=rs.getString("sjs");
		khjl=rs.getString("khjl");
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！转入客户不存在"+ls_sql);
		return;
	}
	rs.close();
	ps.close();

	String hth2=null;
	ls_sql="select hth";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  ssfgs='"+fgsbh+"' and khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth2=rs.getString(1);
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！转出客户不存在");
		return;
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="update jc_zcdd set fgsbh=?,qddm=?,jzsjs=?,khjl=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khjl);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcddmx set fgsbh=?,qddm=?,jzsjs=?,khjl=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khjl);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcshd set khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcshmx set khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set fgsbh=?,qddm=?,jzsjs=?,khjl=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khjl);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_jcdd set fgsbh=?,qddm=?,jzsjs=?,khjl=?,khbh=?";
	ls_sql+=" where  khbh='"+khbh2+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,dwbh);
	ps.setString(3,sjs);
	ps.setString(4,khjl);
	ps.setString(5,khbh);
	ps.executeUpdate();
	ps.close();

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		String zxdm=null;
		ls_sql="SELECT zxdm";
		ls_sql+=" FROM crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zxdm=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		String xmzy=null;
		ls_sql="SELECT xmzy";
		ls_sql+=" FROM jc_jcdd";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmzy=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		String lrr=(String)session.getAttribute("yhmc");

		//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql="insert into crm_khxx ( khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,dwbh,fgsbh,khjl,xxlysm,sjs,sjsgh,lrsj             ,lrr,bz    ,zt,tsbz,pdclzt,ybjbz   ,sfxhf,kpbz,bxbz,hfdjbz,sjssjfjsbz,htshbz ,sffj,sfyrz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,gcjdbm,hdbz,xmzy,zjxwcbz,sffk,wtkhbz,khjsbz,sjhtsjf,wdzgce,qye,zjjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,zqsuijin,zqzjxsuijin,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,fjtcbz,zhhtzcbj,zqhtzcbj,suijin,zqguanlif,guanlif,zqwjrqyexm,zhwjrqyexm,zqqtsf,zhqtsf) ";
		ls_sql+=" select               khbh,hth,sfzhm,khxm,xb,fwdz,lxfs,qtdh,khlxbm,cqbm,csrq,zybm,fj,?   ,ssfgs,khjl,xxlysm,sjs,sjsgh,TRUNC(SYSDATE)   ,?  ,bz    ,'4','N','4'   ,'N'     ,'N'  ,'Y' ,'N' ,'0'   ,'0'       ,'Y'    ,'N' ,'N'  ,'1'   ,'0'   ,'0'    ,'0'    ,'0'   ,'1' ,?   ,'1'    ,'N' ,'N'   ,'N'   ,NVL(sjhtje,0) ,0     ,0  ,'0'   ,'N'   ,0       ,0      ,0     ,0       ,0          ,sjsbh,ywy,ywyssxz,ywybm,clgw,xjf,hxbm,bjjb,fwmj,'M'   ,0       ,0,0,0,0,0,0,0,0";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zxdm);
		ps.setString(2,lrr);
		ps.setString(3,xmzy);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set sfjczjz='1'";//1：是；2：否
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("转移成功！");
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
