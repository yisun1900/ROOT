<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String sqsj=null;
String sqr=null;
String wcbz=null;
String wcsj=null;
String wcr=null;
String yjjzsj=null;

double gxqwdzgce=0;
double gxqzkl=0;
double gxqqye=0;

double gxqzqgczjf=0;
double gxqzhgczjf=0;
double gxqcdzwjmje=0;

double gxqglfbfb=0;
double gxqzqguanlif=0;
double gxqguanlif=0;
double gxqglfjmje=0;

double gxqsuijinbfb=0;
double gxqzqsuijin=0;
double gxqsuijin=0;
double gxqsjjmje=0;

double gxqzqsjf=0;
double gxqsjf=0;

double gxqzqwjrqyexm=0;
double gxqzhwjrqyexm=0;
String gxqwjrqyexmsm=null;

double gxqzqqtsf=0;
double gxqzhqtsf=0;
String gxqqtsfsm=null;

double gxqhdzsjz=0;
double gxqdjjbfb=0;
double gxqdjjje=0;


double gxhwdzgce=0;
double gxhzkl=0;
double gxhqye=0;

double gxhzqgczjf=0;
double gxhzhgczjf=0;
double gxhcdzwjmje=0;

double gxhglfbfb=0;
double gxhzqguanlif=0;
double gxhguanlif=0;
double gxhglfjmje=0;

double gxhsuijinbfb=0;
double gxhzqsuijin=0;
double gxhsuijin=0;
double gxhsjjmje=0;

double gxhzqsjf=0;
double gxhsjf=0;

double gxhzqwjrqyexm=0;
double gxhzhwjrqyexm=0;
String gxhwjrqyexmsm=null;

double gxhzqqtsf=0;
double gxhzhqtsf=0;
String gxhqtsfsm=null;

double gxhhdzsjz=0;
double gxhdjjbfb=0;
double gxhdjjje=0;

double gxhhtjz=0;
double gxhmll=0;
double gxhcbj=0;
double gxhsgcbj=0;
double gxhgcjcbj=0;
double gxhmle=0;
double gxhyjjzcs=0;
double gxhyjjz=0;

double gxqzqhtzcbj=0;
double gxqzhhtzcbj=0;
double gxqdjfxje=0;
double gxqzjjmje=0;

double gxhzqhtzcbj=0;
double gxhzhhtzcbj=0;
double gxhdjfxje=0;
double gxhzjjmje=0;

String bz=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));


