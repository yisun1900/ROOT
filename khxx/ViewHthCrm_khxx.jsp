<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String ckjgbz=(String)session.getAttribute("ckjgbz");
String yhdlm=(String)session.getAttribute("yhdlm");

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
double zkl=0;
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
String sgd=null;
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
String hdsgd=null;
String hdsgbz=null;

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

double zqsuijin=0;
double suijin=0;
double suijinbfb=0;
double zqzjxsuijin=0;
double zjxsuijin=0;
double wdzgce=0;
double sjf=0;
double sssjf=0;
double glf=0;
double glfbfb=0;
double zqguanlif=0;
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
double zjxguanlif=0;
String jhwgsj=null;
String yqdjhwgsj=null;

String jjwjbz=null;
String jjwjr=null;
String jjwjsj=null;

double gcfqdzk=10;//工程费签单折扣
double glfzk=10;//管理费折扣
double sjzk=10;//税金折扣
double sjfzk=10;//设计费折扣

double clfzk=10;//辅材费折扣
double zcfzk=10;//主材费折扣
double rgfzk=10;//人工费折扣
double ysfzk=10;//运输费折扣
double jxfzk=10;//机械费折扣
double shfzk=10;//损耗费折扣
double qtfzk=10;//其它费折扣

double zqgczjf=0;
double zhgczjf=0;
double zqhtzcbj=0;
double zhhtzcbj=0;
double zjjmje=0;
double djfxje=0;

double sskbfb=0;
double sjhtsjf=0;

String fkfamc="";
String jzwkqs=null;
String bxkh=null;
String dadbh=null;
String dagdr=null;
String dagdsj=null;
String bjbbh=null;

