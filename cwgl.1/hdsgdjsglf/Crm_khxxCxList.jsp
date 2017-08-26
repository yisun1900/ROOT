<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">审批未通过</font></B>
</CENTER>

<table border="1" width="300%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">结算记录号</td>
	<td  width="3%">结算进度</td>
	<td  width="2%">审批结论</td>
	<td  width="10%">审批意见</td>
	<td  width="2%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">施工队</td>
	<td  width="2%">家装标志</td>
	<td  width="3%">未打折工程额</td>
	<td  width="3%">工程签约额</td>
	<td  width="2%">折扣率</td>
	<td  width="2%">增减项金额</td>
	<td  width="3%">客户结算金额</td>
	<td  width="3%">工程实收款总额</td>
	<td  width="3%">提点基数</td>
	<td  width="2%">管理费提点</td>
	<td  width="2%">管理费</td>
	<td  width="2%">维修金</td>
	<td  width="2%">工程扣款</td>
	<td  width="2%">扣水电费</td>
	<td  width="2%">扣其它款</td>
	<td  width="2%">补款</td>
	<td  width="3%">工队结算款总额</td>
	<td  width="2%">结算人</td>
	<td  width="3%">结算时间</td>
	<td  width="4%">结算单位</td>
	<td  width="2%">客户编号</td>
	<td  width="6%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT cw_gdjsjl.gdjsjlh,DECODE(cw_gdjsjl.jsjd,'1','结算部结算','2','结算审批','3','财务结算'),DECODE(cw_gdjsjl.spjl,'3','通过','4','未通过'),cw_gdjsjl.spyj,crm_khxx.khxm,crm_khxx.fwdz,sgdmc, DECODE(cw_gdjsjl.jzbz,'1','家装','2','公装'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze, DECODE(cw_gdjsjl.tdjs,'1','客户结算金额','2','实收款','3','签约额','4','实际成本'),cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.gckk,cw_gdjsjl.ksdf,cw_gdjsjl.kqtk,cw_gdjsjl.bk,cw_gdjsjl.gdjskze,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.khbh,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_gdjsjl.jsjd='2' and cw_gdjsjl.spjl='4'";//1：结算；2：结算审批；3：财务结算//3：通过；4：未通过
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
    //out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditCw_gdjsjl.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>

</table>

<CENTER >
  <B><font size="3">完工结算(管理费)</font></B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="7%">签约额</td>
	<td  width="5%">增减项</td>
	<td  width="7%">实收款</td>
	<td  width="21%">房屋地址</td>
	<td  width="9%">签约店面</td>
	<td  width="8%">实开工日期</td>
	<td  width="7%">实竣工日期</td>
	<td  width="5%">施工队</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检员</td>
	<td  width="6%">客户编号</td>
</tr>

<%

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs like '%"+lxfs+"%')";
	}

	ls_sql="SELECT hth,khxm,qye,zjxje,sfke,fwdz,a.dwmc sbdm,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm,khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where (crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)) and (gdjsjd='0' or gdjsjd is null) ";
    //ls_sql+="and zjxwcbz='2'";           //2006-12-25  只有昨晚增减项的才能结算
	ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","InsertCw_gdjsjl.jsp","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","sbrq","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("结算");
	pageObj.setViewBolt("");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>

