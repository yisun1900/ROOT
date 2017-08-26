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
	String rs_ecrzspb_spxh=null;
	String rs_ecrzspb_sqxh=null;
	String rs_ecrzsqd_fgsbh=null;
	String rs_ecrzsqd_ygbh=null;
	String rs_ecrzsqd_yhmc=null;
	String rs_ecrzsqd_xb=null;
	String rs_ecrzsqd_xdwbh=null;
	String rs_ecrzsqd_xxzzwbm=null;
	String rs_ecrzsqd_lrsj=null;
	String rs_ecrzspb_shjl=null;
	String rs_ecrzspb_shr=null;
	String rs_ecrzspb_shsj=null;
	String rs_ecrzspb_clzt=null;
	String rs_ecrzspb_ztbm=null;
	String rs_ecrzspb_yclzt=null;
	String rs_ecrzspb_yztbm=null;
	rs_ecrzspb_spxh=request.getParameter("rs_ecrzspb_spxh");
	if (rs_ecrzspb_spxh!=null)
	{
		rs_ecrzspb_spxh=rs_ecrzspb_spxh.trim();
		if (!(rs_ecrzspb_spxh.equals("")))	wheresql+=" and (rs_ecrzspb.spxh="+rs_ecrzspb_spxh+") ";
	}
	rs_ecrzspb_sqxh=request.getParameter("rs_ecrzspb_sqxh");
	if (rs_ecrzspb_sqxh!=null)
	{
		rs_ecrzspb_sqxh=cf.GB2Uni(rs_ecrzspb_sqxh);
		if (!(rs_ecrzspb_sqxh.equals("")))	wheresql+=" and  (rs_ecrzspb.sqxh='"+rs_ecrzspb_sqxh+"')";
	}
	rs_ecrzsqd_fgsbh=request.getParameter("rs_ecrzsqd_fgsbh");
	if (rs_ecrzsqd_fgsbh!=null)
	{
		rs_ecrzsqd_fgsbh=cf.GB2Uni(rs_ecrzsqd_fgsbh);
		if (!(rs_ecrzsqd_fgsbh.equals("")))	wheresql+=" and  (rs_ecrzsqd.fgsbh='"+rs_ecrzsqd_fgsbh+"')";
	}
	rs_ecrzsqd_ygbh=request.getParameter("rs_ecrzsqd_ygbh");
	if (rs_ecrzsqd_ygbh!=null)
	{
		rs_ecrzsqd_ygbh=rs_ecrzsqd_ygbh.trim();
		if (!(rs_ecrzsqd_ygbh.equals("")))	wheresql+=" and (rs_ecrzsqd.ygbh="+rs_ecrzsqd_ygbh+") ";
	}
	rs_ecrzsqd_yhmc=request.getParameter("rs_ecrzsqd_yhmc");
	if (rs_ecrzsqd_yhmc!=null)
	{
		rs_ecrzsqd_yhmc=cf.GB2Uni(rs_ecrzsqd_yhmc);
		if (!(rs_ecrzsqd_yhmc.equals("")))	wheresql+=" and  (rs_ecrzsqd.yhmc='"+rs_ecrzsqd_yhmc+"')";
	}
	rs_ecrzsqd_xb=request.getParameter("rs_ecrzsqd_xb");
	if (rs_ecrzsqd_xb!=null)
	{
		rs_ecrzsqd_xb=cf.GB2Uni(rs_ecrzsqd_xb);
		if (!(rs_ecrzsqd_xb.equals("")))	wheresql+=" and  (rs_ecrzsqd.xb='"+rs_ecrzsqd_xb+"')";
	}
	rs_ecrzsqd_xdwbh=request.getParameter("rs_ecrzsqd_xdwbh");
	if (rs_ecrzsqd_xdwbh!=null)
	{
		rs_ecrzsqd_xdwbh=cf.GB2Uni(rs_ecrzsqd_xdwbh);
		if (!(rs_ecrzsqd_xdwbh.equals("")))	wheresql+=" and  (rs_ecrzsqd.xdwbh='"+rs_ecrzsqd_xdwbh+"')";
	}
	rs_ecrzsqd_xxzzwbm=request.getParameter("rs_ecrzsqd_xxzzwbm");
	if (rs_ecrzsqd_xxzzwbm!=null)
	{
		rs_ecrzsqd_xxzzwbm=cf.GB2Uni(rs_ecrzsqd_xxzzwbm);
		if (!(rs_ecrzsqd_xxzzwbm.equals("")))	wheresql+=" and  (rs_ecrzsqd.xxzzwbm='"+rs_ecrzsqd_xxzzwbm+"')";
	}
	rs_ecrzsqd_lrsj=request.getParameter("rs_ecrzsqd_lrsj");
	if (rs_ecrzsqd_lrsj!=null)
	{
		rs_ecrzsqd_lrsj=rs_ecrzsqd_lrsj.trim();
		if (!(rs_ecrzsqd_lrsj.equals("")))	wheresql+="  and (rs_ecrzsqd.lrsj>=TO_DATE('"+rs_ecrzsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzsqd_lrsj=request.getParameter("rs_ecrzsqd_lrsj2");
	if (rs_ecrzsqd_lrsj!=null)
	{
		rs_ecrzsqd_lrsj=rs_ecrzsqd_lrsj.trim();
		if (!(rs_ecrzsqd_lrsj.equals("")))	wheresql+="  and (rs_ecrzsqd.lrsj<=TO_DATE('"+rs_ecrzsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzspb_shjl=request.getParameter("rs_ecrzspb_shjl");
	if (rs_ecrzspb_shjl!=null)
	{
		rs_ecrzspb_shjl=cf.GB2Uni(rs_ecrzspb_shjl);
		if (!(rs_ecrzspb_shjl.equals("")))	wheresql+=" and  (rs_ecrzspb.shjl='"+rs_ecrzspb_shjl+"')";
	}
	rs_ecrzspb_shr=request.getParameter("rs_ecrzspb_shr");
	if (rs_ecrzspb_shr!=null)
	{
		rs_ecrzspb_shr=cf.GB2Uni(rs_ecrzspb_shr);
		if (!(rs_ecrzspb_shr.equals("")))	wheresql+=" and  (rs_ecrzspb.shr='"+rs_ecrzspb_shr+"')";
	}
	rs_ecrzspb_shsj=request.getParameter("rs_ecrzspb_shsj");
	if (rs_ecrzspb_shsj!=null)
	{
		rs_ecrzspb_shsj=rs_ecrzspb_shsj.trim();
		if (!(rs_ecrzspb_shsj.equals("")))	wheresql+="  and (rs_ecrzspb.shsj>=TO_DATE('"+rs_ecrzspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzspb_shsj=request.getParameter("rs_ecrzspb_shsj2");
	if (rs_ecrzspb_shsj!=null)
	{
		rs_ecrzspb_shsj=rs_ecrzspb_shsj.trim();
		if (!(rs_ecrzspb_shsj.equals("")))	wheresql+="  and (rs_ecrzspb.shsj<=TO_DATE('"+rs_ecrzspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ecrzspb_clzt=request.getParameter("rs_ecrzspb_clzt");
	if (rs_ecrzspb_clzt!=null)
	{
		rs_ecrzspb_clzt=cf.GB2Uni(rs_ecrzspb_clzt);
		if (!(rs_ecrzspb_clzt.equals("")))	wheresql+=" and  (rs_ecrzspb.clzt='"+rs_ecrzspb_clzt+"')";
	}
	rs_ecrzspb_ztbm=request.getParameter("rs_ecrzspb_ztbm");
	if (rs_ecrzspb_ztbm!=null)
	{
		rs_ecrzspb_ztbm=cf.GB2Uni(rs_ecrzspb_ztbm);
		if (!(rs_ecrzspb_ztbm.equals("")))	wheresql+=" and  (rs_ecrzspb.ztbm='"+rs_ecrzspb_ztbm+"')";
	}
	rs_ecrzspb_yclzt=request.getParameter("rs_ecrzspb_yclzt");
	if (rs_ecrzspb_yclzt!=null)
	{
		rs_ecrzspb_yclzt=cf.GB2Uni(rs_ecrzspb_yclzt);
		if (!(rs_ecrzspb_yclzt.equals("")))	wheresql+=" and  (rs_ecrzspb.yclzt='"+rs_ecrzspb_yclzt+"')";
	}
	rs_ecrzspb_yztbm=request.getParameter("rs_ecrzspb_yztbm");
	if (rs_ecrzspb_yztbm!=null)
	{
		rs_ecrzspb_yztbm=cf.GB2Uni(rs_ecrzspb_yztbm);
		if (!(rs_ecrzspb_yztbm.equals("")))	wheresql+=" and  (rs_ecrzspb.yztbm='"+rs_ecrzspb_yztbm+"')";
	}
	ls_sql="SELECT rs_ecrzspb.spxh,rs_ecrzspb.sqxh,a.dwmc fgsbh,rs_ecrzsqd.ygbh,rs_ecrzsqd.yhmc, DECODE(rs_ecrzsqd.xb,'M','男','W','女'),b.dwmc xdwbh,rs_ecrzsqd.xxzzwbm,rs_ecrzsqd.lrsj,e.shjlmc shjl,rs_ecrzspb.shyj,rs_ecrzspb.shr,rs_ecrzspb.shsj, DECODE(rs_ecrzspb.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已入职'),g.ztmc ztbm,rs_ecrzspb.yspxh, DECODE(rs_ecrzspb.yclzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已入职'),h.ztmc yztbm,f.shjlmc yshjl,rs_ecrzspb.yshyj,rs_ecrzspb.yshr,rs_ecrzspb.yshsj  ";
	ls_sql+=" FROM rs_ecrzspb,rs_ecrzsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_ecrzspb.sqxh=rs_ecrzsqd.sqxh";
    ls_sql+=" and rs_ecrzsqd.fgsbh=a.dwbh(+) and rs_ecrzsqd.xdwbh=b.dwbh(+) and rs_ecrzsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_ecrzspb.shjl=e.shjl(+) and rs_ecrzspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_ecrzspb.ztbm=g.ztbm(+) and rs_ecrzspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ecrzspb.spxh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ecrzspbCxList.jsp","SelectCxRs_ecrzspb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"spxh","rs_ecrzspb_sqxh","rs_ecrzsqd_fgsbh","rs_ecrzsqd_ygbh","rs_ecrzsqd_yhmc","rs_ecrzsqd_xb","rs_ecrzsqd_xdwbh","rs_ecrzsqd_xxzzwbm","rs_ecrzsqd_lrsj","rs_ecrzspb_shjl","rs_ecrzspb_shyj","rs_ecrzspb_shr","rs_ecrzspb_shsj","rs_ecrzspb_clzt","rs_ecrzspb_ztbm","rs_ecrzspb_yspxh","rs_ecrzspb_yclzt","rs_ecrzspb_yztbm","rs_ecrzspb_yshjl","rs_ecrzspb_yshyj","rs_ecrzspb_yshr","rs_ecrzspb_yshsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/ecrzsh/ViewRs_ecrzsqd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
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
  <B><font size="3">二次入职审批查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">审批序号</td>
	<td  width="4%">二次入职申请序号</td>
	<td  width="5%">申报公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="5%">申请二次入职部门</td>
	<td  width="5%">申请二次入职职位</td>
	<td  width="3%">申请录入时间</td>
	<td  width="3%">审核结论</td>
	<td  width="12%">审核意见</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核后处理状态</td>
	<td  width="6%">审核后审批状态</td>
	<td  width="3%">上次审批序号</td>
	<td  width="3%">上次处理状态</td>
	<td  width="6%">上次审批状态</td>
	<td  width="3%">上次审核结论</td>
	<td  width="11%">上次审核意见</td>
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