<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String ls=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
double qye=0;
double wdzgce=0;
double sjf=0;
java.sql.Date qyrq=null;
String dwbh=null;
java.sql.Date lrsj=null;
String khlxbm=null;
String lrr=null;
String bz=null;


khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));

sjs=cf.GB2Uni(request.getParameter("sjs"));
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[未打折工程额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjf");
try{
	if (!(ls.equals("")))  sjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qyrq");
try{
	if (!(ls.equals("")))  qyrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qyrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[签约日期]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上报日期]类型转换发生意外:"+e);
	return;
}
khlxbm=cf.GB2Uni(request.getParameter("khlxbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
bz=cf.GB2Uni(request.getParameter("bz"));



String khjl=cf.GB2Uni(request.getParameter("khjl"));
String ywy=cf.GB2Uni(request.getParameter("ywy"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String jiedao=cf.GB2Uni(request.getParameter("jiedao"));

//折扣率
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折扣率]类型转换发生意外:"+e);
	return;
}

String sfzhm=cf.GB2Uni(request.getParameter("sfzhm"));
String zt=cf.GB2Uni(request.getParameter("zt"));
String cqbm=cf.GB2Uni(request.getParameter("cqbm"));
String xqbm=cf.GB2Uni(request.getParameter("xqbm"));
String louhao=cf.GB2Uni(request.getParameter("louhao"));
String qtdh=cf.GB2Uni(request.getParameter("qtdh"));
String email=cf.GB2Uni(request.getParameter("email"));
String hth=cf.GB2Uni(request.getParameter("hth"));
String smhtbh=cf.GB2Uni(request.getParameter("smhtbh"));
String ywyssxz=request.getParameter("ywyssxz");
String sjsbh=request.getParameter("sjsbh");

String ysy=request.getParameter("ysy");

String hdsfss=null;

String czkbz="0";

String khbh=cf.GB2Uni(request.getParameter("khbh"));

if (khxm.indexOf("先生")>0 || khxm.indexOf("小姐")>0 || khxm.indexOf("女士")>0 || khxm.indexOf("阿姨")>0 || khxm.indexOf("叔叔")>0)
{
	out.println("<BR>错误！[姓名]请输入全称，如：张先生、张小姐、张女士等都不规范");
	return;
}

if (cf.isHanzi(khxm)!=2 && cf.isHanzi(khxm)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[姓名]，中间不允许包含空格");
	return;
}
if (cf.isHanzi(fwdz)!=2 && cf.isHanzi(fwdz)!=4)//0:非汉字无空格；1:非汉字有空格；2：全汉字无空格；3：全汉字有空格；4：包含汉字无空格；5：包含汉字有空格
{
	out.println("<BR>错误，存盘失败！请输入正确的[房屋地址]，中间不允许包含空格");
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	double lsi=0;

	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where fwdz='"+fwdz+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR>错误！此房屋地址已存在");
		return;
	}

	//客户类型
	String mqzt=null;
	String mqxmzy=null;
	ls_sql="select zt,xmzy";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mqzt=rs.getString("zt");//2：家装客户；3：退单客户；4：非家装客户；5：设计客户
		mqxmzy=rs.getString("xmzy");
	}
	rs.close();
	ps.close();


	//合同号检查
	int hthsfcz=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  hth='"+hth+"' and khbh!='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hthsfcz=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (hthsfcz>0)
	{
		out.println("<BR>错误！合同号已被其它客户使用");
		return;
	}

	String sybz="";
	String sykhbh="";
	ls_sql="select sybz,khbh";
	ls_sql+=" from  crm_hthxx";
	ls_sql+=" where  hth='"+hth+"' and dwbh='"+dwbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sybz=cf.fillNull(rs.getString("sybz"));
		sykhbh=cf.fillNull(rs.getString("khbh"));
	}
	else{
		out.println("<BR>错误！不存在合同号，请首先在系统中申请合同号");
		return;
	}
	rs.close();
	ps.close();

	if (sybz.equals("Y"))
	{
		out.println("<BR>错误！合同号已被客户["+sykhbh+"]使用");
		return;
	}

/*
	if (!hth.substring(3,7).equals(qyrq.toString().substring(2,4)+qyrq.toString().substring(5,7)))
	{
		out.println("<BR>错误！非当月合同号："+hth);
		return;
	}
*/
	conn.setAutoCommit(false);

	if (mqzt!=null)
	{
		if (mqzt.equals("4"))//集成转家装客户
		{
			ls_sql="delete from  crm_khxx ";
			ls_sql+=" where  khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
	}

	ls_sql="update crm_zxkhxx set zxzt='3',khxm=?,xb=?,fwdz=?,lxfs=?,qtdh=?,email=?,cqbm=?,xqbm=?,louhao=?,qdsj=?,hth=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khxm);
	ps.setString(2,xb);
	ps.setString(3,fwdz);
	ps.setString(4,lxfs);
	ps.setString(5,qtdh);
	ps.setString(6,email);
	ps.setString(7,cqbm);
	ps.setString(8,xqbm);
	ps.setString(9,louhao);
	ps.setDate(10,qyrq);
	ps.setString(11,hth);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into crm_khxx ( khbh,khxm,xb,fwdz,lxfs,sfzhm,zkl,wdzgce,qye,sjf   ,qyrq,sjs,ywy,sjsbh,dwbh,fgsbh,khlxbm,jzbz,zt,lrr";
	ls_sql+=" ,lrsj,bz,cqbm,xqbm,louhao,qtdh,email,hth,smhtbh,khjl,jiedao,ywyssxz,ysy";

	ls_sql+=" ,zjxwcbz,sffj,sfyrz,pdclzt,gcjdbm,dalqbz,gdjsjd,sjsjsbz   ,ywyjsbz,sfxhf,ybjbz,hdbz,tsbz,bxbz,kpbz,hfdjbz,htshbz,khjsbz,zjjsbz,sjssjfjsbz,jjwjbz,cdzwjmje,glfjmje,sjjmje,xmjfzt,zqsuijin,zqzjxsuijin,fjtcbz)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?";
	ls_sql+=" ,?,?,?,?,?,?,?,?,?,?,?,?,?";

	ls_sql+=" ,'2','N','N','1','1','1','0','0'   ,'0','N','N','1','N','N','N','0','N','N','0','0','N',0,0,0,'N',0,0,'N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,fwdz);
	ps.setString(5,lxfs);
	ps.setString(6,sfzhm);
	ps.setDouble(7,zkl);
	ps.setDouble(8,wdzgce);
	ps.setDouble(9,qye);
	ps.setDouble(10,sjf);

	ps.setDate(11,qyrq);
	ps.setString(12,sjs);
	ps.setString(13,ywy);
	ps.setString(14,sjsbh);
	ps.setString(15,dwbh);
	ps.setString(16,fgsbh);
	ps.setString(17,khlxbm);
	ps.setString(18,jzbz);
	ps.setString(19,zt);
	ps.setString(20,lrr);

	ps.setDate(21,lrsj);
	ps.setString(22,bz);
	ps.setString(23,cqbm);
	ps.setString(24,xqbm);
	ps.setString(25,louhao);
	ps.setString(26,qtdh);
	ps.setString(27,email);
	ps.setString(28,hth);
	ps.setString(29,smhtbh);
	ps.setString(30,khjl);
	ps.setString(31,jiedao);
	ps.setString(32,ywyssxz);
	ps.setString(33,ysy);
	ps.executeUpdate();
	ps.close();


	//客户工料分析表（bj_khglfxb）
	ls_sql=" delete from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	//删除临时报价＋＋＋＋＋＋＋＋＋＋＋＋开始

	//临时报价--项目明细
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工料分析表
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--房间信息
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工程量明细
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--主材用量
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--其它收费项目明细
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//删除临时报价========================完成


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
