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
double zjxzkl=0;
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

String jjwjbz=null;
String jjwjr=null;
String jjwjsj=null;

String zklx="";
double zdzk=10;
double zjjmje=10;

double gcfqdzk=10;//���̷�ǩ���ۿ�
double glfzk=10;//�������ۿ�
double sjzk=10;//˰���ۿ�
double sjfzk=10;//��Ʒ��ۿ�
double qtsfxmzk=10;

double clfzk=10;//���ķ��ۿ�
double zcfzk=10;//���ķ��ۿ�
double rgfzk=10;//�˹����ۿ�
double ysfzk=10;//������ۿ�
double jxfzk=10;//��е���ۿ�
double shfzk=10;//��ķ��ۿ�
double qtfzk=10;//�������ۿ�

String zjxzklx="";
double gczjxfzk=10;
double gcjxzk=10;
double glfzjxzk=10;
double jxglfzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;


double zqgczjf=0;
double zhgczjf=0;

double sskbfb=0;

String fkfamc="";
String jzwkqs=null;

double zqhtzcbj=0;
double zhhtzcbj=0;

String hth=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));

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
String ywyssxz=null;

double zqsjf=0;
double zqqtsf=0;
double zhqtsf=0;
String qtsfsm=null;



double hdzsjz=0;
double djjje=0;
double cbj=0;
double zxcbj=0;
double sgcbj=0;
double zjxsgcbj=0;

double zxzsjz=0;
double zjxdjjje=0;
double zxhtjz=0;
double zxmle=0;
double zxmll=0;
double zxgcfjcbj=0;
double zxqtfjcbj=0;

double gcjcbj=0;
double gcfjcbj=0;
double qtfjcbj=0;


double zxsgcbj=0;
double zxgcjcbj=0;
double htjz=0;
double mll=0;
double mle=0;
double yjjzcs=0;
double yjjz=0;
double zxyjjz=0;

double zqqtsfzjx=0;
double zhqtsfzjx=0;
double zqsjfzjx=0;
double zhsjfzjx=0;
double zqljzjx=0;
double zhljzjx=0;

double zchtje=0;
double zchtcb=0;
double zczxje=0;
double zczxcb=0;
double khhtml=0;
double khzxml=0;
double zchtml=0;
double zczxml=0;

double khpck=0;
double yqf=0;
double jsyh=0;
double sjml=0;

