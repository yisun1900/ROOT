<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String tc_csrjzck_cpbm=null;
	String tc_csrjzck_dqbm=null;
	String tc_csrjzck_bjjbbm=null;
	String tc_csrjzck_nbbm=null;
	String tc_csrjzck_tccpdlbm=null;
	String tc_csrjzck_tccplbbm=null;
	String tc_csrjzck_cpmc=null;
	String tc_csrjzck_xh=null;
	String tc_csrjzck_gg=null;
	String tc_csrjzck_ppmc=null;
	String tc_csrjzck_gysmc=null;
	String tc_csrjzck_jldw=null;
	String tc_csrjzck_xdjldw=null;
	String tc_csrjzck_xdb=null;
	String tc_csrjzck_sh=null;
	String tc_csrjzck_sfxclxs=null;
	String tc_csrjzck_jsj=null;
	String tc_csrjzck_khxsdj=null;
	String tc_csrjzck_sgddj=null;
	String tc_csrjzck_lrr=null;
	String tc_csrjzck_lrsj=null;

	String bzmc=null;
	bzmc=request.getParameter("bzmc");
	if (bzmc!=null)
	{
		bzmc=cf.GB2Uni(bzmc);
		if (!(bzmc.equals("")))	wheresql+=" and  (tc_csrjzck.bzmc='"+bzmc+"')";
	}
	
	
	tc_csrjzck_cpbm=request.getParameter("tc_csrjzck_cpbm");
	if (tc_csrjzck_cpbm!=null)
	{
		tc_csrjzck_cpbm=cf.GB2Uni(tc_csrjzck_cpbm);
		if (!(tc_csrjzck_cpbm.equals("")))	wheresql+=" and  (tc_csrjzck.cpbm='"+tc_csrjzck_cpbm+"')";
	}
	tc_csrjzck_dqbm=request.getParameter("tc_csrjzck_dqbm");
	if (tc_csrjzck_dqbm!=null)
	{
		tc_csrjzck_dqbm=cf.GB2Uni(tc_csrjzck_dqbm);
		if (!(tc_csrjzck_dqbm.equals("")))	wheresql+=" and  (tc_csrjzck.dqbm='"+tc_csrjzck_dqbm+"')";
	}
	tc_csrjzck_bjjbbm=request.getParameter("tc_csrjzck_bjjbbm");
	if (tc_csrjzck_bjjbbm!=null)
	{
		tc_csrjzck_bjjbbm=cf.GB2Uni(tc_csrjzck_bjjbbm);
		if (!(tc_csrjzck_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjzck.bjjbbm='"+tc_csrjzck_bjjbbm+"')";
	}
	tc_csrjzck_nbbm=request.getParameter("tc_csrjzck_nbbm");
	if (tc_csrjzck_nbbm!=null)
	{
		tc_csrjzck_nbbm=cf.GB2Uni(tc_csrjzck_nbbm);
		if (!(tc_csrjzck_nbbm.equals("")))	wheresql+=" and  (tc_csrjzck.nbbm='"+tc_csrjzck_nbbm+"')";
	}
	tc_csrjzck_tccpdlbm=request.getParameter("tc_csrjzck_tccpdlbm");
	if (tc_csrjzck_tccpdlbm!=null)
	{
		tc_csrjzck_tccpdlbm=cf.GB2Uni(tc_csrjzck_tccpdlbm);
		if (!(tc_csrjzck_tccpdlbm.equals("")))	wheresql+=" and (tc_csrjzck.tccpdlbm='"+tc_csrjzck_tccpdlbm+"') ";
	}
	tc_csrjzck_tccplbbm=request.getParameter("tc_csrjzck_tccplbbm");
	if (tc_csrjzck_tccplbbm!=null)
	{
		tc_csrjzck_tccplbbm=cf.GB2Uni(tc_csrjzck_tccplbbm);
		if (!(tc_csrjzck_tccplbbm.equals("")))	wheresql+=" and (tc_csrjzck.tccplbbm='"+tc_csrjzck_tccplbbm+"') ";
	}
	tc_csrjzck_cpmc=request.getParameter("tc_csrjzck_cpmc");
	if (tc_csrjzck_cpmc!=null)
	{
		tc_csrjzck_cpmc=cf.GB2Uni(tc_csrjzck_cpmc);
		if (!(tc_csrjzck_cpmc.equals("")))	wheresql+=" and  (tc_csrjzck.cpmc='"+tc_csrjzck_cpmc+"')";
	}
	tc_csrjzck_xh=request.getParameter("tc_csrjzck_xh");
	if (tc_csrjzck_xh!=null)
	{
		tc_csrjzck_xh=cf.GB2Uni(tc_csrjzck_xh);
		if (!(tc_csrjzck_xh.equals("")))	wheresql+=" and  (tc_csrjzck.xh='"+tc_csrjzck_xh+"')";
	}
	tc_csrjzck_gg=request.getParameter("tc_csrjzck_gg");
	if (tc_csrjzck_gg!=null)
	{
		tc_csrjzck_gg=cf.GB2Uni(tc_csrjzck_gg);
		if (!(tc_csrjzck_gg.equals("")))	wheresql+=" and  (tc_csrjzck.gg='"+tc_csrjzck_gg+"')";
	}
	tc_csrjzck_ppmc=request.getParameter("tc_csrjzck_ppmc");
	if (tc_csrjzck_ppmc!=null)
	{
		tc_csrjzck_ppmc=cf.GB2Uni(tc_csrjzck_ppmc);
		if (!(tc_csrjzck_ppmc.equals("")))	wheresql+=" and  (tc_csrjzck.ppmc='"+tc_csrjzck_ppmc+"')";
	}
	tc_csrjzck_gysmc=request.getParameter("tc_csrjzck_gysmc");
	if (tc_csrjzck_gysmc!=null)
	{
		tc_csrjzck_gysmc=cf.GB2Uni(tc_csrjzck_gysmc);
		if (!(tc_csrjzck_gysmc.equals("")))	wheresql+=" and  (tc_csrjzck.gysmc='"+tc_csrjzck_gysmc+"')";
	}
	tc_csrjzck_jldw=request.getParameter("tc_csrjzck_jldw");
	if (tc_csrjzck_jldw!=null)
	{
		tc_csrjzck_jldw=cf.GB2Uni(tc_csrjzck_jldw);
		if (!(tc_csrjzck_jldw.equals("")))	wheresql+=" and  (tc_csrjzck.jldw='"+tc_csrjzck_jldw+"')";
	}
	tc_csrjzck_xdjldw=request.getParameter("tc_csrjzck_xdjldw");
	if (tc_csrjzck_xdjldw!=null)
	{
		tc_csrjzck_xdjldw=cf.GB2Uni(tc_csrjzck_xdjldw);
		if (!(tc_csrjzck_xdjldw.equals("")))	wheresql+=" and  (tc_csrjzck.xdjldw='"+tc_csrjzck_xdjldw+"')";
	}
	tc_csrjzck_xdb=request.getParameter("tc_csrjzck_xdb");
	if (tc_csrjzck_xdb!=null)
	{
		tc_csrjzck_xdb=tc_csrjzck_xdb.trim();
		if (!(tc_csrjzck_xdb.equals("")))	wheresql+=" and  (tc_csrjzck.xdb="+tc_csrjzck_xdb+") ";
	}
	tc_csrjzck_sh=request.getParameter("tc_csrjzck_sh");
	if (tc_csrjzck_sh!=null)
	{
		tc_csrjzck_sh=tc_csrjzck_sh.trim();
		if (!(tc_csrjzck_sh.equals("")))	wheresql+=" and  (tc_csrjzck.sh="+tc_csrjzck_sh+") ";
	}
	tc_csrjzck_sfxclxs=request.getParameter("tc_csrjzck_sfxclxs");
	if (tc_csrjzck_sfxclxs!=null)
	{
		tc_csrjzck_sfxclxs=cf.GB2Uni(tc_csrjzck_sfxclxs);
		if (!(tc_csrjzck_sfxclxs.equals("")))	wheresql+=" and  (tc_csrjzck.sfxclxs='"+tc_csrjzck_sfxclxs+"')";
	}
	tc_csrjzck_jsj=request.getParameter("tc_csrjzck_jsj");
	if (tc_csrjzck_jsj!=null)
	{
		tc_csrjzck_jsj=tc_csrjzck_jsj.trim();
		if (!(tc_csrjzck_jsj.equals("")))	wheresql+=" and  (tc_csrjzck.jsj="+tc_csrjzck_jsj+") ";
	}
	tc_csrjzck_khxsdj=request.getParameter("tc_csrjzck_khxsdj");
	if (tc_csrjzck_khxsdj!=null)
	{
		tc_csrjzck_khxsdj=tc_csrjzck_khxsdj.trim();
		if (!(tc_csrjzck_khxsdj.equals("")))	wheresql+=" and  (tc_csrjzck.khxsdj="+tc_csrjzck_khxsdj+") ";
	}
	tc_csrjzck_sgddj=request.getParameter("tc_csrjzck_sgddj");
	if (tc_csrjzck_sgddj!=null)
	{
		tc_csrjzck_sgddj=tc_csrjzck_sgddj.trim();
		if (!(tc_csrjzck_sgddj.equals("")))	wheresql+=" and  (tc_csrjzck.sgddj="+tc_csrjzck_sgddj+") ";
	}
	tc_csrjzck_lrr=request.getParameter("tc_csrjzck_lrr");
	if (tc_csrjzck_lrr!=null)
	{
		tc_csrjzck_lrr=cf.GB2Uni(tc_csrjzck_lrr);
		if (!(tc_csrjzck_lrr.equals("")))	wheresql+=" and  (tc_csrjzck.lrr='"+tc_csrjzck_lrr+"')";
	}
	tc_csrjzck_lrsj=request.getParameter("tc_csrjzck_lrsj");
	if (tc_csrjzck_lrsj!=null)
	{
		tc_csrjzck_lrsj=tc_csrjzck_lrsj.trim();
		if (!(tc_csrjzck_lrsj.equals("")))	wheresql+="  and (tc_csrjzck.lrsj=TO_DATE('"+tc_csrjzck_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT tc_csrjzck.cpbm,dm_dqbm.dqmc,a.bjjbmc,tc_csrjzck.nbbm,jxc_cldlbm.cldlmc,jxc_clxlbm.clxlmc,tc_csrjzck.bzmc,tc_csrjzck.cpmc,tc_csrjzck.xh,tc_csrjzck.gg,tc_csrjzck.ppmc,tc_csrjzck.gysmc,tc_csrjzck.jldw,tc_csrjzck.xdjldw,tc_csrjzck.xdb,tc_csrjzck.sh||'%' sh, DECODE(tc_csrjzck.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,tc_csrjzck.yjsj,tc_csrjzck.ykhxsdj,tc_csrjzck.ysgddj,tc_csrjzck.jsj,tc_csrjzck.khxsdj,tc_csrjzck.sgddj,b.bjjbmc mc2,tc_csrjzcsjcjb.ysjsfj,tc_csrjzcsjcjb.sjsfj,tc_csrjzck.lrr,tc_csrjzck.lrsj,tc_csrjzck.zp,tc_csrjzck.bz  ";
	ls_sql+=" FROM dm_dqbm,tc_csrjzck,bdm_bjjbbm a,jxc_cldlbm,jxc_clxlbm,tc_csrjzcsjcjb,bdm_bjjbbm b  ";
    ls_sql+=" where tc_csrjzck.dqbm=dm_dqbm.dqbm(+) and tc_csrjzck.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and tc_csrjzck.tccpdlbm=jxc_cldlbm.cldlbm(+) ";
    ls_sql+=" and tc_csrjzck.tccplbbm=jxc_clxlbm.clxlbm(+) ";
    ls_sql+=" and tc_csrjzck.cpbm=tc_csrjzcsjcjb.cpbm(+) ";
    ls_sql+=" and tc_csrjzcsjcjb.bjjbbm=b.bjjbbm(+) ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and tc_csrjzck.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and tc_csrjzck.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjzck.dqbm,tc_csrjzck.bjjbbm,tc_csrjzck.tccpdlbm,tc_csrjzck.tccplbbm,tc_csrjzck.cpmc,tc_csrjzck.cpbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_csrjzckList.jsp","","","EditTc_csrjzck.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","批量修改结算价","批量修改客户销售单价","批量修改施工队单价","批量修改升级收费价"};//按钮的显示名称
	String[] buttonLink={"Tc_csrjzckList.jsp?","plxgjsj.jsp","plxgkhj.jsp","plxgsggdj.jsp","plxgsjj.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1,1,1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from tc_csrjzcsjcjb where cpbm in( select cpbm from tc_csrjzck where "+chooseitem+")";
		sql[1]="delete from tc_csrjzck where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">套餐主材库－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(370);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">产品编码</td>
	<td  width="2%">地区</td>
	<td  width="2%">主材级别</td>
	<td  width="3%">内部编码</td>
	<td  width="3%">产品大类</td>
	<td  width="5%">产品小类</td>
	<td  width="3%">编组名称</td>
	<td  width="6%">产品名称</td>
	<td  width="6%">型号</td>
	<td  width="6%">规格</td>
	<td  width="4%">品牌</td>
	<td  width="7%">供应商</td>
	<td  width="2%">计量单位</td>
	<td  width="2%">下单计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="2%">损耗</td>
	<td  width="2%">是否需处理小数</td>
	<td  width="2%">原结算价</td>
	<td  width="2%">原客户销售单价</td>
	<td  width="2%">原施工队单价</td>
	<td  width="2%">结算价</td>
	<td  width="2%">客户销售单价</td>
	<td  width="2%">施工队单价</td>
	  <td width="2%">被升级级别</td>
	  <td width="2%">原升级收费价</td>
	  <td width="2%">升级收费价</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">照片名称</td>
	<td  width="343%">备注</td>
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