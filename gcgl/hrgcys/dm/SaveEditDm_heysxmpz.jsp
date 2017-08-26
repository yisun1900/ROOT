<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gcysbbh=null;
String gcysxmbm=null;

int yszxsl=0;
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
long hbx1=0;
long hbx2=0;
long hbx3=0;
long hbx4=0;
long hbx5=0;
long hbx6=0;
long hbx7=0;
long hbx8=0;
long hbx9=0;
long hbx10=0;
long hbx11=0;
long hbx12=0;
long hbx13=0;
long hbx14=0;
long hbx15=0;
long hbx16=0;
long hbx17=0;
long hbx18=0;
long hbx19=0;
long hbx20=0;
long hbx21=0;
long hbx22=0;
long hbx23=0;
long hbx24=0;
long hbx25=0;
long hbx26=0;
long hbx27=0;
long hbx28=0;
long hbx29=0;
long hbx30=0;
long hbx31=0;
long hbx32=0;
long hbx33=0;
long hbx34=0;
long hbx35=0;
long hbx36=0;
long hbx37=0;
long hbx38=0;
long hbx39=0;
long hbx40=0;
long hbx41=0;
long hbx42=0;
long hbx43=0;
long hbx44=0;
long hbx45=0;
long hbx46=0;
long hbx47=0;
long hbx48=0;
long hbx49=0;
long hbx50=0;
gcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
gcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));