try {
	conn=cf.getConnection();



	ls_sql="select zqzjxguanlif,zqguanlif,cxhdbmxq,cxhdbmzh,zjxssk,yjjzsj,tdyjjzsj,zjxguanlif,tdsj,zjjsbz,zjjsjlh,zjjsbl,zjjsje,ywyqdjsbl,ywyqdjsje,ywywgjsjlh,ywywgjsbl,ywywgjsje,wgtcje,sjstcbl,qdsyjsje,sjswgtcbl,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfkxh,cwjzkfksj,guanlif,gdjsjlh,ywyjsjlh,sjsjsjlh,wgjsjlh,sjsjsbz,khjsbz,ywyjsbz,crm_khxx.khbh,crm_khxx.hth,suijinbfb,zjxsuijin,jzkscsj,NVL(hzts,0) hzts,suijin,khbh,zhzjxje,sfysbx,baokssj,baozzsj,rzsc,fgsbh,kqtk,kglf,louhao,sjfkzc,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,gckkspbz,sffk,djkh,fkrq,fgsbh,khjsje,gcsfyq,yqts,yqlrr,yqlrsj,wtkhbz,wtkhsm,wtkhlrr,wtkhlrsj,nlqjbm,ysrbm,rddqbm,hxwzbm,xmzy,zjxwcbz,zjxsj,zjxje,zjxxh,sjwjrq,zqysxmbm,ybysxmbm,hykh,hyklxbm,yxsjs,yxsjz,sjsbh,sfcjq,sffby,jzbz,NVL(tgbz,'W') tgbz,tgyybm,tgsm,tgkssj,gjfgsj,tgjzsj,kgzsm,jzkfkcs,jzkfkxh,jzkfksj,sfke,kgzbz,clf,sge,kgzsj,kgzr,ykhlxsj,jslxfs,lxsm,wdzgce,ywy,bjjb,glf,sjf,fjje,gsfje,fjhgs,cxhdbm,szqsj,bybxsm,yqsm,dalqbz,kbxbz,bxkssj,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.xb as crm_khxx_xb,crm_khxx.cqbm as crm_khxx_cqbm,crm_khxx.xqbm as crm_khxx_xqbm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sfzhm as crm_khxx_sfzhm,crm_khxx.nlqjbm as crm_khxx_nlqjbm,crm_khxx.zybm as crm_khxx_zybm,crm_khxx.fj as crm_khxx_fj,crm_khxx.hxbm as crm_khxx_hxbm,crm_khxx.czbm as crm_khxx_czbm,crm_khxx.fgflbm as crm_khxx_fgflbm,crm_khxx.zxjwbm as crm_khxx_zxjwbm,crm_khxx.ysbm as crm_khxx_ysbm,crm_khxx.hxmjbm as crm_khxx_hxmjbm,crm_khxx.fwmj as crm_khxx_fwmj,crm_khxx.pmjj as crm_khxx_pmjj,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qye as qye,crm_khxx.sfyyh as crm_khxx_sfyyh,crm_khxx.yhyy as crm_khxx_yhyy,crm_khxx.zkl,crm_khxx.zjxzkl,crm_khxx.sffj as crm_khxx_sffj,crm_khxx.sfyrz as crm_khxx_sfyrz,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.sjkgrq as crm_khxx_sjkgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sjjgrq as crm_khxx_sjjgrq,crm_khxx.jhtrq as crm_khxx_jhtrq,crm_khxx.bxjzsj as crm_khxx_bxjzsj,crm_khxx.gcjdbm as crm_khxx_gcjdbm,crm_khxx.dwbh as dwbh,crm_khxx.pdclzt as crm_khxx_pdclzt,crm_khxx.pdsj as crm_khxx_pdsj,crm_khxx.pdr as crm_khxx_pdr,crm_khxx.sgd as sgd,crm_khxx.sgbz as crm_khxx_sgbz,crm_khxx.pdsm as crm_khxx_pdsm,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.sfxhf as crm_khxx_sfxhf,crm_khxx.hfrq as crm_khxx_hfrq,crm_khxx.hflxbm as crm_khxx_hflxbm,crm_khxx.ybjbz as crm_khxx_ybjbz,crm_khxx.ybjyxq as crm_khxx_ybjyxq,crm_khxx.ybjdjsj as crm_khxx_ybjdjsj,crm_khxx.hdbz as crm_khxx_hdbz,crm_khxx.cgdz as crm_khxx_cgdz,crm_khxx.hdr as crm_khxx_hdr,hdsgd,hdsgbz,crm_khxx.zt as crm_khxx_zt,crm_khxx.khlxbm as crm_khxx_khlxbm,crm_khxx.tsbz as crm_khxx_tsbz,crm_khxx.tsjlh as crm_khxx_tsjlh,crm_khxx.bxbz as crm_khxx_bxbz,crm_khxx.bxjlh as crm_khxx_bxjlh,crm_khxx.tdxh as crm_khxx_tdxh,crm_khxx.lrr as crm_khxx_lrr,crm_khxx.lrsj as crm_khxx_lrsj,crm_khxx.ybjbh as crm_khxx_ybjbh,crm_khxx.ybjss as crm_khxx_ybjss,crm_khxx.hdsfss as crm_khxx_hdsfss,crm_khxx.kpbz as crm_khxx_kpbz,crm_khxx.jlbz as crm_khxx_jlbz,crm_khxx.djbh as crm_khxx_djbh,crm_khxx.hfdjbz as crm_khxx_hfdjbz,crm_khxx.djyy as crm_khxx_djyy,crm_khxx.djsj as crm_khxx_djsj,crm_khxx.djr as crm_khxx_djr,crm_khxx.jhjdsj as crm_khxx_jhjdsj,crm_khxx.sjjdsj as crm_khxx_sjjdsj,crm_khxx.jdr as crm_khxx_jdr,crm_khxx.bz as crm_khxx_bz,crm_khxx.yqbm as crm_khxx_yqbm,crm_khxx.jyjdrq as crm_khxx_jyjdrq,crm_khxx.sybgcrq as crm_khxx_sybgcrq,crm_khxx.gdjsjd as crm_khxx_gdjsjd,crm_khxx.htshbz as crm_khxx_htshbz,crm_khxx.htshr as crm_khxx_htshr,crm_khxx.htshsj as crm_khxx_htshsj,crm_khxx.htshdf as crm_khxx_htshdf,crm_khxx.htshyj as crm_khxx_htshyj ";
	ls_sql+=" ,mgfrz,nwgfrz,sdgfrz,yqgfrz,mgjl,nwgjl,sdgjl,yqgjl,smhtbh,gqts,kgrq+((jgrq-kgrq)+NVL(hzts,0)) as jhwgsj";
	ls_sql+=" ,sjhfsj,glfbfb,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zqwjrzjx,zhwjrzjx,wjrzjxsm";
	ls_sql+=" ,jjwjbz,jjwjr,jjwjsj,cdzwjmje,glfjmje,sjjmje,xxlysm,khjl ";
	ls_sql+=" ,zqhtzcbj,zhhtzcbj,gj,pgjsj,dd,pddsj,zqsuijin,zqzjxsuijin,sgdxm,ysy,ywyssxz,DECODE(NVL(jzwkqs,'N'),'Y','ȫ��','N','��') jzwkqs";
	ls_sql+=" ,zqgczjf,zhgczjf,zqsjf,zqqtsf,zhqtsf,qtsfsm,zqqtsfzjx,zhqtsfzjx,zqsjfzjx,zhsjfzjx,zqljzjx,zhljzjx";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqhtzcbj=rs.getDouble("zqhtzcbj");
		zhhtzcbj=rs.getDouble("zhhtzcbj");
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
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
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
		zjxzkl=rs.getDouble("zjxzkl");
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

		out.println("�޴˿ͻ���¼");
		return;
	}
	rs.close();
	ps.close();

	double yfkje=0;//Ӧ�����ܽ��
	cwgl.Cwgl cwgl=new cwgl.Cwgl();
	yfkje=cwgl.getAllFkje(khbh);

	if (yfkje!=0)
	{
		sskbfb=cf.round(sfke*100/yfkje,2);
	}
	else{
		sskbfb=0;
	}


	ls_sql="select hdzsjz,djjje,cbj,zxcbj,sgcbj,zxsgcbj,gcjcbj,zxsgcbj,htjz,mll,mle,yjjzcs,yjjz,zxyjjz ";
	ls_sql+=" ,zxzsjz,zjxdjjje,zxhtjz,zxmle,zxmll,zxgcjcbj";
	ls_sql+=" ,zchtje,zchtcb,zczxje,zczxcb,zchtml,zczxml,khhtml,khzxml,khpck,yqf,jsyh";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxzsjz=rs.getDouble("zxzsjz");
		zjxdjjje=rs.getDouble("zjxdjjje");
		zxhtjz=rs.getDouble("zxhtjz");
		zxmle=rs.getDouble("zxmle");
		zxmll=rs.getDouble("zxmll");
		zxgcjcbj=rs.getDouble("zxgcjcbj");

		hdzsjz=rs.getDouble("hdzsjz");
		djjje=rs.getDouble("djjje");
		cbj=rs.getDouble("cbj");
		zxcbj=rs.getDouble("zxcbj");
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
		gcjcbj=rs.getDouble("gcjcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
		htjz=rs.getDouble("htjz");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		yjjzcs=rs.getDouble("yjjzcs");
		yjjz=rs.getDouble("yjjz");
		zxyjjz=rs.getDouble("zxyjjz");

		zchtje=rs.getDouble("zchtje");
		zchtcb=rs.getDouble("zchtcb");
		zczxje=rs.getDouble("zczxje");
		zczxcb=rs.getDouble("zczxcb");
		zchtml=rs.getDouble("zchtml");
		zczxml=rs.getDouble("zczxml");
		khhtml=rs.getDouble("khhtml");
		khzxml=rs.getDouble("khzxml");
		khpck=rs.getDouble("khpck");
		yqf=rs.getDouble("yqf");
		jsyh=rs.getDouble("jsyh");
	}
	rs.close();
	ps.close();


	sjml=0;//ʵ��ë��
	if ((zczxje+zxhtjz)!=0)
	{
		sjml=cf.round((zczxje-zczxcb+zxmle-khpck-jsyh-yqf)*100/(zczxje+zxhtjz),2);
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
		qtsjs+="��"+rs.getString("sjs");
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


	//�ͻ��ۿ�

	ls_sql="select DECODE(zklx,'1','��������','2','�������','3','���ַ��ô���') zklx,zdzk,zjjmje,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk  ,zjxzklx";
	ls_sql+=" from  crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));//�ۿ�����  1���������ۣ�2��������ۣ�3�����ַ��ô���
		zdzk=rs.getDouble("zdzk");
		zjjmje=rs.getDouble("zjjmje");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");

		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));//1��ͬ��ͬ��2�������ۿ�
	}
	rs.close();
	ps.close();


	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from  crm_khbffyzk";
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

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk ";
	ls_sql+=" from  crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
	}
	rs.close();
	ps.close();

	if (tgbz.equals("Y"))//W+δͣ��&Y+��ͣ��&N+ͣ���󸴹�
	{
		tgbz="<font color=\"#FF0000\">��ͣ����</font>";
	}
	else if (tgbz.equals("N"))
	{
		tgbz="��ͣ���󸴹���";
	}
	else{
		tgbz="";
	}


	if (crm_khxx_zt.equals("2"))//2:��װ�ͻ���3:�˵��ͻ���4:�Ǽ�װ�ͻ���5:��ƿͻ�
	{
		if (jzbz.equals("2"))//1:��װ��2:��װ
		{
			crm_khxx_zt="��װ�ͻ�";
		}
		else {
			crm_khxx_zt="��װ�ͻ�";
		}
	}
	else if (crm_khxx_zt.equals("3"))//2:��װ�ͻ���3:�˵��ͻ���4:�Ǽ�װ�ͻ���5:��ƿͻ�
	{
		crm_khxx_zt="�˵��ͻ�";
	}
	else if (crm_khxx_zt.equals("4"))//2:��װ�ͻ���3:�˵��ͻ���4:�Ǽ�װ�ͻ���5:��ƿͻ�
	{
		crm_khxx_zt="���ɿͻ�";
	}
	else if (crm_khxx_zt.equals("5"))//2:��װ�ͻ���3:�˵��ͻ���4:�Ǽ�װ�ͻ���5:��ƿͻ�
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

		zqguanlif=0;
		guanlif=0;
		suijin=0;
		zqwjrqyexm=0;
		zhwjrqyexm=0;
		cdzwjmje=0;
		
		crm_khxx_zxjwbm="";
	}

	//���ʦ�绰
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


	//�೤�绰
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

	//�ʼ�绰
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

	//��ĿרԱ�绰
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

	//ҵ��Ա�绰
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

	//�ܼҵ绰
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

	//���ȵ绰
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

	//�ͻ������绰
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
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
	rs =ps.executeQuery(ls_sql);
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
	rs =ps.executeQuery(ls_sql);
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
		xxly+=cf.fillNull(rs.getString("xxlymc"))+"��";
	}
	rs.close();
	ps.close();

	//ʵ����Ʒ�
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";
	ls_sql+=" and fklxbm='53'";//53����Ʒ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sssjf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

