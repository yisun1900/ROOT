<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010102")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_dwxx_dwbh=null;
	String sq_dwxx_dwmc=null;
	String sq_dwxx_dwjc=null;
	String sq_dwxx_ssdw=null;
	String sq_dwxx_dwlx=null;
	String sq_dwxx_dwdz=null;
	String sq_dwxx_dwfzr=null;
	String sq_dwxx_dwdh=null;
	String sq_dwxx_dwcz=null;
	String sq_dwxx_email=null;
	String sq_scfgxx_fgflbm=null;
	String sq_scysxx_ysbm=null;
	String sq_sgcqxx_cqbm=null;



	String dmxs=null;
	dmxs=request.getParameter("dmxs");
	if (dmxs!=null)
	{
		dmxs=cf.GB2Uni(dmxs);
		if (!(dmxs.equals("")))	wheresql+=" and  (sq_dwxx.dmxs='"+dmxs+"')";
	}

	String ssfw=null;
	ssfw=request.getParameter("ssfw");
	if (ssfw!=null)
	{
		ssfw=cf.GB2Uni(ssfw);
		if (!(ssfw.equals("")))	wheresql+=" and  (sq_dwxx.ssfw='"+ssfw+"')";
	}
	String dwjb=null;
	dwjb=request.getParameter("dwjb");
	if (dwjb!=null)
	{
		dwjb=cf.GB2Uni(dwjb);
		if (!(dwjb.equals("")))	wheresql+=" and  (sq_dwxx.dwjb='"+dwjb+"')";
	}

	String dwflbm=null;
	dwflbm=request.getParameter("dwflbm");
	if (dwflbm!=null)
	{
		dwflbm=cf.GB2Uni(dwflbm);
		if (!(dwflbm.equals("")))	wheresql+=" and  (sq_dwxx.dwflbm='"+dwflbm+"')";
	}
	String ssdqbm=null;
	ssdqbm=request.getParameter("ssdqbm");
	if (ssdqbm!=null)
	{
		ssdqbm=cf.GB2Uni(ssdqbm);
		if (!(ssdqbm.equals("")))	wheresql+=" and  (sq_dwxx.ssdqbm='"+ssdqbm+"')";
	}


	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (sq_xmzy.xmzy='"+xmzy+"')";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String hthqz=null;
	hthqz=request.getParameter("hthqz");
	if (hthqz!=null)
	{
		if (!(hthqz.equals("")))	wheresql+=" and  (sq_dwxx.hthqz='"+hthqz+"')";
	}
	String cxbz=null;
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_dwxx.cxbz='"+cxbz+"')";
	}

	String sfjms=null;
	sfjms=request.getParameter("sfjms");
	if (sfjms!=null)
	{
		if (!(sfjms.equals("")))	wheresql+=" and  (sq_dwxx.sfjms='"+sfjms+"')";
	}
	
	sq_dwxx_dwbh=request.getParameter("sq_dwxx_dwbh");
	if (sq_dwxx_dwbh!=null)
	{
		sq_dwxx_dwbh=cf.GB2Uni(sq_dwxx_dwbh);
		if (!(sq_dwxx_dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+sq_dwxx_dwbh+"')";
	}
	String sq_dwxx_dqbm=null;
	sq_dwxx_dqbm=request.getParameter("sq_dwxx_dqbm");
	if (sq_dwxx_dqbm!=null)
	{
		if (!(sq_dwxx_dqbm.equals("")))	wheresql+=" and  (sq_dwxx.dqbm='"+sq_dwxx_dqbm+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc like '%"+sq_dwxx_dwmc+"%')";
	}
	sq_dwxx_dwjc=request.getParameter("sq_dwxx_dwjc");
	if (sq_dwxx_dwjc!=null)
	{
		sq_dwxx_dwjc=cf.GB2Uni(sq_dwxx_dwjc);
		if (!(sq_dwxx_dwjc.equals("")))	wheresql+=" and  (sq_dwxx.dwjc='"+sq_dwxx_dwjc+"')";
	}
	sq_dwxx_ssdw=request.getParameter("sq_dwxx_ssdw");
	if (sq_dwxx_ssdw!=null)
	{
		sq_dwxx_ssdw=cf.GB2Uni(sq_dwxx_ssdw);
		if (!(sq_dwxx_ssdw.equals("")))	wheresql+=" and  (sq_dwxx.ssdw='"+sq_dwxx_ssdw+"')";
	}
	sq_dwxx_dwlx=request.getParameter("sq_dwxx_dwlx");
	if (sq_dwxx_dwlx!=null)
	{
		sq_dwxx_dwlx=cf.GB2Uni(sq_dwxx_dwlx);
		if (!(sq_dwxx_dwlx.equals("")))	wheresql+=" and  (sq_dwxx.dwlx='"+sq_dwxx_dwlx+"')";
	}
	sq_dwxx_dwdz=request.getParameter("sq_dwxx_dwdz");
	if (sq_dwxx_dwdz!=null)
	{
		sq_dwxx_dwdz=cf.GB2Uni(sq_dwxx_dwdz);
		if (!(sq_dwxx_dwdz.equals("")))	wheresql+=" and  (sq_dwxx.dwdz='"+sq_dwxx_dwdz+"')";
	}
	sq_dwxx_dwfzr=request.getParameter("sq_dwxx_dwfzr");
	if (sq_dwxx_dwfzr!=null)
	{
		sq_dwxx_dwfzr=cf.GB2Uni(sq_dwxx_dwfzr);
		if (!(sq_dwxx_dwfzr.equals("")))	wheresql+=" and  (sq_dwxx.dwfzr='"+sq_dwxx_dwfzr+"')";
	}
	sq_dwxx_dwdh=request.getParameter("sq_dwxx_dwdh");
	if (sq_dwxx_dwdh!=null)
	{
		sq_dwxx_dwdh=cf.GB2Uni(sq_dwxx_dwdh);
		if (!(sq_dwxx_dwdh.equals("")))	wheresql+=" and  (sq_dwxx.dwdh='"+sq_dwxx_dwdh+"')";
	}
	sq_dwxx_dwcz=request.getParameter("sq_dwxx_dwcz");
	if (sq_dwxx_dwcz!=null)
	{
		sq_dwxx_dwcz=cf.GB2Uni(sq_dwxx_dwcz);
		if (!(sq_dwxx_dwcz.equals("")))	wheresql+=" and  (sq_dwxx.dwcz='"+sq_dwxx_dwcz+"')";
	}
	sq_dwxx_email=request.getParameter("sq_dwxx_email");
	if (sq_dwxx_email!=null)
	{
		sq_dwxx_email=cf.GB2Uni(sq_dwxx_email);
		if (!(sq_dwxx_email.equals("")))	wheresql+=" and  (sq_dwxx.email='"+sq_dwxx_email+"')";
	}


	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));

	ls_sql="SELECT ssdqmc,dqmc,(select dwmc from sq_dwxx b where b.dwbh=sq_dwxx.ssfgs) ssfgs,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,DECODE(dwlx,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','设计小组','F4','市场小组','F5','其它小组') as dwlx,sq_dwxx.xuhao,sq_dwxx.dwbh,dwmc,sq_dwxx.bianma,sq_dwxx.hthqz,dwflmc,DECODE(sfjms,'Y','加盟','N','直营公司','Q','其它公司'),ssfwmc,dwjbmc,DECODE(sq_dwxx.cxbz,'Y','撤销','N',''),dwdh,dwcz,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.bz";
	ls_sql+=" FROM sq_dwxx,dm_dqbm,sq_ssdqbm,dm_dwflbm,dm_ssfw,dm_dwjb,dm_dmxs  ";
    ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm(+) and sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) and sq_dwxx.dwflbm=dm_dwflbm.dwflbm(+)";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
    ls_sql+=wheresql;
	if (!jgpx1.equals(""))
	{
		ls_sql+=" order by "+jgpx1;
	}
	else{
		ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.ssdw,sq_dwxx.dwlx,dwbh";
	}
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_dwxxCxList.jsp","","","");
	pageObj.setPageRow(27);//设置每页显示记录数


//设置主键
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewSq_dwxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dwbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssdqmc","1");//列参数对象加入Hash表
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("ssfgs","1");//列参数对象加入Hash表
	spanColHash.put("ssdwmc","1");//列参数对象加入Hash表
	spanColHash.put("dwlx","1");//列参数对象加入Hash表
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
  <B><font size="3">单位信息－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">所属大区</td>
	<td  width="3%">所属地区</td>
	<td  width="4%">所属分公司</td>
	<td  width="5%">上级单位</td>
	<td  width="4%">单位类型</td>
	<td  width="2%">序号</td>
	<td  width="3%">单位编号</td>
	<td  width="7%">单位名称</td>
	<td  width="2%">编码</td>
	<td  width="3%">合同号前缀</td>
	<td  width="4%">单位分类</td>
	<td  width="3%">公司类型</td>
	<td  width="4%">所属方位</td>
	<td  width="3%">单位级别</td>
	<td  width="2%">撤店标志</td>
	<td  width="14%">电话</td>
	<td  width="12%">传真</td>
	<td  width="3%">开店时间</td>
	<td  width="3%">关店时间</td>
	<td  width="16%">备注</td>
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