<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sgd=null;
String sgbz=null;
double htje=0;
double zjxje=0;
double jlje=0;
double sdljsje=0;
String jsjs=null;
double jsbl=0;
double tzjsbl=0;
double sdlje=0;
double sdljsbl=0;
double jsje=0;
double clf=0;
double clyf=0;
double gdyp=0;
double yfgck=0;
double kzbjbl=0;
double clfk=0;
double fkje=0;
double yfje=0;
String jsrq=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String kzbj=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;

double qtf=0;
String qtfsm=null;
double ssk=0;
double jsjsze=0;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkzbj=null;
String sfkyfgf=null;
String kzbjjs=null;
double qtje=0;

double khpck=0;
double yqf=0;
double jsyh=0;
double khqk=0;

double kkhpck=0;
double kyqf=0;
double kkhqk=0;
double zxxs=0;
double jxxs=0;
double kghzx=0;
double kghjx=0;

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,htje,zjxje,jlje,sdljsje,jsjs,jsbl,tzjsbl,sdlje,sdljsbl,jsje,clf,clyf,gdyp,yfgck,kzbjbl,clfk,fkje,yfje,jsrq,clzt,lrr,lrsj,lrbm,bz,kzbj ";
	ls_sql+=" ,qtf,qtfsm,ssk,jsjsze,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,kzbjjs,qtje,khpck,jsyh,yqf,khqk,kkhpck,kyqf,kkhqk";
	ls_sql+=" ,zxxs,jxxs,kghzx,kghjx ";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxxs=rs.getDouble("zxxs");
		jxxs=rs.getDouble("jxxs");
		kghzx=rs.getDouble("kghzx");
		kghjx=rs.getDouble("kghjx");

		khpck=rs.getDouble("khpck");
		jsyh=rs.getDouble("jsyh");
		yqf=rs.getDouble("yqf");
		khqk=rs.getDouble("khqk");

		kkhpck=rs.getDouble("kkhpck");
		kyqf=rs.getDouble("kyqf");
		kkhqk=rs.getDouble("kkhqk");

		qtf=rs.getDouble("qtf");
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		ssk=rs.getDouble("ssk");
		jsjsze=rs.getDouble("jsjsze");
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		qtje=rs.getDouble("qtje");

		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		htje=rs.getDouble("htje");
		zjxje=rs.getDouble("zjxje");
		jlje=rs.getDouble("jlje");
		sdljsje=rs.getDouble("sdljsje");
		jsjs=cf.fillNull(rs.getString("jsjs"));
		jsbl=rs.getDouble("jsbl");
		tzjsbl=rs.getDouble("tzjsbl");
		sdlje=rs.getDouble("sdlje");
		sdljsbl=rs.getDouble("sdljsbl");
		jsje=rs.getDouble("jsje");
		clf=rs.getDouble("clf");
		clyf=rs.getDouble("clyf");
		gdyp=rs.getDouble("gdyp");
		yfgck=rs.getDouble("yfgck");
		kzbjbl=rs.getDouble("kzbjbl");
		clfk=rs.getDouble("clfk");
		fkje=rs.getDouble("fkje");
		yfje=rs.getDouble("yfje");
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		kzbj=cf.fillNull(rs.getString("kzbj"));
	}
	rs.close();
	ps.close();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();
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
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_sgdwgjsty.jsp" name="insertform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="电子报价">
        <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
        <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
        <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">结算记录号</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">结算基数</span></td> 
  <td width="32%"> 
    <select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectToken(out,"1+工程费&2+工程费＋其它费&3+实收款总额&4+一期款&5+二期款&6+三期款&7+工程基础报价&8+工程基础报价＋其它费基础报价&9+工程施工成本价&A+工程施工成本价＋其它费施工成本&B+工程成本价&C+工程成本价＋其它费成本",jsjs,false);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">合同工程额</span></td>
  <td><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">累计增减项</span></td>
  <td><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">合同其它费</span></td>
  <td><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">实收款</span></td>
  <td><input type="text" name="ssk" size="20" maxlength="17" value=<%=ssk%> readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">其它费说明</span></td>
  <td colspan="3"><input type="text" name="qtfsm" value="<%=qtfsm%>" size="72" maxlength="100" readonly>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">最新报价总额</td>
  <td colspan="3"><%=cf.round(htje+qtf+zjxje,2)%><strong>&nbsp;&nbsp;&nbsp;&nbsp;最新报价总额=合同工程额+合同其它费+累计增减项</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">应收金额</td>
  <td colspan="3"><%=cf.round(htje+qtf+zjxje-ssk,2)%><strong>&nbsp;&nbsp;&nbsp;&nbsp;应收金额=最新报价总额-实收款</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算优惠</span></td>
  <td><input type="text" name="jsyh" value="<%=jsyh%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">客户赔偿款</span></td>
  <td><input type="text" name="khpck" value="<%=khpck%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">延期费</span></td>
  <td><input type="text" name="yqf" value="<%=yqf%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">客户欠款</span></td>
  <td colspan="3"><input type="text" name="khqk" value="<%=khqk%>" size="20" maxlength="17" readonly>
    <strong>客户欠款=最新报价总额-结算优惠-客户赔偿款-延期费-实收款</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>扣延期费</td>
  <td><input type="text" name="kyqf" value="<%=kyqf%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>扣客户赔偿款</td>
  <td><input type="text" name="kkhpck" value="<%=kkhpck%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>扣客户欠款</td>
  <td><input type="text" name="kkhqk" value="<%=kkhqk%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">增项系数</span></td>
  <td><input name="zxxs" type="text" value="<%=zxxs%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">减项系数</span></td>
  <td><input type="text" name="jxxs" value="<%=jxxs%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">开工后增项施工成本</span></td>
  <td><input type="text" name="kghzx" value="<%=kghzx%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">开工后减项折后金额</span></td>
  <td><input type="text" name="kghjx" value="<%=kghjx%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算基数总额</span></td>
  <td colspan="3"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly>
    <strong>结算基数总额=结算基数+开工后增项施工成本*增项系数-开工后减项折后金额*减项系数-扣客户欠款-扣客户赔偿款-扣延期费</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算比例</span></td>
  <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" >
