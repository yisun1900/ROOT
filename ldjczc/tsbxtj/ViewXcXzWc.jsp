<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));

	ls_sql="SELECT gdm_gdjcjl.jcjlh,DECODE(gdm_gdjcjl.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','B','在处理'),DECODE(gdm_gdjcjl.cfspbz,'1','不需审批','2','未审批','3','审批通过','4','审批未通过'), DECODE(gdm_gdjcjl.sffszg,'Y','发生','N','未发生'),gdm_gdjcjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,crm_khxx.sjs,gdm_gdjcjl.xjr,gdm_gdjcjl.xjsj,xxlymc,jclxmc,jcjgmc,jcwtflmc,gdm_gdjcjl.kfzs,gdm_gdjcjl.fkze,gdm_gdjcjl.jlje,gdm_gdjcjl.spr,gdm_gdjcjl.spsj,gdm_gdjcjl.spyj,gdm_gdjcjl.yqjjsj,gdm_gdjcjl.dwbh,gdm_gdjcjl.zrr,gdm_gdjcjl.ygbh, DECODE(gdm_gdjcjl.sfxldcl,'Y','需要未处理','N','不需要','C','已处理'),gdm_gdjcjl.ldyqjjsj,gdm_gdjcjl.ldclyj,gdm_gdjcjl.ldclr,gdm_gdjcjl.ldclsj,gdm_gdjcjl.jssj,gdm_gdjcjl.jsr,gdm_gdjcjl.jssm,gdm_gdjcjl.jhcfasj,gdm_gdjcjl.cfajlh,gdm_gdjcjl.sjcfasj,gdm_gdjcjl.sjcfar,gdm_gdjcjl.jjfa,gdm_gdjcjl.jhjjsj,gdm_gdjcjl.shbm,gdm_gdjcjl.shr,gdm_gdjcjl.shsj,gdm_gdjcjl.shsm,gdm_gdjcjl.cljlh,gdm_gdjcjl.clsj,gdm_gdjcjl.clr,gdm_gdjcjl.clqk, DECODE(gdm_gdjcjl.kpbz,'N','未考评','Y','已考评'),gdm_gdjcjl.kpjlh, DECODE(gdm_gdjcjl.jsbz,'N','未结算','Y','已结算'),gdm_gdjcjl.jsjlh,gdm_gdjcjl.lrr,gdm_gdjcjl.lrsj,a.dwmc lrdw,gdm_gdjcjl.bz  ";
	ls_sql+=" FROM crm_khxx,gdm_gdjcjl,sq_sgd,sq_dwxx a,gdm_xxlybm,gdm_jclxbm,gdm_jcjgbm,gdm_jcwtflbm ";
    ls_sql+=" where gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and gdm_gdjcjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and gdm_gdjcjl.lrdw=a.dwbh(+)";
    ls_sql+=" and gdm_gdjcjl.xxlybm=gdm_xxlybm.xxlybm(+)";
    ls_sql+=" and gdm_gdjcjl.jclxbm=gdm_jclxbm.jclxbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcjgbm=gdm_jcjgbm.jcjgbm(+)";
    ls_sql+=" and gdm_gdjcjl.jcwtflbm=gdm_jcwtflbm.jcwtflbm(+)";
		ls_sql+=wheresql;
		ls_sql+=" and gdm_gdjcjl.sjjjsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
		ls_sql+=" and gdm_gdjcjl.sjjjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
    ls_sql+=" order by gdm_gdjcjl.lrsj " ;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数


//设置主键
	String[] keyName={"jcjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">工地监察记录－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(700);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">监察记录号</td>
	<td  width="1%">处理状态</td>
	<td  width="1%">罚款审批标志</td>
	<td  width="1%">是否发生整改</td>
	<td  width="1%">客户编号</td>
	<td  width="1%">客户姓名</td>
	<td  width="3%">房屋地址</td>
	<td  width="1%">施工队</td>
	<td  width="1%">设计师</td>
	<td  width="1%">检查人</td>
	<td  width="2%">检查时间</td>
	<td  width="1%">信息来源</td>
	<td  width="1%">监察类型</td>
	<td  width="1%">监察结果</td>
	<td  width="1%">问题分类</td>
	<td  width="1%">扣分总数</td>
	<td  width="1%">罚款总额</td>
	<td  width="1%">奖励金额</td>

	<td  width="1%">罚款审批人</td>
	<td  width="2%">罚款审批时间</td>
	<td  width="4%">罚款审批意见</td>

	<td  width="2%">客户要求解决时间</td>
	<td  width="1%">责任部门</td>
	<td  width="1%">责任人</td>
	<td  width="1%">责任人编号</td>
	<td  width="1%">是否需领导处理</td>
	<td  width="2%">领导要求解决时间</td>
	<td  width="6%">领导处理意见</td>
	<td  width="1%">领导处理人</td>
	<td  width="2%">领导处理时间</td>
	<td  width="2%">接收时间</td>
	<td  width="1%">接收人</td>
	<td  width="6%">接收说明</td>
	<td  width="2%">计划出方案时间</td>
	<td  width="1%">出方案记录号</td>
	<td  width="2%">实际出方案时间</td>
	<td  width="1%">实际出方案人</td>
	<td  width="6%">解决方案</td>
	<td  width="2%">计划解决时间</td>
	<td  width="2%">方案审核部门</td>
	<td  width="1%">方案审核人</td>
	<td  width="2%">方案审核时间</td>
	<td  width="4%">方案审核说明</td>
	<td  width="1%">处理记录号</td>
	<td  width="2%">最新处理时间</td>
	<td  width="1%">最新处理人</td>
	<td  width="6%">最新处理情况</td>
	<td  width="1%">考评标志</td>
	<td  width="1%">考评记录号</td>
	<td  width="1%">结算标志</td>
	<td  width="1%">结算记录号</td>
	<td  width="1%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="2%">录入单位</td>
	<td  width="81%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>