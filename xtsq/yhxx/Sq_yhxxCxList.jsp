<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String getygbh=(String)session.getAttribute("ygbh");
String getkfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_yhxx_yhdlm=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_yhkl=null;
	String sq_yhxx_yhjs=null;
	String dwbh=null;

	String ckjgbz=null;
	String zwbm=null;
	String zdyhbz=null;

	String kfgssq=request.getParameter("kfgssq");
	if (kfgssq!=null)
	{
		kfgssq=cf.GB2Uni(kfgssq);
		if (!(kfgssq.equals("")))	wheresql+=" and  (sq_yhxx.kfgssq='"+kfgssq+"')";
	}


	String kkglfx=request.getParameter("kkglfx");
	if (kkglfx!=null)
	{
		kkglfx=cf.GB2Uni(kkglfx);
		if (!(kkglfx.equals("")))	wheresql+=" and  (sq_yhxx.kkglfx='"+kkglfx+"')";
	}

	String khdhbz=request.getParameter("khdhbz");
	if (khdhbz!=null)
	{
		khdhbz=cf.GB2Uni(khdhbz);
		if (!(khdhbz.equals("")))	wheresql+=" and  (sq_yhxx.khdhbz='"+khdhbz+"')";
	}

	String sjxzbz=request.getParameter("sjxzbz");
	if (sjxzbz!=null)
	{
		sjxzbz=cf.GB2Uni(sjxzbz);
		if (!(sjxzbz.equals("")))	wheresql+=" and  (sq_yhxx.sjxzbz='"+sjxzbz+"')";
	}

	String sbsj=request.getParameter("sbsj");
	if (sbsj!=null)
	{
		sbsj=cf.GB2Uni(sbsj);
		if (!(sbsj.equals("")))	wheresql+=" and  (sq_yhxx.sbsj='"+sbsj+"')";
	}

	String xbsj=request.getParameter("xbsj");
	if (xbsj!=null)
	{
		xbsj=cf.GB2Uni(xbsj);
		if (!(xbsj.equals("")))	wheresql+=" and  (sq_yhxx.xbsj='"+xbsj+"')";
	}

	String ipxzbz=request.getParameter("ipxzbz");
	if (ipxzbz!=null)
	{
		ipxzbz=cf.GB2Uni(ipxzbz);
		if (!(ipxzbz.equals("")))	wheresql+=" and  (sq_yhxx.ipxzbz='"+ipxzbz+"')";
	}

	String ipdz=request.getParameter("ipdz");
	if (ipdz!=null)
	{
		ipdz=cf.GB2Uni(ipdz);
		if (!(ipdz.equals("")))	wheresql+=" and  (sq_yhxx.ipdz like '%"+ipdz+"%')";
	}

	String wkxzbz=request.getParameter("wkxzbz");
	if (wkxzbz!=null)
	{
		wkxzbz=cf.GB2Uni(wkxzbz);
		if (!(wkxzbz.equals("")))	wheresql+=" and  (sq_yhxx.wkxzbz='"+wkxzbz+"')";
	}

	String wkdz=request.getParameter("wkdz");
	if (wkdz!=null)
	{
		wkdz=cf.GB2Uni(wkdz);
		if (!(wkdz.equals("")))	wheresql+=" and  (sq_yhxx.wkdz like '%"+wkdz+"%')";
	}

	String[] bjjbbm=request.getParameterValues("bjjbbm");
	if (bjjbbm!=null)
	{
		String bjjb="";
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			String bjjbmc=null;

			if (bjjbbm[i].equals(""))
			{
				continue;
			}
			
			bjjbmc=cf.executeQuery("select bjjbmc from  bdm_bjjbbm where bjjbbm='"+bjjbbm[i]+"'");
			bjjb+="、"+bjjbmc;
		}
		if (!bjjb.equals(""))
		{
			bjjb=bjjb.substring(1);
			wheresql+=" and  (sq_yhxx.bjjb='"+bjjb+"')";
		}
	}

	String[] bjjbbm1=request.getParameterValues("bjjbbm1");
	if (bjjbbm1!=null)
	{
		wheresql+=" and  (sq_yhxx.ygbh in(select ygbh from sq_sjsbjjb where "+cf.arrayToInSQL(bjjbbm1,"sq_sjsbjjb.bjjbbm")+"))";
	}


	String xzzwbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}


	String kkbbz=null;
	kkbbz=request.getParameter("kkbbz");
	if (kkbbz!=null)
	{
		if (kkbbz.equals("Y"))
		{
			wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"')";
		}
		else{
			wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"' OR sq_yhxx.kkbbz is null)";
		}
	}
	
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	String ygbh=null;
	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		if (!(ygbh.equals("")))	wheresql+=" and  (sq_yhxx.ygbh='"+ygbh+"')";
	}
	String bianhao=null;
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}

	String kdlxtbz=null;
	kdlxtbz=request.getParameter("kdlxtbz");
	if (kdlxtbz!=null)
	{
		if (!(kdlxtbz.equals("")))	wheresql+=" and  (sq_yhxx.kdlxtbz='"+kdlxtbz+"')";
	}
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (sq_yhxx.sjsbh='"+sjsbh+"')";
	}
	zdyhbz=request.getParameter("zdyhbz");
	if (zdyhbz!=null)
	{
		if (!(zdyhbz.equals("")))	wheresql+=" and  (sq_yhxx.zdyhbz='"+zdyhbz+"')";
	}
	ckjgbz=request.getParameter("ckjgbz");
	if (ckjgbz!=null)
	{
		if (!(ckjgbz.equals("")))	wheresql+=" and  (sq_yhxx.ckjgbz='"+ckjgbz+"')";
	}
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		if (!(zwbm.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+zwbm+"')";
	}

	sq_yhxx_yhdlm=request.getParameter("sq_yhxx_yhdlm");
	if (sq_yhxx_yhdlm!=null)
	{
		sq_yhxx_yhdlm=cf.GB2Uni(sq_yhxx_yhdlm);
		if (!(sq_yhxx_yhdlm.equals("")))	wheresql+=" and  (sq_yhxx.yhdlm='"+sq_yhxx_yhdlm+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	sq_yhxx_yhkl=request.getParameter("sq_yhxx_yhkl");
	if (sq_yhxx_yhkl!=null)
	{
		sq_yhxx_yhkl=cf.GB2Uni(sq_yhxx_yhkl);
		if (!(sq_yhxx_yhkl.equals("")))	wheresql+=" and  (sq_yhxx.yhkl='"+sq_yhxx_yhkl+"')";
	}
	sq_yhxx_yhjs=request.getParameter("sq_yhxx_yhjs");
	if (sq_yhxx_yhjs!=null)
	{
		sq_yhxx_yhjs=cf.GB2Uni(sq_yhxx_yhjs);
		if (!(sq_yhxx_yhjs.equals("")))	wheresql+=" and  (sq_yhxx.yhjs='"+sq_yhxx_yhjs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by sq_yhxx.ssfgs,"+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	ls_sql="SELECT b.dwmc ssfgs,a.dwmc||'（'||a.dwbh||'）' as ssdw,DECODE(sq_yhxx.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','设计小组','F4','市场小组','F5','其它小组') as sq_yhxx_yhjs,zwmc,sq_yhxx.yhdlm as yhdlm,sq_yhxx.yhmc as sq_yhxx_yhmc,DECODE(ckjgbz,'Y','可看','N',''),DECODE(zdyhbz,'Y','是','N',''),DECODE(kkbbz,'Y','可拷贝','N','') kkbbz,DECODE(kdlxtbz,'Y','可登陆','N',''),bjjb,DECODE(sjxzbz,'Y','限制','N','不限制') sjxzbz,sbsj,xbsj,DECODE(ipxzbz,'Y','限制','N','不限制') ipxzbz,ipdz,DECODE(wkxzbz,'Y','限制','N','不限制') wkxzbz,wkdz,DECODE(sq_yhxx.khdhbz,'N','不可看','Y','可看'),DECODE(sq_yhxx.kkglfx,'N','不可看','Y','可看') kkglfx";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,dm_zwbm";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+) and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=" and ((sq_yhxx.yhdlm is null) OR (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";
	if (getkfgssq.equals("1") || getkfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+getygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+getygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_yhxxCxList.jsp","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yhdlm","sq_yhxx_yhmc","sq_yhxx_yhkl","sq_yhxx_yhjs","sq_dwxx_dwmc","sq_yhxx_dh","sq_yhxx_email"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yhdlm"};
	pageObj.setKey(keyName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssfgs","1");//列参数对象加入Hash表
	spanColHash.put("ssdw","1");//列参数对象加入Hash表
	spanColHash.put("sq_yhxx_yhjs","1");//列参数对象加入Hash表
	spanColHash.put("zwmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">用户授权－查询(已离职的员工不能显示)</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">分公司</td>
	<td  width="10%">所属部门</td>
	<td  width="6%">角色</td>
	<td  width="5%">工种</td>
	<td  width="5%">用户登陆名</td>
	<td  width="4%">用户名称</td>
	<td  width="4%">允许查看价格</td>
	<td  width="3%">重点用户</td>
	<td  width="4%">可拷贝标志</td>
	<td  width="3%">可登陆系统</td>
	<td  width="8%">报价级别</td>
	<td  width="3%">时间限制标志</td>
	<td  width="3%">上班时间</td>
	<td  width="3%">下班时间</td>
	<td  width="3%">IP地址限制</td>
	<td  width="8%">IP地址</td>
	<td  width="3%">网卡地址限制</td>
	<td  width="9%">网卡地址</td>
	<td  width="4%">查看客户电话标志</td>
	<td  width="3%">可看工料分析</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
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