/*
	//���̷�ʩ���ɱ���
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcfsgcbj=rs.getDouble(1);
	}
	rs.close();
	ps.close();
*/
	//������ʩ���ɱ���(����ʩ���ӽ���)
	ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' and bj_sfxmmx.sfxmlx not in('5','6','7','8','A','B')";
	//1����ӹ��̷ѣ�2��������طѣ�3����Ʒѣ�4����˾�����ļ�ӷѣ�5�����̹����ѣ�6������˰��7����˾�����Ĺ����ѣ�8����˾������˰��A���Թ����Ĺ����ѣ�B���Թ�����˰��C���Թ����ļ�ӷѣ�9������
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtfjcbj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//������ʩ���ɱ���(���������)
	ls_sql="SELECT ROUND(sum(sfje*gcjcbjbfb/100),2)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfcysgdjs='Y'";//�Ƿ����ʩ���ӽ���  Y���ǣ�N����  
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtfjcbj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//���̷ѻ�������
	ls_sql="SELECT ROUND(sum(bj_gclmx.sl*bj_bjxmmx.sgdbj),2)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcfjcbj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//�����ѻ�������
	ls_sql="SELECT ROUND(sum(sfje*gcjcbjbfb/100),2)";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and bj_sfxmmx.sfcysgdjs='Y'";//�Ƿ����ʩ���ӽ���  Y���ǣ�N����  
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtfjcbj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
  <input type="button" onClick="window.open('Jc_zcddCxCbList.jsp?khbh=<%=khbh%>')" value="���Ķ���" <%if (zcdd==0) out.print("disabled");%>>
  <input type="button" onClick="window.open('ViewJc_zcddMx.jsp?khbh=<%=khbh%>')" value="������ϸ" >
  <input type="button" onClick="window.open('ViewZjxxx.jsp?khbh=<%=khbh%>')" value="������">
  <input type="button" <%if (zcdd==0 && mmdd==0 && cgdd==0 && jjdd==0) out.print("disabled");%> value="���������ϸ" onClick="window.open('Jc_zcddMxWjCxList.jsp?khbh=<%=khbh%>')" >
  <input type="button" <%if (zcdd==0 && mmdd==0 && cgdd==0 && jjdd==0) out.print("disabled");%> value="δ���������ϸ" onClick="window.open('Jc_zcddMxWwjCxList.jsp?khbh=<%=khbh%>')" >
  <input type="button" value="�ɵ�" onClick="window.open('ViewPdxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="�طü�¼" onClick="window.open('ViewGchfxx.jsp?khbh=<%=khbh%>')">
  <input type="button" onClick="window.open('ViewCrm_hfszjl.jsp?khbh=<%=khbh%>')" value="�ط����ü�¼">
  <input type="button" value="Ͷ�߱���" onClick="window.open('ViewTsbxxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="�˵�" onClick="window.open('ViewTdxx.jsp?khbh=<%=khbh%>')">
  <input type="button" value="��ȡ��Ʒ" onClick="window.open('/dhzx/dhzx/ViewYx_lqlpdj.jsp?khbh=<%=khbh%>')">
<HR>
<%
	if (ckjgbz.equals("Y"))
	{
	%>
<input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxGztjList.jsp?khbh=<%=khbh%>','','toolbar=no,menubar=no,scrollbars=yes,resizable=yes')" value="����ͳ��">
<input type="button" value="��ͬ����" onClick="window.open('/dhzx/sjszxone/dybj.jsp?khbh=<%=khbh%>')">
<input type="button" onClick="window.open('/dzbj/zxbjmx/ViewAllBj.jsp?khbh=<%=khbh%>')" value="���۳ɱ�">
<input type="button" value="���±���" onClick="window.open('ViewZxbj.jsp?khbh=<%=khbh%>')">
<input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyqlList.jsp?khbh=<%=khbh%>')" value="���㱨��">
<input type="button" value="������Ϣ" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')">
<%
	}
%>
<%
	if (kkglfx.equals("Y"))
	{
	%>
<input type="button" value="���Ϸ���" onClick="window.open('ViewGlfx.jsp?khbh=<%=khbh%>')" >
<input type="button" value="����ͳ��" onClick="window.open('ViewYltj.jsp?khbh=<%=khbh%>')" >
<%
	}
	else {
	%>
<input type="button" value="���Ϸ���" onClick="window.open('ViewGlfx.jsp?khbh=<%=khbh%>')" disabled>
<input type="button" value="����ͳ��" onClick="window.open('ViewYltj.jsp?khbh=<%=khbh%>')" disabled>
<%
	}
%> 
  <input type="button" value="�ͻ����۱�" onClick="window.open('/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp?khbh=<%=khbh%>')">
  <input type="button" onClick="window.open('/gcgl/bzgqgl/ViewCrm_khsglcb.jsp?khbh=<%=khbh%>')" value="ʩ�����̱�">
  <input type="button" onClick="window.open('/dzbj/zxbjmx/ViewHbzbBj_fjxx.jsp?khbh=<%=khbh%>')"  value="����ָ��">
  <input type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
  <input type="button" onClick="window.open('/khxx/zkzsxx.jsp?khbh=<%=khbh%>')" value="�ۿ�����">
  <input type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="�������ϵ�">
  <input type="button" onClick="window.open('/khxx/Cw_sgdzqjsCxList.jsp?khbh=<%=khbh%>')" value="����������">
</div>
<HR>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2" bgcolor="#E8E8FF">
  <tr>
    <td width="10%" align="right" bgcolor="#FFFFFF">�ͻ�����:</td>
    <td width="31%" bgcolor="#FFFFFF"><%=crm_khxx_khxm%>��
      <input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="�鿴�绰" >
