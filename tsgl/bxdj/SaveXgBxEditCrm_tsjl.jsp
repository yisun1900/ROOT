<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String slfsbm=null;

String bz=cf.GB2Uni(request.getParameter("bz"));
String wxsgd=cf.GB2Uni(request.getParameter("wxsgd"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String tsnr=cf.GB2Uni(request.getParameter("tsnr"));

slfsbm=cf.GB2Uni(request.getParameter("slfsbm"));
java.sql.Date yqjjsj=null;
ls=request.getParameter("yqjjsj");
try{
	if (!(ls.equals("")))  yqjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户要求解决时间]类型转换发生意外:"+e);
	return;
}



java.sql.Date tsbxsj=null;
ls=request.getParameter("tsbxsj");
try{
	if (!(ls.equals("")))  tsbxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tsbxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[客户报修报修时间]类型转换发生意外:"+e);
	return;
}




String jcppbz=request.getParameter("jcppbz");

String tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
String tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String dwbh=request.getParameter("dwbh");
String ssfgs=request.getParameter("ssfgs");


String rglrbz=request.getParameter("rglrbz");
String tspp=cf.GB2Uni(request.getParameter("tspp"));
String rglrtspp=cf.GB2Uni(request.getParameter("rglrtspp"));

String wheretsyybm=cf.GB2Uni(request.getParameter("wheretsyybm"));
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//报修供应商
	String ppmc=null;
	String gys=null;
	if (rglrbz.equals("1"))//1：系统取得2：人工录入
	{
		if (tspp!=null && !tspp.equals(""))
		{
			if (!jcppbz.equals("N"))//是否启用集成订单:Y：启用；N：否，因有的供应商已删除，要从订单取
			{
				int pos=tspp.indexOf("*");
				ppmc=tspp.substring(pos+1);
				tspp=tspp.substring(0,pos);

				pos=ppmc.indexOf("*");
				gys=ppmc.substring(pos+1);
				ppmc=ppmc.substring(0,pos);
			}
			else{
				ls_sql="select jxc_ppxx.scsmc,jxc_ppgysdzb.gysmc";
				ls_sql+=" from  jxc_ppgysdzb,jxc_ppxx";
				ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm and jxc_ppgysdzb.ppmc='"+tspp+"' and jxc_ppgysdzb.ssfgs='"+ssfgs+"' ";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery(ls_sql);
				if (rs.next())
				{
					ppmc=rs.getString("scsmc");
					gys=rs.getString("gysmc");
				}
				rs.close();
				ps.close();
			}
		}
	}
	else{
		if (!rglrtspp.equals(""))
		{
			tspp=rglrtspp;
			ppmc=rglrtspp;
			gys=rglrtspp;
		}
	}

	conn.setAutoCommit(false);


	ls_sql="update crm_tsjl set slfsbm=?,yqjjsj=?, bz=?,tsnr=?,wxsgd=?   ,tsbxsj=?";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,slfsbm);
	ps.setDate(2,yqjjsj);
	ps.setString(3,bz);
	ps.setString(4,tsnr);
	ps.setString(5,wxsgd);
	ps.setDate(6,tsbxsj);
	ps.executeUpdate();
	ps.close();

	//客户报修原因
	ls_sql="update crm_tsbm set tslxbm=?,tsxlbm=?,tsyybm=?,dwbh=?,tspp=?,ppmc=?,gys=?,rglrbz=?";
	ls_sql+=" where  tsjlh='"+tsjlh+"' and  tsyybm='"+wheretsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tslxbm);
	ps.setString(2,tsxlbm);
	ps.setString(3,tsyybm);
	ps.setString(4,dwbh);
	ps.setString(5,tspp);
	ps.setString(6,ppmc);
	ps.setString(7,gys);
	ps.setString(8,rglrbz);
	if (ps.executeUpdate()!=1)
	{
		ps.close();
		conn.rollback();
		out.println("错误！报修报修原因不正确，可能已修改，请刷新后重新存盘");
		return;
	}
	ps.close();


	//报修问题回访明细
	ls_sql="update crm_tswthfmx set tsyybm=?";
	ls_sql+=" where  tsjlh='"+tsjlh+"' and  tsyybm='"+wheretsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsyybm);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>