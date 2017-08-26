<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String ssfgs=null;
String sgd=null;
String sgbz=null;
double qye=0;
double guanlif=0;
double suijin=0;
String cqbm=null;
String xqbm=null;

String kgsjqd="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));



String deflbm="";
String deflmc="";
String kpjlh=null;
String yxzssgd=null;
String yxfzssgd=null;
String hdsgd=null;
String hdsgbz=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int kxsgds=5;//候选数量

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,cqbm,xqbm,qye,guanlif,suijin,sgd,sgbz ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();


	String getsgd=null;
	String sgdmc=null;
	String bzmc=null;
	String getkhmyd=null;
	String zbj=null;
	String bzjb=null;
	String sgdjb=null;
	String mqzsgds=null;
	String getkygrsl=null;

	String bzzf=null;
	String dzzf=null;

	String hxsgdstr="";




	double qyeall=qye+guanlif+suijin;

	//生成派单条件SQL语句＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	int pdsgd=0;
	String[] sgds=new String[50];
	String[] sgdmcs=new String[50];
	String[] bzmcs=new String[50];
	String[] bzzfs=new String[50];
	String[] dzzfs=new String[50];
	String[] mark=new String[50];

	int row=0;

	if (lx.equals("1"))
	{
		row=0;
		//同小区派单，先满足上级接单
		ls_sql =" select *";
		ls_sql+=" from ( ";
		ls_sql+=" select kp_yzfbzpdkpjg.sgd,sgdmc,kp_yzfbzpdkpjg.bzmc,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(sq_sgd.pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) dzzf,(NVL(-1*sq_bzxx.bzpdjf,0)+NVL(sq_bzxx.bzwgjf,0)+NVL(sq_bzxx.pdkpf,0)+(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0))) bzzf";
		ls_sql+=" from kp_yzfbzpdkpjg,sq_bzxx,sq_sgd ";
		ls_sql+=" where kp_yzfbzpdkpjg.sgd=sq_sgd.sgd and kp_yzfbzpdkpjg.ssfgs='"+ssfgs+"'";
		ls_sql+=" and kp_yzfbzpdkpjg.sgd=sq_bzxx.sgd and kp_yzfbzpdkpjg.bzmc =sq_bzxx.bzmc ";

		ls_sql+=" and sq_bzxx.tdbz='N'";//状态, Y：停单；N：正常；K：开除；L：离职
		ls_sql+=" and kp_yzfbzpdkpjg.zbjsfdb='Y'";//质保金是否达标, Y：是；N：否
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj < SYSDATE )) ";

		ls_sql+=" and sq_bzxx.khmyd>=80";//客户满意度低于80%的项目经理、班长不能派单
		ls_sql+=" and sq_sgd.khmyd>=80";//客户满意度低于80%的项目经理、班长不能派单
		ls_sql+=" and sq_bzxx.kygrsl>=2";//可用工人数量
		ls_sql+=" and sq_bzxx.mqzsgds<sq_bzxx.zdzsgds";// 目前在施工地数 < 班组最大在施工地数 
		ls_sql+=" and sq_bzxx.kjdzdz>="+qyeall;//单额 < 可接单额最大值
		ls_sql+=" and ((sq_bzxx.mqzsgds>=sq_bzxx.zxzsgds and sq_bzxx.kjdzxz<="+qyeall+") OR (sq_bzxx.mqzsgds<sq_bzxx.zxzsgds))";//单额 < 可接单最小值

		ls_sql+=" and kp_yzfbzpdkpjg.bzmc in(select sgbz from crm_khxx where gcjdbm not in('4','5') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"' and  xqbm='"+xqbm+"' and crm_khxx.sgd=kp_yzfbzpdkpjg.sgd)";

		ls_sql+=" order by bzzf desc,dzzf desc,sq_bzxx.khmyd desc,sq_sgd.khmyd desc,sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm";
		ls_sql+=" ) ";
		ls_sql+=" where rownum<=50";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			bzmc=cf.fillNull(rs.getString("bzmc"));
			bzzf=cf.fillNull(rs.getString("bzzf"));
			dzzf=cf.fillNull(rs.getString("dzzf"));

			sgds[row]=getsgd;
			sgdmcs[row]=sgdmc;
			bzmcs[row]=bzmc;
			bzzfs[row]=bzzf;
			dzzfs[row]=dzzf;
			mark[row]="0";

			row++;
		}
		rs.close();
		ps.close();

		//首先选组不同施工队班组【kxsgds】个，施工队不重复
		for (int i=0;i<row ;i++ )
		{
			if (pdsgd>=kxsgds)
			{
				break;
			}

			if (hxsgdstr.indexOf("value=\""+sgds[i]+"*")==-1)//没有，增加
			{
				mark[i]="1";//表示已选择
				pdsgd++;
				hxsgdstr+=sgds[i]+"*"+bzmcs[i]+"+"+bzmcs[i]+"(班长:"+bzzfs[i]+"分,队长:"+dzzfs[i]+"分)("+sgdmcs[i]+")(同小区)%";
			}
		}

		if (pdsgd<kxsgds)//数量不足，补充剩余班组
		{
			for (int i=0;i<row ;i++ )
			{
				if (pdsgd>=kxsgds)
				{
					break;
				}

				if (mark[i].equals("0"))//未选择
				{
					mark[i]="1";//表示已选择
					pdsgd++;
					hxsgdstr+=sgds[i]+"*"+bzmcs[i]+"+"+bzmcs[i]+"(班长:"+bzzfs[i]+"分,队长:"+dzzfs[i]+"分)("+sgdmcs[i]+")(同小区)%";
				}
			}
		}
	}

	//同城区派单，先满足上级接单
	if (lx.equals("2"))
	{
		row=0;
		ls_sql =" select *";
		ls_sql+=" from ( ";
		ls_sql+=" select kp_yzfbzpdkpjg.sgd,sgdmc,kp_yzfbzpdkpjg.bzmc,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(sq_sgd.pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) dzzf,(NVL(-1*sq_bzxx.bzpdjf,0)+NVL(sq_bzxx.bzwgjf,0)+NVL(sq_bzxx.pdkpf,0)+(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0))) bzzf";
		ls_sql+=" from kp_yzfbzpdkpjg,sq_bzxx,sq_sgd ";
		ls_sql+=" where kp_yzfbzpdkpjg.sgd=sq_sgd.sgd and kp_yzfbzpdkpjg.ssfgs='"+ssfgs+"'";
		ls_sql+=" and kp_yzfbzpdkpjg.sgd=sq_bzxx.sgd and kp_yzfbzpdkpjg.bzmc =sq_bzxx.bzmc ";

		ls_sql+=" and sq_bzxx.tdbz='N'";//状态, Y：停单；N：正常；K：开除；L：离职
		ls_sql+=" and kp_yzfbzpdkpjg.zbjsfdb='Y'";//质保金是否达标, Y：是；N：否
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj < SYSDATE )) ";

		ls_sql+=" and sq_bzxx.khmyd>=80";//客户满意度低于80%的项目经理、班长不能派单
		ls_sql+=" and sq_sgd.khmyd>=80";//客户满意度低于80%的项目经理、班长不能派单
		ls_sql+=" and sq_bzxx.kygrsl>=2";//可用工人数量
		ls_sql+=" and sq_bzxx.mqzsgds<sq_bzxx.zdzsgds";// 目前在施工地数 < 班组最大在施工地数 
		ls_sql+=" and sq_bzxx.kjdzdz>="+qyeall;//单额 < 可接单额最大值
		ls_sql+=" and ((sq_bzxx.mqzsgds>=sq_bzxx.zxzsgds and sq_bzxx.kjdzxz<="+qyeall+") OR (sq_bzxx.mqzsgds<sq_bzxx.zxzsgds))";//单额 < 可接单最小值

		ls_sql+=" and kp_yzfbzpdkpjg.bzmc in(select sgbz from crm_khxx where gcjdbm not in('4','5') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"' and  cqbm='"+cqbm+"' and crm_khxx.sgd=kp_yzfbzpdkpjg.sgd)";

		ls_sql+=" order by bzzf desc,dzzf desc,sq_bzxx.khmyd desc,sq_sgd.khmyd desc,sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm";
		ls_sql+=" ) ";
		ls_sql+=" where rownum<=50";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			bzmc=cf.fillNull(rs.getString("bzmc"));
			bzzf=cf.fillNull(rs.getString("bzzf"));
			dzzf=cf.fillNull(rs.getString("dzzf"));

			sgds[row]=getsgd;
			sgdmcs[row]=sgdmc;
			bzmcs[row]=bzmc;
			bzzfs[row]=bzzf;
			dzzfs[row]=dzzf;
			mark[row]="0";

			row++;
		}
		rs.close();
		ps.close();

		//首先选组不同施工队班组【kxsgds】个，施工队不重复
		for (int i=0;i<row ;i++ )
		{
			if (pdsgd>=kxsgds)
			{
				break;
			}

			if (hxsgdstr.indexOf("value=\""+sgds[i]+"*")==-1)//没有，增加
			{
				mark[i]="1";//表示已选择
				pdsgd++;
				hxsgdstr+=sgds[i]+"*"+bzmcs[i]+"+"+bzmcs[i]+"(班长:"+bzzfs[i]+"分,队长:"+dzzfs[i]+"分)("+sgdmcs[i]+")(同城区)%";
			}
		}

		if (pdsgd<kxsgds)//数量不足，补充剩余班组
		{
			for (int i=0;i<row ;i++ )
			{
				if (pdsgd>=kxsgds)
				{
					break;
				}

				if (mark[i].equals("0"))//未选择
				{
					mark[i]="1";//表示已选择
					pdsgd++;
					hxsgdstr+=sgds[i]+"*"+bzmcs[i]+"+"+bzmcs[i]+"(班长:"+bzzfs[i]+"分,队长:"+dzzfs[i]+"分)("+sgdmcs[i]+")(同城区)%";
				}
			}
		}
	}


	//正常派单
	if (lx.equals("3"))
	{
		row=0;
		ls_sql =" select *";
		ls_sql+=" from ( ";
		ls_sql+=" select kp_yzfbzpdkpjg.sgd,sgdmc,kp_yzfbzpdkpjg.bzmc,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(sq_sgd.pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) dzzf,(NVL(-1*sq_bzxx.bzpdjf,0)+NVL(sq_bzxx.bzwgjf,0)+NVL(sq_bzxx.pdkpf,0)+(NVL(sq_bzxx.zdzsgds,0)-NVL(sq_bzxx.mqzsgds,0))) bzzf";
		ls_sql+=" from kp_yzfbzpdkpjg,sq_bzxx,sq_sgd ";
		ls_sql+=" where kp_yzfbzpdkpjg.sgd=sq_sgd.sgd and kp_yzfbzpdkpjg.ssfgs='"+ssfgs+"'";
		ls_sql+=" and kp_yzfbzpdkpjg.sgd=sq_bzxx.sgd and kp_yzfbzpdkpjg.bzmc =sq_bzxx.bzmc ";

		ls_sql+=" and sq_bzxx.tdbz='N'";//状态, Y：停单；N：正常；K：开除；L：离职
		ls_sql+=" and kp_yzfbzpdkpjg.zbjsfdb='Y'";//质保金是否达标, Y：是；N：否
		ls_sql+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj < SYSDATE )) ";

		ls_sql+=" and sq_bzxx.khmyd>=80";//客户满意度低于80%的班长不能派单
		ls_sql+=" and sq_sgd.khmyd>=80";//客户满意度低于80%的项目经理不能派单
		ls_sql+=" and sq_bzxx.kygrsl>=2";//可用工人数量
		ls_sql+=" and sq_bzxx.mqzsgds<sq_bzxx.zdzsgds";// 目前在施工地数 < 班组最大在施工地数 
		ls_sql+=" and sq_bzxx.kjdzdz>="+qyeall;//单额 <= 可接单额最大值
		ls_sql+=" and ((sq_bzxx.mqzsgds>=sq_bzxx.zxzsgds and sq_bzxx.kjdzxz<="+qyeall+") OR (sq_bzxx.mqzsgds<sq_bzxx.zxzsgds))";//单额 < 可接单最小值

		ls_sql+=" order by bzzf desc,dzzf desc,sq_bzxx.khmyd desc,sq_sgd.khmyd desc,sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm";
		ls_sql+=" ) ";
		ls_sql+=" where rownum<=50";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getsgd=cf.fillNull(rs.getString("sgd"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			bzmc=cf.fillNull(rs.getString("bzmc"));
			bzzf=cf.fillNull(rs.getString("bzzf"));
			dzzf=cf.fillNull(rs.getString("dzzf"));

			sgds[row]=getsgd;
			sgdmcs[row]=sgdmc;
			bzmcs[row]=bzmc;
			bzzfs[row]=bzzf;
			dzzfs[row]=dzzf;
			mark[row]="0";

			row++;
		}
		rs.close();
		ps.close();

		//首先选不同施工队班组【kxsgds】个，施工队不重复
		for (int i=0;i<row ;i++ )
		{
			if (pdsgd>=kxsgds)
			{
				break;
			}

			if (hxsgdstr.indexOf(sgds[i])==-1)//没有，增加
			{
				mark[i]="1";//表示已选择
				pdsgd++;
				hxsgdstr+=sgds[i]+"*"+bzmcs[i]+"+"+bzmcs[i]+"(班长:"+bzzfs[i]+"分,队长:"+dzzfs[i]+"分)("+sgdmcs[i]+")(正常)%";
			}
		}

		if (pdsgd<kxsgds)//数量不足，补充剩余班组
		{
			for (int i=0;i<row ;i++ )
			{
				if (pdsgd>=kxsgds)
				{
					break;
				}

				if (mark[i].equals("0"))//未选择
				{
					mark[i]="1";//表示已选择
					pdsgd++;
					hxsgdstr+=sgds[i]+"*"+bzmcs[i]+"+"+bzmcs[i]+"(班长:"+bzzfs[i]+"分,队长:"+dzzfs[i]+"分)("+sgdmcs[i]+")(正常)%";
				}
			}
		}
	}

	out.println(hxsgdstr);

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
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



