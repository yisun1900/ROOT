<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String[] ls=request.getParameterValues("khbh");
if (ls.length>1)
{
	out.println("错误！每次只能选择一个客户");
	return;
}

String khbh=ls[0];
String khxm=cf.executeQuery("select khxm from crm_khxx where khbh='"+khbh+"'");

String ls_sql=null;

%>
<center>
  删除未签合同预订单（客户姓名：<%=khxm%>）
  <input type="button" value="开始删除" onclick="window.open('DeleteYdd.jsp?khbh=<%=khbh%>')">
</center>
木门：
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="3%">初测日期</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">协商安装时间</td>
	<td  width="3%">通知安装时间</td>
	<td  width="3%">安装开始日期</td>
	<td  width="3%">安装结束日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="3%">派单工厂</td>
	<td  width="3%">收取定金</td>
	<td  width="3%">合同金额</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">五金情况</td>
	<td  width="3%">自购五金件送公司</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="2%">客户编号</td>
</tr>
<%
	//木门		
	ls_sql="SELECT yddbh,clztmc,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,jc_mmydd.pdgcmc,jc_mmydd.sqdj,jc_mmydd.htje,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','已送公司','N','未送公司') wjsgsbz,jc_mmydd.lrsj,a.dwmc lrdw,jc_mmydd.khbh ";
	ls_sql+=" FROM jc_mmydd,sq_dwxx a,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.dwbh=a.dwbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and  jc_mmydd.khbh='"+khbh+"' and jc_mmydd.clzt in('00','01','02','03')";
	ls_sql+=" order by yddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>
</table>

橱柜：
<table border="1" width="340%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">订单编号</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">派设计师 </td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">初测日期</td>
	<td  width="2%">复测日期</td>
	<td  width="2%">签约日期</td>
	<td  width="2%">合同安装日期</td>
	<td  width="2%">安装开始日期</td>
	<td  width="2%">安装完成日期</td>
	<td  width="2%">确认退单日期</td>
    <td  width="2%">所派工厂编号</td>
    <td  width="5%">工厂名称</td>
    <td  width="5%">供应商</td>
    <td  width="4%">品牌</td>
    <td  width="5%">橱柜款式</td>
    <td  width="4%">箱体板材</td>
    <td  width="4%">橱柜花色</td>
    <td  width="3%">台面品牌</td>
    <td  width="3%">台面花色</td>
    <td  width="3%">玻璃材质</td>
    <td  width="3%">铰链</td>
	<td  width="2%">收取定金</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">柜体合同金额</td>
	<td  width="3%">台面合同金额</td>
	<td  width="3%">五金合同金额</td>
	<td  width="3%">电器合同金额</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="2%">客户编号</td>
</tr>
<%
	ls_sql="SELECT jc_cgdd.ddbh,clztmc,DECODE(jc_cgdd.sfpsjs,'1','是','2','否') sfpsjs, jc_cgdd.cgsjs,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,jc_cgdd.pdgc,jc_cgdd.pdgcmc,jc_cgdd.gys,jc_cgdd.ppmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.lrr,jc_cgdd.lrsj,a.dwmc lrdw,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx a";
	ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt(+) and jc_cgdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and  jc_cgdd.khbh='"+khbh+"' and jc_cgdd.clzt in('00','01','03','05','07','09','11')";
	ls_sql+=" order by jc_cgdd.ddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>

</table>

家具：
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">派设计师</td>
	<td  width="2%">家居设计师</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">家具工厂</td>
	<td  width="5%">家具工厂</td>
	<td  width="4%">家具品牌</td>
	<td  width="6%">家具供应商</td>
	<td  width="2%">型材门</td>
	<td  width="4%">型材门工厂</td>
	<td  width="4%">型材门品牌</td>
	<td  width="6%">型材门供应商</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">初测日期</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">开始安装时间</td>
	<td  width="3%">安装完成日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="2%">订金</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">家具合同金额</td>
	<td  width="3%">型材门合同金额</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">家具增减后金额</td>
	<td  width="3%">型材门增减后金额</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="3%">客户编号</td>
</tr>
<%
	ls_sql="SELECT jc_jjdd.ddbh,clztmc,DECODE(jc_jjdd.sfpsjs,'1','需要','2','否') sfpsjs,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.pdgc,jc_jjdd.pdgcmc,jc_jjdd.jjppmc,jc_jjdd.jjgys,jc_jjdd.xcmgc,jc_jjdd.xcmgcmc,jc_jjdd.xcmppmc,jc_jjdd.xcmgys,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.lrr,jc_jjdd.lrsj,a.dwmc as lrbm,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx a";
    ls_sql+=" where jc_jjdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	ls_sql+=" and  jc_jjdd.khbh='"+khbh+"' and jc_jjdd.clzt in('00','01','03','05','07','09','11')";
	ls_sql+=" order by jc_jjdd.ddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>
</table>

主材：
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
   	<td  width="2%">订单编号</td>
   	<td  width="3%">订单类型</td>
	<td  width="3%">处理状态</td>
	<td  width="4%">主材大类</td>
	<td  width="4%">主材小类</td>
	<td  width="4%">品牌供应商</td>
	<td  width="4%">品牌</td>
	<td  width="5%">供应商</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">增减项金额</td>
	<td  width="3%">计入促销活动金额</td>
	<td  width="3%">客户交款性质</td>
	<td  width="3%">交款地点</td>
	<td  width="3%">订货日期</td>
	<td  width="3%">合同送货时间</td>
	<td  width="3%">计划送货时间</td>
	<td  width="3%">发送货通知时间</td>
	<td  width="3%">实送货时间</td>
	<td  width="3%">完结时间</td>
	<td  width="2%">通知人员</td>
	<td  width="6%">送货情况</td>
	<td  width="3%">等待送货通知</td>
	<td  width="3%">产品类型</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="9%">备注</td>
</tr>
<%
	ls_sql="SELECT jc_zcdd.ddbh,DECODE(jc_zcdd.ddlx,'1','存在品牌','2','不存在品牌','3','补录合同'),clztmc,zcdlbm,zcxlbm,ppbm,ppmc,gys,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'),jc_zcdd.qhtsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制','2','定制式产品'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM jc_zcdd,sq_dwxx a,jdm_zcddzt";
	ls_sql+=" where jc_zcdd.dwbh=a.dwbh(+) ";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and  jc_zcdd.khbh='"+khbh+"' and jc_zcdd.clzt in('00','03','05')";
	ls_sql+=" order by jc_zcdd.ddbh";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%>
</table>
