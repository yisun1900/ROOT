<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
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

	String crm_yjdjl_clzt=null;
	String crm_yjdjl_lrr=null;
	String crm_yjdjl_lrsj=null;

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

	ls_sql="SELECT crm_yjdjl.jdjlh, DECODE(crm_yjdjl.clzt,'1','申请','2','派单','3','已预交底'),crm_yjdjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.hth,crm_zxkhxx.sjs,dwmc,crm_yjdjl.sqrq,crm_yjdjl.sqr,crm_yjdjl.sqrlxdh,crm_yjdjl.jhjdrq,crm_yjdjl.jhjdsj,crm_yjdjl.sqsm,crm_yjdjl.lrr,crm_yjdjl.lrsj";
	ls_sql+=" FROM crm_zxkhxx,crm_yjdjl,sq_dwxx  ";
    ls_sql+=" where crm_yjdjl.khbh=crm_zxkhxx.khbh and crm_zxkhxx.zxdm=sq_dwxx.dwbh";
    ls_sql+=" and crm_zxkhxx.xcjdbz='2'";
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
	pageObj.initPage("Crm_yjdjlList.jsp","","","EditCrm_yjdjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jdjlh","crm_yjdjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_hth","crm_zxkhxx_sjs","crm_yjdjl_sqrq","crm_yjdjl_sqr","crm_yjdjl_sqrlxdh","crm_yjdjl_sfxtp","crm_yjdjl_jhjdrq","crm_yjdjl_jhjdsj","crm_yjdjl_sqsm","crm_yjdjl_zcwcsj","crm_yjdjl_jdqrwcsj","crm_yjdjl_fbr","crm_yjdjl_fbsj","crm_yjdjl_zzqrjdrq","crm_yjdjl_zzqrjdsj","crm_yjdjl_sjjdsj","crm_yjdjl_jdsfcg","crm_yjdjl_sfkkg","crm_yjdjl_tzsfqr","crm_yjdjl_fasfkx","crm_yjdjl_khsfqr","crm_yjdjl_xcfzrqr","crm_yjdjl_qtczdqr","crm_yjdjl_clzt","crm_yjdjl_lrr","crm_yjdjl_lrsj","crm_yjdjl_lrbm","crm_yjdjl_sbsfcl","crm_yjdjl_tpshr","crm_yjdjl_tpshsj","crm_yjdjl_tpsftg","crm_yjdjl_tpsm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jdjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_yjdjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
  <B><font size="3">预交底申请维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">预交底记录号</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="4%">设计师</td>
	<td  width="6%">店面</td>
	<td  width="4%">申请日期</td>
	<td  width="3%">申请人</td>
	<td  width="11%">申请人联系电话</td>
	<td  width="4%">计划预交底日期</td>
	<td  width="3%">计划预交底时间</td>
	<td  width="24%">申请说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
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