% </td>
  <td align="right"><font color="#FF0000">*</font>调整结算比例</td>
  <td><input type="text" name="tzjsbl" value="<%=tzjsbl%>" size="10" maxlength="9" onChange="jsValue(insertform)">
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">水电路结算方式</span></td> 
  <td width="32%">
    <%
	cf.radioToken(out, "sdljsfs","1+统一比例结算&2+独立比例结算&3+不结算",sdljsfs,true);
%></td>
  <td align="right" width="18%"><span class="STYLE4"><font color="#FF0000">*</font>水电路金额</span></td> 
  <td width="32%"> 
    <input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE4"><font color="#FF0000">*</font>水电路结算比例</span></td> 
  <td width="32%"> 
    <input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9" readonly>
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">水电路结算金额</span></td> 
  <td width="32%"><input type="text" name="sdljsje" value="<%=sdljsje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">结算总额</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5"><span class="STYLE2">结算总额</span>＝<span class="STYLE4">结算基数总额</span>×（<span class="STYLE4">结算比例</span>＋<span class="STYLE4">调整结算比例</span>）</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣材料款</span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>材料罚款</td>
  <td><input type="text" name="clfk" value="<%=clfk%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">材料费</span></td> 
  <td width="32%"><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>材料运费</td> 
  <td width="32%"> 
    <input type="text" name="clyf" value="<%=clyf%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣工地用品</span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+是&N+否",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">工地用品</span></td>
  <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">是否扣已付工费</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf,true);
%></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">已付工程款</span></td> 
  <td width="32%"><input name="yfgck" type="text"  value="<%=yfgck%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣质保金</span></td>
  <td><%
	cf.radioToken(out, "sfkzbj","Y+扣质保金比例不可改&M+扣质保金比例可改&N+不扣质保金",sfkzbj,true);