String khbh=null;
String hth=cf.GB2Uni(request.getParameter("hth"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String ssfgs=null;

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

String xqhdmc=null;
String schdmc=null;
String kkglfx="";
String yjjzsj=null;
String tdyjjzsj=null;
double zjxssk=0;
String cxhdbmxq=null;
String cxhdbmzh=null;
double zqzjxguanlif=0;

String mgfrz=null;
String nwgfrz=null;
String sdgfrz=null;
String yqgfrz=null;
String mgjl=null;
String nwgjl=null;
String sdgjl=null;
String yqgjl=null;
String smhtbh=null;
String sjhfsj=null;

String wjrqyexmsm=null;
String wjrzjxsm=null;
double zqwjrqyexm=0;
double zhwjrqyexm=0;
double zqwjrzjx=0;
double zhwjrzjx=0;
int gqts=0;
double cdzwjmje=0;
double glfjmje=0;
double sjjmje=0;

String xxly="";
String xxlysm=null;
String khjl=null;
String khjldh="";
String gj=null;
String pgjsj=null;
String gjdh="";
String dd=null;
String pddsj=null;
String dddh="";
String sjsdh="";
String bzdh="";
String zjdh="";
String ywydh="";
String xmzydh="";
String qtsjs="";
String sgdxm="";
String sgdmc="";
String sgddh="";
String ysy=null;
String xcjdbz=null;
String clgw=null;

double zqsjf=0;
double zqqtsf=0;
double zhqtsf=0;
String qtsfsm=null;

double zqqtsfzjx=0;
double zhqtsfzjx=0;
double zqsjfzjx=0;
double zhsjfzjx=0;
double zqljzjx=0;
double zhljzjx=0;
String jhybgcrq=null;
String sybgcrq=null;
String jhzqsj=null;

String ywyssxz=null;
String ywybm=null;
String dianz=null;
String scbjl=null;
 
String lx="";
try {
	conn=cf.getConnection();

	ls_sql="select zqzjxguanlif,zqguanlif,cxhdbmxq,cxhdbmzh,zjxssk,yjjzsj,tdyjjzsj,zjxguanlif,tdsj,zjjsbz,zjjsjlh,zjjsbl,zjjsje,ywyqdjsbl,ywyqdjsje,ywywgjsjlh,ywywgjsbl,ywywgjsje,wgtcje,sjstcbl,qdsyjsje,sjswgtcbl,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfkxh,cwjzkfksj,guanlif,gdjsjlh,ywyjsjlh,sjsjsjlh,wgjsjlh,sjsjsbz,khjsbz,ywyjsbz,crm_khxx.khbh,crm_khxx.hth,suijinbfb,zjxsuijin,jzkscsj,NVL(hzts,0) hzts,suijin,khbh,zhzjxje,sfysbx,baokssj,baozzsj,rzsc,fgsbh,kqtk,kglf,louhao,sjfkzc,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,gckkspbz,sffk,djkh,fkrq,fgsbh,khjsje,gcsfyq,yqts,yqlrr,yqlrsj,wtkhbz,wtkhsm,wtkhlrr,wtkhlrsj,nlqjbm,ysrbm,rddqbm,hxwzbm,xmzy,zjxwcbz,zjxsj,zjxje,zjxxh,sjwjrq,zqysxmbm,ybysxmbm,hykh,hyklxbm,yxsjs,yxsjz,sjsbh,sfcjq,sffby,jzbz,NVL(tgbz,'W') tgbz,tgyybm,tgsm,tgkssj,gjfgsj,tgjzsj,kgzsm,jzkfkcs,jzkfkxh,jzkfksj,sfke,kgzbz,clf,sge,kgzsj,kgzr,ykhlxsj,jslxfs,lxsm,wdzgce,ywy,bjjb,glf,sjf,fjje,gsfje,fjhgs,cxhdbm,szqsj,bybxsm,yqsm,dalqbz,kbxbz,bxkssj,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.xb as crm_khxx_xb,crm_khxx.cqbm as crm_khxx_cqbm,crm_khxx.xqbm as crm_khxx_xqbm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sfzhm as crm_khxx_sfzhm,crm_khxx.nlqjbm as crm_khxx_nlqjbm,crm_khxx.zybm as crm_khxx_zybm,crm_khxx.fj as crm_khxx_fj,crm_khxx.hxbm as crm_khxx_hxbm,crm_khxx.czbm as crm_khxx_czbm,crm_khxx.fgflbm as crm_khxx_fgflbm,crm_khxx.zxjwbm as crm_khxx_zxjwbm,crm_khxx.ysbm as crm_khxx_ysbm,crm_khxx.hxmjbm as crm_khxx_hxmjbm,crm_khxx.fwmj as crm_khxx_fwmj,crm_khxx.pmjj as crm_khxx_pmjj,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye as qye,crm_khxx.sfyyh as crm_khxx_sfyyh,crm_khxx.yhyy as crm_khxx_yhyy,crm_khxx.zkl,crm_khxx.sffj as crm_khxx_sffj,crm_khxx.sfyrz as crm_khxx_sfyrz,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.sjkgrq as crm_khxx_sjkgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sjjgrq as crm_khxx_sjjgrq,crm_khxx.jhtrq as crm_khxx_jhtrq,crm_khxx.bxjzsj as crm_khxx_bxjzsj,crm_khxx.gcjdbm as crm_khxx_gcjdbm,crm_khxx.dwbh as dwbh,crm_khxx.pdclzt as crm_khxx_pdclzt,crm_khxx.pdsj as crm_khxx_pdsj,crm_khxx.pdr as crm_khxx_pdr,crm_khxx.sgd as sgd,crm_khxx.sgbz as crm_khxx_sgbz,crm_khxx.pdsm as crm_khxx_pdsm,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.sfxhf as crm_khxx_sfxhf,crm_khxx.hfrq as crm_khxx_hfrq,crm_khxx.hflxbm as crm_khxx_hflxbm,crm_khxx.ybjbz as crm_khxx_ybjbz,crm_khxx.ybjyxq as crm_khxx_ybjyxq,crm_khxx.ybjdjsj as crm_khxx_ybjdjsj,crm_khxx.hdbz as crm_khxx_hdbz,crm_khxx.cgdz as crm_khxx_cgdz,crm_khxx.hdr as crm_khxx_hdr,hdsgd,hdsgbz,crm_khxx.zt as crm_khxx_zt,crm_khxx.khlxbm as crm_khxx_khlxbm,crm_khxx.tsbz as crm_khxx_tsbz,crm_khxx.tsjlh as crm_khxx_tsjlh,crm_khxx.bxbz as crm_khxx_bxbz,crm_khxx.bxjlh as crm_khxx_bxjlh,crm_khxx.tdxh as crm_khxx_tdxh,crm_khxx.lrr as crm_khxx_lrr,crm_khxx.lrsj as crm_khxx_lrsj,crm_khxx.ybjbh as crm_khxx_ybjbh,crm_khxx.ybjss as crm_khxx_ybjss,crm_khxx.hdsfss as crm_khxx_hdsfss,crm_khxx.kpbz as crm_khxx_kpbz,crm_khxx.jlbz as crm_khxx_jlbz,crm_khxx.djbh as crm_khxx_djbh,crm_khxx.hfdjbz as crm_khxx_hfdjbz,crm_khxx.djyy as crm_khxx_djyy,crm_khxx.djsj as crm_khxx_djsj,crm_khxx.djr as crm_khxx_djr,crm_khxx.jhjdsj as crm_khxx_jhjdsj,crm_khxx.sjjdsj as crm_khxx_sjjdsj,crm_khxx.jdr as crm_khxx_jdr,crm_khxx.bz as crm_khxx_bz,crm_khxx.yqbm as crm_khxx_yqbm,crm_khxx.jyjdrq as crm_khxx_jyjdrq,crm_khxx.sybgcrq as crm_khxx_sybgcrq,crm_khxx.gdjsjd as crm_khxx_gdjsjd,crm_khxx.htshbz as crm_khxx_htshbz,crm_khxx.htshr as crm_khxx_htshr,crm_khxx.htshsj as crm_khxx_htshsj,crm_khxx.htshdf as crm_khxx_htshdf,crm_khxx.htshyj as crm_khxx_htshyj ";
	ls_sql+=" ,mgfrz,nwgfrz,sdgfrz,yqgfrz,mgjl,nwgjl,sdgjl,yqgjl,smhtbh,gqts,kgrq+((jgrq-kgrq)+NVL(hzts,0)+NVL(yqts,0)) as jhwgsj,kgrq+((jgrq-kgrq)+NVL(hzts,0)) as yqdjhwgsj";
	ls_sql+=" ,sjhfsj,glfbfb,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zqwjrzjx,zhwjrzjx,wjrzjxsm";
	ls_sql+=" ,jjwjbz,jjwjr,jjwjsj,cdzwjmje,glfjmje,sjjmje,xxlysm,khjl ";
	ls_sql+=" ,gj,pgjsj,dd,pddsj,zqsuijin,zqzjxsuijin,sgdxm,ysy,DECODE(NVL(jzwkqs,'N'),'Y','全收','N','否') jzwkqs";
	ls_sql+=" ,zqgczjf,zhgczjf,zqsjf,zqqtsf,zhqtsf,qtsfsm,zqqtsfzjx,zhqtsfzjx,zqsjfzjx,zhsjfzjx,zqljzjx,zhljzjx";
	ls_sql+=" ,DECODE(xcjdbz,'0','未申请','1','普通申请','2','特批申请','3','确认通过','4','确认失败','5','部分确认','6','特批同意','7','特批不同意','8','发布','9','交底成功','A','交底失败','B','失败已出方案') xcjdbz";
	ls_sql+=" ,zqhtzcbj,zhhtzcbj,clgw,jhybgcrq,sybgcrq,jhzqsj,bxkh,dadbh,dagdr,dagdsj";
	ls_sql+=" ,crm_khxx.ywybm,crm_khxx.ywyssxz,crm_khxx.dianz,crm_khxx.scbjl,sjhtsjf";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where hth='"+hth+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjhtsjf=rs.getDouble("sjhtsjf");
		ywybm=cf.fillNull(rs.getString("ywybm"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		dianz=cf.fillNull(rs.getString("dianz"));
		scbjl=cf.fillNull(rs.getString("scbjl"));

		dadbh=cf.fillNull(rs.getString("dadbh"));
		dagdr=cf.fillNull(rs.getString("dagdr"));
		dagdsj=cf.fillNull(rs.getDate("dagdsj"));
		bxkh=cf.fillNull(rs.getString("bxkh"));
		jhybgcrq=cf.fillNull(rs.getDate("jhybgcrq"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		jhzqsj=cf.fillNull(rs.getDate("jhzqsj"));
		clgw=cf.fillNull(rs.getString("clgw"));
		zqhtzcbj=rs.getDouble("zqhtzcbj");
		zhhtzcbj=rs.getDouble("zhhtzcbj");

		xcjdbz=cf.fillNull(rs.getString("xcjdbz"));
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqsjf=rs.getDouble("zqsjf");
		zqqtsf=rs.getDouble("zqqtsf");
		zhqtsf=rs.getDouble("zhqtsf");
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zhqtsfzjx=rs.getDouble("zhqtsfzjx");
		zqsjfzjx=rs.getDouble("zqsjfzjx");
		zhsjfzjx=rs.getDouble("zhsjfzjx");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");

		jzwkqs=cf.fillNull(rs.getString("jzwkqs"));
		ysy=cf.fillNull(rs.getString("ysy"));
		sgdxm=cf.fillNull(rs.getString("sgdxm"));
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		gj=cf.fillNull(rs.getString("gj"));
		pgjsj=cf.fillNull(rs.getDate("pgjsj"));
		dd=cf.fillNull(rs.getString("dd"));
		pddsj=cf.fillNull(rs.getDate("pddsj"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");

		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		jjwjr=cf.fillNull(rs.getString("jjwjr"));
		jjwjsj=cf.fillNull(rs.getDate("jjwjsj"));
		glfbfb=rs.getDouble("glfbfb");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zhwjrzjx=rs.getDouble("zhwjrzjx");
		wjrzjxsm=cf.fillNull(rs.getString("wjrzjxsm"));

		sjhfsj=cf.fillNull(rs.getDate("sjhfsj"));
		mgfrz=cf.fillNull(rs.getString("mgfrz"));
		nwgfrz=cf.fillNull(rs.getString("nwgfrz"));
		sdgfrz=cf.fillNull(rs.getString("sdgfrz"));
		yqgfrz=cf.fillNull(rs.getString("yqgfrz"));
		mgjl=cf.fillNull(rs.getString("mgjl"));
		nwgjl=cf.fillNull(rs.getString("nwgjl"));
		sdgjl=cf.fillNull(rs.getString("sdgjl"));
		yqgjl=cf.fillNull(rs.getString("yqgjl"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		gqts=rs.getInt("gqts");
		jhwgsj=cf.fillNull(rs.getDate("jhwgsj"));
		yqdjhwgsj=cf.fillNull(rs.getDate("yqdjhwgsj"));

		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zqguanlif=rs.getDouble("zqguanlif");
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		zjxssk=rs.getDouble("zjxssk");
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		zjxguanlif=rs.getDouble("zjxguanlif");
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
		zkl=rs.getDouble("zkl");
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
		sgd=cf.fillNull(rs.getString("sgd"));
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
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
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

		out.println("无此客户记录");
		return;
	}
	rs.close();
	ps.close();


	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();
	
	double yfkje=0;//应付款总金额
	cwgl.Cwgl cwgl=new cwgl.Cwgl();
	yfkje=cwgl.getAllFkje(khbh);

	if (yfkje!=0)
	{
		sskbfb=cf.round(sfke*100/yfkje,2);
	}
	else{
		sskbfb=0;
	}

	ls_sql="SELECT sgdmc,dh";
	ls_sql+=" FROM sq_sgd";
    ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	if (sgdmc==null || sgdmc.equals(""))
	{
		sgdmc=sgdxm;
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtsjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT fkfamc";
	ls_sql+=" FROM cw_khfkfa,cw_fkfabm";
    ls_sql+=" where cw_khfkfa.fkfabm=cw_fkfabm.fkfabm and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfamc=cf.fillNull(rs.getString("fkfamc"));
	}
	rs.close();
	ps.close();


	//客户折扣
	String zklx="";
	double zdzk=0;
	ls_sql="select DECODE(zklx,'1','整单打折','2','单项打折','3','部分费用打折') zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,zjjmje";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		zjjmje=rs.getDouble("zjjmje");

		if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
		{
			gcfqdzk=zdzk;
			glfzk=zdzk;
			sjzk=zdzk;
			sjfzk=zdzk;
		}
	}
	rs.close();
	ps.close();

	ls_sql="select djfxje";
	ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djfxje=rs.getDouble("djfxje");//订金返现金额
	}
	rs.close();
	ps.close();

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from crm_khbffyzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();


	if (tgbz.equals("Y"))//W+未停工&Y+已停工&N+停工后复工
	{
		tgbz="<font color=\"#FF0000\">停工</font>";
	}
	else if (tgbz.equals("N"))
	{
		tgbz="停工后复工";
	}
	else{
		tgbz="正常";
	}


	if (crm_khxx_zt.equals("2"))//2:家装客户；3:退单客户；4:非家装客户；5:设计客户
	{
		if (jzbz.equals("2"))//1:家装；2:工装
		{
			crm_khxx_zt="工装客户";
		}
		else {
			crm_khxx_zt="家装客户";
		}
	}
	else if (crm_khxx_zt.equals("3"))//2:家装客户；3:退单客户；4:非家装客户；5:设计客户
	{
		crm_khxx_zt="退单客户";
	}
	else if (crm_khxx_zt.equals("4"))//2:家装客户；3:退单客户；4:非家装客户；5:设计客户
	{
		crm_khxx_zt="集成客户";
	}
	else if (crm_khxx_zt.equals("5"))//2:家装客户；3:退单客户；4:非家装客户；5:设计客户
	{
		crm_khxx_zt="设计客户";
	}
	else if (crm_khxx_zt.equals("6"))//2:家装客户；3:退单客户；4:非家装客户；5:设计客户
	{
		crm_khxx_zt="散客";
	}


	if (ckjgbz.equals("N"))
	{
		wdzgce=0;
		qye=0;
		crm_khxx_pmjj="0";
		sfke=0;
		zjxje=0;
		zhzjxje=0;

		zqguanlif=0;
		guanlif=0;
		suijin=0;
		zqwjrqyexm=0;
		zhwjrqyexm=0;
		cdzwjmje=0;
		
		crm_khxx_zxjwbm="";
	}

	//设计师电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm in('23','04') and yhmc ='"+crm_khxx_sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+crm_khxx_sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+crm_khxx_zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//项目专员电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+xmzy+"' and zwbm='10'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//业务员电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+ywy+"' and zwbm='19'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ywydh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//管家电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+gj+"' and zwbm='06'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//调度电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+dd+"' and zwbm='07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dddh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//客户经理电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+khjl+"' and zwbm='03'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khjldh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdd=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="select kkglfx";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kkglfx=cf.fillNull(rs.getString("kkglfx"));
		if (kkglfx.equals(""))
		{
			kkglfx="N";
		}
	}
	rs.close();
	ps.close();

	ls_sql="select xxlymc";
	ls_sql+=" from  crm_khxxly,dm_xxlybm";
	ls_sql+=" where crm_khxxly.xxlybm=dm_xxlybm.xxlybm and crm_khxxly.khbh='"+khbh+"' and crm_khxxly.khlx='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xxly+=cf.fillNull(rs.getString("xxlymc"))+"、";
	}
	rs.close();
	ps.close();

	//实收设计费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm='53'";//53：设计费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	ls_sql="select bjbbh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=rs.getString("bjbbh");
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000FF}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
  <input type="button" <%if (zcdd==0) out.print("disabled");%> value="主材订单" onClick="window.open('Jc_zcddCxList.jsp?khbh=<%=khbh%>')">
  <input name="button2" type="button" onClick="window.open('ViewJc_zcddMx.jsp?khbh=<%=khbh%>')" value="主材明细" >
  <input type="button" <%if (zcdd==0 && mmdd==0 && cgdd==0 && jjdd==0) out.print("disabled");%> value="完结主材明细" onClick="window.open('Jc_zcddMxWjCxList.jsp?khbh=<%=khbh%>')" name="button10">
  <input type="button" <%if (zcdd==0 && mmdd==0 && cgdd==0 && jjdd==0) out.print("disabled");%> value="未完结主材明细" onClick="window.open('Jc_zcddMxWwjCxList.jsp?khbh=<%=khbh%>')" name="button11">
  <input type="button" value="派单" onClick="window.open('ViewPdxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="定期回访" onClick="window.open('ViewGchfxx.jsp?khbh=<%=khbh%>')">
  <input type="button" onClick="window.open('ViewSjhf.jsp?khbh=<%=khbh%>')" value="随机回访">
  <input type="button" onClick="window.open('ViewCrm_hfszjl.jsp?khbh=<%=khbh%>')" value="回访设置记录">
  <input type="button" value="投诉报修" onClick="window.open('ViewTsbxxx.jsp?khbh=<%=khbh%>')">
  <HR>
<%
	if (ckjgbz.equals("Y"))
	{
	%>
<input type="button" value="合同报价" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>')">
<input type="button" value="最新报价" onClick="window.open('ViewZxbj.jsp?khbh=<%=khbh%>')">
<input name="button5" type="button" onClick="window.open('Viewdyht1.jsp?khbh=<%=khbh%>')" value="一次性付款打印">
<input type="button"  value="分期付款合同打印" onClick="f_dyht2()" name="dyht2" >
<input name="button6" type="button" onClick="window.open('Viewcxxydy.jsp?khbh=<%=khbh%>')" value="促销协议打印">
<input type="button" onClick="window.open('Bj_khzcxmxjList.jsp?khbh=<%=khbh%>')" value="套餐小类">
<input type="button" onClick="window.open('ViewCrm_tckhqye.jsp?khbh=<%=khbh%>')" value="套餐价格">
<input type="button" value="增减项" onClick="window.open('ViewZjxxx.jsp?khbh=<%=khbh%>')">
<input type="button" value="付款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')">
<%
	}
%>
<%
	if (kkglfx.equals("Y"))
	{
	%>
<input type="button" value="工料分析" onClick="window.open('ViewGlfx.jsp?khbh=<%=khbh%>')" >
<input type="button" value="用料统计" onClick="window.open('ViewYltj.jsp?khbh=<%=khbh%>')" >
<%
	}
	else {
	%>
<input type="button" value="工料分析" onClick="window.open('ViewGlfx.jsp?khbh=<%=khbh%>')" disabled>
<input type="button" value="用料统计" onClick="window.open('ViewYltj.jsp?khbh=<%=khbh%>')" disabled>
<%
	}
%> 
  <input type="button" value="客户评价表" onClick="window.open('/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp?khbh=<%=khbh%>')">
  <input type="button" onClick="window.open('/dzbj/zxbjmx/ViewHbzbBj_fjxx.jsp?khbh=<%=khbh%>')"  value="环保指标">
  <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
  <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="材料单">
  <input name="button3" type="button" onClick="window.open('/khxx/Jxc_ckdCxList.jsp?khbh=<%=khbh%>')"  value="辅材出库单">
  <input type="button" onClick="window.open('/khxx/zkzsxx.jsp?khbh=<%=khbh%>')" value="折扣赠送">
  <input name="button4" type="button" onClick="window.open('/dhzx/dhzx/ViewYx_lqlpdj.jsp?khbh=<%=khbh%>')" value="领取礼品">
  <input name="button13" type="button" onClick="window.open('ViewTdxx.jsp?khbh=<%=khbh%>')" value="退单">
  <input name="button9" type="button" onClick="window.open('/dyht/dysjjjd.jsp?khbh=<%=khbh%>')" value="合同交接单">
</div>
<HR>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2" bgcolor="#E8E8FF">
  <tr>
    <td width="10%" align="right" bgcolor="#FFFFFF">客户姓名:</td>
    <td width="31%" bgcolor="#FFFFFF"><%=crm_khxx_khxm%>（
      <input name="button12" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" >
）(
<%
	cf.radioToken(out, "M+男&W+女",crm_khxx_xb,true);
%>
) </td>
    <td width="9%"  align="right" bgcolor="#FFFFFF">分公司</td>
    <td width="24%"  align="left" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
	%></td>
    <td align="right" bgcolor="#FFFFFF" >客户编号</td>
    <td align="left" bgcolor="#FFFFFF" ><%=khbh%></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#FFFFFF">房屋地址:</td>
    <td bgcolor="#FFFFFF"><%=crm_khxx_fwdz%></td>
    <td  align="right" bgcolor="#FFFFFF">户型</td>
    <td  align="left" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",crm_khxx_hxbm,true);
%>
(面积:<%=crm_khxx_fwmj%>)</td>
    <td width="9%" align="right" bgcolor="#FFFFFF" >合同号</td>
    <td width="17%" align="left" bgcolor="#FFFFFF" ><%=hth%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">设计师:</td>
    <td bgcolor="#FFFFFF"><%=crm_khxx_sjs%>『<%=sjsdh%>』</td>
    <td align="right" bgcolor="#FFFFFF" >所属设计室</td>
    <td bgcolor="#FFFFFF" ><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
	%></td>
    <td align="right" bgcolor="#FFFFFF">书面合同号</td>
    <td bgcolor="#FFFFFF"><%=smhtbh%></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#FFFFFF">店面</td>
    <td bgcolor="#FFFFFF"><%cf.selectItem(out,"select dwbh,dwmc||'（'||dwdh||'）' from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
    <td align="right" bgcolor="#FFFFFF" >店长</td>
    <td bgcolor="#FFFFFF" ><%=dianz%></td>
    <td align="right" bgcolor="#FFFFFF">身份证号</td>
    <td bgcolor="#FFFFFF"><%=crm_khxx_sfzhm%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">其他设计师:</td>
    <td bgcolor="#FFFFFF"><%=qtsjs%></td>
    <td align="right" bgcolor="#FFFFFF">项目专员:</td>
    <td bgcolor="#FFFFFF"><%=xmzy%>『<%=xmzydh%>』</td>
    <td align="right" bgcolor="#FFFFFF"><strong>家居顾问</strong></td>
    <td bgcolor="#FFFFFF"><%=clgw%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">预算员:</td>
    <td bgcolor="#FFFFFF"><%=ysy%></td>
    <td align="right" bgcolor="#FFFFFF">管家:</td>
    <td bgcolor="#FFFFFF"><%=gj%>『<%=gjdh%>』</td>
    <td align="right" bgcolor="#FFFFFF"><strong>报价级别</strong></td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">客户经理:</td>
    <td bgcolor="#FFFFFF"><%=khjl%>『<%=khjldh%>』</td>
    <td align="right" bgcolor="#FFFFFF">调度:</td>
    <td bgcolor="#FFFFFF"><%=dd%>『<%=dddh%>』</td>
    <td align="right" bgcolor="#FFFFFF"><strong>报价版本</strong></td>
    <td bgcolor="#FFFFFF"><%=bjbbh%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">业务员:</td>
    <td bgcolor="#FFFFFF"><%=ywy%>『<%=ywydh%>』</td>
    <td align="right" bgcolor="#FFFFFF">市场部小组</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"'",ywyssxz,true);
%></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">市场部</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywybm+"'",ywybm,true);
%></td>
    <td align="right" bgcolor="#FFFFFF">市场部经理</td>
    <td bgcolor="#FFFFFF"><%=scbjl%></td>
    <td align="right" bgcolor="#FFFFFF">关系客户</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",crm_khxx_khlxbm,true);
%></td>
  </tr>
  
  
  <tr>
    <td align="right" bgcolor="#FFFFFF">建档标志</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+未建档案&2+已建档案&3+已归档",dalqbz,true);
%></td>
    <td align="right" bgcolor="#FFFFFF">档案袋编号</td>
    <td bgcolor="#FFFFFF"><%=dadbh%></td>
    <td align="right" bgcolor="#FFFFFF">归档时间</td>
    <td bgcolor="#FFFFFF"><%=dagdsj%>（<%=dagdr%>）</td>
  </tr>
  <tr>
      <td align="right" bgcolor="#FFFFFF">施工队:</td>
	  <td colspan="5" bgcolor="#FFFFFF">
	    队长:<%=sgdmc%>『<%=sgddh%>』｜
		班长:<%=crm_khxx_sgbz%>『<%=bzdh%>』｜
		木工:<%=mgfrz%>｜
		泥瓦工:<%=nwgfrz%>｜
		水电工:<%=sdgfrz%>｜
		油漆工:<%=yqgfrz%>	  </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">质检:</td>
    <td colspan="3" bgcolor="#FFFFFF">
		质检:<%=crm_khxx_zjxm%>『<%=zjdh%>』｜
		木工:<%=mgjl%>｜
		泥瓦工:<%=nwgjl%>｜
		水电工:<%=sdgjl%>｜
		油漆工:<%=yqgjl%>	</td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">客户类型:</span></td>
    <td bgcolor="#FFFFFF"><span class="STYLE4"><%=crm_khxx_zt%></span></td>
  </tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="1">
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>工程进度</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
        <tr> 
          <td align="center" width="1%">&nbsp;</td>
          <td colspan="2" align="center" bgcolor="#E8E8FF">合同情况 </td>
          <td width="1%" align="center">&nbsp; </td>
          <td align="center" bgcolor="#E8E8FF" colspan="3">实际情况 </td>
          <td width="1%" align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td width="1%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"> <b>签约日期</b>:<%=crm_khxx_qyrq%>          </td>
          <td width="1%" align="right">&nbsp;</td>
          <td bgcolor="#CCFFCC"><b>工程进度</b>:
            <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_khxx_gcjdbm,true);
%></td>
          <td bgcolor="#CCFFCC"><strong>停工</strong>:<%=tgbz%></td>
          <td bgcolor="#CCFFCC"><b>家居完结</b>:
          <% cf.radioToken(out, "Y+完结&N+否",jjwjbz,true);%></td>
          <td width="1%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>建议交底</b>:<%=crm_khxx_jyjdrq%>（交底:<%=xcjdbz%>）</td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC"><b>实际开工</b>：<%=crm_khxx_sjkgrq%></td>
          <td width="22%" bgcolor="#CCFFCC"><strong>停工原因</strong>:
          <%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm where tgyybm='"+tgyybm+"'",tgyybm,true);
%></td>
          <td bgcolor="#CCFFCC"><b>家居完结时间</b>:<%=jjwjsj%></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>合同开工</b>:<%=crm_khxx_kgrq%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC">实际隐蔽工程验收:<%=sybgcrq%></td>
          <td bgcolor="#CCFFCC"><strong>停工开始时间</strong>:<%=tgkssj%></td>
          <td bgcolor="#CCFFCC">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC">计划隐蔽工程验收:<%=jhybgcrq%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC">实际中期验收时间:<%=szqsj%></td>
          <td width="22%" bgcolor="#CCFFCC"><strong>估计复工日期</strong>:<%=gjfgsj%></td>
          <td bgcolor="#CCFFCC"><b>验收进度</b>:
            <%cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where gcysxmbm='"+zqysxmbm+"'",zqysxmbm,true);%></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC">计划中期验收时间:<%=jhzqsj%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC"><strong>延期单预计完工</strong>:<%=yqdjhwgsj%></td>
          <td bgcolor="#CCFFCC"><strong>实际复工日期</strong>:<%=tgjzsj%></td>
          <td bgcolor="#CCFFCC"><b>验收时间</b>：<%=szqsj%></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>合同完工</b>:<%=crm_khxx_jgrq%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC"><strong>预计完工</strong>:<%=jhwgsj%></td>
          <td bgcolor="#CCFFCC">&nbsp;</td>
          <td bgcolor="#CCFFCC">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td width="1%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>合同工期</b>:<%=gqts%>天&nbsp;&nbsp;<b>延期单</b>：<%=hzts%>天&nbsp;&nbsp;<b>延期</b>：<%=yqts%>天
          <BR><strong>延期说明</strong>:<%=yqsm%></td>
          <td width="1%">&nbsp;</td>
          <td width="23%" bgcolor="#CCFFCC"><b>实际完工</b>：<%=crm_khxx_sjjgrq%></td>
          <td width="22%" bgcolor="#CCFFCC"><b>客户完结时间</b>:<%=sjwjrq%></td>
          <td width="22%" bgcolor="#CCFFCC"><b>退单时间</b>:<%=tdsj%></td>
          <td width="1%">&nbsp; </td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#FFFFFF"><table width="100%" border="0" style="FONT-SIZE:13" cellpadding="0" cellspacing="1" bgcolor="#999999">
      <tr align="center" bgcolor="#E8E8FF">
        <td width="12%">折扣类型</td>
        <td width="7%">整单折扣</td>
        <td width="10%">直接减免金额</td>
        <td width="7%">工程费折扣</td>
        <td width="10%">工程费减免额</td>
        <td width="8%">管理费折扣</td>
        <td width="10%">管理费减免额</td>
        <td width="10%">管理费百分比</td>
        <td width="8%">税金折扣</td>
        <td width="10%">减免额</td>
        <td width="8%">税金百分比</td>
      </tr>
      <tr align="center" bgcolor="#CCFFCC">
        <td bgcolor="#E8E8FF"><%=zklx%></td>
        <td bgcolor="#E8E8FF"><%=zdzk%></td>
        <td bgcolor="#E8E8FF"><%=zjjmje%></td>
        <td bgcolor="#CCFFCC"><%=gcfqdzk%></td>
        <td bgcolor="#CCFFCC"><%=cdzwjmje%></td>
        <td bgcolor="#E8E8FF"><%=glfzk%></td>
        <td bgcolor="#E8E8FF"><%=glfjmje%></td>
        <td bgcolor="#E8E8FF"><%=glfbfb%>%</td>
        <td bgcolor="#CCFFCC"><%=sjzk%></td>
        <td bgcolor="#CCFFCC"><%=sjjmje%></td>
        <td bgcolor="#CCFFCC"><%=suijinbfb%>%</td>
      </tr>
    </table>
      <hr>
	<table width="100%" border="0" style="FONT-SIZE:13" cellpadding="0" cellspacing="3">
      <tr align="center" bgcolor="#CCFFCC">
        <td width="14%" rowspan="2">&nbsp;</td>
        <td colspan="2" bgcolor="#CCFFCC"><strong>合同</strong></td>
        <td colspan="2" bgcolor="#CCFFCC"><strong>增减项</strong></td>
        <td colspan="2" bgcolor="#CCFFCC"><strong>合同＋增减项</strong></td>
        <td width="32%" rowspan="2" bgcolor="#CCFFCC"><strong>项目说明</strong></td>
      </tr>
      <tr align="center" bgcolor="#CCFFCC">
        <td width="9%">折前</td>
        <td width="9%">折后</td>
        <td width="9%">折前</td>
        <td width="9%">折后</td>
        <td width="9%">折前</td>
        <td width="9%">折后</td>
        </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><strong>工程费</strong></td>
        <td align="center"><%=zqgczjf%></td>
        <td align="center"><%=zhgczjf%></td>
        <td align="center"><%=zjxje%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zhzjxje%></td>
        <td align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
        <td align="center"><%=cf.formatDouble(zhgczjf+zhzjxje)%></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><strong>管理费(<%=glfbfb%>%)</strong></td>
        <td align="center"><%=zqguanlif%></td>
        <td align="center"><%=guanlif%></td>
        <td align="center"><%=zqzjxguanlif%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zjxguanlif%></td>
        <td align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
        <td align="center"><%=cf.formatDouble(guanlif+zjxguanlif)%></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><strong>税金(<%=suijinbfb%>%)</strong></td>
        <td align="center"><%=zqsuijin%></td>
        <td align="center"><%=suijin%></td>
        <td align="center"><%=zqzjxsuijin%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zjxsuijin%></td>
        <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
        <td align="center"><%=cf.formatDouble(suijin+zjxsuijin)%></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFCC">
        <td align="right"><strong>三项小计</strong></td>
        <td align="center"><%=cf.formatDouble(zqgczjf+zqguanlif+zqsuijin)%></td>
        <td align="center"><%=cf.formatDouble(zhgczjf+guanlif+suijin)%></td>
        <td align="center"><%=cf.formatDouble(zjxje+zqzjxguanlif+zqzjxsuijin)%></td>
        <td align="center"><%=cf.formatDouble(zhzjxje+zjxguanlif+zjxsuijin)%></td>
        <td align="center"><%=cf.formatDouble(zqgczjf+zqguanlif+zqsuijin+zjxje+zqzjxguanlif+zqzjxsuijin)%></td>
        <td align="center"><%=cf.formatDouble(zhgczjf+guanlif+suijin+zhzjxje+zjxguanlif+zjxsuijin)%></td>
        <td><span class="STYLE2">工程费＋管理费＋税金</span></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><font color="#0000FF">记入业绩其它项目</font></td>
        <td align="center"><%=zqqtsf%></td>
        <td align="center"><%=zhqtsf%></td>
        <td align="center"><%=zqqtsfzjx%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zhqtsfzjx%></td>
        <td align="center"><%=cf.formatDouble(zqqtsf+zqqtsfzjx)%></td>
        <td align="center"><%=cf.formatDouble(zhqtsf+zhqtsfzjx)%></td>
        <td><%=qtsfsm%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><font color="#0000FF">不记入业绩其它项目</font></td>
        <td align="center"><%=zqwjrqyexm%></td>
        <td align="center"><%=zhwjrqyexm%></td>
        <td align="center"><%=zqwjrzjx%></td>
        <td align="center"><%=zhwjrzjx%></td>
        <td align="center"><%=cf.formatDouble(zqwjrqyexm+zqwjrzjx)%></td>
        <td align="center"><%=cf.formatDouble(zhwjrqyexm+zhwjrzjx)%></td>
        <td><%=wjrqyexmsm%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><span class="STYLE3">主材费</span></td>
        <td align="center"><%=zqhtzcbj%></td>
        <td align="center"><%=zhhtzcbj%></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center"><%=zqhtzcbj%></td>
        <td align="center"><%=zhhtzcbj%></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><font color="#0000FF">电子报价设计费</font></td>
        <td align="center" bgcolor="#CCFFCC"><%=zqsjf%></td>
        <td align="center"><%=sjf%></td>
        <td align="center"><%=zqsjfzjx%></td>
        <td align="center"><%=zhsjfzjx%></td>
        <td align="center"><%=cf.formatDouble(zqsjf+zqsjfzjx)%></td>
        <td align="center"><%=cf.formatDouble(sjf+zhsjfzjx)%></td>
        <td>设计费折扣:<%=sjfzk%>，设计合同设计费:<%=sjhtsjf%></td>
      </tr>

      <tr bgcolor="#CCFFCC">
        <td align="right">直接减免金额</td>
        <td align="center">&nbsp;</td>
        <td align="center"><%=cf.formatDouble(-1*zjjmje)%></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right">订金返现金额</td>
        <td align="center">&nbsp;</td>
        <td align="center"><%=cf.formatDouble(-1*djfxje)%></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFCCFF">
        <td align="right"><span class="STYLE2">实际发生总额</span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(wdzgce)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(qye)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(zqljzjx)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(zhljzjx)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(wdzgce+zqljzjx)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(qye+zhljzjx)%></span></td>
        <td><span class="STYLE2">工程费＋管理费＋税金＋其它项目＋设计费</span></td>
      </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td bgcolor="#FFFFFF" align="center"><b>家装实收</b></td>
    <td><table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="3">
      <tr bgcolor="#E8E8FF">
        <td align="center">&nbsp;</td>
        <td width="16%" align="center">实收款(<%=sskbfb%>%)</td>
        <td align="center" width="16%">收款期数</td>
        <td align="center" width="18%">首次付款时间</td>
        <td align="center" width="19%">最近付款时间</td>
        <td align="center" width="15%">最近收款序号</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="center">（财务＋店面）收款</td>
        <td align="center"><%=sfke%>￥</td>
        <td align="center"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+jzkfkcs+"'",jzkfkcs,true);
		%></td>
        <td align="center"><%=jzkscsj%></td>
        <td align="center"><%=jzkfksj%></td>
        <td align="center"><%=jzkfkxh%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="center">财务收款</td>
        <td align="center"><%=cwsfke%>￥</td>
        <td align="center"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+cwjzkfkcs+"'",cwjzkfkcs,true);
		%></td>
        <td align="center"><%=cwjzkscsj%></td>
        <td align="center"><%=cwjzkfksj%></td>
        <td align="center"><%=cwjzkfkxh%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td width="16%" align="right">付款方案:<%=fkfamc%></td>
        <td>尾款全收:<%=jzwkqs%></td>
        <td width="16%" bgcolor="#CCFFCC">签单记入业绩时间:<%=yjjzsj%></td>
        <td width="18%" align="center">退单记入业绩时间:<%=tdyjjzsj%></td>
        <td width="19%">增减项实收款:<%=zjxssk%></td>
        <td width="15%">实收设计费:<%=sssjf%></td>
      </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center">&nbsp;</td>
    <td width="97%"><table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="3">
        
        <tr bgcolor="#CCFFCC"> 
          <td width="16%" align="center" bgcolor="#CCFFCC">增减项完成标志</td>
          <td width="16%" align="center" bgcolor="#CCFFCC">最近增减项序号</td>
          <td width="16%" align="center" bgcolor="#CCFFCC">最近增减项时间</td>
          <td width="18%" align="center" bgcolor="#CCFFCC">减项扣管理费</td>
          <td width="19%" align="center" bgcolor="#CCFFCC">减项项其它扣款</td>
          <td width="15%" align="center" bgcolor="#CCFFCC">保修卡号</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="16%" align="center" bgcolor="#CCFFCC"><%cf.selectToken(out,"1+未发生增减项&2+发生增减项&3+已录入增减项",zjxwcbz,true);%></td>
          <td width="16%" align="center" bgcolor="#CCFFCC"><%=zjxxh%></td>
          <td width="16%" align="center" bgcolor="#CCFFCC"><%=zjxsj%></td>
          <td width="18%" align="center" bgcolor="#CCFFCC"><%=kglf%></td>
          <td width="19%" align="center" bgcolor="#CCFFCC"><%=kqtk%></td>
          <td width="15%" align="center" bgcolor="#CCFFCC"><%=bxkh%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>打折优惠</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%">综合折扣:<%=zkl%></td>
          <td width="25%">服务费:<%=glf%></td>
          <td width="25%">是否已认证:
            <%
	cf.radioToken(out, "Y+是&N+否",crm_khxx_sfyrz,true);
%>          </td>
          <td width="25%">认证市场:
            <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%>          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>辅材费折扣:<%=clfzk%></td>
          <td>主材费折扣:<%=zcfzk%></td>
          <td>人工费折扣:<%=rgfzk%></td>
        </tr>
        <tr>
          <td>运输费折扣:<%=ysfzk%></td>
          <td>机械费折扣:<%=jxfzk%></td>
          <td>损耗费折扣:<%=shfzk%></td>
          <td>其它费折扣:<%=qtfzk%></td>
        </tr>
        <tr>
          <td width="25%">公司活动:<%=cxhdbm%></td>
          <td width="25%">小区活动:<%=cxhdbmxq%></td>
          <td width="25%">展会活动:<%=cxhdbmzh%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="25%">是否有优惠:
            <%
	cf.radioToken(out, "Y+是&N+否",crm_khxx_sfyyh,true);
%>          </td>
          <td colspan="3">优惠内容:<%=crm_khxx_yhyy%></td>
        </tr>
        <tr> 
          <td width="25%">是否返券:
            <%
	cf.radioToken(out, "Y+是&N+否",crm_khxx_sffj,true);
%>          </td>
          <td width="25%">返券总额:<%=fjje%></td>
          <td width="25%">公司承担返券款:<%=gsfje%></td>
          <td width="25%">返券是否回公司:
            <%
	cf.radioToken(out, "Y+是&N+否",fjhgs,true);
%>          </td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>派单</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%" > <b>派单状态</b>:
            <%
	cf.selectToken(out,"1+申请派单&2+人工派单&5+电子派单&6+特权派单&7+拒绝接单&8+换施工队&4+不许修改派单",crm_khxx_pdclzt,true);
%></td>
          <td width="25%" ><b>派单时间:<%=crm_khxx_pdsj%></b> </td>
          <td width="25%" > <b>派单人</b>:<%=crm_khxx_pdr%></td>
          <td width="25%" ><b>派单类型</b>:
            <%
	cf.selectToken(out,"0+人工派单&1+回单奖励&2+公司奖励&3+设计师指定派单&4+客户指定派单&5+大单抵小单&6+小单抵大单&7+特殊情况&8+电子派单&9+同小区派单&A+拒绝接单&B+换施工队",crm_khxx_jlbz,true);
%></td>
        </tr>
        <tr> 
          <td colspan="2" ><b>派单说明</b>:<%=crm_khxx_pdsm%></td>
          <td ><b>回单标志</b>:
            <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm where hdlxbm='"+crm_khxx_hdbz+"'",crm_khxx_hdbz,true);
%></td>
          <td width="25%" ><b>回单是否属实:</b>
            <%
	cf.selectToken(out,"0+未核实&Y+属实&N+不属实",crm_khxx_hdsfss,true);
%><b></b></td>
        </tr>
        <tr> 
          <td width="25%" ><b>回 单 人:</b><%=crm_khxx_hdr%></td>
          <td ><strong>工地队长班长</strong>:<%=hdsgd%>；<%=hdsgbz%></td>
          <td colspan="2" ><b>回单<strong>工地</strong></b>:<%=crm_khxx_cgdz%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>开工证</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%"><b>开工证标志</b>:
            <%
	cf.radioToken(out,"Y+已出开工证&N+未出开工证",kgzbz,true);
%></td>
          <td width="25%"><b>出证时间</b>:<%=kgzsj%></td>
          <td width="25%"><b>出证人</b>:<%=kgzr%></td>
          <td width="25%"><b>材料费</b>:<%=clf%></td>
        </tr>
        <tr> 
          <td colspan="3"><b>开工证备注</b>:<%=kgzsm%></td>
          <td width="25%"><b>施工额</b>:<%=sge%> </td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>回访信息</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>是否需回访</b>:
            <%
	cf.selectToken(out,"Y+需回访&N+不需回访",crm_khxx_sfxhf,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>应回访日期</b>:<%=crm_khxx_hfrq%></td>
          <td width="25%"><b>应回访类型</b>:
            <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",crm_khxx_hflxbm,true);
%></td>
          <td width="25%"><b>上次随机回访</b>:<%=sjhfsj%></td>
        </tr>
        
        
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>回访冻结标志</b>:
            <%
	cf.selectToken(out,"0+未冻结&1+工程回访冻结&2+投诉报修回访冻结&3+全部冻结",crm_khxx_hfdjbz,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>冻结时间</b>:<%=crm_khxx_djsj%></td>
          <td width="25%"><b>冻结人</b>:<%=crm_khxx_djr%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>计划解冻时间</b>:<%=crm_khxx_jhjdsj%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>实际解冻时间</b>:<%=crm_khxx_sjjdsj%></td>
          <td width="25%"><b>解冻人</b>:<%=crm_khxx_jdr%></td>
          <td width="25%"><b>最新冻结编号</b>:<%=crm_khxx_djbh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"><b>冻结原因</b>:<%=crm_khxx_djyy%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>其他</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#E8E8FF"> 
          <td width="25%" bgcolor="#E8E8FF"><b>家装公装</b>:
            <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,true);
%></td>
          <td width="25%">装修价位:
            <%
		cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",crm_khxx_zxjwbm,true);
	%></td>
          <td width="25%"><b>客户接受联系方式:</b>
            <%
	cf.selectToken(out,"1+电话联系&2+发短信&3+不受限制",jslxfs,true);
%></td>
          <td width="25%"><b>与客户联系时间:</b><%=ykhlxsj%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>油色</b>&lt;<b>材质</b>&gt;:
            <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",crm_khxx_ysbm,true);
%>
            &lt;
            <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",crm_khxx_czbm,true);
%>&gt;</td>
          <td colspan="3"><b>项目专员联系说明:</b><%=lxsm%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>水质分析卡号</b>:<%=hykh%></td>
          <td width="25%"><b>水质分析卡类型</b>:
            <%
	cf.selectItem(out,"select hyklxbm,hyklxmc from dm_hyklxbm order by hyklxbm",hyklxbm,true);
%></td>
          <td width="25%"><b>会员有效起</b>:<%=yxsjs%> </td>
          <td width="25%"><b>会员有效止</b>:<%=yxsjz%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>水质分析卡是否发放</b>:
            <%
	cf.radioToken(out, "Y+发卡&N+未发卡",sffk,true);
%></td>
          <td width="25%"><b>登记卡号</b>:<%=djkh%></td>
          <td width="25%"><b>发卡日期</b>:<%=fkrq%></td>
          <td width="25%"><b>是否除甲醛</b>:
            <%
	cf.selectToken(out,"1+不需要&2+需要&3+已完成",sfcjq,true);
%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>是否已上保险</b>:
            <%
	cf.radioToken(out, "1+未上保险&2+已保险",sfysbx,true);
%></td>
          <td width="25%"><b>保险期起</b>:<%=baokssj%></td>
          <td width="25%"><b>保险期止</b>:<%=baozzsj%></td>
          <td width="25%"><b>是否防白蚁</b>:
            <%
	cf.selectToken(out,"1+不需要&2+需要&3+已完成",sffby,true);
%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>问题客户标志</b>:
            <%
	cf.selectToken(out,"Y+是&N+否",wtkhbz,true);
%></td>
          <td width="25%"><b>录入人</b>:<%=wtkhlrr%></td>
          <td width="25%"><b>录入时间</b>:<%=wtkhlrsj%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td colspan="4"><b>问题客户说明</b>:<%=wtkhsm%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>审核信息</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>合同审核标志</b>:
            <%
	cf.selectToken(out,"N+未审核&P+可派单&Y+审核完成",crm_khxx_htshbz,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>审核人</b>:<%=crm_khxx_htshr%></td>
          <td width="25%"><b>审核时间</b>:<%=crm_khxx_htshsj%></td>
          <td width="25%"><b>审核得分</b>:<%=crm_khxx_htshdf%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"><b>合同审核意见</b>:<%=crm_khxx_htshyj%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>结算信息</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:13" cellpadding="2" cellspacing="2">
        <tr bgcolor="#E8E8FF" align="center"> 
          <td width="20%"><font color="#000099"><b>客户结算:
            <%
	cf.selectToken(out,"N+未结算&Y+已结算",khjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>设计师结算:
            <%
	cf.selectToken(out,"0+未结算&1+签单结算&2+完工结算",sjsjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>工队结算:
            <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+crm_khxx_gdjsjd+"'",crm_khxx_gdjsjd,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>质检结算:
            <%
	cf.selectToken(out,"0+未结算&1+已结算",zjjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>业务员结算:
            <%
	cf.selectToken(out,"0+未结算&1+签单结算&2+完工结算",ywyjsbz,true);
%></b></font></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>工程扣款</b>:<%=gckk%></td>
          <td bgcolor="#CCFFCC"><b>签单结算比率</b>:<%=sjstcbl%>%</td>
          <td><b>结算记录号</b>:<%=gdjsjlh%></td>
          <td><b>结算比率</b>:<%=zjjsbl%>%</td>
          <td><b>签单结算比率</b>:<%=ywyqdjsbl%>%</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>设计师承担费用</b>:<%=sjsfy%></td>
          <td bgcolor="#CCFFCC"><b>签单结算金额</b>:<%=qdsyjsje%></td>
          <td>客户结算金额:<%=khjsje%></td>
          <td><b>结算金额</b>:<%=zjjsje%></td>
          <td><b>签单结算金额</b>:<%=ywyqdjsje%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>施工队承担费用</b>:<%=sgdfy%></td>
          <td bgcolor="#CCFFCC"><b>签单结算记录号</b>:<%=sjsjsjlh%></td>
          <td>&nbsp;</td>
          <td><b>结算记录号</b>:<%=zjjsjlh%></td>
          <td><b>签单结算记录号</b>:<%=ywyjsjlh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>质检承担费用</b>:<%=zjfy%></td>
          <td bgcolor="#CCFFCC"><b>完工结算比率</b>:<%=sjswgtcbl%>%</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>完工结算比率</b>:<%=ywywgjsbl%>%</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>公司承担费用</b>:<%=gsfy%></td>
          <td bgcolor="#CCFFCC"><b>完工结算金额</b>:<%=wgtcje%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>完工结算金额</b>:<%=ywywgjsje%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>其它方承担费用</b>:<%=qtfy%></td>
          <td bgcolor="#CCFFCC"><b>完工结算记录号</b>:<%=wgjsjlh%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>完工结算记录号</b>:<%=ywywgjsjlh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="5"><b>工程扣款审批标志</b>:
            <%cf.selectToken(out,"N+未审批&Y+已审批",gckkspbz,true);%></td>
        </tr>
      </table>    </td>
  </tr>
</table>

<center>
  <b><font color="#0000FF">保修情况说明</font></b> 
</center>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF"> 
    <td width="14%" align="right"> 可保修标志    </td>
    <td width="32%"> <%
	cf.selectToken(out,"Y+保修&M+部分保修&N+不保修&0+未办理&1+预办理保修",kbxbz,true);
%> </td>
    <td width="19%" align="right"> 交合同日期    </td>
    <td width="35%"><%=crm_khxx_jhtrq%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="14%" align="right" bgcolor="#E8E8FF">保修开始时间</td>
    <td width="32%"><%=bxkssj%></td>
    <td width="19%" align="right">保修截止时间</td>
    <td width="35%"><%=crm_khxx_bxjzsj%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="14%" align="right">保修说明</td>
    <td colspan="3"><%=bybxsm%></td>
  </tr>
</table>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="6%">保修</td>
	  <td width="40%">项目名称</td>
      <td width="54%">情况说明</td>
    </tr>
    <%
		String bxxm="";
		String sfbx="";
		String qksm="";
		String mark="";
		ls_sql="SELECT bxxm,DECODE(sfbx,'Y','保修','N','<font color=\"#FF0000\">不保修</font>') sfbx,qksm";
		ls_sql+=" FROM crm_khbxxm";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by bxxm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			bxxm=rs.getString("bxxm");
			sfbx=rs.getString("sfbx");
			qksm=cf.fillHtml(rs.getString("qksm"));
		%> 
		<tr  align="center" bgcolor="#E8E8FF"> 
		  <td><%=sfbx%></td>
		  <td><%=bxxm%></td>
		  <td><%=qksm%></td>
		</tr>
		<%
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
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF" align="center"> 
    <td colspan="4"> 
      <input type="button" value="换施工队记录" onClick="window.open('Pd_hsgdjlCxList.jsp?khbh=<%=khbh%>')" name="button7" >
      <input type="button" value="换质检记录" onClick="window.open('Pd_hzjjlCxList.jsp?khbh=<%=khbh%>')" name="button8" >
      <input type="button" value="工程进度登记" onClick="window.open('Crm_gcjddjjlCxList.jsp?khbh=<%=khbh%>')"  >
  <tr>
    <td bgcolor="#CCCCFF" align="right">信息来源</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=xxly%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">信息来源说明</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=xxlysm%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">城区:小区:门牌号</td>
    <td colspan="3" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+crm_khxx_cqbm+"'",crm_khxx_cqbm,true);
%>
      :<%=crm_khxx_xqbm%>:<%=louhao%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">热点地区（环线位置）</td>
    <td width="28%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where rddqbm='"+rddqbm+"'",rddqbm,true);
%>
      （
      <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where hxwzbm='"+hxwzbm+"'",hxwzbm,true);
%>） </td>
    <td width="18%" bgcolor="#CCCCFF" align="right">职业（年龄区间）</td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",crm_khxx_zybm,true);
%>
      （
      <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>） </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">月收入（房价）</td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm where ysrbm='"+ysrbm+"'",ysrbm,true);
%>
      （<%=crm_khxx_fj%>）</td>
    <td width="18%" bgcolor="#CCCCFF" align="right">停工说明</td>
    <td width="35%" bgcolor="#CCCCFF"><%=tgsm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">工程延期录入人:时间</td>
    <td width="28%"><%=yqlrr%>:<%=yqlrsj%></td>
    <td width="18%" align="right">录入延期原因</td>
    <td width="35%"><%
	cf.selectToken(out,"1+未录入&2+已录入",gcsfyq,true);
	%></td>
  </tr>
  
  
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF">退单序号</td>
    <td width="28%" bgcolor="#FFFFFF"><%=crm_khxx_tdxh%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF">面积分类</td>
    <td width="35%" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",crm_khxx_hxmjbm,true);
%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#FFFFCC" align="right">设计费是否可转出</td>
    <td width="28%" bgcolor="#FFFFCC"><%cf.selectToken(out,"N+不可转出&Y+可转出",sjfkzc,true);%></td>
    <td width="18%" bgcolor="#FFFFFF" align="right">每平米均价</td>
    <td width="35%" bgcolor="#FFFFFF"><%=crm_khxx_pmjj%></td>
  </tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      样板间标志    </td>
    <td width="28%"> <%
	cf.selectToken(out,"Y+是&N+否",crm_khxx_ybjbz,true);
%> </td>
    <td width="18%" align="right"> 
      样板间登记时间    </td>
    <td width="35%"><%=crm_khxx_ybjdjsj%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      油漆    </td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select yqbm,yqmc from dm_yqbm order by yqbm",crm_khxx_yqbm,true);
%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      样板间有效期    </td>
    <td width="35%" bgcolor="#CCCCFF"><%=crm_khxx_ybjyxq%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#CCCCFF">&nbsp;</td>
    <td width="28%" bgcolor="#CCCCFF">&nbsp;</td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      风格    </td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",crm_khxx_fgflbm,true);
%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      参观样板间编号    </td>
    <td width="28%" bgcolor="#FFFFFF"> <%=crm_khxx_ybjbh%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF"> 
      样板间是否属实    </td>
    <td width="35%" bgcolor="#FFFFFF"> <%
	cf.selectToken(out,"0+未核实&Y+属实&N+不属实",crm_khxx_ybjss,true);
%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      考评标志    </td>
    <td width="28%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"N+未考评&Y+已考评",crm_khxx_kpbz,true);
%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="35%" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      投诉标志    </td>
    <td width="28%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"Y+有投诉&N+无投诉",crm_khxx_tsbz,true);
%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF"> 
      投诉记录号    </td>
    <td width="35%" bgcolor="#FFFFFF"><%=crm_khxx_tsjlh%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      报修标志    </td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectToken(out,"Y+有报修&N+无报修",crm_khxx_bxbz,true);
%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      报修记录号    </td>
    <td width="35%" bgcolor="#CCCCFF"><%=crm_khxx_bxjlh%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      信息录入人    </td>
    <td width="28%" bgcolor="#FFFFFF"> <%=crm_khxx_lrr%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF"> 
      录入时间    </td>
    <td width="35%" bgcolor="#FFFFFF"> <%=crm_khxx_lrsj%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF">备注</td>
    <td colspan="3" bgcolor="#FFFFFF"> <%=crm_khxx_bz%> </td>
  </tr>
</table>


<%
	if (ckjgbz.equals("Y"))
	{
		%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		 <tr bgcolor="#CCCCCC"  align="center">
			<td  width="9%">收费项目</td>
			<td  width="8%">收费计算方式</td>
			<td  width="4%">是否分期收款</td>
			<td  width="4%">百分比</td>
			<td  width="4%">计量单位</td>
			<td  width="4%">数量</td>
			<td  width="5%">单价</td>
			<td  width="6%">折前金额</td>
			<td  width="3%">单项折扣</td>
			<td  width="6%">折后金额</td>
			<td  width="4%">记入签约额</td>
			<td  width="4%">记入税金</td>
			<td  width="4%">记入管理费</td>
			<td  width="4%">是否可打折</td>
			<td  width="3%">最低折扣</td>
			<td  width="5%">收费项目类型</td>
			<td  width="4%">施工队结算</td>
			<td  width="20%">备注</td>
		</tr>

		 <%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后按基数计算）','8','税金（折后按折扣计算）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费') sflx ";
		ls_sql+=" ,DECODE(sffqsk,'1','是','2','否'),bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
		ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打','Y','可打') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','公司购主材间接费','5','工程管理费','6','工程税金','7','公司购主材管理费','8','公司购主材税金','A','自购主材管理费','B','自购主材税金','C','自购主材间接费','D','水电路','9','其它') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','否','Y','是') sfcysgdjs,bj_sfxmmx.bz";
		ls_sql+=" FROM bj_sfxmmx  ";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" order by bj_sfxmmx.sfxmbm";

		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数

		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDateSum();

		%>
</table>
		<%
	}
%>


</body>
</html>
<script language="javascript">
function f_dyht2()//参数FormName:Form的名称打印合同预览按钮
{
	if ("<%=lx%>"=="2" )
	{
		window.open("/dyht/dyht2_tc.jsp?khbh=<%=khbh%>");
	}
    else{
		window.open("/dyht/dyht2.jsp?khbh=<%=khbh%>");
	}
	
	
}</script>
