<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sfxmbm=null;
	String sfxmmc=null;
	String sflx=null;
	String sfbxx=null;
	String sfjrqye=null;
	String dqbm=null;

	String sfjzsf=null;
	sfjzsf=request.getParameter("sfjzsf");
	if (sfjzsf!=null)
	{
		sfjzsf=cf.GB2Uni(sfjzsf);
		if (!(sfjzsf.equals("")))	wheresql+=" and  (sfjzsf='"+sfjzsf+"')";
	}

	String sfjrhtjz=null;
	sfjrhtjz=request.getParameter("sfjrhtjz");
	if (sfjrhtjz!=null)
	{
		sfjrhtjz=cf.GB2Uni(sfjrhtjz);
		if (!(sfjrhtjz.equals("")))	wheresql+=" and  (sfjrhtjz='"+sfjrhtjz+"')";
	}

	String sffqsk=null;
	sffqsk=request.getParameter("sffqsk");
	if (sffqsk!=null)
	{
		sffqsk=cf.GB2Uni(sffqsk);
		if (!(sffqsk.equals("")))	wheresql+=" and  (sffqsk='"+sffqsk+"')";
	}

	String cbjjsfs=null;
	cbjjsfs=request.getParameter("cbjjsfs");
	if (cbjjsfs!=null)
	{
		cbjjsfs=cf.GB2Uni(cbjjsfs);
		if (!(cbjjsfs.equals("")))	wheresql+=" and  (cbjjsfs='"+cbjjsfs+"')";
	}

	String sfxsq=null;
	sfxsq=request.getParameter("sfxsq");
	if (sfxsq!=null)
	{
		sfxsq=cf.GB2Uni(sfxsq);
		if (!(sfxsq.equals("")))	wheresql+=" and  (sfxsq='"+sfxsq+"')";
	}

	String sfxmlx=null;
	sfxmlx=request.getParameter("sfxmlx");
	if (sfxmlx!=null)
	{
		sfxmlx=cf.GB2Uni(sfxmlx);
		if (!(sfxmlx.equals("")))	wheresql+=" and  (sfxmlx='"+sfxmlx+"')";
	}
	String sfcysgdjs=null;
	sfcysgdjs=request.getParameter("sfcysgdjs");
	if (sfcysgdjs!=null)
	{
		sfcysgdjs=cf.GB2Uni(sfcysgdjs);
		if (!(sfcysgdjs.equals("")))	wheresql+=" and  (sfcysgdjs='"+sfcysgdjs+"')";
	}
	String sfkdz=null;
	sfkdz=request.getParameter("sfkdz");
	if (sfkdz!=null)
	{
		sfkdz=cf.GB2Uni(sfkdz);
		if (!(sfkdz.equals("")))	wheresql+=" and  (sfkdz='"+sfkdz+"')";
	}

	String jrsjbz=null;
	jrsjbz=request.getParameter("jrsjbz");
	if (jrsjbz!=null)
	{
		jrsjbz=cf.GB2Uni(jrsjbz);
		if (!(jrsjbz.equals("")))	wheresql+=" and  (jrsjbz='"+jrsjbz+"')";
	}
	String jrglfbz=null;
	jrglfbz=request.getParameter("jrglfbz");
	if (jrglfbz!=null)
	{
		jrglfbz=cf.GB2Uni(jrglfbz);
		if (!(jrglfbz.equals("")))	wheresql+=" and  (jrglfbz='"+jrglfbz+"')";
	}
	
	
	sfxmbm=request.getParameter("sfxmbm");
	if (sfxmbm!=null)
	{
		sfxmbm=cf.GB2Uni(sfxmbm);
		if (!(sfxmbm.equals("")))	wheresql+=" and  (sfxmbm='"+sfxmbm+"')";
	}
	sfxmmc=request.getParameter("sfxmmc");
	if (sfxmmc!=null)
	{
		sfxmmc=cf.GB2Uni(sfxmmc);
		if (!(sfxmmc.equals("")))	wheresql+=" and  (sfxmmc like '%"+sfxmmc+"%')";
	}
	sflx=request.getParameter("sflx");
	if (sflx!=null)
	{
		sflx=cf.GB2Uni(sflx);
		if (!(sflx.equals("")))	wheresql+=" and  (sflx='"+sflx+"')";
	}
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		sfbxx=cf.GB2Uni(sfbxx);
		if (!(sfbxx.equals("")))	wheresql+=" and  (sfbxx='"+sfbxx+"')";
	}
	sfjrqye=request.getParameter("sfjrqye");
	if (sfjrqye!=null)
	{
		sfjrqye=cf.GB2Uni(sfjrqye);
		if (!(sfjrqye.equals("")))	wheresql+=" and  (sfjrqye='"+sfjrqye+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bdm_sfxmbm.dqbm='"+dqbm+"')";
	}

	ls_sql="SELECT bdm_sfxmbm.dqbm,dqmc,sfxmbm,sfxmmc,dysfxmmc,DECODE(sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','4','公司购主材间接费','5','工程管理费','6','工程税金','7','公司购主材管理费','8','公司购主材税金','A','自购主材管理费','B','自购主材税金','C','自购主材间接费','D','水电路','E','水电路预收','9','其它') sfxmlx,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后合同额×税率）','8','税金（折前税金×税金折扣）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比(不可改)','7','自购主材百分比(不可改)','9','按百分比收设计费','B','精装工程管理费','C','精装主材管理费','D','精装工程费百分比','E','精装主材费百分比','F','公司购主材百分比(可改)','G','自购主材百分比(可改)') sflx,gdje,DECODE(sfcysgdjs,'Y','是','N','否') sfcysgdjs,jldw, DECODE(sfbxx,'1','必选','2','非必选') sfbxx, DECODE(sfjrqye,'1','是','2','不是') sfjrqye, DECODE(jrsjbz,'1','收取','2','不收取') jrsjbz, DECODE(jrglfbz,'1','收取','2','不收取') jrglfbz, DECODE(sfssjf,'1','收取','2','不收取') sfssjf, DECODE(sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk, DECODE(sfxsq,'1','不需','2','需授权','3','停用') sfxsq, DECODE(sffqsk,'1','是','2','否') sffqsk, DECODE(cbjjsfs,'1','折前','2','折后','3','不记入') cbjjsfs,DECODE(sfjrhtjz,'Y','记入','N','否') sfjrhtjz,DECODE(sfjzsf,'Y','精装','N','否') sfjzsf,bz ";
	ls_sql+=" FROM bdm_sfxmbm,dm_dqbm  ";
    ls_sql+=" where ( bdm_sfxmbm.dqbm=dm_dqbm.dqbm(+))";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by bdm_sfxmbm.dqbm,sfxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bdm_sfxmbmList.jsp","","","EditBdm_sfxmbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","sfxmbm","sfxmmc","dysfxmmc","sfxmlx","sflx","gdje","sfcysgdjs","jldw","sfbxx","sfjrqye","jrsjbz","jrglfbz","sfssjf","sfkdz","zdzk","sfxsq","sffqsk","cbjjsfs","sfjrhtjz","sfjzsf","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","sfxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteBdm_sfxmbm.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">地区</td>
	<td  width="3%">收费项目编码</td>
	<td  width="9%">收费项目名称</td>
	<td  width="9%">收费项目打印名称</td>
	<td  width="5%">收费项目类型</td>
	<td  width="9%">收费计算方式</td>
	<td  width="4%">固定金额</td>
	<td  width="3%">参与施工队结算</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">是否必选</td>
	<td  width="3%">是否记入业绩</td>
	<td  width="3%">是否收取税金</td>
	<td  width="3%">是否收取管理费</td>
	<td  width="3%">是否收取设计费</td>
	<td  width="3%">是否可打折</td>
	<td  width="3%">最低折扣</td>
	<td  width="3%">设计师是否需授权使用</td>
	<td  width="3%">是否分期收款</td>
	<td  width="3%">成本价计算方式</td>
	<td  width="3%">记入合同净值毛利</td>
	<td  width="3%">是否精装收费</td>
	<td  width="13%">备注</td>
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