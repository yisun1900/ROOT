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
String jsjs=null;
String jsbl=null;
String tzjsbl=null;
String sdlje=null;
String sdljsbl=null;
String jsje=null;
String clf=null;
String clyf=null;
String gdyp=null;
String yfgck=null;
String kzbjbl=null;
String clfk=null;
String yfje=null;
String jsrq=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String kzbj=null;
String htje=null;
String zjxje=null;
String qtf=null;
String qtfsm=null;
String ssk=null;
String jsjsze=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
String kzbjjs=null;
String fkje=null;
String jlje=null;
String qtje=null;

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


String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsjs,jsbl,tzjsbl,sdlje,sdljsbl,jsje,clf,clyf,gdyp,yfgck,kzbjbl,clfk,yfje,jsrq,clzt,lrr,lrsj,lrbm,bz,kzbj,htje,zjxje,qtf,qtfsm,ssk,jsjsze,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,kzbjjs,fkje,jlje,qtje ";
	ls_sql+=" from  cw_sgdwgjs";
	ls_sql+=" where  (jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsjs=cf.fillNull(rs.getString("jsjs"));
		jsbl=cf.fillNull(rs.getString("jsbl"));
		tzjsbl=cf.fillNull(rs.getString("tzjsbl"));
		sdlje=cf.fillNull(rs.getString("sdlje"));
		sdljsbl=cf.fillNull(rs.getString("sdljsbl"));
		jsje=cf.fillNull(rs.getString("jsje"));
		clf=cf.fillNull(rs.getString("clf"));
		clyf=cf.fillNull(rs.getString("clyf"));
		gdyp=cf.fillNull(rs.getString("gdyp"));
		yfgck=cf.fillNull(rs.getString("yfgck"));
		kzbjbl=cf.fillNull(rs.getString("kzbjbl"));
		clfk=cf.fillNull(rs.getString("clfk"));
		yfje=cf.fillNull(rs.getString("yfje"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		kzbj=cf.fillNull(rs.getString("kzbj"));
		htje=cf.fillNull(rs.getString("htje"));
		zjxje=cf.fillNull(rs.getString("zjxje"));
		qtf=cf.fillNull(rs.getString("qtf"));
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		ssk=cf.fillNull(rs.getString("ssk"));
		jsjsze=cf.fillNull(rs.getString("jsjsze"));
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		fkje=cf.fillNull(rs.getString("fkje"));
		jlje=cf.fillNull(rs.getString("jlje"));
		qtje=cf.fillNull(rs.getString("qtje"));
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
<title>审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgShCw_sgdwgjs.jsp" name="insertform">
<div align="center">审核</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">结算记录号</td>
	<td  width="8%">类型</td>
	<td  width="7%">结算日期</td>
	<td  width="7%">合同金额</td>
	<td  width="6%">增减项金额</td>
	<td  width="8%">结算基数</td>
	<td  width="7%">结算基数总额</td>
	<td  width="4%">结算比例</td>
	<td  width="7%">结算金额</td>
	<td  width="5%">材料费</td>
	<td  width="5%">工地用品</td>
	<td  width="7%">实际拨款</td>
	<td  width="5%">录入人</td>
	<td  width="54%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,cw_sgdzqjs.htje,cw_sgdzqjs.zjxje, DECODE(cw_sgdzqjs.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','工程施工成本价','A','工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),cw_sgdzqjs.jsjsze,cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,cw_sgdzqjs.clf,cw_sgdzqjs.gdyp,cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdzqjs.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdzqjsCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="15%" align="right"><font color="#0000FF">合同号</font> </td>
    <td width="35%"><%=hth%> </td>
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
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>
    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>
    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算基数</span></td>
    <td><select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectToken(out,"1+工程费&2+工程费＋其它费&3+实收款总额&4+一期款&5+二期款&6+三期款&7+工程基础报价&8+工程基础报价＋其它费基础报价&9+工程施工成本价&A+工程施工成本价＋其它费施工成本&B+工程成本价&C+工程成本价＋其它费成本",jsjs,false);
%>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">工程合同额</span></td>
    <td><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">工程增减项</span></td>
    <td><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">其它费</span></td>
    <td><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" >
    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">实收款</span></td>
    <td><input type="text" name="ssk" size="20" maxlength="17" value=<%=ssk%>></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE4">其它费说明</span></td>
    <td colspan="3"><input type="text" name="qtfsm" value="<%=qtfsm%>" size="72" maxlength="100" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算基数总额</span></td>
    <td><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">结算比例</span></td>
    <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" >
      % </td>
    <td align="right"><font color="#FF0000">*</font>调整结算比例</td>
    <td><input type="text" name="tzjsbl" value="<%=tzjsbl%>" size="10" maxlength="9" >
      % </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">水电路结算方式</span></td>
    <td><%
	cf.radioToken(out, "sdljsfs","1+统一比例结算&2+独立比例结算&3+不结算",sdljsfs,true);
%>
    </td>
    <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>水电路金额</span></td>
    <td><input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>水电路结算比例</span></td>
    <td><input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9" >
      % </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">结算总额</span></td>
    <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>是否扣材料款</span></td>
    <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk,true);
%></td>
    <td align="right"><font color="#FF0000">*</font>材料罚款</td>
    <td><input type="text" name="clfk" value="0" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">材料费</span></td>
    <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font>材料运费</td>
    <td><input type="text" name="clyf" value="0" size="20" maxlength="17" >
    </td>
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
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣已付工费</span></td>
    <td><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf,true);
%></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已付工程款</span></td>
    <td><input name="yfgck" type="text" id="yfgck" value="<%=yfgck%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">是否扣质保金</span></td>
    <td><%
	cf.radioToken(out, "sfkzbj","Y+是&N+否",sfkzbj,true);
%></td>
    <td align="right">扣质保金基数</td>
    <td><%
	cf.radioToken(out, "kzbjjs","1+结算基数&2+结算总额",kzbjjs,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>应扣质保金比例</td>
    <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" >
      % </td>
    <td align="right"><font color="#FF0000">*</font>扣质保金</td>
    <td><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>罚款金额</td>
    <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" ></td>
    <td align="right"><font color="#FF0000">*</font>奖励金额</td>
    <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>其它金额</td>
    <td><input type="text" name="qtje" value="<%=qtje%>" size="20" maxlength="17" ></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">应付金额</span></td>
    <td><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" ></td>
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
      </select>
    </td>
    <td align="right">结算日期</td>
    <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
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
