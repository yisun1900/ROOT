<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhjs=(String)session.getAttribute("yhjs");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String jxc_rkd_rklx=null;
	String jxc_rkd_rkdzt=null;
	String jxc_rkd_dqbm=null;
	String jxc_rkd_ckbh=null;
	jxc_rkd_rklx=request.getParameter("jxc_rkd_rklx");
	if (jxc_rkd_rklx!=null)
	{
		jxc_rkd_rklx=cf.GB2Uni(jxc_rkd_rklx);
		if (!(jxc_rkd_rklx.equals("")))	wheresql+=" and  (jxc_rkd.rklx='"+jxc_rkd_rklx+"')";
	}
	jxc_rkd_rkdzt=request.getParameter("jxc_rkd_rkdzt");
	if (jxc_rkd_rkdzt!=null)
	{
		jxc_rkd_rkdzt=cf.GB2Uni(jxc_rkd_rkdzt);
		if (!(jxc_rkd_rkdzt.equals("")))	wheresql+=" and  (jxc_rkd.rkdzt='"+jxc_rkd_rkdzt+"')";
	}
	jxc_rkd_dqbm=request.getParameter("jxc_rkd_dqbm");
	if (jxc_rkd_dqbm!=null)
	{
		jxc_rkd_dqbm=cf.GB2Uni(jxc_rkd_dqbm);
		if (!(jxc_rkd_dqbm.equals("")))	wheresql+=" and  (jxc_rkd.dqbm='"+jxc_rkd_dqbm+"')";
	}
	jxc_rkd_ckbh=request.getParameter("jxc_rkd_ckbh");
	if (jxc_rkd_ckbh!=null)
	{
		jxc_rkd_ckbh=cf.GB2Uni(jxc_rkd_ckbh);
		if (!(jxc_rkd_ckbh.equals("")))	wheresql+=" and  (jxc_rkd.ckbh='"+jxc_rkd_ckbh+"')";
	}


	String jxc_rkd_rkph=null;
	String jxc_rkd_lydh=null;
	String jxc_rkd_gysmc=null;
	String jxc_rkd_gysmc2=null;
	String jxc_rkd_rkr=null;
	String rkrssbm=null;
	String jxc_rkd_rksj=null;


	jxc_rkd_rkph=request.getParameter("jxc_rkd_rkph");
	if (jxc_rkd_rkph!=null)
	{
		jxc_rkd_rkph=cf.GB2Uni(jxc_rkd_rkph);
		if (!(jxc_rkd_rkph.equals("")))	wheresql+=" and  (jxc_rkd.rkph='"+jxc_rkd_rkph+"')";
	}
	jxc_rkd_lydh=request.getParameter("jxc_rkd_lydh");
	if (jxc_rkd_lydh!=null)
	{
		jxc_rkd_lydh=cf.GB2Uni(jxc_rkd_lydh);
		if (!(jxc_rkd_lydh.equals("")))	wheresql+=" and  (jxc_rkd.lydh='"+jxc_rkd_lydh+"')";
	}
	jxc_rkd_rkr=request.getParameter("jxc_rkd_rkr");
	if (jxc_rkd_rkr!=null)
	{
		jxc_rkd_rkr=cf.GB2Uni(jxc_rkd_rkr);
		if (!(jxc_rkd_rkr.equals("")))	wheresql+=" and  (jxc_rkd.rkr='"+jxc_rkd_rkr+"')";
	}
	rkrssbm=request.getParameter("rkrssbm");
	if (rkrssbm!=null)
	{
		rkrssbm=cf.GB2Uni(rkrssbm);
		if (!(rkrssbm.equals("")))	wheresql+=" and  (jxc_rkd.rkrssbm='"+rkrssbm+"')";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj>=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj2");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj<=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_gysmc=request.getParameter("jxc_rkd_gysmc");
	if (jxc_rkd_gysmc!=null)
	{
		jxc_rkd_gysmc=cf.GB2Uni(jxc_rkd_gysmc);
		if (!(jxc_rkd_gysmc.equals("")))	wheresql+=" and  (jxc_rkd.gysmc='"+jxc_rkd_gysmc+"')";
	}
	jxc_rkd_gysmc2=request.getParameter("jxc_rkd_gysmc2");
	if (jxc_rkd_gysmc2!=null)
	{
		jxc_rkd_gysmc2=cf.GB2Uni(jxc_rkd_gysmc2);
		if (!(jxc_rkd_gysmc2.equals("")))	wheresql+=" and  (jxc_rkd.gysmc like '%"+jxc_rkd_gysmc2+"%')";
	}



	ls_sql="SELECT jxc_rkd.rkph,DECODE(jxc_rkd.rkdzt,'0','未提交','1','等待审核','2','等待入库','3','已入库','4','已结算','6','等待总部审核'),DECODE(jxc_rkd.rklx,'C','采购入库','T','退货入库','R','调拨入库','S','申购入库','J','代金券退货入库','D','主材订单退货','F','发货单入库','Z','直接入库') rklx,jxc_ckmc.ckmc,jxc_rkd.rkr,jxc_rkd.rksj,jxc_rkd.rkzje,dm_dqbm.dqmc,jxc_rkd.gysmc,jxc_rkd.lydh";
	ls_sql+=" FROM jxc_rkd,jxc_ckmc,dm_dqbm ";
    ls_sql+=" where jxc_rkd.ckbh=jxc_ckmc.ckbh and jxc_rkd.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_rkd.rkcllx='1'";//0：主材；1：辅材
    ls_sql+=" and jxc_rkd.sfxnrkd='N'";//Y：是；N：否

	if (!yhjs.equals("A0"))
	{
		ls_sql+=" and jxc_rkd.ckbh in(select ckbh from jxc_kgy where yhdlm='"+yhdlm+"')";
	}
	
	ls_sql+=wheresql;
    ls_sql+=" order by jxc_rkd.rksj desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Jxc_rkdList.jsp","","","EditJxc_rkdMain.jsp");

//设置主键
	String[] keyName={"rkph"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除入库单"};//按钮的显示名称
	String[] buttonLink={"deleteRkd.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"rkph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_rkd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("rkph",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">入库－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="9%">入库批号</td>
	<td  width="6%">入库单状态</td>
	<td  width="6%">入库类型</td>
	<td  width="10%">入库仓库</td>
	<td  width="6%">入库人</td>
	<td  width="8%">入库时间</td>
	<td  width="9%">入库总金额</td>
	<td  width="6%">地区</td>
	<td  width="18%">供货单位</td>
	<td  width="15%">来源单号</td>
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