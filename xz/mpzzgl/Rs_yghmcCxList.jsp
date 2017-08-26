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
	String rs_yghmc_bianhao=null;
	String rs_yghmc_xm=null;
	String rs_yghmc_xb=null;
	String rs_yghmc_csrq=null;
	String rs_yghmc_mz=null;
	String rs_yghmc_hf=null;
	String rs_yghmc_rzsj=null;
	String rs_yghmc_htdqrq=null;
	String rs_yghmc_sfzszg=null;
	String rs_yghmc_dwbh=null;
	String rs_yghmc_zw=null;
	String rs_yghmc_sfqs=null;
	String rs_yghmc_ylbx=null;
	String rs_yghmc_jylbx=null;
//	String rs_yghmc_sfzszg=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";
	}

	rs_yghmc_bianhao=request.getParameter("rs_yghmc_bianhao");
	if (rs_yghmc_bianhao!=null)
	{
		rs_yghmc_bianhao=cf.GB2Uni(rs_yghmc_bianhao);
		if (!(rs_yghmc_bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+rs_yghmc_bianhao+"')";
	}
	rs_yghmc_xm=request.getParameter("rs_yghmc_xm");
	if (rs_yghmc_xm!=null)
	{
		rs_yghmc_xm=cf.GB2Uni(rs_yghmc_xm);
		if (!(rs_yghmc_xm.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+rs_yghmc_xm+"%')";
	}
	rs_yghmc_xb=request.getParameter("rs_yghmc_xb");
	if (rs_yghmc_xb!=null)
	{
		rs_yghmc_xb=cf.GB2Uni(rs_yghmc_xb);
		if (!(rs_yghmc_xb.equals("")))	wheresql+=" and  (sq_yhxx.xb='"+rs_yghmc_xb+"')";
	}
	rs_yghmc_csrq=request.getParameter("rs_yghmc_csrq");
	if (rs_yghmc_csrq!=null)
	{
		rs_yghmc_csrq=rs_yghmc_csrq.trim();
		if (!(rs_yghmc_csrq.equals("")))	wheresql+="  and (sq_yhxx.csrq>=TO_DATE('"+rs_yghmc_csrq+"','YYYY/MM/DD'))";
	}
	rs_yghmc_csrq=request.getParameter("rs_yghmc_csrq2");
	if (rs_yghmc_csrq!=null)
	{
		rs_yghmc_csrq=rs_yghmc_csrq.trim();
		if (!(rs_yghmc_csrq.equals("")))	wheresql+="  and (sq_yhxx.csrq<=TO_DATE('"+rs_yghmc_csrq+"','YYYY/MM/DD'))";
	}
	rs_yghmc_mz=request.getParameter("rs_yghmc_mz");
	if (rs_yghmc_mz!=null)
	{
		rs_yghmc_mz=cf.GB2Uni(rs_yghmc_mz);
		if (!(rs_yghmc_mz.equals("")))	wheresql+=" and  (sq_yhxx.mz='"+rs_yghmc_mz+"')";
	}
	rs_yghmc_hf=request.getParameter("rs_yghmc_hf");
	if (rs_yghmc_hf!=null)
	{
		rs_yghmc_hf=cf.GB2Uni(rs_yghmc_hf);
		if (!(rs_yghmc_hf.equals("")))	wheresql+=" and  (sq_yhxx.hf='"+rs_yghmc_hf+"')";
	}
	rs_yghmc_rzsj=request.getParameter("rs_yghmc_rzsj");
	if (rs_yghmc_rzsj!=null)
	{
		rs_yghmc_rzsj=rs_yghmc_rzsj.trim();
		if (!(rs_yghmc_rzsj.equals("")))	wheresql+="  and (sq_yhxx.rzsj>=TO_DATE('"+rs_yghmc_rzsj+"','YYYY/MM/DD'))";
	}
	rs_yghmc_rzsj=request.getParameter("rs_yghmc_rzsj2");
	if (rs_yghmc_rzsj!=null)
	{
		rs_yghmc_rzsj=rs_yghmc_rzsj.trim();
		if (!(rs_yghmc_rzsj.equals("")))	wheresql+="  and (sq_yhxx.rzsj<=TO_DATE('"+rs_yghmc_rzsj+"','YYYY/MM/DD'))";
	}
	rs_yghmc_htdqrq=request.getParameter("rs_yghmc_htdqrq");
	if (rs_yghmc_htdqrq!=null)
	{
		rs_yghmc_htdqrq=rs_yghmc_htdqrq.trim();
		if (!(rs_yghmc_htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq>=TO_DATE('"+rs_yghmc_htdqrq+"','YYYY/MM/DD'))";
	}
	rs_yghmc_htdqrq=request.getParameter("rs_yghmc_htdqrq2");
	if (rs_yghmc_htdqrq!=null)
	{
		rs_yghmc_htdqrq=rs_yghmc_htdqrq.trim();
		if (!(rs_yghmc_htdqrq.equals("")))	wheresql+="  and (sq_yhxx.htdqrq<=TO_DATE('"+rs_yghmc_htdqrq+"','YYYY/MM/DD'))";
	}
	rs_yghmc_sfzszg=request.getParameter("rs_yghmc_sfzszg");
	if (rs_yghmc_sfzszg!=null)
	{
		rs_yghmc_sfzszg=cf.GB2Uni(rs_yghmc_sfzszg);
		if (!(rs_yghmc_sfzszg.equals("")))	wheresql+=" and  (sq_yhxx.sfzszg='"+rs_yghmc_sfzszg+"')";
	}
	rs_yghmc_dwbh=request.getParameter("rs_yghmc_dwbh");
	if (rs_yghmc_dwbh!=null)
	{
		rs_yghmc_dwbh=cf.GB2Uni(rs_yghmc_dwbh);
		if (!(rs_yghmc_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+rs_yghmc_dwbh+"')";
	}
	rs_yghmc_zw=request.getParameter("rs_yghmc_zw");
	if (rs_yghmc_zw!=null)
	{
		rs_yghmc_zw=cf.GB2Uni(rs_yghmc_zw);
		if (!(rs_yghmc_zw.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+rs_yghmc_zw+"')";
	}
	rs_yghmc_sfqs=request.getParameter("rs_yghmc_sfqs");
	if (rs_yghmc_sfqs!=null)
	{
		rs_yghmc_sfqs=cf.GB2Uni(rs_yghmc_sfqs);
		if (!(rs_yghmc_sfqs.equals("")))	wheresql+=" and  (sq_yhxx.sfqs='"+rs_yghmc_sfqs+"')";
	}
	rs_yghmc_ylbx=request.getParameter("rs_yghmc_ylbx");
	if (rs_yghmc_ylbx!=null)
	{
		rs_yghmc_ylbx=cf.GB2Uni(rs_yghmc_ylbx);
		if (!(rs_yghmc_ylbx.equals("")))	wheresql+=" and  (sq_yhxx.ylbx='"+rs_yghmc_ylbx+"')";
	}
	rs_yghmc_jylbx=request.getParameter("rs_yghmc_jylbx");
	if (rs_yghmc_jylbx!=null)
	{
		rs_yghmc_jylbx=cf.GB2Uni(rs_yghmc_jylbx);
		if (!(rs_yghmc_jylbx.equals("")))	wheresql+=" and  (sq_yhxx.jylbx='"+rs_yghmc_jylbx+"')";
	}
	rs_yghmc_sfzszg=request.getParameter("rs_yghmc_sfzszg");
	if (rs_yghmc_sfzszg!=null)
	{
		rs_yghmc_sfzszg=cf.GB2Uni(rs_yghmc_sfzszg);
		if (!(rs_yghmc_sfzszg.equals("")))	wheresql+=" and  (sq_yhxx.sfzszg='"+rs_yghmc_sfzszg+"')";
	}
	ls_sql="SELECT sq_yhxx.ygbh as ygbh,sq_yhxx.yhmc as rs_yghmc_xm, DECODE(sq_yhxx.xb,'M','男','W','女') as rs_yghmc_xb,sq_dwxx.dwmc as sq_dwxx_dwmc,dm_zwbm.zwmc as rs_yghmc_zw, sq_yhxx.dh as rs_yghmc_yddh";
	ls_sql+=" FROM sq_yhxx,sq_dwxx,dm_zwbm  ";
    ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh  and sq_yhxx.zwbm=dm_zwbm.zwbm  ";
	ls_sql+=" and  (sq_yhxx.sfzszg in('Y','N')) ";
//	out.println(ls_sql);
    ls_sql+=wheresql;
	ls_sql+=" order by sq_yhxx.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	//pageObj.initPage("Rs_yghmcCxList.jsp","SelectCxRs_yghmc.jsp","InsertRs_ygydspb.jsp","");
	pageObj.initPage("","","","InsertXz_mpyzsq.jsp");//点击审核后，调出的页面

	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ygbh","rs_yghmc_xm","rs_yghmc_xb","rs_yghmc_csrq","rs_yghmc_mz","rs_yghmc_sfzh","rs_yghmc_byyx","rs_yghmc_zy","rs_yghmc_hf","rs_yghmc_hjszd","rs_yghmc_rzsj","rs_yghmc_htdqrq","rs_yghmc_sfzszg","sq_dwxx_dwmc","rs_yghmc_zw","rs_yghmc_dacfd","rs_yghmc_zxxzz","rs_yghmc_sfqs","rs_yghmc_ylbx","rs_yghmc_jylbx","rs_yghmc_sfzszg","rs_yghmc_lzyy","rs_yghmc_lzrq","rs_yghmc_yddh","rs_yghmc_zzdh","rs_yghmc_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("登记");
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">名片制作申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="4%">&nbsp;</td>
	<td  width="5%">员工序号</td>
	<td  width="6%">姓名</td>
	<td  width="4%">性别</td>
	<td  width="12%">所属部门</td>
	<td  width="8%">职务</td>
	<td  width="16%">电话</td>
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

