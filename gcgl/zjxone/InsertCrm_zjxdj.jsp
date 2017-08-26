<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


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

double kh_kglf=0;
double kh_kqtk=0;

String cxhdbmxq=null;
String cxhdbmzh=null;
String cxhdbm=null;
String kh_sjsjsbz=null;
String kh_gdjsjd=null;
String kh_gcjdbm=null;
String kh_zjxxh=null;
String kh_zjxm=null;
String kh_qyrq=null;

double kh_wdzgce=0;
double kh_qye=0;
double kh_zkl=0;
double kh_zjxzkl=0;
String kh_hth=null;
String kh_khxm=null;
String kh_lxfs=null;
String kh_sgd=null;
String kh_sgbz=null;
String kh_fwdz=null;
String kh_sjs=null;
String kh_jzbz=null;
String kh_zjxwcbz=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

double zjxzkl=10;
double cxhdzjxzkl=10;
double glfzkl=10;
double cxhdglfzkl=10;

String zklx=null;



String zjxxh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,zjxje,zhzjxje,zqguanlif,guanlif,glfbfb,zqzjxguanlif,zjxguanlif  ,suijin,suijinbfb,zjxsuijin  ,kglf,kqtk";
	ls_sql+=" ,cxhdbm,cxhdbmxq,cxhdbmzh,sjsjsbz,gdjsjd,gcjdbm,zjxxh,zjxm,qyrq";
	ls_sql+=" ,wdzgce,qye,zkl,zjxzkl,hth,khxm,lxfs,sgd,sgbz,fwdz,sjs,jzbz,zjxwcbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
		kh_gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		kh_zjxxh=cf.fillNull(rs.getString("zjxxh"));
		kh_zjxm=cf.fillNull(rs.getString("zjxm"));
		kh_qyrq=cf.fillNull(rs.getDate("qyrq"));


		kh_wdzgce=rs.getDouble("wdzgce");
		kh_qye=rs.getDouble("qye");
		kh_zkl=rs.getDouble("zkl");
		kh_zjxzkl=rs.getDouble("zjxzkl");
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


	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+kh_zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=cf.fillNull(rs.getString("sfwc"));
	}
	rs.close();
	ps.close();

	if (sfwc.equals("N"))//N：未完成；Y：已完成
	{
		out.println("<font color='#FF0033' SIZE=2px><strong>错误！增减项["+kh_zjxxh+"]录入未完成，请在修改中完成</strong></font>");
		return;
	}

	if (kh_gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再修改");
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

	if (kh_zjxwcbz.equals("2"))
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("错误！[增减项]已完成，不能再[录入增减项]，请到【维护】中去修改");
		window.location="EditCrm_zjxdj.jsp?zjxxh=<%=kh_zjxxh%>";
		//-->
		</SCRIPT>
		<%
		return;
	}

	//检查是否允许使用有明细增建项++++++++++++++++
	double dzbj=0;
	//初始化
	dzbj.Dzbj getdzbj=new dzbj.Dzbj();
	//获取电子报价金额
	if (kh_zjxxh.equals(""))
	{
		dzbj=getdzbj.getBjje(conn,khbh,"hmy");
	}
	else{
		dzbj=getdzbj.getZjxHBjje(conn,khbh,kh_zjxxh,"hmy");
	}

	if ( (int)(kh_wdzgce+kh_zjxje)!=(int)dzbj )
	{
		out.println("<font color='#FF0033' SIZE=2px><strong>提醒！【工程原报价＋累计增减项＝"+cf.formatDouble(kh_wdzgce+kh_zjxje)+"】不等于【电子报价总额:"+cf.formatDouble(dzbj)+"】<BR>请录入(无明细)增建项</strong></font>");
		return;
	}
	//检查是否允许使用有明细增建项++++++++++++++++
	

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//折扣类型  1：全额折扣；2：单项折扣
	ls_sql="select zklx ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();

	ls_sql="select glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdglfzkl=rs.getDouble("glfzk");//管理费活动折扣
		cxhdzjxzkl=rs.getDouble("zjxhdzk");//增减项折扣
	}
	rs.close();
	ps.close();



	if (zklx.equals("1"))//1：全额折扣；2：单项折扣
	{
		zjxzkl=kh_zjxzkl;//工程折扣
		glfzkl=kh_zjxzkl;//管理费折扣
	}
	else if (zklx.equals("2"))//1：全额折扣；2：单项折扣
	{
		zjxzkl=kh_zjxzkl;//工程折扣

		ls_sql="SELECT dxzkl";
		ls_sql+=" FROM bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' and sflx='5'";//1：直接费百分比；2：固定金额(可改)；3：税金(百分比)；4：固定金额(不可改)；5：管理费(百分比)
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glfzkl=rs.getDouble("dxzkl");//管理费折扣
		}
		rs.close();
		ps.close();
	}
	else{
		zjxzkl=10;//工程折扣
		glfzkl=10;//管理费折扣
	}


	//增减项序号
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


