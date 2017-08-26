<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String ls=null;
String tsjlh=request.getParameter("tsjlh");
String tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
String tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String dwbh=request.getParameter("dwbh");

String jcppbz=request.getParameter("jcppbz");
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String rglrbz=request.getParameter("rglrbz");
String tspp=cf.GB2Uni(request.getParameter("tspp"));
String rglrtspp=cf.GB2Uni(request.getParameter("rglrtspp"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String sfxtz=null;
	ls_sql="select sfxtz";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxtz=cf.fillNull(rs.getString("sfxtz"));
	}
	rs.close();
	ps.close();

	String sfytz=null;
	if (sfxtz.equals("Y"))
	{
		sfytz="0";//0：未通知；1：已通知；2：不需通知
	}
	else{
		sfytz="2";
	}

	//投诉供应商
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

	String zrr="";
	ls_sql="select yhmc";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrr=rs.getString("yhmc");
	}
	rs.close();
	ps.close();

	//客户投诉原因
	ls_sql="insert into crm_tsbm (tsjlh,tsyybm,tslxbm,tsxlbm,dwbh   ,sfytz,clzt,ssfgs,khbh  ,tspp,ppmc,gys,rglrbz,zrr,ygbh,sfpfkh,khpfze,sfnbcf,nbcfze,tzr,tzsj,sffswxf,wxfze) ";
	ls_sql+=" values (?,?,?,?,?  ,?,?,?,?   ,?,?,?,?,?,?,'1',0,'1',0,?,SYSDATE,'1',0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,tsyybm);
	ps.setString(3,tslxbm);
	ps.setString(4,tsxlbm);
	ps.setString(5,dwbh);

	ps.setString(6,sfytz);
	ps.setString(7,"1");//1：未处理；2：在处理；3：已解决
	ps.setString(8,ssfgs);
	ps.setString(9,khbh);

	ps.setString(10,tspp);
	ps.setString(11,ppmc);
	ps.setString(12,gys);
	ps.setString(13,rglrbz);
	ps.setString(14,zrr);
	ps.setString(15,ygbh);
	ps.setString(16,lrr);
	
	ps.executeUpdate();
	ps.close();

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
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
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