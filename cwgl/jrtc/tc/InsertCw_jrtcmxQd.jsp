<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String khzq=request.getParameter("khzq");

String sjsjsbz=null;
String fgsbh=null;
String dwbh=null;
String khjsbz=null;
String gcjdbm=null;
String hdbz=null;
String hdlxmc=null;
String sjs=null;
String khjl=null;
String clgw=null;
String zjxm=null;
int fwmj=0;
String bjjbbm="";
String bjjbmc="";
String tckh="";//1：非套餐；2：套餐

String dianz=null;//店长
String weny=null;//文员
String xqzg=null;//小区主管
String xqzz=null;//小区组长
String xqzy=null;//小区专员
String wlyxzg=null;//网络营销主管
String yxzy=null;//营销专员
String wzch=null;//网站策划
String wysj=null;//网页设计
String wzcxy=null;//网站程序员
String dhzy=null;//电话专员
String wztgy=null;//网站推广员
String siji=null;//司机


double wdzgce=0;
double qye=0;
double suijin=0;
double sjf=0;
double sjhtsjf=0;
double zhljzjx=0;

double ycf=0;//远程费
double zjxbl=0;//增减项比例
double dgzcje=0;//代购主材金额
double tcwzczx=0;//套餐外主材增项


//提成比例
double dzsjftcbl=0;
double dzzxftcbl=0;
double wyzxftcbl=0;
double khjlsjftcbl=0;
double khjlzxftcbl=0;
double sjssjftcbl=0;
double sjszxftcbl=0;
double sjsycftcbl=0;
double zjzxftcbl=0;
double zjycftcbl=0;

double clyzxftcbl=0;
double xqzgzxftcbl=0;
double xqzzzxftcbl=0;
double xqzyzxftcbl=0;
double wlyxzgzxftcbl=0;
double yxzyzxftcbl=0;
double wzchzxftcbl=0;
double wysjzxftcbl=0;
double wzcxyzxftcbl=0;
double dhzyzxftcbl=0;
double wztgyzxftcbl=0;
double sjzxftcbl=0;
//提成比例


double dzkhbl=0;//店长考核比例
double khjlkhbl=0;//店面业务考核比例
double zjkhbl=0;//客户经理考核分数
double clykhbl=0;//材料员考核比例
double xqzgkhbl=0;//小区主管考核比例
double xqzzkhbl=0;//小区组长考核比例
double xqzykhbl=0;//小区专员考核比例
double wlyxzgkhbl=0;//网络营销主管考核比例
double wztgykhbl=0;//网站推广员考核比例

//提成
double dzqysjftc=0;//店长签约设计费提成
double dzjssjftc=0;//店长结算设计费提成
double dzqyzxtc=0;//店长签约装修提成
double dzjszxtc=0;//店长结算装修提成
double dztcxj=0;//店长提成小计
double dztcze=0;//店长提成总额

double wyqyzxtc=0;//文员签约装修提成
double wyjszxtc=0;//文员结算装修提成


double khjlqysjftc=0;  //店面业务签约设计费提成	
double khjljssjftc=0;  //店面业务结算设计费提成	
double khjlqyzxtc=0;   //店面业务签约装修提成	    
double khjljszxtc=0;   //店面业务结算装修提成	    
double khjltcxj=0;     //店面业务提成小计	        
double khjltcze=0;     //店面业务提成总额	      

double sjsqysjftc=0;    //设计师签约设计费提成	
double sjsjssjftc=0;    //设计师结算设计费提成	
double sjsqyzxtc=0; //设计师签约装修提成	
double sjsjszxtc=0; //设计师结算装修提成	
double sjsycftc=0;      //设计师远程费提成	  
double sjstchj=0;   //设计师提成合计	    

double zjqyzxtc=0;  //客户经理签约装修提成		
double zjjszxtc=0;  //客户经理结算装修提成		
double zjycftc=0;   //客户经理远程费提成		
double zjtcxj=0;    //客户经理提成小计			
double zjtchj=0;    //客户经理提成合计			

double clyqyzxtc=0;  //客户经理签约装修提成		
double clyjszxtc=0;  //客户经理结算装修提成		
double clytc=0;   //客户经理远程费提成		

double xqzgqyzxtc=0;    //小区主管签约装修提成	
double xqzgjszxtc=0;    //小区主管结算装修提成	
double xqzgtc=0;    //小区主管提成			
               
double xqzzqyzxtc=0;    //小区组长签约装修提成	
double xqzzjszxtc=0;    //小区组长结算装修提成	
double xqzztc=0;    //小区组长提成			
               
double xqzyqyzxtc=0;    //小区专员签约装修提成	
double xqzyjszxtc=0;    //小区专员结算装修提成	
double xqzytc=0;    //小区专员提成			

double wlyxzgqyzxtc=0;    //网络营销主管签约装修提成	
double wlyxzgjszxtc=0;    //网络营销主管结算装修提成	
double wlyxzgtc=0;		  //网络营销主管提成			


double yxzyqyzxtc=0;    //     营销专员签约装修提成	
               
double wzchqyzxtc=0;    //     网站策划签约装修提成	
               
double wysjqyzxtc=0;    //     网页设计签约装修提成	
               
double wzcxyqyzxtc=0;    //    网站程序员签约装修提成	
               
double dhzyqyzxtc=0;    //     电话专员签约装修提成	
               
double wztgyqyzxtc=0;    //    网站推广员签约装修提成	
double wztgyjszxtc=0;    //    网站推广员结算装修提成	
double wztgytc=0;    //        网站推广员提成			
               
double sjqyzxtc=0;    //       司机签约装修提成	

double jjze=0;//奖金总数


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String lx="";