String bjjb=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String zt=null;
String gcjdbm=null;
String fgsbh=null;
String dwbh=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String smhtbh=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sqsj,fgsbh,sqr,wcbz,wcsj,wcr,yjjzsj,bz ";
	ls_sql+=" ,gxqwdzgce,gxqzkl,gxqqye  ,gxqhdzsjz,gxqdjjbfb,gxqdjjje   ,gxqzqgczjf,gxqzhgczjf,gxqcdzwjmje  ,gxqglfbfb,gxqzqguanlif,gxqguanlif,gxqglfjmje  ,gxqsuijinbfb,gxqzqsuijin,gxqsuijin,gxqsjjmje  ,gxqzqsjf,gxqsjf  ,gxqzqwjrqyexm,gxqzhwjrqyexm,gxqwjrqyexmsm   ,gxqzqqtsf,gxqzhqtsf,gxqqtsfsm";
	ls_sql+=" ,gxqzqhtzcbj,gxqzhhtzcbj,gxqdjfxje,gxqzjjmje";
	ls_sql+=" ,gxhcdzwjmje,gxhglfjmje,gxhsjjmje";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where khbh='"+khbh+"' and  wcbz='1'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqr=cf.fillNull(rs.getString("sqr"));
		wcbz=cf.fillNull(rs.getString("wcbz"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		wcr=cf.fillNull(rs.getString("wcr"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		bz=cf.fillNull(rs.getString("bz"));
		
		gxqwdzgce=rs.getDouble("gxqwdzgce");
		gxqzkl=rs.getDouble("gxqzkl");
		gxqqye=rs.getDouble("gxqqye");

		gxqhdzsjz=rs.getDouble("gxqhdzsjz");
		gxqdjjbfb=rs.getDouble("gxqdjjbfb");
		gxqdjjje=rs.getDouble("gxqdjjje");

		gxqzqgczjf=rs.getDouble("gxqzqgczjf");
		gxqzhgczjf=rs.getDouble("gxqzhgczjf");
		gxqcdzwjmje=rs.getDouble("gxqcdzwjmje");

		gxqglfbfb=rs.getDouble("gxqglfbfb");
		gxqzqguanlif=rs.getDouble("gxqzqguanlif");
		gxqguanlif=rs.getDouble("gxqguanlif");
		gxqglfjmje=rs.getDouble("gxqglfjmje");


		gxqsuijinbfb=rs.getDouble("gxqsuijinbfb");
		gxqzqsuijin=rs.getDouble("gxqzqsuijin");
		gxqsuijin=rs.getDouble("gxqsuijin");
		gxqsjjmje=rs.getDouble("gxqsjjmje");

		gxqzqsjf=rs.getDouble("gxqzqsjf");
		gxqsjf=rs.getDouble("gxqsjf");

		gxqzqwjrqyexm=rs.getDouble("gxqzqwjrqyexm");
		gxqzhwjrqyexm=rs.getDouble("gxqzhwjrqyexm");
		gxqwjrqyexmsm=cf.fillNull(rs.getString("gxqwjrqyexmsm"));

		gxqzqqtsf=rs.getDouble("gxqzqqtsf");
		gxqzhqtsf=rs.getDouble("gxqzhqtsf");
		gxqqtsfsm=cf.fillNull(rs.getString("gxqqtsfsm"));

		gxqhdzsjz=rs.getDouble("gxqhdzsjz");
		gxqdjjbfb=rs.getDouble("gxqdjjbfb");
		gxqdjjje=rs.getDouble("gxqdjjje");

		gxqzqhtzcbj=rs.getDouble("gxqzqhtzcbj");
		gxqzhhtzcbj=rs.getDouble("gxqzhhtzcbj");
		gxqdjfxje=rs.getDouble("gxqdjfxje");
		gxqzjjmje=rs.getDouble("gxqzjjmje");

		gxhcdzwjmje=rs.getDouble("gxhcdzwjmje");
		gxhglfjmje=rs.getDouble("gxhglfjmje");
		gxhsjjmje=rs.getDouble("gxhsjjmje");
	}
	rs.close();
	ps.close();

	ls_sql="select bjjb,smhtbh,hth,khxm,fwdz,lxfs,sjs,sgd,sgbz,zjxm,kgrq,jgrq,sjkgrq,sjjgrq,zt,gcjdbm,fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT yjjzcs";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gxhyjjzcs=rs.getDouble("yjjzcs");
	}
	rs.close();
	ps.close();

	if (gxhyjjzcs==0)
	{
		out.println("错误！未设【业绩净值参数】");
		return;
	}



////////////////
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();

	gxhwdzgce=dzbjje.getZqBjje(conn,khbh,"yz");//获取『折前』电子报价金额，直接费＋其它收费
	gxhqye=dzbjje.getZhBjje(conn,khbh,"sxyd")-gxhsjjmje-gxhglfjmje-gxhcdzwjmje;//获取『折后』电子报价金额，直接费＋其它收费

	gxhsuijinbfb=dzbjje.getSuijinBfb(conn,khbh,"yz");//税金百分比
	gxhsuijin=dzbjje.getZhSuijinJe(conn,khbh,"yz");//获取折后『税金金额』
	gxhzqsuijin=dzbjje.getZqSuijinJe(conn,khbh,"yz")-gxhsjjmje;//获取折前『税金金额』

	gxhglfbfb=dzbjje.getGlfBl(conn,khbh,"yz");//管理费百分比
	gxhzqguanlif=dzbjje.getZqGlfJe(conn,khbh,"yz");//『折前』管理费
	gxhguanlif=dzbjje.getZhGlfJe(conn,khbh,"yz")-gxhglfjmje;//获取折后『管理费金额』

	gxhzqgczjf=dzbjje.getZqGczjf(conn,khbh,"yz");//工程直接费－折前
	gxhzhgczjf=dzbjje.getZhGczjf(conn,khbh,"yz")-gxhcdzwjmje;//工程直接费－折后

	gxhzqqtsf=dzbjje.getZqJrQtsf(conn,khbh,"yz");//记入业绩其它费－折前，不包括税金、管理费、设计费
	gxhzhqtsf=dzbjje.getZhJrQtsf(conn,khbh,"yz");//记入业绩其它费－折后，不包括税金、管理费、设计费
	gxhqtsfsm=dzbjje.getJrQtsfsm(conn,khbh,"yz");//记入业绩其它费项目，不包括税金、管理费、设计费

	gxhzqwjrqyexm=dzbjje.getZqWjrJe(conn,khbh);//获取折前『不记入业绩其它费』，不包括税金、管理费、设计费
	gxhzhwjrqyexm=dzbjje.getZhWjrJe(conn,khbh);//获取折后『不记入业绩其它费』，不包括税金、管理费、设计费
	gxhwjrqyexmsm=dzbjje.getWjrJeMc(conn,khbh);//获取『其它收费项目名称』，不包括税金、管理费、设计费

	gxhzqsjf=dzbjje.getZqSjf(conn,khbh);//获取折前『设计费』
	gxhsjf=dzbjje.getZhSjf(conn,khbh);//获取折后『设计费』

	gxhzqhtzcbj=dzbjje.getZqZcbj(conn,khbh,"yz");//合同主材报价－折前
	gxhzhhtzcbj=dzbjje.getZhZcbj(conn,khbh,"yz");//合同主材报价－折后


	if (gxhwdzgce!=0)
	{
		gxhzkl=cf.round(gxhqye*10/gxhwdzgce,2);
	}
	else{
		gxhzkl=10;
	}


	gxhdjfxje=dzbjje.getDjfxje(conn,khbh,"sxyd");//订金返现金额
	gxhzjjmje=dzbjje.getZjjmje(conn,khbh,"yz");//直接减免金额
	gxhhdzsjz=dzbjje.getZsjz(conn,khbh);//活动赠送净值+特权赠送净值


	gxhdjjje=dzbjje.getHtDjj(conn,khbh,"yz");//代金券金额
	gxhdjjbfb=dzbjje.getDjjbfb(conn,khbh,"yz");//代金券百分比


	gxhhtjz=dzbjje.getHtjz(conn,khbh,"yz");//合同净值＝工程费＋记入业绩其它费（包括所有记入项）－赠送净值－赠送代金券

	gxhsgcbj=dzbjje.getSgcbj(conn,khbh,"yz");//施工成本价＝工程项施工成本价＋其它项施工成本（不含：管理费、税金）
	
	gxhmle=cf.round(gxhhtjz-gxhsgcbj,2);//毛利额=合同净值－施工成本价
	gxhmll=cf.round(gxhmle/gxhhtjz*100,2);//毛利率＝毛利额÷合同净值

	gxhyjjz=cf.round((gxhmle-gxhzhwjrqyexm)*100/gxhyjjzcs,2);//业绩净值=毛利额÷核算净值参数

	gxhcbj=dzbjje.getCbj(conn,khbh,"yz");//成本价＝工程项成本价＋其它项成本（不含：管理费、税金）
	gxhgcjcbj=dzbjje.getGcjcbj(conn,khbh,"yz");//工程基础报价＝工程项工程基础报价＋其它项工程基础报价（不含：管理费、税金）

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE3 {color: #0000CC; font-size: 12px; }
.STYLE4 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_czbjsqjl.jsp" name="editform" target="_blank">
  <div align="center">重做报价－完成</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">客户编号</font>      </td>
      <td width="32%"> <%=khbh%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">合同号</font>      </td>
      <td width="32%"> <%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">客户姓名</font>      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">签约店面</font>      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">设计师</font>      </td>
      <td width="32%"> <%=sjs%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">工程担当</font>      </td>
      <td width="32%"> <%=zjxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        <font color="#0000CC">施工队</font>      </td>
      <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
      <td width="18%" align="right"> 
        <font color="#0000CC">施工班组</font>      </td>
      <td width="32%"> <%=sgbz%> </td>
    </tr>
     <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">公司促销活动</font></td>
      <td colspan="3"><%=cxhdbm%>
       <input name="button3" type="button" onClick="window.open('/dhzx/dhzx/zkzsxx.jsp?khbh=<%=khbh%>')" value="折扣赠送"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">小区促销活动</font></td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">展会促销活动</font></td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>新的书面合同编号</td>
      <td><input type="text" name="smhtbh" size="20" maxlength="20"  value="<%=smhtbh%>"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">授权人</td>
      <td width="32%"><%=sqr%> </td>
      <td align="right" width="18%">授权时间</td>
      <td width="32%"><%=sqsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">完成人</font></td>
      <td width="32%"> 
      <input type="text" name="wcr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">完成时间</font></td>
      <td width="32%"> 
      <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="20" colspan="2" align="center" bgcolor="#E8E8FF"><strong><font color="#990000">更新前</font></strong></td>
      <td colspan="2" align="center" bgcolor="#FFFF99"><strong><font color="#990000">更新后</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">合同总额－折前</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqwdzgce%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">合同总额－折前</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
      <input type="text" name="gxhwdzgce" size="20" maxlength="17"  value="<%=gxhwdzgce%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">综合折扣</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqzkl%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">综合折扣</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
        <input type="text" name="gxhzkl" size="10" maxlength="9"  value="<%=gxhzkl%>" readonly>
      <b><font color="#0000FF">（>0且<=10）</font></b> </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">合同总额－折后</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqqye%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">合同总额－折后</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
      <input type="text" name="gxhqye" size="20" maxlength="17"  value="<%=gxhqye%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">赠送净值</font></td>
      <td bgcolor="#E8E8FF"><%=gxqhdzsjz%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#0000CC">赠送净值</font></td>
      <td bgcolor="#FFFF99"><input name="gxhhdzsjz" type="text" value="<%=gxhhdzsjz%>" size="20" maxlength="16" readonly /></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">代金券百分比</span></td>
      <td bgcolor="#E8E8FF"><%=gxqdjjbfb%> %</td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><span class="STYLE1">代金券百分比</span></td>
      <td bgcolor="#FFFF99"><input name="gxhdjjbfb" type="text" value="<%=gxhdjjbfb%>" size="10" maxlength="16" readonly="readonly">
%</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">赠送代金券</font></td>
      <td bgcolor="#E8E8FF"><%=gxqdjjje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000CC">赠送代金券</font></td>
      <td bgcolor="#FFFF99"><input name="gxhdjjje" type="text" value="<%=gxhdjjje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">订金返现金额</span></td>
      <td bgcolor="#E8E8FF"><%=gxqdjfxje%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">订金返现金额</span></td>
      <td bgcolor="#FFFF99"><input name="gxhdjfxje" type="text" value="<%=gxhdjfxje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">直接减免金额</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzjjmje%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">直接减免金额</span></td>
      <td bgcolor="#FFFF99"><input name="gxhzjjmje" type="text" value="<%=gxhzjjmje%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">工程直接费－折前</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqgczjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzqgczjf" type="text" value="<%=gxhzqgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">工程费减免额</span></td>
      <td bgcolor="#E8E8FF"><%=gxqcdzwjmje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font>工程费减免额</td>
      <td bgcolor="#FFFF99"><input name="gxhcdzwjmje" type="text"  value="<%=gxhcdzwjmje%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">工程直接费－折后</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzhgczjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzhgczjf" type="text" value="<%=gxhzhgczjf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">管理费百分比</font></td>
      <td bgcolor="#E8E8FF"><%=gxqglfbfb%>% </td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">管理费百分比</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhglfbfb" size="10" maxlength="9"  value="<%=gxhglfbfb%>" readonly>
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">折前管理费</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqguanlif%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">折前管理费</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzqguanlif" size="20" maxlength="17"  value="<%=gxhzqguanlif%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">管理费减免额</font></td>
      <td bgcolor="#E8E8FF"><%=gxqglfjmje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font>管理费减免额</td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhglfjmje" size="20" maxlength="17"  value="<%=gxhglfjmje%>" onChange="calValue(editform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">折后管理费</font></td>
      <td bgcolor="#E8E8FF"><%=gxqguanlif%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">折后管理费</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhguanlif" size="20" maxlength="17"  value="<%=gxhguanlif%>" readonly>      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">税金百分比</font></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqsuijinbfb%>% </td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000CC">税金百分比</font></td>
      <td width="32%" bgcolor="#FFFF99"> 
        <input type="text" name="gxhsuijinbfb" size="10" maxlength="9"  value="<%=gxhsuijinbfb%>" readonly>
      % </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE1">税金－折前</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzqsuijin%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE1"><font color="#CC0000">*</font>税金－折前</span></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzqsuijin" size="20" maxlength="17"  value="<%=gxhzqsuijin%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000CC">税金减免额</font></td>
      <td bgcolor="#E8E8FF"><%=gxqsjjmje%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font>税金减免额</td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhsjjmje" size="20" maxlength="17"  value="<%=gxhsjjmje%>" onChange="calValue(editform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right" bgcolor="#E8E8FF"><span class="STYLE1">税金－折后</span></td>
      <td width="32%" bgcolor="#E8E8FF"><%=gxqsuijin%></td>
      <td width="18%" align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><span class="STYLE1">税金－折后</span></td>
      <td width="32%" bgcolor="#FFFF99"> 
      <input type="text" name="gxhsuijin" size="20" maxlength="17"  value="<%=gxhsuijin%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">记入业绩其它费－折前</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqqtsf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">记入业绩其它费－折前</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzqqtsf" type="text" value="<%=gxhzqqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">记入业绩其它费－折后</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzhqtsf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">记入业绩其它费－折后</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzhqtsf" type="text" value="<%=gxhzhqtsf%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td rowspan="2" align="right" bgcolor="#E8E8FF"><font color="#0000FF">记入业绩其它费项目</font></td>
      <td colspan="3" bgcolor="#E8E8FF"><%=gxqqtsfsm%><span class="STYLE3">（更新前）</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="3" bgcolor="#FFFF99"><input name="gxhqtsfsm" type="text" value="<%=gxhqtsfsm%>" size="67" maxlength="100" readonly >
      <span class="STYLE3">（更新后）</span></td>
    </tr>

    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">不记业绩其它费－折前</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqwjrqyexm%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">不记业绩其它费－折前</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzqwjrqyexm" size="20" maxlength="17"  value="<%=gxhzqwjrqyexm%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">不记业绩其它费－折后</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzhwjrqyexm%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#CC0000">*</font><font color="#0000FF">不记业绩其它费－折后</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhzhwjrqyexm" size="20" maxlength="17"  value="<%=gxhzhwjrqyexm%>" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td rowspan="2" align="right" bgcolor="#E8E8FF"><font color="#0000FF">不记业绩其它费项目</font></td>
      <td colspan="3" bgcolor="#E8E8FF"><%=gxqwjrqyexmsm%><span class="STYLE1">（更新前）</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="3" bgcolor="#FFFF99"><input type="text" name="gxhwjrqyexmsm" size="67" maxlength="100"  value="<%=gxhwjrqyexmsm%>" readonly>
      <span class="STYLE3">（更新后）</span></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2">&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">主材报价－折前</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzqhtzcbj%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">主材报价－折前</span></td>
      <td bgcolor="#FFFF99"><input name="gxhzqhtzcbj" type="text" value="<%=gxhzqhtzcbj%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><span class="STYLE4">主材报价－折后</span></td>
      <td bgcolor="#E8E8FF"><%=gxqzhhtzcbj%></td>
      <td align="right" bgcolor="#FFFF99"><span class="STYLE4">主材报价－折后</span></td>
      <td bgcolor="#FFFF99"><input name="gxhzhhtzcbj" type="text" value="<%=gxhzhhtzcbj%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#0000FF">设计费－折前</font></td>
      <td bgcolor="#E8E8FF"><%=gxqzqsjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">设计费－折前</font></td>
      <td bgcolor="#FFFF99"><input name="gxhzqsjf" type="text" value="<%=gxhzqsjf%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#E8E8FF"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
      <td bgcolor="#E8E8FF"><%=gxqsjf%></td>
      <td align="right" bgcolor="#FFFF99"><font color="#FF0033">*</font><font color="#0000FF">设计费－折后</font></td>
      <td bgcolor="#FFFF99"><input type="text" name="gxhsjf" size="20" maxlength="17"  value="<%=gxhsjf%>" readonly>      </td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center" > 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="sqsj"  value="<%=sqsj%>" >
          <input type="button"  value="完成重做报价" onClick="f_do(editform)">
          <input type="reset"  value="重输">
          <input name="gxhhtjz" type="hidden" value="<%=gxhhtjz%>" size="20" maxlength="16" readonly >
          <input name="gxhsgcbj" type="hidden" value="<%=gxhsgcbj%>" size="20" maxlength="16" readonly >
          <input name="gxhmle" type="hidden" value="<%=gxhmle%>" size="20" maxlength="16" readonly >
          <input name="gxhmll" type="hidden" value="<%=gxhmll%>" size="8" maxlength="8" readonly>
          <input name="gxhyjjzcs" type="hidden" value="<%=gxhyjjzcs%>" size="8" maxlength="8" readonly>
          <input name="gxhyjjz" type="hidden" value="<%=gxhyjjz%>" size="20" maxlength="16" readonly >
          <input name="gxhcbj" type="hidden" value="<%=gxhcbj%>" size="20" maxlength="16" readonly >
          <input name="gxhgcjcbj" type="hidden" value="<%=gxhgcjcbj%>" size="20" maxlength="16" readonly ></td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	//工程费减免额
	var gxhzhgczjf=<%=gxhzhgczjf%>-FormName.gxhcdzwjmje.value*1.0;
	gxhzhgczjf=round(gxhzhgczjf,2);
	FormName.gxhzhgczjf.value=gxhzhgczjf;

	//管理费减免额
	var gxhguanlif=<%=gxhguanlif%>-FormName.gxhglfjmje.value*1.0;
	gxhguanlif=round(gxhguanlif,2);
	FormName.gxhguanlif.value=gxhguanlif;

	//税金减免额
	var gxhsuijin=<%=gxhsuijin%>-FormName.gxhsjjmje.value*1.0;
	gxhsuijin=round(gxhsuijin,2);
	FormName.gxhsuijin.value=gxhsuijin;

	//折后合同总额=折后工程直接费＋折后管理费＋折后税金＋折后记入业绩其它费＋折后不记业绩其它费＋折后设计费
	var gxhqye=FormName.gxhzhgczjf.value*1.0+FormName.gxhguanlif.value*1.0+FormName.gxhsuijin.value*1.0+FormName.gxhzhqtsf.value*1.0+FormName.gxhzhwjrqyexm.value*1.0+FormName.gxhsjf.value*1.0+FormName.gxhzhhtzcbj.value*1.0-FormName.gxhdjfxje.value*1.0-FormName.gxhzjjmje.value*1.0;
	gxhqye=round(gxhqye,2);
	FormName.gxhqye.value=gxhqye;    

	//综合折扣
	var gxhzkl=0;
	if (FormName.gxhwdzgce.value*1!=0)
	{
		gxhzkl=FormName.gxhqye.value*10.0/FormName.gxhwdzgce.value;
	}
	else{
		gxhzkl=10;
	}
	gxhzkl=round(gxhzkl,2);
	FormName.gxhzkl.value=gxhzkl;    


	//合同净值=合同净值－工程费减免额－管理费减免额－税金减免额
	var gxhhtjz=<%=gxhhtjz%>-FormName.gxhcdzwjmje.value*1.0-FormName.gxhglfjmje.value*1.0-FormName.gxhsjjmje.value*1.0;
	gxhhtjz=round(gxhhtjz,2);
	FormName.gxhhtjz.value=gxhhtjz;    

	//毛利额=合同净值－施工成本价
	var gxhmle=(FormName.gxhhtjz.value*1.0-FormName.gxhsgcbj.value*1.0);
	gxhmle=round(gxhmle,2);
	FormName.gxhmle.value=gxhmle;    

	//毛利率=毛利额÷合同净值
	var gxhmll=FormName.gxhmle.value*1.0/FormName.gxhhtjz.value*1.0*100;
	gxhmll=round(gxhmll,2);
	FormName.gxhmll.value=gxhmll;    

	//业绩净值=毛利额÷业绩净值参数
	var gxhyjjz=FormName.gxhmle.value*100/FormName.gxhyjjzcs.value;
	gxhyjjz=round(gxhyjjz,2);
	FormName.gxhyjjz.value=gxhyjjz;    

}
	
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("请输入[新的书面合同编号]！");
		FormName.smhtbh.focus();
		return false;
	}
	if(	javaTrim(FormName.wcr)=="") {
		alert("请输入[完成人]！");
		FormName.wcr.focus();
		return false;
	}
	if(	javaTrim(FormName.wcsj)=="") {
		alert("请输入[完成时间]！");
		FormName.wcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "完成时间"))) {
		return false;
	}


	if(	javaTrim(FormName.gxhwdzgce)=="") {
		alert("请输入[更新后折前合同总额]！");
		FormName.gxhwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhwdzgce, "更新后折前合同总额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzkl)=="") {
		alert("请输入[更新后综合折扣]！");
		FormName.gxhzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzkl, "更新后综合折扣"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhqye)=="") {
		alert("请输入[更新后折后合同总额]！");
		FormName.gxhqye.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhqye, "更新后折后合同总额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhhdzsjz)=="") {
		alert("请输入[更新后赠送净值]！");
		FormName.gxhhdzsjz.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhhdzsjz, "更新后赠送净值"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhdjjbfb)=="") {
		alert("请输入[更新后代金券百分比]！");
		FormName.gxhdjjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhdjjbfb, "更新后代金券百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhdjjje)=="") {
		alert("请输入[更新后赠送代金券]！");
		FormName.gxhdjjje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhdjjje, "更新后赠送代金券"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqgczjf)=="") {
		alert("请输入[更新后折前工程直接费]！");
		FormName.gxhzqgczjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqgczjf, "更新后折前工程直接费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzhgczjf)=="") {
		alert("请输入[更新后折后工程直接费]！");
		FormName.gxhzhgczjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzhgczjf, "更新后折后工程直接费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhcdzwjmje)=="") {
		alert("请输入[更新后工程费减免额]！");
		FormName.gxhcdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhcdzwjmje, "更新后工程费减免额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhglfbfb)=="") {
		alert("请输入[更新后管理费百分比]！");
		FormName.gxhglfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglfbfb, "更新后管理费百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqguanlif)=="") {
		alert("请输入[更新后折前管理费]！");
		FormName.gxhzqguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqguanlif, "更新后折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhglfjmje)=="") {
		alert("请输入[更新后管理费减免额]！");
		FormName.gxhglfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhglfjmje, "更新后管理费减免额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhguanlif)=="") {
		alert("请输入[更新后折后管理费]！");
		FormName.gxhguanlif.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhguanlif, "更新后折后管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsuijinbfb)=="") {
		alert("请输入[更新后税金百分比]！");
		FormName.gxhsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijinbfb, "更新后税金百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqsuijin)=="") {
		alert("请输入[更新后折前税金]！");
		FormName.gxhzqsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqsuijin, "更新后折前税金"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsjjmje)=="") {
		alert("请输入[更新后税金减免额]！");
		FormName.gxhsjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjjmje, "更新后税金减免额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsuijin)=="") {
		alert("请输入[更新后折后税金]！");
		FormName.gxhsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsuijin, "更新后折后税金"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqsjf)=="") {
		alert("请输入[更新后折前设计费]！");
		FormName.gxhzqsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqsjf, "更新后折前设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsjf)=="") {
		alert("请输入[更新后折后设计费]！");
		FormName.gxhsjf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsjf, "更新后折后设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqwjrqyexm)=="") {
		alert("请输入[更新后折前未记入签约额部分]！");
		FormName.gxhzqwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqwjrqyexm, "更新后折前未记入签约额部分"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzhwjrqyexm)=="") {
		alert("请输入[更新后折后未记入签约额部分]！");
		FormName.gxhzhwjrqyexm.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzhwjrqyexm, "更新后折后未记入签约额部分"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzqqtsf)=="") {
		alert("请输入[更新后折前记入业绩其它费]！");
		FormName.gxhzqqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzqqtsf, "更新后折前记入业绩其它费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhzhqtsf)=="") {
		alert("请输入[更新后折后记入业绩其它费]！");
		FormName.gxhzhqtsf.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhzhqtsf, "更新后折后记入业绩其它费"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhhtjz)=="") {
		alert("请输入[更新后合同净值]！");
		FormName.gxhhtjz.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhhtjz, "更新后合同净值"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhsgcbj)=="") {
		alert("请输入[更新后施工成本价]！");
		FormName.gxhsgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhsgcbj, "更新后施工成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhmle)=="") {
		alert("请输入[更新后毛利额]！");
		FormName.gxhmle.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhmle, "更新后毛利额"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhmll)=="") {
		alert("请输入[更新后毛利率]！");
		FormName.gxhmll.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhmll, "更新后毛利率"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhyjjz)=="") {
		alert("请输入[更新后业绩净值]！");
		FormName.gxhyjjz.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhyjjz, "更新后业绩净值"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhyjjzcs)=="") {
		alert("请输入[更新后业绩净值参数]！");
		FormName.gxhyjjzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhyjjzcs, "更新后业绩净值参数"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhcbj)=="") {
		alert("请输入[更新后成本价]！");
		FormName.gxhcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhcbj, "更新后成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.gxhgcjcbj)=="") {
		alert("请输入[更新后工程基础报价]！");
		FormName.gxhgcjcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.gxhgcjcbj, "更新后工程基础报价"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
