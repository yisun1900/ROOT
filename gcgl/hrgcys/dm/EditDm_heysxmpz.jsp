<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcysbbh=null;
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
String xmfl1=null;
String ysjg1=null;
String xmfl2=null;
String ysjg2=null;
String xmfl3=null;
String ysjg3=null;
String xmfl4=null;
String ysjg4=null;
String xmfl5=null;
String ysjg5=null;
String xmfl6=null;
String ysjg6=null;
String xmfl7=null;
String ysjg7=null;
String xmfl8=null;
String ysjg8=null;
String xmfl9=null;
String ysjg9=null;
String xmfl11=null;
String ysjg11=null;
String xmfl12=null;
String ysjg12=null;
String xmfl13=null;
String ysjg13=null;
String xmfl14=null;
String ysjg14=null;
String xmfl15=null;
String ysjg15=null;
String xmfl16=null;
String ysjg16=null;
String xmfl17=null;
String ysjg17=null;
String xmfl18=null;
String ysjg18=null;
String xmfl19=null;
String ysjg19=null;
String xmfl10=null;
String ysjg10=null;
String xmfl20=null;
String ysjg20=null;
String xmfl21=null;
String ysjg21=null;
String xmfl22=null;
String ysjg22=null;
String xmfl23=null;
String ysjg23=null;
String xmfl24=null;
String ysjg24=null;
String xmfl25=null;
String ysjg25=null;
String xmfl26=null;
String ysjg26=null;
String xmfl27=null;
String ysjg27=null;
String xmfl28=null;
String ysjg28=null;
String xmfl29=null;
String ysjg29=null;
String xmfl30=null;
String ysjg30=null;
String xmfl31=null;
String ysjg31=null;
String xmfl32=null;
String ysjg32=null;
String xmfl33=null;
String ysjg33=null;
String xmfl34=null;
String ysjg34=null;
String xmfl35=null;
String ysjg35=null;
String xmfl36=null;
String ysjg36=null;
String xmfl37=null;
String ysjg37=null;
String xmfl38=null;
String ysjg38=null;
String xmfl39=null;
String ysjg39=null;
String xmfl40=null;
String ysjg40=null;
String xmfl41=null;
String ysjg41=null;
String xmfl42=null;
String ysjg42=null;
String xmfl43=null;
String ysjg43=null;
String xmfl44=null;
String ysjg44=null;
String xmfl45=null;
String ysjg45=null;
String xmfl46=null;
String ysjg46=null;
String xmfl47=null;
String ysjg47=null;
String xmfl48=null;
String ysjg48=null;
String xmfl49=null;
String ysjg49=null;
String xmfl50=null;
String ysjg50=null;
String hbx1=null;
String hbx2=null;
String hbx3=null;
String hbx4=null;
String hbx5=null;
String hbx6=null;
String hbx7=null;
String hbx8=null;
String hbx9=null;
String hbx10=null;
String hbx11=null;
String hbx12=null;
String hbx13=null;
String hbx14=null;
String hbx15=null;
String hbx16=null;
String hbx17=null;
String hbx18=null;
String hbx19=null;
String hbx20=null;
String hbx21=null;
String hbx22=null;
String hbx23=null;
String hbx24=null;
String hbx25=null;
String hbx26=null;
String hbx27=null;
String hbx28=null;
String hbx29=null;
String hbx30=null;
String hbx31=null;
String hbx32=null;
String hbx33=null;
String hbx34=null;
String hbx35=null;
String hbx36=null;
String hbx37=null;
String hbx38=null;
String hbx39=null;
String hbx40=null;
String hbx41=null;
String hbx42=null;
String hbx43=null;
String hbx44=null;
String hbx45=null;
String hbx46=null;
String hbx47=null;
String hbx48=null;
String hbx49=null;
String hbx50=null;
String wheregcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
String wheregcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gcysbbh,gcysxmbm,gcysxmmc,yszxsl,ys1,byx1,ysbztp1,ysbzsm1,ys2,byx2,ysbztp2,ysbzsm2,ys3,byx3,ysbztp3,ysbzsm3,ys4,byx4,ysbztp4,ysbzsm4,ys5,byx5,ysbztp5,ysbzsm5,ys6,byx6,ysbztp6,ysbzsm6,ys7,byx7,ysbztp7,ysbzsm7,ys8,byx8,ysbztp8,ysbzsm8,ys9,byx9,ysbztp9,ysbzsm9,ys10,byx10,ysbztp10,ysbzsm10,ys11,byx11,ysbztp11,ysbzsm11,ys12,byx12,ysbztp12,ysbzsm12,ys13,byx13,ysbztp13,ysbzsm13,ys14,byx14,ysbztp14,ysbzsm14,ys15,byx15,ysbztp15,ysbzsm15,ys16,byx16,ysbztp16,ysbzsm16,ys17,byx17,ysbztp17,ysbzsm17,ys18,byx18,ysbztp18,ysbzsm18,ys19,byx19,ysbztp19,ysbzsm19,ys20,byx20,ysbztp20,ysbzsm20,ys21,byx21,ysbztp21,ysbzsm21,ys22,byx22,ysbztp22,ysbzsm22,ys23,byx23,ysbztp23,ysbzsm23,ys24,byx24,ysbztp24,ysbzsm24,ys25,byx25,ysbztp25,ysbzsm25,ys26,byx26,ysbztp26,ysbzsm26,ys27,byx27,ysbztp27,ysbzsm27,ys28,byx28,ysbztp28,ysbzsm28,ys29,byx29,ysbztp29,ysbzsm29,ys30,byx30,ysbztp30,ysbzsm30,ys31,byx31,ysbztp31,ysbzsm31,ys32,byx32,ysbztp32,ysbzsm32,ys33,byx33,ysbztp33,ysbzsm33,ys34,byx34,ysbztp34,ysbzsm34,ys35,byx35,ysbztp35,ysbzsm35,ys36,byx36,ysbztp36,ysbzsm36,ys37,byx37,ysbztp37,ysbzsm37,ys38,byx38,ysbztp38,ysbzsm38,ys39,byx39,ysbztp39,ysbzsm39,ys40,byx40,ysbztp40,ysbzsm40,ys41,byx41,ysbztp41,ysbzsm41,ys42,byx42,ysbztp42,ysbzsm42,ys43,byx43,ysbztp43,ysbzsm43,ys44,byx44,ysbztp44,ysbzsm44,ys45,byx45,ysbztp45,ysbzsm45,ys46,byx46,ysbztp46,ysbzsm46,ys47,byx47,ysbztp47,ysbzsm47,ys48,byx48,ysbztp48,ysbzsm48,ys49,byx49,ysbztp49,ysbzsm49,ys50,byx50,ysbztp50,ysbzsm50,xmfl1,ysjg1,xmfl2,ysjg2,xmfl3,ysjg3,xmfl4,ysjg4,xmfl5,ysjg5,xmfl6,ysjg6,xmfl7,ysjg7,xmfl8,ysjg8,xmfl9,ysjg9,xmfl11,ysjg11,xmfl12,ysjg12,xmfl13,ysjg13,xmfl14,ysjg14,xmfl15,ysjg15,xmfl16,ysjg16,xmfl17,ysjg17,xmfl18,ysjg18,xmfl19,ysjg19,xmfl10,ysjg10,xmfl20,ysjg20,xmfl21,ysjg21,xmfl22,ysjg22,xmfl23,ysjg23,xmfl24,ysjg24,xmfl25,ysjg25,xmfl26,ysjg26,xmfl27,ysjg27,xmfl28,ysjg28,xmfl29,ysjg29,xmfl30,ysjg30,xmfl31,ysjg31,xmfl32,ysjg32,xmfl33,ysjg33,xmfl34,ysjg34,xmfl35,ysjg35,xmfl36,ysjg36,xmfl37,ysjg37,xmfl38,ysjg38,xmfl39,ysjg39,xmfl40,ysjg40,xmfl41,ysjg41,xmfl42,ysjg42,xmfl43,ysjg43,xmfl44,ysjg44,xmfl45,ysjg45,xmfl46,ysjg46,xmfl47,ysjg47,xmfl48,ysjg48,xmfl49,ysjg49,xmfl50,ysjg50 ";
	ls_sql+=" ,hbx1,hbx2,hbx3,hbx4,hbx5,hbx6,hbx7,hbx8,hbx9,hbx10,hbx11,hbx12,hbx13,hbx14,hbx15,hbx16,hbx17,hbx18,hbx19,hbx20,hbx21,hbx22,hbx23,hbx24,hbx25,hbx26,hbx27,hbx28,hbx29,hbx30,hbx31,hbx32,hbx33,hbx34,hbx35,hbx36,hbx37,hbx38,hbx39,hbx40,hbx41,hbx42,hbx43,hbx44,hbx45,hbx46,hbx47,hbx48,hbx49,hbx50";
	ls_sql+=" from  dm_heysxmpz";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"') and  (gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		yszxsl=cf.fillNull(rs.getString("yszxsl"));
		ys1=cf.fillNull(rs.getString("ys1"));
		byx1=cf.fillNull(rs.getString("byx1"));
		ysbztp1=cf.fillNull(rs.getString("ysbztp1"));
		ysbzsm1=cf.fillNull(rs.getString("ysbzsm1"));
		ys2=cf.fillNull(rs.getString("ys2"));
		byx2=cf.fillNull(rs.getString("byx2"));
		ysbztp2=cf.fillNull(rs.getString("ysbztp2"));
		ysbzsm2=cf.fillNull(rs.getString("ysbzsm2"));
		ys3=cf.fillNull(rs.getString("ys3"));
		byx3=cf.fillNull(rs.getString("byx3"));
		ysbztp3=cf.fillNull(rs.getString("ysbztp3"));
		ysbzsm3=cf.fillNull(rs.getString("ysbzsm3"));
		ys4=cf.fillNull(rs.getString("ys4"));
		byx4=cf.fillNull(rs.getString("byx4"));
		ysbztp4=cf.fillNull(rs.getString("ysbztp4"));
		ysbzsm4=cf.fillNull(rs.getString("ysbzsm4"));
		ys5=cf.fillNull(rs.getString("ys5"));
		byx5=cf.fillNull(rs.getString("byx5"));
		ysbztp5=cf.fillNull(rs.getString("ysbztp5"));
		ysbzsm5=cf.fillNull(rs.getString("ysbzsm5"));
		ys6=cf.fillNull(rs.getString("ys6"));
		byx6=cf.fillNull(rs.getString("byx6"));
		ysbztp6=cf.fillNull(rs.getString("ysbztp6"));
		ysbzsm6=cf.fillNull(rs.getString("ysbzsm6"));
		ys7=cf.fillNull(rs.getString("ys7"));
		byx7=cf.fillNull(rs.getString("byx7"));
		ysbztp7=cf.fillNull(rs.getString("ysbztp7"));
		ysbzsm7=cf.fillNull(rs.getString("ysbzsm7"));
		ys8=cf.fillNull(rs.getString("ys8"));
		byx8=cf.fillNull(rs.getString("byx8"));
		ysbztp8=cf.fillNull(rs.getString("ysbztp8"));
		ysbzsm8=cf.fillNull(rs.getString("ysbzsm8"));
		ys9=cf.fillNull(rs.getString("ys9"));
		byx9=cf.fillNull(rs.getString("byx9"));
		ysbztp9=cf.fillNull(rs.getString("ysbztp9"));
		ysbzsm9=cf.fillNull(rs.getString("ysbzsm9"));
		ys10=cf.fillNull(rs.getString("ys10"));
		byx10=cf.fillNull(rs.getString("byx10"));
		ysbztp10=cf.fillNull(rs.getString("ysbztp10"));
		ysbzsm10=cf.fillNull(rs.getString("ysbzsm10"));
		ys11=cf.fillNull(rs.getString("ys11"));
		byx11=cf.fillNull(rs.getString("byx11"));
		ysbztp11=cf.fillNull(rs.getString("ysbztp11"));
		ysbzsm11=cf.fillNull(rs.getString("ysbzsm11"));
		ys12=cf.fillNull(rs.getString("ys12"));
		byx12=cf.fillNull(rs.getString("byx12"));
		ysbztp12=cf.fillNull(rs.getString("ysbztp12"));
		ysbzsm12=cf.fillNull(rs.getString("ysbzsm12"));
		ys13=cf.fillNull(rs.getString("ys13"));
		byx13=cf.fillNull(rs.getString("byx13"));
		ysbztp13=cf.fillNull(rs.getString("ysbztp13"));
		ysbzsm13=cf.fillNull(rs.getString("ysbzsm13"));
		ys14=cf.fillNull(rs.getString("ys14"));
		byx14=cf.fillNull(rs.getString("byx14"));
		ysbztp14=cf.fillNull(rs.getString("ysbztp14"));
		ysbzsm14=cf.fillNull(rs.getString("ysbzsm14"));
		ys15=cf.fillNull(rs.getString("ys15"));
		byx15=cf.fillNull(rs.getString("byx15"));
		ysbztp15=cf.fillNull(rs.getString("ysbztp15"));
		ysbzsm15=cf.fillNull(rs.getString("ysbzsm15"));
		ys16=cf.fillNull(rs.getString("ys16"));
		byx16=cf.fillNull(rs.getString("byx16"));
		ysbztp16=cf.fillNull(rs.getString("ysbztp16"));
		ysbzsm16=cf.fillNull(rs.getString("ysbzsm16"));
		ys17=cf.fillNull(rs.getString("ys17"));
		byx17=cf.fillNull(rs.getString("byx17"));
		ysbztp17=cf.fillNull(rs.getString("ysbztp17"));
		ysbzsm17=cf.fillNull(rs.getString("ysbzsm17"));
		ys18=cf.fillNull(rs.getString("ys18"));
		byx18=cf.fillNull(rs.getString("byx18"));
		ysbztp18=cf.fillNull(rs.getString("ysbztp18"));
		ysbzsm18=cf.fillNull(rs.getString("ysbzsm18"));
		ys19=cf.fillNull(rs.getString("ys19"));
		byx19=cf.fillNull(rs.getString("byx19"));
		ysbztp19=cf.fillNull(rs.getString("ysbztp19"));
		ysbzsm19=cf.fillNull(rs.getString("ysbzsm19"));
		ys20=cf.fillNull(rs.getString("ys20"));
		byx20=cf.fillNull(rs.getString("byx20"));
		ysbztp20=cf.fillNull(rs.getString("ysbztp20"));
		ysbzsm20=cf.fillNull(rs.getString("ysbzsm20"));
		ys21=cf.fillNull(rs.getString("ys21"));
		byx21=cf.fillNull(rs.getString("byx21"));
		ysbztp21=cf.fillNull(rs.getString("ysbztp21"));
		ysbzsm21=cf.fillNull(rs.getString("ysbzsm21"));
		ys22=cf.fillNull(rs.getString("ys22"));
		byx22=cf.fillNull(rs.getString("byx22"));
		ysbztp22=cf.fillNull(rs.getString("ysbztp22"));
		ysbzsm22=cf.fillNull(rs.getString("ysbzsm22"));
		ys23=cf.fillNull(rs.getString("ys23"));
		byx23=cf.fillNull(rs.getString("byx23"));
		ysbztp23=cf.fillNull(rs.getString("ysbztp23"));
		ysbzsm23=cf.fillNull(rs.getString("ysbzsm23"));
		ys24=cf.fillNull(rs.getString("ys24"));
		byx24=cf.fillNull(rs.getString("byx24"));
		ysbztp24=cf.fillNull(rs.getString("ysbztp24"));
		ysbzsm24=cf.fillNull(rs.getString("ysbzsm24"));
		ys25=cf.fillNull(rs.getString("ys25"));
		byx25=cf.fillNull(rs.getString("byx25"));
		ysbztp25=cf.fillNull(rs.getString("ysbztp25"));
		ysbzsm25=cf.fillNull(rs.getString("ysbzsm25"));
		ys26=cf.fillNull(rs.getString("ys26"));
		byx26=cf.fillNull(rs.getString("byx26"));
		ysbztp26=cf.fillNull(rs.getString("ysbztp26"));
		ysbzsm26=cf.fillNull(rs.getString("ysbzsm26"));
		ys27=cf.fillNull(rs.getString("ys27"));
		byx27=cf.fillNull(rs.getString("byx27"));
		ysbztp27=cf.fillNull(rs.getString("ysbztp27"));
		ysbzsm27=cf.fillNull(rs.getString("ysbzsm27"));
		ys28=cf.fillNull(rs.getString("ys28"));
		byx28=cf.fillNull(rs.getString("byx28"));
		ysbztp28=cf.fillNull(rs.getString("ysbztp28"));
		ysbzsm28=cf.fillNull(rs.getString("ysbzsm28"));
		ys29=cf.fillNull(rs.getString("ys29"));
		byx29=cf.fillNull(rs.getString("byx29"));
		ysbztp29=cf.fillNull(rs.getString("ysbztp29"));
		ysbzsm29=cf.fillNull(rs.getString("ysbzsm29"));
		ys30=cf.fillNull(rs.getString("ys30"));
		byx30=cf.fillNull(rs.getString("byx30"));
		ysbztp30=cf.fillNull(rs.getString("ysbztp30"));
		ysbzsm30=cf.fillNull(rs.getString("ysbzsm30"));
		ys31=cf.fillNull(rs.getString("ys31"));
		byx31=cf.fillNull(rs.getString("byx31"));
		ysbztp31=cf.fillNull(rs.getString("ysbztp31"));
		ysbzsm31=cf.fillNull(rs.getString("ysbzsm31"));
		ys32=cf.fillNull(rs.getString("ys32"));
		byx32=cf.fillNull(rs.getString("byx32"));
		ysbztp32=cf.fillNull(rs.getString("ysbztp32"));
		ysbzsm32=cf.fillNull(rs.getString("ysbzsm32"));
		ys33=cf.fillNull(rs.getString("ys33"));
		byx33=cf.fillNull(rs.getString("byx33"));
		ysbztp33=cf.fillNull(rs.getString("ysbztp33"));
		ysbzsm33=cf.fillNull(rs.getString("ysbzsm33"));
		ys34=cf.fillNull(rs.getString("ys34"));
		byx34=cf.fillNull(rs.getString("byx34"));
		ysbztp34=cf.fillNull(rs.getString("ysbztp34"));
		ysbzsm34=cf.fillNull(rs.getString("ysbzsm34"));
		ys35=cf.fillNull(rs.getString("ys35"));
		byx35=cf.fillNull(rs.getString("byx35"));
		ysbztp35=cf.fillNull(rs.getString("ysbztp35"));
		ysbzsm35=cf.fillNull(rs.getString("ysbzsm35"));
		ys36=cf.fillNull(rs.getString("ys36"));
		byx36=cf.fillNull(rs.getString("byx36"));
		ysbztp36=cf.fillNull(rs.getString("ysbztp36"));
		ysbzsm36=cf.fillNull(rs.getString("ysbzsm36"));
		ys37=cf.fillNull(rs.getString("ys37"));
		byx37=cf.fillNull(rs.getString("byx37"));
		ysbztp37=cf.fillNull(rs.getString("ysbztp37"));
		ysbzsm37=cf.fillNull(rs.getString("ysbzsm37"));
		ys38=cf.fillNull(rs.getString("ys38"));
		byx38=cf.fillNull(rs.getString("byx38"));
		ysbztp38=cf.fillNull(rs.getString("ysbztp38"));
		ysbzsm38=cf.fillNull(rs.getString("ysbzsm38"));
		ys39=cf.fillNull(rs.getString("ys39"));
		byx39=cf.fillNull(rs.getString("byx39"));
		ysbztp39=cf.fillNull(rs.getString("ysbztp39"));
		ysbzsm39=cf.fillNull(rs.getString("ysbzsm39"));
		ys40=cf.fillNull(rs.getString("ys40"));
		byx40=cf.fillNull(rs.getString("byx40"));
		ysbztp40=cf.fillNull(rs.getString("ysbztp40"));
		ysbzsm40=cf.fillNull(rs.getString("ysbzsm40"));
		ys41=cf.fillNull(rs.getString("ys41"));
		byx41=cf.fillNull(rs.getString("byx41"));
		ysbztp41=cf.fillNull(rs.getString("ysbztp41"));
		ysbzsm41=cf.fillNull(rs.getString("ysbzsm41"));
		ys42=cf.fillNull(rs.getString("ys42"));
		byx42=cf.fillNull(rs.getString("byx42"));
		ysbztp42=cf.fillNull(rs.getString("ysbztp42"));
		ysbzsm42=cf.fillNull(rs.getString("ysbzsm42"));
		ys43=cf.fillNull(rs.getString("ys43"));
		byx43=cf.fillNull(rs.getString("byx43"));
		ysbztp43=cf.fillNull(rs.getString("ysbztp43"));
		ysbzsm43=cf.fillNull(rs.getString("ysbzsm43"));
		ys44=cf.fillNull(rs.getString("ys44"));
		byx44=cf.fillNull(rs.getString("byx44"));
		ysbztp44=cf.fillNull(rs.getString("ysbztp44"));
		ysbzsm44=cf.fillNull(rs.getString("ysbzsm44"));
		ys45=cf.fillNull(rs.getString("ys45"));
		byx45=cf.fillNull(rs.getString("byx45"));
		ysbztp45=cf.fillNull(rs.getString("ysbztp45"));
		ysbzsm45=cf.fillNull(rs.getString("ysbzsm45"));
		ys46=cf.fillNull(rs.getString("ys46"));
		byx46=cf.fillNull(rs.getString("byx46"));
		ysbztp46=cf.fillNull(rs.getString("ysbztp46"));
		ysbzsm46=cf.fillNull(rs.getString("ysbzsm46"));
		ys47=cf.fillNull(rs.getString("ys47"));
		byx47=cf.fillNull(rs.getString("byx47"));
		ysbztp47=cf.fillNull(rs.getString("ysbztp47"));
		ysbzsm47=cf.fillNull(rs.getString("ysbzsm47"));
		ys48=cf.fillNull(rs.getString("ys48"));
		byx48=cf.fillNull(rs.getString("byx48"));
		ysbztp48=cf.fillNull(rs.getString("ysbztp48"));
		ysbzsm48=cf.fillNull(rs.getString("ysbzsm48"));
		ys49=cf.fillNull(rs.getString("ys49"));
		byx49=cf.fillNull(rs.getString("byx49"));
		ysbztp49=cf.fillNull(rs.getString("ysbztp49"));
		ysbzsm49=cf.fillNull(rs.getString("ysbzsm49"));
		ys50=cf.fillNull(rs.getString("ys50"));
		byx50=cf.fillNull(rs.getString("byx50"));
		ysbztp50=cf.fillNull(rs.getString("ysbztp50"));
		ysbzsm50=cf.fillNull(rs.getString("ysbzsm50"));
		xmfl1=cf.fillNull(rs.getString("xmfl1"));
		ysjg1=cf.fillNull(rs.getString("ysjg1"));
		xmfl2=cf.fillNull(rs.getString("xmfl2"));
		ysjg2=cf.fillNull(rs.getString("ysjg2"));
		xmfl3=cf.fillNull(rs.getString("xmfl3"));
		ysjg3=cf.fillNull(rs.getString("ysjg3"));
		xmfl4=cf.fillNull(rs.getString("xmfl4"));
		ysjg4=cf.fillNull(rs.getString("ysjg4"));
		xmfl5=cf.fillNull(rs.getString("xmfl5"));
		ysjg5=cf.fillNull(rs.getString("ysjg5"));
		xmfl6=cf.fillNull(rs.getString("xmfl6"));
		ysjg6=cf.fillNull(rs.getString("ysjg6"));
		xmfl7=cf.fillNull(rs.getString("xmfl7"));
		ysjg7=cf.fillNull(rs.getString("ysjg7"));
		xmfl8=cf.fillNull(rs.getString("xmfl8"));
		ysjg8=cf.fillNull(rs.getString("ysjg8"));
		xmfl9=cf.fillNull(rs.getString("xmfl9"));
		ysjg9=cf.fillNull(rs.getString("ysjg9"));
		xmfl11=cf.fillNull(rs.getString("xmfl11"));
		ysjg11=cf.fillNull(rs.getString("ysjg11"));
		xmfl12=cf.fillNull(rs.getString("xmfl12"));
		ysjg12=cf.fillNull(rs.getString("ysjg12"));
		xmfl13=cf.fillNull(rs.getString("xmfl13"));
		ysjg13=cf.fillNull(rs.getString("ysjg13"));
		xmfl14=cf.fillNull(rs.getString("xmfl14"));
		ysjg14=cf.fillNull(rs.getString("ysjg14"));
		xmfl15=cf.fillNull(rs.getString("xmfl15"));
		ysjg15=cf.fillNull(rs.getString("ysjg15"));
		xmfl16=cf.fillNull(rs.getString("xmfl16"));
		ysjg16=cf.fillNull(rs.getString("ysjg16"));
		xmfl17=cf.fillNull(rs.getString("xmfl17"));
		ysjg17=cf.fillNull(rs.getString("ysjg17"));
		xmfl18=cf.fillNull(rs.getString("xmfl18"));
		ysjg18=cf.fillNull(rs.getString("ysjg18"));
		xmfl19=cf.fillNull(rs.getString("xmfl19"));
		ysjg19=cf.fillNull(rs.getString("ysjg19"));
		xmfl10=cf.fillNull(rs.getString("xmfl10"));
		ysjg10=cf.fillNull(rs.getString("ysjg10"));
		xmfl20=cf.fillNull(rs.getString("xmfl20"));
		ysjg20=cf.fillNull(rs.getString("ysjg20"));
		xmfl21=cf.fillNull(rs.getString("xmfl21"));
		ysjg21=cf.fillNull(rs.getString("ysjg21"));
		xmfl22=cf.fillNull(rs.getString("xmfl22"));
		ysjg22=cf.fillNull(rs.getString("ysjg22"));
		xmfl23=cf.fillNull(rs.getString("xmfl23"));
		ysjg23=cf.fillNull(rs.getString("ysjg23"));
		xmfl24=cf.fillNull(rs.getString("xmfl24"));
		ysjg24=cf.fillNull(rs.getString("ysjg24"));
		xmfl25=cf.fillNull(rs.getString("xmfl25"));
		ysjg25=cf.fillNull(rs.getString("ysjg25"));
		xmfl26=cf.fillNull(rs.getString("xmfl26"));
		ysjg26=cf.fillNull(rs.getString("ysjg26"));
		xmfl27=cf.fillNull(rs.getString("xmfl27"));
		ysjg27=cf.fillNull(rs.getString("ysjg27"));
		xmfl28=cf.fillNull(rs.getString("xmfl28"));
		ysjg28=cf.fillNull(rs.getString("ysjg28"));
		xmfl29=cf.fillNull(rs.getString("xmfl29"));
		ysjg29=cf.fillNull(rs.getString("ysjg29"));
		xmfl30=cf.fillNull(rs.getString("xmfl30"));
		ysjg30=cf.fillNull(rs.getString("ysjg30"));
		xmfl31=cf.fillNull(rs.getString("xmfl31"));
		ysjg31=cf.fillNull(rs.getString("ysjg31"));
		xmfl32=cf.fillNull(rs.getString("xmfl32"));
		ysjg32=cf.fillNull(rs.getString("ysjg32"));
		xmfl33=cf.fillNull(rs.getString("xmfl33"));
		ysjg33=cf.fillNull(rs.getString("ysjg33"));
		xmfl34=cf.fillNull(rs.getString("xmfl34"));
		ysjg34=cf.fillNull(rs.getString("ysjg34"));
		xmfl35=cf.fillNull(rs.getString("xmfl35"));
		ysjg35=cf.fillNull(rs.getString("ysjg35"));
		xmfl36=cf.fillNull(rs.getString("xmfl36"));
		ysjg36=cf.fillNull(rs.getString("ysjg36"));
		xmfl37=cf.fillNull(rs.getString("xmfl37"));
		ysjg37=cf.fillNull(rs.getString("ysjg37"));
		xmfl38=cf.fillNull(rs.getString("xmfl38"));
		ysjg38=cf.fillNull(rs.getString("ysjg38"));
		xmfl39=cf.fillNull(rs.getString("xmfl39"));
		ysjg39=cf.fillNull(rs.getString("ysjg39"));
		xmfl40=cf.fillNull(rs.getString("xmfl40"));
		ysjg40=cf.fillNull(rs.getString("ysjg40"));
		xmfl41=cf.fillNull(rs.getString("xmfl41"));
		ysjg41=cf.fillNull(rs.getString("ysjg41"));
		xmfl42=cf.fillNull(rs.getString("xmfl42"));
		ysjg42=cf.fillNull(rs.getString("ysjg42"));
		xmfl43=cf.fillNull(rs.getString("xmfl43"));
		ysjg43=cf.fillNull(rs.getString("ysjg43"));
		xmfl44=cf.fillNull(rs.getString("xmfl44"));
		ysjg44=cf.fillNull(rs.getString("ysjg44"));
		xmfl45=cf.fillNull(rs.getString("xmfl45"));
		ysjg45=cf.fillNull(rs.getString("ysjg45"));
		xmfl46=cf.fillNull(rs.getString("xmfl46"));
		ysjg46=cf.fillNull(rs.getString("ysjg46"));
		xmfl47=cf.fillNull(rs.getString("xmfl47"));
		ysjg47=cf.fillNull(rs.getString("ysjg47"));
		xmfl48=cf.fillNull(rs.getString("xmfl48"));
		ysjg48=cf.fillNull(rs.getString("ysjg48"));
		xmfl49=cf.fillNull(rs.getString("xmfl49"));
		ysjg49=cf.fillNull(rs.getString("ysjg49"));
		xmfl50=cf.fillNull(rs.getString("xmfl50"));
		ysjg50=cf.fillNull(rs.getString("ysjg50"));

		hbx1=cf.fillNull(rs.getString("hbx1"));
		hbx2=cf.fillNull(rs.getString("hbx2"));
		hbx3=cf.fillNull(rs.getString("hbx3"));
		hbx4=cf.fillNull(rs.getString("hbx4"));
		hbx5=cf.fillNull(rs.getString("hbx5"));
		hbx6=cf.fillNull(rs.getString("hbx6"));
		hbx7=cf.fillNull(rs.getString("hbx7"));
		hbx8=cf.fillNull(rs.getString("hbx8"));
		hbx9=cf.fillNull(rs.getString("hbx9"));
		hbx10=cf.fillNull(rs.getString("hbx10"));
		hbx11=cf.fillNull(rs.getString("hbx11"));
		hbx12=cf.fillNull(rs.getString("hbx12"));
		hbx13=cf.fillNull(rs.getString("hbx13"));
		hbx14=cf.fillNull(rs.getString("hbx14"));
		hbx15=cf.fillNull(rs.getString("hbx15"));
		hbx16=cf.fillNull(rs.getString("hbx16"));
		hbx17=cf.fillNull(rs.getString("hbx17"));
		hbx18=cf.fillNull(rs.getString("hbx18"));
		hbx19=cf.fillNull(rs.getString("hbx19"));
		hbx20=cf.fillNull(rs.getString("hbx20"));
		hbx21=cf.fillNull(rs.getString("hbx21"));
		hbx22=cf.fillNull(rs.getString("hbx22"));
		hbx23=cf.fillNull(rs.getString("hbx23"));
		hbx24=cf.fillNull(rs.getString("hbx24"));
		hbx25=cf.fillNull(rs.getString("hbx25"));
		hbx26=cf.fillNull(rs.getString("hbx26"));
		hbx27=cf.fillNull(rs.getString("hbx27"));
		hbx28=cf.fillNull(rs.getString("hbx28"));
		hbx29=cf.fillNull(rs.getString("hbx29"));
		hbx30=cf.fillNull(rs.getString("hbx30"));
		hbx31=cf.fillNull(rs.getString("hbx31"));
		hbx32=cf.fillNull(rs.getString("hbx32"));
		hbx33=cf.fillNull(rs.getString("hbx33"));
		hbx34=cf.fillNull(rs.getString("hbx34"));
		hbx35=cf.fillNull(rs.getString("hbx35"));
		hbx36=cf.fillNull(rs.getString("hbx36"));
		hbx37=cf.fillNull(rs.getString("hbx37"));
		hbx38=cf.fillNull(rs.getString("hbx38"));
		hbx39=cf.fillNull(rs.getString("hbx39"));
		hbx40=cf.fillNull(rs.getString("hbx40"));
		hbx41=cf.fillNull(rs.getString("hbx41"));
		hbx42=cf.fillNull(rs.getString("hbx42"));
		hbx43=cf.fillNull(rs.getString("hbx43"));
		hbx44=cf.fillNull(rs.getString("hbx44"));
		hbx45=cf.fillNull(rs.getString("hbx45"));
		hbx46=cf.fillNull(rs.getString("hbx46"));
		hbx47=cf.fillNull(rs.getString("hbx47"));
		hbx48=cf.fillNull(rs.getString("hbx48"));
		hbx49=cf.fillNull(rs.getString("hbx49"));
		hbx50=cf.fillNull(rs.getString("hbx50"));
	
	
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_heysxmpz.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">验收版本号</span></td> 
  <td width="33%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb where gcysbbh='"+gcysbbh+"'",gcysbbh);
