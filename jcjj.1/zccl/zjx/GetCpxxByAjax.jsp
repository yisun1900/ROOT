<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String clmc=null;
String xh=null;
String gg=null;
String clysbm=null;
String cldlbm=null;
String sfbhpj=null;
String sfbhpjmc=null;
String pjts=null;
String jldwbm=null;
double lsj=0;
double xsj=0;
double cxhdbl=0;
String sfycx=null;
String sfycxmc=null;
double cxj=0;
String cxkssj=null;
String cxjzsj=null;
double lscxhdbl=0;
String gysmc=null;
String bz=null;
double cbj=0;
double jsbl=0;
double cxcbj=0;
double cxjsbl=0;
String sfyh=null;
String sftjcp=null;


String clbm=request.getParameter("clbm");
String srxh=cf.GB2Uni(cf.getParameter(request,"srxh"));
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
double dpjsbl=0;
String	xzjg=null;

try {
	conn=cf.getConnection();

	if (clbm!=null)
	{
		ls_sql="select jxc_cljgb.sfyh,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_clbm.clbm,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clysbm,jxc_clbm.sfbhpj,DECODE(jxc_clbm.sfbhpj,'Y','包含','N','不包含') sfbhpjmc,jxc_clbm.pjts,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,DECODE(jxc_cljgb.sfycx,'N','没促销','Y','有促销') sfycxmc,jxc_cljgb.cxj,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_cljgb.lscxhdbl,jxc_cljgb.gysmc,jxc_clbm.bz,DECODE(jxc_cljgb.sftjcp,'Y','（推荐产品）','N','') sftjcp";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		ls_sql+=" and jxc_clbm.clbm='"+clbm+"'";
	}
	else{
		ls_sql="select jxc_cljgb.sfyh,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_clbm.clbm,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.clysbm,jxc_clbm.sfbhpj,DECODE(jxc_clbm.sfbhpj,'Y','包含','N','不包含') sfbhpjmc,jxc_clbm.pjts,jxc_clbm.jldwbm,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,DECODE(jxc_cljgb.sfycx,'N','没促销','Y','有促销') sfycxmc,jxc_cljgb.cxj,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_cljgb.lscxhdbl,jxc_cljgb.gysmc,jxc_clbm.bz,DECODE(jxc_cljgb.sftjcp,'Y','（推荐产品）','N','') sftjcp";
		ls_sql+=" FROM jxc_clbm,jxc_cljgb";
		ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
		ls_sql+=" and jxc_clbm.cllb='0'";//0：主材；1：辅材
		ls_sql+=" and jxc_cljgb.sfyh='Y'";//Y：有货；N：无货
		ls_sql+=" and jxc_cljgb.xsfs in('1')";//1：代销品；2：现货销售；3：库存无货可销售
		ls_sql+=" and jxc_clbm.ppmc='"+ppbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
		ls_sql+=" and jxc_clbm.xh='"+srxh+"'";
		ls_sql+=" order by jxc_clbm.clbm";
	}
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyh=cf.fillNull(rs.getString("sfyh"));
		cbj=rs.getDouble("cbj");
		jsbl=rs.getDouble("jsbl");
		clbm=cf.fillNull(rs.getString("clbm"));
		cxcbj=rs.getDouble("cxcbj");
		cxjsbl=rs.getDouble("cxjsbl");
		clmc=cf.fillNull(rs.getString("clmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));//
		clysbm=cf.fillNull(rs.getString("clysbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		sfbhpjmc=cf.fillNull(rs.getString("sfbhpjmc"));
		pjts=cf.fillNull(rs.getString("pjts"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		lsj=rs.getDouble("lsj");
		xsj=rs.getDouble("xsj");
		cxhdbl=rs.getDouble("cxhdbl");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		sfycxmc=cf.fillNull(rs.getString("sfycxmc"));
		cxj=rs.getDouble("cxj");
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));//
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));//
		lscxhdbl=rs.getDouble("lscxhdbl");
		gysmc=cf.fillNull(rs.getString("gysmc"));
		bz=cf.fillNull(rs.getString("bz"));//
		sftjcp=cf.fillNull(rs.getString("sftjcp"));//


		getStr2=cbj+"";
		getStr2+="+"+clbm;//1
		getStr2+="+"+cxcbj;
		getStr2+="+"+clmc;
		getStr2+="+"+cldlbm;
		getStr2+="+"+xh;
		getStr2+="+"+gg;
		getStr2+="+"+clysbm;
		getStr2+="+"+sfbhpj;
		getStr2+="+"+sfbhpjmc;
		getStr2+="+"+pjts;//10
		getStr2+="+"+jldwbm;
		getStr2+="+"+lsj;
		getStr2+="+"+xsj;
		getStr2+="+"+cxhdbl;
		getStr2+="+"+sfycx;//15
		getStr2+="+"+sfycxmc;
		getStr2+="+"+cxj;
		getStr2+="+"+cxkssj;
		getStr2+="+"+cxjzsj;
		getStr2+="+"+lscxhdbl;//20
		getStr2+="+"+gysmc;
		getStr2+="+"+bz;


		if (sfycx.equals("Y") && cxkssj.compareTo(cf.today())<=0 &&  cxjzsj.compareTo(cf.today())>=0)
		{
			dpcxhdbl=lscxhdbl;

			xzjg="2";//1:销售限价；2:促销价
			sfycx="Y";
			dj=cxj;
			dpcbj=cxcbj;
			dpjsbl=cxjsbl;
		}
		else
		{
			dpcxhdbl=cxhdbl;

			xzjg="1";//1:销售限价；2:促销价
			sfycx="N";
			dj=xsj;
			dpcbj=cbj;
			dpjsbl=jsbl;
		}

		getStr2+="+"+dpcxhdbl;//23
		getStr2+="+"+xzjg;//24
		getStr2+="+"+sfycx;//25,15,有两个sfycx参数
		getStr2+="+"+dj;//26
		getStr2+="+"+dpcbj;//27
		getStr2+="+"+dpjsbl;//28
		getStr2+="+"+sftjcp;//29
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