try {
	conn=cf.getConnection();

	ls_sql="select sjsjsbz,fgsbh,crm_khxx.dwbh,sjs,zjxm,khjl,clgw,hdbz,hdlxmc,fwmj,crm_khxx.bjjb,bjjbmc,khjsbz,gcjdbm";
	ls_sql+=" ,dianz,weny,xqzg,xqzz,xqzy,wlyxzg,yxzy,wzch,wysj,wzcxy,dhzy,wztgy,siji ";
	ls_sql+=" ,wdzgce,qye,suijin,sjf,sjhtsjf,zhljzjx ";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm,dm_hdlxbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_khxx.hdbz=dm_hdlxbm.hdlxbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		clgw=cf.fillNull(rs.getString("clgw"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		hdlxmc=cf.fillNull(rs.getString("hdlxmc"));
		fwmj=rs.getInt("fwmj");
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		khjsbz=cf.fillNull(rs.getString("khjsbz"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		dianz=cf.fillNull(rs.getString("dianz"));
		weny=cf.fillNull(rs.getString("weny"));
		xqzg=cf.fillNull(rs.getString("xqzg"));
		xqzz=cf.fillNull(rs.getString("xqzz"));
		xqzy=cf.fillNull(rs.getString("xqzy"));
		wlyxzg=cf.fillNull(rs.getString("wlyxzg"));
		yxzy=cf.fillNull(rs.getString("yxzy"));
		wzch=cf.fillNull(rs.getString("wzch"));
		wysj=cf.fillNull(rs.getString("wysj"));
		wzcxy=cf.fillNull(rs.getString("wzcxy"));
		dhzy=cf.fillNull(rs.getString("dhzy"));
		wztgy=cf.fillNull(rs.getString("wztgy"));
		siji=cf.fillNull(rs.getString("siji"));
		
		
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		sjf=rs.getDouble("sjf");
		sjhtsjf=rs.getDouble("sjhtsjf");
		zhljzjx=rs.getDouble("zhljzjx");

	}
	rs.close();
	ps.close();

	sjf=cf.round(sjf+sjhtsjf,2);


	if (!khjsbz.equals("N"))
	{
//		out.println("错误！客户已结算");
//		return;
	}

	if (!gcjdbm.equals("5"))//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
	{
//		out.println("错误！客户工程未完结");
//		return;
	}

	if (sjsjsbz.equals("2"))//0：未提成；1：签单提成；2：结算提成
	{
		out.println("错误！已结算提成");
		return;
	}

	if (sjsjsbz.equals("0"))
	{
		lx="1";//1：签单提成；2：结算提成
	}
	else if (sjsjsbz.equals("1"))
	{
		lx="2";//1：签单提成；2：结算提成
	}

	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tckh=rs.getString("lx");
	}
	rs.close();
	ps.close();

	//远程费
	ls_sql="select sum(sfje)";
	ls_sql+=" from  bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmbm in('02','03','04','05','08','09','10','11','12','14')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ycf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//增减项比例
	if (qye!=0)
	{
		zjxbl=cf.round(zhljzjx*100/qye,2);
	}
	else{
		zjxbl=0;
	}

	
	//套餐外主材增项
	if (tckh.equals("2"))
	{
		suijin=cf.round(wdzgce*0.033,2); //套餐：折前金额×0.033

		//增减项金额 套餐只含工程
		ls_sql="select tcwsgzjzjx+tcwgccljjzjx";
		ls_sql+=" from  crm_tckhqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zhljzjx=rs.getDouble(1);
		}
		rs.close();
		ps.close();


		ls_sql="SELECT sum(hkze+zjhze)";
		ls_sql+=" FROM jc_zcdd  ";
		ls_sql+=" where khbh='"+khbh+"'";//1：系统存在品牌订单；2：系统不存在品牌订单；3：补录合同；4：有库存订单；5：套餐分解订单
		ls_sql+=" and clzt>='09' and clzt not in('98','99')";//09：合同已完成
		ls_sql+=" and sfjrht='Y'";//是否计入合同  Y：计入；N：不计入
		ls_sql+=" and ddlx not in('1','3','4','9')";//1：代销品；3：补录合同；4：有库存订单；5：标准套餐；6：家具健康套餐；7：温暖静音套餐；8：窗帘套餐；9：代购主材；A:顶配升级、B:顶配独立收费、C:选配主材
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcwzczx=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}
	
	qye=cf.round(qye-suijin,2);


	//店长考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+dianz+"' and zw='41'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzkhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//店面业务考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+khjl+"' and zw='03'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjlkhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//客户经理考核分数
	ls_sql="select khfs";
	ls_sql+=" from  cw_jrzjyjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjkhbl=rs.getDouble("khfs");
	}
	rs.close();
	ps.close();

	//材料员考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+clgw+"' and zw='08'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clykhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//小区主管考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzg+"' and zw='42'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzgkhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//小区组长考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzz+"' and zw='43'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzzkhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//小区专员考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+xqzy+"' and zw='44'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xqzykhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//网络营销主管考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+wlyxzg+"' and zw='45'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wlyxzgkhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();

	//网站推广员考核比例
	ls_sql="select dzkhbl";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+khzq+"' and dwbh='"+dwbh+"' and yhmc='"+wztgy+"' and zw='46'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wztgykhbl=rs.getDouble("dzkhbl");
	}
	rs.close();
	ps.close();



	//提成比例
	ls_sql="select clyzxftcbl,dzsjftcbl,dzzxftcbl,wyzxftcbl,khjlsjftcbl,khjlzxftcbl,sjssjftcbl,sjszxftcbl,sjsycftcbl,zjzxftcbl,zjycftcbl,xqzgzxftcbl,xqzzzxftcbl,xqzyzxftcbl,wlyxzgzxftcbl,yxzyzxftcbl,wzchzxftcbl,wysjzxftcbl,wzcxyzxftcbl,dhzyzxftcbl,wztgyzxftcbl,sjzxftcbl ";
	ls_sql+=" from  cw_jrtcbl";
	ls_sql+=" where fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clyzxftcbl=rs.getDouble("clyzxftcbl");
		dzsjftcbl=rs.getDouble("dzsjftcbl");
		dzzxftcbl=rs.getDouble("dzzxftcbl");
		wyzxftcbl=rs.getDouble("wyzxftcbl");
		khjlsjftcbl=rs.getDouble("khjlsjftcbl");
		khjlzxftcbl=rs.getDouble("khjlzxftcbl");
		sjssjftcbl=rs.getDouble("sjssjftcbl");
		sjszxftcbl=rs.getDouble("sjszxftcbl");
		sjsycftcbl=rs.getDouble("sjsycftcbl");
		zjzxftcbl=rs.getDouble("zjzxftcbl");
		zjycftcbl=rs.getDouble("zjycftcbl");
		xqzgzxftcbl=rs.getDouble("xqzgzxftcbl");
		xqzzzxftcbl=rs.getDouble("xqzzzxftcbl");
		xqzyzxftcbl=rs.getDouble("xqzyzxftcbl");
		wlyxzgzxftcbl=rs.getDouble("wlyxzgzxftcbl");
		yxzyzxftcbl=rs.getDouble("yxzyzxftcbl");
		wzchzxftcbl=rs.getDouble("wzchzxftcbl");
		wysjzxftcbl=rs.getDouble("wysjzxftcbl");
		wzcxyzxftcbl=rs.getDouble("wzcxyzxftcbl");
		dhzyzxftcbl=rs.getDouble("dhzyzxftcbl");
		wztgyzxftcbl=rs.getDouble("wztgyzxftcbl");
		sjzxftcbl=rs.getDouble("sjzxftcbl");
	}
	rs.close();
	ps.close();


	if (zjxbl>=2)//>2％，客户经理扣0.2%
	{
		zjzxftcbl=cf.round(zjzxftcbl-0.2,2);
	}


	//店长提成＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	if (sjsjsbz.equals("0"))//0：未提成；1：签单提成；2：结算提成
	{
		if (!dianz.equals(""))
		{
			dzqysjftc=cf.round(sjf*dzsjftcbl/200,2);//店长签约设计费提成
			dzjssjftc=0;//店长结算设计费提成
			dzqyzxtc=cf.round(qye*dzzxftcbl/200,2);//店长签约装修提成
			dzjszxtc=0;//店长结算装修提成
			dztcxj=cf.round(dzqysjftc+dzqyzxtc,2);//店长提成小计
			dztcze=cf.round(dztcxj*dzkhbl/100,2);//店长提成总额
		}

		if (!weny.equals(""))
		{
			wyqyzxtc=cf.round(qye*wyzxftcbl/200,2);//文员签约装修提成
			wyjszxtc=0;//文员结算装修提成
		}


		if (!khjl.equals(""))
		{
			khjlqysjftc=cf.round(sjf*khjlsjftcbl/200,2);  //店面业务签约设计费提成	
			khjljssjftc=0;  //店面业务结算设计费提成
			khjlqyzxtc=cf.round(qye*khjlzxftcbl/200,2);   //店面业务签约装修提成	    
			khjljszxtc=0;   //店面业务结算装修提成	 
			khjltcxj=cf.round(khjlqysjftc+khjlqyzxtc,2);     //店面业务提成小计	        
			khjltcze=cf.round(dztcxj*khjlkhbl/100,2);     //店面业务提成总额	    
		}
		
		if (!sjs.equals(""))
		{
			sjsqysjftc=cf.round(sjf*sjssjftcbl/200,2);    //设计师签约设计费提成	
			sjsjssjftc=0;    //设计师结算设计费提成	
			sjsqyzxtc=cf.round(qye*sjszxftcbl/200,2); //设计师签约装修提成	
			sjsjszxtc=0; //设计师结算装修提成	
			sjsycftc=cf.round(ycf*sjsycftcbl/100,2);      //设计师远程费提成	 
			sjstchj=cf.round(sjsqysjftc+sjsqyzxtc+sjsycftc,2);   //设计师提成合计	    
		}

		if (!zjxm.equals(""))
		{
			zjqyzxtc=cf.round(qye*zjzxftcbl/200,2);  //客户经理签约装修提成		
			zjjszxtc=0;  //客户经理结算装修提成		
			zjycftc=cf.round(ycf*zjycftcbl/100,2);   //客户经理远程费提成		
			zjtcxj=cf.round(zjqyzxtc+zjycftc,2);    //客户经理提成小计			
			zjtchj=cf.round(zjtcxj*zjkhbl/100,2);    //客户经理提成合计			
		}

		if (!clgw.equals(""))
		{
			clyqyzxtc=cf.round(qye*clyzxftcbl/200,2);  //材料员签约装修提成		
			clyjszxtc=0;  //材料员结算装修提成		
			clytc=cf.round(clyqyzxtc*clykhbl/100,2);    //材料员提成			
		}

		if (!xqzg.equals(""))
		{
			xqzgqyzxtc=cf.round(qye*xqzgzxftcbl/200,2);    //小区主管签约装修提成	
			xqzgjszxtc=0;    //小区主管结算装修提成	
			xqzgtc=cf.round(xqzgqyzxtc*xqzgkhbl/100,2);    //小区主管提成			
		}
					   
		if (!xqzz.equals(""))
		{
			xqzzqyzxtc=cf.round(qye*xqzzzxftcbl/200,2);    //小区组长签约装修提成	
			xqzzjszxtc=0;    //小区组长结算装修提成	
			xqzztc=cf.round(xqzzqyzxtc*xqzzkhbl/100,2);    //小区组长提成			
		}
					   
		if (!xqzy.equals(""))
		{
			xqzyqyzxtc=cf.round(qye*xqzyzxftcbl/200,2);    //小区专员签约装修提成	
			xqzyjszxtc=0;    //小区专员结算装修提成	
			xqzytc=cf.round(xqzyqyzxtc*xqzykhbl/100,2);    //小区专员提成			
		}

		if (!wlyxzg.equals(""))
		{
			wlyxzgqyzxtc=cf.round(qye*wlyxzgzxftcbl/200,2);  //网络营销主管签约装修提成	
			wlyxzgjszxtc=0;  //网络营销主管结算装修提成	
			wlyxzgtc=cf.round(wlyxzgqyzxtc*wlyxzgkhbl/100,2);      //网络营销主管提成			
		}

		if (!yxzy.equals(""))
		{
			yxzyqyzxtc=cf.round(qye*yxzyzxftcbl/100,2);     //营销专员签约装修提成	
		}
					   
		if (!wzch.equals(""))
		{
			wzchqyzxtc=cf.round(qye*wzchzxftcbl/100,2);     //网站策划签约装修提成	
		}
					   
		if (!wysj.equals(""))
		{
			wysjqyzxtc=cf.round(qye*wysjzxftcbl/100,2);     //网页设计签约装修提成	
		}
					   
		if (!wzcxy.equals(""))
		{
			wzcxyqyzxtc=cf.round(qye*wzcxyzxftcbl/100,2);    //网站程序员签约装修提成	
		}
					   
		if (!dhzy.equals(""))
		{
			dhzyqyzxtc=cf.round(qye*dhzyzxftcbl/100,2);     //电话专员签约装修提成	
		}
					   
		if (!wztgy.equals(""))
		{
			wztgyqyzxtc=cf.round(qye*wztgyzxftcbl/200,2);    //网站推广员签约装修提成	
			wztgyjszxtc=0;    //网站推广员结算装修提成	
			wztgytc=cf.round(wztgyqyzxtc*wztgykhbl/100,2);         //网站推广员提成			
		}
					   
		if (!siji.equals(""))
		{
			sjqyzxtc=cf.round(qye*sjzxftcbl/200,2);       //司机签约装修提成		
		}
	}
	else if (sjsjsbz.equals("1"))//0：未提成；1：签单提成；2：结算提成
	{
		ls_sql="select dzqysjftc,dzqyzxtc,wyqyzxtc,khjlqysjftc,khjlqyzxtc,sjsqysjftc,sjsqyzxtc,zjqyzxtc,xqzgqyzxtc,xqzzqyzxtc,xqzyqyzxtc ";
		ls_sql+=" ,wlyxzgqyzxtc,wztgyqyzxtc,sjqyzxtc";
		ls_sql+=" from  cw_jrtcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dzqysjftc=rs.getDouble("dzqysjftc");//店长签约设计费提成
			dzqyzxtc=rs.getDouble("dzqyzxtc");//店长签约装修提成
			wyqyzxtc=rs.getDouble("wyqyzxtc");//文员签约装修提成
			khjlqysjftc=rs.getDouble("khjlqysjftc");//店面业务签约设计费提成
			khjlqyzxtc=rs.getDouble("khjlqyzxtc");//店面业务签约装修提成
			sjsqysjftc=rs.getDouble("sjsqysjftc");//设计师签约设计费提成
			sjsqyzxtc=rs.getDouble("sjsqyzxtc");//设计师签约装修提成
			zjqyzxtc=rs.getDouble("zjqyzxtc");//客户经理签约装修提成
			xqzgqyzxtc=rs.getDouble("xqzgqyzxtc");//小区主管签约装修提成
			xqzzqyzxtc=rs.getDouble("xqzzqyzxtc");//小区组长签约装修提成
			xqzyqyzxtc=rs.getDouble("xqzyqyzxtc");//小区专员签约装修提成
			wlyxzgqyzxtc=rs.getDouble("wlyxzgqyzxtc");//网络营销主管签约装修提成
			wztgyqyzxtc=rs.getDouble("wztgyqyzxtc");//网站推广员签约装修提成
			sjqyzxtc=rs.getDouble("sjqyzxtc");//司机签约装修提成
		}
		rs.close();
		ps.close();

		if (!dianz.equals(""))
		{
			dzjssjftc=cf.round(sjf*dzsjftcbl/100-dzqysjftc,2);//店长结算设计费提成
			dzjszxtc=cf.round((qye+zhljzjx)*dzzxftcbl/100-dzqyzxtc,2);//店长结算装修提成
			dztcxj=cf.round(dzjssjftc+dzjszxtc,2);//店长提成小计
			dztcze=cf.round(dztcxj*dzkhbl/100,2);//店长提成总额
		}

		if (!weny.equals(""))
		{
			wyjszxtc=cf.round((qye+zhljzjx)*wyzxftcbl/100-wyqyzxtc,2);//文员结算装修提成
		}

		if (!khjl.equals(""))
		{
			khjljssjftc=cf.round(sjf*khjlsjftcbl/100-khjlqysjftc,2);  //店面业务结算设计费提成
			khjljszxtc=cf.round((qye+zhljzjx)*khjlzxftcbl/100-khjlqyzxtc,2);   //店面业务结算装修提成	 
			khjltcxj=cf.round(khjljssjftc+khjljszxtc,2);     //店面业务提成小计	        
			khjltcze=cf.round(khjltcxj*khjlkhbl/100,2);     //店面业务提成总额	        
		}
		
		if (!sjs.equals(""))
		{
			sjsjssjftc=cf.round(sjf*sjssjftcbl/100-sjsqysjftc,2);    //设计师结算设计费提成	
			sjsjszxtc=cf.round((qye+zhljzjx)*sjszxftcbl/100-sjsqyzxtc,2); //设计师结算装修提成	
			sjsycftc=0;      //设计师远程费提成	    
			sjstchj=cf.round(sjsjssjftc+sjsjszxtc+sjsycftc,2);   //设计师提成合计	    
		}

		if (!zjxm.equals(""))
		{
			zjjszxtc=cf.round((qye+zhljzjx)*zjzxftcbl/100-zjqyzxtc,2);  //客户经理结算装修提成		
			zjycftc=0;   //客户经理远程费提成		
			zjtcxj=cf.round(zjjszxtc+zjycftc,2);    //客户经理提成小计			
			zjtchj=cf.round(zjtcxj*zjkhbl/100,2);    //客户经理提成合计			
		}

		if (!clgw.equals(""))
		{
			clyjszxtc=cf.round(qye*clyzxftcbl/100,2)-clyqyzxtc;  //材料员结算装修提成
			clytc=cf.round(clyjszxtc*clykhbl/100,2);    //材料员提成			
		}

		if (!xqzg.equals(""))
		{
			xqzgjszxtc=cf.round((qye+zhljzjx)*xqzgzxftcbl/100-xqzgqyzxtc,2);    //小区主管结算装修提成	
			xqzgtc=cf.round(xqzgjszxtc*xqzgkhbl/100,2);    //小区主管提成			
		}
					   
		if (!xqzz.equals(""))
		{
			xqzzjszxtc=cf.round((qye+zhljzjx)*xqzzzxftcbl/100-xqzzqyzxtc,2);    //小区组长结算装修提成	
			xqzztc=cf.round(xqzzjszxtc*xqzzkhbl/100,2);    //小区组长提成			
		}
					   
		if (!xqzy.equals(""))
		{
			xqzyjszxtc=cf.round((qye+zhljzjx)*xqzyzxftcbl/100-xqzyqyzxtc,2);    //小区专员结算装修提成	
			xqzytc=cf.round(xqzyjszxtc*xqzykhbl/100,2);    //小区专员提成			
		}

		if (!wlyxzg.equals(""))
		{
			wlyxzgjszxtc=cf.round((qye+zhljzjx)*wlyxzgzxftcbl/100-wlyxzgqyzxtc,2);  //网络营销主管结算装修提成	
			wlyxzgtc=cf.round(wlyxzgjszxtc*wlyxzgkhbl/100,2);      //网络营销主管提成		
		}
		

		
		yxzyzxftcbl=0;
		yxzyqyzxtc=0;     //营销专员签约装修提成	
					   
		wzchzxftcbl=0;
		wzchqyzxtc=0;     //网站策划签约装修提成	
					   
		wysjzxftcbl=0;
		wysjqyzxtc=0;     //网页设计签约装修提成	
					   
		wzcxyzxftcbl=0;
		wzcxyqyzxtc=0;    //网站程序员签约装修提成	
					   
		dhzyzxftcbl=0;
		dhzyqyzxtc=0;     //电话专员签约装修提成	
					   
		if (!wztgy.equals(""))
		{
			wztgyjszxtc=cf.round((qye+zhljzjx)*wztgyzxftcbl/100-wztgyqyzxtc,2);    //网站推广员结算装修提成	
			wztgytc=cf.round(wztgyjszxtc*wztgykhbl/100,2);         //网站推广员提成		
		}
		
		sjzxftcbl=0;
		sjqyzxtc=0;//司机签约装修提成
					   
	}


	jjze=dztcze+wyjszxtc+khjltcze+sjstchj+zjtchj+clytc+xqzgtc+xqzztc+xqzytc+wlyxzgtc+yxzyqyzxtc+wzchqyzxtc+wysjqyzxtc+wzcxyqyzxtc+dhzyqyzxtc+wztgytc+sjqyzxtc;
	jjze=cf.round(jjze,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
	return;
}
finally 
{
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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrtcmxQd.jsp" name="insertform"  >
<div align="center">签单提成</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">提成批号</td> 
  <td width="27%"> 
    <input type="text" name="khzq" value="<%=khzq%>" size="20" maxlength="11" >  </td>
  <td align="right" width="23%">客户编号</td> 
  <td width="27%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">回单标志</td> 
  <td width="27%"> 
    <input type="text" name="hdbz" value="<%=hdbz%>" size="20" maxlength="1" >  </td>
  <td align="right" width="23%">套餐客户</td> 
  <td width="27%"> 
  <%
  cf.radioToken(out,"tckh","1+个性&2+套餐",tckh);
  %></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店长</td> 
  <td width="27%"> 
    <input type="text" name="dianz" value="<%=dianz%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">文员</td> 
  <td width="27%"> 
    <input type="text" name="weny" value="<%=weny%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店面业务</td> 
  <td width="27%"> 
    <input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">设计师</td> 
  <td width="27%"> 
    <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">材料员</td> 
  <td width="27%"> 
    <input type="text" name="cly" value="<%=clgw%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">客户经理</td> 
  <td width="27%"> 
    <input type="text" name="zj" value="<%=zjxm%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区主管</td> 
  <td width="27%"> 
    <input type="text" name="xqzg" value="<%=xqzg%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">小区组长</td> 
  <td width="27%"> 
    <input type="text" name="xqzz" value="<%=xqzz%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区专员</td> 
  <td width="27%"> 
    <input type="text" name="xqzy" value="<%=xqzy%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">网络营销主管</td> 
  <td width="27%"> 
    <input type="text" name="wlyxzg" value="<%=wlyxzg%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">营销专员</td> 
  <td width="27%"> 
    <input type="text" name="yxzy" value="<%=yxzy%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">网站策划</td> 
  <td width="27%"> 
    <input type="text" name="wzch" value="<%=wzch%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网页设计</td> 
  <td width="27%"> 
    <input type="text" name="wysj" value="<%=wysj%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">网站程序员</td> 
  <td width="27%"> 
    <input type="text" name="wzcxy" value="<%=wzcxy%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">电话专员</td> 
  <td width="27%"> 
    <input type="text" name="dhzy" value="<%=dhzy%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">网站推广员</td> 
  <td width="27%"> 
    <input type="text" name="wztgy" value="<%=wztgy%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">司机</td> 
  <td width="27%"> 
    <input type="text" name="siji" value="<%=siji%>" size="20" maxlength="20" >  </td>
  <td align="right" width="23%">建筑面积</td> 
  <td width="27%"> 
    <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计费</td> 
  <td width="27%"> 
    <input type="text" name="sjf" value="<%=sjf%>" size="20" maxlength="17" >
    （考虑退设计费）  </td>
  <td align="right" width="23%">远程费</td> 
  <td width="27%"> 
    <input type="text" name="ycf" value="<%=ycf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">折前金额</td> 
  <td width="27%"> 
    <input type="text" name="zqje" value="<%=wdzgce%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">折扣</td> 
  <td width="27%"> 
    <input type="text" name="zk" value="<%=cf.round(wdzgce-qye,2)%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">税金</td> 
  <td width="27%"> 
    <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">折后计提基数</td> 
  <td width="27%"> 
    <input type="text" name="zhjtjs" value="<%=qye%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">增减项金额</td> 
  <td width="27%"> 
    <input type="text" name="zjxje" value="<%=zhljzjx%>" size="20" maxlength="17" >
    不含税金  </td>
  <td align="right" width="23%">增减项比例</td> 
  <td width="27%"> 
    <input type="text" name="zjxbl" value="<%=zjxbl%>" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">套餐外主材增项</td> 
  <td width="27%"> 
    <input type="text" name="tcwzczx" value="<%=tcwzczx%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">店长设计费提成比例</td>
  <td><input type="text" name="dzsjftcbl" value="<%=dzsjftcbl%>" size="10" maxlength="17" >
  %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店长签约设计费提成</td> 
  <td width="27%"> 
    <input type="text" name="dzqysjftc" value="<%=dzqysjftc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">店长结算设计费提成</td> 
  <td width="27%"> 
    <input type="text" name="dzjssjftc" value="<%=dzjssjftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店长装修费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="dzzxftcbl" value="<%=dzzxftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">店长签约装修提成</td>
  <td><input type="text" name="dzqyzxtc" value="<%=dzqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right">店长结算装修提成</td>
  <td><input type="text" name="dzjszxtc" value="<%=dzjszxtc%>" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店长提成小计</td> 
  <td width="27%"><input type="text" name="dztcxj" value="<%=dztcxj%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店长考核比例</td> 
  <td width="27%"> 
    <input type="text" name="dzkhbl" value="<%=dzkhbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">店长提成总额</td> 
  <td width="27%"> 
    <input type="text" name="dztcze" value="<%=dztcze%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">文员装修费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="wyzxftcbl" value="<%=wyzxftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">文员签约装修提成</td> 
  <td width="27%"><input type="text" name="wyqyzxtc" value="<%=wyqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">文员结算装修提成</td> 
  <td width="27%"><input type="text" name="wyjszxtc" value="<%=wyjszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">店面业务设计费提成比例</td>
  <td><input type="text" name="khjlsjftcbl" value="<%=khjlsjftcbl%>" size="10" maxlength="17" >
  %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店面业务签约设计费提成</td> 
  <td width="27%"> 
    <input type="text" name="khjlqysjftc" value="<%=khjlqysjftc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">店面业务结算设计费提成</td> 
  <td width="27%"> 
    <input type="text" name="khjljssjftc" value="<%=khjljssjftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店面业务装修费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="khjlzxftcbl" value="<%=khjlzxftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">店面业务签约装修提成</td>
  <td><input type="text" name="khjlqyzxtc" value="<%=khjlqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right">店面业务结算装修提成</td>
  <td><input type="text" name="khjljszxtc" value="<%=khjljszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店面业务提成小计</td> 
  <td width="27%"><input type="text" name="khjltcxj" value="<%=khjltcxj%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">店面业务考核比例</td> 
  <td width="27%"> 
    <input type="text" name="khjlkhbl" value="<%=khjlkhbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">店面业务提成总额</td> 
  <td width="27%"> 
    <input type="text" name="khjltcze" value="<%=khjltcze%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计师设计费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="sjssjftcbl" value="<%=sjssjftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">设计师签约设计费提成</td>
  <td><input type="text" name="sjsqysjftc" value="<%=sjsqysjftc%>" size="20" maxlength="17" ></td>
  <td align="right">设计师结算设计费提成</td>
  <td><input type="text" name="sjsjssjftc" value="<%=sjsjssjftc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计师装修费提成比例</td> 
  <td width="27%"><input type="text" name="sjszxftcbl" value="<%=sjszxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计师签约装修提成</td> 
  <td width="27%"> 
    <input type="text" name="sjsqyzxtc" value="<%=sjsqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">设计师结算装修提成</td> 
  <td width="27%"> 
    <input type="text" name="sjsjszxtc" value="<%=sjsjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计师远程费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="sjsycftcbl" value="<%=sjsycftcbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">设计师远程费提成(结算)</td> 
  <td width="27%"> 
    <input type="text" name="sjsycftc" value="<%=sjsycftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">设计师提成合计</td> 
  <td width="27%"> 
    <input type="text" name="sjstchj" value="<%=sjstchj%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">客户经理装修费提成比例</td>
  <td><input type="text" name="zjzxftcbl" value="<%=zjzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">客户经理签约装修提成</td> 
  <td width="27%"> 
    <input type="text" name="zjqyzxtc" value="<%=zjqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">客户经理结算装修提成</td> 
  <td width="27%"> 
    <input type="text" name="zjjszxtc" value="<%=zjjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">客户经理远程费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="zjycftcbl" value="<%=zjycftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right" width="23%">客户经理远程费提成</td> 
  <td width="27%"> 
    <input type="text" name="zjycftc" value="<%=zjycftc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">客户经理提成小计</td> 
  <td width="27%"> 
    <input type="text" name="zjtcxj" value="<%=zjtcxj%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">客户经理考核分数</td> 
  <td width="27%"><input type="text" name="zjkhbl" value="<%=zjkhbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right" width="23%">客户经理提成合计</td> 
  <td width="27%"><input type="text" name="zjtchj" value="<%=zjtchj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料员装修费提成比例</td>
  <td><input type="text" name="clyzxftcbl" value="<%=clyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">材料员签约装修提成</td>
  <td><input type="text" name="clyqyzxtc" value="<%=clyqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right">材料员结算装修提成</td>
  <td><input type="text" name="clyjszxtc" value="<%=clyjszxtc%>" size="20" maxlength="17" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">材料员考核比例</td>
  <td><input name="clykhbl" type="text" value="<%=clykhbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">材料员提成</td>
  <td><input type="text" name="clytc" value="<%=clytc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">小区主管装修费提成比例</td>
  <td><input type="text" name="xqzgzxftcbl" value="<%=xqzgzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区主管签约装修提成</td> 
  <td width="27%"> 
    <input type="text" name="xqzgqyzxtc" value="<%=xqzgqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">小区主管结算装修提成</td> 
  <td width="27%"> 
    <input type="text" name="xqzgjszxtc" value="<%=xqzgjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区主管考核比例</td> 
  <td width="27%"> 
    <input type="text" name="xqzgkhbl" value="<%=xqzgkhbl%>" size="10" maxlength="17" >
    %  </td>
  <td align="right" width="23%">小区主管提成</td> 
  <td width="27%"> 
    <input type="text" name="xqzgtc" value="<%=xqzgtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区组长装修费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="xqzzzxftcbl" value="<%=xqzzzxftcbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区组长签约装修提成</td> 
  <td width="27%"><input type="text" name="xqzzqyzxtc" value="<%=xqzzqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">小区组长结算装修提成</td> 
  <td width="27%"><input type="text" name="xqzzjszxtc" value="<%=xqzzjszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区组长考核比例</td> 
  <td width="27%"><input type="text" name="xqzzkhbl" value="<%=xqzzkhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">小区组长提成</td> 
  <td width="27%"><input type="text" name="xqzztc" value="<%=xqzztc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">小区专员装修费提成比例</td>
  <td><input type="text" name="xqzyzxftcbl" value="<%=xqzyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区专员签约装修提成</td> 
  <td width="27%"> 
    <input type="text" name="xqzyqyzxtc" value="<%=xqzyqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">小区专员结算装修提成</td> 
  <td width="27%"> 
    <input type="text" name="xqzyjszxtc" value="<%=xqzyjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">小区专员考核比例</td> 
  <td width="27%"> 
    <input type="text" name="xqzykhbl" value="<%=xqzykhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">小区专员提成</td> 
  <td width="27%"> 
    <input type="text" name="xqzytc" value="<%=xqzytc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网络营销主管装修费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="wlyxzgzxftcbl" value="<%=wlyxzgzxftcbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网络营销主管签约装修提成</td> 
  <td width="27%"><input type="text" name="wlyxzgqyzxtc" value="<%=wlyxzgqyzxtc%>" size="20" maxlength="17" ></td>
  <td align="right" width="23%">网络营销主管结算装修提成</td> 
  <td width="27%"><input type="text" name="wlyxzgjszxtc" value="<%=wlyxzgjszxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网络营销主管考核比例</td> 
  <td width="27%"><input type="text" name="wlyxzgkhbl" value="<%=wlyxzgkhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">网络营销主管提成</td> 
  <td width="27%"><input type="text" name="wlyxzgtc" value="<%=wlyxzgtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">营销专员装修费提成比例</td>
  <td><input type="text" name="yxzyzxftcbl" value="<%=yxzyzxftcbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right">营销专员签约装修提成</td>
  <td><input type="text" name="yxzyqyzxtc" value="<%=yxzyqyzxtc%>" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">网站策划装修费提成比例</td>
  <td><input type="text" name="wzchzxftcbl" value="<%=wzchzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">网站策划签约装修提成</td>
  <td><input type="text" name="wzchqyzxtc" value="<%=wzchqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">网页设计装修费提成比例</td>
  <td><input type="text" name="wysjzxftcbl" value="<%=wysjzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">网页设计签约装修提成</td>
  <td><input type="text" name="wysjqyzxtc" value="<%=wysjqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">网站程序员装修费提成比例</td>
  <td><input type="text" name="wzcxyzxftcbl" value="<%=wzcxyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">网站程序员签约装修提成</td>
  <td><input type="text" name="wzcxyqyzxtc" value="<%=wzcxyqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">电话专员装修费提成比例</td>
  <td><input type="text" name="dhzyzxftcbl" value="<%=dhzyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">电话专员签约装修提成</td>
  <td><input type="text" name="dhzyqyzxtc" value="<%=dhzyqyzxtc%>" size="20" maxlength="17" ></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">网站推广员装修费提成比例</td>
  <td><input type="text" name="wztgyzxftcbl" value="<%=wztgyzxftcbl%>" size="10" maxlength="17" >
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网站推广员签约装修提成</td> 
  <td width="27%"> 
    <input type="text" name="wztgyqyzxtc" value="<%=wztgyqyzxtc%>" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">网站推广员结算装修提成</td> 
  <td width="27%"> 
    <input type="text" name="wztgyjszxtc" value="<%=wztgyjszxtc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">网站推广员考核比例</td> 
  <td width="27%"> 
    <input type="text" name="wztgykhbl" value="<%=wztgykhbl%>" size="10" maxlength="17" >
    % </td>
  <td align="right" width="23%">网站推广员提成</td> 
  <td width="27%"> 
    <input type="text" name="wztgytc" value="<%=wztgytc%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">司机装修费提成比例</td> 
  <td width="27%"> 
    <input type="text" name="sjzxftcbl" value="<%=sjzxftcbl%>" size="10" maxlength="17" >
% </td>
  <td align="right" width="23%">司机签约装修提成</td> 
  <td width="27%"><input type="text" name="sjqyzxtc" value="<%=sjqyzxtc%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="23%"><span class="STYLE1">*</span>类型</td> 
  <td width="27%"><%
	cf.radioToken(out, "lx","1+签单提成&2+结算提成",lx);
%></td>
  <td align="right" width="23%"><span class="STYLE1">*</span>奖金总数</td> 
  <td width="27%"><input type="text" name="jjze" value="<%=jjze%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>录入人</td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span>录入时间</td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hdbz)=="") {
		alert("请输入[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.tckh)=="") {
		alert("请输入[套餐客户]！");
		FormName.tckh.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[建筑面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "建筑面积"))) {
		return false;
	}
	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("请输入[折前金额]！");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "折前金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zk)=="") {
		alert("请输入[折扣]！");
		FormName.zk.focus();
		return false;
	}
	if(!(isFloat(FormName.zk, "折扣"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.focus();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.zhjtjs)=="") {
		alert("请输入[折后计提基数]！");
		FormName.zhjtjs.focus();
		return false;
	}
	if(!(isFloat(FormName.zhjtjs, "折后计提基数"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxbl)=="") {
		alert("请输入[增减项比例]！");
		FormName.zjxbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxbl, "增减项比例"))) {
		return false;
	}
	if(	javaTrim(FormName.tcwzczx)=="") {
		alert("请输入[套餐外主材增项]！");
		FormName.tcwzczx.focus();
		return false;
	}
	if(!(isFloat(FormName.tcwzczx, "套餐外主材增项"))) {
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("请输入[店长设计费提成比例]！");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "店长设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dzqysjftc)=="") {
		alert("请输入[店长签约设计费提成]！");
		FormName.dzqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzqysjftc, "店长签约设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.dzjssjftc)=="") {
		alert("请输入[店长结算设计费提成]！");
		FormName.dzjssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzjssjftc, "店长结算设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("请输入[店长装修费提成比例]！");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "店长装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dzqyzxtc)=="") {
		alert("请输入[店长签约装修提成]！");
		FormName.dzqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzqyzxtc, "店长签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.dzjszxtc)=="") {
		alert("请输入[店长结算装修提成]！");
		FormName.dzjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dzjszxtc, "店长结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.dztcxj)=="") {
		alert("请输入[店长提成小计]！");
		FormName.dztcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.dztcxj, "店长提成小计"))) {
		return false;
	}
	if(	javaTrim(FormName.dzkhbl)=="") {
		alert("请输入[店长考核比例]！");
		FormName.dzkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzkhbl, "店长考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dztcze)=="") {
		alert("请输入[店长提成总额]！");
		FormName.dztcze.focus();
		return false;
	}
	if(!(isFloat(FormName.dztcze, "店长提成总额"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("请输入[文员装修费提成比例]！");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "文员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wyqyzxtc)=="") {
		alert("请输入[文员签约装修提成]！");
		FormName.wyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wyqyzxtc, "文员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wyjszxtc)=="") {
		alert("请输入[文员结算装修提成]！");
		FormName.wyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wyjszxtc, "文员结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("请输入[店面业务设计费提成比例]！");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "店面业务设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlqysjftc)=="") {
		alert("请输入[店面业务签约设计费提成]！");
		FormName.khjlqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlqysjftc, "店面业务签约设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.khjljssjftc)=="") {
		alert("请输入[店面业务结算设计费提成]！");
		FormName.khjljssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjljssjftc, "店面业务结算设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("请输入[店面业务装修费提成比例]！");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "店面业务装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlqyzxtc)=="") {
		alert("请输入[店面业务签约装修提成]！");
		FormName.khjlqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlqyzxtc, "店面业务签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.khjljszxtc)=="") {
		alert("请输入[店面业务结算装修提成]！");
		FormName.khjljszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.khjljszxtc, "店面业务结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.khjltcxj)=="") {
		alert("请输入[店面业务提成小计]！");
		FormName.khjltcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.khjltcxj, "店面业务提成小计"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlkhbl)=="") {
		alert("请输入[店面业务考核比例]！");
		FormName.khjlkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlkhbl, "店面业务考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.khjltcze)=="") {
		alert("请输入[店面业务提成总额]！");
		FormName.khjltcze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjltcze, "店面业务提成总额"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("请输入[设计师设计费提成比例]！");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "设计师设计费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsqysjftc)=="") {
		alert("请输入[设计师签约设计费提成]！");
		FormName.sjsqysjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsqysjftc, "设计师签约设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsjssjftc)=="") {
		alert("请输入[设计师结算设计费提成]！");
		FormName.sjsjssjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsjssjftc, "设计师结算设计费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("请输入[设计师装修费提成比例]！");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "设计师装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsqyzxtc)=="") {
		alert("请输入[设计师签约装修提成]！");
		FormName.sjsqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsqyzxtc, "设计师签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsjszxtc)=="") {
		alert("请输入[设计师结算装修提成]！");
		FormName.sjsjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsjszxtc, "设计师结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("请输入[设计师远程费提成比例]！");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "设计师远程费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftc)=="") {
		alert("请输入[设计师远程费提成]！");
		FormName.sjsycftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftc, "设计师远程费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.sjstchj)=="") {
		alert("请输入[设计师提成合计]！");
		FormName.sjstchj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjstchj, "设计师提成合计"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("请输入[客户经理装修费提成比例]！");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "客户经理装修费提成比例"))) {
		return false;
	}
	if(!(isFloat(FormName.zjqyzxtc, "客户经理签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.zjjszxtc)=="") {
		alert("请输入[客户经理结算装修提成]！");
		FormName.zjjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.zjjszxtc, "客户经理结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("请输入[客户经理远程费提成比例]！");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "客户经理远程费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftc)=="") {
		alert("请输入[客户经理远程费提成]！");
		FormName.zjycftc.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftc, "客户经理远程费提成"))) {
		return false;
	}
	if(	javaTrim(FormName.zjtcxj)=="") {
		alert("请输入[客户经理提成小计]！");
		FormName.zjtcxj.focus();
		return false;
	}
	if(!(isFloat(FormName.zjtcxj, "客户经理提成小计"))) {
		return false;
	}
	if(	javaTrim(FormName.zjkhbl)=="") {
		alert("请输入[客户经理考核比例]！");
		FormName.zjkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjkhbl, "客户经理考核比例"))) {
		return false;
	}

	if(	javaTrim(FormName.zjtchj)=="") {
		alert("请输入[客户经理提成合计]！");
		FormName.zjtchj.focus();
		return false;
	}
	if(!(isFloat(FormName.zjtchj, "客户经理提成合计"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("请输入[材料员装修费提成比例]！");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "材料员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.clyqyzxtc)=="") {
		alert("请输入[材料员签约装修提成]！");
		FormName.clyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.clyqyzxtc, "材料员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.clyjszxtc)=="") {
		alert("请输入[材料员结算装修提成]！");
		FormName.clyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.clyjszxtc, "材料员结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.clykhbl)=="") {
		alert("请输入[材料员考核比例]！");
		FormName.clykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clykhbl, "材料员考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.clytc)=="") {
		alert("请输入[材料员提成]！");
		FormName.clytc.focus();
		return false;
	}
	if(!(isFloat(FormName.clytc, "材料员提成"))) {
		return false;
	}
	
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("请输入[小区主管装修费提成比例]！");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "小区主管装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgqyzxtc)=="") {
		alert("请输入[小区主管签约装修提成]！");
		FormName.xqzgqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgqyzxtc, "小区主管签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgjszxtc)=="") {
		alert("请输入[小区主管结算装修提成]！");
		FormName.xqzgjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgjszxtc, "小区主管结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgkhbl)=="") {
		alert("请输入[小区主管考核比例]！");
		FormName.xqzgkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgkhbl, "小区主管考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgtc)=="") {
		alert("请输入[小区主管提成]！");
		FormName.xqzgtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgtc, "小区主管提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("请输入[小区组长装修费提成比例]！");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "小区组长装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzqyzxtc)=="") {
		alert("请输入[小区组长签约装修提成]！");
		FormName.xqzzqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzqyzxtc, "小区组长签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzjszxtc)=="") {
		alert("请输入[小区组长结算装修提成]！");
		FormName.xqzzjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzjszxtc, "小区组长结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzkhbl)=="") {
		alert("请输入[小区组长考核比例]！");
		FormName.xqzzkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzkhbl, "小区组长考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzztc)=="") {
		alert("请输入[小区组长提成]！");
		FormName.xqzztc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzztc, "小区组长提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("请输入[小区专员装修费提成比例]！");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "小区专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyqyzxtc)=="") {
		alert("请输入[小区专员签约装修提成]！");
		FormName.xqzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyqyzxtc, "小区专员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyjszxtc)=="") {
		alert("请输入[小区专员结算装修提成]！");
		FormName.xqzyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyjszxtc, "小区专员结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzykhbl)=="") {
		alert("请输入[小区专员考核比例]！");
		FormName.xqzykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzykhbl, "小区专员考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzytc)=="") {
		alert("请输入[小区专员提成]！");
		FormName.xqzytc.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzytc, "小区专员提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("请输入[网络营销主管装修费提成比例]！");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "网络营销主管装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgqyzxtc)=="") {
		alert("请输入[网络营销主管签约装修提成]！");
		FormName.wlyxzgqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgqyzxtc, "网络营销主管签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgjszxtc)=="") {
		alert("请输入[网络营销主管结算装修提成]！");
		FormName.wlyxzgjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgjszxtc, "网络营销主管结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgkhbl)=="") {
		alert("请输入[网络营销主管考核比例]！");
		FormName.wlyxzgkhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgkhbl, "网络营销主管考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgtc)=="") {
		alert("请输入[网络营销主管提成]！");
		FormName.wlyxzgtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgtc, "网络营销主管提成"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("请输入[营销专员装修费提成比例]！");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "营销专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyqyzxtc)=="") {
		alert("请输入[营销专员签约装修提成]！");
		FormName.yxzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyqyzxtc, "营销专员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("请输入[网站策划装修费提成比例]！");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "网站策划装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchqyzxtc)=="") {
		alert("请输入[网站策划签约装修提成]！");
		FormName.wzchqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchqyzxtc, "网站策划签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("请输入[网页设计装修费提成比例]！");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "网页设计装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjqyzxtc)=="") {
		alert("请输入[网页设计签约装修提成]！");
		FormName.wysjqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjqyzxtc, "网页设计签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("请输入[网站程序员装修费提成比例]！");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "网站程序员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyqyzxtc)=="") {
		alert("请输入[网站程序员签约装修提成]！");
		FormName.wzcxyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyqyzxtc, "网站程序员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("请输入[电话专员装修费提成比例]！");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "电话专员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyqyzxtc)=="") {
		alert("请输入[电话专员签约装修提成]！");
		FormName.dhzyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyqyzxtc, "电话专员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("请输入[网站推广员装修费提成比例]！");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "网站推广员装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyqyzxtc)=="") {
		alert("请输入[网站推广员签约装修提成]！");
		FormName.wztgyqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyqyzxtc, "网站推广员签约装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyjszxtc)=="") {
		alert("请输入[网站推广员结算装修提成]！");
		FormName.wztgyjszxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyjszxtc, "网站推广员结算装修提成"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgykhbl)=="") {
		alert("请输入[网站推广员考核比例]！");
		FormName.wztgykhbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgykhbl, "网站推广员考核比例"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgytc)=="") {
		alert("请输入[网站推广员提成]！");
		FormName.wztgytc.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgytc, "网站推广员提成"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("请输入[司机装修费提成比例]！");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "司机装修费提成比例"))) {
		return false;
	}
	if(	javaTrim(FormName.sjqyzxtc)=="") {
		alert("请输入[司机签约装修提成]！");
		FormName.sjqyzxtc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjqyzxtc, "司机签约装修提成"))) {
		return false;
	}

	if(	javaTrim(FormName.jjze)=="") {
		alert("请输入[奖金总额]！");
		FormName.jjze.focus();
		return false;
	}
	if(!(isFloat(FormName.jjze, "奖金总额"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
