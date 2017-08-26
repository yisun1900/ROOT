<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String[] tsjlh=request.getParameterValues("tsjlh");

String khhfqk=cf.GB2Uni(request.getParameter("khhfqk"));
String cxxwt=cf.GB2Uni(request.getParameter("cxxwt"));
String clfs=cf.GB2Uni(request.getParameter("clfs"));
String hfr=cf.GB2Uni(request.getParameter("hfr"));
String hfbm=cf.GB2Uni(request.getParameter("hfbm"));
java.sql.Date hfsj=null;
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回访时间]类型转换发生意外:"+e);
	return;
}

String[] dwbh=request.getParameterValues("dwbh");

java.sql.Date lsXchfrq=null;
java.sql.Date xchfrq=null;
ls=request.getParameter("xchfrq");
try{
	if (!(ls.equals("")))  xchfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xchfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次回访时间]类型转换发生意外:"+e);
	return;
}

String hffkbmclzt=request.getParameter("hffkbmclzt");

String tsyybm=null;
String sfjxhf=null;
java.sql.Date jasj=null;

String lx=null;
String ysfxhf=null;
java.sql.Date yhfsj=null;
String yhfjlh=null;
java.sql.Date yzxhfsj=null;
String yhfr=null;
String yclzt=null;


String hfjgbm=null;
String sfjslx=null;
String jsxbm=null;
String zzjgbm=null;

String yhfjgbm=null;
String ysfjslx=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

long lrxh=0;