<body bgcolor="#000033" style='FONT-SIZE: 14px'>
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
	coluParm.link="/gcgl/zjx/ViewCrm_zjxdj.jsp";//为列参数：coluParm.link设置超级链接
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


      <div align="center"><font color="#FFFFCC">请录入增减项信息<b>(增减项序号：<%=zjxxh%>)</b></font></div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
              <div align="right"><font color="#0000FF">合同号</font></div>              </td>
              <td width="31%"> <%=kh_hth%> </td>
              <td width="21%"> 
              <div align="right"><font color="#0000CC">客户姓名</font></div>              </td>
              <td width="29%"> <%=kh_khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
              <div align="right"><font color="#0000CC">房屋地址</font></div>              </td>
              <td width="31%"><%=kh_fwdz%> </td>
              <td width="21%"> 
              <div align="right"><font color="#0000CC">工程担当</font></div>              </td>
              <td width="29%"><%=kh_zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+kh_dwbh+"'",kh_dwbh,false);
%></td>
              <td width="21%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="29%"><%=kh_sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
              <div align="right"><font color="#0000FF">施工队</font></div>              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+kh_sgd+"'",kh_sgd,false);
%> </td>
              <td width="21%"> 
              <div align="right"><font color="#0000CC">施工班组</font></div>              </td>
              <td width="29%"> <%=kh_sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">工程原报价</font></td>
              <td width="31%"><%=kh_wdzgce%></td>
              <td align="right" width="21%"><font color="#0000CC">工程签约额</font></td>
              <td width="29%"><%=kh_qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">工程增减项-折前</font></td>
              <td width="31%"><%=kh_zjxje%></td>
              <td align="right" width="21%"><font color="#0000CC">工程增减项-折后</font></td>
              <td width="29%"><%=kh_zhzjxje%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">合同税金</font></td>
              <td width="31%" height="2"><%=kh_suijin%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">增减项税金</font></td>
              <td width="29%" height="2"><%=kh_zjxsuijin%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">合同管理费-折前</font></td>
              <td width="31%" height="2"><%=kh_zqguanlif%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">合同管理费-折后</font></td>
              <td width="29%" height="2"><%=kh_guanlif%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%" height="2"><font color="#0000CC">增减管理费-折前</font></td>
              <td width="31%" height="2"><%=kh_zqzjxguanlif%></td>
              <td align="right" width="21%" height="2"><font color="#0000CC">增减管理费-折后</font></td>
              <td width="29%" height="2"><%=kh_zjxguanlif%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">累计减项管理费</font></td>
              <td width="31%"><%=kh_kglf%></td>
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">累计减项扣其它款</font></td>
              <td width="29%"><%=kh_kqtk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">折扣类型</font></td>
              <td width="31%"> <%
	cf.radioToken(out,"0+无折扣&1+全额折扣&2+单项折扣",zklx,true);