%>
    </select>  </td>
  <td align="right" width="17%"><span class="STYLE1">验收项目编码</span></td> 
  <td width="33%"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_heysxm where gcysxmbm='"+gcysxmbm+"'",gcysxmbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项数量</td> 
  <td width="33%"><input type="text" name="yszxsl" size="20" maxlength="8"  value="<%=yszxsl%>" ></td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项1名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys1" size="73" maxlength="200"  value="<%=ys1%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项1</td>
  <td><%
	cf.radioToken(out, "byx1","0+否&1+必验项",byx1);
%></td>
  <td align="right">验收子项1说明图片</td>
  <td><input type="text" name="ysbztp1" size="20" maxlength="800"  value="<%=ysbztp1%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项1说明文字</td> 
  <td colspan="3"> 
    <textarea name="ysbzsm1" cols="73" rows="3"><%=ysbzsm1%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项1分类</td>
  <td><input type="text" name="xmfl1" size="20" maxlength="100"  value="<%=xmfl1%>" ></td>
  <td align="right">验收子项1合并项</td>
  <td><input type="text" name="hbx1" size="20" maxlength="8"  value="<%=hbx1%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项1结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg1","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg1);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项2名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys2" size="73" maxlength="200"  value="<%=ys2%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项2</td>
  <td><%
	cf.radioToken(out, "byx2","0+否&1+必验项",byx2);
