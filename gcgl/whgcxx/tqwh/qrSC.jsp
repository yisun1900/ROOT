<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckjgbz=(String)session.getAttribute("ckjgbz");

String crm_khxx_khxm=null;
String crm_khxx_xb=null;
String crm_khxx_cqbm=null;
String crm_khxx_xqbm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sfzhm=null;
String crm_khxx_nlqjbm=null;
String crm_khxx_zybm=null;
String crm_khxx_fj=null;
String crm_khxx_hxbm=null;
String crm_khxx_czbm=null;
String crm_khxx_fgflbm=null;
String crm_khxx_zxjwbm=null;
String crm_khxx_ysbm=null;
String crm_khxx_hxmjbm=null;
String crm_khxx_fwmj=null;
String crm_khxx_pmjj=null;
String crm_khxx_sjs=null;
double qye=0;
String crm_khxx_sfyyh=null;
String crm_khxx_yhyy=null;
String crm_khxx_zkl=null;
String crm_khxx_sffj=null;
String crm_khxx_sfyrz=null;
String crm_khxx_qyrq=null;
String crm_khxx_kgrq=null;
String crm_khxx_sjkgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sjjgrq=null;
String crm_khxx_jhtrq=null;
String crm_khxx_bxjzsj=null;
String crm_khxx_gcjdbm=null;
String dwbh=null;
String crm_khxx_pdclzt=null;
String crm_khxx_pdsj=null;
String crm_khxx_pdr=null;
String crm_khxx_sgd=null;
String crm_khxx_sgbz=null;
String crm_khxx_pdsm=null;
String crm_khxx_zjxm=null;
String crm_khxx_sfxhf=null;
String crm_khxx_hfrq=null;
String crm_khxx_hflxbm=null;
String crm_khxx_ybjbz=null;
String crm_khxx_ybjyxq=null;
String crm_khxx_ybjdjsj=null;
String crm_khxx_hdbz=null;
String crm_khxx_cgdz=null;
String crm_khxx_hdr=null;
String crm_khxx_zt=null;
String crm_khxx_khlxbm=null;
String crm_khxx_tsbz=null;
String crm_khxx_tsjlh=null;
String crm_khxx_bxbz=null;
String crm_khxx_bxjlh=null;
String crm_khxx_tdxh=null;
String crm_khxx_lrr=null;
String crm_khxx_lrsj=null;
String crm_khxx_ybjbh=null;
String crm_khxx_ybjss=null;
String crm_khxx_hdsfss=null;
String crm_khxx_kpbz=null;
String crm_khxx_jlbz=null;
String crm_khxx_djbh=null;
String crm_khxx_hfdjbz=null;
String crm_khxx_djyy=null;
String crm_khxx_djsj=null;
String crm_khxx_djr=null;
String crm_khxx_jhjdsj=null;
String crm_khxx_sjjdsj=null;
String crm_khxx_jdr=null;
String crm_khxx_bz=null;
String crm_khxx_yqbm=null;
String crm_khxx_jyjdrq=null;
String crm_khxx_sybgcrq=null;
String crm_khxx_gdjsjd=null;
String crm_khxx_htshbz=null;
String crm_khxx_htshr=null;
String crm_khxx_htshsj=null;
String crm_khxx_htshdf=null;
String crm_khxx_htshyj=null;
String fgsbh=null;

String yqsm=null;
String dalqbz=null;
String kbxbz=null;
String bxkssj=null;
String bybxsm=null;

String szqsj=null;

String fjje=null;
String gsfje=null;
String fjhgs=null;
String cxhdbm=null;

double suijin=0;
double suijinbfb=0;
double zjxsuijin=0;
double wdzgce=0;
double sjf=0;
double glf=0;
double guanlif=0;
String bjjb=null;
String ywy=null;

String ykhlxsj=null;
String jslxfs=null;
String lxsm=null;
String kgzsm=null;

String tgbz=null;
String tgyybm=null;
String tgsm=null;
String tgkssj=null;
String gjfgsj=null;
String tgjzsj=null;
String sfcjq=null;
String sffby=null;
String sjwjrq=null;

String jzkfkcs=null;
String jzkfkxh=null;
String jzkfksj=null;
double sfke=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;
String zjxxh=null;
String zjxsj=null;

String gckk=null;
String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckkspbz=null;
String zjxwcbz=null;
String sjfkzc=null;
String rzsc=null;
String tdsj=null;

String hth=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String ssfgs=null;
String sjsdh="";
String bzdh="";
String zjdh="";

int mmdd=0;
int cgdd=0;
int jjdd=0;
int zcdd=0;

String kgzbz=null;
double clf=0;
double sge=0;
String kgzsj=null;
String kgzr=null;
String jzbz=null;
String sjsbh=null;
String ybysxmbm=null;
String zqysxmbm=null;

String hykh=null;
String hyklxbm=null;
String yxsjs=null;
String yxsjz=null;
String xmzy=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String nlqjbm=null;
String wtkhbz=null;
String wtkhsm=null;
String wtkhlrr=null;
String wtkhlrsj=null;

String gcsfyq=null;
String yqts=null;
String yqlrr=null;
String yqlrsj=null;
double khjsje=0;
String sffk=null;
String djkh=null;
String fkrq=null;
String louhao=null;
String sfysbx=null;
String baokssj=null;
String baozzsj=null;
String hzts=null;
String jzkscsj=null;

String sjsjsbz=null;
String khjsbz=null;
String ywyjsbz=null;
String gdjsjlh=null;
String ywyjsjlh=null;
String sjsjsjlh=null;
String wgjsjlh=null;

double cwsfke=0;
String cwjzkfkcs=null;
String cwjzkscsj=null;
String cwjzkfkxh=null;
String cwjzkfksj=null;

double sjstcbl=0;
double qdsyjsje=0;
double sjswgtcbl=0;
double wgtcje=0;

String zjjsbz=null;
String zjjsjlh=null;
double zjjsbl=0;
double zjjsje=0;
double ywyqdjsbl=0;
double ywyqdjsje=0;
String ywywgjsjlh=null;
double ywywgjsbl=0;
double ywywgjsje=0;