��(
<%
	cf.radioToken(out, "M+��&W+Ů",crm_khxx_xb,true);
%>
) </td>
    <td width="9%"  align="right" bgcolor="#FFFFFF">�ֹ�˾</td>
    <td width="24%"  align="left" bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
	%></td>
    <td align="right" bgcolor="#FFFFFF" >�ͻ����:</td>
    <td align="left" bgcolor="#FFFFFF" ><%=khbh%></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#FFFFFF">���ݵ�ַ:</td>
    <td bgcolor="#FFFFFF"><%=crm_khxx_fwdz%></td>
    <td  align="right" bgcolor="#FFFFFF">����</td>
    <td  align="left" bgcolor="#FFFFFF"><%cf.selectItem(out,"select dwbh,dwmc||'��'||dwdh||'��' from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
	%></td>
    <td width="9%" align="right" bgcolor="#FFFFFF" >��ͬ��:</td>
    <td width="17%" align="left" bgcolor="#FFFFFF" ><%=hth%></td>
  </tr>
  <tr> 
    <td align="right" bgcolor="#FFFFFF">���ʦ:</td>
    <td bgcolor="#FFFFFF">
	<%=crm_khxx_sjs%>��<%=sjsdh%>����
	���������:
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
	%></td>
    <td align="right" bgcolor="#FFFFFF" >&nbsp;</td>
    <td bgcolor="#FFFFFF" >&nbsp;</td>
    <td align="right" bgcolor="#FFFFFF">�����ͬ��:</td>
    <td bgcolor="#FFFFFF"><%=smhtbh%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">�������ʦ:</td>
    <td bgcolor="#FFFFFF"><%=qtsjs%></td>
    <td align="right" bgcolor="#FFFFFF">��ĿרԱ:</td>
    <td bgcolor="#FFFFFF"><%=xmzy%>��<%=xmzydh%>��</td>
    <td align="right" bgcolor="#FFFFFF">����֤��:</td>
    <td bgcolor="#FFFFFF"><%=crm_khxx_sfzhm%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">Ԥ��Ա:</td>
    <td bgcolor="#FFFFFF"><%=ysy%></td>
    <td align="right" bgcolor="#FFFFFF">�ܼ�:</td>
    <td bgcolor="#FFFFFF"><%=gj%>��<%=gjdh%>��</td>
    <td align="right" bgcolor="#FFFFFF">���ۼ���:</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'",bjjb,true);
%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">�ͻ�����:</td>
    <td bgcolor="#FFFFFF"><%=khjl%>��<%=khjldh%>��</td>
    <td align="right" bgcolor="#FFFFFF">����:</td>
    <td bgcolor="#FFFFFF"><%=dd%>��<%=dddh%>��</td>
    <td align="right" bgcolor="#FFFFFF">��ϵ�ͻ�:</td>
    <td bgcolor="#FFFFFF"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",crm_khxx_khlxbm,true);
%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">ҵ��Ա:</td>
    <td bgcolor="#FFFFFF">
	<%=ywy%>��<%=ywydh%>����
	����С��:
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"'",ywyssxz,true);
%></td>
    <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td align="right" bgcolor="#FFFFFF">�ͻ�����:</td>
    <td bgcolor="#FFFFFF"><%=crm_khxx_zt%></td>
  </tr>
  
  
  <tr>
      <td align="right" bgcolor="#FFFFFF">ʩ����:</td>
	  <td colspan="5" bgcolor="#FFFFFF">
	    �ӳ�:<%=sgdmc%>��<%=sgddh%>����
		�೤:<%=crm_khxx_sgbz%>��<%=bzdh%>����
		ľ��:<%=mgfrz%>��
		���߹�:<%=nwgfrz%>��
		ˮ�繤:<%=sdgfrz%>��
		���Ṥ:<%=yqgfrz%>	  </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">�ʼ�:</td>
    <td colspan="5" bgcolor="#FFFFFF">
		�ʼ�:<%=crm_khxx_zjxm%>��<%=zjdh%>����
		ľ������:<%=mgjl%>��
		���߹�����:<%=nwgjl%>��
		ˮ�繤����:<%=sdgjl%>��
		���Ṥ����:<%=yqgjl%>	</td>
  </tr>
</table>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="1">
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>���̽���</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td align="center" width="2%">&nbsp;</td>
          <td colspan="2" align="center" bgcolor="#E8E8FF">��ͬ��� </td>
          <td width="4%" align="center">&nbsp; </td>
          <td align="center" bgcolor="#E8E8FF" colspan="2">ʵ����� </td>
          <td width="2%" align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td width="2%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"> <b>ǩԼ����</b>:<%=crm_khxx_qyrq%>          </td>
          <td width="4%" align="right">&nbsp;</td>
          <td bgcolor="#CCFFCC"><b>���̽���</b>:
            <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_khxx_gcjdbm,true);
