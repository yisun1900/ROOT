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
	String rs_kqksqspb_spxh=null;
	String rs_kqksqspb_sqxh=null;
	String rs_kqksqd_fgsbh=null;
	String rs_kqksqd_ygbh=null;
	String rs_kqksqd_yhmc=null;
	String rs_kqksqd_xb=null;
	String rs_kqksqd_lrsj=null;
	String rs_kqksqspb_shjl=null;
	String rs_kqksqspb_shr=null;
	String rs_kqksqspb_shsj=null;
	String rs_kqksqspb_clzt=null;
	String rs_kqksqspb_ztbm=null;
	String rs_kqksqspb_yclzt=null;
	String rs_kqksqspb_yztbm=null;
	rs_kqksqspb_spxh=request.getParameter("rs_kqksqspb_spxh");
	if (rs_kqksqspb_spxh!=null)
	{
		rs_kqksqspb_spxh=rs_kqksqspb_spxh.trim();
		if (!(rs_kqksqspb_spxh.equals("")))	wheresql+=" and (rs_kqksqspb.spxh="+rs_kqksqspb_spxh+") ";
	}
	rs_kqksqspb_sqxh=request.getParameter("rs_kqksqspb_sqxh");
	if (rs_kqksqspb_sqxh!=null)
	{
		rs_kqksqspb_sqxh=cf.GB2Uni(rs_kqksqspb_sqxh);
		if (!(rs_kqksqspb_sqxh.equals("")))	wheresql+=" and  (rs_kqksqspb.sqxh='"+rs_kqksqspb_sqxh+"')";
	}
	rs_kqksqd_fgsbh=request.getParameter("rs_kqksqd_fgsbh");
	if (rs_kqksqd_fgsbh!=null)
	{
		rs_kqksqd_fgsbh=cf.GB2Uni(rs_kqksqd_fgsbh);
		if (!(rs_kqksqd_fgsbh.equals("")))	wheresql+=" and  (rs_kqksqd.fgsbh='"+rs_kqksqd_fgsbh+"')";
	}
	rs_kqksqd_ygbh=request.getParameter("rs_kqksqd_ygbh");
	if (rs_kqksqd_ygbh!=null)
	{
		rs_kqksqd_ygbh=rs_kqksqd_ygbh.trim();
		if (!(rs_kqksqd_ygbh.equals("")))	wheresql+=" and (rs_kqksqd.ygbh="+rs_kqksqd_ygbh+") ";
	}
	rs_kqksqd_yhmc=request.getParameter("rs_kqksqd_yhmc");
	if (rs_kqksqd_yhmc!=null)
	{
		rs_kqksqd_yhmc=cf.GB2Uni(rs_kqksqd_yhmc);
		if (!(rs_kqksqd_yhmc.equals("")))	wheresql+=" and  (rs_kqksqd.yhmc='"+rs_kqksqd_yhmc+"')";
	}
	rs_kqksqd_xb=request.getParameter("rs_kqksqd_xb");
	if (rs_kqksqd_xb!=null)
	{
		rs_kqksqd_xb=cf.GB2Uni(rs_kqksqd_xb);
		if (!(rs_kqksqd_xb.equals("")))	wheresql+=" and  (rs_kqksqd.xb='"+rs_kqksqd_xb+"')";
	}
	rs_kqksqd_lrsj=request.getParameter("rs_kqksqd_lrsj");
	if (rs_kqksqd_lrsj!=null)
	{
		rs_kqksqd_lrsj=rs_kqksqd_lrsj.trim();
		if (!(rs_kqksqd_lrsj.equals("")))	wheresql+="  and (rs_kqksqd.lrsj>=TO_DATE('"+rs_kqksqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqd_lrsj=request.getParameter("rs_kqksqd_lrsj2");
	if (rs_kqksqd_lrsj!=null)
	{
		rs_kqksqd_lrsj=rs_kqksqd_lrsj.trim();
		if (!(rs_kqksqd_lrsj.equals("")))	wheresql+="  and (rs_kqksqd.lrsj<=TO_DATE('"+rs_kqksqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqspb_shjl=request.getParameter("rs_kqksqspb_shjl");
	if (rs_kqksqspb_shjl!=null)
	{
		rs_kqksqspb_shjl=cf.GB2Uni(rs_kqksqspb_shjl);
		if (!(rs_kqksqspb_shjl.equals("")))	wheresql+=" and  (rs_kqksqspb.shjl='"+rs_kqksqspb_shjl+"')";
	}
	rs_kqksqspb_shr=request.getParameter("rs_kqksqspb_shr");
	if (rs_kqksqspb_shr!=null)
	{
		rs_kqksqspb_shr=cf.GB2Uni(rs_kqksqspb_shr);
		if (!(rs_kqksqspb_shr.equals("")))	wheresql+=" and  (rs_kqksqspb.shr='"+rs_kqksqspb_shr+"')";
	}
	rs_kqksqspb_shsj=request.getParameter("rs_kqksqspb_shsj");
	if (rs_kqksqspb_shsj!=null)
	{
		rs_kqksqspb_shsj=rs_kqksqspb_shsj.trim();
		if (!(rs_kqksqspb_shsj.equals("")))	wheresql+="  and (rs_kqksqspb.shsj>=TO_DATE('"+rs_kqksqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqspb_shsj=request.getParameter("rs_kqksqspb_shsj2");
	if (rs_kqksqspb_shsj!=null)
	{
		rs_kqksqspb_shsj=rs_kqksqspb_shsj.trim();
		if (!(rs_kqksqspb_shsj.equals("")))	wheresql+="  and (rs_kqksqspb.shsj<=TO_DATE('"+rs_kqksqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqspb_clzt=request.getParameter("rs_kqksqspb_clzt");
	if (rs_kqksqspb_clzt!=null)
	{
		rs_kqksqspb_clzt=cf.GB2Uni(rs_kqksqspb_clzt);
		if (!(rs_kqksqspb_clzt.equals("")))	wheresql+=" and  (rs_kqksqspb.clzt='"+rs_kqksqspb_clzt+"')";
	}
	rs_kqksqspb_ztbm=request.getParameter("rs_kqksqspb_ztbm");
	if (rs_kqksqspb_ztbm!=null)
	{
		rs_kqksqspb_ztbm=cf.GB2Uni(rs_kqksqspb_ztbm);
		if (!(rs_kqksqspb_ztbm.equals("")))	wheresql+=" and  (rs_kqksqspb.ztbm='"+rs_kqksqspb_ztbm+"')";
	}
	rs_kqksqspb_yclzt=request.getParameter("rs_kqksqspb_yclzt");
	if (rs_kqksqspb_yclzt!=null)
	{
		rs_kqksqspb_yclzt=cf.GB2Uni(rs_kqksqspb_yclzt);
		if (!(rs_kqksqspb_yclzt.equals("")))	wheresql+=" and  (rs_kqksqspb.yclzt='"+rs_kqksqspb_yclzt+"')";
	}
	rs_kqksqspb_yztbm=request.getParameter("rs_kqksqspb_yztbm");
	if (rs_kqksqspb_yztbm!=null)
	{
		rs_kqksqspb_yztbm=cf.GB2Uni(rs_kqksqspb_yztbm);
		if (!(rs_kqksqspb_yztbm.equals("")))	wheresql+=" and  (rs_kqksqspb.yztbm='"+rs_kqksqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_kqksqspb.spxh,rs_kqksqspb.sqxh,a.dwmc fgsbh,rs_kqksqd.ygbh,rs_kqksqd.yhmc, DECODE(rs_kqksqd.xb,'M','男','W','女'),rs_kqksqd.lrsj,e.shjlmc shjl,rs_kqksqspb.shyj,rs_kqksqspb.shr,rs_kqksqspb.shsj, DECODE(rs_kqksqspb.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),g.ztmc ztbm,rs_kqksqspb.yspxh, DECODE(rs_kqksqspb.yclzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),h.ztmc yztbm,f.shjlmc yshjl,rs_kqksqspb.yshyj,rs_kqksqspb.yshr,rs_kqksqspb.yshsj  ";
	ls_sql+=" FROM rs_kqksqspb,rs_kqksqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_kqksqspb.sqxh=rs_kqksqd.sqxh";
    ls_sql+=" and rs_kqksqd.fgsbh=a.dwbh(+) and rs_kqksqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_kqksqspb.shjl=e.shjl(+) and rs_kqksqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_kqksqspb.ztbm=g.ztbm(+) and rs_kqksqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_kqksqspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_kqksqspbCxList.jsp","SelectCxRs_kqksqspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_kqksqspb_sqxh","rs_kqksqd_fgsbh","rs_kqksqd_ygbh","rs_kqksqd_yhmc","rs_kqksqd_xb","rs_kqksqd_xdwbh","rs_kqksqd_xxzzwbm","rs_kqksqd_lrsj","rs_kqksqspb_shjl","rs_kqksqspb_shyj","rs_kqksqspb_shr","rs_kqksqspb_shsj","rs_kqksqspb_clzt","rs_kqksqspb_ztbm","rs_kqksqspb_yspxh","rs_kqksqspb_yclzt","rs_kqksqspb_yztbm","rs_kqksqspb_yshjl","rs_kqksqspb_yshyj","rs_kqksqspb_yshr","rs_kqksqspb_yshsj"};
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
  <B><font size="3">考勤卡修正申请--审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">考勤卡修正申请序号</td>
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