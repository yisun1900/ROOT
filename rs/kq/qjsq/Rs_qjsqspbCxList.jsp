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
	String rs_qjsqspb_spxh=null;
	String rs_qjsqspb_sqxh=null;
	String rs_qjsqd_fgsbh=null;
	String rs_qjsqd_ygbh=null;
	String rs_qjsqd_yhmc=null;
	String rs_qjsqd_xb=null;
	String rs_qjsqd_lrsj=null;
	String rs_qjsqspb_shjl=null;
	String rs_qjsqspb_shr=null;
	String rs_qjsqspb_shsj=null;
	String rs_qjsqspb_clzt=null;
	String rs_qjsqspb_ztbm=null;
	String rs_qjsqspb_yclzt=null;
	String rs_qjsqspb_yztbm=null;
	rs_qjsqspb_spxh=request.getParameter("rs_qjsqspb_spxh");
	if (rs_qjsqspb_spxh!=null)
	{
		rs_qjsqspb_spxh=rs_qjsqspb_spxh.trim();
		if (!(rs_qjsqspb_spxh.equals("")))	wheresql+=" and (rs_qjsqspb.spxh="+rs_qjsqspb_spxh+") ";
	}
	rs_qjsqspb_sqxh=request.getParameter("rs_qjsqspb_sqxh");
	if (rs_qjsqspb_sqxh!=null)
	{
		rs_qjsqspb_sqxh=cf.GB2Uni(rs_qjsqspb_sqxh);
		if (!(rs_qjsqspb_sqxh.equals("")))	wheresql+=" and  (rs_qjsqspb.sqxh='"+rs_qjsqspb_sqxh+"')";
	}
	rs_qjsqd_fgsbh=request.getParameter("rs_qjsqd_fgsbh");
	if (rs_qjsqd_fgsbh!=null)
	{
		rs_qjsqd_fgsbh=cf.GB2Uni(rs_qjsqd_fgsbh);
		if (!(rs_qjsqd_fgsbh.equals("")))	wheresql+=" and  (rs_qjsqd.fgsbh='"+rs_qjsqd_fgsbh+"')";
	}
	rs_qjsqd_ygbh=request.getParameter("rs_qjsqd_ygbh");
	if (rs_qjsqd_ygbh!=null)
	{
		rs_qjsqd_ygbh=rs_qjsqd_ygbh.trim();
		if (!(rs_qjsqd_ygbh.equals("")))	wheresql+=" and (rs_qjsqd.ygbh="+rs_qjsqd_ygbh+") ";
	}
	rs_qjsqd_yhmc=request.getParameter("rs_qjsqd_yhmc");
	if (rs_qjsqd_yhmc!=null)
	{
		rs_qjsqd_yhmc=cf.GB2Uni(rs_qjsqd_yhmc);
		if (!(rs_qjsqd_yhmc.equals("")))	wheresql+=" and  (rs_qjsqd.yhmc='"+rs_qjsqd_yhmc+"')";
	}
	rs_qjsqd_xb=request.getParameter("rs_qjsqd_xb");
	if (rs_qjsqd_xb!=null)
	{
		rs_qjsqd_xb=cf.GB2Uni(rs_qjsqd_xb);
		if (!(rs_qjsqd_xb.equals("")))	wheresql+=" and  (rs_qjsqd.xb='"+rs_qjsqd_xb+"')";
	}
	rs_qjsqd_lrsj=request.getParameter("rs_qjsqd_lrsj");
	if (rs_qjsqd_lrsj!=null)
	{
		rs_qjsqd_lrsj=rs_qjsqd_lrsj.trim();
		if (!(rs_qjsqd_lrsj.equals("")))	wheresql+="  and (rs_qjsqd.lrsj>=TO_DATE('"+rs_qjsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqd_lrsj=request.getParameter("rs_qjsqd_lrsj2");
	if (rs_qjsqd_lrsj!=null)
	{
		rs_qjsqd_lrsj=rs_qjsqd_lrsj.trim();
		if (!(rs_qjsqd_lrsj.equals("")))	wheresql+="  and (rs_qjsqd.lrsj<=TO_DATE('"+rs_qjsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqspb_shjl=request.getParameter("rs_qjsqspb_shjl");
	if (rs_qjsqspb_shjl!=null)
	{
		rs_qjsqspb_shjl=cf.GB2Uni(rs_qjsqspb_shjl);
		if (!(rs_qjsqspb_shjl.equals("")))	wheresql+=" and  (rs_qjsqspb.shjl='"+rs_qjsqspb_shjl+"')";
	}
	rs_qjsqspb_shr=request.getParameter("rs_qjsqspb_shr");
	if (rs_qjsqspb_shr!=null)
	{
		rs_qjsqspb_shr=cf.GB2Uni(rs_qjsqspb_shr);
		if (!(rs_qjsqspb_shr.equals("")))	wheresql+=" and  (rs_qjsqspb.shr='"+rs_qjsqspb_shr+"')";
	}
	rs_qjsqspb_shsj=request.getParameter("rs_qjsqspb_shsj");
	if (rs_qjsqspb_shsj!=null)
	{
		rs_qjsqspb_shsj=rs_qjsqspb_shsj.trim();
		if (!(rs_qjsqspb_shsj.equals("")))	wheresql+="  and (rs_qjsqspb.shsj>=TO_DATE('"+rs_qjsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqspb_shsj=request.getParameter("rs_qjsqspb_shsj2");
	if (rs_qjsqspb_shsj!=null)
	{
		rs_qjsqspb_shsj=rs_qjsqspb_shsj.trim();
		if (!(rs_qjsqspb_shsj.equals("")))	wheresql+="  and (rs_qjsqspb.shsj<=TO_DATE('"+rs_qjsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqspb_clzt=request.getParameter("rs_qjsqspb_clzt");
	if (rs_qjsqspb_clzt!=null)
	{
		rs_qjsqspb_clzt=cf.GB2Uni(rs_qjsqspb_clzt);
		if (!(rs_qjsqspb_clzt.equals("")))	wheresql+=" and  (rs_qjsqspb.clzt='"+rs_qjsqspb_clzt+"')";
	}
	rs_qjsqspb_ztbm=request.getParameter("rs_qjsqspb_ztbm");
	if (rs_qjsqspb_ztbm!=null)
	{
		rs_qjsqspb_ztbm=cf.GB2Uni(rs_qjsqspb_ztbm);
		if (!(rs_qjsqspb_ztbm.equals("")))	wheresql+=" and  (rs_qjsqspb.ztbm='"+rs_qjsqspb_ztbm+"')";
	}
	rs_qjsqspb_yclzt=request.getParameter("rs_qjsqspb_yclzt");
	if (rs_qjsqspb_yclzt!=null)
	{
		rs_qjsqspb_yclzt=cf.GB2Uni(rs_qjsqspb_yclzt);
		if (!(rs_qjsqspb_yclzt.equals("")))	wheresql+=" and  (rs_qjsqspb.yclzt='"+rs_qjsqspb_yclzt+"')";
	}
	rs_qjsqspb_yztbm=request.getParameter("rs_qjsqspb_yztbm");
	if (rs_qjsqspb_yztbm!=null)
	{
		rs_qjsqspb_yztbm=cf.GB2Uni(rs_qjsqspb_yztbm);
		if (!(rs_qjsqspb_yztbm.equals("")))	wheresql+=" and  (rs_qjsqspb.yztbm='"+rs_qjsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_qjsqspb.spxh,rs_qjsqspb.sqxh,a.dwmc fgsbh,rs_qjsqd.ygbh,rs_qjsqd.yhmc, DECODE(rs_qjsqd.xb,'M','男','W','女'),rs_qjsqd.lrsj,e.shjlmc shjl,rs_qjsqspb.shyj,rs_qjsqspb.shr,rs_qjsqspb.shsj, DECODE(rs_qjsqspb.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),g.ztmc ztbm,rs_qjsqspb.yspxh, DECODE(rs_qjsqspb.yclzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),h.ztmc yztbm,f.shjlmc yshjl,rs_qjsqspb.yshyj,rs_qjsqspb.yshr,rs_qjsqspb.yshsj  ";
	ls_sql+=" FROM rs_qjsqspb,rs_qjsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_qjsqspb.sqxh=rs_qjsqd.sqxh";
    ls_sql+=" and rs_qjsqd.fgsbh=a.dwbh(+) and rs_qjsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_qjsqspb.shjl=e.shjl(+) and rs_qjsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_qjsqspb.ztbm=g.ztbm(+) and rs_qjsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_qjsqspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_qjsqspbCxList.jsp","SelectCxRs_qjsqspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_qjsqspb_sqxh","rs_qjsqd_fgsbh","rs_qjsqd_ygbh","rs_qjsqd_yhmc","rs_qjsqd_xb","rs_qjsqd_xdwbh","rs_qjsqd_xxzzwbm","rs_qjsqd_lrsj","rs_qjsqspb_shjl","rs_qjsqspb_shyj","rs_qjsqspb_shr","rs_qjsqspb_shsj","rs_qjsqspb_clzt","rs_qjsqspb_ztbm","rs_qjsqspb_yspxh","rs_qjsqspb_yclzt","rs_qjsqspb_yztbm","rs_qjsqspb_yshjl","rs_qjsqspb_yshyj","rs_qjsqspb_yshr","rs_qjsqspb_yshsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
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
  <B><font size="3">请假申请--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">请假申请序号</td>
	<td  width="5%">申报公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="3%">申请录入时间</td>
	<td  width="3%">审核结论</td>
	<td  width="17%">审核意见</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核后处理状态</td>
	<td  width="6%">审核后审批状态</td>
	<td  width="3%">上次审批序号</td>
	<td  width="3%">上次处理状态</td>
	<td  width="6%">上次审批状态</td>
	<td  width="3%">上次审核结论</td>
	<td  width="16%">上次审核意见</td>
	<td  width="2%">上次审核人</td>
	<td  width="3%">上次审核时间</td>
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