%></td>
  <td align="right">扣质保金基数</td>
  <td>
    <%
	cf.radioToken(out, "kzbjjs","1+结算基数&2+结算总额",kzbjjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>应扣质保金比例</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" <%if (!sfkzbj.equals("M")) out.println("readonly");%> size="10" maxlength="9" onChange="jsValue(insertform)">
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">扣质保金</span></td> 
  <td width="32%"><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>罚款金额</td>
  <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font>奖励金额</td>
  <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>其它金额</td>
  <td><input type="text" name="qtje" value="<%=qtje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">应付金额</span></td>
  <td><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">含水电部分</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">结算日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input name="button" type="button" onClick="window.open('dyjsd.jsp?jsjlh=<%=jsjlh%>')"  value="打印结算单">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function jsValue(FormName)//参数FormName:Form的名称
{
	var jsjsze=<%=(jsjsze+kghzx*zxxs-kghjx*jxxs+kkhqk+kkhpck+kyqf)%>-FormName.kkhqk.value*1.0-FormName.kkhpck.value*1.0-FormName.kyqf.value*1.0;//结算金额
	jsjsze=round(jsjsze,2);
	FormName.jsjsze.value=jsjsze;

	var jsje=FormName.jsjsze.value/100*(FormName.jsbl.value*1.0+FormName.tzjsbl.value*1.0);//结算金额
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	
	var kzbj=FormName.jsjsze.value/100*FormName.kzbjbl.value;
	kzbj=round(kzbj,2);
	FormName.kzbj.value=kzbj;

	var yfje=FormName.jsje.value*1;//实际拨款
	if ("<%=sfkclk%>"=="Y")//是否扣材料款
	{
		yfje=yfje-FormName.clf.value*1;
	}
	if ("<%=sfkgdyp%>"=="Y")//是否扣工地用品
	{
		yfje=yfje-FormName.gdyp.value*1;
	}
	if ("<%=sfkyfgf%>"=="Y")//是否扣已付工费
	{
		yfje=yfje-FormName.yfgck.value*1;
	}

	yfje=yfje-FormName.kzbj.value*1-FormName.clfk.value*1-FormName.clyf.value*1-FormName.fkje.value*1+FormName.jlje.value*1+FormName.qtje.value*1;
	yfje=round(yfje,2);
	FormName.yfje.value=yfje;

}

function f_do(FormName)//参数FormName:Form的名称
{
	jsValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}


	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "调整结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.sdlje, "水电路金额"))) {
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "水电路结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.jsje, "结算总额"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.clyf, "材料运费"))) {
		return false;
	}
	if(!(isFloat(FormName.gdyp, "工地用品"))) {
		return false;
	}

	if(!(isFloat(FormName.yfgck, "已付工程款"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "应扣质保金比例"))) {
		return false;
	}
	if(!(isFloat(FormName.clfk, "材料罚款"))) {
		return false;
	}
	if(!(isFloat(FormName.yfje, "应付金额"))) {
		return false;
	}

	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[结算日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("请输入[工程合同额]！");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "工程合同额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[工程增减项]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "工程增减项"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("请输入[其它费]！");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "其它费"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("请输入[实收款]！");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "实收款"))) {
		return false;
	}

	if(	javaTrim(FormName.khpck)=="") {
		alert("请输入[客户赔偿款]！");
		FormName.khpck.focus();
		return false;
	}
	if(!(isFloat(FormName.khpck, "客户赔偿款"))) {
		return false;
	}
	if(	javaTrim(FormName.yqf)=="") {
		alert("请输入[延期费]！");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "延期费"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyh)=="") {
		alert("请输入[结算优惠]！");
		FormName.jsyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyh, "结算优惠"))) {
		return false;
	}
	if(	javaTrim(FormName.khqk)=="") {
		alert("请输入[客户欠款]！");
		FormName.khqk.focus();
		return false;
	}
	if(!(isFloat(FormName.khqk, "客户欠款"))) {
		return false;
	}
	
	if(	javaTrim(FormName.kkhpck)=="") {
		alert("请输入[扣客户赔偿款]！");
		FormName.kkhpck.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhpck, "扣客户赔偿款"))) {
		return false;
	}
	if(	javaTrim(FormName.kyqf)=="") {
		alert("请输入[扣延期费]！");
		FormName.kyqf.focus();
		return false;
	}
	if(!(isFloat(FormName.kyqf, "扣延期费"))) {
		return false;
	}
	if(	javaTrim(FormName.kkhqk)=="") {
		alert("请输入[扣客户欠款]！");
		FormName.kkhqk.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhqk, "扣客户欠款"))) {
		return false;
	}

	if(	javaTrim(FormName.zxxs)=="") {
		alert("请输入[增项系数]！");
		FormName.zxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.zxxs, "增项系数"))) {
		return false;
	}
	
	if(	javaTrim(FormName.kghzx)=="") {
		alert("请输入[开工后增项施工成本]！");
		FormName.kghzx.focus();
		return false;
	}
	if(!(isFloat(FormName.kghzx, "开工后增项施工成本"))) {
		return false;
	}
	
	if(	javaTrim(FormName.jxxs)=="") {
		alert("请输入[减项系数]！");
		FormName.jxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.jxxs, "减项系数"))) {
		return false;
	}
	
	if(	javaTrim(FormName.kghjx)=="") {
		alert("请输入[开工后减项折后金额]！");
		FormName.kghjx.focus();
		return false;
	}
	if(!(isFloat(FormName.kghjx, "开工后减项折后金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsjsze)=="") {
		alert("请输入[结算基数总额]！");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "结算基数总额"))) {
		return false;
	}

/*
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("请选择[水电路结算方式]！");
		FormName.sdljsfs[0].focus();
		return false;
	}
*/
	if(	javaTrim(FormName.sfkclk)=="") {
		alert("请输入[是否扣材料款]！");
		FormName.sfkclk.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkgdyp)=="") {
		alert("请输入[是否扣工地用品]！");
		FormName.sfkgdyp.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkyfgf)=="") {
		alert("请输入[是否扣已付工费]！");
		FormName.sfkyfgf.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkzbj)=="") {
		alert("请输入[是否扣质保金]！");
		FormName.sfkzbj.focus();
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("请输入[罚款金额]！");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("请输入[奖励金额]！");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "奖励金额"))) {
		return false;
	}
	if(	javaTrim(FormName.qtje)=="") {
		alert("请输入[其它金额]！");
		FormName.qtje.focus();
		return false;
	}
	if(!(isFloat(FormName.qtje, "其它金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
