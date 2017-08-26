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
	String rs_zsgwsqspb_spxh=null;
	String rs_zsgwsqspb_sqxh=null;
	String rs_zsgwsqd_fgsbh=null;
	String rs_zsgwsqd_ygbh=null;
	String rs_zsgwsqd_yhmc=null;
	String rs_zsgwsqd_xb=null;
	String rs_zsgwsqd_lrsj=null;
	String rs_zsgwsqspb_shjl=null;
	String rs_zsgwsqspb_shr=null;
	String rs_zsgwsqspb_shsj=null;
	String rs_zsgwsqspb_clzt=null;
	String rs_zsgwsqspb_ztbm=null;
	String rs_zsgwsqspb_yclzt=null;
	String rs_zsgwsqspb_yztbm=null;
	rs_zsgwsqspb_spxh=request.getParameter("rs_zsgwsqspb_spxh");
	if (rs_zsgwsqspb_spxh!=null)
	{
		rs_zsgwsqspb_spxh=rs_zsgwsqspb_spxh.trim();
		if (!(rs_zsgwsqspb_spxh.equals("")))	wheresql+=" and (rs_zsgwsqspb.spxh="+rs_zsgwsqspb_spxh+") ";
	}
	rs_zsgwsqspb_sqxh=request.getParameter("rs_zsgwsqspb_sqxh");
	if (rs_zsgwsqspb_sqxh!=null)
	{
		rs_zsgwsqspb_sqxh=cf.GB2Uni(rs_zsgwsqspb_sqxh);
		if (!(rs_zsgwsqspb_sqxh.equals("")))	wheresql+=" and  (rs_zsgwsqspb.sqxh='"+rs_zsgwsqspb_sqxh+"')";
	}
	rs_zsgwsqd_fgsbh=request.getParameter("rs_zsgwsqd_fgsbh");
	if (rs_zsgwsqd_fgsbh!=null)
	{
		rs_zsgwsqd_fgsbh=cf.GB2Uni(rs_zsgwsqd_fgsbh);
		if (!(rs_zsgwsqd_fgsbh.equals("")))	wheresql+=" and  (rs_zsgwsqd.fgsbh='"+rs_zsgwsqd_fgsbh+"')";
	}
	rs_zsgwsqd_ygbh=request.getParameter("rs_zsgwsqd_ygbh");
	if (rs_zsgwsqd_ygbh!=null)
	{
		rs_zsgwsqd_ygbh=rs_zsgwsqd_ygbh.trim();
		if (!(rs_zsgwsqd_ygbh.equals("")))	wheresql+=" and (rs_zsgwsqd.ygbh="+rs_zsgwsqd_ygbh+") ";
	}
	rs_zsgwsqd_yhmc=request.getParameter("rs_zsgwsqd_yhmc");
	if (rs_zsgwsqd_yhmc!=null)
	{
		rs_zsgwsqd_yhmc=cf.GB2Uni(rs_zsgwsqd_yhmc);
		if (!(rs_zsgwsqd_yhmc.equals("")))	wheresql+=" and  (rs_zsgwsqd.yhmc='"+rs_zsgwsqd_yhmc+"')";
	}
	rs_zsgwsqd_xb=request.getParameter("rs_zsgwsqd_xb");
	if (rs_zsgwsqd_xb!=null)
	{
		rs_zsgwsqd_xb=cf.GB2Uni(rs_zsgwsqd_xb);
		if (!(rs_zsgwsqd_xb.equals("")))	wheresql+=" and  (rs_zsgwsqd.xb='"+rs_zsgwsqd_xb+"')";
	}
	rs_zsgwsqd_lrsj=request.getParameter("rs_zsgwsqd_lrsj");
	if (rs_zsgwsqd_lrsj!=null)
	{
		rs_zsgwsqd_lrsj=rs_zsgwsqd_lrsj.trim();
		if (!(rs_zsgwsqd_lrsj.equals("")))	wheresql+="  and (rs_zsgwsqd.lrsj>=TO_DATE('"+rs_zsgwsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqd_lrsj=request.getParameter("rs_zsgwsqd_lrsj2");
	if (rs_zsgwsqd_lrsj!=null)
	{
		rs_zsgwsqd_lrsj=rs_zsgwsqd_lrsj.trim();
		if (!(rs_zsgwsqd_lrsj.equals("")))	wheresql+="  and (rs_zsgwsqd.lrsj<=TO_DATE('"+rs_zsgwsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqspb_shjl=request.getParameter("rs_zsgwsqspb_shjl");
	if (rs_zsgwsqspb_shjl!=null)
	{
		rs_zsgwsqspb_shjl=cf.GB2Uni(rs_zsgwsqspb_shjl);
		if (!(rs_zsgwsqspb_shjl.equals("")))	wheresql+=" and  (rs_zsgwsqspb.shjl='"+rs_zsgwsqspb_shjl+"')";
	}
	rs_zsgwsqspb_shr=request.getParameter("rs_zsgwsqspb_shr");
	if (rs_zsgwsqspb_shr!=null)
	{
		rs_zsgwsqspb_shr=cf.GB2Uni(rs_zsgwsqspb_shr);
		if (!(rs_zsgwsqspb_shr.equals("")))	wheresql+=" and  (rs_zsgwsqspb.shr='"+rs_zsgwsqspb_shr+"')";
	}
	rs_zsgwsqspb_shsj=request.getParameter("rs_zsgwsqspb_shsj");
	if (rs_zsgwsqspb_shsj!=null)
	{
		rs_zsgwsqspb_shsj=rs_zsgwsqspb_shsj.trim();
		if (!(rs_zsgwsqspb_shsj.equals("")))	wheresql+="  and (rs_zsgwsqspb.shsj>=TO_DATE('"+rs_zsgwsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqspb_shsj=request.getParameter("rs_zsgwsqspb_shsj2");
	if (rs_zsgwsqspb_shsj!=null)
	{
		rs_zsgwsqspb_shsj=rs_zsgwsqspb_shsj.trim();
		if (!(rs_zsgwsqspb_shsj.equals("")))	wheresql+="  and (rs_zsgwsqspb.shsj<=TO_DATE('"+rs_zsgwsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_zsgwsqspb_clzt=request.getParameter("rs_zsgwsqspb_clzt");
	if (rs_zsgwsqspb_clzt!=null)
	{
		rs_zsgwsqspb_clzt=cf.GB2Uni(rs_zsgwsqspb_clzt);
		if (!(rs_zsgwsqspb_clzt.equals("")))	wheresql+=" and  (rs_zsgwsqspb.clzt='"+rs_zsgwsqspb_clzt+"')";
	}
	rs_zsgwsqspb_ztbm=request.getParameter("rs_zsgwsqspb_ztbm");
	if (rs_zsgwsqspb_ztbm!=null)
	{
		rs_zsgwsqspb_ztbm=cf.GB2Uni(rs_zsgwsqspb_ztbm);
		if (!(rs_zsgwsqspb_ztbm.equals("")))	wheresql+=" and  (rs_zsgwsqspb.ztbm='"+rs_zsgwsqspb_ztbm+"')";
	}
	rs_zsgwsqspb_yclzt=request.getParameter("rs_zsgwsqspb_yclzt");
	if (rs_zsgwsqspb_yclzt!=null)
	{
		rs_zsgwsqspb_yclzt=cf.GB2Uni(rs_zsgwsqspb_yclzt);
		if (!(rs_zsgwsqspb_yclzt.equals("")))	wheresql+=" and  (rs_zsgwsqspb.yclzt='"+rs_zsgwsqspb_yclzt+"')";
	}
	rs_zsgwsqspb_yztbm=request.getParameter("rs_zsgwsqspb_yztbm");
	if (rs_zsgwsqspb_yztbm!=null)
	{
		rs_zsgwsqspb_yztbm=cf.GB2Uni(rs_zsgwsqspb_yztbm);
		if (!(rs_zsgwsqspb_yztbm.equals("")))	wheresql+=" and  (rs_zsgwsqspb.yztbm='"+rs_zsgwsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_zsgwsqspb.spxh,rs_zsgwsqspb.sqxh,a.dwmc fgsbh,b.dwmc dwbh,rs_zsgwsqd.zsgwmc,rs_zsgwsqd.zbrs,rs_zsgwsqd.slrq,rs_zsgwsqd.lrsj,e.shjlmc shjl,rs_zsgwsqspb.shyj,rs_zsgwsqspb.shr,rs_zsgwsqspb.shsj, DECODE(rs_zsgwsqspb.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),g.ztmc ztbm,rs_zsgwsqspb.yspxh, DECODE(rs_zsgwsqspb.yclzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),h.ztmc yztbm,f.shjlmc yshjl,rs_zsgwsqspb.yshyj,rs_zsgwsqspb.yshr,rs_zsgwsqspb.yshsj  ";
	ls_sql+=" FROM rs_zsgwsqspb,rs_zsgwsqd,sq_dwxx a,sq_dwxx b,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_zsgwsqspb.sqxh=rs_zsgwsqd.sqxh";
    ls_sql+=" and rs_zsgwsqd.fgsbh=a.dwbh(+) and rs_zsgwsqd.dwbh=b.dwbh(+) ";
    ls_sql+=" and rs_zsgwsqspb.shjl=e.shjl(+) and rs_zsgwsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_zsgwsqspb.ztbm=g.ztbm(+) and rs_zsgwsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_zsgwsqspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_zsgwsqspbCxList.jsp","SelectCxRs_zsgwsqspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_zsgwsqspb_sqxh","rs_zsgwsqd_fgsbh","rs_zsgwsqd_ygbh","rs_zsgwsqd_yhmc","rs_zsgwsqd_xb","rs_zsgwsqd_xdwbh","rs_zsgwsqd_xxzzwbm","rs_zsgwsqd_lrsj","rs_zsgwsqspb_shjl","rs_zsgwsqspb_shyj","rs_zsgwsqspb_shr","rs_zsgwsqspb_shsj","rs_zsgwsqspb_clzt","rs_zsgwsqspb_ztbm","rs_zsgwsqspb_yspxh","rs_zsgwsqspb_yclzt","rs_zsgwsqspb_yztbm","rs_zsgwsqspb_yshjl","rs_zsgwsqspb_yshyj","rs_zsgwsqspb_yshr","rs_zsgwsqspb_yshsj"};
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
  <B><font size="3">增设岗位申请--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">增设岗位申请序号</td>
	<td  width="5%">申报公司</td>
	<td  width="4%">增设岗位部门</td>
	<td  width="5%">增设岗位名称</td>
	<td  width="2%">增补人数</td>
	<td  width="3%">设立日期</td>
	<td  width="3%">申请录入时间</td>
	<td  width="3%">审核结论</td>
	<td  width="13%">审核意见</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核后处理状态</td>
	<td  width="6%">审核后审批状态</td>
	<td  width="3%">上次审批序号</td>
	<td  width="3%">上次处理状态</td>
	<td  width="6%">上次审批状态</td>
	<td  width="3%">上次审核结论</td>
	<td  width="14%">上次审核意见</td>
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