ls=request.getParameter("yszxsl");
try{
	if (!(ls.equals("")))  yszxsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yszxsl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项数量]类型转换发生意外:"+e);
	return;
}
ys1=cf.GB2Uni(request.getParameter("ys1"));
byx1=cf.GB2Uni(request.getParameter("byx1"));
ysbztp1=cf.GB2Uni(request.getParameter("ysbztp1"));
ysbzsm1=cf.GB2Uni(request.getParameter("ysbzsm1"));
ys2=cf.GB2Uni(request.getParameter("ys2"));
byx2=cf.GB2Uni(request.getParameter("byx2"));
ysbztp2=cf.GB2Uni(request.getParameter("ysbztp2"));
ysbzsm2=cf.GB2Uni(request.getParameter("ysbzsm2"));
ys3=cf.GB2Uni(request.getParameter("ys3"));
byx3=cf.GB2Uni(request.getParameter("byx3"));
ysbztp3=cf.GB2Uni(request.getParameter("ysbztp3"));
ysbzsm3=cf.GB2Uni(request.getParameter("ysbzsm3"));
ys4=cf.GB2Uni(request.getParameter("ys4"));
byx4=cf.GB2Uni(request.getParameter("byx4"));
ysbztp4=cf.GB2Uni(request.getParameter("ysbztp4"));
ysbzsm4=cf.GB2Uni(request.getParameter("ysbzsm4"));
ys5=cf.GB2Uni(request.getParameter("ys5"));
byx5=cf.GB2Uni(request.getParameter("byx5"));
ysbztp5=cf.GB2Uni(request.getParameter("ysbztp5"));
ysbzsm5=cf.GB2Uni(request.getParameter("ysbzsm5"));
ys6=cf.GB2Uni(request.getParameter("ys6"));
byx6=cf.GB2Uni(request.getParameter("byx6"));
ysbztp6=cf.GB2Uni(request.getParameter("ysbztp6"));
ysbzsm6=cf.GB2Uni(request.getParameter("ysbzsm6"));
ys7=cf.GB2Uni(request.getParameter("ys7"));
byx7=cf.GB2Uni(request.getParameter("byx7"));
ysbztp7=cf.GB2Uni(request.getParameter("ysbztp7"));
ysbzsm7=cf.GB2Uni(request.getParameter("ysbzsm7"));
ys8=cf.GB2Uni(request.getParameter("ys8"));
byx8=cf.GB2Uni(request.getParameter("byx8"));
ysbztp8=cf.GB2Uni(request.getParameter("ysbztp8"));
ysbzsm8=cf.GB2Uni(request.getParameter("ysbzsm8"));
ys9=cf.GB2Uni(request.getParameter("ys9"));
byx9=cf.GB2Uni(request.getParameter("byx9"));
ysbztp9=cf.GB2Uni(request.getParameter("ysbztp9"));
ysbzsm9=cf.GB2Uni(request.getParameter("ysbzsm9"));
ys10=cf.GB2Uni(request.getParameter("ys10"));
byx10=cf.GB2Uni(request.getParameter("byx10"));
ysbztp10=cf.GB2Uni(request.getParameter("ysbztp10"));
ysbzsm10=cf.GB2Uni(request.getParameter("ysbzsm10"));
ys11=cf.GB2Uni(request.getParameter("ys11"));
byx11=cf.GB2Uni(request.getParameter("byx11"));
ysbztp11=cf.GB2Uni(request.getParameter("ysbztp11"));
ysbzsm11=cf.GB2Uni(request.getParameter("ysbzsm11"));
ys12=cf.GB2Uni(request.getParameter("ys12"));
byx12=cf.GB2Uni(request.getParameter("byx12"));
ysbztp12=cf.GB2Uni(request.getParameter("ysbztp12"));
ysbzsm12=cf.GB2Uni(request.getParameter("ysbzsm12"));
ys13=cf.GB2Uni(request.getParameter("ys13"));
byx13=cf.GB2Uni(request.getParameter("byx13"));
ysbztp13=cf.GB2Uni(request.getParameter("ysbztp13"));
ysbzsm13=cf.GB2Uni(request.getParameter("ysbzsm13"));
ys14=cf.GB2Uni(request.getParameter("ys14"));
byx14=cf.GB2Uni(request.getParameter("byx14"));
ysbztp14=cf.GB2Uni(request.getParameter("ysbztp14"));
ysbzsm14=cf.GB2Uni(request.getParameter("ysbzsm14"));
ys15=cf.GB2Uni(request.getParameter("ys15"));
byx15=cf.GB2Uni(request.getParameter("byx15"));
ysbztp15=cf.GB2Uni(request.getParameter("ysbztp15"));
ysbzsm15=cf.GB2Uni(request.getParameter("ysbzsm15"));
ys16=cf.GB2Uni(request.getParameter("ys16"));
byx16=cf.GB2Uni(request.getParameter("byx16"));
ysbztp16=cf.GB2Uni(request.getParameter("ysbztp16"));
ysbzsm16=cf.GB2Uni(request.getParameter("ysbzsm16"));
ys17=cf.GB2Uni(request.getParameter("ys17"));
byx17=cf.GB2Uni(request.getParameter("byx17"));
ysbztp17=cf.GB2Uni(request.getParameter("ysbztp17"));
ysbzsm17=cf.GB2Uni(request.getParameter("ysbzsm17"));
ys18=cf.GB2Uni(request.getParameter("ys18"));
byx18=cf.GB2Uni(request.getParameter("byx18"));
ysbztp18=cf.GB2Uni(request.getParameter("ysbztp18"));
ysbzsm18=cf.GB2Uni(request.getParameter("ysbzsm18"));
ys19=cf.GB2Uni(request.getParameter("ys19"));
byx19=cf.GB2Uni(request.getParameter("byx19"));
ysbztp19=cf.GB2Uni(request.getParameter("ysbztp19"));
ysbzsm19=cf.GB2Uni(request.getParameter("ysbzsm19"));
ys20=cf.GB2Uni(request.getParameter("ys20"));
byx20=cf.GB2Uni(request.getParameter("byx20"));
ysbztp20=cf.GB2Uni(request.getParameter("ysbztp20"));
ysbzsm20=cf.GB2Uni(request.getParameter("ysbzsm20"));
ys21=cf.GB2Uni(request.getParameter("ys21"));
byx21=cf.GB2Uni(request.getParameter("byx21"));
ysbztp21=cf.GB2Uni(request.getParameter("ysbztp21"));
ysbzsm21=cf.GB2Uni(request.getParameter("ysbzsm21"));
ys22=cf.GB2Uni(request.getParameter("ys22"));
byx22=cf.GB2Uni(request.getParameter("byx22"));
ysbztp22=cf.GB2Uni(request.getParameter("ysbztp22"));
ysbzsm22=cf.GB2Uni(request.getParameter("ysbzsm22"));
ys23=cf.GB2Uni(request.getParameter("ys23"));
byx23=cf.GB2Uni(request.getParameter("byx23"));
ysbztp23=cf.GB2Uni(request.getParameter("ysbztp23"));
ysbzsm23=cf.GB2Uni(request.getParameter("ysbzsm23"));
ys24=cf.GB2Uni(request.getParameter("ys24"));
byx24=cf.GB2Uni(request.getParameter("byx24"));
ysbztp24=cf.GB2Uni(request.getParameter("ysbztp24"));
ysbzsm24=cf.GB2Uni(request.getParameter("ysbzsm24"));
ys25=cf.GB2Uni(request.getParameter("ys25"));
byx25=cf.GB2Uni(request.getParameter("byx25"));
ysbztp25=cf.GB2Uni(request.getParameter("ysbztp25"));
ysbzsm25=cf.GB2Uni(request.getParameter("ysbzsm25"));
ys26=cf.GB2Uni(request.getParameter("ys26"));
byx26=cf.GB2Uni(request.getParameter("byx26"));
ysbztp26=cf.GB2Uni(request.getParameter("ysbztp26"));
ysbzsm26=cf.GB2Uni(request.getParameter("ysbzsm26"));
ys27=cf.GB2Uni(request.getParameter("ys27"));
byx27=cf.GB2Uni(request.getParameter("byx27"));
ysbztp27=cf.GB2Uni(request.getParameter("ysbztp27"));
ysbzsm27=cf.GB2Uni(request.getParameter("ysbzsm27"));
ys28=cf.GB2Uni(request.getParameter("ys28"));
byx28=cf.GB2Uni(request.getParameter("byx28"));
ysbztp28=cf.GB2Uni(request.getParameter("ysbztp28"));
ysbzsm28=cf.GB2Uni(request.getParameter("ysbzsm28"));
ys29=cf.GB2Uni(request.getParameter("ys29"));
byx29=cf.GB2Uni(request.getParameter("byx29"));
ysbztp29=cf.GB2Uni(request.getParameter("ysbztp29"));
ysbzsm29=cf.GB2Uni(request.getParameter("ysbzsm29"));
ys30=cf.GB2Uni(request.getParameter("ys30"));
byx30=cf.GB2Uni(request.getParameter("byx30"));
ysbztp30=cf.GB2Uni(request.getParameter("ysbztp30"));
ysbzsm30=cf.GB2Uni(request.getParameter("ysbzsm30"));
ys31=cf.GB2Uni(request.getParameter("ys31"));
byx31=cf.GB2Uni(request.getParameter("byx31"));
ysbztp31=cf.GB2Uni(request.getParameter("ysbztp31"));
ysbzsm31=cf.GB2Uni(request.getParameter("ysbzsm31"));
ys32=cf.GB2Uni(request.getParameter("ys32"));
byx32=cf.GB2Uni(request.getParameter("byx32"));
ysbztp32=cf.GB2Uni(request.getParameter("ysbztp32"));
ysbzsm32=cf.GB2Uni(request.getParameter("ysbzsm32"));
ys33=cf.GB2Uni(request.getParameter("ys33"));
byx33=cf.GB2Uni(request.getParameter("byx33"));
ysbztp33=cf.GB2Uni(request.getParameter("ysbztp33"));
ysbzsm33=cf.GB2Uni(request.getParameter("ysbzsm33"));
ys34=cf.GB2Uni(request.getParameter("ys34"));
byx34=cf.GB2Uni(request.getParameter("byx34"));
ysbztp34=cf.GB2Uni(request.getParameter("ysbztp34"));
ysbzsm34=cf.GB2Uni(request.getParameter("ysbzsm34"));
ys35=cf.GB2Uni(request.getParameter("ys35"));
byx35=cf.GB2Uni(request.getParameter("byx35"));
ysbztp35=cf.GB2Uni(request.getParameter("ysbztp35"));
ysbzsm35=cf.GB2Uni(request.getParameter("ysbzsm35"));
ys36=cf.GB2Uni(request.getParameter("ys36"));
byx36=cf.GB2Uni(request.getParameter("byx36"));
ysbztp36=cf.GB2Uni(request.getParameter("ysbztp36"));
ysbzsm36=cf.GB2Uni(request.getParameter("ysbzsm36"));
ys37=cf.GB2Uni(request.getParameter("ys37"));
byx37=cf.GB2Uni(request.getParameter("byx37"));
ysbztp37=cf.GB2Uni(request.getParameter("ysbztp37"));
ysbzsm37=cf.GB2Uni(request.getParameter("ysbzsm37"));
ys38=cf.GB2Uni(request.getParameter("ys38"));
byx38=cf.GB2Uni(request.getParameter("byx38"));
ysbztp38=cf.GB2Uni(request.getParameter("ysbztp38"));
ysbzsm38=cf.GB2Uni(request.getParameter("ysbzsm38"));
ys39=cf.GB2Uni(request.getParameter("ys39"));
byx39=cf.GB2Uni(request.getParameter("byx39"));
ysbztp39=cf.GB2Uni(request.getParameter("ysbztp39"));
ysbzsm39=cf.GB2Uni(request.getParameter("ysbzsm39"));
ys40=cf.GB2Uni(request.getParameter("ys40"));
byx40=cf.GB2Uni(request.getParameter("byx40"));
ysbztp40=cf.GB2Uni(request.getParameter("ysbztp40"));
ysbzsm40=cf.GB2Uni(request.getParameter("ysbzsm40"));
ys41=cf.GB2Uni(request.getParameter("ys41"));
byx41=cf.GB2Uni(request.getParameter("byx41"));
ysbztp41=cf.GB2Uni(request.getParameter("ysbztp41"));
ysbzsm41=cf.GB2Uni(request.getParameter("ysbzsm41"));
ys42=cf.GB2Uni(request.getParameter("ys42"));
byx42=cf.GB2Uni(request.getParameter("byx42"));
ysbztp42=cf.GB2Uni(request.getParameter("ysbztp42"));
ysbzsm42=cf.GB2Uni(request.getParameter("ysbzsm42"));
ys43=cf.GB2Uni(request.getParameter("ys43"));
byx43=cf.GB2Uni(request.getParameter("byx43"));
ysbztp43=cf.GB2Uni(request.getParameter("ysbztp43"));
ysbzsm43=cf.GB2Uni(request.getParameter("ysbzsm43"));
ys44=cf.GB2Uni(request.getParameter("ys44"));
byx44=cf.GB2Uni(request.getParameter("byx44"));
ysbztp44=cf.GB2Uni(request.getParameter("ysbztp44"));
ysbzsm44=cf.GB2Uni(request.getParameter("ysbzsm44"));
ys45=cf.GB2Uni(request.getParameter("ys45"));
byx45=cf.GB2Uni(request.getParameter("byx45"));
ysbztp45=cf.GB2Uni(request.getParameter("ysbztp45"));
ysbzsm45=cf.GB2Uni(request.getParameter("ysbzsm45"));
ys46=cf.GB2Uni(request.getParameter("ys46"));
byx46=cf.GB2Uni(request.getParameter("byx46"));
ysbztp46=cf.GB2Uni(request.getParameter("ysbztp46"));
ysbzsm46=cf.GB2Uni(request.getParameter("ysbzsm46"));
ys47=cf.GB2Uni(request.getParameter("ys47"));
byx47=cf.GB2Uni(request.getParameter("byx47"));
ysbztp47=cf.GB2Uni(request.getParameter("ysbztp47"));
ysbzsm47=cf.GB2Uni(request.getParameter("ysbzsm47"));
ys48=cf.GB2Uni(request.getParameter("ys48"));
byx48=cf.GB2Uni(request.getParameter("byx48"));
ysbztp48=cf.GB2Uni(request.getParameter("ysbztp48"));
ysbzsm48=cf.GB2Uni(request.getParameter("ysbzsm48"));
ys49=cf.GB2Uni(request.getParameter("ys49"));
byx49=cf.GB2Uni(request.getParameter("byx49"));
ysbztp49=cf.GB2Uni(request.getParameter("ysbztp49"));
ysbzsm49=cf.GB2Uni(request.getParameter("ysbzsm49"));
ys50=cf.GB2Uni(request.getParameter("ys50"));
byx50=cf.GB2Uni(request.getParameter("byx50"));
ysbztp50=cf.GB2Uni(request.getParameter("ysbztp50"));
ysbzsm50=cf.GB2Uni(request.getParameter("ysbzsm50"));
xmfl1=cf.GB2Uni(request.getParameter("xmfl1"));
ysjg1=cf.GB2Uni(request.getParameter("ysjg1"));
xmfl2=cf.GB2Uni(request.getParameter("xmfl2"));
ysjg2=cf.GB2Uni(request.getParameter("ysjg2"));
xmfl3=cf.GB2Uni(request.getParameter("xmfl3"));
ysjg3=cf.GB2Uni(request.getParameter("ysjg3"));
xmfl4=cf.GB2Uni(request.getParameter("xmfl4"));
ysjg4=cf.GB2Uni(request.getParameter("ysjg4"));
xmfl5=cf.GB2Uni(request.getParameter("xmfl5"));
ysjg5=cf.GB2Uni(request.getParameter("ysjg5"));
xmfl6=cf.GB2Uni(request.getParameter("xmfl6"));
ysjg6=cf.GB2Uni(request.getParameter("ysjg6"));
xmfl7=cf.GB2Uni(request.getParameter("xmfl7"));
ysjg7=cf.GB2Uni(request.getParameter("ysjg7"));
xmfl8=cf.GB2Uni(request.getParameter("xmfl8"));
ysjg8=cf.GB2Uni(request.getParameter("ysjg8"));
xmfl9=cf.GB2Uni(request.getParameter("xmfl9"));
ysjg9=cf.GB2Uni(request.getParameter("ysjg9"));
xmfl11=cf.GB2Uni(request.getParameter("xmfl11"));
ysjg11=cf.GB2Uni(request.getParameter("ysjg11"));
xmfl12=cf.GB2Uni(request.getParameter("xmfl12"));
ysjg12=cf.GB2Uni(request.getParameter("ysjg12"));
xmfl13=cf.GB2Uni(request.getParameter("xmfl13"));
ysjg13=cf.GB2Uni(request.getParameter("ysjg13"));
xmfl14=cf.GB2Uni(request.getParameter("xmfl14"));
ysjg14=cf.GB2Uni(request.getParameter("ysjg14"));
xmfl15=cf.GB2Uni(request.getParameter("xmfl15"));
ysjg15=cf.GB2Uni(request.getParameter("ysjg15"));
xmfl16=cf.GB2Uni(request.getParameter("xmfl16"));
ysjg16=cf.GB2Uni(request.getParameter("ysjg16"));
xmfl17=cf.GB2Uni(request.getParameter("xmfl17"));
ysjg17=cf.GB2Uni(request.getParameter("ysjg17"));
xmfl18=cf.GB2Uni(request.getParameter("xmfl18"));
ysjg18=cf.GB2Uni(request.getParameter("ysjg18"));
xmfl19=cf.GB2Uni(request.getParameter("xmfl19"));
ysjg19=cf.GB2Uni(request.getParameter("ysjg19"));
xmfl10=cf.GB2Uni(request.getParameter("xmfl10"));
ysjg10=cf.GB2Uni(request.getParameter("ysjg10"));
xmfl20=cf.GB2Uni(request.getParameter("xmfl20"));
ysjg20=cf.GB2Uni(request.getParameter("ysjg20"));
xmfl21=cf.GB2Uni(request.getParameter("xmfl21"));
ysjg21=cf.GB2Uni(request.getParameter("ysjg21"));
xmfl22=cf.GB2Uni(request.getParameter("xmfl22"));
ysjg22=cf.GB2Uni(request.getParameter("ysjg22"));
xmfl23=cf.GB2Uni(request.getParameter("xmfl23"));
ysjg23=cf.GB2Uni(request.getParameter("ysjg23"));
xmfl24=cf.GB2Uni(request.getParameter("xmfl24"));
ysjg24=cf.GB2Uni(request.getParameter("ysjg24"));
xmfl25=cf.GB2Uni(request.getParameter("xmfl25"));
ysjg25=cf.GB2Uni(request.getParameter("ysjg25"));
xmfl26=cf.GB2Uni(request.getParameter("xmfl26"));
ysjg26=cf.GB2Uni(request.getParameter("ysjg26"));
xmfl27=cf.GB2Uni(request.getParameter("xmfl27"));
ysjg27=cf.GB2Uni(request.getParameter("ysjg27"));
xmfl28=cf.GB2Uni(request.getParameter("xmfl28"));
ysjg28=cf.GB2Uni(request.getParameter("ysjg28"));
xmfl29=cf.GB2Uni(request.getParameter("xmfl29"));
ysjg29=cf.GB2Uni(request.getParameter("ysjg29"));
xmfl30=cf.GB2Uni(request.getParameter("xmfl30"));
ysjg30=cf.GB2Uni(request.getParameter("ysjg30"));
xmfl31=cf.GB2Uni(request.getParameter("xmfl31"));
ysjg31=cf.GB2Uni(request.getParameter("ysjg31"));
xmfl32=cf.GB2Uni(request.getParameter("xmfl32"));
ysjg32=cf.GB2Uni(request.getParameter("ysjg32"));
xmfl33=cf.GB2Uni(request.getParameter("xmfl33"));
ysjg33=cf.GB2Uni(request.getParameter("ysjg33"));
xmfl34=cf.GB2Uni(request.getParameter("xmfl34"));
ysjg34=cf.GB2Uni(request.getParameter("ysjg34"));
xmfl35=cf.GB2Uni(request.getParameter("xmfl35"));
ysjg35=cf.GB2Uni(request.getParameter("ysjg35"));
xmfl36=cf.GB2Uni(request.getParameter("xmfl36"));
ysjg36=cf.GB2Uni(request.getParameter("ysjg36"));
xmfl37=cf.GB2Uni(request.getParameter("xmfl37"));
ysjg37=cf.GB2Uni(request.getParameter("ysjg37"));
xmfl38=cf.GB2Uni(request.getParameter("xmfl38"));
ysjg38=cf.GB2Uni(request.getParameter("ysjg38"));
xmfl39=cf.GB2Uni(request.getParameter("xmfl39"));
ysjg39=cf.GB2Uni(request.getParameter("ysjg39"));
xmfl40=cf.GB2Uni(request.getParameter("xmfl40"));
ysjg40=cf.GB2Uni(request.getParameter("ysjg40"));
xmfl41=cf.GB2Uni(request.getParameter("xmfl41"));
ysjg41=cf.GB2Uni(request.getParameter("ysjg41"));
xmfl42=cf.GB2Uni(request.getParameter("xmfl42"));
ysjg42=cf.GB2Uni(request.getParameter("ysjg42"));
xmfl43=cf.GB2Uni(request.getParameter("xmfl43"));
ysjg43=cf.GB2Uni(request.getParameter("ysjg43"));
xmfl44=cf.GB2Uni(request.getParameter("xmfl44"));
ysjg44=cf.GB2Uni(request.getParameter("ysjg44"));
xmfl45=cf.GB2Uni(request.getParameter("xmfl45"));
ysjg45=cf.GB2Uni(request.getParameter("ysjg45"));
xmfl46=cf.GB2Uni(request.getParameter("xmfl46"));
ysjg46=cf.GB2Uni(request.getParameter("ysjg46"));
xmfl47=cf.GB2Uni(request.getParameter("xmfl47"));
ysjg47=cf.GB2Uni(request.getParameter("ysjg47"));
xmfl48=cf.GB2Uni(request.getParameter("xmfl48"));
ysjg48=cf.GB2Uni(request.getParameter("ysjg48"));
xmfl49=cf.GB2Uni(request.getParameter("xmfl49"));
ysjg49=cf.GB2Uni(request.getParameter("ysjg49"));
xmfl50=cf.GB2Uni(request.getParameter("xmfl50"));
ysjg50=cf.GB2Uni(request.getParameter("ysjg50"));
ls=request.getParameter("hbx1");
try{
	if (!(ls.equals("")))  hbx1=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx1]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项1合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx2");
