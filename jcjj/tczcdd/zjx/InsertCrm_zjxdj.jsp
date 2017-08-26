<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body  style='FONT-SIZE: 14px'>


<%
String yhmc=(String)session.getAttribute("yhmc");
String lrdw=(String)session.getAttribute("dwbh");

String dqbm=null;
String fgsbh=null;
String kh_dwbh=null;
double kh_zjxje=0;
double kh_zhzjxje=0;

double kh_zqguanlif=0;
double kh_glfbfb=0;
double kh_guanlif=0;

double kh_zqzjxguanlif=0;
double kh_zjxguanlif=0;

double kh_suijin=0;
double kh_suijinbfb=0;
double kh_zjxsuijin=0;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;
String kh_sjsjsbz=null;
String kh_gdjsjd=null;
String jjwjbz=null;
String kh_zjxxh=null;
String kh_zjxm=null;
String kh_qyrq=null;

double kh_wdzgce=0;
double kh_qye=0;
String kh_hth=null;
String kh_khxm=null;
String kh_lxfs=null;
String kh_sgd=null;
String kh_sgbz=null;
String kh_fwdz=null;
String kh_sjs=null;
String kh_jzbz=null;
String kh_zjxwcbz=null;
double zqgczjf=0;
double zhgczjf=0;
double zqsuijin=0;
double zqzjxsuijin=0;
String fjtcbz="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";


double djjbfb=0;
double rzfbfb=0;
double jxglfbfb=0;

double kh_zjxdjjje=0;
double kh_zjxrzf=0;
double kh_kglf=0;
double kh_kqtk=0;

 

String zjxxh=null;
int count=0;
try {
	conn=cf.getConnection();


	ls_sql="select count(*)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"' and sfwc='N'";//N：未完成；Y：已完成
	ls_sql+=" and lx in('3','4')";//1：工程增减项；2：工程增减项无明细；3：套餐退补货；4：套餐调换产品
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
		out.println("错误！有调换产品未完成，请到【维护】中修改");
		return;
	}

	ls_sql="select fjtcbz,fgsbh,dwbh,zjxje,zhzjxje,zqguanlif,guanlif,glfbfb,zqzjxguanlif,zjxguanlif  ,suijin,suijinbfb,zjxsuijin  ,kglf,kqtk";
	ls_sql+=" ,cxhdbm,cxhdbmxq,cxhdbmzh,sjsjsbz,gdjsjd,jjwjbz,zjxxh,zjxm,qyrq";
	ls_sql+=" ,wdzgce,qye,hth,khxm,lxfs,sgd,sgbz,fwdz,sjs,jzbz,zjxwcbz";
	ls_sql+=" ,zqgczjf,zhgczjf,zqsuijin,zqzjxsuijin";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");

		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		kh_dwbh=cf.fillNull(rs.getString("dwbh"));
		kh_zjxje=rs.getDouble("zjxje");
		kh_zhzjxje=rs.getDouble("zhzjxje");
		kh_zqguanlif=rs.getDouble("zqguanlif");
		kh_guanlif=rs.getDouble("guanlif");
		kh_glfbfb=rs.getDouble("glfbfb");
		kh_zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		kh_zjxguanlif=rs.getDouble("zjxguanlif");


		kh_suijin=rs.getDouble("suijin");
		kh_suijinbfb=rs.getDouble("suijinbfb");
		kh_zjxsuijin=rs.getDouble("zjxsuijin");

		kh_kglf=rs.getDouble("kglf");
		kh_kqtk=rs.getDouble("kqtk");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		kh_sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		kh_gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));//工程进度
		kh_zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kh_zjxm=cf.fillNull(rs.getString("zjxm"));
		kh_qyrq=cf.fillNull(rs.getDate("qyrq"));


		kh_wdzgce=rs.getDouble("wdzgce");
		kh_qye=rs.getDouble("qye");
		kh_hth=cf.fillNull(rs.getString("hth"));
		kh_khxm=cf.fillNull(rs.getString("khxm"));
		kh_lxfs=cf.fillNull(rs.getString("lxfs"));
		kh_sgd=cf.fillNull(rs.getString("sgd"));
		kh_sgbz=cf.fillNull(rs.getString("sgbz"));
		kh_fwdz=cf.fillNull(rs.getString("fwdz"));
		kh_sjs=cf.fillNull(rs.getString("sjs"));
		kh_jzbz=rs.getString("jzbz");
		kh_zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));

	}
	else{
		rs.close();
		ps.close();

		out.println("错误！客户不存在");
		return;
	}
	rs.close();
	ps.close();

	if (!fjtcbz.equals("Y"))
	{
		out.println("错误！未分解订单");
		return;
	}

	if (jjwjbz.equals("Y"))//家居完结标志 N：未完结；Y：完结
	{
		out.println("错误！家居已完结，不能再修改");
		return;
	}
	if (kh_sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		out.println("错误！设计师已结算，不能再修改");
		return;
	}
	if (kh_gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！施工队已结算，不能再修改");
		return;
	}



	ls_sql="select dqbm,jxglfbfb";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		jxglfbfb=rs.getDouble("jxglfbfb");//减项扣管理费百分比
	}
	rs.close();
	ps.close();

	//客户折扣
	String zklx="";//折扣类型  1：整单打折；2：单项打折；3：部分费用打折
	double zdzk=10;//整单折扣
	double gcfqdzk=10;//工程费签单折扣
	double glfzk=10;//管理费折扣
	double sjzk=10;//税金折扣
	double sjfzk=10;//设计费折扣
	double qtsfxmzk=10;//其它收费项目折扣
	String zjxzklx="";//调换产品折扣 1：同合同；2：独立折扣

	double bzjgzk=10;
	double mjzjzk=10;
	double zcsjzk=10;
	double zcclzk=10;
	double zcsfzk=10;
	double zcjmzk=10;
	double ddzccjzk=10;
	double ddzcclzk=10;
	double tcwgczk=10;
	double tcgcclzk=10;

	ls_sql="select zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk,zjxzklx";
	ls_sql+=" ,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
	ls_sql+=" from crm_khzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));

		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");
	}
	rs.close();
	ps.close();


	//客户调换产品折扣
	double gczjxfzk=10;
	double glfzjxzk=10;
	double sjzjxzk=10;
	double sjfzjxzk=10;
	double qtsfxmzjxzk=10;
	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
	ls_sql+=" from crm_khzjxzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
		qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
	}
	rs.close();
	ps.close();
		
 
	ls_sql="select rzfbfb,zjxdjjje,zjxrzf";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rzfbfb=rs.getDouble("rzfbfb");//认证费百分比
		kh_zjxdjjje=rs.getDouble("zjxdjjje");//调换产品代金券
		kh_zjxrzf=rs.getDouble("zjxrzf");//调换产品认证费
	}
	rs.close();
	ps.close();

	ls_sql="select khfqbfb";
	ls_sql+=" from  crm_khdjj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjbfb=rs.getDouble("khfqbfb");//代金券百分比
	}
	rs.close();
	ps.close();


	//检查是否允许使用有明细增建项++++++++++++++++