%>
            <%=tgbz%></td>
          <td bgcolor="#CCFFCC"><strong>Ԥ���깤</strong>:<%=jhwgsj%></td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>���齻������</b>:<%=crm_khxx_jyjdrq%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC"><b>ʵ�ʿ���</b>��<%=crm_khxx_sjkgrq%></td>
          <td bgcolor="#CCFFCC"><b>ʵ���깤</b>��<%=crm_khxx_sjjgrq%></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>��ͬ����</b>:<%=crm_khxx_kgrq%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC"><b>���ս���</b>:
			<%cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where gcysxmbm='"+zqysxmbm+"'",zqysxmbm,true);%>		  </td>
          <td bgcolor="#CCFFCC"><b>�Ҿ����ʱ��</b>:<%=jjwjsj%></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>��ͬ�깤</b>:<%=crm_khxx_jgrq%></td>
          <td>&nbsp;</td>
          <td bgcolor="#CCFFCC"><b>����ʱ��</b>��<%=szqsj%></td>
          <td bgcolor="#CCFFCC"><b>�ͻ����ʱ��</b>:<%=sjwjrq%></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td width="2%">&nbsp;</td>
          <td colspan="2" bgcolor="#CCFFCC"><b>��ͬ����</b>:<%=gqts%>��&nbsp;&nbsp;&nbsp;&nbsp;<b>���ڵ�</b>��<%=hzts%>��</td>
          <td width="4%">&nbsp;</td>
          <td width="37%" bgcolor="#CCFFCC"><b>�Ҿ����</b>:
          <% cf.radioToken(out, "Y+���&N+��",jjwjbz,true);%></td>
          <td width="27%" bgcolor="#CCFFCC"><b>�˵�ʱ��</b>:<%=tdsj%></td>
          <td width="2%">&nbsp; </td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="1" cellspacing="1">
      <tr>
        <td width="49%" valign="top"><table width="100%" border="0" style="FONT-SIZE:13" cellpadding="0" cellspacing="3">
            <tr align="center" bgcolor="#FFFFFF">
              <td>&nbsp;</td>
              <td bgcolor="#E8E8FF"><strong>��ͬ</strong></td>
              <td bgcolor="#E8E8FF"><strong>����</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="35%" align="right" bgcolor="#E8E8FF"><strong>���;�ֵ��</strong></td>
              <td width="32%" align="center" bgcolor="#CCFFCC"><%=hdzsjz%> </td>
              <td width="33%" align="center" bgcolor="#CCFFCC"><%=zxzsjz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>���ʹ���ȯ��</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=djjje%></td>
              <td align="center" bgcolor="#CCFFCC"><%=(djjje+zjxdjjje)%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="35%" align="right" bgcolor="#E8E8FF"><strong>��ͬ��ֵ��</strong></td>
              <td width="32%" align="center" bgcolor="#CCFFCC"><%=htjz%> </td>
              <td width="33%" align="center" bgcolor="#CCFFCC"><%=zxhtjz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>ҵ����ֵ������</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=yjjzcs%>%</td>
              <td align="center" bgcolor="#CCFFCC">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>ҵ����ֵ</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=yjjz%></td>
              <td align="center" bgcolor="#CCFFCC"><%=zxyjjz%></td>
            </tr>
        </table></td>
        <td width="2%" bgcolor="#E8E8FF">&nbsp;</td>
        <td width="49%" valign="top"><table width="100%" border="0" style="FONT-SIZE:13" cellpadding="0" cellspacing="3">
            <tr align="center" bgcolor="#FFFFFF">
              <td width="35%">&nbsp;</td>
              <td width="32%" bgcolor="#E8E8FF"><strong>��ͬ</strong></td>
              <td width="33%" bgcolor="#E8E8FF"><strong>����</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>�˸��ɱ�</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=sgcbj%></td>
              <td align="center" bgcolor="#CCFFCC"><%=zxsgcbj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>�˸�ë����</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=mle%></td>
              <td align="center" bgcolor="#CCFFCC"><%=zxmle%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>�˸�ë����</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=mll%>%</td>
              <td align="center" bgcolor="#CCFFCC"><%=zxmll%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>�������۶�</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=zchtje%></td>
              <td align="center" bgcolor="#CCFFCC"><%=zczxje%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>���ĳɱ�</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=zchtcb%></td>
              <td align="center" bgcolor="#CCFFCC"><%=zczxcb%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>����ë����</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=zchtml%>%</td>
              <td align="center" bgcolor="#CCFFCC"><%=zczxml%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#E8E8FF"><strong>�ͻ�ë����</strong></td>
              <td align="center" bgcolor="#CCFFCC"><%=khhtml%>%</td>
              <td align="center" bgcolor="#CCFFCC"><%=khzxml%>%</td>
            </tr>
            </table>
		  <P>
            <input  type="button" onClick="window.open('ViewAllBj.jsp?khbh=<%=khbh%>','','height=650, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=n o, status=no')" value="��ͬ�ɱ���ϸ">
            <input  type="button" onClick="window.open('ViewZxcbj.jsp?khbh=<%=khbh%>','','height=650, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=n o, status=no')" value="���³ɱ���ϸ">
            <input type="button" onClick="window.open('ViewZcysb.jsp?khbh=<%=khbh%>','','height=650, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=n o, status=no')" value="����Ԥ���">
            <input type="button" onClick="window.open('ViewZcjsb.jsp?khbh=<%=khbh%>','','height=650, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=n o, status=no')" value="���Ľ����">
			<input  type="button" onClick="window.open('ViewYsspb.jsp?khbh=<%=khbh%>')" value="Ԥ��������">
			
		  </td>
      </tr>
    </table></td>
 </tr>
 <tr bgcolor="#FFFFFF">
    <td colspan="2" align="center" bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:13" cellpadding="0" cellspacing="1" bgcolor="#999999">
      
      <tr align="center" bgcolor="#E8E8FF">
        <td width="12%">�ۿ�����</td>
        <td width="7%">�����ۿ�</td>
        <td width="10%">ֱ�Ӽ�����</td>
        <td width="7%">���̷��ۿ�</td>
        <td width="10%">���̷Ѽ����</td>
        <td width="8%">�������ۿ�</td>
        <td width="10%">�����Ѽ����</td>
        <td width="10%">�����Ѱٷֱ�</td>
        <td width="8%">˰���ۿ�</td>
        <td width="10%">�����</td>
        <td width="8%">˰��ٷֱ�</td>
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
        <td colspan="2" bgcolor="#CCFFCC"><strong>��ͬ</strong></td>
        <td colspan="2" bgcolor="#CCFFCC"><strong>������</strong></td>
        <td colspan="2" bgcolor="#CCFFCC"><strong>��ͬ��������</strong></td>
        <td width="32%" rowspan="2" bgcolor="#CCFFCC"><strong>��Ŀ˵��</strong></td>
      </tr>
      <tr align="center" bgcolor="#CCFFCC">
        <td width="9%">��ǰ</td>
        <td width="9%">�ۺ�</td>
        <td width="9%">��ǰ</td>
        <td width="9%">�ۺ�</td>
        <td width="9%">��ǰ</td>
        <td width="9%">�ۺ�</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><strong>���̷�</strong></td>
        <td align="center"><%=zqgczjf%></td>
        <td align="center"><%=zhgczjf%></td>
        <td align="center"><%=zjxje%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zhzjxje%></td>
        <td align="center"><strong><%=cf.formatDouble(zqgczjf+zjxje)%></strong></td>
        <td align="center"><strong><%=cf.formatDouble(zhgczjf+zhzjxje)%></strong></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><strong>������(<%=glfbfb%>%)</strong></td>
        <td align="center"><%=zqguanlif%></td>
        <td align="center"><%=guanlif%></td>
        <td align="center"><%=zqzjxguanlif%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zjxguanlif%></td>
        <td align="center"><strong><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></strong></td>
        <td align="center"><strong><%=cf.formatDouble(guanlif+zjxguanlif)%></strong></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><strong>˰��(<%=suijinbfb%>%)</strong></td>
        <td align="center"><%=zqsuijin%></td>
        <td align="center"><%=suijin%></td>
        <td align="center"><%=zqzjxsuijin%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zjxsuijin%></td>
        <td align="center"><strong><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></strong></td>
        <td align="center"><strong><%=cf.formatDouble(suijin+zjxsuijin)%></strong></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFCC">
        <td align="right"><strong>����С��</strong></td>
        <td align="center"><%=cf.formatDouble(zqgczjf+zqguanlif+zqsuijin)%></td>
        <td align="center"><%=cf.formatDouble(zhgczjf+guanlif+suijin)%></td>
        <td align="center"><%=cf.formatDouble(zjxje+zqzjxguanlif+zqzjxsuijin)%></td>
        <td align="center"><%=cf.formatDouble(zhzjxje+zjxguanlif+zjxsuijin)%></td>
        <td align="center"><strong><%=cf.formatDouble(zqgczjf+zqguanlif+zqsuijin+zjxje+zqzjxguanlif+zqzjxsuijin)%></strong></td>
        <td align="center"><strong><%=cf.formatDouble(zhgczjf+guanlif+suijin+zhzjxje+zjxguanlif+zjxsuijin)%></strong></td>
        <td><span class="STYLE2">���̷ѣ������ѣ�˰��</span></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><font color="#0000FF">����ҵ��������Ŀ</font></td>
        <td align="center"><%=zqqtsf%></td>
        <td align="center"><%=zhqtsf%></td>
        <td align="center"><%=zqqtsfzjx%></td>
        <td align="center" bgcolor="#CCFFCC"><%=zhqtsfzjx%></td>
        <td align="center"><%=cf.formatDouble(zqqtsf+zqqtsfzjx)%></td>
        <td align="center"><%=cf.formatDouble(zhqtsf+zhqtsfzjx)%></td>
        <td><%=qtsfsm%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><font color="#0000FF">������ҵ��������Ŀ</font></td>
        <td align="center"><%=zqwjrqyexm%></td>
        <td align="center"><%=zhwjrqyexm%></td>
        <td align="center"><%=zqwjrzjx%></td>
        <td align="center"><%=zhwjrzjx%></td>
        <td align="center"><%=cf.formatDouble(zqwjrqyexm+zqwjrzjx)%></td>
        <td align="center"><%=cf.formatDouble(zhwjrqyexm+zhwjrzjx)%></td>
        <td><%=wjrqyexmsm%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><font color="#0000FF">��Ʒ�</font></td>
        <td align="center"><%=zqsjf%></td>
        <td align="center"><%=sjf%></td>
        <td align="center"><%=zqsjfzjx%></td>
        <td align="center"><%=zhsjfzjx%></td>
        <td align="center"><%=cf.formatDouble(zqsjf+zqsjfzjx)%></td>
        <td align="center"><%=cf.formatDouble(sjf+zhsjfzjx)%></td>
        <td>��Ʒ��ۿ�:<%=sjfzk%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right">ֱ�Ӽ�����</td>
        <td align="center">&nbsp;</td>
        <td align="center"><%=-1*zjjmje%></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFCCFF">
        <td align="right"><span class="STYLE2">ʵ�ʷ����ܶ�</span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(wdzgce)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(qye)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(zqljzjx)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(zhljzjx)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(wdzgce+zqljzjx)%></span></td>
        <td align="center"><span class="STYLE2"><%=cf.formatDouble(qye+zhljzjx)%></span></td>
        <td><span class="STYLE2">���̷ѣ������ѣ�˰��������Ŀ����Ʒ�</span></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="right" bgcolor="#CCFFCC"><span class="STYLE3">���ķ�</span></td>
        <td align="center"><%=zqhtzcbj%></td>
        <td align="center"><%=zhhtzcbj%></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center"><%=zqhtzcbj%></td>
        <td align="center"><%=zhhtzcbj%></td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td bgcolor="#FFFFFF" align="center"><b>��װʵ��</b></td>
    <td><table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="3">
      <tr bgcolor="#E8E8FF">
        <td align="center">&nbsp;</td>
        <td width="16%" align="center">ʵ�տ�(<%=sskbfb%>%)</td>
        <td align="center" width="16%">�տ�����</td>
        <td align="center" width="18%">�״θ���ʱ��</td>
        <td align="center" width="19%">�������ʱ��</td>
        <td align="center" width="15%">����տ����</td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="center">�����񣫵��棩�տ�</td>
        <td align="center"><%=sfke%>��</td>
        <td align="center"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+jzkfkcs+"'",jzkfkcs,true);
		%></td>
        <td align="center"><%=jzkscsj%></td>
        <td align="center"><%=jzkfksj%></td>
        <td align="center"><%=jzkfkxh%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td align="center">�����տ�</td>
        <td align="center"><%=cwsfke%>��</td>
        <td align="center"><%
		cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs where fkcs='"+cwjzkfkcs+"'",cwjzkfkcs,true);
		%></td>
        <td align="center"><%=cwjzkscsj%></td>
        <td align="center"><%=cwjzkfksj%></td>
        <td align="center"><%=cwjzkfkxh%></td>
      </tr>
      <tr bgcolor="#CCFFCC">
        <td width="16%" align="right">�����:<%=fkfamc%></td>
        <td>β��ȫ��:<%=jzwkqs%></td>
        <td width="16%" bgcolor="#CCFFCC">ǩ����תʱ��:<%=yjjzsj%></td>
        <td width="18%" align="center">�˵���תʱ��:<%=tdyjjzsj%></td>
        <td width="19%">������ʵ�տ�:<%=zjxssk%></td>
        <td width="15%">ʵ����Ʒ�:<%=sssjf%></td>
      </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center">&nbsp;</td>
    <td width="97%"><table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="3">
        
        <tr bgcolor="#CCFFCC"> 
          <td width="20%" align="center" bgcolor="#CCFFCC">��������ɱ�־</td>
          <td width="20%" align="center" bgcolor="#CCFFCC">������������</td>
          <td width="20%" align="center" bgcolor="#CCFFCC">���������ʱ��</td>
          <td width="20%" align="center" bgcolor="#CCFFCC">����۹�����</td>
          <td width="20%" align="center" bgcolor="#CCFFCC">�����������ۿ�</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="20%" align="center" bgcolor="#CCFFCC"><%cf.selectToken(out,"1+δ���&2+�����",zjxwcbz,true);%></td>
          <td width="20%" align="center" bgcolor="#CCFFCC"><%=zjxxh%></td>
          <td width="20%" align="center" bgcolor="#CCFFCC"><%=zjxsj%></td>
          <td width="20%" align="center" bgcolor="#CCFFCC"><%=kglf%></td>
          <td width="20%" align="center" bgcolor="#CCFFCC"><%=kqtk%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�����Ż�</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%">�ۺ��ۿ�:<%=zkl%></td>
          <td width="25%">�����:<%=glf%></td>
          <td width="25%">�Ƿ�����֤:
            <%
	cf.radioToken(out, "Y+��&N+��",crm_khxx_sfyrz,true);