%> </td>
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">合同折扣</font></td>
              <td width="29%"><font color="#0000CC"><%=kh_zkl%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">参加公司促销活动</font></td>
              <td colspan="3"><%=cxhdbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">参加小区促销活动</font></td>
              <td colspan="3"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#0000CC">参加展会促销活动</font></td>
              <td colspan="3"><%=cxhdbmzh%></td>
            </tr>
  </table>
    <BR>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
 			<tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="8" bgcolor="#FFFFCC"><b><font color="#3333FF" size="4">注意：一定要点击<font color="#FF3333">『完成』</font>按钮，自动计算增减额</font></b></td>
            </tr>
        
            <tr bgcolor="#FFFFFF">
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>工程费</strong></td>
              <td width="1%" rowspan="7" align="right" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>管理费</strong></td>
              <td width="1%" rowspan="7" align="center" bgcolor="#000033">&nbsp;</td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>税金</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="2" align="center" bgcolor="#FFFFFF"><p><font color="#CC0066"><strong>增项为正，减项为负</strong></font></p></td>
              <td width="16%" align="right"><font color="#0000CC">管理费百分比</font></td>
              <td width="18%"><%=kh_glfbfb%>%</td>
              <td width="11%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">税金百分比</font></td>
              <td width="18%" bgcolor="#FFFFFF"><font color="#0000CC"><%=kh_suijinbfb%>%</font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">增减额-折前</font></td>
              <td bgcolor="#FFFFFF"><p><font color="#CC0066"><strong>
                <input name="zjje" type="text" value="0" size="10" maxlength="17" readonly>
              </strong></font></p>              </td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">增减额-折前</font></td>
              <td><input name="zqguanlif" type="text" value="0" size="10" maxlength="17"  readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">增减额</font></td>
              <td bgcolor="#FFFFFF"><input name="zjxsuijin" type="text" value="0" size="8" maxlength="17" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">折扣</font></td>
              <td bgcolor="#FFFFFF"><font color="#CC0066"><strong>
              <input type="text" name="zjxzkl" size="10" maxlength="8" value="<%=zjxzkl%>" readonly>
              </strong></font></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">折扣</font></td>
              <td><font color="#CC0066"><strong>
                <input type="text" name="glfzkl" size="10" maxlength="8" value="<%=glfzkl%>" readonly>
              </strong></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>减免额</td>
              <td bgcolor="#FFFFFF"><input type="text" name="sjjmje" size="8" maxlength="17" value="0" ></td>
            </tr>




            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">活动折扣</font></td>
              <td width="20%" bgcolor="#FFFFFF"><font color="#CC0066"><strong>
              <input type="text" name="cxhdzjxzkl" size="10" maxlength="8" value="<%=cxhdzjxzkl%>" readonly>
              </strong></font></td>
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">活动折扣</font></td>
              <td width="18%"><font color="#CC0066"><strong>
                <input type="text" name="cxhdglfzkl" size="10" maxlength="8" value="<%=cxhdglfzkl%>" readonly>
              </strong></font></td>
              <td colspan="2" align="center" bgcolor="#E8E8FF"><strong>其它款项</strong></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">增减额-折后</font></td>
              <td bgcolor="#FFFFFF"><input name="jzjje" type="text" value="0" size="10" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">增减额-折后</font></td>
              <td><input type="text" name="zhguanlif" size="10" maxlength="17" readonly></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>扣管理费</td>
              <td bgcolor="#FFFFFF"><input type="text" name="kglf" value="0" size="8" maxlength="17" >
                <font color="#CC0066"><strong>为正数</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>减免额</td>
              <td bgcolor="#FFFFFF"><input type="text" name="zjxjme" size="10" maxlength="17" value="0" ></td>
              <td align="right"><font color="#FF0000">*</font>减免额</td>
              <td><input type="text" name="glfjmje" size="10" maxlength="17" value="0" ></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>扣其它款</td>
              <td bgcolor="#FFFFFF"><input type="text" name="kqtk" value="0" size="8" maxlength="17" >
                <font color="#CC0066"><strong>为正数</strong></font></td>
            </tr>
  </table>
  <BR>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
                            <tr bgcolor="#FFFFFF">
                              <td align="right"><font color="#FF0000">*</font>增减项发生阶段</td>
                              <td><select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                                <option value=""></option>
                                <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd","");
%>
                              </select></td>
                              <td rowspan="5" align="right" width="21%"><font color="#FF0000">*</font>增减项原因 
                                <div align="right"></div>
                        <div align="right"></div>              </td>
                              <td rowspan="5" width="29%"> 
                                <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                                  <%
	cf.selectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","");