try {
	conn=cf.getConnection();

	ls_sql="select tdsj,zjjsbz,zjjsjlh,zjjsbl,zjjsje,ywyqdjsbl,ywyqdjsje,ywywgjsjlh,ywywgjsbl,ywywgjsje,wgtcje,sjstcbl,qdsyjsje,sjswgtcbl,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfkxh,cwjzkfksj,guanlif,gdjsjlh,ywyjsjlh,sjsjsjlh,wgjsjlh,sjsjsbz,khjsbz,ywyjsbz,crm_khxx.khbh,crm_khxx.hth,suijinbfb,zjxsuijin,jzkscsj,hzts,suijin,khbh,zhzjxje,sfysbx,baokssj,baozzsj,rzsc,fgsbh,kqtk,kglf,louhao,sjfkzc,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,gckkspbz,sffk,djkh,fkrq,fgsbh,khjsje,gcsfyq,yqts,yqlrr,yqlrsj,wtkhbz,wtkhsm,wtkhlrr,wtkhlrsj,nlqjbm,ysrbm,rddqbm,hxwzbm,xmzy,zjxwcbz,zjxsj,zjxje,zjxxh,sjwjrq,zqysxmbm,ybysxmbm,hykh,hyklxbm,yxsjs,yxsjz,sjsbh,sfcjq,sffby,jzbz,NVL(tgbz,'W') tgbz,tgyybm,tgsm,tgkssj,gjfgsj,tgjzsj,kgzsm,jzkfkcs,jzkfkxh,jzkfksj,sfke,kgzbz,clf,sge,kgzsj,kgzr,ykhlxsj,jslxfs,lxsm,wdzgce,ywy,bjjb,glf,sjf,fjje,gsfje,fjhgs,cxhdbm,szqsj,bybxsm,yqsm,dalqbz,kbxbz,bxkssj,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.xb as crm_khxx_xb,crm_khxx.cqbm as crm_khxx_cqbm,crm_khxx.xqbm as crm_khxx_xqbm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sfzhm as crm_khxx_sfzhm,crm_khxx.nlqjbm as crm_khxx_nlqjbm,crm_khxx.zybm as crm_khxx_zybm,crm_khxx.fj as crm_khxx_fj,crm_khxx.hxbm as crm_khxx_hxbm,crm_khxx.czbm as crm_khxx_czbm,crm_khxx.fgflbm as crm_khxx_fgflbm,crm_khxx.zxjwbm as crm_khxx_zxjwbm,crm_khxx.ysbm as crm_khxx_ysbm,crm_khxx.hxmjbm as crm_khxx_hxmjbm,crm_khxx.fwmj as crm_khxx_fwmj,crm_khxx.pmjj as crm_khxx_pmjj,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye as qye,crm_khxx.sfyyh as crm_khxx_sfyyh,crm_khxx.yhyy as crm_khxx_yhyy,crm_khxx.zkl as crm_khxx_zkl,crm_khxx.sffj as crm_khxx_sffj,crm_khxx.sfyrz as crm_khxx_sfyrz,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.sjkgrq as crm_khxx_sjkgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sjjgrq as crm_khxx_sjjgrq,crm_khxx.jhtrq as crm_khxx_jhtrq,crm_khxx.bxjzsj as crm_khxx_bxjzsj,crm_khxx.gcjdbm as crm_khxx_gcjdbm,crm_khxx.dwbh as dwbh,crm_khxx.pdclzt as crm_khxx_pdclzt,crm_khxx.pdsj as crm_khxx_pdsj,crm_khxx.pdr as crm_khxx_pdr,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.sgbz as crm_khxx_sgbz,crm_khxx.pdsm as crm_khxx_pdsm,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.sfxhf as crm_khxx_sfxhf,crm_khxx.hfrq as crm_khxx_hfrq,crm_khxx.hflxbm as crm_khxx_hflxbm,crm_khxx.ybjbz as crm_khxx_ybjbz,crm_khxx.ybjyxq as crm_khxx_ybjyxq,crm_khxx.ybjdjsj as crm_khxx_ybjdjsj,crm_khxx.hdbz as crm_khxx_hdbz,crm_khxx.cgdz as crm_khxx_cgdz,crm_khxx.hdr as crm_khxx_hdr,crm_khxx.zt as crm_khxx_zt,crm_khxx.khlxbm as crm_khxx_khlxbm,crm_khxx.tsbz as crm_khxx_tsbz,crm_khxx.tsjlh as crm_khxx_tsjlh,crm_khxx.bxbz as crm_khxx_bxbz,crm_khxx.bxjlh as crm_khxx_bxjlh,crm_khxx.tdxh as crm_khxx_tdxh,crm_khxx.lrr as crm_khxx_lrr,crm_khxx.lrsj as crm_khxx_lrsj,crm_khxx.ybjbh as crm_khxx_ybjbh,crm_khxx.ybjss as crm_khxx_ybjss,crm_khxx.hdsfss as crm_khxx_hdsfss,crm_khxx.kpbz as crm_khxx_kpbz,crm_khxx.jlbz as crm_khxx_jlbz,crm_khxx.djbh as crm_khxx_djbh,crm_khxx.hfdjbz as crm_khxx_hfdjbz,crm_khxx.djyy as crm_khxx_djyy,crm_khxx.djsj as crm_khxx_djsj,crm_khxx.djr as crm_khxx_djr,crm_khxx.jhjdsj as crm_khxx_jhjdsj,crm_khxx.sjjdsj as crm_khxx_sjjdsj,crm_khxx.jdr as crm_khxx_jdr,crm_khxx.bz as crm_khxx_bz,crm_khxx.yqbm as crm_khxx_yqbm,crm_khxx.jyjdrq as crm_khxx_jyjdrq,crm_khxx.sybgcrq as crm_khxx_sybgcrq,crm_khxx.gdjsjd as crm_khxx_gdjsjd,crm_khxx.htshbz as crm_khxx_htshbz,crm_khxx.htshr as crm_khxx_htshr,crm_khxx.htshsj as crm_khxx_htshsj,crm_khxx.htshdf as crm_khxx_htshdf,crm_khxx.htshyj as crm_khxx_htshyj ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		zjjsbz=cf.fillNull(rs.getString("zjjsbz"));
		zjjsjlh=cf.fillNull(rs.getString("zjjsjlh"));
		zjjsbl=rs.getDouble("zjjsbl");
		zjjsje=rs.getDouble("zjjsje");
		ywyqdjsbl=rs.getDouble("ywyqdjsbl");
		ywyqdjsje=rs.getDouble("ywyqdjsje");
		ywywgjsjlh=cf.fillNull(rs.getString("ywywgjsjlh"));
		ywywgjsbl=rs.getDouble("ywywgjsbl");
		ywywgjsje=rs.getDouble("ywywgjsje");
		
		
		wgtcje=rs.getDouble("wgtcje");
		sjstcbl=rs.getDouble("sjstcbl");
		qdsyjsje=rs.getDouble("qdsyjsje");
		sjswgtcbl=rs.getDouble("sjswgtcbl");

		cwsfke=rs.getDouble("cwsfke");
		cwjzkfkcs=cf.fillNull(rs.getString("cwjzkfkcs"));
		cwjzkscsj=cf.fillNull(rs.getDate("cwjzkscsj"));
		cwjzkfkxh=cf.fillNull(rs.getString("cwjzkfkxh"));
		cwjzkfksj=cf.fillNull(rs.getDate("cwjzkfksj"));


		guanlif=rs.getDouble("guanlif");
		gdjsjlh=cf.fillNull(rs.getString("gdjsjlh"));
		ywyjsjlh=cf.fillNull(rs.getString("ywyjsjlh"));
		sjsjsjlh=cf.fillNull(rs.getString("sjsjsjlh"));
		wgjsjlh=cf.fillNull(rs.getString("wgjsjlh"));
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		khjsbz=cf.fillNull(rs.getString("khjsbz"));
		ywyjsbz=cf.fillNull(rs.getString("ywyjsbz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));

		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		jzkscsj=cf.fillNull(rs.getDate("jzkscsj"));
		hzts=cf.fillNull(rs.getString("hzts"));
		suijin=rs.getDouble("suijin");
		khbh=cf.fillNull(rs.getString("khbh"));
		zhzjxje=rs.getDouble("zhzjxje");
		rzsc=cf.fillNull(rs.getString("rzsc"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		kqtk=rs.getDouble("kqtk");
		kglf=rs.getDouble("kglf");
		louhao=cf.fillNull(rs.getString("louhao"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		gckk=cf.fillNull(rs.getString("gckk"));
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));

		sffk=cf.fillNull(rs.getString("sffk"));
		djkh=cf.fillNull(rs.getString("djkh"));
		fkrq=cf.fillNull(rs.getDate("fkrq"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khjsje=rs.getDouble("khjsje");
		gcsfyq=cf.fillNull(rs.getString("gcsfyq"));
		yqts=cf.fillNull(rs.getString("yqts"));
		yqlrr=cf.fillNull(rs.getString("yqlrr"));
		yqlrsj=cf.fillNull(rs.getDate("yqlrsj"));
		wtkhbz=cf.fillNull(rs.getString("wtkhbz"));
		wtkhsm=cf.fillNull(rs.getString("wtkhsm"));
		wtkhlrr=cf.fillNull(rs.getString("wtkhlrr"));
		wtkhlrsj=cf.fillNull(rs.getDate("wtkhlrsj"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zjxsj=cf.fillNull(rs.getDate("zjxsj"));
		zjxje=rs.getDouble("zjxje");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		hykh=cf.fillNull(rs.getString("hykh"));
		hyklxbm=cf.fillNull(rs.getString("hyklxbm"));
		yxsjs=cf.fillNull(rs.getDate("yxsjs"));
		yxsjz=cf.fillNull(rs.getDate("yxsjz"));

		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sfcjq=cf.fillNull(rs.getString("sfcjq"));
		sffby=cf.fillNull(rs.getString("sffby"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		tgbz=cf.fillNull(rs.getString("tgbz"));
		tgyybm=cf.fillNull(rs.getString("tgyybm"));
		tgsm=cf.fillNull(rs.getString("tgsm"));
		tgkssj=cf.fillNull(rs.getDate("tgkssj"));
		gjfgsj=cf.fillNull(rs.getDate("gjfgsj"));
		tgjzsj=cf.fillNull(rs.getDate("tgjzsj"));
		kgzsm=cf.fillNull(rs.getString("kgzsm"));
		jzkfkcs=cf.fillNull(rs.getString("jzkfkcs"));
		jzkfkxh=cf.fillNull(rs.getString("jzkfkxh"));
		jzkfksj=cf.fillNull(rs.getDate("jzkfksj"));
		sfke=rs.getDouble("sfke");

		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		clf=rs.getDouble("clf");
		sge=rs.getDouble("sge");
		kgzsj=cf.fillNull(rs.getDate("kgzsj"));
		kgzr=cf.fillNull(rs.getString("kgzr"));

		ykhlxsj=cf.fillNull(rs.getDate("ykhlxsj"));
		jslxfs=cf.fillNull(rs.getString("jslxfs"));
		lxsm=cf.fillNull(rs.getString("lxsm"));

		wdzgce=rs.getDouble("wdzgce");
		glf=rs.getDouble("glf");
		sjf=rs.getDouble("sjf");
		ywy=cf.fillNull(rs.getString("ywy"));
		bjjb=cf.fillNull(rs.getString("bjjb"));

		fjje=cf.fillNull(rs.getString("fjje"));
		gsfje=cf.fillNull(rs.getString("gsfje"));
		fjhgs=cf.fillNull(rs.getString("fjhgs"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		szqsj=cf.fillNull(rs.getDate("szqsj"));

		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		yqsm=cf.fillNull(rs.getString("yqsm"));
		dalqbz=cf.fillNull(rs.getString("dalqbz"));
		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));

		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_xb=cf.fillNull(rs.getString("crm_khxx_xb"));
		crm_khxx_cqbm=cf.fillNull(rs.getString("crm_khxx_cqbm"));
		crm_khxx_xqbm=cf.fillNull(rs.getString("crm_khxx_xqbm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_sfzhm=cf.fillNull(rs.getString("crm_khxx_sfzhm"));
		crm_khxx_nlqjbm=cf.fillNull(rs.getString("crm_khxx_nlqjbm"));
		crm_khxx_zybm=cf.fillNull(rs.getString("crm_khxx_zybm"));
		crm_khxx_fj=cf.fillNull(rs.getString("crm_khxx_fj"));
		crm_khxx_hxbm=cf.fillNull(rs.getString("crm_khxx_hxbm"));
		crm_khxx_czbm=cf.fillNull(rs.getString("crm_khxx_czbm"));
		crm_khxx_fgflbm=cf.fillNull(rs.getString("crm_khxx_fgflbm"));
		crm_khxx_zxjwbm=cf.fillNull(rs.getString("crm_khxx_zxjwbm"));
		crm_khxx_ysbm=cf.fillNull(rs.getString("crm_khxx_ysbm"));
		crm_khxx_hxmjbm=cf.fillNull(rs.getString("crm_khxx_hxmjbm"));
		crm_khxx_fwmj=cf.fillNull(rs.getString("crm_khxx_fwmj"));
		crm_khxx_pmjj=cf.fillNull(rs.getString("crm_khxx_pmjj"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		qye=rs.getDouble("qye");
		crm_khxx_sfyyh=cf.fillNull(rs.getString("crm_khxx_sfyyh"));
		crm_khxx_yhyy=cf.fillNull(rs.getString("crm_khxx_yhyy"));
		crm_khxx_zkl=cf.fillNull(rs.getString("crm_khxx_zkl"));
		crm_khxx_sffj=cf.fillNull(rs.getString("crm_khxx_sffj"));
		crm_khxx_sfyrz=cf.fillNull(rs.getString("crm_khxx_sfyrz"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_sjkgrq=cf.fillNull(rs.getDate("crm_khxx_sjkgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sjjgrq=cf.fillNull(rs.getDate("crm_khxx_sjjgrq"));
		crm_khxx_jhtrq=cf.fillNull(rs.getDate("crm_khxx_jhtrq"));
		crm_khxx_bxjzsj=cf.fillNull(rs.getDate("crm_khxx_bxjzsj"));
		crm_khxx_gcjdbm=cf.fillNull(rs.getString("crm_khxx_gcjdbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		crm_khxx_pdclzt=cf.fillNull(rs.getString("crm_khxx_pdclzt"));
		crm_khxx_pdsj=cf.fillNull(rs.getDate("crm_khxx_pdsj"));
		crm_khxx_pdr=cf.fillNull(rs.getString("crm_khxx_pdr"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_sgbz=cf.fillNull(rs.getString("crm_khxx_sgbz"));
		crm_khxx_pdsm=cf.fillNull(rs.getString("crm_khxx_pdsm"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_sfxhf=cf.fillNull(rs.getString("crm_khxx_sfxhf"));
		crm_khxx_hfrq=cf.fillNull(rs.getDate("crm_khxx_hfrq"));
		crm_khxx_hflxbm=cf.fillNull(rs.getString("crm_khxx_hflxbm"));
		crm_khxx_ybjbz=cf.fillNull(rs.getString("crm_khxx_ybjbz"));
		crm_khxx_ybjyxq=cf.fillNull(rs.getDate("crm_khxx_ybjyxq"));
		crm_khxx_ybjdjsj=cf.fillNull(rs.getDate("crm_khxx_ybjdjsj"));
		crm_khxx_hdbz=cf.fillNull(rs.getString("crm_khxx_hdbz"));
		crm_khxx_cgdz=cf.fillNull(rs.getString("crm_khxx_cgdz"));
		crm_khxx_hdr=cf.fillNull(rs.getString("crm_khxx_hdr"));
		crm_khxx_zt=cf.fillNull(rs.getString("crm_khxx_zt"));
		crm_khxx_khlxbm=cf.fillNull(rs.getString("crm_khxx_khlxbm"));
		crm_khxx_tsbz=cf.fillNull(rs.getString("crm_khxx_tsbz"));
		crm_khxx_tsjlh=cf.fillNull(rs.getString("crm_khxx_tsjlh"));
		crm_khxx_bxbz=cf.fillNull(rs.getString("crm_khxx_bxbz"));
		crm_khxx_bxjlh=cf.fillNull(rs.getString("crm_khxx_bxjlh"));
		crm_khxx_tdxh=cf.fillNull(rs.getString("crm_khxx_tdxh"));
		crm_khxx_lrr=cf.fillNull(rs.getString("crm_khxx_lrr"));
		crm_khxx_lrsj=cf.fillNull(rs.getString("crm_khxx_lrsj"));
		crm_khxx_ybjbh=cf.fillNull(rs.getString("crm_khxx_ybjbh"));
		crm_khxx_ybjss=cf.fillNull(rs.getString("crm_khxx_ybjss"));
		crm_khxx_hdsfss=cf.fillNull(rs.getString("crm_khxx_hdsfss"));
		crm_khxx_kpbz=cf.fillNull(rs.getString("crm_khxx_kpbz"));
		crm_khxx_jlbz=cf.fillNull(rs.getString("crm_khxx_jlbz"));
		crm_khxx_djbh=cf.fillNull(rs.getString("crm_khxx_djbh"));
		crm_khxx_hfdjbz=cf.fillNull(rs.getString("crm_khxx_hfdjbz"));
		crm_khxx_djyy=cf.fillNull(rs.getString("crm_khxx_djyy"));
		crm_khxx_djsj=cf.fillNull(rs.getDate("crm_khxx_djsj"));
		crm_khxx_djr=cf.fillNull(rs.getString("crm_khxx_djr"));
		crm_khxx_jhjdsj=cf.fillNull(rs.getDate("crm_khxx_jhjdsj"));
		crm_khxx_sjjdsj=cf.fillNull(rs.getDate("crm_khxx_sjjdsj"));
		crm_khxx_jdr=cf.fillNull(rs.getString("crm_khxx_jdr"));
		crm_khxx_bz=cf.fillNull(rs.getString("crm_khxx_bz"));
		crm_khxx_yqbm=cf.fillNull(rs.getString("crm_khxx_yqbm"));
		crm_khxx_jyjdrq=cf.fillNull(rs.getDate("crm_khxx_jyjdrq"));
		crm_khxx_sybgcrq=cf.fillNull(rs.getDate("crm_khxx_sybgcrq"));
		crm_khxx_gdjsjd=cf.fillNull(rs.getString("crm_khxx_gdjsjd"));
		crm_khxx_htshbz=cf.fillNull(rs.getString("crm_khxx_htshbz"));
		crm_khxx_htshr=cf.fillNull(rs.getString("crm_khxx_htshr"));
		crm_khxx_htshsj=cf.fillNull(rs.getDate("crm_khxx_htshsj"));
		crm_khxx_htshdf=cf.fillNull(rs.getString("crm_khxx_htshdf"));
		crm_khxx_htshyj=cf.fillNull(rs.getString("crm_khxx_htshyj"));
		sfysbx=cf.fillNull(rs.getString("sfysbx"));
		baokssj=cf.fillNull(rs.getDate("baokssj"));
		baozzsj=cf.fillNull(rs.getDate("baozzsj"));
	}
	else{
		rs.close();
		ps.close();

		out.println("�޴˿ͻ���¼");
		return;
	}
	rs.close();
	ps.close();


	if (crm_khxx_zt.equals("2"))//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
	{
		if (jzbz.equals("2"))//1����װ��2����װ
		{
			crm_khxx_zt="��װ�ͻ�";
		}
		else {
			crm_khxx_zt="��װ�ͻ�";
		}
	}
	else if (crm_khxx_zt.equals("3"))//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
	{
		crm_khxx_zt="�˵��ͻ�";
	}
	else if (crm_khxx_zt.equals("4"))//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
	{
		crm_khxx_zt="���ɿͻ�";
	}
	else if (crm_khxx_zt.equals("5"))//2����װ�ͻ���3���˵��ͻ���4���Ǽ�װ�ͻ���5����ƿͻ�
	{
		crm_khxx_zt="��ƿͻ�";
	}


	if (ckjgbz.equals("N"))
	{
		wdzgce=0;
		qye=0;
		crm_khxx_pmjj="0";
		sfke=0;
		zjxje=0;
		zhzjxje=0;
	}

	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"' and bzmc  ='"+crm_khxx_sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//���̵����绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+crm_khxx_zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmdd=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgdd=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjdd=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcdd=rs.getInt(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>��ʼɾ���ͻ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">
  <input type="button" value="��ʼɾ���ͻ�" onClick="f_do()">
  <font color="#FF0000"><b>��������ע�⣺ɾ���󲻿ɻָ� </b></font> 
  <P>
  <BR>
  <BR>
  <input type="button" <%if (mmdd==0) out.print("disabled");%> value="ľ��" onClick="window.open('Jc_mmyddCxList.jsp?khbh=<%=khbh%>')">
  <input type="button" <%if (cgdd==0) out.print("disabled");%> value="����" onClick="window.open('Jc_cgddCxList.jsp?khbh=<%=khbh%>')">
  <input type="button" <%if (jjdd==0) out.print("disabled");%> value="�Ҿ�" onClick="window.open('Jc_jjddCxList.jsp?khbh=<%=khbh%>')">
  <input type="button" <%if (zcdd==0) out.print("disabled");%> value="����" onClick="window.open('Jc_zcddCxList.jsp?khbh=<%=khbh%>')">
  <input type="button" <%if (zcdd==0 && mmdd==0 && cgdd==0 && jjdd==0) out.print("disabled");%> value="��Ἧ����ϸ" onClick="window.open('Jc_zcddMxWjCxList.jsp?khbh=<%=khbh%>')" name="button10">
  <input type="button" <%if (zcdd==0 && mmdd==0 && cgdd==0 && jjdd==0) out.print("disabled");%> value="δ��Ἧ����ϸ" onClick="window.open('Jc_zcddMxWwjCxList.jsp?khbh=<%=khbh%>')" name="button11">
  <input type="button" value="�ɵ�" onClick="window.open('ViewPdxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="���̻طü�¼" onClick="window.open('ViewGchfxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="Ͷ�߱���" onClick="window.open('ViewTsbxxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="�˵�" onClick="window.open('ViewTdxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="��ȡ��Ʒ" onClick="window.open('/dhzx/dhzx/ViewYx_lqlpdj.jsp?khbh=<%=khbh%>')">
<%
	if (ckjgbz.equals("Y"))
	{
	%>
  <BR>
  <input type="button" value="��ͬ����" onClick="window.open('ViewHtbj.jsp?khbh=<%=khbh%>')">
  <input type="button" value="���±���" onClick="window.open('ViewZxbj.jsp?khbh=<%=khbh%>')">
  <input type="button" value="������" onClick="window.open('ViewZjxxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="���Ϸ���" onClick="window.open('ViewGlfx.jsp?khbh=<%=khbh%>')" disabled>
  <input type="button" value="����ͳ��" onClick="window.open('ViewYltj.jsp?khbh=<%=khbh%>')" disabled>
  <input type="button" value="������Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')">
	<%
	}
%>
</div>
<HR>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
  <tr> 
    <td width="32%" align="left" > <b>�ͻ����</b>��<%=khbh%></td>
    <td  align="left"  width="28%"><b>��ͬ��</b>��<%=hth%></td>
    <td colspan="2"> <b>�ͻ�����</b>��<%=crm_khxx_khxm%>��
      <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" >
      ��(<%
	cf.radioToken(out, "M+��&W+Ů",crm_khxx_xb,true);
%>) </td>
  </tr>
  <tr> 
    <td width="32%"><b>ʩ �� ��</b>��<%
	cf.selectItem(out,"select sgd,sgdmc||'��'||dh||'��' from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
    <td width="28%" ><b>�� &nbsp;��</b>��<%=crm_khxx_sgbz%>��<%=bzdh%>��</td>
    <td colspan="2"><b>���ݵ�ַ</b>��<%=crm_khxx_fwdz%> </td>
  </tr>
  <tr> 
    <td width="32%"> <b>�� �� ʦ</b>��<%=crm_khxx_sjs%>��<%=sjsdh%>��</td>
    <td width="28%"><b>�� &nbsp;��</b>��<%=crm_khxx_zjxm%>��<%=zjdh%>��</td>
    <td colspan="2"><b>ǩԼ����</b>��<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
	%>��<%cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%>��<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
	%> </td>
  </tr>
  <tr> 
    <td width="32%"><b>�ͻ�����</b>��<%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",crm_khxx_khlxbm,true);
%>&lt;<%=crm_khxx_zt%>&gt;</td>
    <td width="28%"><b>ҵ��Ա</b>��<%=ywy%></td>
    <td width="24%"><b>���֤����</b>��<%=crm_khxx_sfzhm%></td>
    <td width="16%"><b>���ۼ���</b>��<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%></td>
  </tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="1">
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>���̽���</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td align="center" width="3%">&nbsp;</td>
          <td colspan="2" align="center" bgcolor="#E8E8FF">��ͬ��� </td>
          <td width="4%" align="center">&nbsp; </td>
          <td align="center" bgcolor="#E8E8FF" colspan="2">ʵ����� </td>
          <td width="3%" align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td width="3%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"> <b>ǩ Լ &nbsp;�� ��</b>��<%=crm_khxx_qyrq%> 
          </td>
          <td width="4%" align="right">&nbsp;</td>
          <td bgcolor="#CCFFCC" colspan="2"><b>���̽���</b>��<%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_khxx_gcjdbm,true);
%>(<%
	cf.selectToken(out,"W+δͣ��&Y+��ͣ��&N+ͣ���󸴹�",tgbz,true);
%>)</td>
          <td width="3%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="3%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"> <b>���齻������</b>��<%=crm_khxx_jyjdrq%></td>
          <td width="4%">&nbsp;</td>
          <td width="24%" bgcolor="#CCFFCC"> <b>���ʱ��</b>��<%=sjwjrq%></td>
          <td width="21%" bgcolor="#CCFFCC"><b>�˵�ʱ��</b>��<%=tdsj%></td>
          <td width="3%">&nbsp; </td>
        </tr>
        <tr> 
          <td width="3%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>�� ͬ&nbsp; �� ��</b>��<%=crm_khxx_kgrq%> 
            �� <%=crm_khxx_jgrq%></td>
          <td width="4%" align="right">&nbsp;</td>
          <td bgcolor="#CCFFCC" colspan="2"><b>ʵ�ʹ���</b>��<%=crm_khxx_sjkgrq%> �� 
            <%=crm_khxx_sjjgrq%></td>
          <td width="3%">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�����տ�</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="3">
        <tr bgcolor="#E8E8FF"> 
          <td rowspan="2" align="center" bgcolor="#E8E8FF" width="23%">��ͬ���</td>
          <td rowspan="2" align="center" bgcolor="#E8E8FF" width="22%">���������</td>
          <td rowspan="2" align="center" width="25%">ʵ�ʷ������ͬ�������</td>
          <td colspan="3" align="center">ʵ�տ����</td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td colspan="2" align="center">�����񣫵��棩�տ�</td>
          <td width="9%" align="center">�����տ�</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>װ�޼�λ</b>��<%
		cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",crm_khxx_zxjwbm,true);
	%></td>
          <td width="22%"><b>��������ɱ�־</b>��<%cf.selectToken(out,"1+δ���&2+�����",zjxwcbz,true);%></td>
          <td width="25%" align="right">&nbsp;</td>
          <td width="12%" align="right">&nbsp;</td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>ԭ����</b>��<%=wdzgce%>��</td>
          <td width="22%"><b>��ǰ������</b>��<%=zjxje%>��</td>
          <td width="25%"><b>��ǰʵ�ʷ�����</b>��<%=cf.formatDouble(wdzgce+zjxje)%>��</td>
          <td width="12%" align="right"><b>��װ�տ�����:</b></td>
          <td width="9%"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+jzkfkcs+"'",jzkfkcs,true);
		%></td>
          <td width="9%"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+cwjzkfkcs+"'",cwjzkfkcs,true);
		%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>ǩԼ��</b>��<%=qye%>��</td>
          <td width="22%"><b>�ۺ�������</b>��<%=zhzjxje%>��</td>
          <td width="25%"><b>�ۺ�ʵ�ʷ�����</b>��<%=cf.formatDouble(qye+zhzjxje)%>��</td>
          <td width="12%" align="right"><b>��װ ʵ �տ�:</b></td>
          <td width="9%"><%=sfke%>��</td>
          <td width="9%"><%=cwsfke%>��</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>��Ʒ�</b>��<%=sjf%></td>
          <td width="22%"><b>��������</b>��<%=kglf%></td>
          <td width="25%">&nbsp;</td>
          <td width="12%" align="right"><b>�״θ���ʱ��:</b></td>
          <td width="9%"><%=jzkscsj%></td>
          <td width="9%"><%=cwjzkscsj%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>���������</b>��<%=guanlif%>��<%=glf%></td>
          <td width="22%" bgcolor="#CCFFCC"><b>�� ���� ��</b>��<%=kqtk%></td>
          <td width="25%">&nbsp; </td>
          <td width="12%" align="right"><b>�������ʱ��:</b></td>
          <td width="9%"><%=jzkfksj%></td>
          <td width="9%"><%=cwjzkfksj%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>ǩԼ��˰��</b>��<%=suijin%></td>
          <td width="22%"><b>������˰��</b>��<%=zjxsuijin%></td>
          <td width="25%"><b>��˰��</b>��<%=cf.formatDouble(suijin+zjxsuijin)%>��</td>
          <td width="12%" align="right"><b>����տ����:</b></td>
          <td width="9%"><%=jzkfkxh%></td>
          <td width="9%"><%=cwjzkfkxh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>��˰ǩԼ��</b>��<%=cf.formatDouble(suijin+qye)%></td>
          <td width="22%"><b>������������</b>��<%=zjxxh%></td>
          <td width="25%"><b>��˰������</b>��<%=cf.formatDouble(qye+zhzjxje+suijin+zjxsuijin)%></td>
          <td width="12%" align="right">&nbsp;</td>
          <td width="9%">&nbsp;</td>
          <td width="9%">&nbsp;</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="23%"><b>˰ &nbsp;��</b>��<%=suijinbfb%>% </td>
          <td width="22%"><b>���������ʱ��</b>��<%=zjxsj%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>�ͻ�������</b>��<%=khjsje%></td>
          <td width="12%" align="right">&nbsp;</td>
          <td width="9%">&nbsp;</td>
          <td width="9%">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�����Ż�</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%"><b>�ۿ���</b>��<%=crm_khxx_zkl%></td>
          <td width="25%"><b>�����</b>��<%=cxhdbm%></td>
          <td width="25%"><b>�Ƿ�����֤</b>��<%
	cf.radioToken(out, "Y+��&N+��",crm_khxx_sfyrz,true);
%></td>
          <td width="25%"><b>��֤�г�</b>��<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
        </tr>
        <tr> 
          <td width="25%"><b>�Ƿ����Ż�</b>��<%
	cf.radioToken(out, "Y+��&N+��",crm_khxx_sfyyh,true);
%></td>
          <td colspan="3"><b>�Ż�����</b>��<%=crm_khxx_yhyy%></td>
        </tr>
        <tr> 
          <td width="25%"><b>�Ƿ�ȯ</b>��<%
	cf.radioToken(out, "Y+��&N+��",crm_khxx_sffj,true);
%></td>
          <td width="25%"><b>��ȯ�ܶ�</b>��<%=fjje%></td>
          <td width="25%"><b>��˾�е���ȯ��</b>��<%=gsfje%></td>
          <td width="25%"><b>��ȯ�Ƿ�ع�˾</b>��<%
	cf.radioToken(out, "Y+��&N+��",fjhgs,true);
%></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�ɵ�</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%" > <b>�ɵ�״̬</b>��<%
	cf.selectToken(out,"1+�����ɵ�&2+�˹��ɵ�&5+�����ɵ�&6+��Ȩ�ɵ�&7+�ܾ��ӵ�&8+��ʩ����&4+�����޸��ɵ�",crm_khxx_pdclzt,true);
%></td>
          <td width="25%" ><b>�ɵ�ʱ�䣺<%=crm_khxx_pdsj%></b> </td>
          <td width="25%" > <b>�ɵ���</b>��<%=crm_khxx_pdr%></td>
          <td width="25%" ><b>�ɵ�����</b>��<%
	cf.selectToken(out,"0+�˹��ɵ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&5+�󵥵�С��&6+С���ִ�&7+�������&8+�����ɵ�&9+ͬС���ɵ�&A+�ܾ��ӵ�&B+��ʩ����",crm_khxx_jlbz,true);
%></td>
        </tr>
        <tr> 
          <td colspan="3" ><b>�ɵ�˵��</b>��<%=crm_khxx_pdsm%></td>
          <td width="25%" ><b>�ص��Ƿ���ʵ��</b><%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ",crm_khxx_hdsfss,true);
%><b></b></td>
        </tr>
        <tr> 
          <td width="25%" ><b>�ص���־</b>��<%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",crm_khxx_hdbz,true);
%></td>
          <td ><b>�� �� �ˣ�</b><%=crm_khxx_hdr%></td>
          <td colspan="2" ><b>�ص���ַ</b>��<%=crm_khxx_cgdz%></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>����֤</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%"><b>����֤��־</b>��<%
	cf.radioToken(out,"Y+�ѳ�����֤&N+δ������֤",kgzbz,true);
%></td>
          <td width="25%"><b>��֤ʱ��</b>��<%=kgzsj%></td>
          <td width="25%"><b>��֤��</b>��<%=kgzr%></td>
          <td width="25%"><b>���Ϸ�</b>��<%=clf%></td>
        </tr>
        <tr> 
          <td colspan="3"><b>����֤��ע</b>��<%=kgzsm%></td>
          <td width="25%"><b>ʩ����</b>��<%=sge%> </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�ط���Ϣ</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>�Ƿ� �� �ط�</b>��<%
	cf.selectToken(out,"Y+��ط�&N+����ط�",crm_khxx_sfxhf,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>�ط�����</b>��<%=crm_khxx_hfrq%></td>
          <td width="25%"><b>�ط�����</b>��<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",crm_khxx_hflxbm,true);
%></td>
          <td width="25%"></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>�طö����־</b>��<%
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+Ͷ�߱��޻طö���&3+ȫ������",crm_khxx_hfdjbz,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>����ʱ��</b>��<%=crm_khxx_djsj%></td>
          <td width="25%"><b>�� �� ��</b>��<%=crm_khxx_djr%></td>
          <td width="25%"><b>���»ط�ʱ��</b>��</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>�ƻ��ⶳʱ��</b>��<%=crm_khxx_jhjdsj%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>ʵ�ʽⶳʱ��</b>��<%=crm_khxx_sjjdsj%></td>
          <td width="25%"><b>�� �� ��</b>��<%=crm_khxx_jdr%></td>
          <td width="25%"><b>���¶�����</b>��<%=crm_khxx_djbh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"><b>�� �� ԭ ��</b>��<%=crm_khxx_djyy%></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>����</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>��װ��װ</b>��<%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,true);
%></td>
          <td width="25%"><b>��ĿרԱ��</b><%=xmzy%></td>
          <td width="25%"><b>�ͻ�������ϵ��ʽ��</b><%
	cf.selectToken(out,"1+�绰��ϵ&2+������&3+��������",jslxfs,true);
%></td>
          <td width="25%"><b>��ͻ���ϵʱ�䣺</b><%=ykhlxsj%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>��ɫ</b>&lt;<b>����</b>&gt;��<%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",crm_khxx_ysbm,true);
%>&lt;<%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",crm_khxx_czbm,true);
%>&gt;</td>
          <td colspan="3"><b>��ĿרԱ��ϵ˵����</b><%=lxsm%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>ˮ�ʷ�������</b>��<%=hykh%></td>
          <td width="25%"><b>ˮ�ʷ���������</b>��<%
	cf.selectItem(out,"select hyklxbm,hyklxmc from dm_hyklxbm order by hyklxbm",hyklxbm,true);
%></td>
          <td width="25%"><b>��Ա��Ч��</b>��<%=yxsjs%> </td>
          <td width="25%"><b>��Ա��Чֹ</b>��<%=yxsjz%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>ˮ�ʷ������Ƿ񷢷�</b>��<%
	cf.radioToken(out, "Y+����&N+δ����",sffk,true);
%></td>
          <td width="25%"><b>�Ǽǿ���</b>��<%=djkh%></td>
          <td width="25%"><b>��������</b>��<%=fkrq%></td>
          <td width="25%"><b>�Ƿ����ȩ</b>��<%
	cf.selectToken(out,"1+����Ҫ&2+��Ҫ&3+�����",sfcjq,true);
%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>�Ƿ����ϱ���</b>��<%
	cf.radioToken(out, "1+δ�ϱ���&2+�ѱ���",sfysbx,true);
%></td>
          <td width="25%"><b>��������</b>��<%=baokssj%></td>
          <td width="25%"><b>������ֹ</b>��<%=baozzsj%></td>
          <td width="25%"><b>�Ƿ������</b>��<%
	cf.selectToken(out,"1+����Ҫ&2+��Ҫ&3+�����",sffby,true);
%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>����ͻ���־</b>��<%
	cf.selectToken(out,"Y+��&N+��",wtkhbz,true);
%></td>
          <td width="25%"><b>¼����</b>��<%=wtkhlrr%></td>
          <td width="25%"><b>¼��ʱ��</b>��<%=wtkhlrsj%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td colspan="4"><b>����ͻ�˵��</b>��<%=wtkhsm%></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�����Ϣ</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>��ͬ��˱�־</b>��<%
	cf.selectToken(out,"N+δ���&P+���ɵ�&Y+������",crm_khxx_htshbz,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>�����</b>��<%=crm_khxx_htshr%></td>
          <td width="25%"><b>���ʱ��</b>��<%=crm_khxx_htshsj%></td>
          <td width="25%"><b>��˵÷�</b>��<%=crm_khxx_htshdf%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"><b>��ͬ������</b>��<%=crm_khxx_htshyj%></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>������Ϣ</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:13" cellpadding="2" cellspacing="2">
        <tr bgcolor="#E8E8FF" align="center"> 
          <td width="20%"><font color="#000099"><b>�ͻ����㣺<%
	cf.selectToken(out,"N+δ����&Y+�ѽ���",khjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>���ʦ���㣺<%
	cf.selectToken(out,"0+δ����&1+ǩ������&2+�깤����",sjsjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>���ӽ��㣺<%
	cf.selectToken(out,"0+δ����&1+�깤����&2+���ڽ���",crm_khxx_gdjsjd,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>���̵������㣺<%
	cf.selectToken(out,"0+δ����&1+�ѽ���",zjjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>ҵ��Ա���㣺<%
	cf.selectToken(out,"0+δ����&1+ǩ������&2+�깤����",ywyjsbz,true);
%></b></font></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>���̿ۿ�</b>��<%=gckk%></td>
          <td bgcolor="#CCFFCC"><b>ǩ���������</b>��<%=sjstcbl%>%</td>
          <td><b>�����¼��</b>��<%=gdjsjlh%></td>
          <td><b>�������</b>��<%=zjjsbl%>%</td>
          <td><b>ǩ���������</b>��<%=ywyqdjsbl%>%</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>���ʦ�е�����</b>��<%=sjsfy%></td>
          <td bgcolor="#CCFFCC"><b>ǩ��������</b>��<%=qdsyjsje%></td>
          <td>&nbsp;</td>
          <td><b>������</b>��<%=zjjsje%></td>
          <td><b>ǩ��������</b>��<%=ywyqdjsje%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>ʩ���ӳе�����</b>��<%=sgdfy%></td>
          <td bgcolor="#CCFFCC"><b>ǩ�������¼��</b>��<%=sjsjsjlh%></td>
          <td>&nbsp;</td>
          <td><b>�����¼��</b>��<%=zjjsjlh%></td>
          <td><b>ǩ�������¼��</b>��<%=ywyjsjlh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>���̵����е�����</b>��<%=zjfy%></td>
          <td bgcolor="#CCFFCC"><b>�깤�������</b>��<%=sjswgtcbl%>%</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>�깤�������</b>��<%=ywywgjsbl%>%</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>��˾�е�����</b>��<%=gsfy%></td>
          <td bgcolor="#CCFFCC"><b>�깤������</b>��<%=wgtcje%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>�깤������</b>��<%=ywywgjsje%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>�������е�����</b>��<%=qtfy%></td>
          <td bgcolor="#CCFFCC"><b>�깤�����¼��</b>��<%=wgjsjlh%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>�깤�����¼��</b>��<%=ywywgjsjlh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="5"><b>���̿ۿ�������־</b>��<%cf.selectToken(out,"N+δ����&Y+������",gckkspbz,true);%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC" align="center"> 
    <td colspan="4"> 
      <input type="button" value="��ʩ���Ӽ�¼" onClick="window.open('Pd_hsgdjlCxList.jsp?khbh=<%=khbh%>')" name="button7" >
      <input type="button" value="�����̵�����¼" onClick="window.open('Pd_hzjjlCxList.jsp?khbh=<%=khbh%>')" name="button8" >
      <input type="button" value="�ؼ���Ϣ�޸ļ�¼" onClick="window.open('ViewCrm_sjsxgjl.jsp?khbh=<%=khbh%>')" name="button9" >
    </td>
  </tr>
  <tr bgcolor="#FFFFCC" align="center"> 
    <td colspan="4"> 
      <input type="button" value="���Ͻ���" onClick="window.open('Crm_gcyszxmjlCxList.jsp?khbh=<%=khbh%>&gcjdbm=2')" name="button">
      <input type="button" value="���ι�������" onClick="window.open('Crm_gcyszxmjlCxList.jsp?khbh=<%=khbh%>&gcjdbm=3')" name="button2">
      <input type="button" value="��������" onClick="window.open('Crm_gcyszxmjlCxList.jsp?khbh=<%=khbh%>&gcjdbm=4')" name="button3">
      <input type="button" value="�깤����" onClick="window.open('Crm_gcyszxmjlCxList.jsp?khbh=<%=khbh%>&gcjdbm=5')" name="button4">
      <input type="button" value="������ϸ" onClick="window.open('Crm_gcyqyymxCxList.jsp?khbh=<%=khbh%>')" name="button5" >
      <input type="button" value="������ϸ" onClick="window.open('/gcgl/gcjdgz/gqhz/ViewCrm_gcjddjjl.jsp?khbh=<%=khbh%>')" name="button6" >
    </td>
  </tr>
</table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">������С�������ƺ�</td>
    <td colspan="3" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+crm_khxx_cqbm+"'",crm_khxx_cqbm,true);
%>��<%=crm_khxx_xqbm%>��<%=louhao%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">�ȵ����������λ�ã�</td>
    <td width="28%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where rddqbm='"+rddqbm+"'",rddqbm,true);
%>��<%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where hxwzbm='"+hxwzbm+"'",hxwzbm,true);
%>�� </td>
    <td width="18%" bgcolor="#CCCCFF" align="right">ְҵ���������䣩</td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",crm_khxx_zybm,true);
%>��<%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>�� </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">�����루���ۣ�</td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm where ysrbm='"+ysrbm+"'",ysrbm,true);
%>��<%=crm_khxx_fj%>��</td>
    <td width="18%" bgcolor="#CCCCFF" align="right">������ȡ��־</td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectToken(out,"1+δ��ȡ����&2+����ȡ����&3+�����ѹ黹",dalqbz,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">���ι���������Ŀ��ʱ��</td>
    <td width="28%"><%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcyszxmbm='"+ybysxmbm+"'",ybysxmbm,true);
%>��<%=crm_khxx_sybgcrq%></td>
    <td width="18%" align="right">����������Ŀ��ʱ��</td>
    <td width="35%"><%
	cf.selectItem(out,"select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcyszxmbm='"+zqysxmbm+"'",zqysxmbm,true);
%>��<%=szqsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">ͣ��ԭ��</td>
    <td width="28%"><%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm where tgyybm='"+tgyybm+"'",tgyybm,true);
%></td>
    <td width="18%" align="right">���Ƹ�������</td>
    <td width="35%"><%=gjfgsj%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">ͣ����ʼʱ�䣭ʵ�ʸ���</td>
    <td width="28%"><%=tgkssj%>--&gt;<%=tgjzsj%></td>
    <td width="18%" align="right">ͣ��˵��</td>
    <td width="35%"><%=tgsm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">��������¼���ˣ�ʱ��</td>
    <td width="28%"><%=yqlrr%>��<%=yqlrsj%></td>
    <td width="18%" align="right">�����Ƿ����ڣ�����</td>
    <td width="35%"><%
	cf.selectToken(out,"1+δ����&2+����",gcsfyq,true);
	%> ��<%=yqts%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">����˵��</td>
    <td colspan="3"><%=yqsm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right"></td>
    <td width="28%"> </td>
    <td width="18%" align="right">��������</td>
    <td width="35%"><%=hzts%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right"></td>
    <td colspan="3"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="19%"></td>
    <td width="28%"></td>
    <td align="right" width="18%">�˵����</td>
    <td width="35%"><%=crm_khxx_tdxh%></td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF">�������</td>
    <td width="28%" bgcolor="#FFFFFF"><%=crm_khxx_fwmj%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF">�������</td>
    <td width="35%" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",crm_khxx_hxmjbm,true);
%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#FFFFCC" align="right">��Ʒ��Ƿ��ת��</td>
    <td width="28%" bgcolor="#FFFFCC"><%cf.selectToken(out,"N+����ת��&Y+��ת��",sjfkzc,true);%></td>
    <td width="18%" bgcolor="#FFFFFF" align="right">ÿƽ�׾���</td>
    <td width="35%" bgcolor="#FFFFFF"><%=crm_khxx_pmjj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%"> 
      <div align="right">�ɱ��ޱ�־</div>
    </td>
    <td width="28%"> <%
	cf.selectToken(out,"Y+����&N+������&0+δ���� ",kbxbz,true);
%> </td>
    <td width="18%"> 
      <div align="right">����ͬ����</div>
    </td>
    <td width="35%"><%=crm_khxx_jhtrq%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">���޿�ʼʱ��</td>
    <td width="28%"><%=bxkssj%></td>
    <td width="18%" align="right">���޽�ֹʱ��</td>
    <td width="35%"><%=crm_khxx_bxjzsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">���豣��˵��</td>
    <td colspan="3"><%=bybxsm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%"> 
      <div align="right">������־</div>
    </td>
    <td width="28%"> <%
	cf.selectToken(out,"Y+��&N+��",crm_khxx_ybjbz,true);
%> </td>
    <td width="18%"> 
      <div align="right">�����Ǽ�ʱ��</div>
    </td>
    <td width="35%"><%=crm_khxx_ybjdjsj%> </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">����</div>
    </td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select yqbm,yqmc from dm_yqbm order by yqbm",crm_khxx_yqbm,true);
%> </td>
    <td width="18%" bgcolor="#CCCCFF"> 
      <div align="right">�������Ч��</div>
    </td>
    <td width="35%" bgcolor="#CCCCFF"><%=crm_khxx_ybjyxq%> </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">����</div>
    </td>
    <td width="28%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",crm_khxx_hxbm,true);
%> </td>
    <td width="18%" bgcolor="#CCCCFF"> 
      <div align="right">���</div>
    </td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",crm_khxx_fgflbm,true);
%> </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#FFFFFF"> 
      <div align="right">�ι��������</div>
    </td>
    <td width="28%" bgcolor="#FFFFFF"> <%=crm_khxx_ybjbh%> </td>
    <td width="18%" bgcolor="#FFFFFF"> 
      <div align="right">������Ƿ���ʵ</div>
    </td>
    <td width="35%" bgcolor="#FFFFFF"> <%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ",crm_khxx_ybjss,true);
%> </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#FFFFFF"> 
      <div align="right">������־</div>
    </td>
    <td width="28%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"N+δ����&Y+�ѿ���",crm_khxx_kpbz,true);
%> </td>
    <td width="18%" bgcolor="#FFFFFF"> 
      <div align="right">&nbsp;</div>
    </td>
    <td width="35%" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#FFFFFF"> 
      <div align="right">Ͷ�߱�־</div>
    </td>
    <td width="28%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"Y+��Ͷ��&N+��Ͷ��",crm_khxx_tsbz,true);
%> </td>
    <td width="18%" bgcolor="#FFFFFF"> 
      <div align="right">Ͷ�߼�¼��</div>
    </td>
    <td width="35%" bgcolor="#FFFFFF"><%=crm_khxx_tsjlh%> </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF"> 
      <div align="right">���ޱ�־</div>
    </td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectToken(out,"Y+�б���&N+�ޱ���",crm_khxx_bxbz,true);
%> </td>
    <td width="18%" bgcolor="#CCCCFF"> 
      <div align="right">���޼�¼��</div>
    </td>
    <td width="35%" bgcolor="#CCCCFF"><%=crm_khxx_bxjlh%> </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#FFFFFF"> 
      <div align="right">��Ϣ¼����</div>
    </td>
    <td width="28%" bgcolor="#FFFFFF"> <%=crm_khxx_lrr%> </td>
    <td width="18%" bgcolor="#FFFFFF"> 
      <div align="right">¼��ʱ��</div>
    </td>
    <td width="35%" bgcolor="#FFFFFF"> <%=crm_khxx_lrsj%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF">��ע</td>
    <td colspan="3" bgcolor="#FFFFFF"> <%=crm_khxx_bz%> </td>
  </tr>
</table>

  
</body>
</html>


<script  LANGUAGE="javascript">
<!--
function f_do()
{
	if ( confirm("ע�⣺ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		window.open('DeleteKhxx.jsp?khbh=<%=khbh%>');
	}
} 
//-->
</script>
</html>