%>          </td>
          <td width="25%">��֤�г�:
            <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%>          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>���ķ��ۿ�:<%=clfzk%></td>
          <td>���ķ��ۿ�:<%=zcfzk%></td>
          <td>�˹����ۿ�:<%=rgfzk%></td>
        </tr>
        <tr>
          <td>������ۿ�:<%=ysfzk%></td>
          <td>��е���ۿ�:<%=jxfzk%></td>
          <td>��ķ��ۿ�:<%=shfzk%></td>
          <td>�������ۿ�:<%=qtfzk%></td>
        </tr>
        <tr>
          <td width="25%">��˾�:<%=cxhdbm%></td>
          <td width="25%">С���:<%=cxhdbmxq%></td>
          <td width="25%">չ��:<%=cxhdbmzh%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr> 
          <td width="25%">�Ƿ����Ż�:
            <%
	cf.radioToken(out, "Y+��&N+��",crm_khxx_sfyyh,true);
%>          </td>
          <td colspan="3">�Ż�����:<%=crm_khxx_yhyy%></td>
        </tr>
        <tr> 
          <td width="25%">�Ƿ�ȯ:
            <%
	cf.radioToken(out, "Y+��&N+��",crm_khxx_sffj,true);
%>          </td>
          <td width="25%">��ȯ�ܶ�:<%=fjje%></td>
          <td width="25%">��˾�е���ȯ��:<%=gsfje%></td>
          <td width="25%">��ȯ�Ƿ�ع�˾:
            <%
	cf.radioToken(out, "Y+��&N+��",fjhgs,true);
%>          </td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�ɵ�</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%" > <b>�ɵ�״̬</b>:
            <%
	cf.selectToken(out,"1+�����ɵ�&2+�˹��ɵ�&5+�����ɵ�&6+��Ȩ�ɵ�&7+�ܾ��ӵ�&8+��ʩ����&4+�����޸��ɵ�",crm_khxx_pdclzt,true);
%></td>
          <td width="25%" ><b>�ɵ�ʱ��:<%=crm_khxx_pdsj%></b> </td>
          <td width="25%" > <b>�ɵ���</b>:<%=crm_khxx_pdr%></td>
          <td width="25%" ><b>�ɵ�����</b>:
            <%
	cf.selectToken(out,"0+�˹��ɵ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&5+�󵥵�С��&6+С���ִ�&7+�������&8+�����ɵ�&9+ͬС���ɵ�&A+�ܾ��ӵ�&B+��ʩ����",crm_khxx_jlbz,true);
%></td>
        </tr>
        <tr> 
          <td colspan="2" ><b>�ɵ�˵��</b>:<%=crm_khxx_pdsm%></td>
          <td ><b>�ص���־</b>:
            <%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm where hdlxbm='"+crm_khxx_hdbz+"'",crm_khxx_hdbz,true);
%></td>
          <td width="25%" ><b>�ص��Ƿ���ʵ:</b>
            <%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ",crm_khxx_hdsfss,true);
%><b></b></td>
        </tr>
        <tr> 
          <td width="25%" ><b>�� �� ��:</b><%=crm_khxx_hdr%></td>
          <td ><strong>���ضӳ��೤</strong>:<%=hdsgd%>��<%=hdsgbz%></td>
          <td colspan="2" ><b>�ص�<strong>����</strong></b>:<%=crm_khxx_cgdz%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>����֤</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
        <tr> 
          <td width="25%"><b>����֤��־</b>:
            <%
	cf.radioToken(out,"Y+�ѳ�����֤&N+δ������֤",kgzbz,true);
