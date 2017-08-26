<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String gcysbbh=null;
String dm_hegcysbb_gcysbbmc=null;
String gcysxmbm=null;
String gcysxmmc=null;
String yszxsl=null;
String ys1=null;
String byx1=null;
String ysbztp1=null;
String ysbzsm1=null;
String ys2=null;
String byx2=null;
String ysbztp2=null;
String ysbzsm2=null;
String ys3=null;
String byx3=null;
String ysbztp3=null;
String ysbzsm3=null;
String ys4=null;
String byx4=null;
String ysbztp4=null;
String ysbzsm4=null;
String ys5=null;
String byx5=null;
String ysbztp5=null;
String ysbzsm5=null;
String ys6=null;
String byx6=null;
String ysbztp6=null;
String ysbzsm6=null;
String ys7=null;
String byx7=null;
String ysbztp7=null;
String ysbzsm7=null;
String ys8=null;
String byx8=null;
String ysbztp8=null;
String ysbzsm8=null;
String ys9=null;
String byx9=null;
String ysbztp9=null;
String ysbzsm9=null;
String ys10=null;
String byx10=null;
String ysbztp10=null;
String ysbzsm10=null;
String ys11=null;
String byx11=null;
String ysbztp11=null;
String ysbzsm11=null;
String ys12=null;
String byx12=null;
String ysbztp12=null;
String ysbzsm12=null;
String ys13=null;
String byx13=null;
String ysbztp13=null;
String ysbzsm13=null;
String ys14=null;
String byx14=null;
String ysbztp14=null;
String ysbzsm14=null;
String ys15=null;
String byx15=null;
String ysbztp15=null;
String ysbzsm15=null;
String ys16=null;
String byx16=null;
String ysbztp16=null;
String ysbzsm16=null;
String ys17=null;
String byx17=null;
String ysbztp17=null;
String ysbzsm17=null;
String ys18=null;
String byx18=null;
String ysbztp18=null;
String ysbzsm18=null;
String ys19=null;
String byx19=null;
String ysbztp19=null;
String ysbzsm19=null;
String ys20=null;
String byx20=null;
String ysbztp20=null;
String ysbzsm20=null;
String ys21=null;
String byx21=null;
String ysbztp21=null;
String ysbzsm21=null;
String ys22=null;
String byx22=null;
String ysbztp22=null;
String ysbzsm22=null;
String ys23=null;
String byx23=null;
String ysbztp23=null;
String ysbzsm23=null;
String ys24=null;
String byx24=null;
String ysbztp24=null;
String ysbzsm24=null;
String ys25=null;
String byx25=null;
String ysbztp25=null;
String ysbzsm25=null;
String ys26=null;
String byx26=null;
String ysbztp26=null;
String ysbzsm26=null;
String ys27=null;
String byx27=null;
String ysbztp27=null;
String ysbzsm27=null;
String ys28=null;
String byx28=null;
String ysbztp28=null;
String ysbzsm28=null;
String ys29=null;
String byx29=null;
String ysbztp29=null;
String ysbzsm29=null;
String ys30=null;
String byx30=null;
String ysbztp30=null;
String ysbzsm30=null;
String ys31=null;
String byx31=null;
String ysbztp31=null;
String ysbzsm31=null;
String ys32=null;
String byx32=null;
String ysbztp32=null;
String ysbzsm32=null;
String ys33=null;
String byx33=null;
String ysbztp33=null;
String ysbzsm33=null;
String ys34=null;
String byx34=null;
String ysbztp34=null;
String ysbzsm34=null;
String ys35=null;
String byx35=null;
String ysbztp35=null;
String ysbzsm35=null;
String ys36=null;
String byx36=null;
String ysbztp36=null;
String ysbzsm36=null;
String ys37=null;
String byx37=null;
String ysbztp37=null;
String ysbzsm37=null;
String ys38=null;
String byx38=null;
String ysbztp38=null;
String ysbzsm38=null;
String ys39=null;
String byx39=null;
String ysbztp39=null;
String ysbzsm39=null;
String ys40=null;
String byx40=null;
String ysbztp40=null;
String ysbzsm40=null;
String ys41=null;
String byx41=null;
String ysbztp41=null;
String ysbzsm41=null;
String ys42=null;
String byx42=null;
String ysbztp42=null;
String ysbzsm42=null;
String ys43=null;
String byx43=null;
String ysbztp43=null;
String ysbzsm43=null;
String ys44=null;
String byx44=null;
String ysbztp44=null;
String ysbzsm44=null;
String ys45=null;
String byx45=null;
String ysbztp45=null;
String ysbzsm45=null;
String ys46=null;
String byx46=null;
String ysbztp46=null;
String ysbzsm46=null;
String ys47=null;
String byx47=null;
String ysbztp47=null;
String ysbzsm47=null;
String ys48=null;
String byx48=null;
String ysbztp48=null;
String ysbzsm48=null;
String ys49=null;
String byx49=null;
String ysbztp49=null;
String ysbzsm49=null;
String ys50=null;
String byx50=null;
String ysbztp50=null;
String ysbzsm50=null;
String wheregcysbbh=null;
String wheregcysxmbm=null;
wheregcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
wheregcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select dm_heysxmpz.gcysbbh as gcysbbh,dm_hegcysbb.gcysbbmc as dm_hegcysbb_gcysbbmc,dm_heysxmpz.gcysxmbm as gcysxmbm,dm_heysxmpz.gcysxmmc as gcysxmmc,dm_heysxmpz.yszxsl as yszxsl,dm_heysxmpz.ys1 as ys1,dm_heysxmpz.byx1 as byx1,dm_heysxmpz.ysbztp1 as ysbztp1,dm_heysxmpz.ysbzsm1 as ysbzsm1,dm_heysxmpz.ys2 as ys2,dm_heysxmpz.byx2 as byx2,dm_heysxmpz.ysbztp2 as ysbztp2,dm_heysxmpz.ysbzsm2 as ysbzsm2,dm_heysxmpz.ys3 as ys3,dm_heysxmpz.byx3 as byx3,dm_heysxmpz.ysbztp3 as ysbztp3,dm_heysxmpz.ysbzsm3 as ysbzsm3,dm_heysxmpz.ys4 as ys4,dm_heysxmpz.byx4 as byx4,dm_heysxmpz.ysbztp4 as ysbztp4,dm_heysxmpz.ysbzsm4 as ysbzsm4,dm_heysxmpz.ys5 as ys5,dm_heysxmpz.byx5 as byx5,dm_heysxmpz.ysbztp5 as ysbztp5,dm_heysxmpz.ysbzsm5 as ysbzsm5,dm_heysxmpz.ys6 as ys6,dm_heysxmpz.byx6 as byx6,dm_heysxmpz.ysbztp6 as ysbztp6,dm_heysxmpz.ysbzsm6 as ysbzsm6,dm_heysxmpz.ys7 as ys7,dm_heysxmpz.byx7 as byx7,dm_heysxmpz.ysbztp7 as ysbztp7,dm_heysxmpz.ysbzsm7 as ysbzsm7,dm_heysxmpz.ys8 as ys8,dm_heysxmpz.byx8 as byx8,dm_heysxmpz.ysbztp8 as ysbztp8,dm_heysxmpz.ysbzsm8 as ysbzsm8,dm_heysxmpz.ys9 as ys9,dm_heysxmpz.byx9 as byx9,dm_heysxmpz.ysbztp9 as ysbztp9,dm_heysxmpz.ysbzsm9 as ysbzsm9,dm_heysxmpz.ys10 as ys10,dm_heysxmpz.byx10 as byx10,dm_heysxmpz.ysbztp10 as ysbztp10,dm_heysxmpz.ysbzsm10 as ysbzsm10,dm_heysxmpz.ys11 as ys11,dm_heysxmpz.byx11 as byx11,dm_heysxmpz.ysbztp11 as ysbztp11,dm_heysxmpz.ysbzsm11 as ysbzsm11,dm_heysxmpz.ys12 as ys12,dm_heysxmpz.byx12 as byx12,dm_heysxmpz.ysbztp12 as ysbztp12,dm_heysxmpz.ysbzsm12 as ysbzsm12,dm_heysxmpz.ys13 as ys13,dm_heysxmpz.byx13 as byx13,dm_heysxmpz.ysbztp13 as ysbztp13,dm_heysxmpz.ysbzsm13 as ysbzsm13,dm_heysxmpz.ys14 as ys14,dm_heysxmpz.byx14 as byx14,dm_heysxmpz.ysbztp14 as ysbztp14,dm_heysxmpz.ysbzsm14 as ysbzsm14,dm_heysxmpz.ys15 as ys15,dm_heysxmpz.byx15 as byx15,dm_heysxmpz.ysbztp15 as ysbztp15,dm_heysxmpz.ysbzsm15 as ysbzsm15,dm_heysxmpz.ys16 as ys16,dm_heysxmpz.byx16 as byx16,dm_heysxmpz.ysbztp16 as ysbztp16,dm_heysxmpz.ysbzsm16 as ysbzsm16,dm_heysxmpz.ys17 as ys17,dm_heysxmpz.byx17 as byx17,dm_heysxmpz.ysbztp17 as ysbztp17,dm_heysxmpz.ysbzsm17 as ysbzsm17,dm_heysxmpz.ys18 as ys18,dm_heysxmpz.byx18 as byx18,dm_heysxmpz.ysbztp18 as ysbztp18,dm_heysxmpz.ysbzsm18 as ysbzsm18,dm_heysxmpz.ys19 as ys19,dm_heysxmpz.byx19 as byx19,dm_heysxmpz.ysbztp19 as ysbztp19,dm_heysxmpz.ysbzsm19 as ysbzsm19,dm_heysxmpz.ys20 as ys20,dm_heysxmpz.byx20 as byx20,dm_heysxmpz.ysbztp20 as ysbztp20,dm_heysxmpz.ysbzsm20 as ysbzsm20,dm_heysxmpz.ys21 as ys21,dm_heysxmpz.byx21 as byx21,dm_heysxmpz.ysbztp21 as ysbztp21,dm_heysxmpz.ysbzsm21 as ysbzsm21,dm_heysxmpz.ys22 as ys22,dm_heysxmpz.byx22 as byx22,dm_heysxmpz.ysbztp22 as ysbztp22,dm_heysxmpz.ysbzsm22 as ysbzsm22,dm_heysxmpz.ys23 as ys23,dm_heysxmpz.byx23 as byx23,dm_heysxmpz.ysbztp23 as ysbztp23,dm_heysxmpz.ysbzsm23 as ysbzsm23,dm_heysxmpz.ys24 as ys24,dm_heysxmpz.byx24 as byx24,dm_heysxmpz.ysbztp24 as ysbztp24,dm_heysxmpz.ysbzsm24 as ysbzsm24,dm_heysxmpz.ys25 as ys25,dm_heysxmpz.byx25 as byx25,dm_heysxmpz.ysbztp25 as ysbztp25,dm_heysxmpz.ysbzsm25 as ysbzsm25,dm_heysxmpz.ys26 as ys26,dm_heysxmpz.byx26 as byx26,dm_heysxmpz.ysbztp26 as ysbztp26,dm_heysxmpz.ysbzsm26 as ysbzsm26,dm_heysxmpz.ys27 as ys27,dm_heysxmpz.byx27 as byx27,dm_heysxmpz.ysbztp27 as ysbztp27,dm_heysxmpz.ysbzsm27 as ysbzsm27,dm_heysxmpz.ys28 as ys28,dm_heysxmpz.byx28 as byx28,dm_heysxmpz.ysbztp28 as ysbztp28,dm_heysxmpz.ysbzsm28 as ysbzsm28,dm_heysxmpz.ys29 as ys29,dm_heysxmpz.byx29 as byx29,dm_heysxmpz.ysbztp29 as ysbztp29,dm_heysxmpz.ysbzsm29 as ysbzsm29,dm_heysxmpz.ys30 as ys30,dm_heysxmpz.byx30 as byx30,dm_heysxmpz.ysbztp30 as ysbztp30,dm_heysxmpz.ysbzsm30 as ysbzsm30,dm_heysxmpz.ys31 as ys31,dm_heysxmpz.byx31 as byx31,dm_heysxmpz.ysbztp31 as ysbztp31,dm_heysxmpz.ysbzsm31 as ysbzsm31,dm_heysxmpz.ys32 as ys32,dm_heysxmpz.byx32 as byx32,dm_heysxmpz.ysbztp32 as ysbztp32,dm_heysxmpz.ysbzsm32 as ysbzsm32,dm_heysxmpz.ys33 as ys33,dm_heysxmpz.byx33 as byx33,dm_heysxmpz.ysbztp33 as ysbztp33,dm_heysxmpz.ysbzsm33 as ysbzsm33,dm_heysxmpz.ys34 as ys34,dm_heysxmpz.byx34 as byx34,dm_heysxmpz.ysbztp34 as ysbztp34,dm_heysxmpz.ysbzsm34 as ysbzsm34,dm_heysxmpz.ys35 as ys35,dm_heysxmpz.byx35 as byx35,dm_heysxmpz.ysbztp35 as ysbztp35,dm_heysxmpz.ysbzsm35 as ysbzsm35,dm_heysxmpz.ys36 as ys36,dm_heysxmpz.byx36 as byx36,dm_heysxmpz.ysbztp36 as ysbztp36,dm_heysxmpz.ysbzsm36 as ysbzsm36,dm_heysxmpz.ys37 as ys37,dm_heysxmpz.byx37 as byx37,dm_heysxmpz.ysbztp37 as ysbztp37,dm_heysxmpz.ysbzsm37 as ysbzsm37,dm_heysxmpz.ys38 as ys38,dm_heysxmpz.byx38 as byx38,dm_heysxmpz.ysbztp38 as ysbztp38,dm_heysxmpz.ysbzsm38 as ysbzsm38,dm_heysxmpz.ys39 as ys39,dm_heysxmpz.byx39 as byx39,dm_heysxmpz.ysbztp39 as ysbztp39,dm_heysxmpz.ysbzsm39 as ysbzsm39,dm_heysxmpz.ys40 as ys40,dm_heysxmpz.byx40 as byx40,dm_heysxmpz.ysbztp40 as ysbztp40,dm_heysxmpz.ysbzsm40 as ysbzsm40,dm_heysxmpz.ys41 as ys41,dm_heysxmpz.byx41 as byx41,dm_heysxmpz.ysbztp41 as ysbztp41,dm_heysxmpz.ysbzsm41 as ysbzsm41,dm_heysxmpz.ys42 as ys42,dm_heysxmpz.byx42 as byx42,dm_heysxmpz.ysbztp42 as ysbztp42,dm_heysxmpz.ysbzsm42 as ysbzsm42,dm_heysxmpz.ys43 as ys43,dm_heysxmpz.byx43 as byx43,dm_heysxmpz.ysbztp43 as ysbztp43,dm_heysxmpz.ysbzsm43 as ysbzsm43,dm_heysxmpz.ys44 as ys44,dm_heysxmpz.byx44 as byx44,dm_heysxmpz.ysbztp44 as ysbztp44,dm_heysxmpz.ysbzsm44 as ysbzsm44,dm_heysxmpz.ys45 as ys45,dm_heysxmpz.byx45 as byx45,dm_heysxmpz.ysbztp45 as ysbztp45,dm_heysxmpz.ysbzsm45 as ysbzsm45,dm_heysxmpz.ys46 as ys46,dm_heysxmpz.byx46 as byx46,dm_heysxmpz.ysbztp46 as ysbztp46,dm_heysxmpz.ysbzsm46 as ysbzsm46,dm_heysxmpz.ys47 as ys47,dm_heysxmpz.byx47 as byx47,dm_heysxmpz.ysbztp47 as ysbztp47,dm_heysxmpz.ysbzsm47 as ysbzsm47,dm_heysxmpz.ys48 as ys48,dm_heysxmpz.byx48 as byx48,dm_heysxmpz.ysbztp48 as ysbztp48,dm_heysxmpz.ysbzsm48 as ysbzsm48,dm_heysxmpz.ys49 as ys49,dm_heysxmpz.byx49 as byx49,dm_heysxmpz.ysbztp49 as ysbztp49,dm_heysxmpz.ysbzsm49 as ysbzsm49,dm_heysxmpz.ys50 as ys50,dm_heysxmpz.byx50 as byx50,dm_heysxmpz.ysbztp50 as ysbztp50,dm_heysxmpz.ysbzsm50 as ysbzsm50 ";
	ls_sql+=" from  dm_hegcysbb,dm_heysxmpz";
	ls_sql+=" where dm_heysxmpz.gcysbbh=dm_hegcysbb.gcysbbh(+) and  (dm_heysxmpz.gcysbbh='"+wheregcysbbh+"') and  (dm_heysxmpz.gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcysbbh=cf.fillHtml(rs.getString("gcysbbh"));
		dm_hegcysbb_gcysbbmc=cf.fillHtml(rs.getString("dm_hegcysbb_gcysbbmc"));
		gcysxmbm=cf.fillHtml(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillHtml(rs.getString("gcysxmmc"));
		yszxsl=cf.fillHtml(rs.getString("yszxsl"));
		ys1=cf.fillHtml(rs.getString("ys1"));
		byx1=cf.fillHtml(rs.getString("byx1"));
		ysbztp1=cf.fillHtml(rs.getString("ysbztp1"));
		ysbzsm1=cf.fillHtml(rs.getString("ysbzsm1"));
		ys2=cf.fillHtml(rs.getString("ys2"));
		byx2=cf.fillHtml(rs.getString("byx2"));
		ysbztp2=cf.fillHtml(rs.getString("ysbztp2"));
		ysbzsm2=cf.fillHtml(rs.getString("ysbzsm2"));
		ys3=cf.fillHtml(rs.getString("ys3"));
		byx3=cf.fillHtml(rs.getString("byx3"));
		ysbztp3=cf.fillHtml(rs.getString("ysbztp3"));
		ysbzsm3=cf.fillHtml(rs.getString("ysbzsm3"));
		ys4=cf.fillHtml(rs.getString("ys4"));
		byx4=cf.fillHtml(rs.getString("byx4"));
		ysbztp4=cf.fillHtml(rs.getString("ysbztp4"));
		ysbzsm4=cf.fillHtml(rs.getString("ysbzsm4"));
		ys5=cf.fillHtml(rs.getString("ys5"));
		byx5=cf.fillHtml(rs.getString("byx5"));
		ysbztp5=cf.fillHtml(rs.getString("ysbztp5"));
		ysbzsm5=cf.fillHtml(rs.getString("ysbzsm5"));
		ys6=cf.fillHtml(rs.getString("ys6"));
		byx6=cf.fillHtml(rs.getString("byx6"));
		ysbztp6=cf.fillHtml(rs.getString("ysbztp6"));
		ysbzsm6=cf.fillHtml(rs.getString("ysbzsm6"));
		ys7=cf.fillHtml(rs.getString("ys7"));
		byx7=cf.fillHtml(rs.getString("byx7"));
		ysbztp7=cf.fillHtml(rs.getString("ysbztp7"));
		ysbzsm7=cf.fillHtml(rs.getString("ysbzsm7"));
		ys8=cf.fillHtml(rs.getString("ys8"));
		byx8=cf.fillHtml(rs.getString("byx8"));
		ysbztp8=cf.fillHtml(rs.getString("ysbztp8"));
		ysbzsm8=cf.fillHtml(rs.getString("ysbzsm8"));
		ys9=cf.fillHtml(rs.getString("ys9"));
		byx9=cf.fillHtml(rs.getString("byx9"));
		ysbztp9=cf.fillHtml(rs.getString("ysbztp9"));
		ysbzsm9=cf.fillHtml(rs.getString("ysbzsm9"));
		ys10=cf.fillHtml(rs.getString("ys10"));
		byx10=cf.fillHtml(rs.getString("byx10"));
		ysbztp10=cf.fillHtml(rs.getString("ysbztp10"));
		ysbzsm10=cf.fillHtml(rs.getString("ysbzsm10"));
		ys11=cf.fillHtml(rs.getString("ys11"));
		byx11=cf.fillHtml(rs.getString("byx11"));
		ysbztp11=cf.fillHtml(rs.getString("ysbztp11"));
		ysbzsm11=cf.fillHtml(rs.getString("ysbzsm11"));
		ys12=cf.fillHtml(rs.getString("ys12"));
		byx12=cf.fillHtml(rs.getString("byx12"));
		ysbztp12=cf.fillHtml(rs.getString("ysbztp12"));
		ysbzsm12=cf.fillHtml(rs.getString("ysbzsm12"));
		ys13=cf.fillHtml(rs.getString("ys13"));
		byx13=cf.fillHtml(rs.getString("byx13"));
		ysbztp13=cf.fillHtml(rs.getString("ysbztp13"));
		ysbzsm13=cf.fillHtml(rs.getString("ysbzsm13"));
		ys14=cf.fillHtml(rs.getString("ys14"));
		byx14=cf.fillHtml(rs.getString("byx14"));
		ysbztp14=cf.fillHtml(rs.getString("ysbztp14"));
		ysbzsm14=cf.fillHtml(rs.getString("ysbzsm14"));
		ys15=cf.fillHtml(rs.getString("ys15"));
		byx15=cf.fillHtml(rs.getString("byx15"));
		ysbztp15=cf.fillHtml(rs.getString("ysbztp15"));
		ysbzsm15=cf.fillHtml(rs.getString("ysbzsm15"));
		ys16=cf.fillHtml(rs.getString("ys16"));
		byx16=cf.fillHtml(rs.getString("byx16"));
		ysbztp16=cf.fillHtml(rs.getString("ysbztp16"));
		ysbzsm16=cf.fillHtml(rs.getString("ysbzsm16"));
		ys17=cf.fillHtml(rs.getString("ys17"));
		byx17=cf.fillHtml(rs.getString("byx17"));
		ysbztp17=cf.fillHtml(rs.getString("ysbztp17"));
		ysbzsm17=cf.fillHtml(rs.getString("ysbzsm17"));
		ys18=cf.fillHtml(rs.getString("ys18"));
		byx18=cf.fillHtml(rs.getString("byx18"));
		ysbztp18=cf.fillHtml(rs.getString("ysbztp18"));
		ysbzsm18=cf.fillHtml(rs.getString("ysbzsm18"));
		ys19=cf.fillHtml(rs.getString("ys19"));
		byx19=cf.fillHtml(rs.getString("byx19"));
		ysbztp19=cf.fillHtml(rs.getString("ysbztp19"));
		ysbzsm19=cf.fillHtml(rs.getString("ysbzsm19"));
		ys20=cf.fillHtml(rs.getString("ys20"));
		byx20=cf.fillHtml(rs.getString("byx20"));
		ysbztp20=cf.fillHtml(rs.getString("ysbztp20"));
		ysbzsm20=cf.fillHtml(rs.getString("ysbzsm20"));
		ys21=cf.fillHtml(rs.getString("ys21"));
		byx21=cf.fillHtml(rs.getString("byx21"));
		ysbztp21=cf.fillHtml(rs.getString("ysbztp21"));
		ysbzsm21=cf.fillHtml(rs.getString("ysbzsm21"));
		ys22=cf.fillHtml(rs.getString("ys22"));
		byx22=cf.fillHtml(rs.getString("byx22"));
		ysbztp22=cf.fillHtml(rs.getString("ysbztp22"));
		ysbzsm22=cf.fillHtml(rs.getString("ysbzsm22"));
		ys23=cf.fillHtml(rs.getString("ys23"));
		byx23=cf.fillHtml(rs.getString("byx23"));
		ysbztp23=cf.fillHtml(rs.getString("ysbztp23"));
		ysbzsm23=cf.fillHtml(rs.getString("ysbzsm23"));
		ys24=cf.fillHtml(rs.getString("ys24"));
		byx24=cf.fillHtml(rs.getString("byx24"));
		ysbztp24=cf.fillHtml(rs.getString("ysbztp24"));
		ysbzsm24=cf.fillHtml(rs.getString("ysbzsm24"));
		ys25=cf.fillHtml(rs.getString("ys25"));
		byx25=cf.fillHtml(rs.getString("byx25"));
		ysbztp25=cf.fillHtml(rs.getString("ysbztp25"));
		ysbzsm25=cf.fillHtml(rs.getString("ysbzsm25"));
		ys26=cf.fillHtml(rs.getString("ys26"));
		byx26=cf.fillHtml(rs.getString("byx26"));
		ysbztp26=cf.fillHtml(rs.getString("ysbztp26"));
		ysbzsm26=cf.fillHtml(rs.getString("ysbzsm26"));
		ys27=cf.fillHtml(rs.getString("ys27"));
		byx27=cf.fillHtml(rs.getString("byx27"));
		ysbztp27=cf.fillHtml(rs.getString("ysbztp27"));
		ysbzsm27=cf.fillHtml(rs.getString("ysbzsm27"));
		ys28=cf.fillHtml(rs.getString("ys28"));
		byx28=cf.fillHtml(rs.getString("byx28"));
		ysbztp28=cf.fillHtml(rs.getString("ysbztp28"));
		ysbzsm28=cf.fillHtml(rs.getString("ysbzsm28"));
		ys29=cf.fillHtml(rs.getString("ys29"));
		byx29=cf.fillHtml(rs.getString("byx29"));
		ysbztp29=cf.fillHtml(rs.getString("ysbztp29"));
		ysbzsm29=cf.fillHtml(rs.getString("ysbzsm29"));
		ys30=cf.fillHtml(rs.getString("ys30"));
		byx30=cf.fillHtml(rs.getString("byx30"));
		ysbztp30=cf.fillHtml(rs.getString("ysbztp30"));
		ysbzsm30=cf.fillHtml(rs.getString("ysbzsm30"));
		ys31=cf.fillHtml(rs.getString("ys31"));
		byx31=cf.fillHtml(rs.getString("byx31"));
		ysbztp31=cf.fillHtml(rs.getString("ysbztp31"));
		ysbzsm31=cf.fillHtml(rs.getString("ysbzsm31"));
		ys32=cf.fillHtml(rs.getString("ys32"));
		byx32=cf.fillHtml(rs.getString("byx32"));
		ysbztp32=cf.fillHtml(rs.getString("ysbztp32"));
		ysbzsm32=cf.fillHtml(rs.getString("ysbzsm32"));
		ys33=cf.fillHtml(rs.getString("ys33"));
		byx33=cf.fillHtml(rs.getString("byx33"));
		ysbztp33=cf.fillHtml(rs.getString("ysbztp33"));
		ysbzsm33=cf.fillHtml(rs.getString("ysbzsm33"));
		ys34=cf.fillHtml(rs.getString("ys34"));
		byx34=cf.fillHtml(rs.getString("byx34"));
		ysbztp34=cf.fillHtml(rs.getString("ysbztp34"));
		ysbzsm34=cf.fillHtml(rs.getString("ysbzsm34"));
		ys35=cf.fillHtml(rs.getString("ys35"));
		byx35=cf.fillHtml(rs.getString("byx35"));
		ysbztp35=cf.fillHtml(rs.getString("ysbztp35"));
		ysbzsm35=cf.fillHtml(rs.getString("ysbzsm35"));
		ys36=cf.fillHtml(rs.getString("ys36"));
		byx36=cf.fillHtml(rs.getString("byx36"));
		ysbztp36=cf.fillHtml(rs.getString("ysbztp36"));
		ysbzsm36=cf.fillHtml(rs.getString("ysbzsm36"));
		ys37=cf.fillHtml(rs.getString("ys37"));
		byx37=cf.fillHtml(rs.getString("byx37"));
		ysbztp37=cf.fillHtml(rs.getString("ysbztp37"));
		ysbzsm37=cf.fillHtml(rs.getString("ysbzsm37"));
		ys38=cf.fillHtml(rs.getString("ys38"));
		byx38=cf.fillHtml(rs.getString("byx38"));
		ysbztp38=cf.fillHtml(rs.getString("ysbztp38"));
		ysbzsm38=cf.fillHtml(rs.getString("ysbzsm38"));
		ys39=cf.fillHtml(rs.getString("ys39"));
		byx39=cf.fillHtml(rs.getString("byx39"));
		ysbztp39=cf.fillHtml(rs.getString("ysbztp39"));
		ysbzsm39=cf.fillHtml(rs.getString("ysbzsm39"));
		ys40=cf.fillHtml(rs.getString("ys40"));
		byx40=cf.fillHtml(rs.getString("byx40"));
		ysbztp40=cf.fillHtml(rs.getString("ysbztp40"));
		ysbzsm40=cf.fillHtml(rs.getString("ysbzsm40"));
		ys41=cf.fillHtml(rs.getString("ys41"));
		byx41=cf.fillHtml(rs.getString("byx41"));
		ysbztp41=cf.fillHtml(rs.getString("ysbztp41"));
		ysbzsm41=cf.fillHtml(rs.getString("ysbzsm41"));
		ys42=cf.fillHtml(rs.getString("ys42"));
		byx42=cf.fillHtml(rs.getString("byx42"));
		ysbztp42=cf.fillHtml(rs.getString("ysbztp42"));
		ysbzsm42=cf.fillHtml(rs.getString("ysbzsm42"));
		ys43=cf.fillHtml(rs.getString("ys43"));
		byx43=cf.fillHtml(rs.getString("byx43"));
		ysbztp43=cf.fillHtml(rs.getString("ysbztp43"));
		ysbzsm43=cf.fillHtml(rs.getString("ysbzsm43"));
		ys44=cf.fillHtml(rs.getString("ys44"));
		byx44=cf.fillHtml(rs.getString("byx44"));
		ysbztp44=cf.fillHtml(rs.getString("ysbztp44"));
		ysbzsm44=cf.fillHtml(rs.getString("ysbzsm44"));
		ys45=cf.fillHtml(rs.getString("ys45"));
		byx45=cf.fillHtml(rs.getString("byx45"));
		ysbztp45=cf.fillHtml(rs.getString("ysbztp45"));
		ysbzsm45=cf.fillHtml(rs.getString("ysbzsm45"));
		ys46=cf.fillHtml(rs.getString("ys46"));
		byx46=cf.fillHtml(rs.getString("byx46"));
		ysbztp46=cf.fillHtml(rs.getString("ysbztp46"));
		ysbzsm46=cf.fillHtml(rs.getString("ysbzsm46"));
		ys47=cf.fillHtml(rs.getString("ys47"));
		byx47=cf.fillHtml(rs.getString("byx47"));
		ysbztp47=cf.fillHtml(rs.getString("ysbztp47"));
		ysbzsm47=cf.fillHtml(rs.getString("ysbzsm47"));
		ys48=cf.fillHtml(rs.getString("ys48"));
		byx48=cf.fillHtml(rs.getString("byx48"));
		ysbztp48=cf.fillHtml(rs.getString("ysbztp48"));
		ysbzsm48=cf.fillHtml(rs.getString("ysbzsm48"));
		ys49=cf.fillHtml(rs.getString("ys49"));
		byx49=cf.fillHtml(rs.getString("byx49"));
		ysbztp49=cf.fillHtml(rs.getString("ysbztp49"));
		ysbzsm49=cf.fillHtml(rs.getString("ysbzsm49"));
		ys50=cf.fillHtml(rs.getString("ys50"));
		byx50=cf.fillHtml(rs.getString("byx50"));
		ysbztp50=cf.fillHtml(rs.getString("ysbztp50"));
		ysbzsm50=cf.fillHtml(rs.getString("ysbzsm50"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="0">
<tr bgcolor="#FFFFFF" height="30">
  <td colspan="2" align="right"> 
    验收版本号  </td>
  <td width="30%"> 
<%=gcysbbh%>  </td>
  <td align="right" width="17%"> 
    验收版本名称  </td>
  <td width="33%"> 
    <%=dm_hegcysbb_gcysbbmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td colspan="2" align="right"> 
    验收项目编码  </td>
  <td width="30%"> 
<%=gcysxmbm%>  </td>
  <td align="right" width="17%">验收子项数量 </td>
  <td width="33%"><%=yszxsl%></td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td colspan="2" align="right"> 
    验收项目名称</td>
  <td colspan="3"><%=gcysxmmc%> </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项1</td>
  <td align="right" >名称</td>
  <td colspan="2"><%=ys1%></td>
  <td width="33%" rowspan="3"> 
    <img src="/imggcys/<%=ysbztp1%>" width="90">  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td colspan="2"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx1,true);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm1%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项2</td>
  <td align="right" >名称 </td>
  <td colspan="3"><%=ys2%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx2,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp2%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm2%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项3</td>
  <td align="right" >名称</td>
  <td colspan="3"><%=ys3%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx3,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp3%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm3%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项4</td>
  <td align="right" >名称</td>
  <td colspan="3"><%=ys4%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx4,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp4%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm4%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项5</td>
  <td align="right" >名称 </td>
  <td colspan="3"><%=ys5%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx5,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp5%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm5%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项6</td>
  <td align="right" >名称</td>
  <td colspan="3"><%=ys6%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx6,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp6%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm6%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项7</td>
  <td align="right" >名称 </td>
  <td colspan="3"><%=ys7%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx7,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp7%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm7%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项8</td>
  <td align="right" >名称</td>
  <td colspan="3"><%=ys8%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx8,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp8%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm8%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项9</td>
  <td align="right" >名称</td>
  <td colspan="3"><%=ys9%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx9,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp9%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="3"> 
    <%=ysbzsm9%>  </td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项10</td>
  <td align="right" >名称</td>
  <td colspan="3"><%=ys10%></td>
  </tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx10,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp10%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm10%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项11</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys11%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx11,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp11%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm11%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项12</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys12%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx12,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp12%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm12%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项13</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys13%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx13,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp13%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm13%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项14</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys14%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx14,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp14%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm14%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项15</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys15%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx15,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp15%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm15%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项16</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys16%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx16,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp16%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm16%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项17</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys17%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx17,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp17%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm17%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项18</td>
  <td align="right">名称 </td>
  <td colspan="2"><%=ys18%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx18,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp18%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm18%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项19</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys19%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx19,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp19%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm19%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项20</td>
  <td align="right">名称</td>
  <td colspan="2"><%=ys20%></td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx20,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp20%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td colspan="2"> 
    <%=ysbzsm20%>  </td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项21</td>
  <td align="right">名称 </td>
  <td><%=ys21%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx21,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp21%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm21%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项22</td>
  <td align="right">名称</td>
  <td><%=ys22%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx22,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp22%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm22%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项23</td>
  <td align="right">名称</td>
  <td><%=ys23%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx23,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp23%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm23%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项24</td>
  <td align="right">名称 </td>
  <td><%=ys24%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx24,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp24%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm24%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项25</td>
  <td align="right">名称</td>
  <td><%=ys25%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx25,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp25%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm25%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项26</td>
  <td align="right">名称</td>
  <td><%=ys26%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx26,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp26%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm26%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项27</td>
  <td align="right">名称</td>
  <td><%=ys27%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx27,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp27%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm27%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项28</td>
  <td align="right">名称</td>
  <td><%=ys28%> </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx28,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp28%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm28%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项29</td>
  <td align="right">名称 </td>
  <td><%=ys29%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx29,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp29%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm29%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项30</td>
  <td align="right">名称</td>
  <td><%=ys30%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx30,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp30%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm30%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项31</td>
  <td align="right">名称 </td>
  <td><%=ys31%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx31,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp31%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm31%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项32</td>
  <td align="right">名称</td>
  <td><%=ys32%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx32,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp32%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm32%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项33</td>
  <td align="right">名称</td>
  <td><%=ys33%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx33,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp33%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm33%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项34</td>
  <td align="right">名称</td>
  <td><%=ys34%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx34,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp34%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm34%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项35</td>
  <td align="right">名称</td>
  <td><%=ys35%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx35,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp35%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm35%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项36</td>
  <td align="right">名称</td>
  <td><%=ys36%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx36,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp36%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm36%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项37</td>
  <td align="right">名称</td>
  <td><%=ys37%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx37,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp37%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm37%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项38</td>
  <td align="right">名称 </td>
  <td><%=ys38%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx38,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp38%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm38%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项39</td>
  <td align="right">名称 </td>
  <td><%=ys39%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx39,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp39%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm39%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项40</td>
  <td align="right">名称</td>
  <td><%=ys40%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx40,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp40%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm40%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项41</td>
  <td align="right">名称</td>
  <td><%=ys41%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx41,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp41%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm41%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项42</td>
  <td align="right">名称</td>
  <td><%=ys42%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项42  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx42,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp42%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm42%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项43</td>
  <td align="right">名称</td>
  <td><%=ys43%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx43,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp43%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    验收子项43说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm43%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项44</td>
  <td align="right">名称</td>
  <td><%=ys44%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项44  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx44,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp44%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm44%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项45</td>
  <td align="right">名称</td>
  <td><%=ys45%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx45,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp45%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm45%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项46</td>
  <td align="right">名称</td>
  <td><%=ys46%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx46,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp46%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm46%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项47</td>
  <td align="right">名称</td>
  <td><%=ys47%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx47,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp47%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm47%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项48</td>
  <td align="right">名称</td>
  <td><%=ys48%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" height="26" align="right"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx48,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp48%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm48%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项49</td>
  <td align="right">名称</td>
  <td><%=ys49%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项  </td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx49,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp49%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm49%>  </td>
  <td align="right" width="17%">&nbsp;</td>
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td width="10%" rowspan="3" align="right">验收子项50</td>
  <td align="right">名称</td>
  <td><%=ys50%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    必验项</td>
  <td width="30%"> 
<%
	cf.radioToken(out, "0+否&1+必验项",byx50,true);
%>  </td>
  <td align="right" width="17%"> 
    说明图片  </td>
  <td width="33%"> 
    <%=ysbztp50%>  </td>
</tr>
<tr bgcolor="#FFFFFF" height="30">
  <td align="right" width="10%"> 
    说明文字  </td>
  <td width="30%"> 
    <%=ysbzsm50%>  </td>
  <td align="right" width="17%">&nbsp;  </td>
  <td width="33%">&nbsp;  </td>
</tr>
</table>
</body>
</html>
