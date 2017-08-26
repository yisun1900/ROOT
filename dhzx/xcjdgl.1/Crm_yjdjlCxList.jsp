<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String kkbbz=(String)session.getAttribute("kkbbz");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_yjdjl_jdjlh=null;
	String crm_yjdjl_sqrq=null;
	String crm_yjdjl_sqr=null;
	String crm_yjdjl_sqrlxdh=null;
	String crm_yjdjl_jhjdrq=null;
	String crm_yjdjl_zzqrjdrq=null;

	String crm_yjdjl_clzt=null;
	String crm_yjdjl_lrr=null;
	String crm_yjdjl_lrsj=null;
	String crm_yjdjl_fbsj=null;
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+dwbh+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_yjdjl.zjxm='"+zjxm+"')";
	}
	String sgdmc=null;
	sgdmc=request.getParameter("sgdmc");
	if (sgdmc!=null)
	{
		sgdmc=cf.GB2Uni(sgdmc);
		if (!(sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sgdmc+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}

	crm_yjdjl_jdjlh=request.getParameter("crm_yjdjl_jdjlh");
	if (crm_yjdjl_jdjlh!=null)
	{
		crm_yjdjl_jdjlh=cf.GB2Uni(crm_yjdjl_jdjlh);
		if (!(crm_yjdjl_jdjlh.equals("")))	wheresql+=" and  (crm_yjdjl.jdjlh='"+crm_yjdjl_jdjlh+"')";
	}
	crm_yjdjl_sqrq=request.getParameter("crm_yjdjl_sqrq");
	if (crm_yjdjl_sqrq!=null)
	{
		crm_yjdjl_sqrq=crm_yjdjl_sqrq.trim();
		if (!(crm_yjdjl_sqrq.equals("")))	wheresql+="  and (crm_yjdjl.sqrq>=TO_DATE('"+crm_yjdjl_sqrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_sqrq=request.getParameter("crm_yjdjl_sqrq2");
	if (crm_yjdjl_sqrq!=null)
	{
		crm_yjdjl_sqrq=crm_yjdjl_sqrq.trim();
		if (!(crm_yjdjl_sqrq.equals("")))	wheresql+="  and (crm_yjdjl.sqrq<=TO_DATE('"+crm_yjdjl_sqrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_sqr=request.getParameter("crm_yjdjl_sqr");
	if (crm_yjdjl_sqr!=null)
	{
		crm_yjdjl_sqr=cf.GB2Uni(crm_yjdjl_sqr);
		if (!(crm_yjdjl_sqr.equals("")))	wheresql+=" and  (crm_yjdjl.sqr='"+crm_yjdjl_sqr+"')";
	}
	crm_yjdjl_sqrlxdh=request.getParameter("crm_yjdjl_sqrlxdh");
	if (crm_yjdjl_sqrlxdh!=null)
	{
		crm_yjdjl_sqrlxdh=cf.GB2Uni(crm_yjdjl_sqrlxdh);
		if (!(crm_yjdjl_sqrlxdh.equals("")))	wheresql+=" and  (crm_yjdjl.sqrlxdh='"+crm_yjdjl_sqrlxdh+"')";
	}
	crm_yjdjl_jhjdrq=request.getParameter("crm_yjdjl_jhjdrq");
	if (crm_yjdjl_jhjdrq!=null)
	{
		crm_yjdjl_jhjdrq=crm_yjdjl_jhjdrq.trim();
		if (!(crm_yjdjl_jhjdrq.equals("")))	wheresql+="  and (crm_yjdjl.jhjdrq>=TO_DATE('"+crm_yjdjl_jhjdrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_jhjdrq=request.getParameter("crm_yjdjl_jhjdrq2");
	if (crm_yjdjl_jhjdrq!=null)
	{
		crm_yjdjl_jhjdrq=crm_yjdjl_jhjdrq.trim();
		if (!(crm_yjdjl_jhjdrq.equals("")))	wheresql+="  and (crm_yjdjl.jhjdrq<=TO_DATE('"+crm_yjdjl_jhjdrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_zzqrjdrq=request.getParameter("crm_yjdjl_zzqrjdrq");
	if (crm_yjdjl_zzqrjdrq!=null)
	{
		crm_yjdjl_zzqrjdrq=crm_yjdjl_zzqrjdrq.trim();
		if (!(crm_yjdjl_zzqrjdrq.equals("")))	wheresql+="  and (crm_yjdjl.zzqrjdrq>=TO_DATE('"+crm_yjdjl_zzqrjdrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_zzqrjdrq=request.getParameter("crm_yjdjl_zzqrjdrq2");
	if (crm_yjdjl_zzqrjdrq!=null)
	{
		crm_yjdjl_zzqrjdrq=crm_yjdjl_zzqrjdrq.trim();
		if (!(crm_yjdjl_zzqrjdrq.equals("")))	wheresql+="  and (crm_yjdjl.zzqrjdrq<=TO_DATE('"+crm_yjdjl_zzqrjdrq+"','YYYY/MM/DD'))";
	}

	crm_yjdjl_clzt=request.getParameter("crm_yjdjl_clzt");
	if (crm_yjdjl_clzt!=null)
	{
		crm_yjdjl_clzt=cf.GB2Uni(crm_yjdjl_clzt);
		if (!(crm_yjdjl_clzt.equals("")))	wheresql+=" and  (crm_yjdjl.clzt='"+crm_yjdjl_clzt+"')";
	}
	crm_yjdjl_lrr=request.getParameter("crm_yjdjl_lrr");
	if (crm_yjdjl_lrr!=null)
	{
		crm_yjdjl_lrr=cf.GB2Uni(crm_yjdjl_lrr);
		if (!(crm_yjdjl_lrr.equals("")))	wheresql+=" and  (crm_yjdjl.lrr='"+crm_yjdjl_lrr+"')";
	}
	crm_yjdjl_lrsj=request.getParameter("crm_yjdjl_lrsj");
	if (crm_yjdjl_lrsj!=null)
	{
		crm_yjdjl_lrsj=crm_yjdjl_lrsj.trim();
		if (!(crm_yjdjl_lrsj.equals("")))	wheresql+="  and (crm_yjdjl.lrsj>=TO_DATE('"+crm_yjdjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_lrsj=request.getParameter("crm_yjdjl_lrsj2");
	if (crm_yjdjl_lrsj!=null)
	{
		crm_yjdjl_lrsj=crm_yjdjl_lrsj.trim();
		if (!(crm_yjdjl_lrsj.equals("")))	wheresql+="  and (crm_yjdjl.lrsj<=TO_DATE('"+crm_yjdjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_fbsj=request.getParameter("crm_yjdjl_fbsj");
	if (crm_yjdjl_fbsj!=null)
	{
		crm_yjdjl_fbsj=crm_yjdjl_fbsj.trim();
		if (!(crm_yjdjl_fbsj.equals("")))	wheresql+="  and (crm_yjdjl.fbsj>=TO_DATE('"+crm_yjdjl_fbsj+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_fbsj=request.getParameter("crm_yjdjl_fbsj2");
	if (crm_yjdjl_fbsj!=null)
	{
		crm_yjdjl_fbsj=crm_yjdjl_fbsj.trim();
		if (!(crm_yjdjl_fbsj.equals("")))	wheresql+="  and (crm_yjdjl.fbsj<=TO_DATE('"+crm_yjdjl_fbsj+"','YYYY/MM/DD'))";
	}

	String crm_zxkhxx_khxm=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	String crm_zxkhxx_dwmc=null;
	crm_zxkhxx_dwmc=request.getParameter("crm_zxkhxx_dwmc");
	if (crm_zxkhxx_dwmc!=null)
	{
		crm_zxkhxx_dwmc=cf.GB2Uni(crm_zxkhxx_dwmc);
		if (!(crm_zxkhxx_dwmc.equals("")))	wheresql+=" and  (crm_zxkhxx.dwmc='"+crm_zxkhxx_dwmc+"')";
	}
	String crm_zxkhxx_khxm2=null;
	crm_zxkhxx_khxm2=request.getParameter("crm_zxkhxx_khxm2");
	if (crm_zxkhxx_khxm2!=null)
	{
		crm_zxkhxx_khxm2=cf.GB2Uni(crm_zxkhxx_khxm2);
		if (!(crm_zxkhxx_khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm2+"%')";
	}
	String myxssl=null;
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		String xsfg=request.getParameter("xsfg");
		if (xsfg.equals("2"))
		{
			pageObj.setType("EXCEL",response);
		}

		myxssl=request.getParameter("myxssl");
	}

	ls_sql="SELECT crm_yjdjl.jdjlh, DECODE(crm_yjdjl.clzt,'1','申请','2','派单','3','已预交底'),crm_yjdjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.hth,crm_zxkhxx.sjs,sgdmc,crm_yjdjl.sgbz,crm_yjdjl.zjxm,dwmc,crm_yjdjl.sqrq,crm_yjdjl.sqr,crm_yjdjl.sqrlxdh,crm_yjdjl.jhjdrq,crm_yjdjl.jhjdsj,crm_yjdjl.sqsm,crm_yjdjl.fbr,crm_yjdjl.fbsj,crm_yjdjl.zzqrjdrq,crm_yjdjl.zzqrjdsj,crm_yjdjl.sjjdsj,DECODE(crm_yjdjl.jdsfcg,'Y','成功','N','否'),crm_yjdjl.sjjdqk,crm_yjdjl.lrr,crm_yjdjl.lrsj";
	ls_sql+=" FROM crm_zxkhxx,crm_yjdjl,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_yjdjl.khbh=crm_zxkhxx.khbh and crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_yjdjl.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_yjdjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_yjdjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jdjlh","crm_yjdjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_hth","crm_zxkhxx_sjs","crm_yjdjl_sqrq","crm_yjdjl_sqr","crm_yjdjl_sqrlxdh","crm_yjdjl_sfxtp","crm_yjdjl_jhjdrq","crm_yjdjl_jhjdsj","crm_yjdjl_sqsm","crm_yjdjl_zcwcsj","crm_yjdjl_jdqrwcsj","crm_yjdjl_fbr","crm_yjdjl_fbsj","crm_yjdjl_zzqrjdrq","crm_yjdjl_zzqrjdsj","crm_yjdjl_sjjdsj","crm_yjdjl_jdsfcg","crm_yjdjl_sfkkg","crm_yjdjl_tzsfqr","crm_yjdjl_fasfkx","crm_yjdjl_khsfqr","crm_yjdjl_xcfzrqr","crm_yjdjl_qtczdqr","crm_yjdjl_clzt","crm_yjdjl_lrr","crm_yjdjl_lrsj","crm_yjdjl_lrbm","crm_yjdjl_sbsfcl","crm_yjdjl_tpshr","crm_yjdjl_tpshsj","crm_yjdjl_tpsftg","crm_yjdjl_tpsm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jdjlh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("发布");
//进行对象初始化
	if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jdjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_yjdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jdjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">预交底记录查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">预交底记录号</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">班长</td>
	<td  width="2%">质检</td>
	<td  width="4%">店面</td>
	<td  width="3%">申请日期</td>
	<td  width="2%">申请人</td>
	<td  width="6%">申请人联系电话</td>
	<td  width="3%">计划预交底日期</td>
	<td  width="3%">计划预交底时间</td>
	<td  width="16%">申请说明</td>
	<td  width="2%">派单人</td>
	<td  width="3%">派单时间</td>
	<td  width="3%">最终确认交底日期</td>
	<td  width="3%">最终确认交底时间</td>
	<td  width="3%">实际交底时间</td>
	<td  width="2%">交底是否成功</td>
	<td  width="15%">实际交底情况</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
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