%></td>
  <td align="right">验收子项2说明图片</td>
  <td><input type="text" name="ysbztp2" size="20" maxlength="800"  value="<%=ysbztp2%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项2说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm2" cols="73" rows="3"><%=ysbzsm2%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项2分类</td>
  <td><input type="text" name="xmfl2" size="20" maxlength="100"  value="<%=xmfl2%>" >  </td>
  <td align="right">验收子项2合并项</td>
  <td><input type="text" name="hbx2" size="20" maxlength="8"  value="<%=hbx2%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项2结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg2","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg2);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项3名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys3" size="73" maxlength="200"  value="<%=ys3%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项3</td>
  <td><%
	cf.radioToken(out, "byx3","0+否&1+必验项",byx3);
%></td>
  <td align="right">验收子项3说明图片</td>
  <td><input type="text" name="ysbztp3" size="20" maxlength="800"  value="<%=ysbztp3%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项3说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm3" cols="73" rows="3"><%=ysbzsm3%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项3分类</td>
  <td><input type="text" name="xmfl3" size="20" maxlength="100"  value="<%=xmfl3%>" >  </td>
  <td align="right">验收子项3合并项</td>
  <td><input type="text" name="hbx3" size="20" maxlength="8"  value="<%=hbx3%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项3结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg3","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg3);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项4名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys4" size="73" maxlength="200"  value="<%=ys4%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项4</td>
  <td><%
	cf.radioToken(out, "byx4","0+否&1+必验项",byx4);