/*
	double getZqgczjf=0;
	//获取电子报价金额
	if (kh_zjxxh.equals(""))
	{
		dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
		getZqgczjf=dzbjje.getZqGczjf(conn,khbh,"yz");//工程直接费－折前
	}
	else{
		//初始化
		dzbj.Zjx zjx=new dzbj.Zjx();
		getZqgczjf=zjx.getZjxHZqGczjf(conn,khbh,kh_zjxxh,"yz");
	}

	if ( (int)(zqgczjf+kh_zjxje)!=(int)getZqgczjf )
	{
		out.println("<font color='#FF0033' SIZE=4px><strong>提醒！【工程直接费＋工程费调换产品＝"+cf.formatDouble(zqgczjf+kh_zjxje)+"】不等于【电子报价工程费:"+cf.formatDouble(getZqgczjf)+"】<BR>请录入(无明细)增建项</strong></font>");
		return;
	}
*/
	//检查是否允许使用有明细增建项++++++++++++++++


	//调换产品序号
	ls_sql="select NVL(max(substr(zjxxh,8,2)),0)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	zjxxh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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


<form method="post" action="" name="insertform" target="_blank">

<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">增减序号</td>
	<td  width="9%">发生阶段</td>
	<td  width="11%">工程增减-折前</td>
	<td  width="11%">工程增减-折后</td>
	<td  width="10%">税金</td>
	<td  width="10%">管理费-折前</td>
	<td  width="10%">管理费-折后</td>
	<td  width="10%">扣管理费</td>
	<td  width="10%">扣其它款</td>
	<td  width="11%">发生时间</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT  crm_zjxdj.zjxxh,zjxfsjdmc,crm_zjxdj.zjje,crm_zjxdj.jzjje,crm_zjxdj.zjxsuijin,crm_zjxdj.zqguanlif,crm_zjxdj.zhguanlif,crm_zjxdj.kglf,crm_zjxdj.kqtk,fssj";
	ls_sql+=" FROM crm_zjxdj,dm_zjxfsjd  ";
    ls_sql+=" where crm_zjxdj.zjxfsjd=dm_zjxfsjd.zjxfsjd(+)";
    ls_sql+=" and crm_zjxdj.khbh='"+khbh+"'";
	ls_sql+=" and lx in('3','4')";//1：工程增减项；2：工程增减项无明细；3：套餐退补货；4：套餐调换产品
    ls_sql+=" order by crm_zjxdj.zjxxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

	%>
	</table>
	<%
}
%> 


      <div align="center">请录入调换产品信息<b>(调换产品序号：<%=zjxxh%>)</b></div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
              <font color="#0000FF">合同号</font>              </td>
              <td width="30%"> <%=kh_hth%> </td>
              <td width="21%" align="right"> 
              <font color="#0000CC">客户姓名</font>              </td>
              <td width="29%"> <%=kh_khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
              <font color="#0000CC">房屋地址</font>              </td>
              <td width="30%"><%=kh_fwdz%> </td>
              <td width="21%" align="right"> 
              <font color="#0000CC">质检</font>              </td>
              <td width="29%"><%=kh_zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kh_dwbh+"'",kh_dwbh,false);
