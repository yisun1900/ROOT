<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>


<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010218")==0) 
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

	String sq_yhxx_yhmc=null;
	String sq_yhxx_dwbh=null;

	String zwbm=null;


	String sq_dwxx_dwlx=null;
	sq_dwxx_dwlx=request.getParameter("sq_dwxx_dwlx");
	if (sq_dwxx_dwlx!=null)
	{
		sq_dwxx_dwlx=cf.GB2Uni(sq_dwxx_dwlx);
		if (!(sq_dwxx_dwlx.equals("")))	wheresql+=" and  (a.dwlx='"+sq_dwxx_dwlx+"')";
	}

	String kfgssq=null;
	kfgssq=request.getParameter("kfgssq");
	if (kfgssq!=null)
	{
		kfgssq=cf.GB2Uni(kfgssq);
		if (!(kfgssq.equals("")))	wheresql+=" and  (sq_yhxx.kfgssq='"+kfgssq+"')";
	}

	String xzzwbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	String kdlxtbz=null;
	kdlxtbz=request.getParameter("kdlxtbz");
	if (kdlxtbz!=null)
	{
		kdlxtbz=cf.GB2Uni(kdlxtbz);
		if (!(kdlxtbz.equals("")))	wheresql+=" and  (sq_yhxx.kdlxtbz='"+kdlxtbz+"')";
	}

	String kkbbz=null;
	kkbbz=request.getParameter("kkbbz");
	if (kkbbz!=null)
	{
		kkbbz=cf.GB2Uni(kkbbz);
		if (!(kkbbz.equals("")))	wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"')";
	}

	String khdhbz=null;
	khdhbz=request.getParameter("khdhbz");
	if (khdhbz!=null)
	{
		khdhbz=cf.GB2Uni(khdhbz);
		if (!(khdhbz.equals("")))	wheresql+=" and  (sq_yhxx.khdhbz='"+khdhbz+"')";
	}

	String sq_yhxx_yhjs=null;
	sq_yhxx_yhjs=request.getParameter("sq_yhxx_yhjs");
	if (sq_yhxx_yhjs!=null)
	{
		sq_yhxx_yhjs=cf.GB2Uni(sq_yhxx_yhjs);
		if (!(sq_yhxx_yhjs.equals("")))	wheresql+=" and  (sq_yhxx.yhjs='"+sq_yhxx_yhjs+"')";
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
	
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		if (!(zwbm.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+zwbm+"')";
	}

	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	ls_sql="SELECT sq_yhxx.ygbh,sq_yhxx.bianhao,sq_yhxx.yhmc,sq_yhxx.yhdlm,DECODE(kdlxtbz,'Y','可以','N','不可') kdlxtbz,DECODE(kkbbz,'Y','是','N','') kkbbz,DECODE(sq_yhxx.khdhbz,'N','否','Y','可看') khdhbz,a.dwmc||'（'||a.dwbh||'）' as ssdw,DECODE(sq_yhxx.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','部门小组','S0','施工队','G0','供应商','J0','加盟商') as yhjs,xzzwbm,zwmc,DECODE(sq_yhxx.kfgssq,'0','不授权','1','授权单个分公司','2','授权多个分公司','3','授权单个店面','4','授权某一分公司多个店面','5','授权多个分公司多个店面') as kfgssq,bjjb,b.dwmc ssfgs";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,dm_zwbm";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=" and (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000') OR sq_yhxx.yhdlm is null)";
	
	ls_sql+=wheresql;
    ls_sql+=ordersql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("PlYhSqList.jsp","","","");
	pageObj.setPageRow(3000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ygbh","sq_yhxx_yhmc","sq_yhxx_yhkl","sq_yhxx_yhjs","sq_dwxx_dwmc","sq_yhxx_dh","sq_yhxx_email"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"可登陆","可拷贝","可看电话","授权角色","授权用户组","授权默认用户名","授权初始密码","授权店面公司","授权报价级别"};//按钮的显示名称
	String[] buttonLink={"PlKdl.jsp","PlKkb.jsp","PlKkdh.jsp","PlSqJs.jsp","PlSqYhz.jsp","PlSqYhm.jsp","PlSqCsmm.jsp","PlSqDmFgs.jsp","PlSqBjjb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1,1,1,1,1,1,1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


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
  <B><font size="3">批量用户授权(已离职的员工不能显示)</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">员工编号</td>
	<td  width="7%">工号</td>
	<td  width="6%">员工名称</td>
	<td  width="8%">用户登陆名</td>
	<td  width="4%">可登陆系统</td>
	<td  width="4%">可拷贝</td>
	<td  width="4%">查看客户电话</td>
	<td  width="14%">所属部门</td>
	<td  width="7%">角色</td>
	<td  width="7%">职务</td>
	<td  width="7%">工种</td>
	<td  width="9%">客户资料授权范围</td>
	<td  width="8%">报价级别</td>
	<td  width="8%">分公司</td>
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