%></td>
  <td align="right">验收子项4说明图片</td>
  <td><input type="text" name="ysbztp4" size="20" maxlength="800"  value="<%=ysbztp4%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项4说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm4" cols="73" rows="3"><%=ysbzsm4%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项4分类</td>
  <td><input type="text" name="xmfl4" size="20" maxlength="100"  value="<%=xmfl4%>" >  </td>
  <td align="right">验收子项4合并项</td>
  <td><input type="text" name="hbx4" size="20" maxlength="8"  value="<%=hbx4%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项4结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg4","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg4);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项5名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys5" size="73" maxlength="200"  value="<%=ys5%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项5</td>
  <td><%
	cf.radioToken(out, "byx5","0+否&1+必验项",byx5);
%></td>
  <td align="right">验收子项5说明图片</td>
  <td><input type="text" name="ysbztp5" size="20" maxlength="800"  value="<%=ysbztp5%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项5说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm5" cols="73" rows="3"><%=ysbzsm5%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项5分类</td>
  <td><input type="text" name="xmfl5" size="20" maxlength="100"  value="<%=xmfl5%>" >  </td>
  <td align="right">验收子项5合并项</td>
  <td><input type="text" name="hbx5" size="20" maxlength="8"  value="<%=hbx5%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项5结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg5","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg5);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项6名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys6" size="73" maxlength="200"  value="<%=ys6%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项6</td>
  <td><%
	cf.radioToken(out, "byx6","0+否&1+必验项",byx6);
