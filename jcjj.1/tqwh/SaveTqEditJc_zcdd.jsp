<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String khbh=null;
String clgw=null;
String ddshbz=null;

java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
String xclbz=null;
java.sql.Date htshsj=null;
String xmzy=null;
java.sql.Date qhtsj=null;
java.sql.Date jhclsj=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));



ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhtzshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�֪ͨ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɼ����ֹʱ��]����ת����������:"+e);
	return;
}
xclbz=cf.GB2Uni(request.getParameter("xclbz"));
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qhtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ��ͬʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhclsj");
try{
	if (!(ls.equals("")))  jhclsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhclsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}
String bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String ppmc=cf.GB2Uni(request.getParameter("ppmc"));
String gys=cf.GB2Uni(request.getParameter("gys"));
String sfkgsl=cf.GB2Uni(request.getParameter("sfkgsl"));
String ddlx=cf.GB2Uni(request.getParameter("ddlx"));

double qtycf=0;
ls=request.getParameter("qtycf");
try{
	if (!(ls.equals("")))  qtycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Զ�̷�]����ת����������:"+e);
	return;
}

String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newppmc=null;
	ls_sql=" select jxc_ppxx.scsmc" ;
	ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx " ;
	ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm ";
	ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
	ls_sql+=" and jxc_ppxx.pplb='1' ";
	ls_sql+=" and jxc_gysxx.cllx='1' ";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"' and jxc_ppxx.ppmc='"+ppbm+"'" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		newppmc = rs.getString("scsmc");			    
	}
	rs.close();
	ps.close();
	if (!ppmc.equals(newppmc))
	{
		conn.rollback();
		out.println("<BR>����������[��Ʒ��:"+ppbm+"]��Ӧ��Ʒ��Ϊ:"+newppmc);
		return;
	}
	
	int count=0;
	ls_sql=" select count(*)" ;
	ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx " ;
	ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm ";
	ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm ";
	ls_sql+=" and jxc_ppxx.pplb='1' ";
	ls_sql+=" and jxc_gysxx.cllx='1' ";
	ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"' and jxc_ppgysdzb.gysmc='"+gys+"'" ;
	ls_sql+=" and jxc_ppgysdzb.ppmc='"+ppbm+"'" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		count = rs.getInt(1);			    
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		conn.rollback();
		out.println("<BR>������������Ʒ��["+ppbm+"]�빩Ӧ��["+gys+"]�޶��չ�ϵ");
		return;
	}

	
	double oldqtycf=0;
	double zcpclf=0;
	double tjpclf=0;
	ls_sql=" select qtycf,zcpclf,tjpclf" ;
	ls_sql+=" from jc_zcdd" ;
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		oldqtycf = rs.getDouble("qtycf");			    
		zcpclf = rs.getDouble("zcpclf");			    
		tjpclf = rs.getDouble("tjpclf");			    
	}
	rs.close();
	ps.close();


	
	
	
	
	//ȡ���������������������������	
	double fdbl=0;
	double cxfdbl=0;
	double tcjrbl=0;
	double tccxjrbl=0;
	double khfdbl=0;
	double khcxfdbl=0;

	if (ddlx.equals("9") || ddlx.equals("E"))//9���������ġ�C:ѡ�����ģ�E��ɢ��
	{
		ls_sql="select jxc_ppgysdzb.fdbl,jxc_ppgysdzb.cxfdbl,jxc_ppgysdzb.tcjrbl,jxc_ppgysdzb.tccxjrbl ";
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
		ls_sql+=" and jxc_ppxx.pplb='1' ";
		ls_sql+=" and jxc_gysxx.cllx='1' ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fdbl=rs.getDouble("fdbl");
			cxfdbl=rs.getDouble("cxfdbl");
			tcjrbl=rs.getDouble("tcjrbl");
			tccxjrbl=rs.getDouble("tccxjrbl");
		}
		rs.close();
		ps.close();
		
		ls_sql="select jxc_khfdbl.khfdbl,jxc_khfdbl.khcxfdbl ";
		ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khfdbl=rs.getDouble("khfdbl");
			khcxfdbl=rs.getDouble("khcxfdbl");
		}
		rs.close();
		ps.close();
		

		if (fdbl==0)
		{
			out.println("<BR>����������δ��ʼ���������");
			return;
		}
	}
	else if (ddlx.equals("C"))//9���������ġ�C:ѡ�����ģ�E��ɢ��
	{
		ls_sql="select jxc_ppgysdzb.xpjsbl,jxc_ppgysdzb.xpcxjsbl,jxc_ppgysdzb.xptcjrbl,jxc_ppgysdzb.xptccxjrbl ";
		ls_sql+=" from jxc_ppgysdzb,jxc_ppxx,jxc_gysxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm ";
		ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
		ls_sql+=" and jxc_ppxx.pplb='1' ";
		ls_sql+=" and jxc_gysxx.cllx='1' ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_ppgysdzb.ssfgs='"+ssfgs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fdbl=rs.getDouble("xpjsbl");
			cxfdbl=rs.getDouble("xpcxjsbl");
			tcjrbl=rs.getDouble("xptcjrbl");
			tccxjrbl=rs.getDouble("xptccxjrbl");
		}
		rs.close();
		ps.close();


		ls_sql="select jxc_khfdbl.xpkhfdbl,jxc_khfdbl.xpkhcxfdbl ";
		ls_sql+=" from jxc_khfdbl,jxc_ppxx  ";
		ls_sql+=" where jxc_ppxx.ppbm=jxc_khfdbl.ppbm ";
		ls_sql+=" and jxc_ppxx.ppmc='"+ppbm+"'";
		ls_sql+=" and jxc_khfdbl.khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khfdbl=rs.getDouble("xpkhfdbl");
			khcxfdbl=rs.getDouble("xpkhcxfdbl");
		}
		rs.close();
		ps.close();

		if (fdbl==0)
		{
			out.println("<BR>����������δ��ʼ���������");
			return;
		}

	}

	double tjpfdbl=cxfdbl;
	double tjpkhfdbl=khcxfdbl;
	double tjptcjrbl=tccxjrbl;

	double cbze=zcpclf*fdbl/100+tjpclf*tjpfdbl/100;

	//ȡ���������������������������	

	
	conn.setAutoCommit(false);

	if (ddlx.equals("9") || ddlx.equals("E") || ddlx.equals("C"))//9���������ġ�C:ѡ�����ģ�E��ɢ��
	{
		ls_sql="update jc_zcdd set clgw=?,ztjjgw=?,ddshbz=?,kjxsj=?,xclbz=?,htshsj=?,xmzy=?,qhtsj=?,jhclsj=?,bz=?,jhtzshsj=?,jjsjs=?,ppbm=?,ppmc=?,gys=?,sfkgsl=?,qtycf=?,ycf=ycf+?,lrr=?,lrsj=SYSDATE ";
		ls_sql+=" ,ddlx=?,cbze=?,fdbl=?,khfdbl=?,tcjrbl=?,tjpfdbl=?,tjpkhfdbl=?,tjptcjrbl=? ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.setString(2,ztjjgw);
		ps.setString(3,ddshbz);
		ps.setDate(4,kjxsj);
		ps.setString(5,xclbz);
		ps.setDate(6,htshsj);
		ps.setString(7,xmzy);
		ps.setDate(8,qhtsj);
		ps.setDate(9,jhclsj);
		ps.setString(10,bz);
		ps.setDate(11,jhtzshsj);
		ps.setString(12,jjsjs);
		ps.setString(13,ppbm);
		ps.setString(14,ppmc);
		ps.setString(15,gys);
		ps.setString(16,sfkgsl);
		ps.setDouble(17,qtycf);
		ps.setDouble(18,qtycf-oldqtycf);
		ps.setString(19,yhmc);

		ps.setString(20,ddlx);
		ps.setDouble(21,cbze);
		ps.setDouble(22,fdbl);
		ps.setDouble(23,khfdbl);
		ps.setDouble(24,tcjrbl);
		ps.setDouble(25,tjpfdbl);
		ps.setDouble(26,tjpkhfdbl);
		ps.setDouble(27,tjptcjrbl);

		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jc_zcdd set clgw=?,ztjjgw=?,ddshbz=?,kjxsj=?,xclbz=?,htshsj=?,xmzy=?,qhtsj=?,jhclsj=?,bz=?,jhtzshsj=?,jjsjs=?,ppbm=?,ppmc=?,gys=?,sfkgsl=?,qtycf=?,ycf=ycf+?,lrr=?,lrsj=SYSDATE ";
		ls_sql+=" ,ddlx=? ";
		ls_sql+=" where ddbh='"+ddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,clgw);
		ps.setString(2,ztjjgw);
		ps.setString(3,ddshbz);
		ps.setDate(4,kjxsj);
		ps.setString(5,xclbz);
		ps.setDate(6,htshsj);
		ps.setString(7,xmzy);
		ps.setDate(8,qhtsj);
		ps.setDate(9,jhclsj);
		ps.setString(10,bz);
		ps.setDate(11,jhtzshsj);
		ps.setString(12,jjsjs);
		ps.setString(13,ppbm);
		ps.setString(14,ppmc);
		ps.setString(15,gys);
		ps.setString(16,sfkgsl);
		ps.setDouble(17,qtycf);
		ps.setDouble(18,qtycf-oldqtycf);
		ps.setString(19,yhmc);

		ps.setString(20,ddlx);

		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update jc_zcddmx set dwbh=?,ppmc=?,gys=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,gys);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zczjx set ppbm=?,ppmc=?,gys=?,clgw=?,ztjjgw=?,xmzy=?,jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,gys);
	ps.setString(4,clgw);
	ps.setString(5,ztjjgw);
	ps.setString(6,xmzy);
	ps.setString(7,jjsjs);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set fssj=?";
	ls_sql+=" where gjz='"+ddbh+"' and lx='4' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set pdgcmc=?,ppmc=?,gys=?,clgw=?,ztjjgw=?,xmzy=?,jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='4'";//1��ľ�ţ�2������3���Ҿߣ�4������
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,gys);
	ps.setString(4,clgw);
	ps.setString(5,ztjjgw);
	ps.setString(6,xmzy);
	ps.setString(7,jjsjs);
	ps.executeUpdate();
	ps.close();

 	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>