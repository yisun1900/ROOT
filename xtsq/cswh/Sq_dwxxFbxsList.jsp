<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010131")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

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
	String sq_dwxx_dwdz=null;
	String sq_dwxx_dwfzr=null;
	String sq_dwxx_dwdh=null;
	String sq_dwxx_dwcz=null;
	String sq_dwxx_email=null;
	String sq_scfgxx_fgflbm=null;
	String sq_scysxx_ysbm=null;
	String sq_sgcqxx_cqbm=null;

	String sq_dwxx_dwlx=null;
	sq_dwxx_dwlx=request.getParameter("sq_dwxx_dwlx");
	if (sq_dwxx_dwlx!=null)
	{
		sq_dwxx_dwlx=cf.GB2Uni(sq_dwxx_dwlx);
		if (!(sq_dwxx_dwlx.equals("")))	wheresql+=" and  (sq_dwxx.dwlx='"+sq_dwxx_dwlx+"')";
	}


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


	ls_sql="SELECT sq_dwxx.dwbh,dwmc,DECODE(dzbjjc,'1','根据[折扣率]算[签约额]','2','根据[签约额]算[折扣率]','3','全部人工录入','6','人工录入,计算减免','4','签约额、折扣自动取','7','签约额、折扣自动,其它优惠可改','5','签约额自动取，录入折扣'),sq_dwxx.gcjcbjxs,sq_dwxx.sgcbbjxs,DECODE(sq_dwxx.sfqyyssh,'Y','启用','N','不启用'),DECODE(sq_dwxx.zdyxmshbz,'Y','启用','N','不启用'),sq_dwxx.zdyxmyxq,sq_dwxx.clfbfb||'%',sq_dwxx.cbbfb||'%',sq_dwxx.bianma,sq_dwxx.dhqh,DECODE(dwlx,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','设计小组','F4','市场小组','F5','其它小组') as dwlx,DECODE(sfjms,'Y','加盟','N','直营公司','Q','其它公司'),DECODE(sq_dwxx.cxbz,'Y','撤销','N','否'),dwdh ";
	ls_sql+=" FROM sq_dwxx  ";
    ls_sql+=" where sq_dwxx.dwlx in('A0','F0')";
    ls_sql+=wheresql;
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" order by dwbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_dwxxFbxsList.jsp","","","EditFbxsSq_dwxx.jsp");
//	pageObj.setPageRow(20);//设置每页显示记录数


//设置主键
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/xtsq/dwxx/ViewSq_dwxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dwbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">施工队发包系数－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">单位编号</td>
	<td  width="10%">单位名称</td>
	<td  width="10%">启用电子报价检查</td>
	<td  width="5%">工程基础报价系数</td>
	<td  width="5%">施工成本报价系数</td>
	<td  width="5%">是否启用预算审核</td>
	<td  width="5%">是否启用自定义项审核</td>
	<td  width="5%">自定义项目有效期</td>
	<td  width="5%">自定义项材料费百分比</td>
	<td  width="5%">自定义项成本百分比</td>
	<td  width="4%">编码</td>
	<td  width="4%">电话区号</td>
	<td  width="4%">单位类型</td>
	<td  width="5%">公司类型</td>
	<td  width="4%">撤店标志</td>
	<td  width="22%">电话</td>
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