%></td>
              <td width="21%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="29%"><%=kh_sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
              <font color="#0000FF">施工队</font>              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+kh_sgd+"'",kh_sgd,false);
%> </td>
              <td width="21%" align="right"> 
              <font color="#0000CC">施工班组</font>              </td>
              <td width="29%"> <%=kh_sgbz%> </td>
            </tr>
            
            
            <tr bgcolor="#FFFFFF">
              <td align="right">折扣类型</td>
              <td>&nbsp;</td>
              <td align="right">调换产品折扣</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">参加定金促销</font></td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">折扣赠品</font></td>
              <td colspan="3"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">特殊申请</font></td>
              <td colspan="3"><%=cxhdbmzh%></td>
            </tr>
  </table>
    <BR>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center">
            <td colspan="8" bgcolor="#FFFFCC"><b><font color="#3333FF" size="4">注意：一定要点击<font color="#FF3333">『完成』</font>按钮</font></b></td>
          </tr>
            
            <tr bgcolor="#FFFFFF">
              <td colspan="8" align="center" bgcolor="#E8E8FF"><font color="#0000CC">
					累计减项扣管理费：<%=kh_kglf%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					累计调换产品认证费：<%=kh_zjxrzf%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					累计调换产品代金券：<%=kh_zjxdjjje%>
					&nbsp;&nbsp;&nbsp;&nbsp;
					累计减项扣其它款：<%=kh_kqtk%>
					</font>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>工程费</strong></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>管理费</strong></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>税金</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同工程费-折前</font></td>
              <td width="18%" bgcolor="#FFFFFF"><%=zqgczjf%></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同管理费-折前</font></td>
              <td bgcolor="#FFFFFF"><%=kh_zqguanlif%></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同税金-折前</font></td>
              <td bgcolor="#FFFFFF"><%=zqsuijin%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同工程费-折后</font></td>
              <td bgcolor="#FFFFFF"><%=zhgczjf%></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同管理费-折后</font></td>
              <td bgcolor="#FFFFFF"><%=kh_guanlif%></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同税金-折后</font></td>
              <td bgcolor="#FFFFFF"><%=kh_suijin%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">工程调换产品-折前</font></td>
              <td bgcolor="#FFFFFF"><%=kh_zjxje%></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">增减管理费-折前</font></td>
              <td bgcolor="#FFFFFF"><%=kh_zqzjxguanlif%></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">调换产品税金-折前</font></td>
              <td bgcolor="#FFFFFF"><%=zqzjxsuijin%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">工程调换产品-折后</font></td>
              <td bgcolor="#FFFFFF"><%=kh_zhzjxje%></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">增减管理费-折后</font></td>
              <td bgcolor="#FFFFFF"><%=kh_zjxguanlif%></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000CC">调换产品税金-折后</font></td>
              <td bgcolor="#FFFFFF"><%=kh_zjxsuijin%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td colspan="2" align="center">&nbsp;</td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center">&nbsp;</td>
          </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="2" align="center"><p><font color="#CC0066"><strong>增项为正，减项为负</strong></font></p></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td width="15%" align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">管理费百分比</font></strong></td>
              <td width="18%" bgcolor="#E8E8FF"><strong><%=kh_glfbfb%>%</strong></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td width="15%" align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">税金百分比</font></strong></td>
              <td width="17%" bgcolor="#E8E8FF"><strong><font color="#0000CC"><%=kh_suijinbfb%>%</font></strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">工程费-折前</font></td>
              <td bgcolor="#FFFFFF"><font color="#CC0066"><strong>
                <input name="zjje" type="text" readonly value="0" size="10" maxlength="17">
              </strong></font></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">管理费-折前</font></td>
              <td><input name="zqguanlif" type="text" value="0" size="10" maxlength="17"  readonly></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">税金-折前</font></td>
              <td bgcolor="#FFFFFF"><input name="zqzjxsuijin" type="text" value="0" size="10" maxlength="17" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>工程费减免额</td>
              <td bgcolor="#FFFFFF"><input type="text" name="zjxjme" size="10" maxlength="17" value="0" ></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right"><font color="#FF0000">*</font>管理费减免额</td>
              <td><input type="text" name="glfjmje" size="10" maxlength="17" value="0" ></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>税金减免额</td>
              <td bgcolor="#FFFFFF"><input type="text" name="sjjmje" size="10" maxlength="17" value="0" ></td>
            </tr>




            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">工程费-折后</font></td>
              <td bgcolor="#FFFFFF"><input name="jzjje" type="text" value="0" size="10" maxlength="17" readonly></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">管理费-折后</font></td>
              <td bgcolor="#FFFFFF"><input name="zhguanlif" type="text" value="0" size="10" maxlength="17" readonly></td>
              <td width="1%" align="center" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">税金-折后</font></td>
              <td bgcolor="#FFFFFF"><input name="zjxsuijin" type="text" value="0" size="10" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="2" align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td colspan="5" align="center" bgcolor="#FFFFCC"><strong>相关款项</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>扣其它款</td>
              <td bgcolor="#FFFFFF"><input type="text" name="kqtk" value="0" size="10" maxlength="17" >
                <font color="#CC0066"><strong>为正</strong></font></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#E8E8FF"><strong><font color="#CC0066">减项扣管理费</font></strong></td>
              <td bgcolor="#E8E8FF"><strong><%=jxglfbfb%>%</strong></td>
              <td width="1%" align="center" bgcolor="#E8E8FF">&nbsp;</td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">减项扣管理费</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="kglf" value="0" size="13" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">增减总额－折前</font></td>
              <td bgcolor="#FFFFFF"><font color="#CC0066"><strong>
                <input name="zqzjze" type="text" readonly value="0" size="10" maxlength="17">
              </strong></font></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#E8E8FF"><strong><font color="#CC0066">认证费百分比</font></strong></td>
              <td bgcolor="#E8E8FF"><strong><%=rzfbfb%>%</strong></td>
              <td width="1%" align="center" bgcolor="#E8E8FF">&nbsp;</td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">调换产品认证费</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="zjxrzf" value="0" size="13" maxlength="17" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">增减总额－折后</font></td>
              <td bgcolor="#FFFFFF"><font color="#CC0066"><strong>
                <input name="zhzjze" type="text" readonly value="0" size="10" maxlength="17">
              </strong></font></td>
              <td width="1%" align="right" bgcolor="#000033">&nbsp;</td>
              <td align="right" bgcolor="#E8E8FF"><strong><font color="#CC0066">代金券百分比</font></strong></td>
              <td bgcolor="#E8E8FF"><strong><%=djjbfb%>%</strong></td>
              <td width="1%" align="center" bgcolor="#E8E8FF">&nbsp;</td>
              <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font><font color="#0000CC">调换产品代金券</font></td>
              <td bgcolor="#E8E8FF"><input type="text" name="zjxdjjje" value="0" size="13" maxlength="17" readonly></td>
            </tr>
  </table>
  <BR>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
                              <tr bgcolor="#FFFFFF">
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">记入业绩其它费－折前</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="zqqtsf" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">记入业绩其它费－折后</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="zhqtsf" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                              </tr>
                              <tr bgcolor="#FFFFFF">
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">不记业绩其它费－折前</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="zqwjrqyexm" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">不记业绩其它费－折后</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="zhwjrqyexm" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                              </tr>
                              <tr bgcolor="#FFFFFF">
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">设计费－折前</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="zqsjf" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">设计费－折后</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="zhsjf" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                              </tr>
                              <tr bgcolor="#FFFFFF">
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">工程增项－折前</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="gczxzq" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">工程增项－折后</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="gczxzh" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                              </tr>
                              <tr bgcolor="#FFFFFF">
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">工程减项－折前</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="gcjxzq" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                                <td align="right"><font color="#FF0000">*</font><font color="#0000CC">工程减项－折后</font></td>
                                <td><font color="#CC0066"><strong>
                                  <input name="gcjxzh" type="text" readonly value="0" size="10" maxlength="17">
                                </strong></font></td>
                              </tr>
                              
                            <tr bgcolor="#FFFFFF">
                              <td align="right">调换产品发生阶段</td>
                              <td width="31%"><select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                                <option value=""></option>
                                <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%>
                              </select></td>
                              <td width="19%" rowspan="4" align="right"><font color="#FF0000">*</font>调换产品原因</td>
                              <td width="31%" rowspan="4"><select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:162PX" size="8" multiple>
                                <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%>
                              </select></td>
                            </tr>
                        
                    <tr bgcolor="#FFFFFF">
                      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>调换产品发生时间</td>
                      <td><input type="text" name="fssj" value="<%=cf.today()%>" size="21" maxlength="10" onDblClick="JSCalendar(this)"></td>
                    </tr>
                    

                    <tr bgcolor="#FFFFFF">
                      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
                      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly></td>
                    </tr>
                    <tr bgcolor="#FFFFFF">
                      <td align="right"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
                      <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
                    </tr>
                
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">调换产品说明</td>
              <td colspan="3"><textarea name="zjxyysm" cols="74" rows="3"></textarea></td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="lrdw" value="<%=lrdw%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" readonly>
                <input type="button"  value="保存" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="增加房间" onClick="f_lrfj(insertform)" name="zjfj" disabled>
                <input type="button"  value="修改房间" onClick="f_xgfj(insertform)" name="xgfj" disabled>
                <input type="button"  value="完成调换产品" onClick="f_wc(insertform)" name="wc" disabled>
                <input type="button"  value="删除－完成" onClick="f_scwc(insertform)" name="scwc" disabled>
                <input type="reset"  value="重输">
                <P> 
                  <input type="button"  value="选择报价项目" onClick="f_xzxm(insertform)" name="lr" disabled>
                  <input type="button"  value="调项目顺序" onClick="f_xmpx(insertform)" name="xmpx" disabled>
                  <input type="button"  value="选其它收费" onClick="f_ewlr(insertform)" name="ewlr" disabled>
                  <input type="button"  value="修改其它收费" onClick="f_ewck(insertform)" name="xgsf" disabled>
                  <input type="button"  value="查看变更信息" onClick="f_bgmx(insertform)" name="bgmx" disabled>
              </td>
            </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请选择[调换产品序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("请输入[调换产品发生时间]！");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "调换产品发生时间"))) {
		return false;
	}
	if(	!selectChecked(FormName.zjxyybm)) {
		alert("请输入[调换产品原因]！");
		FormName.zjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("请选择[增减合计-折前]！");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "增减合计-折前"))) {
		return false;
	}
	if(	javaTrim(FormName.gczxzq)=="") {
		alert("请选择[工程增项－折前]！");
		FormName.gczxzq.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzq, "工程增项－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxzq)=="") {
		alert("请选择[工程减项－折前]！");
		FormName.gcjxzq.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzq, "工程减项－折前"))) {
		return false;
	}

	if(	javaTrim(FormName.gczxzh)=="") {
		alert("请选择[工程增项－折后]！");
		FormName.gczxzh.focus();
		return false;
	}
	if(!(isFloat(FormName.gczxzh, "工程增项－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.gcjxzh)=="") {
		alert("请选择[工程减项－折后]！");
		FormName.gcjxzh.focus();
		return false;
	}
	if(!(isFloat(FormName.gcjxzh, "工程减项－折后"))) {
		return false;
	}
	if(	javaTrim(FormName.jzjje)=="") {
		alert("请选择[增减合计-折后]！");
		FormName.jzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jzjje, "增减合计-折后"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxjme)=="") {
		alert("请输入[工程费减免额]！");
		FormName.zjxjme.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxjme, "工程费减免额"))) {
		return false;
	}
	if (FormName.zjxjme.value<0 || FormName.zjxjme.value>100)
	{
		alert("错误！[工程费减免额]应该在0和100之间！");
		FormName.zjxjme.select();
		return false;
	}


	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请选择[管理费-折前]！");
		FormName.zqguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "管理费-折前"))) {
		return false;
	}

	if(	javaTrim(FormName.zhguanlif)=="") {
		alert("请选择[管理费-折后]！");
		FormName.zhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.zhguanlif, "管理费-折后"))) {
		return false;
	}
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("请输入[管理费减免额]！");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "管理费减免额"))) {
		return false;
	}
	if (FormName.glfjmje.value<0 || FormName.glfjmje.value>100)
	{
		alert("错误！[管理费减免额]应该在0和100之间！");
		FormName.glfjmje.select();
		return false;
	}

	if(	javaTrim(FormName.zqzjxsuijin)=="") {
		alert("请选择[税金-折前]！");
		FormName.zqzjxsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.zqzjxsuijin, "税金-折前"))) {
		return false;
	}


	if(	javaTrim(FormName.zjxsuijin)=="") {
		alert("请选择[税金-折后]！");
		FormName.zjxsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsuijin, "税金-折后"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("请输入[税金减免额]！");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "税金减免额"))) {
		return false;
	}
	if (FormName.sjjmje.value<0 || FormName.sjjmje.value>100)
	{
		alert("错误！[税金减免额]应该在0和100之间！");
		FormName.sjjmje.select();
		return false;
	}



	if(	javaTrim(FormName.zqqtsf)=="") {
		alert("请选择[记入业绩其它费－折前]！");
		FormName.zqqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqqtsf, "记入业绩其它费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhqtsf)=="") {
		alert("请选择[记入业绩其它费－折后]！");
		FormName.zhqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.zhqtsf, "记入业绩其它费－折后"))) {
		return false;
	}


	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("请选择[不记业绩其它费－折前]！");
		FormName.zqwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "不记业绩其它费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("请选择[不记业绩其它费－折后]！");
		FormName.zhwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "不记业绩其它费－折后"))) {
		return false;
	}



	if(	javaTrim(FormName.zqsjf)=="") {
		alert("请选择[设计费－折前]！");
		FormName.zqsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqsjf, "设计费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhsjf)=="") {
		alert("请选择[设计费－折后]！");
		FormName.zhsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.zhsjf, "设计费－折后"))) {
		return false;
	}
	
	
	if(	javaTrim(FormName.kglf)=="") {
		alert("请选择[减项扣管理费]！");
		FormName.kglf.focus();
		return false;
	}
	if(!(isFloat(FormName.kglf, "减项扣管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxrzf)=="") {
		alert("请选择[调换产品认证费]！");
		FormName.zjxrzf.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxrzf, "调换产品认证费"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxdjjje)=="") {
		alert("请选择[调换产品代金券]！");
		FormName.zjxdjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxdjjje, "调换产品代金券"))) {
		return false;
	}

	if(	javaTrim(FormName.kqtk)=="") 
	{
		alert("请选择[扣其它款]！");
		FormName.kqtk.focus();
		return false;
	}

	if(!(isFloat(FormName.kqtk, "扣其它款"))) 
	{
		return false;
	}

	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	

	
	FormName.action="SaveInsertCrm_zjxdj.jsp";
	FormName.submit();
	FormName.zjfj.disabled=false;
	FormName.xgfj.disabled=false;
	FormName.lr.disabled=false;
	FormName.xmpx.disabled=false;
	FormName.ewlr.disabled=false;
	FormName.xgsf.disabled=false;
	FormName.wc.disabled=false;
	FormName.scwc.disabled=false;
	FormName.bgmx.disabled=false;

	return true;
}

function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="endZjx.jsp";

	FormName.submit();
	return true;
}
function f_scwc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="deleteEndZjx.jsp";

	FormName.submit();
	return true;
}


function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}
function f_xzxm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}

	FormName.submit();
	return true;
}
function f_dybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_ewck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	FormName.submit();
	return true;
}

function f_xmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		winOpen("dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
}

function f_bgmx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	window.open("ViewCrm_zjxdj.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>");
}

//-->
</SCRIPT>