%></td>
  <td align="right">验收子项6说明图片</td>
  <td><input type="text" name="ysbztp6" size="20" maxlength="800"  value="<%=ysbztp6%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项6说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm6" cols="73" rows="3"><%=ysbzsm6%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项6分类</td>
  <td><input type="text" name="xmfl6" size="20" maxlength="100"  value="<%=xmfl6%>" >  </td>
  <td align="right">验收子项6合并项</td>
  <td><input type="text" name="hbx6" size="20" maxlength="8"  value="<%=hbx6%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项6结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg6","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg6);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项7名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys7" size="73" maxlength="200"  value="<%=ys7%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项7</td>
  <td><%
	cf.radioToken(out, "byx7","0+否&1+必验项",byx7);
%></td>
  <td align="right">验收子项7说明图片</td>
  <td><input type="text" name="ysbztp7" size="20" maxlength="800"  value="<%=ysbztp7%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项7说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm7" cols="73" rows="3"><%=ysbzsm7%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项7分类</td>
  <td><input type="text" name="xmfl7" size="20" maxlength="100"  value="<%=xmfl7%>" >  </td>
  <td align="right">验收子项7合并项</td>
  <td><input type="text" name="hbx7" size="20" maxlength="8"  value="<%=hbx7%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项7结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg7","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg7);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项8名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys8" size="73" maxlength="200"  value="<%=ys8%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项8</td>
  <td><%
	cf.radioToken(out, "byx8","0+否&1+必验项",byx8);
%></td>
  <td align="right">验收子项8说明图片</td>
  <td><input type="text" name="ysbztp8" size="20" maxlength="800"  value="<%=ysbztp8%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项8说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm8" cols="73" rows="3"><%=ysbzsm8%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项8分类</td>
  <td><input type="text" name="xmfl8" size="20" maxlength="100"  value="<%=xmfl8%>" >  </td>
  <td align="right">验收子项8合并项</td>
  <td><input type="text" name="hbx8" size="20" maxlength="8"  value="<%=hbx8%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项8结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg8","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg8);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项9名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys9" size="73" maxlength="200"  value="<%=ys9%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项9</td>
  <td><%
	cf.radioToken(out, "byx9","0+否&1+必验项",byx9);
%></td>
  <td align="right">验收子项9说明图片</td>
  <td><input type="text" name="ysbztp9" size="20" maxlength="800"  value="<%=ysbztp9%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项9说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm9" cols="73" rows="3"><%=ysbzsm9%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项9分类</td>
  <td><input type="text" name="xmfl9" size="20" maxlength="100"  value="<%=xmfl9%>" >  </td>
  <td align="right">验收子项9合并项</td>
  <td><input type="text" name="hbx9" size="20" maxlength="8"  value="<%=hbx9%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项9结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg9","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg9);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项10名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys10" size="73" maxlength="200"  value="<%=ys10%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项10</td>
  <td><%
	cf.radioToken(out, "byx10","0+否&1+必验项",byx10);
%></td>
  <td align="right">验收子项10说明图片</td>
  <td><input type="text" name="ysbztp10" size="20" maxlength="800"  value="<%=ysbztp10%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项10说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm10" cols="73" rows="3"><%=ysbzsm10%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项10分类</td>
  <td><input type="text" name="xmfl10" size="20" maxlength="100"  value="<%=xmfl10%>" >  </td>
  <td align="right">验收子项10合并项</td>
  <td><input type="text" name="hbx10" size="20" maxlength="8"  value="<%=hbx10%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项10结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg10","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg10);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项11名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys11" size="73" maxlength="200"  value="<%=ys11%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项11</td>
  <td><%
	cf.radioToken(out, "byx11","0+否&1+必验项",byx11);
%></td>
  <td align="right">验收子项11说明图片</td>
  <td><input type="text" name="ysbztp11" size="20" maxlength="800"  value="<%=ysbztp11%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项11说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm11" cols="73" rows="3"><%=ysbzsm11%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项11分类</td>
  <td><input type="text" name="xmfl11" size="20" maxlength="100"  value="<%=xmfl11%>" >  </td>
  <td align="right">验收子项11合并项</td>
  <td><input type="text" name="hbx11" size="20" maxlength="8"  value="<%=hbx11%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项11结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg11","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg11);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项12名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys12" size="73" maxlength="200"  value="<%=ys12%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项12</td>
  <td><%
	cf.radioToken(out, "byx12","0+否&1+必验项",byx12);
%></td>
  <td align="right">验收子项12说明图片</td>
  <td><input type="text" name="ysbztp12" size="20" maxlength="800"  value="<%=ysbztp12%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项12说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm12" cols="73" rows="3"><%=ysbzsm12%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项12分类</td>
  <td><input type="text" name="xmfl12" size="20" maxlength="100"  value="<%=xmfl12%>" >  </td>
  <td align="right">验收子项12合并项</td>
  <td><input type="text" name="hbx12" size="20" maxlength="8"  value="<%=hbx12%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项12结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg12","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg12);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项13名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys13" size="73" maxlength="200"  value="<%=ys13%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项13</td>
  <td><%
	cf.radioToken(out, "byx13","0+否&1+必验项",byx13);
%></td>
  <td align="right">验收子项13说明图片</td>
  <td><input type="text" name="ysbztp13" size="20" maxlength="800"  value="<%=ysbztp13%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项13说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm13" cols="73" rows="3"><%=ysbzsm13%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项13分类</td>
  <td><input type="text" name="xmfl13" size="20" maxlength="100"  value="<%=xmfl13%>" >  </td>
  <td align="right">验收子项13合并项</td>
  <td><input type="text" name="hbx13" size="20" maxlength="8"  value="<%=hbx13%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项13结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg13","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg13);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项14名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys14" size="73" maxlength="200"  value="<%=ys14%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项14</td>
  <td><%
	cf.radioToken(out, "byx14","0+否&1+必验项",byx14);
%></td>
  <td align="right">验收子项14说明图片</td>
  <td><input type="text" name="ysbztp14" size="20" maxlength="800"  value="<%=ysbztp14%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项14说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm14" cols="73" rows="3"><%=ysbzsm14%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项14分类</td>
  <td><input type="text" name="xmfl14" size="20" maxlength="100"  value="<%=xmfl14%>" >  </td>
  <td align="right">验收子项14合并项</td>
  <td><input type="text" name="hbx14" size="20" maxlength="8"  value="<%=hbx14%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项14结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg14","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg14);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项15名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys15" size="73" maxlength="200"  value="<%=ys15%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项15</td>
  <td><%
	cf.radioToken(out, "byx15","0+否&1+必验项",byx15);
%></td>
  <td align="right">验收子项15说明图片</td>
  <td><input type="text" name="ysbztp15" size="20" maxlength="800"  value="<%=ysbztp15%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项15说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm15" cols="73" rows="3"><%=ysbzsm15%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项15分类</td>
  <td><input type="text" name="xmfl15" size="20" maxlength="100"  value="<%=xmfl15%>" >  </td>
  <td align="right">验收子项15合并项</td>
  <td><input type="text" name="hbx15" size="20" maxlength="8"  value="<%=hbx15%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项15结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg15","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg15);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项16名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys16" size="73" maxlength="200"  value="<%=ys16%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项16</td>
  <td><%
	cf.radioToken(out, "byx16","0+否&1+必验项",byx16);
