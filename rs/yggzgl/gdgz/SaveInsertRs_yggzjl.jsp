<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date fxrq=null;
java.sql.Date ksrq=null;
java.sql.Date zzrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("fxrq");
try{
	if (!(ls.equals("")))  fxrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fxrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��н����]����ת����������:"+e);
	return;
}
ls=request.getParameter("ksrq");
String nian=ls.substring(0,4);
String yue=ls.substring(5,7);
try{
	if (!(ls.equals("")))  ksrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ksrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���㿪ʼ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzrq");
try{
	if (!(ls.equals("")))  zzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ֹ����]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String xh=cf.GB2Uni(request.getParameter("xh"));
double qqts=0;
ls=request.getParameter("qqts");
try{
	if (!(ls.equals("")))  qqts=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qqts������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gzlb="1";

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  rs_yggzjl";
	ls_sql+=" where lrbm='"+lrbm+"' and ssfgs='"+ssfgs+"' and ksrq=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,ksrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("����ʧ�ܣ��������ڵĹ����Ѵ���");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into rs_yggzjl ( xh,fxrq,ksrq,zzrq,lrr,lrsj,lrbm,ssfgs,bz,lx,qqts ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xh);
	ps.setDate(2,fxrq);
	ps.setDate(3,ksrq);
	ps.setDate(4,zzrq);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,ssfgs);
	ps.setString(9,bz);
	ps.setString(10,gzlb);
	ps.setDouble(11,qqts);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into rs_yggzb (xh,ygbh,bianhao,yhmc,xzzwbm,ssfgs,dwbh,dsx,cqts,qqts,sjts,bjts,kgts  ,jbgz,gwgz,khgz,jxfz,byjxgz               ,buzhu,glgz,jbf,jtbt,dhbt,mrcb,cb,yjsxe                             ,tc,jf,sjkk,bjkk,cjkk,kgkk,qtkk,ksk   ,sqgz,shgz,bz)";
	ls_sql+=" select '"+xh+"'       ,ygbh,bianhao,yhmc,xzzwbm,ssfgs,dwbh,NVL(dsx,'0'),0,"+qqts+",0,0,0                 ,NVL(jbgz,0),NVL(gwgz,0),NVL(khgz,0),0,0  ,NVL(buzhu,0),NVL(glgz,0),0,NVL(jtbt,0),NVL(dhbt,0),NVL(cb,0),0,0   ,0,0,0,0,0,0,0,0                      ,0,0,''";
	ls_sql+=" from sq_yhxx  ";
//	ls_sql+=" where ssfgs='"+ssfgs+"' and gzlb='"+gzlb+"' and sflz='N'";//1���̶����ʣ�2����������
	ls_sql+=" where ssfgs='"+ssfgs+"' ";//1���̶����ʣ�2����������
    ls_sql+=" and sq_yhxx.sfzszg in('N','Y')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

/*
	ls_sql="update rs_yggzb set ";
	ls_sql+=" qqts=(select rs_cqtjb.qqts";
	ls_sql+="		from rs_cqtjb  ";
	ls_sql+="		where ssfgs='"+ssfgs+"' and rs_yggzb.ygbh=rs_cqtjb.ygbh";
	ls_sql+="		and rs_cqtjb.nian="+nian+" and rs_cqtjb.yue="+yue+")" ;
	ls_sql+=" ,cqts=(select rs_cqtjb.cqts";
	ls_sql+="		from rs_cqtjb  ";
	ls_sql+="		where ssfgs='"+ssfgs+"' and rs_yggzb.ygbh=rs_cqtjb.ygbh";
	ls_sql+="		and rs_cqtjb.nian="+nian+" and rs_cqtjb.yue="+yue+")" ;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
*/
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if(rs!=null) rs.close();
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>