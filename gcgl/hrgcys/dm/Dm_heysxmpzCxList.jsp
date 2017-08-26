<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
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
	gcysbbh=request.getParameter("gcysbbh");
	if (gcysbbh!=null)
	{
		gcysbbh=cf.GB2Uni(gcysbbh);
		if (!(gcysbbh.equals("")))	wheresql+=" and  (dm_heysxmpz.gcysbbh='"+gcysbbh+"')";
	}
	dm_hegcysbb_gcysbbmc=request.getParameter("dm_hegcysbb_gcysbbmc");
	if (dm_hegcysbb_gcysbbmc!=null)
	{
		dm_hegcysbb_gcysbbmc=cf.GB2Uni(dm_hegcysbb_gcysbbmc);
		if (!(dm_hegcysbb_gcysbbmc.equals("")))	wheresql+=" and  (dm_hegcysbb.gcysbbmc='"+dm_hegcysbb_gcysbbmc+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (dm_heysxmpz.gcysxmbm='"+gcysxmbm+"')";
	}
	gcysxmmc=request.getParameter("gcysxmmc");
	if (gcysxmmc!=null)
	{
		gcysxmmc=cf.GB2Uni(gcysxmmc);
		if (!(gcysxmmc.equals("")))	wheresql+=" and  (dm_heysxmpz.gcysxmmc='"+gcysxmmc+"')";
	}
	yszxsl=request.getParameter("yszxsl");
	if (yszxsl!=null)
	{
		yszxsl=yszxsl.trim();
		if (!(yszxsl.equals("")))	wheresql+=" and (dm_heysxmpz.yszxsl="+yszxsl+") ";
	}
	ys1=request.getParameter("ys1");
	if (ys1!=null)
	{
		ys1=cf.GB2Uni(ys1);
		if (!(ys1.equals("")))	wheresql+=" and  (dm_heysxmpz.ys1='"+ys1+"')";
	}
	byx1=request.getParameter("byx1");
	if (byx1!=null)
	{
		byx1=byx1.trim();
		if (!(byx1.equals("")))	wheresql+=" and (dm_heysxmpz.byx1="+byx1+") ";
	}
	ysbztp1=request.getParameter("ysbztp1");
	if (ysbztp1!=null)
	{
		ysbztp1=cf.GB2Uni(ysbztp1);
		if (!(ysbztp1.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp1='"+ysbztp1+"')";
	}
	ysbzsm1=request.getParameter("ysbzsm1");
	if (ysbzsm1!=null)
	{
		ysbzsm1=cf.GB2Uni(ysbzsm1);
		if (!(ysbzsm1.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm1='"+ysbzsm1+"')";
	}
	ys2=request.getParameter("ys2");
	if (ys2!=null)
	{
		ys2=cf.GB2Uni(ys2);
		if (!(ys2.equals("")))	wheresql+=" and  (dm_heysxmpz.ys2='"+ys2+"')";
	}
	byx2=request.getParameter("byx2");
	if (byx2!=null)
	{
		byx2=byx2.trim();
		if (!(byx2.equals("")))	wheresql+=" and (dm_heysxmpz.byx2="+byx2+") ";
	}
	ysbztp2=request.getParameter("ysbztp2");
	if (ysbztp2!=null)
	{
		ysbztp2=cf.GB2Uni(ysbztp2);
		if (!(ysbztp2.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp2='"+ysbztp2+"')";
	}
	ysbzsm2=request.getParameter("ysbzsm2");
	if (ysbzsm2!=null)
	{
		ysbzsm2=cf.GB2Uni(ysbzsm2);
		if (!(ysbzsm2.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm2='"+ysbzsm2+"')";
	}
	ys3=request.getParameter("ys3");
	if (ys3!=null)
	{
		ys3=cf.GB2Uni(ys3);
		if (!(ys3.equals("")))	wheresql+=" and  (dm_heysxmpz.ys3='"+ys3+"')";
	}
	byx3=request.getParameter("byx3");
	if (byx3!=null)
	{
		byx3=byx3.trim();
		if (!(byx3.equals("")))	wheresql+=" and (dm_heysxmpz.byx3="+byx3+") ";
	}
	ysbztp3=request.getParameter("ysbztp3");
	if (ysbztp3!=null)
	{
		ysbztp3=cf.GB2Uni(ysbztp3);
		if (!(ysbztp3.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp3='"+ysbztp3+"')";
	}
	ysbzsm3=request.getParameter("ysbzsm3");
	if (ysbzsm3!=null)
	{
		ysbzsm3=cf.GB2Uni(ysbzsm3);
		if (!(ysbzsm3.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm3='"+ysbzsm3+"')";
	}
	ys4=request.getParameter("ys4");
	if (ys4!=null)
	{
		ys4=cf.GB2Uni(ys4);
		if (!(ys4.equals("")))	wheresql+=" and  (dm_heysxmpz.ys4='"+ys4+"')";
	}
	byx4=request.getParameter("byx4");
	if (byx4!=null)
	{
		byx4=byx4.trim();
		if (!(byx4.equals("")))	wheresql+=" and (dm_heysxmpz.byx4="+byx4+") ";
	}
	ysbztp4=request.getParameter("ysbztp4");
	if (ysbztp4!=null)
	{
		ysbztp4=cf.GB2Uni(ysbztp4);
		if (!(ysbztp4.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp4='"+ysbztp4+"')";
	}
	ysbzsm4=request.getParameter("ysbzsm4");
	if (ysbzsm4!=null)
	{
		ysbzsm4=cf.GB2Uni(ysbzsm4);
		if (!(ysbzsm4.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm4='"+ysbzsm4+"')";
	}
	ys5=request.getParameter("ys5");
	if (ys5!=null)
	{
		ys5=cf.GB2Uni(ys5);
		if (!(ys5.equals("")))	wheresql+=" and  (dm_heysxmpz.ys5='"+ys5+"')";
	}
	byx5=request.getParameter("byx5");
	if (byx5!=null)
	{
		byx5=byx5.trim();
		if (!(byx5.equals("")))	wheresql+=" and (dm_heysxmpz.byx5="+byx5+") ";
	}
	ysbztp5=request.getParameter("ysbztp5");
	if (ysbztp5!=null)
	{
		ysbztp5=cf.GB2Uni(ysbztp5);
		if (!(ysbztp5.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp5='"+ysbztp5+"')";
	}
	ysbzsm5=request.getParameter("ysbzsm5");
	if (ysbzsm5!=null)
	{
		ysbzsm5=cf.GB2Uni(ysbzsm5);
		if (!(ysbzsm5.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm5='"+ysbzsm5+"')";
	}
	ys6=request.getParameter("ys6");
	if (ys6!=null)
	{
		ys6=cf.GB2Uni(ys6);
		if (!(ys6.equals("")))	wheresql+=" and  (dm_heysxmpz.ys6='"+ys6+"')";
	}
	byx6=request.getParameter("byx6");
	if (byx6!=null)
	{
		byx6=byx6.trim();
		if (!(byx6.equals("")))	wheresql+=" and (dm_heysxmpz.byx6="+byx6+") ";
	}
	ysbztp6=request.getParameter("ysbztp6");
	if (ysbztp6!=null)
	{
		ysbztp6=cf.GB2Uni(ysbztp6);
		if (!(ysbztp6.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp6='"+ysbztp6+"')";
	}
	ysbzsm6=request.getParameter("ysbzsm6");
	if (ysbzsm6!=null)
	{
		ysbzsm6=cf.GB2Uni(ysbzsm6);
		if (!(ysbzsm6.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm6='"+ysbzsm6+"')";
	}
	ys7=request.getParameter("ys7");
	if (ys7!=null)
	{
		ys7=cf.GB2Uni(ys7);
		if (!(ys7.equals("")))	wheresql+=" and  (dm_heysxmpz.ys7='"+ys7+"')";
	}
	byx7=request.getParameter("byx7");
	if (byx7!=null)
	{
		byx7=byx7.trim();
		if (!(byx7.equals("")))	wheresql+=" and (dm_heysxmpz.byx7="+byx7+") ";
	}
	ysbztp7=request.getParameter("ysbztp7");
	if (ysbztp7!=null)
	{
		ysbztp7=cf.GB2Uni(ysbztp7);
		if (!(ysbztp7.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp7='"+ysbztp7+"')";
	}
	ysbzsm7=request.getParameter("ysbzsm7");
	if (ysbzsm7!=null)
	{
		ysbzsm7=cf.GB2Uni(ysbzsm7);
		if (!(ysbzsm7.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm7='"+ysbzsm7+"')";
	}
	ys8=request.getParameter("ys8");
	if (ys8!=null)
	{
		ys8=cf.GB2Uni(ys8);
		if (!(ys8.equals("")))	wheresql+=" and  (dm_heysxmpz.ys8='"+ys8+"')";
	}
	byx8=request.getParameter("byx8");
	if (byx8!=null)
	{
		byx8=byx8.trim();
		if (!(byx8.equals("")))	wheresql+=" and (dm_heysxmpz.byx8="+byx8+") ";
	}
	ysbztp8=request.getParameter("ysbztp8");
	if (ysbztp8!=null)
	{
		ysbztp8=cf.GB2Uni(ysbztp8);
		if (!(ysbztp8.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp8='"+ysbztp8+"')";
	}
	ysbzsm8=request.getParameter("ysbzsm8");
	if (ysbzsm8!=null)
	{
		ysbzsm8=cf.GB2Uni(ysbzsm8);
		if (!(ysbzsm8.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm8='"+ysbzsm8+"')";
	}
	ys9=request.getParameter("ys9");
	if (ys9!=null)
	{
		ys9=cf.GB2Uni(ys9);
		if (!(ys9.equals("")))	wheresql+=" and  (dm_heysxmpz.ys9='"+ys9+"')";
	}
	byx9=request.getParameter("byx9");
	if (byx9!=null)
	{
		byx9=byx9.trim();
		if (!(byx9.equals("")))	wheresql+=" and (dm_heysxmpz.byx9="+byx9+") ";
	}
	ysbztp9=request.getParameter("ysbztp9");
	if (ysbztp9!=null)
	{
		ysbztp9=cf.GB2Uni(ysbztp9);
		if (!(ysbztp9.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp9='"+ysbztp9+"')";
	}
	ysbzsm9=request.getParameter("ysbzsm9");
	if (ysbzsm9!=null)
	{
		ysbzsm9=cf.GB2Uni(ysbzsm9);
		if (!(ysbzsm9.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm9='"+ysbzsm9+"')";
	}
	ys10=request.getParameter("ys10");
	if (ys10!=null)
	{
		ys10=cf.GB2Uni(ys10);
		if (!(ys10.equals("")))	wheresql+=" and  (dm_heysxmpz.ys10='"+ys10+"')";
	}
	byx10=request.getParameter("byx10");
	if (byx10!=null)
	{
		byx10=byx10.trim();
		if (!(byx10.equals("")))	wheresql+=" and (dm_heysxmpz.byx10="+byx10+") ";
	}
	ysbztp10=request.getParameter("ysbztp10");
	if (ysbztp10!=null)
	{
		ysbztp10=cf.GB2Uni(ysbztp10);
		if (!(ysbztp10.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp10='"+ysbztp10+"')";
	}
	ysbzsm10=request.getParameter("ysbzsm10");
	if (ysbzsm10!=null)
	{
		ysbzsm10=cf.GB2Uni(ysbzsm10);
		if (!(ysbzsm10.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm10='"+ysbzsm10+"')";
	}
	ys11=request.getParameter("ys11");
	if (ys11!=null)
	{
		ys11=cf.GB2Uni(ys11);
		if (!(ys11.equals("")))	wheresql+=" and  (dm_heysxmpz.ys11='"+ys11+"')";
	}
	byx11=request.getParameter("byx11");
	if (byx11!=null)
	{
		byx11=byx11.trim();
		if (!(byx11.equals("")))	wheresql+=" and (dm_heysxmpz.byx11="+byx11+") ";
	}
	ysbztp11=request.getParameter("ysbztp11");
	if (ysbztp11!=null)
	{
		ysbztp11=cf.GB2Uni(ysbztp11);
		if (!(ysbztp11.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp11='"+ysbztp11+"')";
	}
	ysbzsm11=request.getParameter("ysbzsm11");
	if (ysbzsm11!=null)
	{
		ysbzsm11=cf.GB2Uni(ysbzsm11);
		if (!(ysbzsm11.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm11='"+ysbzsm11+"')";
	}
	ys12=request.getParameter("ys12");
	if (ys12!=null)
	{
		ys12=cf.GB2Uni(ys12);
		if (!(ys12.equals("")))	wheresql+=" and  (dm_heysxmpz.ys12='"+ys12+"')";
	}
	byx12=request.getParameter("byx12");
	if (byx12!=null)
	{
		byx12=byx12.trim();
		if (!(byx12.equals("")))	wheresql+=" and (dm_heysxmpz.byx12="+byx12+") ";
	}
	ysbztp12=request.getParameter("ysbztp12");
	if (ysbztp12!=null)
	{
		ysbztp12=cf.GB2Uni(ysbztp12);
		if (!(ysbztp12.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp12='"+ysbztp12+"')";
	}
	ysbzsm12=request.getParameter("ysbzsm12");
	if (ysbzsm12!=null)
	{
		ysbzsm12=cf.GB2Uni(ysbzsm12);
		if (!(ysbzsm12.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm12='"+ysbzsm12+"')";
	}
	ys13=request.getParameter("ys13");
	if (ys13!=null)
	{
		ys13=cf.GB2Uni(ys13);
		if (!(ys13.equals("")))	wheresql+=" and  (dm_heysxmpz.ys13='"+ys13+"')";
	}
	byx13=request.getParameter("byx13");
	if (byx13!=null)
	{
		byx13=byx13.trim();
		if (!(byx13.equals("")))	wheresql+=" and (dm_heysxmpz.byx13="+byx13+") ";
	}
	ysbztp13=request.getParameter("ysbztp13");
	if (ysbztp13!=null)
	{
		ysbztp13=cf.GB2Uni(ysbztp13);
		if (!(ysbztp13.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp13='"+ysbztp13+"')";
	}
	ysbzsm13=request.getParameter("ysbzsm13");
	if (ysbzsm13!=null)
	{
		ysbzsm13=cf.GB2Uni(ysbzsm13);
		if (!(ysbzsm13.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm13='"+ysbzsm13+"')";
	}
	ys14=request.getParameter("ys14");
	if (ys14!=null)
	{
		ys14=cf.GB2Uni(ys14);
		if (!(ys14.equals("")))	wheresql+=" and  (dm_heysxmpz.ys14='"+ys14+"')";
	}
	byx14=request.getParameter("byx14");
	if (byx14!=null)
	{
		byx14=byx14.trim();
		if (!(byx14.equals("")))	wheresql+=" and (dm_heysxmpz.byx14="+byx14+") ";
	}
	ysbztp14=request.getParameter("ysbztp14");
	if (ysbztp14!=null)
	{
		ysbztp14=cf.GB2Uni(ysbztp14);
		if (!(ysbztp14.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp14='"+ysbztp14+"')";
	}
	ysbzsm14=request.getParameter("ysbzsm14");
	if (ysbzsm14!=null)
	{
		ysbzsm14=cf.GB2Uni(ysbzsm14);
		if (!(ysbzsm14.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm14='"+ysbzsm14+"')";
	}
	ys15=request.getParameter("ys15");
	if (ys15!=null)
	{
		ys15=cf.GB2Uni(ys15);
		if (!(ys15.equals("")))	wheresql+=" and  (dm_heysxmpz.ys15='"+ys15+"')";
	}
	byx15=request.getParameter("byx15");
	if (byx15!=null)
	{
		byx15=byx15.trim();
		if (!(byx15.equals("")))	wheresql+=" and (dm_heysxmpz.byx15="+byx15+") ";
	}
	ysbztp15=request.getParameter("ysbztp15");
	if (ysbztp15!=null)
	{
		ysbztp15=cf.GB2Uni(ysbztp15);
		if (!(ysbztp15.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp15='"+ysbztp15+"')";
	}
	ysbzsm15=request.getParameter("ysbzsm15");
	if (ysbzsm15!=null)
	{
		ysbzsm15=cf.GB2Uni(ysbzsm15);
		if (!(ysbzsm15.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm15='"+ysbzsm15+"')";
	}
	ys16=request.getParameter("ys16");
	if (ys16!=null)
	{
		ys16=cf.GB2Uni(ys16);
		if (!(ys16.equals("")))	wheresql+=" and  (dm_heysxmpz.ys16='"+ys16+"')";
	}
	byx16=request.getParameter("byx16");
	if (byx16!=null)
	{
		byx16=byx16.trim();
		if (!(byx16.equals("")))	wheresql+=" and (dm_heysxmpz.byx16="+byx16+") ";
	}
	ysbztp16=request.getParameter("ysbztp16");
	if (ysbztp16!=null)
	{
		ysbztp16=cf.GB2Uni(ysbztp16);
		if (!(ysbztp16.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp16='"+ysbztp16+"')";
	}
	ysbzsm16=request.getParameter("ysbzsm16");
	if (ysbzsm16!=null)
	{
		ysbzsm16=cf.GB2Uni(ysbzsm16);
		if (!(ysbzsm16.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm16='"+ysbzsm16+"')";
	}
	ys17=request.getParameter("ys17");
	if (ys17!=null)
	{
		ys17=cf.GB2Uni(ys17);
		if (!(ys17.equals("")))	wheresql+=" and  (dm_heysxmpz.ys17='"+ys17+"')";
	}
	byx17=request.getParameter("byx17");
	if (byx17!=null)
	{
		byx17=byx17.trim();
		if (!(byx17.equals("")))	wheresql+=" and (dm_heysxmpz.byx17="+byx17+") ";
	}
	ysbztp17=request.getParameter("ysbztp17");
	if (ysbztp17!=null)
	{
		ysbztp17=cf.GB2Uni(ysbztp17);
		if (!(ysbztp17.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp17='"+ysbztp17+"')";
	}
	ysbzsm17=request.getParameter("ysbzsm17");
	if (ysbzsm17!=null)
	{
		ysbzsm17=cf.GB2Uni(ysbzsm17);
		if (!(ysbzsm17.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm17='"+ysbzsm17+"')";
	}
	ys18=request.getParameter("ys18");
	if (ys18!=null)
	{
		ys18=cf.GB2Uni(ys18);
		if (!(ys18.equals("")))	wheresql+=" and  (dm_heysxmpz.ys18='"+ys18+"')";
	}
	byx18=request.getParameter("byx18");
	if (byx18!=null)
	{
		byx18=byx18.trim();
		if (!(byx18.equals("")))	wheresql+=" and (dm_heysxmpz.byx18="+byx18+") ";
	}
	ysbztp18=request.getParameter("ysbztp18");
	if (ysbztp18!=null)
	{
		ysbztp18=cf.GB2Uni(ysbztp18);
		if (!(ysbztp18.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp18='"+ysbztp18+"')";
	}
	ysbzsm18=request.getParameter("ysbzsm18");
	if (ysbzsm18!=null)
	{
		ysbzsm18=cf.GB2Uni(ysbzsm18);
		if (!(ysbzsm18.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm18='"+ysbzsm18+"')";
	}
	ys19=request.getParameter("ys19");
	if (ys19!=null)
	{
		ys19=cf.GB2Uni(ys19);
		if (!(ys19.equals("")))	wheresql+=" and  (dm_heysxmpz.ys19='"+ys19+"')";
	}
	byx19=request.getParameter("byx19");
	if (byx19!=null)
	{
		byx19=byx19.trim();
		if (!(byx19.equals("")))	wheresql+=" and (dm_heysxmpz.byx19="+byx19+") ";
	}
	ysbztp19=request.getParameter("ysbztp19");
	if (ysbztp19!=null)
	{
		ysbztp19=cf.GB2Uni(ysbztp19);
		if (!(ysbztp19.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp19='"+ysbztp19+"')";
	}
	ysbzsm19=request.getParameter("ysbzsm19");
	if (ysbzsm19!=null)
	{
		ysbzsm19=cf.GB2Uni(ysbzsm19);
		if (!(ysbzsm19.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm19='"+ysbzsm19+"')";
	}
	ys20=request.getParameter("ys20");
	if (ys20!=null)
	{
		ys20=cf.GB2Uni(ys20);
		if (!(ys20.equals("")))	wheresql+=" and  (dm_heysxmpz.ys20='"+ys20+"')";
	}
	byx20=request.getParameter("byx20");
	if (byx20!=null)
	{
		byx20=byx20.trim();
		if (!(byx20.equals("")))	wheresql+=" and (dm_heysxmpz.byx20="+byx20+") ";
	}
	ysbztp20=request.getParameter("ysbztp20");
	if (ysbztp20!=null)
	{
		ysbztp20=cf.GB2Uni(ysbztp20);
		if (!(ysbztp20.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp20='"+ysbztp20+"')";
	}
	ysbzsm20=request.getParameter("ysbzsm20");
	if (ysbzsm20!=null)
	{
		ysbzsm20=cf.GB2Uni(ysbzsm20);
		if (!(ysbzsm20.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm20='"+ysbzsm20+"')";
	}
	ys21=request.getParameter("ys21");
	if (ys21!=null)
	{
		ys21=cf.GB2Uni(ys21);
		if (!(ys21.equals("")))	wheresql+=" and  (dm_heysxmpz.ys21='"+ys21+"')";
	}
	byx21=request.getParameter("byx21");
	if (byx21!=null)
	{
		byx21=byx21.trim();
		if (!(byx21.equals("")))	wheresql+=" and (dm_heysxmpz.byx21="+byx21+") ";
	}
	ysbztp21=request.getParameter("ysbztp21");
	if (ysbztp21!=null)
	{
		ysbztp21=cf.GB2Uni(ysbztp21);
		if (!(ysbztp21.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp21='"+ysbztp21+"')";
	}
	ysbzsm21=request.getParameter("ysbzsm21");
	if (ysbzsm21!=null)
	{
		ysbzsm21=cf.GB2Uni(ysbzsm21);
		if (!(ysbzsm21.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm21='"+ysbzsm21+"')";
	}
	ys22=request.getParameter("ys22");
	if (ys22!=null)
	{
		ys22=cf.GB2Uni(ys22);
		if (!(ys22.equals("")))	wheresql+=" and  (dm_heysxmpz.ys22='"+ys22+"')";
	}
	byx22=request.getParameter("byx22");
	if (byx22!=null)
	{
		byx22=byx22.trim();
		if (!(byx22.equals("")))	wheresql+=" and (dm_heysxmpz.byx22="+byx22+") ";
	}
	ysbztp22=request.getParameter("ysbztp22");
	if (ysbztp22!=null)
	{
		ysbztp22=cf.GB2Uni(ysbztp22);
		if (!(ysbztp22.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp22='"+ysbztp22+"')";
	}
	ysbzsm22=request.getParameter("ysbzsm22");
	if (ysbzsm22!=null)
	{
		ysbzsm22=cf.GB2Uni(ysbzsm22);
		if (!(ysbzsm22.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm22='"+ysbzsm22+"')";
	}
	ys23=request.getParameter("ys23");
	if (ys23!=null)
	{
		ys23=cf.GB2Uni(ys23);
		if (!(ys23.equals("")))	wheresql+=" and  (dm_heysxmpz.ys23='"+ys23+"')";
	}
	byx23=request.getParameter("byx23");
	if (byx23!=null)
	{
		byx23=byx23.trim();
		if (!(byx23.equals("")))	wheresql+=" and (dm_heysxmpz.byx23="+byx23+") ";
	}
	ysbztp23=request.getParameter("ysbztp23");
	if (ysbztp23!=null)
	{
		ysbztp23=cf.GB2Uni(ysbztp23);
		if (!(ysbztp23.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp23='"+ysbztp23+"')";
	}
	ysbzsm23=request.getParameter("ysbzsm23");
	if (ysbzsm23!=null)
	{
		ysbzsm23=cf.GB2Uni(ysbzsm23);
		if (!(ysbzsm23.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm23='"+ysbzsm23+"')";
	}
	ys24=request.getParameter("ys24");
	if (ys24!=null)
	{
		ys24=cf.GB2Uni(ys24);
		if (!(ys24.equals("")))	wheresql+=" and  (dm_heysxmpz.ys24='"+ys24+"')";
	}
	byx24=request.getParameter("byx24");
	if (byx24!=null)
	{
		byx24=byx24.trim();
		if (!(byx24.equals("")))	wheresql+=" and (dm_heysxmpz.byx24="+byx24+") ";
	}
	ysbztp24=request.getParameter("ysbztp24");
	if (ysbztp24!=null)
	{
		ysbztp24=cf.GB2Uni(ysbztp24);
		if (!(ysbztp24.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp24='"+ysbztp24+"')";
	}
	ysbzsm24=request.getParameter("ysbzsm24");
	if (ysbzsm24!=null)
	{
		ysbzsm24=cf.GB2Uni(ysbzsm24);
		if (!(ysbzsm24.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm24='"+ysbzsm24+"')";
	}
	ys25=request.getParameter("ys25");
	if (ys25!=null)
	{
		ys25=cf.GB2Uni(ys25);
		if (!(ys25.equals("")))	wheresql+=" and  (dm_heysxmpz.ys25='"+ys25+"')";
	}
	byx25=request.getParameter("byx25");
	if (byx25!=null)
	{
		byx25=byx25.trim();
		if (!(byx25.equals("")))	wheresql+=" and (dm_heysxmpz.byx25="+byx25+") ";
	}
	ysbztp25=request.getParameter("ysbztp25");
	if (ysbztp25!=null)
	{
		ysbztp25=cf.GB2Uni(ysbztp25);
		if (!(ysbztp25.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp25='"+ysbztp25+"')";
	}
	ysbzsm25=request.getParameter("ysbzsm25");
	if (ysbzsm25!=null)
	{
		ysbzsm25=cf.GB2Uni(ysbzsm25);
		if (!(ysbzsm25.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm25='"+ysbzsm25+"')";
	}
	ys26=request.getParameter("ys26");
	if (ys26!=null)
	{
		ys26=cf.GB2Uni(ys26);
		if (!(ys26.equals("")))	wheresql+=" and  (dm_heysxmpz.ys26='"+ys26+"')";
	}
	byx26=request.getParameter("byx26");
	if (byx26!=null)
	{
		byx26=byx26.trim();
		if (!(byx26.equals("")))	wheresql+=" and (dm_heysxmpz.byx26="+byx26+") ";
	}
	ysbztp26=request.getParameter("ysbztp26");
	if (ysbztp26!=null)
	{
		ysbztp26=cf.GB2Uni(ysbztp26);
		if (!(ysbztp26.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp26='"+ysbztp26+"')";
	}
	ysbzsm26=request.getParameter("ysbzsm26");
	if (ysbzsm26!=null)
	{
		ysbzsm26=cf.GB2Uni(ysbzsm26);
		if (!(ysbzsm26.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm26='"+ysbzsm26+"')";
	}
	ys27=request.getParameter("ys27");
	if (ys27!=null)
	{
		ys27=cf.GB2Uni(ys27);
		if (!(ys27.equals("")))	wheresql+=" and  (dm_heysxmpz.ys27='"+ys27+"')";
	}
	byx27=request.getParameter("byx27");
	if (byx27!=null)
	{
		byx27=byx27.trim();
		if (!(byx27.equals("")))	wheresql+=" and (dm_heysxmpz.byx27="+byx27+") ";
	}
	ysbztp27=request.getParameter("ysbztp27");
	if (ysbztp27!=null)
	{
		ysbztp27=cf.GB2Uni(ysbztp27);
		if (!(ysbztp27.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp27='"+ysbztp27+"')";
	}
	ysbzsm27=request.getParameter("ysbzsm27");
	if (ysbzsm27!=null)
	{
		ysbzsm27=cf.GB2Uni(ysbzsm27);
		if (!(ysbzsm27.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm27='"+ysbzsm27+"')";
	}
	ys28=request.getParameter("ys28");
	if (ys28!=null)
	{
		ys28=cf.GB2Uni(ys28);
		if (!(ys28.equals("")))	wheresql+=" and  (dm_heysxmpz.ys28='"+ys28+"')";
	}
	byx28=request.getParameter("byx28");
	if (byx28!=null)
	{
		byx28=byx28.trim();
		if (!(byx28.equals("")))	wheresql+=" and (dm_heysxmpz.byx28="+byx28+") ";
	}
	ysbztp28=request.getParameter("ysbztp28");
	if (ysbztp28!=null)
	{
		ysbztp28=cf.GB2Uni(ysbztp28);
		if (!(ysbztp28.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp28='"+ysbztp28+"')";
	}
	ysbzsm28=request.getParameter("ysbzsm28");
	if (ysbzsm28!=null)
	{
		ysbzsm28=cf.GB2Uni(ysbzsm28);
		if (!(ysbzsm28.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm28='"+ysbzsm28+"')";
	}
	ys29=request.getParameter("ys29");
	if (ys29!=null)
	{
		ys29=cf.GB2Uni(ys29);
		if (!(ys29.equals("")))	wheresql+=" and  (dm_heysxmpz.ys29='"+ys29+"')";
	}
	byx29=request.getParameter("byx29");
	if (byx29!=null)
	{
		byx29=byx29.trim();
		if (!(byx29.equals("")))	wheresql+=" and (dm_heysxmpz.byx29="+byx29+") ";
	}
	ysbztp29=request.getParameter("ysbztp29");
	if (ysbztp29!=null)
	{
		ysbztp29=cf.GB2Uni(ysbztp29);
		if (!(ysbztp29.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp29='"+ysbztp29+"')";
	}
	ysbzsm29=request.getParameter("ysbzsm29");
	if (ysbzsm29!=null)
	{
		ysbzsm29=cf.GB2Uni(ysbzsm29);
		if (!(ysbzsm29.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm29='"+ysbzsm29+"')";
	}
	ys30=request.getParameter("ys30");
	if (ys30!=null)
	{
		ys30=cf.GB2Uni(ys30);
		if (!(ys30.equals("")))	wheresql+=" and  (dm_heysxmpz.ys30='"+ys30+"')";
	}
	byx30=request.getParameter("byx30");
	if (byx30!=null)
	{
		byx30=byx30.trim();
		if (!(byx30.equals("")))	wheresql+=" and (dm_heysxmpz.byx30="+byx30+") ";
	}
	ysbztp30=request.getParameter("ysbztp30");
	if (ysbztp30!=null)
	{
		ysbztp30=cf.GB2Uni(ysbztp30);
		if (!(ysbztp30.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp30='"+ysbztp30+"')";
	}
	ysbzsm30=request.getParameter("ysbzsm30");
	if (ysbzsm30!=null)
	{
		ysbzsm30=cf.GB2Uni(ysbzsm30);
		if (!(ysbzsm30.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm30='"+ysbzsm30+"')";
	}
	ys31=request.getParameter("ys31");
	if (ys31!=null)
	{
		ys31=cf.GB2Uni(ys31);
		if (!(ys31.equals("")))	wheresql+=" and  (dm_heysxmpz.ys31='"+ys31+"')";
	}
	byx31=request.getParameter("byx31");
	if (byx31!=null)
	{
		byx31=byx31.trim();
		if (!(byx31.equals("")))	wheresql+=" and (dm_heysxmpz.byx31="+byx31+") ";
	}
	ysbztp31=request.getParameter("ysbztp31");
	if (ysbztp31!=null)
	{
		ysbztp31=cf.GB2Uni(ysbztp31);
		if (!(ysbztp31.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp31='"+ysbztp31+"')";
	}
	ysbzsm31=request.getParameter("ysbzsm31");
	if (ysbzsm31!=null)
	{
		ysbzsm31=cf.GB2Uni(ysbzsm31);
		if (!(ysbzsm31.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm31='"+ysbzsm31+"')";
	}
	ys32=request.getParameter("ys32");
	if (ys32!=null)
	{
		ys32=cf.GB2Uni(ys32);
		if (!(ys32.equals("")))	wheresql+=" and  (dm_heysxmpz.ys32='"+ys32+"')";
	}
	byx32=request.getParameter("byx32");
	if (byx32!=null)
	{
		byx32=byx32.trim();
		if (!(byx32.equals("")))	wheresql+=" and (dm_heysxmpz.byx32="+byx32+") ";
	}
	ysbztp32=request.getParameter("ysbztp32");
	if (ysbztp32!=null)
	{
		ysbztp32=cf.GB2Uni(ysbztp32);
		if (!(ysbztp32.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp32='"+ysbztp32+"')";
	}
	ysbzsm32=request.getParameter("ysbzsm32");
	if (ysbzsm32!=null)
	{
		ysbzsm32=cf.GB2Uni(ysbzsm32);
		if (!(ysbzsm32.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm32='"+ysbzsm32+"')";
	}
	ys33=request.getParameter("ys33");
	if (ys33!=null)
	{
		ys33=cf.GB2Uni(ys33);
		if (!(ys33.equals("")))	wheresql+=" and  (dm_heysxmpz.ys33='"+ys33+"')";
	}
	byx33=request.getParameter("byx33");
	if (byx33!=null)
	{
		byx33=byx33.trim();
		if (!(byx33.equals("")))	wheresql+=" and (dm_heysxmpz.byx33="+byx33+") ";
	}
	ysbztp33=request.getParameter("ysbztp33");
	if (ysbztp33!=null)
	{
		ysbztp33=cf.GB2Uni(ysbztp33);
		if (!(ysbztp33.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp33='"+ysbztp33+"')";
	}
	ysbzsm33=request.getParameter("ysbzsm33");
	if (ysbzsm33!=null)
	{
		ysbzsm33=cf.GB2Uni(ysbzsm33);
		if (!(ysbzsm33.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm33='"+ysbzsm33+"')";
	}
	ys34=request.getParameter("ys34");
	if (ys34!=null)
	{
		ys34=cf.GB2Uni(ys34);
		if (!(ys34.equals("")))	wheresql+=" and  (dm_heysxmpz.ys34='"+ys34+"')";
	}
	byx34=request.getParameter("byx34");
	if (byx34!=null)
	{
		byx34=byx34.trim();
		if (!(byx34.equals("")))	wheresql+=" and (dm_heysxmpz.byx34="+byx34+") ";
	}
	ysbztp34=request.getParameter("ysbztp34");
	if (ysbztp34!=null)
	{
		ysbztp34=cf.GB2Uni(ysbztp34);
		if (!(ysbztp34.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp34='"+ysbztp34+"')";
	}
	ysbzsm34=request.getParameter("ysbzsm34");
	if (ysbzsm34!=null)
	{
		ysbzsm34=cf.GB2Uni(ysbzsm34);
		if (!(ysbzsm34.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm34='"+ysbzsm34+"')";
	}
	ys35=request.getParameter("ys35");
	if (ys35!=null)
	{
		ys35=cf.GB2Uni(ys35);
		if (!(ys35.equals("")))	wheresql+=" and  (dm_heysxmpz.ys35='"+ys35+"')";
	}
	byx35=request.getParameter("byx35");
	if (byx35!=null)
	{
		byx35=byx35.trim();
		if (!(byx35.equals("")))	wheresql+=" and (dm_heysxmpz.byx35="+byx35+") ";
	}
	ysbztp35=request.getParameter("ysbztp35");
	if (ysbztp35!=null)
	{
		ysbztp35=cf.GB2Uni(ysbztp35);
		if (!(ysbztp35.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp35='"+ysbztp35+"')";
	}
	ysbzsm35=request.getParameter("ysbzsm35");
	if (ysbzsm35!=null)
	{
		ysbzsm35=cf.GB2Uni(ysbzsm35);
		if (!(ysbzsm35.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm35='"+ysbzsm35+"')";
	}
	ys36=request.getParameter("ys36");
	if (ys36!=null)
	{
		ys36=cf.GB2Uni(ys36);
		if (!(ys36.equals("")))	wheresql+=" and  (dm_heysxmpz.ys36='"+ys36+"')";
	}
	byx36=request.getParameter("byx36");
	if (byx36!=null)
	{
		byx36=byx36.trim();
		if (!(byx36.equals("")))	wheresql+=" and (dm_heysxmpz.byx36="+byx36+") ";
	}
	ysbztp36=request.getParameter("ysbztp36");
	if (ysbztp36!=null)
	{
		ysbztp36=cf.GB2Uni(ysbztp36);
		if (!(ysbztp36.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp36='"+ysbztp36+"')";
	}
	ysbzsm36=request.getParameter("ysbzsm36");
	if (ysbzsm36!=null)
	{
		ysbzsm36=cf.GB2Uni(ysbzsm36);
		if (!(ysbzsm36.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm36='"+ysbzsm36+"')";
	}
	ys37=request.getParameter("ys37");
	if (ys37!=null)
	{
		ys37=cf.GB2Uni(ys37);
		if (!(ys37.equals("")))	wheresql+=" and  (dm_heysxmpz.ys37='"+ys37+"')";
	}
	byx37=request.getParameter("byx37");
	if (byx37!=null)
	{
		byx37=byx37.trim();
		if (!(byx37.equals("")))	wheresql+=" and (dm_heysxmpz.byx37="+byx37+") ";
	}
	ysbztp37=request.getParameter("ysbztp37");
	if (ysbztp37!=null)
	{
		ysbztp37=cf.GB2Uni(ysbztp37);
		if (!(ysbztp37.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp37='"+ysbztp37+"')";
	}
	ysbzsm37=request.getParameter("ysbzsm37");
	if (ysbzsm37!=null)
	{
		ysbzsm37=cf.GB2Uni(ysbzsm37);
		if (!(ysbzsm37.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm37='"+ysbzsm37+"')";
	}
	ys38=request.getParameter("ys38");
	if (ys38!=null)
	{
		ys38=cf.GB2Uni(ys38);
		if (!(ys38.equals("")))	wheresql+=" and  (dm_heysxmpz.ys38='"+ys38+"')";
	}
	byx38=request.getParameter("byx38");
	if (byx38!=null)
	{
		byx38=byx38.trim();
		if (!(byx38.equals("")))	wheresql+=" and (dm_heysxmpz.byx38="+byx38+") ";
	}
	ysbztp38=request.getParameter("ysbztp38");
	if (ysbztp38!=null)
	{
		ysbztp38=cf.GB2Uni(ysbztp38);
		if (!(ysbztp38.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp38='"+ysbztp38+"')";
	}
	ysbzsm38=request.getParameter("ysbzsm38");
	if (ysbzsm38!=null)
	{
		ysbzsm38=cf.GB2Uni(ysbzsm38);
		if (!(ysbzsm38.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm38='"+ysbzsm38+"')";
	}
	ys39=request.getParameter("ys39");
	if (ys39!=null)
	{
		ys39=cf.GB2Uni(ys39);
		if (!(ys39.equals("")))	wheresql+=" and  (dm_heysxmpz.ys39='"+ys39+"')";
	}
	byx39=request.getParameter("byx39");
	if (byx39!=null)
	{
		byx39=byx39.trim();
		if (!(byx39.equals("")))	wheresql+=" and (dm_heysxmpz.byx39="+byx39+") ";
	}
	ysbztp39=request.getParameter("ysbztp39");
	if (ysbztp39!=null)
	{
		ysbztp39=cf.GB2Uni(ysbztp39);
		if (!(ysbztp39.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp39='"+ysbztp39+"')";
	}
	ysbzsm39=request.getParameter("ysbzsm39");
	if (ysbzsm39!=null)
	{
		ysbzsm39=cf.GB2Uni(ysbzsm39);
		if (!(ysbzsm39.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm39='"+ysbzsm39+"')";
	}
	ys40=request.getParameter("ys40");
	if (ys40!=null)
	{
		ys40=cf.GB2Uni(ys40);
		if (!(ys40.equals("")))	wheresql+=" and  (dm_heysxmpz.ys40='"+ys40+"')";
	}
	byx40=request.getParameter("byx40");
	if (byx40!=null)
	{
		byx40=byx40.trim();
		if (!(byx40.equals("")))	wheresql+=" and (dm_heysxmpz.byx40="+byx40+") ";
	}
	ysbztp40=request.getParameter("ysbztp40");
	if (ysbztp40!=null)
	{
		ysbztp40=cf.GB2Uni(ysbztp40);
		if (!(ysbztp40.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp40='"+ysbztp40+"')";
	}
	ysbzsm40=request.getParameter("ysbzsm40");
	if (ysbzsm40!=null)
	{
		ysbzsm40=cf.GB2Uni(ysbzsm40);
		if (!(ysbzsm40.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm40='"+ysbzsm40+"')";
	}
	ys41=request.getParameter("ys41");
	if (ys41!=null)
	{
		ys41=cf.GB2Uni(ys41);
		if (!(ys41.equals("")))	wheresql+=" and  (dm_heysxmpz.ys41='"+ys41+"')";
	}
	byx41=request.getParameter("byx41");
	if (byx41!=null)
	{
		byx41=byx41.trim();
		if (!(byx41.equals("")))	wheresql+=" and (dm_heysxmpz.byx41="+byx41+") ";
	}
	ysbztp41=request.getParameter("ysbztp41");
	if (ysbztp41!=null)
	{
		ysbztp41=cf.GB2Uni(ysbztp41);
		if (!(ysbztp41.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp41='"+ysbztp41+"')";
	}
	ysbzsm41=request.getParameter("ysbzsm41");
	if (ysbzsm41!=null)
	{
		ysbzsm41=cf.GB2Uni(ysbzsm41);
		if (!(ysbzsm41.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm41='"+ysbzsm41+"')";
	}
	ys42=request.getParameter("ys42");
	if (ys42!=null)
	{
		ys42=cf.GB2Uni(ys42);
		if (!(ys42.equals("")))	wheresql+=" and  (dm_heysxmpz.ys42='"+ys42+"')";
	}
	byx42=request.getParameter("byx42");
	if (byx42!=null)
	{
		byx42=byx42.trim();
		if (!(byx42.equals("")))	wheresql+=" and (dm_heysxmpz.byx42="+byx42+") ";
	}
	ysbztp42=request.getParameter("ysbztp42");
	if (ysbztp42!=null)
	{
		ysbztp42=cf.GB2Uni(ysbztp42);
		if (!(ysbztp42.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp42='"+ysbztp42+"')";
	}
	ysbzsm42=request.getParameter("ysbzsm42");
	if (ysbzsm42!=null)
	{
		ysbzsm42=cf.GB2Uni(ysbzsm42);
		if (!(ysbzsm42.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm42='"+ysbzsm42+"')";
	}
	ys43=request.getParameter("ys43");
	if (ys43!=null)
	{
		ys43=cf.GB2Uni(ys43);
		if (!(ys43.equals("")))	wheresql+=" and  (dm_heysxmpz.ys43='"+ys43+"')";
	}
	byx43=request.getParameter("byx43");
	if (byx43!=null)
	{
		byx43=byx43.trim();
		if (!(byx43.equals("")))	wheresql+=" and (dm_heysxmpz.byx43="+byx43+") ";
	}
	ysbztp43=request.getParameter("ysbztp43");
	if (ysbztp43!=null)
	{
		ysbztp43=cf.GB2Uni(ysbztp43);
		if (!(ysbztp43.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp43='"+ysbztp43+"')";
	}
	ysbzsm43=request.getParameter("ysbzsm43");
	if (ysbzsm43!=null)
	{
		ysbzsm43=cf.GB2Uni(ysbzsm43);
		if (!(ysbzsm43.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm43='"+ysbzsm43+"')";
	}
	ys44=request.getParameter("ys44");
	if (ys44!=null)
	{
		ys44=cf.GB2Uni(ys44);
		if (!(ys44.equals("")))	wheresql+=" and  (dm_heysxmpz.ys44='"+ys44+"')";
	}
	byx44=request.getParameter("byx44");
	if (byx44!=null)
	{
		byx44=byx44.trim();
		if (!(byx44.equals("")))	wheresql+=" and (dm_heysxmpz.byx44="+byx44+") ";
	}
	ysbztp44=request.getParameter("ysbztp44");
	if (ysbztp44!=null)
	{
		ysbztp44=cf.GB2Uni(ysbztp44);
		if (!(ysbztp44.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp44='"+ysbztp44+"')";
	}
	ysbzsm44=request.getParameter("ysbzsm44");
	if (ysbzsm44!=null)
	{
		ysbzsm44=cf.GB2Uni(ysbzsm44);
		if (!(ysbzsm44.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm44='"+ysbzsm44+"')";
	}
	ys45=request.getParameter("ys45");
	if (ys45!=null)
	{
		ys45=cf.GB2Uni(ys45);
		if (!(ys45.equals("")))	wheresql+=" and  (dm_heysxmpz.ys45='"+ys45+"')";
	}
	byx45=request.getParameter("byx45");
	if (byx45!=null)
	{
		byx45=byx45.trim();
		if (!(byx45.equals("")))	wheresql+=" and (dm_heysxmpz.byx45="+byx45+") ";
	}
	ysbztp45=request.getParameter("ysbztp45");
	if (ysbztp45!=null)
	{
		ysbztp45=cf.GB2Uni(ysbztp45);
		if (!(ysbztp45.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp45='"+ysbztp45+"')";
	}
	ysbzsm45=request.getParameter("ysbzsm45");
	if (ysbzsm45!=null)
	{
		ysbzsm45=cf.GB2Uni(ysbzsm45);
		if (!(ysbzsm45.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm45='"+ysbzsm45+"')";
	}
	ys46=request.getParameter("ys46");
	if (ys46!=null)
	{
		ys46=cf.GB2Uni(ys46);
		if (!(ys46.equals("")))	wheresql+=" and  (dm_heysxmpz.ys46='"+ys46+"')";
	}
	byx46=request.getParameter("byx46");
	if (byx46!=null)
	{
		byx46=byx46.trim();
		if (!(byx46.equals("")))	wheresql+=" and (dm_heysxmpz.byx46="+byx46+") ";
	}
	ysbztp46=request.getParameter("ysbztp46");
	if (ysbztp46!=null)
	{
		ysbztp46=cf.GB2Uni(ysbztp46);
		if (!(ysbztp46.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp46='"+ysbztp46+"')";
	}
	ysbzsm46=request.getParameter("ysbzsm46");
	if (ysbzsm46!=null)
	{
		ysbzsm46=cf.GB2Uni(ysbzsm46);
		if (!(ysbzsm46.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm46='"+ysbzsm46+"')";
	}
	ys47=request.getParameter("ys47");
	if (ys47!=null)
	{
		ys47=cf.GB2Uni(ys47);
		if (!(ys47.equals("")))	wheresql+=" and  (dm_heysxmpz.ys47='"+ys47+"')";
	}
	byx47=request.getParameter("byx47");
	if (byx47!=null)
	{
		byx47=byx47.trim();
		if (!(byx47.equals("")))	wheresql+=" and (dm_heysxmpz.byx47="+byx47+") ";
	}
	ysbztp47=request.getParameter("ysbztp47");
	if (ysbztp47!=null)
	{
		ysbztp47=cf.GB2Uni(ysbztp47);
		if (!(ysbztp47.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp47='"+ysbztp47+"')";
	}
	ysbzsm47=request.getParameter("ysbzsm47");
	if (ysbzsm47!=null)
	{
		ysbzsm47=cf.GB2Uni(ysbzsm47);
		if (!(ysbzsm47.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm47='"+ysbzsm47+"')";
	}
	ys48=request.getParameter("ys48");
	if (ys48!=null)
	{
		ys48=cf.GB2Uni(ys48);
		if (!(ys48.equals("")))	wheresql+=" and  (dm_heysxmpz.ys48='"+ys48+"')";
	}
	byx48=request.getParameter("byx48");
	if (byx48!=null)
	{
		byx48=byx48.trim();
		if (!(byx48.equals("")))	wheresql+=" and (dm_heysxmpz.byx48="+byx48+") ";
	}
	ysbztp48=request.getParameter("ysbztp48");
	if (ysbztp48!=null)
	{
		ysbztp48=cf.GB2Uni(ysbztp48);
		if (!(ysbztp48.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp48='"+ysbztp48+"')";
	}
	ysbzsm48=request.getParameter("ysbzsm48");
	if (ysbzsm48!=null)
	{
		ysbzsm48=cf.GB2Uni(ysbzsm48);
		if (!(ysbzsm48.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm48='"+ysbzsm48+"')";
	}
	ys49=request.getParameter("ys49");
	if (ys49!=null)
	{
		ys49=cf.GB2Uni(ys49);
		if (!(ys49.equals("")))	wheresql+=" and  (dm_heysxmpz.ys49='"+ys49+"')";
	}
	byx49=request.getParameter("byx49");
	if (byx49!=null)
	{
		byx49=byx49.trim();
		if (!(byx49.equals("")))	wheresql+=" and (dm_heysxmpz.byx49="+byx49+") ";
	}
	ysbztp49=request.getParameter("ysbztp49");
	if (ysbztp49!=null)
	{
		ysbztp49=cf.GB2Uni(ysbztp49);
		if (!(ysbztp49.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp49='"+ysbztp49+"')";
	}
	ysbzsm49=request.getParameter("ysbzsm49");
	if (ysbzsm49!=null)
	{
		ysbzsm49=cf.GB2Uni(ysbzsm49);
		if (!(ysbzsm49.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm49='"+ysbzsm49+"')";
	}
	ys50=request.getParameter("ys50");
	if (ys50!=null)
	{
		ys50=cf.GB2Uni(ys50);
		if (!(ys50.equals("")))	wheresql+=" and  (dm_heysxmpz.ys50='"+ys50+"')";
	}
	byx50=request.getParameter("byx50");
	if (byx50!=null)
	{
		byx50=byx50.trim();
		if (!(byx50.equals("")))	wheresql+=" and (dm_heysxmpz.byx50="+byx50+") ";
	}
	ysbztp50=request.getParameter("ysbztp50");
	if (ysbztp50!=null)
	{
		ysbztp50=cf.GB2Uni(ysbztp50);
		if (!(ysbztp50.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbztp50='"+ysbztp50+"')";
	}
	ysbzsm50=request.getParameter("ysbzsm50");
	if (ysbzsm50!=null)
	{
		ysbzsm50=cf.GB2Uni(ysbzsm50);
		if (!(ysbzsm50.equals("")))	wheresql+=" and  (dm_heysxmpz.ysbzsm50='"+ysbzsm50+"')";
	}
	ls_sql="SELECT dm_heysxmpz.gcysbbh,dm_hegcysbb.gcysbbmc,dm_heysxmpz.gcysxmbm,dm_heysxmpz.gcysxmmc,dm_heysxmpz.yszxsl,dm_heysxmpz.ys1, DECODE(dm_heysxmpz.byx1,'0','否','1','必验项'),dm_heysxmpz.ysbztp1,dm_heysxmpz.ysbzsm1,dm_heysxmpz.ys2, DECODE(dm_heysxmpz.byx2,'0','否','1','必验项'),dm_heysxmpz.ysbztp2,dm_heysxmpz.ysbzsm2,dm_heysxmpz.ys3, DECODE(dm_heysxmpz.byx3,'0','否','1','必验项'),dm_heysxmpz.ysbztp3,dm_heysxmpz.ysbzsm3,dm_heysxmpz.ys4, DECODE(dm_heysxmpz.byx4,'0','否','1','必验项'),dm_heysxmpz.ysbztp4,dm_heysxmpz.ysbzsm4,dm_heysxmpz.ys5, DECODE(dm_heysxmpz.byx5,'0','否','1','必验项'),dm_heysxmpz.ysbztp5,dm_heysxmpz.ysbzsm5,dm_heysxmpz.ys6, DECODE(dm_heysxmpz.byx6,'0','否','1','必验项'),dm_heysxmpz.ysbztp6,dm_heysxmpz.ysbzsm6,dm_heysxmpz.ys7, DECODE(dm_heysxmpz.byx7,'0','否','1','必验项'),dm_heysxmpz.ysbztp7,dm_heysxmpz.ysbzsm7,dm_heysxmpz.ys8, DECODE(dm_heysxmpz.byx8,'0','否','1','必验项'),dm_heysxmpz.ysbztp8,dm_heysxmpz.ysbzsm8,dm_heysxmpz.ys9, DECODE(dm_heysxmpz.byx9,'0','否','1','必验项'),dm_heysxmpz.ysbztp9,dm_heysxmpz.ysbzsm9,dm_heysxmpz.ys10, DECODE(dm_heysxmpz.byx10,'0','否','1','必验项'),dm_heysxmpz.ysbztp10,dm_heysxmpz.ysbzsm10,dm_heysxmpz.ys11, DECODE(dm_heysxmpz.byx11,'0','否','1','必验项'),dm_heysxmpz.ysbztp11,dm_heysxmpz.ysbzsm11,dm_heysxmpz.ys12, DECODE(dm_heysxmpz.byx12,'0','否','1','必验项'),dm_heysxmpz.ysbztp12,dm_heysxmpz.ysbzsm12,dm_heysxmpz.ys13, DECODE(dm_heysxmpz.byx13,'0','否','1','必验项'),dm_heysxmpz.ysbztp13,dm_heysxmpz.ysbzsm13,dm_heysxmpz.ys14, DECODE(dm_heysxmpz.byx14,'0','否','1','必验项'),dm_heysxmpz.ysbztp14,dm_heysxmpz.ysbzsm14,dm_heysxmpz.ys15, DECODE(dm_heysxmpz.byx15,'0','否','1','必验项'),dm_heysxmpz.ysbztp15,dm_heysxmpz.ysbzsm15,dm_heysxmpz.ys16, DECODE(dm_heysxmpz.byx16,'0','否','1','必验项'),dm_heysxmpz.ysbztp16,dm_heysxmpz.ysbzsm16,dm_heysxmpz.ys17, DECODE(dm_heysxmpz.byx17,'0','否','1','必验项'),dm_heysxmpz.ysbztp17,dm_heysxmpz.ysbzsm17,dm_heysxmpz.ys18, DECODE(dm_heysxmpz.byx18,'0','否','1','必验项'),dm_heysxmpz.ysbztp18,dm_heysxmpz.ysbzsm18,dm_heysxmpz.ys19, DECODE(dm_heysxmpz.byx19,'0','否','1','必验项'),dm_heysxmpz.ysbztp19,dm_heysxmpz.ysbzsm19,dm_heysxmpz.ys20, DECODE(dm_heysxmpz.byx20,'0','否','1','必验项'),dm_heysxmpz.ysbztp20,dm_heysxmpz.ysbzsm20,dm_heysxmpz.ys21, DECODE(dm_heysxmpz.byx21,'0','否','1','必验项'),dm_heysxmpz.ysbztp21,dm_heysxmpz.ysbzsm21,dm_heysxmpz.ys22, DECODE(dm_heysxmpz.byx22,'0','否','1','必验项'),dm_heysxmpz.ysbztp22,dm_heysxmpz.ysbzsm22,dm_heysxmpz.ys23, DECODE(dm_heysxmpz.byx23,'0','否','1','必验项'),dm_heysxmpz.ysbztp23,dm_heysxmpz.ysbzsm23,dm_heysxmpz.ys24, DECODE(dm_heysxmpz.byx24,'0','否','1','必验项'),dm_heysxmpz.ysbztp24,dm_heysxmpz.ysbzsm24,dm_heysxmpz.ys25, DECODE(dm_heysxmpz.byx25,'0','否','1','必验项'),dm_heysxmpz.ysbztp25,dm_heysxmpz.ysbzsm25,dm_heysxmpz.ys26, DECODE(dm_heysxmpz.byx26,'0','否','1','必验项'),dm_heysxmpz.ysbztp26,dm_heysxmpz.ysbzsm26,dm_heysxmpz.ys27, DECODE(dm_heysxmpz.byx27,'0','否','1','必验项'),dm_heysxmpz.ysbztp27,dm_heysxmpz.ysbzsm27,dm_heysxmpz.ys28, DECODE(dm_heysxmpz.byx28,'0','否','1','必验项'),dm_heysxmpz.ysbztp28,dm_heysxmpz.ysbzsm28,dm_heysxmpz.ys29, DECODE(dm_heysxmpz.byx29,'0','否','1','必验项'),dm_heysxmpz.ysbztp29,dm_heysxmpz.ysbzsm29,dm_heysxmpz.ys30, DECODE(dm_heysxmpz.byx30,'0','否','1','必验项'),dm_heysxmpz.ysbztp30,dm_heysxmpz.ysbzsm30,dm_heysxmpz.ys31, DECODE(dm_heysxmpz.byx31,'0','否','1','必验项'),dm_heysxmpz.ysbztp31,dm_heysxmpz.ysbzsm31,dm_heysxmpz.ys32, DECODE(dm_heysxmpz.byx32,'0','否','1','必验项'),dm_heysxmpz.ysbztp32,dm_heysxmpz.ysbzsm32,dm_heysxmpz.ys33, DECODE(dm_heysxmpz.byx33,'0','否','1','必验项'),dm_heysxmpz.ysbztp33,dm_heysxmpz.ysbzsm33,dm_heysxmpz.ys34, DECODE(dm_heysxmpz.byx34,'0','否','1','必验项'),dm_heysxmpz.ysbztp34,dm_heysxmpz.ysbzsm34,dm_heysxmpz.ys35, DECODE(dm_heysxmpz.byx35,'0','否','1','必验项'),dm_heysxmpz.ysbztp35,dm_heysxmpz.ysbzsm35,dm_heysxmpz.ys36, DECODE(dm_heysxmpz.byx36,'0','否','1','必验项'),dm_heysxmpz.ysbztp36,dm_heysxmpz.ysbzsm36,dm_heysxmpz.ys37, DECODE(dm_heysxmpz.byx37,'0','否','1','必验项'),dm_heysxmpz.ysbztp37,dm_heysxmpz.ysbzsm37,dm_heysxmpz.ys38, DECODE(dm_heysxmpz.byx38,'0','否','1','必验项'),dm_heysxmpz.ysbztp38,dm_heysxmpz.ysbzsm38,dm_heysxmpz.ys39, DECODE(dm_heysxmpz.byx39,'0','否','1','必验项'),dm_heysxmpz.ysbztp39,dm_heysxmpz.ysbzsm39,dm_heysxmpz.ys40, DECODE(dm_heysxmpz.byx40,'0','否','1','必验项'),dm_heysxmpz.ysbztp40,dm_heysxmpz.ysbzsm40,dm_heysxmpz.ys41, DECODE(dm_heysxmpz.byx41,'0','否','1','必验项'),dm_heysxmpz.ysbztp41,dm_heysxmpz.ysbzsm41,dm_heysxmpz.ys42, DECODE(dm_heysxmpz.byx42,'0','否','1','必验项'),dm_heysxmpz.ysbztp42,dm_heysxmpz.ysbzsm42,dm_heysxmpz.ys43, DECODE(dm_heysxmpz.byx43,'0','否','1','必验项'),dm_heysxmpz.ysbztp43,dm_heysxmpz.ysbzsm43,dm_heysxmpz.ys44, DECODE(dm_heysxmpz.byx44,'0','否','1','必验项'),dm_heysxmpz.ysbztp44,dm_heysxmpz.ysbzsm44,dm_heysxmpz.ys45, DECODE(dm_heysxmpz.byx45,'0','否','1','必验项'),dm_heysxmpz.ysbztp45,dm_heysxmpz.ysbzsm45,dm_heysxmpz.ys46, DECODE(dm_heysxmpz.byx46,'0','否','1','必验项'),dm_heysxmpz.ysbztp46,dm_heysxmpz.ysbzsm46,dm_heysxmpz.ys47, DECODE(dm_heysxmpz.byx47,'0','否','1','必验项'),dm_heysxmpz.ysbztp47,dm_heysxmpz.ysbzsm47,dm_heysxmpz.ys48, DECODE(dm_heysxmpz.byx48,'0','否','1','必验项'),dm_heysxmpz.ysbztp48,dm_heysxmpz.ysbzsm48,dm_heysxmpz.ys49, DECODE(dm_heysxmpz.byx49,'0','否','1','必验项'),dm_heysxmpz.ysbztp49,dm_heysxmpz.ysbzsm49,dm_heysxmpz.ys50, DECODE(dm_heysxmpz.byx50,'0','否','1','必验项'),dm_heysxmpz.ysbztp50,dm_heysxmpz.ysbzsm50  ";
	ls_sql+=" FROM dm_hegcysbb,dm_heysxmpz  ";
    ls_sql+=" where dm_heysxmpz.gcysbbh=dm_hegcysbb.gcysbbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_heysxmpz.gcysbbh desc,dm_heysxmpz.gcysxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_heysxmpzCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gcysbbh","dm_hegcysbb_gcysbbmc","gcysxmbm","gcysxmmc","yszxsl","ys1","byx1","ysbztp1","ysbzsm1","ys2","byx2","ysbztp2","ysbzsm2","ys3","byx3","ysbztp3","ysbzsm3","ys4","byx4","ysbztp4","ysbzsm4","ys5","byx5","ysbztp5","ysbzsm5","ys6","byx6","ysbztp6","ysbzsm6","ys7","byx7","ysbztp7","ysbzsm7","ys8","byx8","ysbztp8","ysbzsm8","ys9","byx9","ysbztp9","ysbzsm9","ys10","byx10","ysbztp10","ysbzsm10","ys11","byx11","ysbztp11","ysbzsm11","ys12","byx12","ysbztp12","ysbzsm12","ys13","byx13","ysbztp13","ysbzsm13","ys14","byx14","ysbztp14","ysbzsm14","ys15","byx15","ysbztp15","ysbzsm15","ys16","byx16","ysbztp16","ysbzsm16","ys17","byx17","ysbztp17","ysbzsm17","ys18","byx18","ysbztp18","ysbzsm18","ys19","byx19","ysbztp19","ysbzsm19","ys20","byx20","ysbztp20","ysbzsm20","ys21","byx21","ysbztp21","ysbzsm21","ys22","byx22","ysbztp22","ysbzsm22","ys23","byx23","ysbztp23","ysbzsm23","ys24","byx24","ysbztp24","ysbzsm24","ys25","byx25","ysbztp25","ysbzsm25","ys26","byx26","ysbztp26","ysbzsm26","ys27","byx27","ysbztp27","ysbzsm27","ys28","byx28","ysbztp28","ysbzsm28","ys29","byx29","ysbztp29","ysbzsm29","ys30","byx30","ysbztp30","ysbzsm30","ys31","byx31","ysbztp31","ysbzsm31","ys32","byx32","ysbztp32","ysbzsm32","ys33","byx33","ysbztp33","ysbzsm33","ys34","byx34","ysbztp34","ysbzsm34","ys35","byx35","ysbztp35","ysbzsm35","ys36","byx36","ysbztp36","ysbzsm36","ys37","byx37","ysbztp37","ysbzsm37","ys38","byx38","ysbztp38","ysbzsm38","ys39","byx39","ysbztp39","ysbzsm39","ys40","byx40","ysbztp40","ysbzsm40","ys41","byx41","ysbztp41","ysbzsm41","ys42","byx42","ysbztp42","ysbzsm42","ys43","byx43","ysbztp43","ysbzsm43","ys44","byx44","ysbztp44","ysbzsm44","ys45","byx45","ysbztp45","ysbzsm45","ys46","byx46","ysbztp46","ysbzsm46","ys47","byx47","ysbztp47","ysbzsm47","ys48","byx48","ysbztp48","ysbzsm48","ys49","byx49","ysbztp49","ysbzsm49","ys50","byx50","ysbztp50","ysbzsm50"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gcysbbh","gcysxmbm"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(4000);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50px">验收版本号</td>
	<td  width="100px">验收版本名称</td>
	<td  width="50px">验收项目编码</td>
	<td  width="160px">验收项目名称</td>
	<td  width="50px">验收子项数量</td>
	<td  width="200px">验收子项1名称</td>
	<td  width="50px">必验项1</td>
	<td  width="70px">验收子项1说明图片</td>
	<td  width="200px">验收子项1说明文字</td>
	<td  width="200px">验收子项2名称</td>
	<td  width="50px">必验项2</td>
	<td  width="70px">验收子项2说明图片</td>
	<td  width="200px">验收子项2说明文字</td>
	<td  width="200px">验收子项3名称</td>
	<td  width="50px">必验项3</td>
	<td  width="70px">验收子项3说明图片</td>
	<td  width="200px">验收子项3说明文字</td>
	<td  width="200px">验收子项4名称</td>
	<td  width="50px">必验项4</td>
	<td  width="70px">验收子项4说明图片</td>
	<td  width="200px">验收子项4说明文字</td>
	<td  width="200px">验收子项5名称</td>
	<td  width="50px">必验项5</td>
	<td  width="70px">验收子项5说明图片</td>
	<td  width="200px">验收子项5说明文字</td>
	<td  width="200px">验收子项6名称</td>
	<td  width="50px">必验项6</td>
	<td  width="70px">验收子项6说明图片</td>
	<td  width="200px">验收子项6说明文字</td>
	<td  width="200px">验收子项7名称</td>
	<td  width="50px">必验项7</td>
	<td  width="70px">验收子项7说明图片</td>
	<td  width="200px">验收子项7说明文字</td>
	<td  width="200px">验收子项8名称</td>
	<td  width="50px">必验项8</td>
	<td  width="70px">验收子项8说明图片</td>
	<td  width="200px">验收子项8说明文字</td>
	<td  width="200px">验收子项9名称</td>
	<td  width="50px">必验项9</td>
	<td  width="70px">验收子项9说明图片</td>
	<td  width="200px">验收子项9说明文字</td>
	<td  width="200px">验收子项10名称</td>
	<td  width="50px">必验项10</td>
	<td  width="70px">验收子项10说明图片</td>
	<td  width="200px">验收子项10说明文字</td>
	<td  width="200px">验收子项11名称</td>
	<td  width="50px">必验项11</td>
	<td  width="70px">验收子项11说明图片</td>
	<td  width="200px">验收子项11说明文字</td>
	<td  width="200px">验收子项12名称</td>
	<td  width="50px">必验项12</td>
	<td  width="70px">验收子项12说明图片</td>
	<td  width="200px">验收子项12说明文字</td>
	<td  width="200px">验收子项13名称</td>
	<td  width="50px">必验项13</td>
	<td  width="70px">验收子项13说明图片</td>
	<td  width="200px">验收子项13说明文字</td>
	<td  width="200px">验收子项14名称</td>
	<td  width="50px">必验项14</td>
	<td  width="70px">验收子项14说明图片</td>
	<td  width="200px">验收子项14说明文字</td>
	<td  width="200px">验收子项15名称</td>
	<td  width="50px">必验项15</td>
	<td  width="70px">验收子项15说明图片</td>
	<td  width="200px">验收子项15说明文字</td>
	<td  width="200px">验收子项16名称</td>
	<td  width="50px">必验项16</td>
	<td  width="70px">验收子项16说明图片</td>
	<td  width="200px">验收子项16说明文字</td>
	<td  width="200px">验收子项17名称</td>
	<td  width="50px">必验项17</td>
	<td  width="70px">验收子项17说明图片</td>
	<td  width="200px">验收子项17说明文字</td>
	<td  width="200px">验收子项18名称</td>
	<td  width="50px">必验项18</td>
	<td  width="70px">验收子项18说明图片</td>
	<td  width="200px">验收子项18说明文字</td>
	<td  width="200px">验收子项19名称</td>
	<td  width="50px">必验项19</td>
	<td  width="70px">验收子项19说明图片</td>
	<td  width="200px">验收子项19说明文字</td>
	<td  width="200px">验收子项20名称</td>
	<td  width="50px">必验项20</td>
	<td  width="70px">验收子项20说明图片</td>
	<td  width="200px">验收子项20说明文字</td>
	<td  width="200px">验收子项21名称</td>
	<td  width="50px">必验项21</td>
	<td  width="70px">验收子项21说明图片</td>
	<td  width="200px">验收子项21说明文字</td>
	<td  width="200px">验收子项22名称</td>
	<td  width="50px">必验项22</td>
	<td  width="70px">验收子项22说明图片</td>
	<td  width="200px">验收子项22说明文字</td>
	<td  width="200px">验收子项23名称</td>
	<td  width="50px">必验项23</td>
	<td  width="70px">验收子项23说明图片</td>
	<td  width="200px">验收子项23说明文字</td>
	<td  width="200px">验收子项24名称</td>
	<td  width="50px">必验项24</td>
	<td  width="70px">验收子项24说明图片</td>
	<td  width="200px">验收子项24说明文字</td>
	<td  width="200px">验收子项25名称</td>
	<td  width="50px">必验项25</td>
	<td  width="70px">验收子项25说明图片</td>
	<td  width="200px">验收子项25说明文字</td>
	<td  width="200px">验收子项26名称</td>
	<td  width="50px">必验项26</td>
	<td  width="70px">验收子项26说明图片</td>
	<td  width="200px">验收子项26说明文字</td>
	<td  width="200px">验收子项27名称</td>
	<td  width="50px">必验项27</td>
	<td  width="70px">验收子项27说明图片</td>
	<td  width="200px">验收子项27说明文字</td>
	<td  width="200px">验收子项28名称</td>
	<td  width="50px">必验项28</td>
	<td  width="70px">验收子项28说明图片</td>
	<td  width="200px">验收子项28说明文字</td>
	<td  width="200px">验收子项29名称</td>
	<td  width="50px">必验项29</td>
	<td  width="70px">验收子项29说明图片</td>
	<td  width="200px">验收子项29说明文字</td>
	<td  width="200px">验收子项30名称</td>
	<td  width="50px">必验项30</td>
	<td  width="70px">验收子项30说明图片</td>
	<td  width="200px">验收子项30说明文字</td>
	<td  width="200px">验收子项31名称</td>
	<td  width="50px">必验项31</td>
	<td  width="70px">验收子项31说明图片</td>
	<td  width="200px">验收子项31说明文字</td>
	<td  width="200px">验收子项32名称</td>
	<td  width="50px">必验项32</td>
	<td  width="70px">验收子项32说明图片</td>
	<td  width="200px">验收子项32说明文字</td>
	<td  width="200px">验收子项33名称</td>
	<td  width="50px">必验项33</td>
	<td  width="70px">验收子项33说明图片</td>
	<td  width="200px">验收子项33说明文字</td>
	<td  width="200px">验收子项34名称</td>
	<td  width="50px">必验项34</td>
	<td  width="70px">验收子项34说明图片</td>
	<td  width="200px">验收子项34说明文字</td>
	<td  width="200px">验收子项35名称</td>
	<td  width="50px">必验项35</td>
	<td  width="70px">验收子项35说明图片</td>
	<td  width="200px">验收子项35说明文字</td>
	<td  width="200px">验收子项36名称</td>
	<td  width="50px">必验项36</td>
	<td  width="70px">验收子项36说明图片</td>
	<td  width="200px">验收子项36说明文字</td>
	<td  width="200px">验收子项37名称</td>
	<td  width="50px">必验项37</td>
	<td  width="70px">验收子项37说明图片</td>
	<td  width="200px">验收子项37说明文字</td>
	<td  width="200px">验收子项38名称</td>
	<td  width="50px">必验项38</td>
	<td  width="70px">验收子项38说明图片</td>
	<td  width="200px">验收子项38说明文字</td>
	<td  width="200px">验收子项39名称</td>
	<td  width="50px">必验项39</td>
	<td  width="70px">验收子项39说明图片</td>
	<td  width="200px">验收子项39说明文字</td>
	<td  width="200px">验收子项40名称</td>
	<td  width="50px">必验项40</td>
	<td  width="70px">验收子项40说明图片</td>
	<td  width="200px">验收子项40说明文字</td>
	<td  width="200px">验收子项41名称</td>
	<td  width="50px">必验项41</td>
	<td  width="70px">验收子项41说明图片</td>
	<td  width="200px">验收子项41说明文字</td>
	<td  width="200px">验收子项42名称</td>
	<td  width="50px">必验项42</td>
	<td  width="70px">验收子项42说明图片</td>
	<td  width="200px">验收子项42说明文字</td>
	<td  width="200px">验收子项43名称</td>
	<td  width="50px">必验项43</td>
	<td  width="70px">验收子项43说明图片</td>
	<td  width="200px">验收子项43说明文字</td>
	<td  width="200px">验收子项44名称</td>
	<td  width="50px">必验项44</td>
	<td  width="70px">验收子项44说明图片</td>
	<td  width="200px">验收子项44说明文字</td>
	<td  width="200px">验收子项45名称</td>
	<td  width="50px">必验项45</td>
	<td  width="70px">验收子项45说明图片</td>
	<td  width="200px">验收子项45说明文字</td>
	<td  width="200px">验收子项46名称</td>
	<td  width="50px">必验项46</td>
	<td  width="70px">验收子项46说明图片</td>
	<td  width="200px">验收子项46说明文字</td>
	<td  width="200px">验收子项47名称</td>
	<td  width="50px">必验项47</td>
	<td  width="70px">验收子项47说明图片</td>
	<td  width="200px">验收子项47说明文字</td>
	<td  width="200px">验收子项48名称</td>
	<td  width="50px">必验项48</td>
	<td  width="70px">验收子项48说明图片</td>
	<td  width="200px">验收子项48说明文字</td>
	<td  width="200px">验收子项49名称</td>
	<td  width="50px">必验项49</td>
	<td  width="70px">验收子项49说明图片</td>
	<td  width="200px">验收子项49说明文字</td>
	<td  width="200px">验收子项50名称</td>
	<td  width="50px">必验项50</td>
	<td  width="70px">验收子项50说明图片</td>
	<td  width="200px">验收子项50说明文字</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>