%></td>
  <td align="right">验收子项16说明图片</td>
  <td><input type="text" name="ysbztp16" size="20" maxlength="800"  value="<%=ysbztp16%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项16说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm16" cols="73" rows="3"><%=ysbzsm16%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项16分类</td>
  <td><input type="text" name="xmfl16" size="20" maxlength="100"  value="<%=xmfl16%>" >  </td>
  <td align="right">验收子项16合并项</td>
  <td><input type="text" name="hbx16" size="20" maxlength="8"  value="<%=hbx16%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项16结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg16","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg16);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项17名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys17" size="73" maxlength="200"  value="<%=ys17%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项17</td>
  <td><%
	cf.radioToken(out, "byx17","0+否&1+必验项",byx17);
%></td>
  <td align="right">验收子项17说明图片</td>
  <td><input type="text" name="ysbztp17" size="20" maxlength="800"  value="<%=ysbztp17%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项17说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm17" cols="73" rows="3"><%=ysbzsm17%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项17分类</td>
  <td><input type="text" name="xmfl17" size="20" maxlength="100"  value="<%=xmfl17%>" >  </td>
  <td align="right">验收子项17合并项</td>
  <td><input type="text" name="hbx17" size="20" maxlength="8"  value="<%=hbx17%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项17结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg17","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg17);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项18名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys18" size="73" maxlength="200"  value="<%=ys18%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项18</td>
  <td><%
	cf.radioToken(out, "byx18","0+否&1+必验项",byx18);
%></td>
  <td align="right">验收子项18说明图片</td>
  <td><input type="text" name="ysbztp18" size="20" maxlength="800"  value="<%=ysbztp18%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项18说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm18" cols="73" rows="3"><%=ysbzsm18%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项18分类</td>
  <td><input type="text" name="xmfl18" size="20" maxlength="100"  value="<%=xmfl18%>" >  </td>
  <td align="right">验收子项18合并项</td>
  <td><input type="text" name="hbx18" size="20" maxlength="8"  value="<%=hbx18%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项18结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg18","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg18);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项19名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys19" size="73" maxlength="200"  value="<%=ys19%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项19</td>
  <td><%
	cf.radioToken(out, "byx19","0+否&1+必验项",byx19);
%></td>
  <td align="right">验收子项19说明图片</td>
  <td><input type="text" name="ysbztp19" size="20" maxlength="800"  value="<%=ysbztp19%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项19说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm19" cols="73" rows="3"><%=ysbzsm19%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项19分类</td>
  <td><input type="text" name="xmfl19" size="20" maxlength="100"  value="<%=xmfl19%>" >  </td>
  <td align="right">验收子项19合并项</td>
  <td><input type="text" name="hbx19" size="20" maxlength="8"  value="<%=hbx19%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项19结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg19","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg19);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项20名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys20" size="73" maxlength="200"  value="<%=ys20%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项20</td>
  <td><%
	cf.radioToken(out, "byx20","0+否&1+必验项",byx20);
%></td>
  <td align="right">验收子项20说明图片</td>
  <td><input type="text" name="ysbztp20" size="20" maxlength="800"  value="<%=ysbztp20%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项20说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm20" cols="73" rows="3"><%=ysbzsm20%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项20分类</td>
  <td><input type="text" name="xmfl20" size="20" maxlength="100"  value="<%=xmfl20%>" >  </td>
  <td align="right">验收子项20合并项</td>
  <td><input type="text" name="hbx20" size="20" maxlength="8"  value="<%=hbx20%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项20结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg20","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg20);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项21名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys21" size="73" maxlength="200"  value="<%=ys21%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项21</td>
  <td><%
	cf.radioToken(out, "byx21","0+否&1+必验项",byx21);
%></td>
  <td align="right">验收子项21说明图片</td>
  <td><input type="text" name="ysbztp21" size="20" maxlength="800"  value="<%=ysbztp21%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项21说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm21" cols="73" rows="3"><%=ysbzsm21%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项21分类</td>
  <td><input type="text" name="xmfl21" size="20" maxlength="100"  value="<%=xmfl21%>" >  </td>
  <td align="right">验收子项21合并项</td>
  <td><input type="text" name="hbx21" size="20" maxlength="8"  value="<%=hbx21%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项21结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg21","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg21);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项22名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys22" size="73" maxlength="200"  value="<%=ys22%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项22</td>
  <td><%
	cf.radioToken(out, "byx22","0+否&1+必验项",byx22);
%></td>
  <td align="right">验收子项22说明图片</td>
  <td><input type="text" name="ysbztp22" size="20" maxlength="800"  value="<%=ysbztp22%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项22说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm22" cols="73" rows="3"><%=ysbzsm22%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项22分类</td>
  <td><input type="text" name="xmfl22" size="20" maxlength="100"  value="<%=xmfl22%>" >  </td>
  <td align="right">验收子项22合并项</td>
  <td><input type="text" name="hbx22" size="20" maxlength="8"  value="<%=hbx22%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项22结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg22","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg22);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项23名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys23" size="73" maxlength="200"  value="<%=ys23%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项23</td>
  <td><%
	cf.radioToken(out, "byx23","0+否&1+必验项",byx23);
%></td>
  <td align="right">验收子项23说明图片</td>
  <td><input type="text" name="ysbztp23" size="20" maxlength="800"  value="<%=ysbztp23%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项23说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm23" cols="73" rows="3"><%=ysbzsm23%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项23分类</td>
  <td><input type="text" name="xmfl23" size="20" maxlength="100"  value="<%=xmfl23%>" >  </td>
  <td align="right">验收子项23合并项</td>
  <td><input type="text" name="hbx23" size="20" maxlength="8"  value="<%=hbx23%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项23结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg23","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg23);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项24名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys24" size="73" maxlength="200"  value="<%=ys24%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项24</td>
  <td><%
	cf.radioToken(out, "byx24","0+否&1+必验项",byx24);
%></td>
  <td align="right">验收子项24说明图片</td>
  <td><input type="text" name="ysbztp24" size="20" maxlength="800"  value="<%=ysbztp24%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项24说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm24" cols="73" rows="3"><%=ysbzsm24%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项24分类</td>
  <td><input type="text" name="xmfl24" size="20" maxlength="100"  value="<%=xmfl24%>" >  </td>
  <td align="right">验收子项24合并项</td>
  <td><input type="text" name="hbx24" size="20" maxlength="8"  value="<%=hbx24%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项24结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg24","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg24);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项25名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys25" size="73" maxlength="200"  value="<%=ys25%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项25</td>
  <td><%
	cf.radioToken(out, "byx25","0+否&1+必验项",byx25);
%></td>
  <td align="right">验收子项25说明图片</td>
  <td><input type="text" name="ysbztp25" size="20" maxlength="800"  value="<%=ysbztp25%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项25说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm25" cols="73" rows="3"><%=ysbzsm25%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项25分类</td>
  <td><input type="text" name="xmfl25" size="20" maxlength="100"  value="<%=xmfl25%>" >  </td>
  <td align="right">验收子项25合并项</td>
  <td><input type="text" name="hbx25" size="20" maxlength="8"  value="<%=hbx25%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项25结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg25","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg25);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项26名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys26" size="73" maxlength="200"  value="<%=ys26%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项26</td>
  <td><%
	cf.radioToken(out, "byx26","0+否&1+必验项",byx26);
%></td>
  <td align="right">验收子项26说明图片</td>
  <td><input type="text" name="ysbztp26" size="20" maxlength="800"  value="<%=ysbztp26%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项26说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm26" cols="73" rows="3"><%=ysbzsm26%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项26分类</td>
  <td><input type="text" name="xmfl26" size="20" maxlength="100"  value="<%=xmfl26%>" >  </td>
  <td align="right">验收子项26合并项</td>
  <td><input type="text" name="hbx26" size="20" maxlength="8"  value="<%=hbx26%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项26结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg26","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg26);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项27名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys27" size="73" maxlength="200"  value="<%=ys27%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项27</td>
  <td><%
	cf.radioToken(out, "byx27","0+否&1+必验项",byx27);
%></td>
  <td align="right">验收子项27说明图片</td>
  <td><input type="text" name="ysbztp27" size="20" maxlength="800"  value="<%=ysbztp27%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项27说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm27" cols="73" rows="3"><%=ysbzsm27%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项27分类</td>
  <td><input type="text" name="xmfl27" size="20" maxlength="100"  value="<%=xmfl27%>" >  </td>
  <td align="right">验收子项27合并项</td>
  <td><input type="text" name="hbx27" size="20" maxlength="8"  value="<%=hbx27%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项27结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg27","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg27);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项28名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys28" size="73" maxlength="200"  value="<%=ys28%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项28</td>
  <td><%
	cf.radioToken(out, "byx28","0+否&1+必验项",byx28);
%></td>
  <td align="right">验收子项28说明图片</td>
  <td><input type="text" name="ysbztp28" size="20" maxlength="800"  value="<%=ysbztp28%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项28说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm28" cols="73" rows="3"><%=ysbzsm28%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项28分类</td>
  <td><input type="text" name="xmfl28" size="20" maxlength="100"  value="<%=xmfl28%>" >  </td>
  <td align="right">验收子项28合并项</td>
  <td><input type="text" name="hbx28" size="20" maxlength="8"  value="<%=hbx28%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项28结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg28","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg28);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项29名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys29" size="73" maxlength="200"  value="<%=ys29%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项29</td>
  <td><%
	cf.radioToken(out, "byx29","0+否&1+必验项",byx29);
