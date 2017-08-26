<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
String jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String zcwcsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String clzt=null;
String sfycp=null;
String jdqrjg=null;
String tpsftg=null;
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));


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
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select crm_xcjdjl.clzt,crm_xcjdjl.sfycp,crm_xcjdjl.jdqrjg,crm_xcjdjl.tpsftg,khbh,sqrq,sqr,sqrlxdh,sfxtp,jhjdrq,jhjdsj,sqsm,zcwcsj,lrr,lrsj,dwmc ";
	ls_sql+=" from  crm_xcjdjl,sq_dwxx";
	ls_sql+=" where crm_xcjdjl.jdjlh='"+jdjlh+"' and crm_xcjdjl.lrbm=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		sfycp=cf.fillNull(rs.getString("sfycp"));
		jdqrjg=cf.fillNull(rs.getString("jdqrjg"));
		tpsftg=cf.fillNull(rs.getString("tpsftg"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		sqrlxdh=cf.fillNull(rs.getString("sqrlxdh"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
		jhjdrq=cf.fillNull(rs.getDate("jhjdrq"));
		jhjdsj=cf.fillNull(rs.getString("jhjdsj"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		zcwcsj=cf.fillNull(rs.getDate("zcwcsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("1"))//1：申请；2：确认；3：部分确认；4：特批完成；5：发布；6：已交底；
	{
		if (!sfycp.equals("2") || !sfxtp.equals("N"))//1：有产品、2：无产品
		{
			out.println("错误！未确认");
			return;
		}
	}
	else if (clzt.equals("2"))
	{
		if (!sfycp.equals("1") || !jdqrjg.equals("Y"))//1：有产品、2：无产品
		{
			out.println("错误！确认未通过");
			return;
		}
	}
	else if (clzt.equals("4"))
	{
		if (!sfycp.equals("2") || !sfxtp.equals("Y") || !tpsftg.equals("Y"))//1：有产品、2：无产品
		{
			out.println("错误！特批后未确认或特批未通过");
			return;
		}
	}
	else{
		out.println("错误！已发布或未确认完成");
		return;
	}



	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='店面经理' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
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
<title>发布交底时间</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #0000FF}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform"  >
<div align="center">发布交底时间（交底记录号：<%=jdjlh%>）</div>
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
    <td align="right"><font color="#0000FF">工程担当</font></td>
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
    <td align="right"><span class="STYLE2">店长及电话</span></td>
    <td><%=dmjl%>（<%=dmjldh%>）</td>
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
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">申请日期</td> 
  <td width="32%"><%=sqrq%></td>
  <td align="right" width="18%">申请人</td> 
  <td width="32%"><%=sqr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">申请人联系电话</td> 
  <td colspan="3"><%=sqrlxdh%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">计划交底日期</td> 
  <td width="32%"><%=jhjdrq%></td>
  <td align="right" width="18%">计划交底时间</td> 
  <td width="32%"><%=jhjdsj%> 
    时</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否需特批</td>
  <td><%
	cf.radioToken(out, "Y+是&N+否",sfxtp,true);
%></td>
  <td align="right">最迟完成时间</td>
  <td><%=zcwcsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">申请说明</td> 
  <td colspan="3"><%=sqsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><%=lrr%></td>
  <td align="right"><span class="STYLE2"><strong>录入时间</strong></span></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">录入部门</td>
  <td>
    <%=dwmc%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span>最终确认交底日期</td>
  <td><input type="text" name="zzqrjdrq" size="20" maxlength="10"  value="<%=jhjdrq%>" onDblClick="JSCalendar(this)">
  </td>
  <td align="right"><span class=" STYLE4">*</span>最终确认交底时间</td>
  <td><input type="text" name="zzqrjdsj" size="6" maxlength="8"  value="<%=jhjdsj%>" >
    时
    （<strong>录入小时</strong>） </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class=" STYLE4">*</span><span class="STYLE2">交底发布人</span></td>
  <td><input type="text" name="fbr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class=" STYLE4">*</span><span class="STYLE2">交底发布时间</span></td>
  <td><input type="text" name="fbsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	  <input type="button"  value="发布" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	  <input name="button" type="button" onClick="window.open('/pdgl/psgd/EditCrm_khxxMain.jsp?khbh=<%=khbh%>')"  value="派工长">
	  <input type="button" onClick="window.open('/pdgl/pgj/EditCrm_khxx.jsp?khbh=<%=khbh%>')"  value="派管家">
	  <input type="button" onClick="window.open('/pdgl/pdd/EditCrm_khxx.jsp?khbh=<%=khbh%>')"  value="派专员">
	</div>      </td>
    </tr>
  </table>

<BR>
<div align="center">交底项目明细
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">交底项目</td>
	<td  width="6%">处理状态</td>
	<td  width="11%">交底人员</td>
	<td  width="20%">交底人员电话</td>
	<td  width="48%">交底内容</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
 
	ls_sql="SELECT jdxmmc,DECODE(clzt,'1','未确认','2','同意','3','不同意'),jdry,jdrydh,jdnr ";
	ls_sql+=" FROM crm_jdxmmx,dm_jdxmbm  ";
    ls_sql+=" where crm_jdxmmx.jdxmbm=dm_jdxmbm.jdxmbm";
    ls_sql+=" and crm_jdxmmx.jdjlh='"+jdjlh+"'";
    ls_sql+=" order by crm_jdxmmx.jdxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>
<BR>
<div align="center">交底确认记录
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">交底确认次数</td>
	<td  width="15%">交底项目</td>
	<td  width="6%">是否同意</td>
	<td  width="13%">确认时间</td>
	<td  width="7%">确认人</td>
	<td  width="53%">确认说明</td>
</tr>
<%
	ls_sql="SELECT jdqrcs,jdxmmc,DECODE(sfty,'Y','同意','N','不同意','M','不需确认'),qrsj,qrr,qrsm ";
	ls_sql+=" FROM crm_jdqrjl,dm_jdxmbm  ";
    ls_sql+=" where crm_jdqrjl.jdxmbm=dm_jdxmbm.jdxmbm";
    ls_sql+=" and crm_jdqrjl.jdjlh='"+jdjlh+"'";
    ls_sql+=" order by jdqrcs,crm_jdqrjl.jdxmbm,crm_jdqrjl.qrsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setDateType ("long");

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdqrcs","1");//列参数对象加入Hash表
	spanColHash.put("jdxmmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
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
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("请输入[交底记录号]！");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.zzqrjdrq)=="") {
		alert("请输入[最终确认交底日期]！");
		FormName.zzqrjdrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.zzqrjdrq, "最终确认交底日期"))) {
		return false;
	}
	if(	javaTrim(FormName.zzqrjdsj)=="") {
		alert("请输入[最终确认交底时间]！");
		FormName.zzqrjdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.zzqrjdsj, "最终确认交底时间"))) {
		return false;
	}
	if (FormName.zzqrjdsj.value<0 || FormName.zzqrjdsj.value>24)
	{
		alert("[最终确认交底时间]只能是0到24小时之间！");
		FormName.zzqrjdsj.select();
		return false;
	}

	if(	javaTrim(FormName.fbr)=="") {
		alert("请输入[交底发布人]！");
		FormName.fbr.focus();
		return false;
	}
	if(	javaTrim(FormName.fbsj)=="") {
		alert("请输入[交底发布时间]！");
		FormName.fbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fbsj, "交底发布时间"))) {
		return false;
	}
	FormName.action="SaveFbCrm_xcjdjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
