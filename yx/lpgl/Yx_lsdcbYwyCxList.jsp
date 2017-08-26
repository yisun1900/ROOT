<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

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
	String cqbm=null;
	String xqmc=null;
	String xsfs=null;
	String hxzl=null;
	String kfs=null;
	String jzs=null;
	String xss=null;
	String yzxfsp=null;
	String fyssj=null;
	String lrsj=null;
	String ywy=null;

	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (yx_lsdcb.lrr='"+lrr+"')";
	}

	String sftizxq=null;
	sftizxq=request.getParameter("sftizxq");
	if (sftizxq!=null)
	{
		sftizxq=cf.GB2Uni(sftizxq);
		if (!(sftizxq.equals("")))	wheresql+=" and  (yx_lsdcb.sftizxq='"+sftizxq+"')";
	}
	String sfjcxc=null;
	sfjcxc=request.getParameter("sfjcxc");
	if (sfjcxc!=null)
	{
		sfjcxc=cf.GB2Uni(sfjcxc);
		if (!(sfjcxc.equals("")))	wheresql+=" and  (yx_lsdcb.sfjcxc='"+sfjcxc+"')";
	}
	String xqbh=null;
	xqbh=request.getParameter("xqbh");
	if (xqbh!=null)
	{
		xqbh=cf.GB2Uni(xqbh);
		if (!(xqbh.equals("")))	wheresql+=" and  (yx_lsdcb.xqbh='"+xqbh+"')";
	}

	String yjzxsj=null;
	yjzxsj=request.getParameter("yjzxsj");
	if (yjzxsj!=null)
	{
		yjzxsj=yjzxsj.trim();
		if (!(yjzxsj.equals("")))	wheresql+="  and (yx_lsdcb.yjzxsj>=TO_DATE('"+yjzxsj+"','YYYY/MM/DD'))";
	}
	yjzxsj=request.getParameter("yjzxsj2");
	if (yjzxsj!=null)
	{
		yjzxsj=yjzxsj.trim();
		if (!(yjzxsj.equals("")))	wheresql+="  and (yx_lsdcb.yjzxsj<=TO_DATE('"+yjzxsj+"','YYYY/MM/DD'))";
	}
	
	
	
	String kfjd=null;
	kfjd=request.getParameter("kfjd");
	if (kfjd!=null)
	{
		kfjd=cf.GB2Uni(kfjd);
		if (!(kfjd.equals("")))	wheresql+=" and  (yx_lsdcb.kfjd='"+kfjd+"')";
	}
	String dysfwc=null;
	dysfwc=request.getParameter("dysfwc");
	if (dysfwc!=null)
	{
		dysfwc=cf.GB2Uni(dysfwc);
		if (!(dysfwc.equals("")))	wheresql+=" and  (yx_lsdcb.dysfwc='"+dysfwc+"')";
	}

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (yx_lsdcb.fgsbh='"+fgsbh+"')";
	}

	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (yx_lsdcb.cqbm='"+cqbm+"')";
	}
	xqmc=request.getParameter("xqmc");
	if (xqmc!=null)
	{
		xqmc=cf.GB2Uni(xqmc);
		if (!(xqmc.equals("")))	wheresql+=" and  (yx_lsdcb.xqmc like '%"+xqmc+"%')";
	}

	xsfs=request.getParameter("xsfs");
	if (xsfs!=null)
	{
		xsfs=cf.GB2Uni(xsfs);
		if (!(xsfs.equals("")))	wheresql+=" and  (yx_lsdcb.xsfs='"+xsfs+"')";
	}
	hxzl=request.getParameter("hxzl");
	if (hxzl!=null)
	{
		hxzl=cf.GB2Uni(hxzl);
		if (!(hxzl.equals("")))	wheresql+=" and  (yx_lsdcb.hxzl='"+hxzl+"')";
	}
	kfs=request.getParameter("kfs");
	if (kfs!=null)
	{
		kfs=cf.GB2Uni(kfs);
		if (!(kfs.equals("")))	wheresql+=" and  (yx_lsdcb.kfs='"+kfs+"')";
	}
	jzs=request.getParameter("jzs");
	if (jzs!=null)
	{
		jzs=cf.GB2Uni(jzs);
		if (!(jzs.equals("")))	wheresql+=" and  (yx_lsdcb.jzs='"+jzs+"')";
	}
	xss=request.getParameter("xss");
	if (xss!=null)
	{
		xss=cf.GB2Uni(xss);
		if (!(xss.equals("")))	wheresql+=" and  (yx_lsdcb.xss='"+xss+"')";
	}
	yzxfsp=request.getParameter("yzxfsp");
	if (yzxfsp!=null)
	{
		yzxfsp=cf.GB2Uni(yzxfsp);
		if (!(yzxfsp.equals("")))	wheresql+=" and  (yx_lsdcb.yzxfsp='"+yzxfsp+"')";
	}
	fyssj=request.getParameter("fyssj");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj>=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	fyssj=request.getParameter("fyssj2");
	if (fyssj!=null)
	{
		fyssj=fyssj.trim();
		if (!(fyssj.equals("")))	wheresql+="  and (yx_lsdcb.fyssj<=TO_DATE('"+fyssj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (yx_lsdcb.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (yx_lsdcb.ywy='"+ywy+"')";
	}

    

	ls_sql="SELECT yx_lsdcb.xqbh,yx_lsdcb.dqbm,dqmc,xqmc,DECODE(kfjd,'1','未开发','2','已申请','3','已批准','4','未批准','5','已完成') kfjd,DECODE(dysfwc,'N','未完成','Y','完成') dysfwc,cqmc,b.dwmc tjdm,jw,dz,xz,xsfs,xszk,xqgm,hxzl,yzxfsp,fyssj,ywy,cclx,xqzhpj,xcxg,kfs,jzs,xss,sldh,DECODE(ywzxgs,'Y','有','N','无') ywzxgs,zxgssl,DECODE(ywwygs,'Y','有','N','无') ywwygs,yzxhs,ffdw,yx_lsdcb.dwdz,yx_lsdcb.dwdh,lxr,wyfzr,wydh,wylxr,lrr,lrsj,a.dwmc fgsbh  ";
	ls_sql+=" FROM yx_lsdcb,dm_cqbm,dm_dqbm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yx_lsdcb.cqbm=dm_cqbm.cqbm and yx_lsdcb.dqbm=dm_dqbm.dqbm and yx_lsdcb.fgsbh=a.dwbh and yx_lsdcb.tjdm=b.dwbh(+)";
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and yx_lsdcb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and yx_lsdcb.dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and yx_lsdcb.dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.dwbh=sq_dwxx.dwbh and ygbh='"+ygbh+"' )";
	}
   ls_sql+=wheresql;
    ls_sql+=" order by yx_lsdcb.dqbm,xqmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_lsdcbYwyCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"xqbh","dqmc","xqmc","kfjd","dysfwc","cqmc","tjdm","jw","dz","xz","xsfs","xszk","xqgm","hxzl","yzxfsp","fyssj","ywy","cclx","xqzhpj","xcxg","kfs","jzs","xss","sldh","ywzxgs","zxgssl","ywwygs","yzxhs","ffdw","dwdz","dwdh","lxr","wyfzr","wydh","wylxr","lrr","lrsj","fgsbh"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","xqmc"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","xqmc"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewYx_lsdcb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xqmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<CENTER >
  <B><font size="3">查询－楼盘信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">小区编号</td>
	<td  width="1%">地区</td>
	<td  width="3%">小区名称</td>
	<td  width="1%">开发进度</td>
	<td  width="1%">调研是否完成</td>
	<td  width="2%">城区</td>
	<td  width="2%">推荐店面</td>
	<td  width="2%">价位</td>
	<td  width="4%">地址</td>
	<td  width="3%">性质</td>
	<td  width="2%">销售方式</td>
	<td  width="6%">销售状况</td>
	<td  width="4%">小区规模</td>
	<td  width="3%">户型种类</td>
	<td  width="2%">楼盘定位</td>
	<td  width="2%">交钥匙时间</td>
	<td  width="2%">业务员</td>
	<td  width="5%">周边环境及乘车路线</td>
	<td  width="7%">小区综合评价</td>
	<td  width="5%">宣传效果</td>
	<td  width="4%">开发商</td>
	<td  width="4%">建筑商</td>
	<td  width="4%">销售商</td>
	<td  width="4%">售楼电话</td>
	<td  width="1%">有无装修公司</td>
	<td  width="1%">装修公司数量</td>
	<td  width="1%">有无物业公司</td>
	<td  width="1%">已装修户数</td>
	<td  width="3%">团购单位</td>
	<td  width="3%">单位地址</td>
	<td  width="2%">单位电话</td>
	<td  width="2%">联系人</td>
	<td  width="2%">物业负责人</td>
	<td  width="3%">物业电话</td>
	<td  width="2%">物业联系人</td>
	<td  width="1%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">公司</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>