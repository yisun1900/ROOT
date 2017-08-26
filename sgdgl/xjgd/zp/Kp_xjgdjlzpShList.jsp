<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	
	if (zwbm.equals("31"))//监理主管，只能看本小组工地
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}


	
	String xjzpmc=null;
	String xjjlh=null;

	String lx=null;
	String zpgjz=null;
	String zpsm=null;
	String kkzpbz=null;
	String khly=null;
	String khlysj=null;

	xjzpmc=request.getParameter("xjzpmc");
	if (xjzpmc!=null)
	{
		xjzpmc=cf.GB2Uni(xjzpmc);
		if (!(xjzpmc.equals("")))	wheresql+=" and  (kp_xjgdjlzp.xjzpmc='"+xjzpmc+"')";
	}
	xjjlh=request.getParameter("xjjlh");
	if (xjjlh!=null)
	{
		xjjlh=cf.GB2Uni(xjjlh);
		if (!(xjjlh.equals("")))	wheresql+=" and  (kp_xjgdjlzp.xjjlh='"+xjjlh+"')";
	}

	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (kp_xjgdjlzp.lx='"+lx+"')";
	}
	zpgjz=request.getParameter("zpgjz");
	if (zpgjz!=null)
	{
		zpgjz=cf.GB2Uni(zpgjz);
		if (!(zpgjz.equals("")))	wheresql+=" and  (kp_xjgdjlzp.zpgjz='"+zpgjz+"')";
	}
	zpsm=request.getParameter("zpsm");
	if (zpsm!=null)
	{
		zpsm=cf.GB2Uni(zpsm);
		if (!(zpsm.equals("")))	wheresql+=" and  (kp_xjgdjlzp.zpsm='"+zpsm+"')";
	}
	kkzpbz=request.getParameter("kkzpbz");
	if (kkzpbz!=null)
	{
		kkzpbz=kkzpbz.trim();
		if (!(kkzpbz.equals("")))	wheresql+=" and (kp_xjgdjlzp.kkzpbz="+kkzpbz+") ";
	}
	khly=request.getParameter("khly");
	if (khly!=null)
	{
		khly=cf.GB2Uni(khly);
		if (!(khly.equals("")))	wheresql+=" and  (kp_xjgdjlzp.khly='"+khly+"')";
	}
	khlysj=request.getParameter("khlysj");
	if (khlysj!=null)
	{
		khlysj=khlysj.trim();
		if (!(khlysj.equals("")))	wheresql+="  and (kp_xjgdjlzp.khlysj>=TO_DATE('"+khlysj+"','YYYY-MM-DD'))";
	}
	khlysj=request.getParameter("khlysj2");
	if (khlysj!=null)
	{
		khlysj=khlysj.trim();
		if (!(khlysj.equals("")))	wheresql+="  and (kp_xjgdjlzp.khlysj<=TO_DATE('"+khlysj+"','YYYY-MM-DD'))";
	}

	
	String zpshbz=null;
	zpshbz=request.getParameter("zpshbz");
	if (zpshbz!=null)
	{
		zpshbz=cf.GB2Uni(zpshbz);
		if (!(zpshbz.equals("")))	wheresql+=" and  (kp_xjgdjlzp.zpshbz='"+zpshbz+"')";
	}
	String shr=null;
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (kp_xjgdjlzp.shr='"+shr+"')";
	}
	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (kp_xjgdjlzp.shsj>=TO_DATE('"+shsj+"','YYYY-MM-DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (kp_xjgdjlzp.shsj<=TO_DATE('"+shsj+"','YYYY-MM-DD'))";
	}
	
	
	ls_sql="SELECT xjzpmc,'<A HREF=\"/sgdgl/xjgd/ViewImage.jsp?zhaopian=/yblimg/xjgd/'||kp_xjgdjlzp.zpml||'/'||xjzpmc||'\" target=\"_blank\"><img src=\"/yblimg/xjgd/'||kp_xjgdjlzp.zpml||'/'||xjzpmc||'\" width=\"100\"></A>', DECODE(kkzpbz,'0','不可看','1','可看'), DECODE(zpshbz,'Y','合格','B','不合格','N','未审核','C','不合格重拍'),kp_xjgdjlzp.xjjlh,kp_xjgdjl.lrsj, DECODE(kp_xjgdjlzp.lx,'1','整体照片','2','检查项目照片','3','整改项目照片','4','整改处理照片','5','整改验收照片'),zpgjz,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.zjxm,sgdmc,zpsm,khly,khlysj,crm_khxx.khbh ";
	ls_sql+=" FROM kp_xjgdjlzp,kp_xjgdjl,crm_khxx,sq_sgd  ";
	ls_sql+=" where kp_xjgdjlzp.xjjlh=kp_xjgdjl.xjjlh(+)  ";
	ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh(+)  ";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and (kp_xjgdjlzp.zpshbz='N' or kp_xjgdjlzp.zpshbz='C' or kp_xjgdjlzp.zpshbz is null) ";//Y：合格；B：不合格；C：不合格重拍；N：未审核
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by kp_xjgdjl.lrsj desc,kp_xjgdjlzp.xjjlh,kp_xjgdjlzp.xjzpmc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Kp_xjgdjlzpShList.jsp","","","EditKp_xjgdjlzp.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xjzpmc","xjjlh","yxjzpmc","lx","zpgjz","zpsm","kkzpbz","khly","khlysj","khbh","zpgjzbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xjzpmc"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");

//设置按钮参数
	String[] buttonName={"合格客户可看","合格客户不可看"};//按钮的显示名称
	String[] buttonLink={"SaveSetYszp.jsp?kkzpbz=1","SaveSetYszp.jsp?kkzpbz=0"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/sgdgl/xjgd/ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">照片审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="8%">照片名称</td>
	<td  width="8%">照片</td>
	<td  width="3%">客户可看照片标志</td>
	<td  width="3%">审核标志</td>
	<td  width="4%">检查记录号</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">照片类型</td>
	<td  width="6%">照片关键字</td>
	<td  width="3%">姓名</td>
	<td  width="8%">地址</td>
	<td  width="3%">监理</td>
	<td  width="3%">施工队</td>
	<td  width="10%">照片说明</td>
	<td  width="5%">客户留言</td>
	<td  width="3%">客户留言时间</td>
	<td  width="3%">客户编号</td>
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