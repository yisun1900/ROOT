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

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String ztjjgw=null;
String clgw=null;
String xmzy=null;
String jjsjs=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;

String fgsbh=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String gys=null;
String ppmc=null;
String ddlx=null;

double wdzje=0;
double hkze=0;
double zczkl=0;
String dzyy=null;
double htcxhdje=0;
double zjxcxhdje=0;
double zqzjhze=0;
double zjhze=0;

double zcyfk=0;

double zcfk=0;
double htze=0;
String txxx="";

String ssfgs=null;
String zjxbh=null;
int count=0;

String djlrfs="";//主材订单单价录入方式  1：录入单价算折扣；2：录入折扣算单价；3：不可打折
String kgcxhdbl="";//主材订单是否可改促销活动比例  Y：可改；N：不可改

String sxhtsfysh="";

String lx="";

try {
	conn=cf.getConnection();

	ls_sql="select count(*) ";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt='00' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！有增减项未完成，不能继续录入新单，请到维护中把他完成或删除");
		return;
	}

	ls_sql="select count(*) ";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and sxhtsfysh='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！有增减项手写合同未审核，不能录增减项！");
		return;
	}

	String clzt="";
	ls_sql="select clzt,sxhtsfysh,wdzje,jc_zcdd.hkze,zczkl,dzyy,htcxhdje,zjxcxhdje,zqzjhze,zjhze,dzyy,zczkl,ddlx,ztjjgw,zcdlbm,zcxlbm,ppbm,gys,ppmc,khbh,clgw,jjsjs,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		zczkl=rs.getDouble("zczkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");

		ddlx=cf.fillNull(rs.getString("ddlx"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		clgw=cf.fillNull(rs.getString("clgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	if (clzt.equals("30") && xclbz.equals("2"))
	{
		out.println("定制品已完结后，不能录增减项！");
		return;
	}

	if (sxhtsfysh.equals("N"))
	{
		out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能录增减项！</font></strong>");
		return;
	}

	ls_sql="select fgsbh,khxm,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();

	String bjjb="";
	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	//预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" SELECT sum(jc_zcdd.hkze+jc_zcdd.zjhze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
	ls_sql+=" and clzt>'07' and clzt not in('98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (htze-zcfk > zcyfk)
	{
		txxx="<B><font color='#FF0000'>提醒！客户应补交款："+cf.round(htze-zcfk-zcyfk,2)+"，订货总额："+htze+"，主材已付款："+zcfk+"，主材预付款余额:"+zcyfk+"</font></B>";
	}


	ls_sql="select djlrfs,kgcxhdbl";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
	}
	rs.close();
	ps.close();


	ls_sql="select NVL(max(substr(zjxbh,10,2)),0)";
	ls_sql+=" from  jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zjxbh=ddbh+cf.addZero(count+1,2);

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="10%">增减项序号</td>
		<td  width="10%">处理状态</td>
		<td  width="8%">客户姓名</td>
		<td  width="16%">子品牌</td>
		<td  width="10%">增减项总额</td>
		<td  width="10%">增减项发生时间</td>
		<td  width="10%">录入时间</td>
		<td  width="26%">备注</td>
	</tr>
		<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入已完成','02','已确认','03','已送货','99','退单'),crm_khxx.khxm,jc_zczjx.ppbm,jc_zczjx.zjxze,jc_zczjx.zjxfssj,jc_zczjx.lrsj,jc_zczjx.bz";
		ls_sql+=" FROM crm_khxx,jc_zczjx";
		ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh";
		ls_sql+=" and jc_zczjx.ddbh='"+ddbh+"'";
		ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
	//	out.println(ls_sql);
		pageObj.sql=ls_sql;
	//进行对象初始化
		pageObj.initPage("","","","");
		pageObj.setPageRow(10000);//设置每页显示记录数


	//设置列超级连接
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"zjxbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="ViewJc_zczjx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("zjxbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

		
		pageObj.out=out;
		pageObj.getDate(1);
	pageObj.displayDateSum();

	%> 
	</table>
	<%
}
%>

<table width="100%">
  <tr>
    <td width="100%" align="center"> 
      <div align="center"> 请录入主材增减项（增减项编号：<%=zjxbh%>）
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="40%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="26%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right">客户姓名</td>
              <td width="40%"><%=khxm%></td>
              <td width="18%" align="right">质检</td>
              <td width="26%"><%=zjxm%></td>
            </tr>
            <tr> 
              <td width="16%" bgcolor="#CCCCFF" align="right">房屋地址</td>
              <td width="40%" bgcolor="#CCCCFF"><%=fwdz%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装签约额</td>
              <td width="26%" bgcolor="#CCCCFF"><%=qye%></td>
            </tr>
            <tr> 
              <td width="16%" bgcolor="#CCCCFF" align="right">店面、设计师</td>
              <td width="40%" bgcolor="#CCCCFF"><%=dwmc%>、<%=sjs%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装签约日期</td>
              <td width="26%" bgcolor="#CCCCFF"><%=qyrq%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%" align="right"> 
                施工队、班长              </td>
              <td width="40%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>                、<%=sgbz%></td>
              <td width="18%" align="right"> 
                合同开、竣工日期              </td>
              <td width="26%"><%=kgrq%>---<%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">参加促销活动</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">交款性质、地点</td>
              <td width="40%"><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%>、<%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
              <td width="18%" align="right">项目专员</td>
              <td width="26%"><%=xmzy%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right"> 
                驻店家居顾问              </td>
              <td width="40%"> <%=clgw%> </td>
              <td width="18%" align="right"> 
                展厅家居顾问              </td>
              <td width="26%"><%=ztjjgw%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">需测量标志</td>
              <td width="40%"><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
              <td width="18%" align="right">计划测量时间</td>
              <td width="26%"><%=jhclsj%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right"> 
                等待送货通知              </td>
              <td width="40%"><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
              <td width="18%" align="right"> 
                合同送货时间              </td>
              <td width="26%"><%=htshsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">签合同时间              </td>
              <td width="40%"><%=qhtsj%> </td>
              <td width="18%" align="right">可减项截止时间              </td>
              <td width="26%"><%=kjxsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td colspan="3" bgcolor="#FFFFCC"><%=txxx%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><strong>订货总额</strong></font></td>
              <td bgcolor="#FFFFCC"><%=htze%></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>主材已付款</b></font></td>
              <td bgcolor="#FFFFCC"><%=zcfk%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>主材预付款</b></font></td>
              <td bgcolor="#FFFFCC"><%=zcyfk%></td>
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000"><b>预付款结余</b></font></td>
              <td bgcolor="#FFFFCC"><%=cf.round(zcyfk-(htze-zcfk),2)%></td>
            </tr>
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>折前－合同额</b></td>
              <td><%=wdzje%></td>
              <td align="right"><b>折后－合同额</b></td>
              <td><%=hkze%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>折前－增减项金额</b></td>
              <td><%=zqzjhze%></td>
              <td align="right"><b>折后－增减项金额</b></td>
              <td><%=zjhze%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>折前－增减后合计</b></td>
              <td><%=cf.formatDouble(wdzje+zqzjhze)%> </td>
              <td align="right"><b>折后－增减后合计</b></td>
              <td><%=cf.formatDouble(hkze+zjhze)%> </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>计入促销活动金额</b></td>
              <td><%=htcxhdje%><font color="#FF0000">（<b>合同</b>）</font></td>
              <td align="right"><b>计入促销活动金额</b></td>
              <td><%=zjxcxhdje%><font color="#FF0000">（<b>增减项</b>）</font></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><b>计入促销活动金额</b></td>
              <td><%=cf.formatDouble(htcxhdje+zjxcxhdje)%><font color="#FF0000">（<b>增减后合计</b>）</font></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><font color="#0000FF"><strong>合同折扣</strong></font></td>
              <td colspan="3"><%=zczkl%></td>
            </tr>
            <tr bgcolor="#CCFFCC">
              <td align="right"><font color="#0000FF"><strong>合同打折原因</strong></font></td>
              <td colspan="3"><%=dzyy%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="16%" align="right">合同备注</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#FFFFFF" align="right"><font color="#FF0033">*</font><font color="#0000CC">主材大类</font></td>
              <td width="40%"> 
                <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="26%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">子品牌</font></td>
              <td width="40%"> 
                <input type="text" name="ppbm" value="<%=ppbm%>" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0033">*</font><font color="#0000CC">增减项总额</font></td>
              <td width="26%"><input type="text" name="zjxze" value="0" size="20" maxlength="9" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font><font color="#0000CC">增减项折扣</font></td>
              <td width="40%"><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zczkl%>" >
                <b><font color="#0000FF">（>0且<=10）</font></b></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="26%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">增减项打折原因</td>
              <td colspan="3"><textarea name="dzyy" cols="80" rows="2" ><%=dzyy%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC"></font>增减项原因</td>
              <td width="40%"><select name="zczjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm","");
%>
              </select></td>
              <td width="18%" align="right"><font color="#FF0033">*</font>合同送货时间</td>
              <td width="26%"><input type="text" name="htshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0033">*</font>增减项发生时间              </td>
              <td width="40%">
                <input type="text" name="zjxfssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">录入人</font>              </td>
              <td width="26%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">录入时间</font>              </td>
              <td width="40%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000CC"></font><font color="#0000CC">录入部门</font>              </td>
              <td width="26%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">增减项备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="80" rows="2"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="zcxlbm" value="<%=zcxlbm%>" readonly>
                <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                <input type="hidden" name="ddlx" value="<%=ddlx%>" >
                <input type="hidden" name="zjxbh" value="<%=zjxbh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
				<input type="hidden" name="zcdlbm" value="<%=zcdlbm%>" >
				<input type="hidden" name="zcxlbm" value="<%=zcxlbm%>" >
				<input type="hidden" name="ppbm" value="<%=ppbm%>" >
				<input type="hidden" name="gys" value="<%=gys%>" >
				<input type="hidden" name="ppmc" value="<%=ppmc%>" >
				<input type="hidden" name="clgw" value="<%=clgw%>" >
				<input type="hidden" name="ztjjgw" value="<%=ztjjgw%>" >
				<input type="hidden" name="xmzy" value="<%=xmzy%>" >
				<input type="hidden" name="jjsjs" value="<%=jjsjs%>" >
				<input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
				<input type="hidden" name="qddm" value="<%=dmbh%>" >
				<input type="hidden" name="jzsjs" value="<%=sjs%>" >
				<input type="hidden" name="khjl" value="<%=khjl%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="完成" onClick="f_wc(insertform)" name="wc" disabled>
                <input type="button"  value="打印合同" onClick="window.open('/jcjj/dygl/zcfjzjx.jsp?zjxbh=<%=zjxbh%>')" name="dy" disabled>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="button"  value="批量修改明细" onClick="f_plxg(insertform)" name="plxg" disabled>
		  <input type="button"  value="单项修改明细" onClick="f_dpxg(insertform)" name="dpxg" disabled>
                <BR>
                <BR>
                <input type="button"  value="增减[已购买]型号" onClick="f_oldp(insertform)" name="oldp" disabled>
                <input type="button"  value="录入－输入型号" onClick="f_lrxh(insertform)" name="lrxh" disabled>
                <input type="button"  value="录入－查询型号" onClick="f_cxxh(insertform)" name="cxxh" disabled>
              <input type="button"  value="录入手写项目" onClick="f_newpsx(insertform)" name="newpsx" disabled>                </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zczjxyybm)=="") {
		alert("请选择[增减项原因]！");
		FormName.zczjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxze)=="") {
		alert("请输入[增减项总额]！");
		FormName.zjxze.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxze, "增减项总额"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "增减项发生时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "增减项折扣"))) {
		return false;
	}



	FormName.action="SaveInsertJc_zczjx.jsp";
	FormName.submit();
	FormName.oldp.disabled=false;

	if ("<%=lx%>"!="2")//1：非套餐；2：套餐
	{
		FormName.newpsx.disabled=false;
		FormName.lrxh.disabled=false;
		FormName.cxxh.disabled=false;
	}


	FormName.plxg.disabled=false;
	FormName.dpxg.disabled=false;
	FormName.wc.disabled=false;
	FormName.dy.disabled=false;
	
	return true;
}

function f_oldp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="Jc_zcddmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrxh(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="InsertAjaxMain.jsp";

	FormName.submit();
	return true;
}

function f_cxxh(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="SelectCxJc_zcjgb.jsp";
	FormName.submit();
	return true;
}

function f_newpsx(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtDj.jsp";
		<%
	}
	else if (djlrfs.equals("2"))
	{
		%>
		FormName.action="InsertJc_zcddmxSxhtZk.jsp";
		<%
	}
	else
	{
		%>
		FormName.action="InsertJc_zcddmxSxht.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_plxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

<%
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			FormName.action="EditAllDjBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllDjJc_zcddmx.jsp";
			<%
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			%>
			FormName.action="EditAllZkBlJc_zcddmx.jsp";
			<%
		}
		else{
			%>
			FormName.action="EditAllZkJc_zcddmx.jsp";
			<%
		}
	}
	else
	{
		%>
		FormName.action="EditAllNoJc_zcddmx.jsp";
		<%
	}
%>

	FormName.submit();
	return true;
}

function f_dpxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="Jc_zczjxmxList.jsp";

	FormName.submit();
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zjxbh)=="") {
		alert("请输入[增减项编号]！");
		FormName.zjxbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EndJc_zczjx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