%></td>
  <td align="right">验收子项29说明图片</td>
  <td><input type="text" name="ysbztp29" size="20" maxlength="800"  value="<%=ysbztp29%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项29说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm29" cols="73" rows="3"><%=ysbzsm29%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项29分类</td>
  <td><input type="text" name="xmfl29" size="20" maxlength="100"  value="<%=xmfl29%>" >  </td>
  <td align="right">验收子项29合并项</td>
  <td><input type="text" name="hbx29" size="20" maxlength="8"  value="<%=hbx29%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项29结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg29","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg29);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项30名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys30" size="73" maxlength="200"  value="<%=ys30%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项30</td>
  <td><%
	cf.radioToken(out, "byx30","0+否&1+必验项",byx30);
%></td>
  <td align="right">验收子项30说明图片</td>
  <td><input type="text" name="ysbztp30" size="20" maxlength="800"  value="<%=ysbztp30%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项30说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm30" cols="73" rows="3"><%=ysbzsm30%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项30分类</td>
  <td><input type="text" name="xmfl30" size="20" maxlength="100"  value="<%=xmfl30%>" >  </td>
  <td align="right">验收子项30合并项</td>
  <td><input type="text" name="hbx30" size="20" maxlength="8"  value="<%=hbx30%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项30结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg30","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg30);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项31名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys31" size="73" maxlength="200"  value="<%=ys31%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项31</td>
  <td><%
	cf.radioToken(out, "byx31","0+否&1+必验项",byx31);
%></td>
  <td align="right">验收子项31说明图片</td>
  <td><input type="text" name="ysbztp31" size="20" maxlength="800"  value="<%=ysbztp31%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项31说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm31" cols="73" rows="3"><%=ysbzsm31%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项31分类</td>
  <td><input type="text" name="xmfl31" size="20" maxlength="100"  value="<%=xmfl31%>" >  </td>
  <td align="right">验收子项31合并项</td>
  <td><input type="text" name="hbx31" size="20" maxlength="8"  value="<%=hbx31%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项31结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg31","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg31);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项32名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys32" size="73" maxlength="200"  value="<%=ys32%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项32</td>
  <td><%
	cf.radioToken(out, "byx32","0+否&1+必验项",byx32);
%></td>
  <td align="right">验收子项32说明图片</td>
  <td><input type="text" name="ysbztp32" size="20" maxlength="800"  value="<%=ysbztp32%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项32说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm32" cols="73" rows="3"><%=ysbzsm32%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项32分类</td>
  <td><input type="text" name="xmfl32" size="20" maxlength="100"  value="<%=xmfl32%>" >  </td>
  <td align="right">验收子项32合并项</td>
  <td><input type="text" name="hbx32" size="20" maxlength="8"  value="<%=hbx32%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项32结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg32","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg32);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项33名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys33" size="73" maxlength="200"  value="<%=ys33%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项33</td>
  <td><%
	cf.radioToken(out, "byx33","0+否&1+必验项",byx33);
%></td>
  <td align="right">验收子项33说明图片</td>
  <td><input type="text" name="ysbztp33" size="20" maxlength="800"  value="<%=ysbztp33%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项33说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm33" cols="73" rows="3"><%=ysbzsm33%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项33分类</td>
  <td><input type="text" name="xmfl33" size="20" maxlength="100"  value="<%=xmfl33%>" >  </td>
  <td align="right">验收子项33合并项</td>
  <td><input type="text" name="hbx33" size="20" maxlength="8"  value="<%=hbx33%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项33结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg33","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg33);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项34名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys34" size="73" maxlength="200"  value="<%=ys34%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项34</td>
  <td><%
	cf.radioToken(out, "byx34","0+否&1+必验项",byx34);
%></td>
  <td align="right">验收子项34说明图片</td>
  <td><input type="text" name="ysbztp34" size="20" maxlength="800"  value="<%=ysbztp34%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项34说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm34" cols="73" rows="3"><%=ysbzsm34%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项34分类</td>
  <td><input type="text" name="xmfl34" size="20" maxlength="100"  value="<%=xmfl34%>" >  </td>
  <td align="right">验收子项34合并项</td>
  <td><input type="text" name="hbx34" size="20" maxlength="8"  value="<%=hbx34%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项34结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg34","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg34);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项35名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys35" size="73" maxlength="200"  value="<%=ys35%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项35</td>
  <td><%
	cf.radioToken(out, "byx35","0+否&1+必验项",byx35);
%></td>
  <td align="right">验收子项35说明图片</td>
  <td><input type="text" name="ysbztp35" size="20" maxlength="800"  value="<%=ysbztp35%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项35说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm35" cols="73" rows="3"><%=ysbzsm35%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项35分类</td>
  <td><input type="text" name="xmfl35" size="20" maxlength="100"  value="<%=xmfl35%>" >  </td>
  <td align="right">验收子项35合并项</td>
  <td><input type="text" name="hbx35" size="20" maxlength="8"  value="<%=hbx35%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项35结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg35","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg35);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项36名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys36" size="73" maxlength="200"  value="<%=ys36%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项36</td>
  <td><%
	cf.radioToken(out, "byx36","0+否&1+必验项",byx36);
%></td>
  <td align="right">验收子项36说明图片</td>
  <td><input type="text" name="ysbztp36" size="20" maxlength="800"  value="<%=ysbztp36%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项36说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm36" cols="73" rows="3"><%=ysbzsm36%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项36分类</td>
  <td><input type="text" name="xmfl36" size="20" maxlength="100"  value="<%=xmfl36%>" >  </td>
  <td align="right">验收子项36合并项</td>
  <td><input type="text" name="hbx36" size="20" maxlength="8"  value="<%=hbx36%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项36结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg36","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg36);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项37名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys37" size="73" maxlength="200"  value="<%=ys37%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项37</td>
  <td><%
	cf.radioToken(out, "byx37","0+否&1+必验项",byx37);
%></td>
  <td align="right">验收子项37说明图片</td>
  <td><input type="text" name="ysbztp37" size="20" maxlength="800"  value="<%=ysbztp37%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项37说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm37" cols="73" rows="3"><%=ysbzsm37%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项37分类</td>
  <td><input type="text" name="xmfl37" size="20" maxlength="100"  value="<%=xmfl37%>" >  </td>
  <td align="right">验收子项37合并项</td>
  <td><input type="text" name="hbx37" size="20" maxlength="8"  value="<%=hbx37%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项37结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg37","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg37);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项38名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys38" size="73" maxlength="200"  value="<%=ys38%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项38</td>
  <td><%
	cf.radioToken(out, "byx38","0+否&1+必验项",byx38);
%></td>
  <td align="right">验收子项38说明图片</td>
  <td><input type="text" name="ysbztp38" size="20" maxlength="800"  value="<%=ysbztp38%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项38说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm38" cols="73" rows="3"><%=ysbzsm38%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项38分类</td>
  <td><input type="text" name="xmfl38" size="20" maxlength="100"  value="<%=xmfl38%>" >  </td>
  <td align="right">验收子项38合并项</td>
  <td><input type="text" name="hbx38" size="20" maxlength="8"  value="<%=hbx38%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项38结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg38","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg38);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项39名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys39" size="73" maxlength="200"  value="<%=ys39%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项39</td>
  <td><%
	cf.radioToken(out, "byx39","0+否&1+必验项",byx39);
%></td>
  <td align="right">验收子项39说明图片</td>
  <td><input type="text" name="ysbztp39" size="20" maxlength="800"  value="<%=ysbztp39%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项39说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm39" cols="73" rows="3"><%=ysbzsm39%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项39分类</td>
  <td><input type="text" name="xmfl39" size="20" maxlength="100"  value="<%=xmfl39%>" >  </td>
  <td align="right">验收子项39合并项</td>
  <td><input type="text" name="hbx39" size="20" maxlength="8"  value="<%=hbx39%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项39结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg39","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg39);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项40名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys40" size="73" maxlength="200"  value="<%=ys40%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项40</td>
  <td><%
	cf.radioToken(out, "byx40","0+否&1+必验项",byx40);
%></td>
  <td align="right">验收子项40说明图片</td>
  <td><input type="text" name="ysbztp40" size="20" maxlength="800"  value="<%=ysbztp40%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项40说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm40" cols="73" rows="3"><%=ysbzsm40%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项40分类</td>
  <td><input type="text" name="xmfl40" size="20" maxlength="100"  value="<%=xmfl40%>" >  </td>
  <td align="right">验收子项40合并项</td>
  <td><input type="text" name="hbx40" size="20" maxlength="8"  value="<%=hbx40%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项40结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg40","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg40);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项41名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys41" size="73" maxlength="200"  value="<%=ys41%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项41</td>
  <td><%
	cf.radioToken(out, "byx41","0+否&1+必验项",byx41);
