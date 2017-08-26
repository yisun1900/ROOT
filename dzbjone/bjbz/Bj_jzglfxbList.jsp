<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150132'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[标准项目维护]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String yhdlm=(String)session.getAttribute("yhdlm");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql="";
	String wheresql="";
	String bj_jzglfxb_glbxh=null;


	String bj_jzglfxb_xmbh=null;
	String bj_jzglfxb_xmmc=null;
	String bj_jzglfxb_xmdlbm=null;
	String bj_jzglfxb_xmxlbm=null;
	String bj_jzglfxb_glflbm=null;
	String glfxclmc=null;
	String bj_jzglfxb_pp=null;
	String xh=null;
	String gg=null;
	String bj_jzglfxb_jldwbm=null;
	String xhl=null;
	String bj_jzglfxb_dj=null;
	String bj_jzglfxb_lrr=null;
	String bj_jzglfxb_lrsj=null;

	
	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and (bj_jzglfxb.bjbbh='"+bjbbh+"') ";
	}
	
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		if (!(dqbm.equals("")))	wheresql+=" and (bj_jzglfxb.dqbm='"+dqbm+"') ";
	}
	
	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		if (!(bjjbbm.equals("")))	wheresql+=" and (bj_jzglfxb.bjjbbm='"+bjjbbm+"') ";
	}
	
	String glfxclbm=null;
	glfxclbm=request.getParameter("glfxclbm");
	if (glfxclbm!=null)
	{
		if (!(glfxclbm.equals("")))	wheresql+=" and (bj_jzglfxb.glfxclbm='"+glfxclbm+"') ";
	}



	bj_jzglfxb_glbxh=request.getParameter("bj_jzglfxb_glbxh");
	if (bj_jzglfxb_glbxh!=null)
	{
		bj_jzglfxb_glbxh=bj_jzglfxb_glbxh.trim();
		if (!(bj_jzglfxb_glbxh.equals("")))	wheresql+=" and (bj_jzglfxb.glbxh="+bj_jzglfxb_glbxh+") ";
	}

	bj_jzglfxb_xmbh=request.getParameter("bj_jzglfxb_xmbh");
	if (bj_jzglfxb_xmbh!=null)
	{
		bj_jzglfxb_xmbh=cf.GB2Uni(bj_jzglfxb_xmbh);
		if (!(bj_jzglfxb_xmbh.equals("")))	wheresql+=" and  (bj_jzglfxb.xmbh='"+bj_jzglfxb_xmbh+"')";
	}
	bj_jzglfxb_xmmc=request.getParameter("bj_jzglfxb_xmmc");
	if (bj_jzglfxb_xmmc!=null)
	{
		bj_jzglfxb_xmmc=cf.GB2Uni(bj_jzglfxb_xmmc);
		if (!(bj_jzglfxb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc='"+bj_jzglfxb_xmmc+"')";
	}
	bj_jzglfxb_xmdlbm=request.getParameter("bj_jzglfxb_xmdlbm");
	if (bj_jzglfxb_xmdlbm!=null)
	{
		bj_jzglfxb_xmdlbm=cf.GB2Uni(bj_jzglfxb_xmdlbm);
		if (!(bj_jzglfxb_xmdlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmdlbm='"+bj_jzglfxb_xmdlbm+"')";
	}
	bj_jzglfxb_xmxlbm=request.getParameter("bj_jzglfxb_xmxlbm");
	if (bj_jzglfxb_xmxlbm!=null)
	{
		bj_jzglfxb_xmxlbm=cf.GB2Uni(bj_jzglfxb_xmxlbm);
		if (!(bj_jzglfxb_xmxlbm.equals("")))	wheresql+=" and  (bj_jzbjb.xmxlbm='"+bj_jzglfxb_xmxlbm+"')";
	}
	bj_jzglfxb_glflbm=request.getParameter("bj_jzglfxb_glflbm");
	if (bj_jzglfxb_glflbm!=null)
	{
		bj_jzglfxb_glflbm=cf.GB2Uni(bj_jzglfxb_glflbm);
		if (!(bj_jzglfxb_glflbm.equals("")))	wheresql+=" and  (bj_jzglfxb.glflbm='"+bj_jzglfxb_glflbm+"')";
	}
	glfxclmc=request.getParameter("glfxclmc");
	if (glfxclmc!=null)
	{
		glfxclmc=cf.GB2Uni(glfxclmc);
		if (!(glfxclmc.equals("")))	wheresql+=" and  (bj_jzglfxb.glfxclmc='"+glfxclmc+"')";
	}
	bj_jzglfxb_pp=request.getParameter("bj_jzglfxb_pp");
	if (bj_jzglfxb_pp!=null)
	{
		bj_jzglfxb_pp=cf.GB2Uni(bj_jzglfxb_pp);
		if (!(bj_jzglfxb_pp.equals("")))	wheresql+=" and  (bj_jzglfxb.pp='"+bj_jzglfxb_pp+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (bj_jzglfxb.xh='"+xh+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (bj_jzglfxb.gg='"+gg+"')";
	}
	bj_jzglfxb_jldwbm=request.getParameter("bj_jzglfxb_jldwbm");
	if (bj_jzglfxb_jldwbm!=null)
	{
		bj_jzglfxb_jldwbm=cf.GB2Uni(bj_jzglfxb_jldwbm);
		if (!(bj_jzglfxb_jldwbm.equals("")))	wheresql+=" and  (bj_jzglfxb.jldwbm='"+bj_jzglfxb_jldwbm+"')";
	}

	bj_jzglfxb_dj=request.getParameter("bj_jzglfxb_dj");
	if (bj_jzglfxb_dj!=null)
	{
		bj_jzglfxb_dj=bj_jzglfxb_dj.trim();
		if (!(bj_jzglfxb_dj.equals("")))	wheresql+=" and  (bj_jzglfxb.dj="+bj_jzglfxb_dj+") ";
	}
	bj_jzglfxb_lrr=request.getParameter("bj_jzglfxb_lrr");
	if (bj_jzglfxb_lrr!=null)
	{
		bj_jzglfxb_lrr=cf.GB2Uni(bj_jzglfxb_lrr);
		if (!(bj_jzglfxb_lrr.equals("")))	wheresql+=" and  (bj_jzglfxb.lrr='"+bj_jzglfxb_lrr+"')";
	}
	bj_jzglfxb_lrsj=request.getParameter("bj_jzglfxb_lrsj");
	if (bj_jzglfxb_lrsj!=null)
	{
		bj_jzglfxb_lrsj=bj_jzglfxb_lrsj.trim();
		if (!(bj_jzglfxb_lrsj.equals("")))	wheresql+="  and (bj_jzglfxb.lrsj=TO_DATE('"+bj_jzglfxb_lrsj+"','YYYY/MM/DD'))";
	}


	String xssl=null;
	xssl=request.getParameter("xssl");

	ls_sql="SELECT bj_jzbjb.xmbh,bj_jzbjb.xmmc,bj_jzglfxb.dqbm,bj_jzglfxb.bjbbh,bj_jzglfxb.bjjbbm";
	ls_sql+=" ,glflmc,bj_jzglfxb.glbxh,bj_jzglfxb.glfxclbm,bj_jzglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,bj_jzglfxb.jldwbm,bj_jzglfxb.xhl,bj_jzglfxb.dj,ROUND(bj_jzglfxb.xhl*bj_jzglfxb.dj,2) je,bj_jzglfxb.jqsfl,bj_jzglfxb.bsfl,bj_jzglfxb.tvocsfl,DECODE(bj_jzglfxb.wlllbz,'Y','需要','N','否') wlllbz,DECODE(bj_jzglfxb.lx,'1','打印','2','不打印') lx,bj_jzglfxb.lrr,bj_jzglfxb.lrsj,bj_jzglfxb.bz   ";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,bdm_glflbm,jxc_clbm  ";
    ls_sql+=" where bj_jzglfxb.xmbh=bj_jzbjb.xmbh and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm ";
    ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+) ";
	ls_sql+=" and bj_jzglfxb.glfxclbm=jxc_clbm.nbbm(+) ";
	ls_sql+=" and bj_jzglfxb.dqbm=bj_jzbjb.dqbm";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and bj_jzbjb.dqbm in(select sq_dwxx.dqbm from sq_sqfgs,sq_dwxx where sq_sqfgs.ssfgs=sq_dwxx.dwbh and sq_sqfgs.ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and bj_jzbjb.dqbm in(select sq_dwxx.dqbm from sq_sqbm,sq_dwxx where sq_sqbm.dwbh=sq_dwxx.dwbh and ygbh='"+ygbh+"' )";
	}
	
	ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Bj_jzglfxbList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(xssl));
//设置显示列

	String[] disColName={"xmbh","xmmc","glflmc","glbxh","glfxclbm","glfxclmc","ppmc","xh","gg","jldwbm","xhl","dj","je","jqsfl","bsfl","tvocsfl","wlllbz","lx","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"glbxh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"批量替换"};//按钮的显示名称
	String[] buttonLink={"EnterThClbm.jsp?dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","bjbbh","bjjbbm","xmbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewXmbhGlfx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xmbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">工料分析－调整材料</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="4%">项目编号</td>
	<td  width="6%">项目名称</td>
	<td  width="3%">工料分类</td>
	<td  width="3%">工料序号</td>
	<td  width="4%">材料编码</td>
	<td  width="7%">材料名称</td>
      <td width="6%">品牌</td>
      <td width="6%">型号</td>
      <td width="7%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="4%">单价</td>
	<td  width="5%">金额</td>
	<td  width="3%">甲醛释放量</td>
	<td  width="3%">苯释放量</td>
	<td  width="3%">TVOC释放量</td>
	<td  width="3%">需到物流领料</td>
	<td  width="3%">类型</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="517%">备注</td>
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