try{
	if (!(ls.equals("")))  hbx2=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx2]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项2合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx3");
try{
	if (!(ls.equals("")))  hbx3=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx3]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项3合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx4");
try{
	if (!(ls.equals("")))  hbx4=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx4]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项4合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx5");
try{
	if (!(ls.equals("")))  hbx5=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx5]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项5合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx6");
try{
	if (!(ls.equals("")))  hbx6=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx6]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项6合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx7");
try{
	if (!(ls.equals("")))  hbx7=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx7]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项7合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx8");
try{
	if (!(ls.equals("")))  hbx8=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx8]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项8合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx9");
try{
	if (!(ls.equals("")))  hbx9=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx9]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项9合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx10");
try{
	if (!(ls.equals("")))  hbx10=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx10]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项10合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx11");
try{
	if (!(ls.equals("")))  hbx11=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx11]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项11合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx12");
try{
	if (!(ls.equals("")))  hbx12=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx12]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项12合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx13");
try{
	if (!(ls.equals("")))  hbx13=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx13]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项13合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx14");
try{
	if (!(ls.equals("")))  hbx14=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx14]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项14合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx15");
try{
	if (!(ls.equals("")))  hbx15=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx15]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项15合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx16");
try{
	if (!(ls.equals("")))  hbx16=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx16]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项16合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx17");