try {
	conn=cf.getConnection();

	String hffgs=null;
	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+hfbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hffgs=rs.getString(1);
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(lrxh),0)";
	ls_sql+=" from  crm_tsjlhfmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lrxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tshfjl ( hfjlh,khbh,khhfqk,cxxwt,hfr,hfsj,hfbm,hffgs,clfs,xchfrq) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjlh);
	ps.setString(2,khbh);
	ps.setString(3,khhfqk);
	ps.setString(4,cxxwt);
	ps.setString(5,hfr);
	ps.setDate(6,hfsj);
	ps.setString(7,hfbm);
	ps.setString(8,hffgs);
	ps.setString(9,clfs);
	ps.setDate(10,xchfrq);
	ps.executeUpdate();
	ps.close();

	if (dwbh!=null)
	{
		for (int i=0;i<dwbh.length ;i++ )
		{
			ls_sql="insert into crm_tshffkbm (hfjlh,dwbh,clzt ) ";
			ls_sql+=" values (?,?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjlh);
			ps.setString(2,dwbh[i]);
			ps.setString(3,hffkbmclzt);
			ps.executeUpdate();
			ps.close();
		}
	}

	for (int i=0;i<tsjlh.length ;i++ )
	{
		//投诉记录回访明细（crm_tsjlhfmx）
		ls_sql="select sfxhf,hfsj,hfjlh,zxhfsj,hfr,clzt,lx";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ysfxhf=rs.getString("sfxhf");
			yhfsj=rs.getDate("hfsj");
			yhfjlh=rs.getString("hfjlh");
			yzxhfsj=rs.getDate("zxhfsj");
			yhfr=rs.getString("hfr");
			yclzt=rs.getString("clzt");
			lx=rs.getString("lx");
		}
		else{
			conn.rollback();
			out.println("错误！不存在的投诉记录号："+tsjlh[i]);
			return;
		}
		rs.close();
		ps.close();


		sfjxhf=request.getParameter("sfjxhf"+tsjlh[i]);
		if (sfjxhf==null)
		{
			conn.rollback();
			out.println("投诉报修记录号["+tsjlh[i]+"]错误！请选择【是否结案】");
			return;
		}
		if (sfjxhf.equals("Y"))//Y：不结案；N：结案
		{
			lsXchfrq=xchfrq;
			if (lsXchfrq==null )
			{
				conn.rollback();
				out.println("错误！因记录号["+tsjlh[i]+"]未结案，请选择【下次回访时间】");
				return;
			}
			jasj=null;
		}
		else{
			ls=request.getParameter("jasj"+tsjlh[i]);
			if (ls==null || ls.equals(""))
			{
				conn.rollback();
				out.println("投诉报修记录号["+tsjlh[i]+"]错误！请选择【结案时间】");
				return;
			}

			jasj=java.sql.Date.valueOf(ls.trim());

			lsXchfrq=null;
		}

	
		ls_sql="insert into crm_tsjlhfmx (hfjlh,tsjlh,sfjxhf,xchfrq,jasj,ysfxhf,yhfsj,yhfjlh,yzxhfsj,yhfr,yclzt,lrxh) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfjlh);
		ps.setString(2,tsjlh[i]);
		ps.setString(3,sfjxhf);
		ps.setDate(4,lsXchfrq);
		ps.setDate(5,jasj);
		ps.setString(6,ysfxhf);
		ps.setDate(7,yhfsj);
		ps.setString(8,yhfjlh);
		ps.setDate(9,yzxhfsj);
		ps.setString(10,yhfr);
		ps.setString(11,yclzt);
		ps.setLong(12,lrxh+i+1);
		ps.executeUpdate();
		ps.close();

	
		if (sfjxhf.equals("Y"))//继续回访
		{
			ls_sql ="update crm_tsjl set sfxhf=?,hfsj=?,hfjlh=?,zxhfsj=?,hfr=?,jasj=null";
			ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sfjxhf);
			ps.setDate(2,lsXchfrq);
			ps.setString(3,hfjlh);
			ps.setDate(4,hfsj);
			ps.setString(5,hfr);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update crm_tsjl set sfxhf='N',hfsj=null,hfjlh=?,zxhfsj=?,hfr=?,jasj=?,clzt='3' ";
			ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjlh);
			ps.setDate(2,hfsj);
			ps.setString(3,hfr);
			ps.setDate(4,jasj);
			ps.executeUpdate();
			ps.close();
		}


		//投诉问题回访明细（crm_tswthfmx）
		ls_sql="select tsyybm,hfjgbm,sfjslx";
		ls_sql+=" from  crm_tsbm";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh[i]+"'";
		ls_sql+=" order by crm_tsbm.tsyybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsyybm=rs1.getString("tsyybm");
			yhfjgbm=rs1.getString("hfjgbm");
			ysfjslx=rs1.getString("sfjslx");


			hfjgbm=request.getParameter("hfjgbm"+tsjlh[i]+tsyybm);
			sfjslx=request.getParameter("sfjslx"+tsjlh[i]+tsyybm);
			jsxbm=request.getParameter("jsxbm"+tsjlh[i]+tsyybm);
			zzjgbm=request.getParameter("zzjgbm"+tsjlh[i]+tsyybm);

			if (hfjgbm==null || hfjgbm.equals(""))
			{
				conn.rollback();
				out.println("投诉报修记录号["+tsjlh[i]+"]错误！请选择【问题目前处理情况】");
				return;
			}

			if (lx.equals("2"))//1：投诉；2：报修
			{
				if (sfjslx==null || sfjslx.equals(""))
				{
					conn.rollback();
					out.println("投诉报修记录号["+tsjlh[i]+"]错误！请选择【是否及时联系客户】");
					return;
				}
			}

			if (sfjxhf.equals("N"))//Y：继续回访；N：结案
			{
				if (zzjgbm==null || zzjgbm.equals(""))
				{
					conn.rollback();
					out.println("投诉报修记录号["+tsjlh[i]+"]错误！请选择【结案客户是否满意】");
					return;
				}
				if (jsxbm==null || jsxbm.equals(""))
				{
					conn.rollback();
					out.println("投诉报修记录号["+tsjlh[i]+"]错误！请选择【解决问题是否及时】");
					return;
				}
			}
			else{
				zzjgbm="";
				jsxbm="";
			}

			ls_sql="insert into crm_tswthfmx (hfjlh,tsjlh,tsyybm,hfjgbm,sfjslx,zzjgbm,jsxbm,yhfjgbm,ysfjslx) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjlh);
			ps.setString(2,tsjlh[i]);
			ps.setString(3,tsyybm);
			ps.setString(4,hfjgbm);
			ps.setString(5,sfjslx);
			ps.setString(6,zzjgbm);
			ps.setString(7,jsxbm);
			ps.setString(8,yhfjgbm);
			ps.setString(9,ysfjslx);
			ps.executeUpdate();
			ps.close();

			String zrbmclzt="";
			if (hfjgbm.equals("04"))//01：未联系客户；02：未处理；03：在处理；04：已解决；09：电话未接通
			{
				zrbmclzt="5";//C：回访未解决；5：结案
			}
			else if (hfjgbm.equals("01") || hfjgbm.equals("02") || hfjgbm.equals("03"))
			{
				zrbmclzt="C";

				ls_sql ="update crm_tsjl set zrbmclzt=?";
				ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zrbmclzt);
				ps.executeUpdate();
				ps.close();
			}

			//设置：责任部门处理状态、确认解决时间
			if (zrbmclzt.equals("5"))//5：结案
			{
				ls_sql ="update crm_tsbm set clzt=?,qrjjsj=?";
				ls_sql+=" where tsjlh='"+tsjlh[i]+"' and tsyybm='"+tsyybm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zrbmclzt);
				ps.setDate(2,hfsj);
				ps.executeUpdate();
				ps.close();
			}
			else if (zrbmclzt.equals("C"))//C：回访未解决
			{
				ls_sql ="update crm_tsbm set clzt=?,qrjjsj=null";
				ls_sql+=" where tsjlh='"+tsjlh[i]+"' and tsyybm='"+tsyybm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zrbmclzt);
				ps.executeUpdate();
				ps.close();
			}

			//设置：回访信息
			if (sfjxhf.equals("Y"))//继续回访
			{
				ls_sql ="update crm_tsbm set hfjgbm=?,sfjslx=?";
				ls_sql+=" where tsjlh='"+tsjlh[i]+"' and tsyybm='"+tsyybm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,hfjgbm);
				ps.setString(2,sfjslx);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql ="update crm_tsbm set hfjgbm=?,sfjslx=?,zzjgbm=?,jsxbm=?";
				ls_sql+=" where tsjlh='"+tsjlh[i]+"' and tsyybm='"+tsyybm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,hfjgbm);
				ps.setString(2,sfjslx);
				ps.setString(3,zzjgbm);
				ps.setString(4,jsxbm);
				ps.executeUpdate();
				ps.close();
			}



		}
		rs1.close();
		ps1.close();
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
	out.print("存盘失败,发生意外: " + e);
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
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>