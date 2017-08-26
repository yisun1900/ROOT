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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//投诉记录号
	String newhfjlh=null;
	int count=0;
	ls_sql="select NVL(max(substr(hfjlh,8,3)),0)";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	newhfjlh=khbh+cf.addZero(count,3);

	if (!newhfjlh.equals(hfjlh))
	{
		out.println("错误！只能修改最新一次的回访记录："+newhfjlh);
		return;
	}


	conn.setAutoCommit(false);

	
	ls_sql="update crm_tshfjl set khhfqk=?,cxxwt=?,clfs=?,xchfrq=?";
	ls_sql+=" where  (hfjlh='"+hfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khhfqk);
	ps.setString(2,cxxwt);
	ps.setString(3,clfs);
	ps.setDate(4,xchfrq);

	ps.executeUpdate();
	ps.close();


	ls_sql="delete from crm_tshffkbm where hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
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
		ls_sql="select lx";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
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
		if (sfjxhf.equals("Y"))//Y：继续回访；N：结案
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

	
		ls_sql="update crm_tsjlhfmx set sfjxhf=?,xchfrq=?,jasj=? ";
		ls_sql+=" where hfjlh='"+hfjlh+"' and tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sfjxhf);
		ps.setDate(2,lsXchfrq);
		ps.setDate(3,jasj);
		ps.executeUpdate();
		ps.close();


		//原处理状态
		ls_sql="select yclzt";
		ls_sql+=" from  crm_tsjlhfmx ";
		ls_sql+=" where hfjlh='"+hfjlh+"' and tsjlh='"+tsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yclzt=rs.getString("yclzt");
		}
		rs.close();
		ps.close();
	

		if (sfjxhf.equals("Y"))//继续回访
		{
			ls_sql ="update crm_tsjl set sfxhf=?,hfsj=?,jasj=null,clzt=?";
			ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,sfjxhf);
			ps.setDate(2,lsXchfrq);
			ps.setString(3,yclzt);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update crm_tsjl set sfxhf='N',hfsj=null,jasj=?,clzt='3' ";
			ls_sql+=" where tsjlh='"+tsjlh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,jasj);
			ps.executeUpdate();
			ps.close();
		}


		//投诉问题回访明细（crm_tswthfmx）
		ls_sql="select tsyybm";
		ls_sql+=" from  crm_tswthfmx";
		ls_sql+=" where hfjlh='"+hfjlh+"' and tsjlh='"+tsjlh[i]+"'";
		ls_sql+=" order by tsyybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsyybm=rs1.getString("tsyybm");


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

			ls_sql="update crm_tswthfmx set hfjgbm=?,sfjslx=?,zzjgbm=?,jsxbm=?";
			ls_sql+=" where hfjlh='"+hfjlh+"' and tsjlh='"+tsjlh[i]+"' and tsyybm='"+tsyybm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfjgbm);
			ps.setString(2,sfjslx);
			ps.setString(3,zzjgbm);
			ps.setString(4,jsxbm);
			ps.executeUpdate();
			ps.close();

			String zrbmclzt="";//1：未处理；2：在处理；3：已解决
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

			if (!zrbmclzt.equals(""))
			{
				ls_sql ="update crm_tsbm set clzt=?";
				ls_sql+=" where tsjlh='"+tsjlh[i]+"' and tsyybm='"+tsyybm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,zrbmclzt);
				ps.executeUpdate();
				ps.close();
			}

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
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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