try{
	if (!(ls.equals("")))  hbx17=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx17]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项17合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx18");
try{
	if (!(ls.equals("")))  hbx18=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx18]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项18合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx19");
try{
	if (!(ls.equals("")))  hbx19=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx19]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项19合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx20");
try{
	if (!(ls.equals("")))  hbx20=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx20]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项20合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx21");
try{
	if (!(ls.equals("")))  hbx21=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx21]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项21合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx22");
try{
	if (!(ls.equals("")))  hbx22=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx22]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项22合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx23");
try{
	if (!(ls.equals("")))  hbx23=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx23]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项23合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx24");
try{
	if (!(ls.equals("")))  hbx24=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx24]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项24合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx25");
try{
	if (!(ls.equals("")))  hbx25=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx25]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项25合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx26");
try{
	if (!(ls.equals("")))  hbx26=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx26]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项26合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx27");
try{
	if (!(ls.equals("")))  hbx27=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx27]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项27合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx28");
try{
	if (!(ls.equals("")))  hbx28=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx28]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项28合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx29");
try{
	if (!(ls.equals("")))  hbx29=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx29]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项29合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx30");
try{
	if (!(ls.equals("")))  hbx30=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx30]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项30合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx31");
try{
	if (!(ls.equals("")))  hbx31=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx31]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项31合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx32");
