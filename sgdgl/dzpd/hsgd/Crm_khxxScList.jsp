<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khbh=null;
	String khxm=null;
	String cqbm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String sjs=null;


	String pdclzt=null;
	String lrsj=null;
	String newsgd=null;
	String oldsgd=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+pdclzt+"')";
	}



	newsgd=request.getParameter("newsgd");
	if (newsgd!=null)
	{
		newsgd=cf.GB2Uni(newsgd);
		if (!(newsgd.equals("")))	wheresql+=" and  (pd_hsgdjl.newsgd='"+newsgd+"')";
	}
	oldsgd=request.getParameter("oldsgd");
	if (oldsgd!=null)
	{
		oldsgd=cf.GB2Uni(oldsgd);
		if (!(oldsgd.equals("")))	wheresql+=" and  (pd_hsgdjl.oldsgd='"+oldsgd+"')";
	}

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (pd_hsgdjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (pd_hsgdjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_khxx.khbh,hth,DECODE(pdclzt,'1','申请派单','2','人工派单','5','电子派单','6','特权派单','7','拒单','8','换施工队','4','不许修改派单') pdclzt,DECODE(kgsjqd,'Y','已确定','N','<font color=\"#FF00FF\">未确定</font>') kgsjqd";
	ls_sql+=" ,pd_hsgdjl.newsgd,a.sgdmc newsgdmc,b.sgdmc oldsgdmc,pd_hsgdjl.newsgbz,pd_hsgdjl.oldsgbz,pd_hsgdjl.oldkzbbfb||'%' oldkzbbfb,pd_hsgdjl.newkzbbfb||'%' newkzbbfb,crm_khxx.zjxm";
	ls_sql+=" ,DECODE(crm_khxx.jlbz,'0','人工派单','1','回单奖励','2','公司奖励','3','设计师指定派单','4','客户指定派单','5','大单抵小单','6','小单抵大单','7','特殊情况','8','电子派单','9','同小区派单') jlbz";
	ls_sql+=" ,pd_hsgdjl.hsgdyy,pd_hsgdjl.lrsj,pd_hsgdjl.lrr,jyjdrq";
	ls_sql+=" ,DECODE(hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') hdbz,khxm,fwdz,sjs,sq_dwxx.dwmc sqdm";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd a,sq_sgd b,pd_hsgdjl ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=" and pd_hsgdjl.newsgd=a.sgd(+) and pd_hsgdjl.oldsgd=b.sgd(+) ";
    ls_sql+=" and crm_khxx.gcjdbm!='5' ";//1：申请派单；2：人工派单；5：电子派单；6：特权派单；7：拒单；8：换施工队；4：不许修改派单
	ls_sql+=" and crm_khxx.khbh=pd_hsgdjl.khbh and crm_khxx.sgd=pd_hsgdjl.newsgd";
	ls_sql+=wheresql;
    ls_sql+=" order by pd_hsgdjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxScList.jsp","SelectScCrm_khxx.jsp","","");
	pageObj.setPageRow(15);//设置每页显示记录数

//设置显示列
	String[] disColName={"hth","khxm","pdclzt","oldsgdmc","oldsgbz","newsgdmc","newsgbz","oldkzbbfb","newkzbbfb","zjxm","jlbz","lrsj","lrr","hsgdyy","kgsjqd","jyjdrq","hdbz","fwdz","sjs","sqdm"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"khbh","newsgd"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除换施工队信息"};//按钮的显示名称
	String[] buttonLink={"DeletePd_hsgdjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
/*
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
*/
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
  <B><font size="3">删除--换施工队信息（注意：已完结不能再修改） </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">合同号</td>
	<td  width="4%">姓名</td>
	<td  width="4%">派单状态</td>
	<td  width="3%">原施工队</td>
	<td  width="3%">原施工班长</td>
	<td  width="3%">新施工队</td>
	<td  width="3%">新施工班长</td>
	<td  width="3%">扣原施工队派单指标百分比</td>
	<td  width="3%">扣新施工队派单指标百分比</td>
	<td  width="3%">质检</td>
	<td  width="5%">派单类型</td>
	<td  width="5%">换施工队时间</td>
	<td  width="3%">操作人</td>
	<td  width="17%">换施工队原因</td>
	<td  width="3%">开工时间</td>
	<td  width="5%">交底日期</td>
	<td  width="4%">回单标志</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="7%">签约店面</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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