%></td>
  <td align="right">验收子项41说明图片</td>
  <td><input type="text" name="ysbztp41" size="20" maxlength="800"  value="<%=ysbztp41%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项41说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm41" cols="73" rows="3"><%=ysbzsm41%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项41分类</td>
  <td><input type="text" name="xmfl41" size="20" maxlength="100"  value="<%=xmfl41%>" >  </td>
  <td align="right">验收子项41合并项</td>
  <td><input type="text" name="hbx41" size="20" maxlength="8"  value="<%=hbx41%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项41结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg41","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg41);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项42名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys42" size="73" maxlength="200"  value="<%=ys42%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项42</td>
  <td><%
	cf.radioToken(out, "byx42","0+否&1+必验项",byx42);
%></td>
  <td align="right">验收子项42说明图片</td>
  <td><input type="text" name="ysbztp42" size="20" maxlength="800"  value="<%=ysbztp42%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项42说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm42" cols="73" rows="3"><%=ysbzsm42%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项42分类</td>
  <td><input type="text" name="xmfl42" size="20" maxlength="100"  value="<%=xmfl42%>" >  </td>
  <td align="right">验收子项42合并项</td>
  <td><input type="text" name="hbx42" size="20" maxlength="8"  value="<%=hbx42%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项42结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg42","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg42);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项43名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys43" size="73" maxlength="200"  value="<%=ys43%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项43</td>
  <td><%
	cf.radioToken(out, "byx43","0+否&1+必验项",byx43);
%></td>
  <td align="right">验收子项43说明图片</td>
  <td><input type="text" name="ysbztp43" size="20" maxlength="800"  value="<%=ysbztp43%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项43说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm43" cols="73" rows="3"><%=ysbzsm43%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项43分类</td>
  <td><input type="text" name="xmfl43" size="20" maxlength="100"  value="<%=xmfl43%>" >  </td>
  <td align="right">验收子项43合并项</td>
  <td><input type="text" name="hbx43" size="20" maxlength="8"  value="<%=hbx43%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项43结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg43","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg43);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项44名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys44" size="73" maxlength="200"  value="<%=ys44%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项44</td>
  <td><%
	cf.radioToken(out, "byx44","0+否&1+必验项",byx44);
%></td>
  <td align="right">验收子项44说明图片</td>
  <td><input type="text" name="ysbztp44" size="20" maxlength="800"  value="<%=ysbztp44%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项44说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm44" cols="73" rows="3"><%=ysbzsm44%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项44分类</td>
  <td><input type="text" name="xmfl44" size="20" maxlength="100"  value="<%=xmfl44%>" >  </td>
  <td align="right">验收子项44合并项</td>
  <td><input type="text" name="hbx44" size="20" maxlength="8"  value="<%=hbx44%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项44结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg44","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg44);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项45名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys45" size="73" maxlength="200"  value="<%=ys45%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项45</td>
  <td><%
	cf.radioToken(out, "byx45","0+否&1+必验项",byx45);
%></td>
  <td align="right">验收子项45说明图片</td>
  <td><input type="text" name="ysbztp45" size="20" maxlength="800"  value="<%=ysbztp45%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项45说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm45" cols="73" rows="3"><%=ysbzsm45%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项45分类</td>
  <td><input type="text" name="xmfl45" size="20" maxlength="100"  value="<%=xmfl45%>" >  </td>
  <td align="right">验收子项45合并项</td>
  <td><input type="text" name="hbx45" size="20" maxlength="8"  value="<%=hbx45%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项45结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg45","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg45);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项46名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys46" size="73" maxlength="200"  value="<%=ys46%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项46</td>
  <td><%
	cf.radioToken(out, "byx46","0+否&1+必验项",byx46);
%></td>
  <td align="right">验收子项46说明图片</td>
  <td><input type="text" name="ysbztp46" size="20" maxlength="800"  value="<%=ysbztp46%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项46说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm46" cols="73" rows="3"><%=ysbzsm46%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项46分类</td>
  <td><input type="text" name="xmfl46" size="20" maxlength="100"  value="<%=xmfl46%>" >  </td>
  <td align="right">验收子项46合并项</td>
  <td><input type="text" name="hbx46" size="20" maxlength="8"  value="<%=hbx46%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项46结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg46","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg46);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项47名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys47" size="73" maxlength="200"  value="<%=ys47%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项47</td>
  <td><%
	cf.radioToken(out, "byx47","0+否&1+必验项",byx47);
%></td>
  <td align="right">验收子项47说明图片</td>
  <td><input type="text" name="ysbztp47" size="20" maxlength="800"  value="<%=ysbztp47%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项47说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm47" cols="73" rows="3"><%=ysbzsm47%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项47分类</td>
  <td><input type="text" name="xmfl47" size="20" maxlength="100"  value="<%=xmfl47%>" >  </td>
  <td align="right">验收子项47合并项</td>
  <td><input type="text" name="hbx47" size="20" maxlength="8"  value="<%=hbx47%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项47结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg47","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg47);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项48名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys48" size="73" maxlength="200"  value="<%=ys48%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项48</td>
  <td><%
	cf.radioToken(out, "byx48","0+否&1+必验项",byx48);
%></td>
  <td align="right">验收子项48说明图片</td>
  <td><input type="text" name="ysbztp48" size="20" maxlength="800"  value="<%=ysbztp48%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项48说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm48" cols="73" rows="3"><%=ysbzsm48%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项48分类</td>
  <td><input type="text" name="xmfl48" size="20" maxlength="100"  value="<%=xmfl48%>" >  </td>
  <td align="right">验收子项48合并项</td>
  <td><input type="text" name="hbx48" size="20" maxlength="8"  value="<%=hbx48%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项48结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg48","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg48);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项49名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys49" size="73" maxlength="200"  value="<%=ys49%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项49</td>
  <td><%
	cf.radioToken(out, "byx49","0+否&1+必验项",byx49);
%></td>
  <td align="right">验收子项49说明图片</td>
  <td><input type="text" name="ysbztp49" size="20" maxlength="800"  value="<%=ysbztp49%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项49说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm49" cols="73" rows="3"><%=ysbzsm49%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项49分类</td>
  <td><input type="text" name="xmfl49" size="20" maxlength="100"  value="<%=xmfl49%>" >  </td>
  <td align="right">验收子项49合并项</td>
  <td><input type="text" name="hbx49" size="20" maxlength="8"  value="<%=hbx49%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项49结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg49","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg49);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项50名称</td> 
  <td colspan="3"> 
    <input type="text" name="ys50" size="73" maxlength="200"  value="<%=ys50%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">必验项50</td>
  <td><%
	cf.radioToken(out, "byx50","0+否&1+必验项",byx50);
%></td>
  <td align="right">验收子项50说明图片</td>
  <td><input type="text" name="ysbztp50" size="20" maxlength="800"  value="<%=ysbztp50%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">验收子项50说明文字</td> 
  <td colspan="3"><textarea name="ysbzsm50" cols="73" rows="3"><%=ysbzsm50%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项50分类</td>
  <td><input type="text" name="xmfl50" size="20" maxlength="100"  value="<%=xmfl50%>" ></td>
  <td align="right">验收子项50合并项</td>
  <td><input type="text" name="hbx50" size="20" maxlength="8"  value="<%=hbx50%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收子项50结果</td>
  <td colspan="3"><%
	cf.radioToken(out, "ysjg50","1+选择合格&2+选择是否&3+录入字符&4+录入日期&5+录入数字&9+显示说明",ysjg50);
%></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wheregcysbbh"  value="<%=wheregcysbbh%>" >
	<input type="hidden" name="wheregcysxmbm"  value="<%=wheregcysxmbm%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("请选择[验收版本号]！");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请选择[验收项目编码]！");
		FormName.gcysxmbm.focus();
		return false;
	}

	if(	javaTrim(FormName.yszxsl)=="") {
		alert("请输入[验收子项数量]！");
		FormName.yszxsl.focus();
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx1, "验收子项1合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx2, "验收子项2合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx3, "验收子项3合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx4, "验收子项4合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx5, "验收子项5合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx6, "验收子项6合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx7, "验收子项7合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx8, "验收子项8合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx9, "验收子项9合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx10, "验收子项10合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx11, "验收子项11合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx12, "验收子项12合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx13, "验收子项13合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx14, "验收子项14合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx15, "验收子项15合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx16, "验收子项16合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx17, "验收子项17合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx18, "验收子项18合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx19, "验收子项19合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx20, "验收子项20合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx21, "验收子项21合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx22, "验收子项22合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx23, "验收子项23合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx24, "验收子项24合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx25, "验收子项25合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx26, "验收子项26合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx27, "验收子项27合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx28, "验收子项28合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx29, "验收子项29合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx30, "验收子项30合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx31, "验收子项31合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx32, "验收子项32合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx33, "验收子项33合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx34, "验收子项34合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx35, "验收子项35合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx36, "验收子项36合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx37, "验收子项37合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx38, "验收子项38合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx39, "验收子项39合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx40, "验收子项40合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx41, "验收子项41合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx42, "验收子项42合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx43, "验收子项43合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx44, "验收子项44合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx45, "验收子项45合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx46, "验收子项46合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx47, "验收子项47合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx48, "验收子项48合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx49, "验收子项49合并项"))) {
		return false;
	}
	if(!(isNumber(FormName.hbx50, "验收子项50合并项"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