try{
	if (!(ls.equals("")))  hbx32=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx32]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项32合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx33");
try{
	if (!(ls.equals("")))  hbx33=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx33]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项33合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx34");
try{
	if (!(ls.equals("")))  hbx34=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx34]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项34合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx35");
try{
	if (!(ls.equals("")))  hbx35=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx35]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项35合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx36");
try{
	if (!(ls.equals("")))  hbx36=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx36]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项36合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx37");
try{
	if (!(ls.equals("")))  hbx37=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx37]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项37合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx38");
try{
	if (!(ls.equals("")))  hbx38=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx38]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项38合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx39");
try{
	if (!(ls.equals("")))  hbx39=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx39]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项39合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx40");
try{
	if (!(ls.equals("")))  hbx40=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx40]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项40合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx41");
try{
	if (!(ls.equals("")))  hbx41=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx41]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项41合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx42");
try{
	if (!(ls.equals("")))  hbx42=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx42]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项42合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx43");
try{
	if (!(ls.equals("")))  hbx43=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx43]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项43合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx44");
try{
	if (!(ls.equals("")))  hbx44=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx44]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项44合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx45");
try{
	if (!(ls.equals("")))  hbx45=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx45]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项45合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx46");
try{
	if (!(ls.equals("")))  hbx46=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx46]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项46合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx47");
try{
	if (!(ls.equals("")))  hbx47=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx47]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项47合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx48");
try{
	if (!(ls.equals("")))  hbx48=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx48]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项48合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx49");
try{
	if (!(ls.equals("")))  hbx49=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx49]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项49合并项]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("hbx50");
try{
	if (!(ls.equals("")))  hbx50=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hbx50]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收子项50合并项]类型转换发生意外:"+e);
	return;
}

