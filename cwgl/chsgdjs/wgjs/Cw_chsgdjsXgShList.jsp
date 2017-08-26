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
	String cw_chsgdjs_jsjlh=null;
	String cw_chsgdjs_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String cw_chsgdjs_clzt=null;
	String cw_chsgdjs_spr=null;
	String cw_chsgdjs_spsj=null;
	String cw_chsgdjs_lrr=null;
	String cw_chsgdjs_lrsj=null;
	String cw_chsgdjs_lrbm=null;
	cw_chsgdjs_jsjlh=request.getParameter("cw_chsgdjs_jsjlh");
	if (cw_chsgdjs_jsjlh!=null)
	{
		cw_chsgdjs_jsjlh=cf.GB2Uni(cw_chsgdjs_jsjlh);
		if (!(cw_chsgdjs_jsjlh.equals("")))	wheresql+=" and  (cw_chsgdjs.jsjlh='"+cw_chsgdjs_jsjlh+"')";
	}
	cw_chsgdjs_khbh=request.getParameter("cw_chsgdjs_khbh");
	if (cw_chsgdjs_khbh!=null)
	{
		cw_chsgdjs_khbh=cf.GB2Uni(cw_chsgdjs_khbh);
		if (!(cw_chsgdjs_khbh.equals("")))	wheresql+=" and  (cw_chsgdjs.khbh='"+cw_chsgdjs_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	cw_chsgdjs_clzt=request.getParameter("cw_chsgdjs_clzt");
	if (cw_chsgdjs_clzt!=null)
	{
		cw_chsgdjs_clzt=cf.GB2Uni(cw_chsgdjs_clzt);
		if (!(cw_chsgdjs_clzt.equals("")))	wheresql+=" and  (cw_chsgdjs.clzt='"+cw_chsgdjs_clzt+"')";
	}
	cw_chsgdjs_spr=request.getParameter("cw_chsgdjs_spr");
	if (cw_chsgdjs_spr!=null)
	{
		cw_chsgdjs_spr=cf.GB2Uni(cw_chsgdjs_spr);
		if (!(cw_chsgdjs_spr.equals("")))	wheresql+=" and  (cw_chsgdjs.spr='"+cw_chsgdjs_spr+"')";
	}
	cw_chsgdjs_spsj=request.getParameter("cw_chsgdjs_spsj");
	if (cw_chsgdjs_spsj!=null)
	{
		cw_chsgdjs_spsj=cw_chsgdjs_spsj.trim();
		if (!(cw_chsgdjs_spsj.equals("")))	wheresql+="  and (cw_chsgdjs.spsj=TO_DATE('"+cw_chsgdjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_chsgdjs_lrr=request.getParameter("cw_chsgdjs_lrr");
	if (cw_chsgdjs_lrr!=null)
	{
		cw_chsgdjs_lrr=cf.GB2Uni(cw_chsgdjs_lrr);
		if (!(cw_chsgdjs_lrr.equals("")))	wheresql+=" and  (cw_chsgdjs.lrr='"+cw_chsgdjs_lrr+"')";
	}
	cw_chsgdjs_lrsj=request.getParameter("cw_chsgdjs_lrsj");
	if (cw_chsgdjs_lrsj!=null)
	{
		cw_chsgdjs_lrsj=cw_chsgdjs_lrsj.trim();
		if (!(cw_chsgdjs_lrsj.equals("")))	wheresql+="  and (cw_chsgdjs.lrsj=TO_DATE('"+cw_chsgdjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_chsgdjs_lrbm=request.getParameter("cw_chsgdjs_lrbm");
	if (cw_chsgdjs_lrbm!=null)
	{
		cw_chsgdjs_lrbm=cf.GB2Uni(cw_chsgdjs_lrbm);
		if (!(cw_chsgdjs_lrbm.equals("")))	wheresql+=" and  (cw_chsgdjs.lrbm='"+cw_chsgdjs_lrbm+"')";
	}
	ls_sql="SELECT cw_chsgdjs.jsjlh,cw_chsgdjs.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,cw_chsgdjs.sgbz,cw_chsgdjs.jsrq,cw_chsgdjs.qye,cw_chsgdjs.zjxje,cw_chsgdjs.zxje,cw_chsgdjs.jxje,cw_chsgdjs.htsgcb,cw_chsgdjs.zjxsgcb,cw_chsgdjs.zjcbglfbl,cw_chsgdjs.zjcbglf,cw_chsgdjs.sdlzxje,cw_chsgdjs.sdlcbfbl,cw_chsgdjs.sldzjcb,cw_chsgdjs.htwzjje,cw_chsgdjs.htwzjcbbl,cw_chsgdjs.htwzjcb,cw_chsgdjs.sgcb,cw_chsgdjs.sgcbclf,cw_chsgdjs.sgcbrgf,cw_chsgdjs.sssjf,cw_chsgdjs.sjfbl,cw_chsgdjs.sjftc,cw_chsgdjs.fwmj,cw_chsgdjs.kqzlf,cw_chsgdjs.bbjf,cw_chsgdjs.bqtf,cw_chsgdjs.bqtfsm,cw_chsgdjs.htnsdje,cw_chsgdjs.htnsdjebl,cw_chsgdjs.bsdcb,cw_chsgdjs.ycfje,cw_chsgdjs.ycfbl,cw_chsgdjs.bycf,cw_chsgdjs.cbhjje,cw_chsgdjs.kzbjbl,cw_chsgdjs.kzbj,cw_chsgdjs.kgcyz,cw_chsgdjs.kfxbzjbl,cw_chsgdjs.kfxbzj,cw_chsgdjs.xxfh,cw_chsgdjs.clcb,cw_chsgdjs.cldbbl,cw_chsgdjs.clbdbkk,cw_chsgdjs.kgjsje,cw_chsgdjs.kqtf,cw_chsgdjs.kqtfsm,cw_chsgdjs.kxcf,cw_chsgdjs.sjzfe, DECODE(cw_chsgdjs.clzt,'1','结算','2','审批'),cw_chsgdjs.spr,cw_chsgdjs.spsj,cw_chsgdjs.spyj,cw_chsgdjs.lrr,cw_chsgdjs.lrsj,dwmc lrbm,cw_chsgdjs.bz  ";
	ls_sql+=" FROM crm_khxx,cw_chsgdjs,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_chsgdjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_chsgdjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_chsgdjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_chsgdjs.clzt='2'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_chsgdjsXgShList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_chsgdjs_khbh","crm_khxx_khxm","crm_khxx_fwdz","cw_chsgdjs_sgd","cw_chsgdjs_sgbz","cw_chsgdjs_jsrq","cw_chsgdjs_qye","cw_chsgdjs_zjxje","cw_chsgdjs_zxje","cw_chsgdjs_jxje","cw_chsgdjs_htsgcb","cw_chsgdjs_zjxsgcb","cw_chsgdjs_zjcbglfbl","cw_chsgdjs_zjcbglf","cw_chsgdjs_sdlzxje","cw_chsgdjs_sdlcbfbl","cw_chsgdjs_sldzjcb","cw_chsgdjs_htwzjje","cw_chsgdjs_htwzjcbbl","cw_chsgdjs_htwzjcb","cw_chsgdjs_sgcb","cw_chsgdjs_sgcbclf","cw_chsgdjs_sgcbrgf","cw_chsgdjs_sssjf","cw_chsgdjs_sjfbl","cw_chsgdjs_sjftc","cw_chsgdjs_fwmj","cw_chsgdjs_kqzlf","cw_chsgdjs_bbjf","cw_chsgdjs_bqtf","cw_chsgdjs_bqtfsm","cw_chsgdjs_htnsdje","cw_chsgdjs_htnsdjebl","cw_chsgdjs_bsdcb","cw_chsgdjs_ycfje","cw_chsgdjs_ycfbl","cw_chsgdjs_bycf","cw_chsgdjs_cbhjje","cw_chsgdjs_kzbjbl","cw_chsgdjs_kzbj","cw_chsgdjs_kgcyz","cw_chsgdjs_kfxbzjbl","cw_chsgdjs_kfxbzj","cw_chsgdjs_xxfh","cw_chsgdjs_clcb","cw_chsgdjs_cldbbl","cw_chsgdjs_clbdbkk","cw_chsgdjs_kgjsje","cw_chsgdjs_kqtf","cw_chsgdjs_kqtfsm","cw_chsgdjs_kxcf","cw_chsgdjs_sjzfe","cw_chsgdjs_clzt","cw_chsgdjs_spr","cw_chsgdjs_spsj","cw_chsgdjs_spyj","cw_chsgdjs_lrr","cw_chsgdjs_lrsj","cw_chsgdjs_lrbm","cw_chsgdjs_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审核"};//按钮的显示名称
	String[] buttonLink={"DeleteSh.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_chsgdjs.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">结算审核－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(600);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="1%">结算记录号</td>
	<td  width="1%">客户编号</td>
	<td  width="1%">客户姓名</td>
	<td  width="4%">房屋地址</td>
	<td  width="1%">施工队</td>
	<td  width="1%">施工班长</td>
	<td  width="2%">结算日期</td>
	<td  width="2%">合同额</td>
	<td  width="2%">增减项</td>
	<td  width="2%">增项金额</td>
	<td  width="2%">减项金额</td>
	<td  width="2%">合同施工成本</td>
	<td  width="2%">增减项施工成本</td>
	<td  width="2%">直接成本管理费比例</td>
	<td  width="2%">直接成本管理费</td>
	<td  width="2%">水电路增项金额</td>
	<td  width="2%">水电路成本费比例</td>
	<td  width="2%">水电路增加直接成本费</td>
	<td  width="2%">合同外项目增加金额</td>
	<td  width="2%">合同外项目增加成本比例</td>
	<td  width="2%">合同外项目增加直接成本费</td>
	<td  width="2%">施工成本人工费</td>
	<td  width="2%">①材料费</td>
	<td  width="2%">②人工费</td>
	<td  width="2%">实收设计费</td>
	<td  width="2%">设计费提成比例</td>
	<td  width="2%">补设计费提成</td>
	<td  width="1%">房屋面积</td>
	<td  width="1%">空气治理协调费</td>
	<td  width="1%">补保洁费</td>
	<td  width="1%">补其他费用</td>
	<td  width="3%">补其他费用说明</td>
	<td  width="1%">合同内水电金额</td>
	<td  width="1%">合同内水电金额比例</td>
	<td  width="1%">补施工组长水电成本</td>
	<td  width="1%">远程费金额</td>
	<td  width="1%">远程费比例</td>
	<td  width="1%">补施工组长远程费</td>
	<td  width="1%">施工组长成本合计金额</td>
	<td  width="1%">扣工地质保金比例</td>
	<td  width="1%">扣工地质保金</td>
	<td  width="1%">扣工程预支</td>
	<td  width="1%">扣风险保证金比例</td>
	<td  width="1%">扣风险保证金</td>
	<td  width="1%">施工组长信息返回</td>
	<td  width="1%">材料成本</td>
	<td  width="1%">材料达标比例</td>
	<td  width="1%">材料不达标扣款</td>
	<td  width="1%">承担开工减少金额</td>
	<td  width="1%">扣施工组长其他费用</td>
	<td  width="3%">扣施工组长其他费用说明</td>
	<td  width="1%">扣物料宣传费</td>
	<td  width="1%">实际支付施工组长金额</td>
	<td  width="1%">处理状态</td>
	<td  width="1%">审批人</td>
	<td  width="2%">审批时间</td>
	<td  width="3%">审批意见</td>
	<td  width="1%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">录入部门</td>
	<td  width="451%">备注</td>
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