%></td>
          <td width="25%"><b>��֤ʱ��</b>:<%=kgzsj%></td>
          <td width="25%"><b>��֤��</b>:<%=kgzr%></td>
          <td width="25%"><b>���Ϸ�</b>:<%=clf%></td>
        </tr>
        <tr> 
          <td colspan="3"><b>����֤��ע</b>:<%=kgzsm%></td>
          <td width="25%"><b>ʩ����</b>:<%=sge%> </td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�ط���Ϣ</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>�Ƿ���ط�</b>:
            <%
	cf.selectToken(out,"Y+��ط�&N+����ط�",crm_khxx_sfxhf,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>Ӧ�ط�����</b>:<%=crm_khxx_hfrq%></td>
          <td width="25%"><b>Ӧ�ط�����</b>:
            <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",crm_khxx_hflxbm,true);
%></td>
          <td width="25%"><b>�ϴ�����ط�</b>:<%=sjhfsj%></td>
        </tr>
        
        
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>�طö����־</b>:
            <%
	cf.selectToken(out,"0+δ����&1+���̻طö���&2+Ͷ�߱��޻طö���&3+ȫ������",crm_khxx_hfdjbz,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>����ʱ��</b>:<%=crm_khxx_djsj%></td>
          <td width="25%"><b>������</b>:<%=crm_khxx_djr%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>�ƻ��ⶳʱ��</b>:<%=crm_khxx_jhjdsj%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>ʵ�ʽⶳʱ��</b>:<%=crm_khxx_sjjdsj%></td>
          <td width="25%"><b>�ⶳ��</b>:<%=crm_khxx_jdr%></td>
          <td width="25%"><b>���¶�����</b>:<%=crm_khxx_djbh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"><b>����ԭ��</b>:<%=crm_khxx_djyy%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>����</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#E8E8FF"> 
          <td width="25%" bgcolor="#E8E8FF"><b>��װ��װ</b>:
            <%
	cf.selectToken(out,"1+��װ&2+��װ",jzbz,true);
%></td>
          <td width="25%">װ�޼�λ:
            <%
		cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",crm_khxx_zxjwbm,true);
	%></td>
          <td width="25%"><b>�ͻ�������ϵ��ʽ:</b>
            <%
	cf.selectToken(out,"1+�绰��ϵ&2+������&3+��������",jslxfs,true);
%></td>
          <td width="25%"><b>��ͻ���ϵʱ��:</b><%=ykhlxsj%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>��ɫ</b>&lt;<b>����</b>&gt;:
            <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",crm_khxx_ysbm,true);
%>
            &lt;
            <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",crm_khxx_czbm,true);
%>&gt;</td>
          <td colspan="3"><b>��ĿרԱ��ϵ˵��:</b><%=lxsm%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>ˮ�ʷ�������</b>:<%=hykh%></td>
          <td width="25%"><b>ˮ�ʷ���������</b>:
            <%
	cf.selectItem(out,"select hyklxbm,hyklxmc from dm_hyklxbm order by hyklxbm",hyklxbm,true);
%></td>
          <td width="25%"><b>��Ա��Ч��</b>:<%=yxsjs%> </td>
          <td width="25%"><b>��Ա��Чֹ</b>:<%=yxsjz%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>ˮ�ʷ������Ƿ񷢷�</b>:
            <%
	cf.radioToken(out, "Y+����&N+δ����",sffk,true);
%></td>
          <td width="25%"><b>�Ǽǿ���</b>:<%=djkh%></td>
          <td width="25%"><b>��������</b>:<%=fkrq%></td>
          <td width="25%"><b>�Ƿ����ȩ</b>:
            <%
	cf.selectToken(out,"1+����Ҫ&2+��Ҫ&3+�����",sfcjq,true);
%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>�Ƿ����ϱ���</b>:
            <%
	cf.radioToken(out, "1+δ�ϱ���&2+�ѱ���",sfysbx,true);
%></td>
          <td width="25%"><b>��������</b>:<%=baokssj%></td>
          <td width="25%"><b>������ֹ</b>:<%=baozzsj%></td>
          <td width="25%"><b>�Ƿ������</b>:
            <%
	cf.selectToken(out,"1+����Ҫ&2+��Ҫ&3+�����",sffby,true);
%></td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td width="25%"><b>����ͻ���־</b>:
            <%
	cf.selectToken(out,"Y+��&N+��",wtkhbz,true);
%></td>
          <td width="25%"><b>¼����</b>:<%=wtkhlrr%></td>
          <td width="25%"><b>¼��ʱ��</b>:<%=wtkhlrsj%></td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr bgcolor="#E8E8FF"> 
          <td colspan="4"><b>����ͻ�˵��</b>:<%=wtkhsm%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>�����Ϣ</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="4">
        <tr bgcolor="#CCFFCC"> 
          <td width="25%" bgcolor="#CCFFCC"><b>��ͬ��˱�־</b>:
            <%
	cf.selectToken(out,"N+δ���&P+���ɵ�&Y+������",crm_khxx_htshbz,true);
%></td>
          <td width="25%" bgcolor="#CCFFCC"><b>�����</b>:<%=crm_khxx_htshr%></td>
          <td width="25%"><b>���ʱ��</b>:<%=crm_khxx_htshsj%></td>
          <td width="25%"><b>��˵÷�</b>:<%=crm_khxx_htshdf%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="4"><b>��ͬ������</b>:<%=crm_khxx_htshyj%></td>
        </tr>
      </table>    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="3%" bgcolor="#FFFFFF" align="center"><b>������Ϣ</b></td>
    <td width="97%"> 
      <table width="100%" border="0" style="FONT-SIZE:13" cellpadding="2" cellspacing="2">
        <tr bgcolor="#E8E8FF" align="center"> 
          <td width="20%"><font color="#000099"><b>�ͻ�����:
            <%
	cf.selectToken(out,"N+δ����&Y+�ѽ���",khjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>���ʦ����:
            <%
	cf.selectToken(out,"0+δ����&1+ǩ������&2+�깤����",sjsjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>���ӽ���:
            <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+crm_khxx_gdjsjd+"'",crm_khxx_gdjsjd,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>�ʼ����:
            <%
	cf.selectToken(out,"0+δ����&1+�ѽ���",zjjsbz,true);
%></b></font></td>
          <td width="20%"><font color="#000099"><b>ҵ��Ա����:
            <%
	cf.selectToken(out,"0+δ����&1+ǩ������&2+�깤����",ywyjsbz,true);
%></b></font></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>���̿ۿ�</b>:<%=gckk%></td>
          <td bgcolor="#CCFFCC"><b>ǩ���������</b>:<%=sjstcbl%>%</td>
          <td><b>�����¼��</b>:<%=gdjsjlh%></td>
          <td><b>�������</b>:<%=zjjsbl%>%</td>
          <td><b>ǩ���������</b>:<%=ywyqdjsbl%>%</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>���ʦ�е�����</b>:<%=sjsfy%></td>
          <td bgcolor="#CCFFCC"><b>ǩ��������</b>:<%=qdsyjsje%></td>
          <td>�ͻ�������:<%=khjsje%></td>
          <td><b>������</b>:<%=zjjsje%></td>
          <td><b>ǩ��������</b>:<%=ywyqdjsje%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>ʩ���ӳе�����</b>:<%=sgdfy%></td>
          <td bgcolor="#CCFFCC"><b>ǩ�������¼��</b>:<%=sjsjsjlh%></td>
          <td>&nbsp;</td>
          <td><b>�����¼��</b>:<%=zjjsjlh%></td>
          <td><b>ǩ�������¼��</b>:<%=ywyjsjlh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>�ʼ�е�����</b>:<%=zjfy%></td>
          <td bgcolor="#CCFFCC"><b>�깤�������</b>:<%=sjswgtcbl%>%</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>�깤�������</b>:<%=ywywgjsbl%>%</td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>��˾�е�����</b>:<%=gsfy%></td>
          <td bgcolor="#CCFFCC"><b>�깤������</b>:<%=wgtcje%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>�깤������</b>:<%=ywywgjsje%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td bgcolor="#CCFFCC"><b>�������е�����</b>:<%=qtfy%></td>
          <td bgcolor="#CCFFCC"><b>�깤�����¼��</b>:<%=wgjsjlh%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><b>�깤�����¼��</b>:<%=ywywgjsjlh%></td>
        </tr>
        <tr bgcolor="#CCFFCC"> 
          <td colspan="5"><b>���̿ۿ�������־</b>:
            <%cf.selectToken(out,"N+δ����&Y+������",gckkspbz,true);%></td>
        </tr>
      </table>    </td>
  </tr>
</table>

<center>
  <b><font color="#0000FF">�������˵��</font></b> 
</center>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF"> 
    <td width="14%" align="right"> �ɱ��ޱ�־    </td>
    <td width="32%"> <%
	cf.selectToken(out,"Y+����&M+���ֱ���&N+������&0+δ����&1+Ԥ��������",kbxbz,true);
%> </td>
    <td width="19%" align="right"> ����ͬ����    </td>
    <td width="35%"><%=crm_khxx_jhtrq%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="14%" align="right" bgcolor="#E8E8FF">���޿�ʼʱ��</td>
    <td width="32%"><%=bxkssj%></td>
    <td width="19%" align="right">���޽�ֹʱ��</td>
    <td width="35%"><%=crm_khxx_bxjzsj%></td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td width="14%" align="right">����˵��</td>
    <td colspan="3"><%=bybxsm%></td>
  </tr>
</table>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="6%">����</td>
	  <td width="40%">��Ŀ����</td>
      <td width="54%">���˵��</td>
    </tr>
    <%
		String bxxm="";
		String sfbx="";
		String qksm="";
		String mark="";
		ls_sql="SELECT bxxm,DECODE(sfbx,'Y','����','N','<font color=\"#FF0000\">������</font>') sfbx,qksm";
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
      <input type="button" value="��ʩ���Ӽ�¼" onClick="window.open('Pd_hsgdjlCxList.jsp?khbh=<%=khbh%>')"  >
      <input type="button" value="���ʼ��¼" onClick="window.open('Pd_hzjjlCxList.jsp?khbh=<%=khbh%>')"  >
      <input type="button" value="�ؼ���Ϣ�޸ļ�¼" onClick="window.open('ViewCrm_sjsxgjl.jsp?khbh=<%=khbh%>')"  >    </td>
  </tr>
  <tr bgcolor="#E8E8FF" align="center"> 
    <td colspan="4"> 
      <input type="button" value="���̽��ȵǼ�" onClick="window.open('Crm_gcjddjjlCxList.jsp?khbh=<%=khbh%>')"  >
      <input type="button" value="������ϸ" onClick="window.open('Crm_gcyqyymxCxList.jsp?khbh=<%=khbh%>')"  >
      <input type="button" value="������ϸ" onClick="window.open('/gcgl/gcjdgz/gqhz/ViewCrm_gcjddjjl.jsp?khbh=<%=khbh%>')"  >    </td>
  </tr>

  <tr>
    <td bgcolor="#CCCCFF" align="right">��Ϣ��Դ</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=xxly%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">��Ϣ��Դ˵��</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=xxlysm%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">����:С��:���ƺ�</td>
    <td colspan="3" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+crm_khxx_cqbm+"'",crm_khxx_cqbm,true);
%>
      :<%=crm_khxx_xqbm%>:<%=louhao%></td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">�ȵ����������λ�ã�</td>
    <td width="28%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where rddqbm='"+rddqbm+"'",rddqbm,true);
%>
      ��
      <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where hxwzbm='"+hxwzbm+"'",hxwzbm,true);
%>�� </td>
    <td width="18%" bgcolor="#CCCCFF" align="right">ְҵ���������䣩</td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",crm_khxx_zybm,true);
%>
      ��
      <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm,true);
%>�� </td>
  </tr>
  <tr> 
    <td width="19%" bgcolor="#CCCCFF" align="right">�����루���ۣ�</td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm where ysrbm='"+ysrbm+"'",ysrbm,true);
%>
      ��<%=crm_khxx_fj%>��</td>
    <td width="18%" bgcolor="#CCCCFF" align="right">������ȡ��־</td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectToken(out,"1+δ��ȡ����&2+����ȡ����&3+�����ѹ黹",dalqbz,true);
%></td>
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
    <td width="19%" align="right">��������¼����:ʱ��</td>
    <td width="28%"><%=yqlrr%>:<%=yqlrsj%></td>
    <td width="18%" align="right">�����Ƿ�����:����</td>
    <td width="35%"><%
	cf.selectToken(out,"1+δ����&2+����",gcsfyq,true);
	%>
:<%=yqts%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">����˵��</td>
    <td colspan="3"><%=yqsm%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td align="right" width="19%">&nbsp;</td>
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
</table>


<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      ������־    </td>
    <td width="28%"> <%
	cf.selectToken(out,"Y+��&N+��",crm_khxx_ybjbz,true);
%> </td>
    <td width="18%" align="right"> 
      �����Ǽ�ʱ��    </td>
    <td width="35%"><%=crm_khxx_ybjdjsj%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      ����    </td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select yqbm,yqmc from dm_yqbm order by yqbm",crm_khxx_yqbm,true);
%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      �������Ч��    </td>
    <td width="35%" bgcolor="#CCCCFF"><%=crm_khxx_ybjyxq%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      ����    </td>
    <td width="28%" bgcolor="#CCCCFF"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",crm_khxx_hxbm,true);
%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      ���    </td>
    <td width="35%" bgcolor="#CCCCFF"><%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",crm_khxx_fgflbm,true);
%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      �ι��������    </td>
    <td width="28%" bgcolor="#FFFFFF"> <%=crm_khxx_ybjbh%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF"> 
      ������Ƿ���ʵ    </td>
    <td width="35%" bgcolor="#FFFFFF"> <%
	cf.selectToken(out,"0+δ��ʵ&Y+��ʵ&N+����ʵ",crm_khxx_ybjss,true);
%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      ������־    </td>
    <td width="28%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"N+δ����&Y+�ѿ���",crm_khxx_kpbz,true);
%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="35%" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      Ͷ�߱�־    </td>
    <td width="28%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"Y+��Ͷ��&N+��Ͷ��",crm_khxx_tsbz,true);
%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF"> 
      Ͷ�߼�¼��    </td>
    <td width="35%" bgcolor="#FFFFFF"><%=crm_khxx_tsjlh%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      ���ޱ�־    </td>
    <td width="28%" bgcolor="#CCCCFF"><%
	cf.selectToken(out,"Y+�б���&N+�ޱ���",crm_khxx_bxbz,true);
%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      ���޼�¼��    </td>
    <td width="35%" bgcolor="#CCCCFF"><%=crm_khxx_bxjlh%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF"> 
      ��Ϣ¼����    </td>
    <td width="28%" bgcolor="#FFFFFF"> <%=crm_khxx_lrr%> </td>
    <td width="18%" align="right" bgcolor="#FFFFFF"> 
      ¼��ʱ��    </td>
    <td width="35%" bgcolor="#FFFFFF"> <%=crm_khxx_lrsj%> </td>
  </tr>
  <tr> 
    <td width="19%" align="right" bgcolor="#FFFFFF">��ע</td>
    <td colspan="3" bgcolor="#FFFFFF"> <%=crm_khxx_bz%> </td>
  </tr>
</table>


<%
	if (ckjgbz.equals("Y"))
	{
		%>
		<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		 <tr bgcolor="#CCCCCC"  align="center">
			<td  width="9%">�շ���Ŀ</td>
			<td  width="8%">�շѼ��㷽ʽ</td>
			<td  width="4%">�ٷֱ�</td>
			<td  width="4%">������λ</td>
			<td  width="4%">����</td>
			<td  width="5%">����</td>
			<td  width="6%">��ǰ���</td>
			<td  width="3%">�����ۿ�</td>
			<td  width="6%">�ۺ���</td>
			<td  width="4%">����ǩԼ��</td>
			<td  width="4%">����˰��</td>
			<td  width="4%">���������</td>
			<td  width="4%">�Ƿ�ɴ���</td>
			<td  width="3%">����ۿ�</td>
			<td  width="5%">�շ���Ŀ����</td>
			<td  width="4%">ʩ���ӽ���</td>
			<td  width="20%">��ע</td>
		</tr>

		 <%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT sfxmmc,DECODE(bj_sfxmmx.sflx,'1','ֱ�ӷѰٷֱ�','2','�̶����(�ɸ�)','3','˰��','4','�̶����(���ɸ�)','5','������') sflx ";
		ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
		ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','����','2','<font color=\"#FF0000\"><B>������</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','����','2','������') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','����','2','������') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','���ɴ�','Y','�ɴ�') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(bj_sfxmmx.sfxmlx,'1','��ӹ��̷�','2','������ط�','3','��Ʒ�','9','����') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','��','Y','��') sfcysgdjs,bj_sfxmmx.bz";
		ls_sql+=" FROM bj_sfxmmx  ";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
		ls_sql+=" order by bj_sfxmmx.sfxmbm";

		pageObj.sql=ls_sql;
	//���ж����ʼ��
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

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