%> 
                                </select>              </td>
                            </tr>
                        <tr bgcolor="#FFFFFF">
                          <td align="right"><font color="#FF0000">*</font>增减项发生时间</td>
                          <td><input type="text" name="fssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
                        </tr>
                    <tr bgcolor="#FFFFFF">
                      <td align="right"><font color="#FF0000">*</font>增减项完成标志</td>
                      <td><input type="radio" name="zjxwcbz" value="1">
未完成
  <input type="radio" name="zjxwcbz" value="2">
完成 </td>
                    </tr>
                <tr bgcolor="#FFFFFF">
                  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
                  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="17" readonly></td>
                </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
              <td width="31%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>增减项说明</td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="74" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="lrdw" value="<%=lrdw%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                <input type="hidden" name="zjxxh" value="<%=zjxxh%>" readonly>
                <input type="button"  value="保存" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="选报价项目" onClick="f_xzxm(insertform)" name="lr" disabled>
                <input type="button"  value="选其它收费" onClick="f_ewlr(insertform)" name="ewlr" disabled>
                <input type="button"  value="修改其它收费" onClick="f_ewck(insertform)" name="xgsf" disabled>
                <input type="button"  value="修改自购主材" onClick="f_xgzgzc(insertform)" name="xgzgzc" disabled>
                <input type="reset"  value="重输">
                <P>
                  <input type="button"  value="完成增减项" onClick="f_wc(insertform)" name="wc" disabled>
                  <input type="button"  value="预览最新报价" onClick="f_dybj(insertform)" name="ck" disabled>
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
		alert("请选择[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxfsjd)=="") {
		alert("请输入[增减项发生阶段]！");
		FormName.zjxfsjd.focus();
		return false;
	}
	if(	javaTrim(FormName.fssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.fssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fssj, "增减项发生时间"))) {
		return false;
	}
	if(	!selectChecked(FormName.zjxyybm)) {
		alert("请输入[增减项原因]！");
		FormName.zjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("请选择[折前增减项发生额]！");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "折前增减项发生额"))) {
		return false;
	}
	if(	javaTrim(FormName.jzjje)=="") {
		alert("请选择[折后增减项发生额]！");
		FormName.jzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jzjje, "折后增减项发生额"))) {
		return false;
	}

	if(	javaTrim(FormName.zjxsuijin)=="") {
		alert("请选择[增减项税金]！");
		FormName.zjxsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsuijin, "增减项税金"))) {
		return false;
	}

	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请选择[折前增减项管理费]！");
		FormName.zqguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "折前增减项管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.zhguanlif)=="") {
		alert("请选择[折后增减项管理费]！");
		FormName.zhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.zhguanlif, "折后增减项管理费"))) {
		return false;
	}


	if(	javaTrim(FormName.zjxjme)=="") {
		alert("请输入[增减项减免额]！");
		FormName.zjxjme.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxjme, "增减项减免额"))) {
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
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("请输入[税金减免额]！");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "税金减免额"))) {
		return false;
	}


	if(	javaTrim(FormName.kglf)=="") {
		alert("请选择[扣管理费]！");
		FormName.kglf.focus();
		return false;
	}
	if(!(isFloat(FormName.kglf, "扣管理费"))) {
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

	if(	!radioChecked(FormName.zjxwcbz)) {
		alert("请选择[增减项完成标志]！");
		FormName.zjxwcbz[0].focus();
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
	if(	javaTrim(FormName.zjxyysm)=="") {
		alert("请输入[增减项说明]！");
		FormName.zjxyysm.focus();
		return false;
	}

	

	
	FormName.action="SaveInsertCrm_zjxdj.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ewlr.disabled=false;
	FormName.xgsf.disabled=false;
	FormName.xgzgzc.disabled=false;
	FormName.ck.disabled=false;
	FormName.wc.disabled=false;

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

function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=kh_jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
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
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
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
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
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
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
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
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
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
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
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
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"NO");
	}
}

function f_xgzgzc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/gcgl/zjx/dzbj/zxbjmx/xgzgzc.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
