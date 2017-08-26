<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zcmc=null;
String xh=null;
String gg=null;
String zcysbm=null;
String zclbbm=null;
String sfbhpj=null;
String sfbhpjmc=null;
String pjts=null;
String jldwbm=null;
double lsj=0;
double yhj=0;
double cxhdbl=0;
String sfycx=null;
String sfycxmc=null;
double cxj=0;
String cxkssj=null;
String cxjzsj=null;
double lscxhdbl=0;
String gys=null;
String bz=null;
double cbj=0;
double cxcbj=0;
String sfyh=null;


String zcbm=request.getParameter("zcbm");
String jc_zcjgb_xh=cf.GB2Uni(cf.getParameter(request,"jc_zcjgb_xh"));
String dqbm=request.getParameter("dqbm");
String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String getStr2="";

double dj=0;
double dpcxhdbl=0;
double dpcbj=0;
String	xzjg=null;

try {
	conn=cf.getConnection();

	if (zcbm!=null)
	{
		ls_sql="select sfyh,cbj,zcbm,cxcbj,zcmc,zclbbm,xh,gg,zcysbm,yhj,sfbhpj,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpjmc,pjts,jldwbm,lsj,yhj,cxhdbl,sfycx,DECODE(sfycx,'N','没促销','Y','有促销') sfycxmc,cxj,cxkssj,cxjzsj,lscxhdbl,gys,bz";
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where zcbm='"+zcbm+"'";
	}
	else{
		ls_sql="select sfyh,cbj,zcbm,cxcbj,zcmc,zclbbm,xh,gg,zcysbm,yhj,sfbhpj,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpjmc,pjts,jldwbm,lsj,yhj,cxhdbl,sfycx,DECODE(sfycx,'N','没促销','Y','有促销') sfycxmc,cxj,cxkssj,cxjzsj,lscxhdbl,gys,bz";
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where jc_zcjgb.dwbh='"+ppbm+"' and jc_zcjgb.dqbm='"+dqbm+"'";
		ls_sql+=" and xh='"+jc_zcjgb_xh+"'";
		ls_sql+=" order by zcbm";
	}
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyh=cf.fillNull(rs.getString("sfyh"));
		cbj=rs.getDouble("cbj");
		zcbm=cf.fillNull(rs.getString("zcbm"));
		cxcbj=rs.getDouble("cxcbj");
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));//
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		sfbhpjmc=cf.fillNull(rs.getString("sfbhpjmc"));
		pjts=cf.fillNull(rs.getString("pjts"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		lsj=rs.getDouble("lsj");
		yhj=rs.getDouble("yhj");
		cxhdbl=rs.getDouble("cxhdbl");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		sfycxmc=cf.fillNull(rs.getString("sfycxmc"));
		cxj=rs.getDouble("cxj");
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));//
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));//
		lscxhdbl=rs.getDouble("lscxhdbl");
		gys=cf.fillNull(rs.getString("gys"));
		bz=cf.fillNull(rs.getString("bz"));//
		getStr2=cbj+"";
		getStr2+="+"+zcbm;
		getStr2+="+"+cxcbj;
		getStr2+="+"+zcmc;
		getStr2+="+"+zclbbm;
		getStr2+="+"+xh;
		getStr2+="+"+gg;
		getStr2+="+"+zcysbm;
		getStr2+="+"+sfbhpj;
		getStr2+="+"+sfbhpjmc;
		getStr2+="+"+pjts;
		getStr2+="+"+jldwbm;
		getStr2+="+"+lsj;
		getStr2+="+"+yhj;
		getStr2+="+"+cxhdbl;
		getStr2+="+"+sfycx;
		getStr2+="+"+sfycxmc;
		getStr2+="+"+cxj;
		getStr2+="+"+cxkssj;
		getStr2+="+"+cxjzsj;
		getStr2+="+"+lscxhdbl;
		getStr2+="+"+gys;
		getStr2+="+"+bz;


		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
		{
			dpcxhdbl=lscxhdbl;

			xzjg="2";//1:销售限价；2:促销价
			sfycx="Y";
			dj=cxj;
			dpcbj=cxcbj;
		}
		else
		{
			dpcxhdbl=cxhdbl;

			xzjg="1";//1:销售限价；2:促销价
			sfycx="N";
			dj=yhj;
			dpcbj=cbj;
		}
		getStr2+="+"+dpcxhdbl;
		getStr2+="+"+xzjg;
		getStr2+="+"+sfycx;
		getStr2+="+"+dj;
		getStr2+="+"+dpcbj;
	}
	rs.close();
	ps.close();

	out.print(getStr2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