String wheregcysbbh=null;
String wheregcysxmbm=null;
wheregcysbbh=cf.GB2Uni(request.getParameter("wheregcysbbh"));
wheregcysxmbm=cf.GB2Uni(request.getParameter("wheregcysxmbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String gcysxmmc=null;
	ls_sql =" SELECT gcysxmmc";
	ls_sql+=" FROM dm_heysxm";
	ls_sql+=" where gcysbbh='"+gcysbbh+"' and gcysxmbm='"+gcysxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcysxmmc=cf.fillHtml(rs.getString("gcysxmmc"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);
	
	
	ls_sql="update dm_heysxmpz set gcysbbh=?,gcysxmbm=?,gcysxmmc=?,yszxsl=?,ys1=?,byx1=?,ysbztp1=?,ysbzsm1=?,ys2=?,byx2=?,ysbztp2=?,ysbzsm2=?,ys3=?,byx3=?,ysbztp3=?,ysbzsm3=?,ys4=?,byx4=?,ysbztp4=?,ysbzsm4=?,ys5=?,byx5=?,ysbztp5=?,ysbzsm5=?,ys6=?,byx6=?,ysbztp6=?,ysbzsm6=?,ys7=?,byx7=?,ysbztp7=?,ysbzsm7=?,ys8=?,byx8=?,ysbztp8=?,ysbzsm8=?,ys9=?,byx9=?,ysbztp9=?,ysbzsm9=?,ys10=?,byx10=?,ysbztp10=?,ysbzsm10=?,ys11=?,byx11=?,ysbztp11=?,ysbzsm11=?,ys12=?,byx12=?,ysbztp12=?,ysbzsm12=?,ys13=?,byx13=?,ysbztp13=?,ysbzsm13=?,ys14=?,byx14=?,ysbztp14=?,ysbzsm14=?,ys15=?,byx15=?,ysbztp15=?,ysbzsm15=?,ys16=?,byx16=?,ysbztp16=?,ysbzsm16=?,ys17=?,byx17=?,ysbztp17=?,ysbzsm17=?,ys18=?,byx18=?,ysbztp18=?,ysbzsm18=?,ys19=?,byx19=?,ysbztp19=?,ysbzsm19=?,ys20=?,byx20=?,ysbztp20=?,ysbzsm20=?,ys21=?,byx21=?,ysbztp21=?,ysbzsm21=?,ys22=?,byx22=?,ysbztp22=?,ysbzsm22=?,ys23=?,byx23=?,ysbztp23=?,ysbzsm23=?,ys24=?,byx24=?,ysbztp24=?,ysbzsm24=?,ys25=?,byx25=?,ysbztp25=?,ysbzsm25=?,ys26=?,byx26=?,ysbztp26=?,ysbzsm26=?,ys27=?,byx27=?,ysbztp27=?,ysbzsm27=?,ys28=?,byx28=?,ysbztp28=?,ysbzsm28=?,ys29=?,byx29=?,ysbztp29=?,ysbzsm29=?,ys30=?,byx30=?,ysbztp30=?,ysbzsm30=?,ys31=?,byx31=?,ysbztp31=?,ysbzsm31=?,ys32=?,byx32=?,ysbztp32=?,ysbzsm32=?,ys33=?,byx33=?,ysbztp33=?,ysbzsm33=?,ys34=?,byx34=?,ysbztp34=?,ysbzsm34=?,ys35=?,byx35=?,ysbztp35=?,ysbzsm35=?,ys36=?,byx36=?,ysbztp36=?,ysbzsm36=?,ys37=?,byx37=?,ysbztp37=?,ysbzsm37=?,ys38=?,byx38=?,ysbztp38=?,ysbzsm38=?,ys39=?,byx39=?,ysbztp39=?,ysbzsm39=?,ys40=?,byx40=?,ysbztp40=?,ysbzsm40=?,ys41=?,byx41=?,ysbztp41=?,ysbzsm41=?,ys42=?,byx42=?,ysbztp42=?,ysbzsm42=?,ys43=?,byx43=?,ysbztp43=?,ysbzsm43=?,ys44=?,byx44=?,ysbztp44=?,ysbzsm44=?,ys45=?,byx45=?,ysbztp45=?,ysbzsm45=?,ys46=?,byx46=?,ysbztp46=?,ysbzsm46=?,ys47=?,byx47=?,ysbztp47=?,ysbzsm47=?,ys48=?,byx48=?,ysbztp48=?,ysbzsm48=?,ys49=?,byx49=?,ysbztp49=?,ysbzsm49=?,ys50=?,byx50=?,ysbztp50=?,ysbzsm50=?,xmfl1=?,ysjg1=?,xmfl2=?,ysjg2=?,xmfl3=?,ysjg3=?,xmfl4=?,ysjg4=?,xmfl5=?,ysjg5=?,xmfl6=?,ysjg6=?,xmfl7=?,ysjg7=?,xmfl8=?,ysjg8=?,xmfl9=?,ysjg9=?,xmfl11=?,ysjg11=?,xmfl12=?,ysjg12=?,xmfl13=?,ysjg13=?,xmfl14=?,ysjg14=?,xmfl15=?,ysjg15=?,xmfl16=?,ysjg16=?,xmfl17=?,ysjg17=?,xmfl18=?,ysjg18=?,xmfl19=?,ysjg19=?,xmfl10=?,ysjg10=?,xmfl20=?,ysjg20=?,xmfl21=?,ysjg21=?,xmfl22=?,ysjg22=?,xmfl23=?,ysjg23=?,xmfl24=?,ysjg24=?,xmfl25=?,ysjg25=?,xmfl26=?,ysjg26=?,xmfl27=?,ysjg27=?,xmfl28=?,ysjg28=?,xmfl29=?,ysjg29=?,xmfl30=?,ysjg30=?,xmfl31=?,ysjg31=?,xmfl32=?,ysjg32=?,xmfl33=?,ysjg33=?,xmfl34=?,ysjg34=?,xmfl35=?,ysjg35=?,xmfl36=?,ysjg36=?,xmfl37=?,ysjg37=?,xmfl38=?,ysjg38=?,xmfl39=?,ysjg39=?,xmfl40=?,ysjg40=?,xmfl41=?,ysjg41=?,xmfl42=?,ysjg42=?,xmfl43=?,ysjg43=?,xmfl44=?,ysjg44=?,xmfl45=?,ysjg45=?,xmfl46=?,ysjg46=?,xmfl47=?,ysjg47=?,xmfl48=?,ysjg48=?,xmfl49=?,ysjg49=?,xmfl50=?,ysjg50=?,hbx1=?,hbx2=?,hbx3=?,hbx4=?,hbx5=?,hbx6=?,hbx7=?,hbx8=?,hbx9=?,hbx10=?,hbx11=?,hbx12=?,hbx13=?,hbx14=?,hbx15=?,hbx16=?,hbx17=?,hbx18=?,hbx19=?,hbx20=?,hbx21=?,hbx22=?,hbx23=?,hbx24=?,hbx25=?,hbx26=?,hbx27=?,hbx28=?,hbx29=?,hbx30=?,hbx31=?,hbx32=?,hbx33=?,hbx34=?,hbx35=?,hbx36=?,hbx37=?,hbx38=?,hbx39=?,hbx40=?,hbx41=?,hbx42=?,hbx43=?,hbx44=?,hbx45=?,hbx46=?,hbx47=?,hbx48=?,hbx49=?,hbx50=? ";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"') and  (gcysxmbm='"+wheregcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gcysbbh);
	ps.setString(2,gcysxmbm);
	ps.setString(3,gcysxmmc);
	ps.setInt(4,yszxsl);
	ps.setString(5,ys1);
	ps.setString(6,byx1);
	ps.setString(7,ysbztp1);
	ps.setString(8,ysbzsm1);
	ps.setString(9,ys2);
	ps.setString(10,byx2);
	ps.setString(11,ysbztp2);
	ps.setString(12,ysbzsm2);
	ps.setString(13,ys3);
	ps.setString(14,byx3);
	ps.setString(15,ysbztp3);
	ps.setString(16,ysbzsm3);
	ps.setString(17,ys4);
	ps.setString(18,byx4);
	ps.setString(19,ysbztp4);
	ps.setString(20,ysbzsm4);
	ps.setString(21,ys5);
	ps.setString(22,byx5);
	ps.setString(23,ysbztp5);
	ps.setString(24,ysbzsm5);
	ps.setString(25,ys6);
	ps.setString(26,byx6);
	ps.setString(27,ysbztp6);
	ps.setString(28,ysbzsm6);
	ps.setString(29,ys7);
	ps.setString(30,byx7);
	ps.setString(31,ysbztp7);
	ps.setString(32,ysbzsm7);
	ps.setString(33,ys8);
	ps.setString(34,byx8);
	ps.setString(35,ysbztp8);
	ps.setString(36,ysbzsm8);
	ps.setString(37,ys9);
	ps.setString(38,byx9);
	ps.setString(39,ysbztp9);
	ps.setString(40,ysbzsm9);
	ps.setString(41,ys10);
	ps.setString(42,byx10);
	ps.setString(43,ysbztp10);
	ps.setString(44,ysbzsm10);
	ps.setString(45,ys11);
	ps.setString(46,byx11);
	ps.setString(47,ysbztp11);
	ps.setString(48,ysbzsm11);
	ps.setString(49,ys12);
	ps.setString(50,byx12);
	ps.setString(51,ysbztp12);
	ps.setString(52,ysbzsm12);
	ps.setString(53,ys13);
	ps.setString(54,byx13);
	ps.setString(55,ysbztp13);
	ps.setString(56,ysbzsm13);
	ps.setString(57,ys14);
	ps.setString(58,byx14);
	ps.setString(59,ysbztp14);
	ps.setString(60,ysbzsm14);
	ps.setString(61,ys15);
	ps.setString(62,byx15);
	ps.setString(63,ysbztp15);
	ps.setString(64,ysbzsm15);
	ps.setString(65,ys16);
	ps.setString(66,byx16);
	ps.setString(67,ysbztp16);
	ps.setString(68,ysbzsm16);
	ps.setString(69,ys17);
	ps.setString(70,byx17);
	ps.setString(71,ysbztp17);
	ps.setString(72,ysbzsm17);
	ps.setString(73,ys18);
	ps.setString(74,byx18);
	ps.setString(75,ysbztp18);
	ps.setString(76,ysbzsm18);
	ps.setString(77,ys19);
	ps.setString(78,byx19);
	ps.setString(79,ysbztp19);
	ps.setString(80,ysbzsm19);
	ps.setString(81,ys20);
	ps.setString(82,byx20);
	ps.setString(83,ysbztp20);
	ps.setString(84,ysbzsm20);
	ps.setString(85,ys21);
	ps.setString(86,byx21);
	ps.setString(87,ysbztp21);
	ps.setString(88,ysbzsm21);
	ps.setString(89,ys22);
	ps.setString(90,byx22);
	ps.setString(91,ysbztp22);
	ps.setString(92,ysbzsm22);
	ps.setString(93,ys23);
	ps.setString(94,byx23);
	ps.setString(95,ysbztp23);
	ps.setString(96,ysbzsm23);
	ps.setString(97,ys24);
	ps.setString(98,byx24);
	ps.setString(99,ysbztp24);
	ps.setString(100,ysbzsm24);
	ps.setString(101,ys25);
	ps.setString(102,byx25);
	ps.setString(103,ysbztp25);
	ps.setString(104,ysbzsm25);
	ps.setString(105,ys26);
	ps.setString(106,byx26);
	ps.setString(107,ysbztp26);
	ps.setString(108,ysbzsm26);
	ps.setString(109,ys27);
	ps.setString(110,byx27);
	ps.setString(111,ysbztp27);
	ps.setString(112,ysbzsm27);
	ps.setString(113,ys28);
	ps.setString(114,byx28);
	ps.setString(115,ysbztp28);
	ps.setString(116,ysbzsm28);
	ps.setString(117,ys29);
	ps.setString(118,byx29);
	ps.setString(119,ysbztp29);
	ps.setString(120,ysbzsm29);
	ps.setString(121,ys30);
	ps.setString(122,byx30);
	ps.setString(123,ysbztp30);
	ps.setString(124,ysbzsm30);
	ps.setString(125,ys31);
	ps.setString(126,byx31);
	ps.setString(127,ysbztp31);
	ps.setString(128,ysbzsm31);
	ps.setString(129,ys32);
	ps.setString(130,byx32);
	ps.setString(131,ysbztp32);
	ps.setString(132,ysbzsm32);
	ps.setString(133,ys33);
	ps.setString(134,byx33);
	ps.setString(135,ysbztp33);
	ps.setString(136,ysbzsm33);
	ps.setString(137,ys34);
	ps.setString(138,byx34);
	ps.setString(139,ysbztp34);
	ps.setString(140,ysbzsm34);
	ps.setString(141,ys35);
	ps.setString(142,byx35);
	ps.setString(143,ysbztp35);
	ps.setString(144,ysbzsm35);
	ps.setString(145,ys36);
	ps.setString(146,byx36);
	ps.setString(147,ysbztp36);
	ps.setString(148,ysbzsm36);
	ps.setString(149,ys37);
	ps.setString(150,byx37);
	ps.setString(151,ysbztp37);
	ps.setString(152,ysbzsm37);
	ps.setString(153,ys38);
	ps.setString(154,byx38);
	ps.setString(155,ysbztp38);
	ps.setString(156,ysbzsm38);
	ps.setString(157,ys39);
	ps.setString(158,byx39);
	ps.setString(159,ysbztp39);
	ps.setString(160,ysbzsm39);
	ps.setString(161,ys40);
	ps.setString(162,byx40);
	ps.setString(163,ysbztp40);
	ps.setString(164,ysbzsm40);
	ps.setString(165,ys41);
	ps.setString(166,byx41);
	ps.setString(167,ysbztp41);
	ps.setString(168,ysbzsm41);
	ps.setString(169,ys42);
	ps.setString(170,byx42);
	ps.setString(171,ysbztp42);
	ps.setString(172,ysbzsm42);
	ps.setString(173,ys43);
	ps.setString(174,byx43);
	ps.setString(175,ysbztp43);
	ps.setString(176,ysbzsm43);
	ps.setString(177,ys44);
	ps.setString(178,byx44);
	ps.setString(179,ysbztp44);
	ps.setString(180,ysbzsm44);
	ps.setString(181,ys45);
	ps.setString(182,byx45);
	ps.setString(183,ysbztp45);
	ps.setString(184,ysbzsm45);
	ps.setString(185,ys46);
	ps.setString(186,byx46);
	ps.setString(187,ysbztp46);
	ps.setString(188,ysbzsm46);
	ps.setString(189,ys47);
	ps.setString(190,byx47);
	ps.setString(191,ysbztp47);
	ps.setString(192,ysbzsm47);
	ps.setString(193,ys48);
	ps.setString(194,byx48);
	ps.setString(195,ysbztp48);
	ps.setString(196,ysbzsm48);
	ps.setString(197,ys49);
	ps.setString(198,byx49);
	ps.setString(199,ysbztp49);
	ps.setString(200,ysbzsm49);
	ps.setString(201,ys50);
	ps.setString(202,byx50);
	ps.setString(203,ysbztp50);
	ps.setString(204,ysbzsm50);
	ps.setString(205,xmfl1);
	ps.setString(206,ysjg1);
	ps.setString(207,xmfl2);
	ps.setString(208,ysjg2);
	ps.setString(209,xmfl3);
	ps.setString(210,ysjg3);
	ps.setString(211,xmfl4);
	ps.setString(212,ysjg4);
	ps.setString(213,xmfl5);
	ps.setString(214,ysjg5);
	ps.setString(215,xmfl6);
	ps.setString(216,ysjg6);
	ps.setString(217,xmfl7);
	ps.setString(218,ysjg7);
	ps.setString(219,xmfl8);
	ps.setString(220,ysjg8);
	ps.setString(221,xmfl9);
	ps.setString(222,ysjg9);
	ps.setString(223,xmfl11);
	ps.setString(224,ysjg11);
	ps.setString(225,xmfl12);
	ps.setString(226,ysjg12);
	ps.setString(227,xmfl13);
	ps.setString(228,ysjg13);
	ps.setString(229,xmfl14);
	ps.setString(230,ysjg14);
	ps.setString(231,xmfl15);
	ps.setString(232,ysjg15);
	ps.setString(233,xmfl16);
	ps.setString(234,ysjg16);
	ps.setString(235,xmfl17);
	ps.setString(236,ysjg17);
	ps.setString(237,xmfl18);
	ps.setString(238,ysjg18);
	ps.setString(239,xmfl19);
	ps.setString(240,ysjg19);
	ps.setString(241,xmfl10);
	ps.setString(242,ysjg10);
	ps.setString(243,xmfl20);
	ps.setString(244,ysjg20);
	ps.setString(245,xmfl21);
	ps.setString(246,ysjg21);
	ps.setString(247,xmfl22);
	ps.setString(248,ysjg22);
	ps.setString(249,xmfl23);
	ps.setString(250,ysjg23);
	ps.setString(251,xmfl24);
	ps.setString(252,ysjg24);
	ps.setString(253,xmfl25);
	ps.setString(254,ysjg25);
	ps.setString(255,xmfl26);
	ps.setString(256,ysjg26);
	ps.setString(257,xmfl27);
	ps.setString(258,ysjg27);
	ps.setString(259,xmfl28);
	ps.setString(260,ysjg28);
	ps.setString(261,xmfl29);
	ps.setString(262,ysjg29);
	ps.setString(263,xmfl30);
	ps.setString(264,ysjg30);
	ps.setString(265,xmfl31);
	ps.setString(266,ysjg31);
	ps.setString(267,xmfl32);
	ps.setString(268,ysjg32);
	ps.setString(269,xmfl33);
	ps.setString(270,ysjg33);
	ps.setString(271,xmfl34);
	ps.setString(272,ysjg34);
	ps.setString(273,xmfl35);
	ps.setString(274,ysjg35);
	ps.setString(275,xmfl36);
	ps.setString(276,ysjg36);
	ps.setString(277,xmfl37);
	ps.setString(278,ysjg37);
	ps.setString(279,xmfl38);
	ps.setString(280,ysjg38);
	ps.setString(281,xmfl39);
	ps.setString(282,ysjg39);
	ps.setString(283,xmfl40);
	ps.setString(284,ysjg40);
	ps.setString(285,xmfl41);
	ps.setString(286,ysjg41);
	ps.setString(287,xmfl42);
	ps.setString(288,ysjg42);
	ps.setString(289,xmfl43);
	ps.setString(290,ysjg43);
	ps.setString(291,xmfl44);
	ps.setString(292,ysjg44);
	ps.setString(293,xmfl45);
	ps.setString(294,ysjg45);
	ps.setString(295,xmfl46);
	ps.setString(296,ysjg46);
	ps.setString(297,xmfl47);
	ps.setString(298,ysjg47);
	ps.setString(299,xmfl48);
	ps.setString(300,ysjg48);
	ps.setString(301,xmfl49);
	ps.setString(302,ysjg49);
	ps.setString(303,xmfl50);
	ps.setString(304,ysjg50);
	ps.setLong(305,hbx1);
	ps.setLong(306,hbx2);
	ps.setLong(307,hbx3);
	ps.setLong(308,hbx4);
	ps.setLong(309,hbx5);
	ps.setLong(310,hbx6);
	ps.setLong(311,hbx7);
	ps.setLong(312,hbx8);
	ps.setLong(313,hbx9);
	ps.setLong(314,hbx10);
	ps.setLong(315,hbx11);
	ps.setLong(316,hbx12);
	ps.setLong(317,hbx13);
	ps.setLong(318,hbx14);
	ps.setLong(319,hbx15);
	ps.setLong(320,hbx16);
	ps.setLong(321,hbx17);
	ps.setLong(322,hbx18);
	ps.setLong(323,hbx19);
	ps.setLong(324,hbx20);
	ps.setLong(325,hbx21);
	ps.setLong(326,hbx22);
	ps.setLong(327,hbx23);
	ps.setLong(328,hbx24);
	ps.setLong(329,hbx25);
	ps.setLong(330,hbx26);
	ps.setLong(331,hbx27);
	ps.setLong(332,hbx28);
	ps.setLong(333,hbx29);
	ps.setLong(334,hbx30);
	ps.setLong(335,hbx31);
	ps.setLong(336,hbx32);
	ps.setLong(337,hbx33);
	ps.setLong(338,hbx34);
	ps.setLong(339,hbx35);
	ps.setLong(340,hbx36);
	ps.setLong(341,hbx37);
	ps.setLong(342,hbx38);
	ps.setLong(343,hbx39);
	ps.setLong(344,hbx40);
	ps.setLong(345,hbx41);
	ps.setLong(346,hbx42);
	ps.setLong(347,hbx43);
	ps.setLong(348,hbx44);
	ps.setLong(349,hbx45);
	ps.setLong(350,hbx46);
	ps.setLong(351,hbx47);
	ps.setLong(352,hbx48);
	ps.setLong(353,hbx49);
	ps.setLong(354,hbx50);
	ps.executeUpdate();
	ps.close();


	ls_sql="update dm_heysxm set yszxsl=?";
	ls_sql+=" where  (gcysbbh='"+gcysbbh+"') and  (gcysxmbm='"+gcysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,yszxsl);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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