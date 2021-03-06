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
	String psph=null;
	String psdzt=null;
	String psfs=null;
	String lrr=null;
	String lrrq=null;
	String jhshsj=null;
	psph=request.getParameter("psph");
	if (psph!=null)
	{
		psph=cf.GB2Uni(psph);
		if (!(psph.equals("")))	wheresql+=" and  (jxc_clpsd.psph='"+psph+"')";
	}
	psdzt=request.getParameter("psdzt");
	if (psdzt!=null)
	{
		psdzt=cf.GB2Uni(psdzt);
		if (!(psdzt.equals("")))	wheresql+=" and  (jxc_clpsd.psdzt='"+psdzt+"')";
	}
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		psfs=cf.GB2Uni(psfs);
		if (!(psfs.equals("")))	wheresql+=" and  (jxc_clpsd.psfs='"+psfs+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jxc_clpsd.lrr='"+lrr+"')";
	}
	lrrq=request.getParameter("lrrq");
	if (lrrq!=null)
	{
		lrrq=lrrq.trim();
		if (!(lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+lrrq+"','YYYY/MM/DD'))";
	}
	lrrq=request.getParameter("lrrq2");
	if (lrrq!=null)
	{
		lrrq=lrrq.trim();
		if (!(lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+lrrq+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj<=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jxc_clpsd.psph,DECODE(jxc_clpsd.psdzt,'0','等待提交','2','等待出库','3','已出库','5','部分出库') psdzt,DECODE(jxc_clpsd.psfs,'1','配送','2','自提','9','其它') psfs,jxc_clpsd.jhshsj,jxc_clpsd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_clpsd.pszsl,jxc_clpsd.pszje,jxc_clpsd.yf,jxc_clpsd.qtsf,jxc_clpsd.fkje,jxc_clpsd.lrr,jxc_clpsd.lrrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_clpsd.bz  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh   ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clpsd.lrrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_clpsdCxList.jsp","","","/jxcdy/dypsd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"psph"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("打印");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"psph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_clpsd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("psph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">配送单查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">配送批号</td>
	<td  width="4%">配送单状态</td>
	<td  width="3%">配送方式</td>
	<td  width="4%">计划送货时间</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="3%">施工队</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">配送总数量</td>
	<td  width="5%">配送总金额</td>
	<td  width="4%">配送运费</td>
	<td  width="4%">其它收费</td>
	<td  width="4%">返款金额</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入日期</td>
	<td  width="5%">所属分公司</td>
	<td  width="7%">店面</td>
	<td  width="17%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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