<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String jgwzbm=null;
String tccplbbm=null;
String tcsjflbm=null;
String sfbxx=null;
String sfyxsj=null;
String jldw=null;
String sfxzsl=null;
String bzsl=null;
String sfkjm=null;
String yxjmzdsl=null;
String jmdj=null;
String sfkgh=null;
String khzdsl=null;
String ghzj=null;
String sfyqxtpp=null;
String sjsl=null;
String sjjshsl=null;
String sjjmsl=null;
String sjjmje=null;
String khbjjbbm=null;
String bjjbbm=null;
String sjsfsl=null;
String sjcj=null;
String sjsfje=null;
String sjsfycx=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherejgwzbm=cf.getParameter(request,"jgwzbm");
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

String khxm=null;
String fwdz=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,jgwzbm,bj_khzcxmxj.tcsjflbm,tcsjflmc,bj_khzcxmxj.tccplbbm,jxc_clxlbm.clxlmc,DECODE(sfbxx,'Y','是','N','否') sfbxx,DECODE(sfyxsj,'Y','收费','N','否') sfyxsj,a.bjjbmc khbjjbbm,b.bjjbmc,sjsfsl,sjcj,sjsfje,sjsfycx ,jldw,DECODE(bj_khzcxmxj.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,bzsl,DECODE(bj_khzcxmxj.sfkjm,'1','不可减免','2','可减免') sfkjm,bj_khzcxmxj.yxjmzdsl,jmdj,DECODE(sfkgh,'1','不可换','2','可换') sfkgh,khzdsl,ghzj,DECODE(sfyqxtpp,'Y','是','N','否') sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm a,bdm_bjjbbm b  ";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
    ls_sql+=" and bj_khzcxmxj.khbjjbbm=a.bjjbbm(+) and bj_khzcxmxj.bjjbbm=b.bjjbbm(+)";
	ls_sql+=" and  (bj_khzcxmxj.khbh='"+wherekhbh+"') and  (bj_khzcxmxj.jgwzbm='"+wherejgwzbm+"') and  (bj_khzcxmxj.tccplbbm="+wheretccplbbm+")  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("clxlmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflmc"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfyxsj=cf.fillNull(rs.getString("sfyxsj"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		yxjmzdsl=cf.fillNull(rs.getString("yxjmzdsl"));
		jmdj=cf.fillNull(rs.getString("jmdj"));
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		khzdsl=cf.fillNull(rs.getString("khzdsl"));
		ghzj=cf.fillNull(rs.getString("ghzj"));
		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		sjsl=cf.fillNull(rs.getString("sjsl"));
		sjjshsl=cf.fillNull(rs.getString("sjjshsl"));
		sjjmsl=cf.fillNull(rs.getString("sjjmsl"));
		sjjmje=cf.fillNull(rs.getString("sjjmje"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbmc"));
		sjsfsl=cf.fillNull(rs.getString("sjsfsl"));
		sjcj=cf.fillNull(rs.getString("sjcj"));
		sjsfje=cf.fillNull(rs.getString("sjsfje"));
		sjsfycx=cf.fillNull(rs.getString("sjsfycx"));
	}
	rs.close();
	ps.close();

	if (khbjjbbm.equals(bjjbbm))
	{
		out.println("错误！本项未升级");
		return;
	}

	String ssfgs="";
	String ysshbz="";
	ls_sql="SELECT ssfgs,ysshbz,khxm,fwdz";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//是否启用预算审核  Y：启用；N：不启用
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//报价打印是否需授权  1：不需授权；2：只需一次授权；3：每次打印都需授权
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y") && ysshbz.equals("Y") )
	//N：未申请；B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权
	{
		out.println("错误！已申请[预算审核]，不能再调折扣"+ysshbz);
		return;
	}


%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBj_khzcxmxj.jsp" name="editform">
<div align="center">修改套餐升级差价</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">客户姓名</span></td>
  <td><%=khxm%></td>
  <td align="right"><span class="STYLE2">房屋地址</span></td>
  <td><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">客户编号</span></td> 
  <td width="32%"><%=khbh%>  </td>
  <td align="right" width="18%"><span class="STYLE2">结构位置</span></td> 
  <td width="32%"><%=jgwzbm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">产品类别</span></td> 
  <td width="32%"> 
<%=tccplbbm%>  </td>
  <td align="right" width="18%"><span class="STYLE2">套餐升级分类</span></td> 
  <td width="32%"><%=tcsjflbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">是否必选项</span></td> 
  <td width="32%"><%=sfbxx%>  </td>
  <td align="right" width="18%"><span class="STYLE2">升级是否收费</span></td> 
  <td width="32%"><%=sfyxsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">计量单位</span></td> 
  <td width="32%"><%=jldw%>  </td>
  <td align="right" width="18%"><span class="STYLE2">是否限制数量</span></td> 
  <td width="32%"><%=sfxzsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">标准数量</span></td> 
  <td width="32%"><%=bzsl%> </td>
  <td align="right" width="18%"><span class="STYLE2">是否可减免</span></td> 
  <td width="32%"><%=sfkjm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">允许减免最大数量</span></td> 
  <td width="32%"><%=yxjmzdsl%>  </td>
  <td align="right" width="18%"><span class="STYLE2">减免单价</span></td> 
  <td width="32%"><%=jmdj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">是否可更换</span></td> 
  <td width="32%"><%=sfkgh%> </td>
  <td align="right" width="18%"><span class="STYLE2">可换最大数量</span></td> 
  <td width="32%"><%=khzdsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">更换折价</span></td> 
  <td width="32%"><%=ghzj%>  </td>
  <td align="right" width="18%"><span class="STYLE2">是否要求相同品牌</span></td> 
  <td width="32%"><%=sfyqxtpp%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">实际数量</span></td> 
  <td width="32%"><%=sjsl%> </td>
  <td align="right" width="18%"><span class="STYLE2">实际加损耗数量</span></td> 
  <td width="32%"><%=sjjshsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">实际减免数量</span></td> 
  <td width="32%"><%=sjjmsl%>  </td>
  <td align="right" width="18%"><span class="STYLE2">实际减免金额</span></td> 
  <td width="32%"><%=sjjmje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">客户报价级别</span></td> 
  <td width="32%"><%=khbjjbbm%>  </td>
  <td align="right" width="18%"><span class="STYLE2">升级后报价级别</span></td> 
  <td width="32%"><%=bjjbbm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFF66">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>升级是否有促销</td>
  <td colspan="3"><%
	cf.radioToken(out, "sjsfycx","1+无促销&2+无数量限制促销&3+有数量限制促销",sjsfycx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span>升级收费数量</span></td> 
  <td width="32%"> 
    <input type="text" name="sjsfsl" size="20" maxlength="17"  value="<%=sjsfsl%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>升级差价</td> 
  <td width="32%"><input type="text" name="sjcj" size="20" maxlength="17"  value="<%=sjcj%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">升级收费金额</span></td> 
  <td width="32%"><input type="text" name="sjsfje" size="20" maxlength="17"  value="<%=sjsfje%>" readonly></td>
</tr>
</table>
<BR>
已选择主材列表，如果结算价不正确，请修改
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">报价级别</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">数量</td>
	<td  width="6%">单价</td>
	<td  width="10%"><span class="STYLE2"><span class="STYLE1">*</span>结算价</span></td>
	<td  width="10%">产品编码</td>
	<td  width="14%">产品名称</td>
	<td  width="10%">品牌</td>
	<td  width="16%">型号</td>
	<td  width="16%">规格</td>
</tr>
<%
	String sxh=null;
	String bjjbmc=null;
	double sl=0;
	double dj=0;
	double jsj=0;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String gg=null;
//	String jldw=null;

	ls_sql="SELECT bj_khzcxm.sxh,bjjbmc,bj_khzcxm.sl,bj_khzcxm.dj,bj_khzcxm.jsj,bj_khzcxm.cpbm,bj_khzcxm.cpmc,bj_khzcxm.ppmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.jldw ";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_khzcxm  ";
    ls_sql+=" where bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.zclx in('1','2')";//主材类型 1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
	ls_sql+=" and  (bj_khzcxm.khbh='"+wherekhbh+"') and  (bj_khzcxm.jgwzbm='"+wherejgwzbm+"') and  (bj_khzcxm.tccplbbm="+wheretccplbbm+")  ";
    ls_sql+=" order by bj_khzcxm.cpbm,bj_khzcxm.sxh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		jsj=rs.getDouble("jsj");
		cpbm=cf.fillNull(rs.getString("cpbm"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=bjjbmc%></td>
			<td><%=jldw%></td>
			<td><%=sl%></td>
			<td><%=dj%></td>
			<td>
				<input type="hidden" name="sxh" value="<%=sxh%>">
				<input type="text" name="jsj" value="<%=jsj%>" size="11" maxlength="11" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			</td>
			<td><%=cpbm%></td>
			<td><%=cpmc%></td>
			<td><%=ppmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


%>
</table>

<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#CCCCCC" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
		<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
		<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{


	if(	!radioChecked(FormName.sjsfycx)) {
		alert("请选择[升级是否有促销]！");
		FormName.sjsfycx[0].focus();
		return false;
	}



	if(	javaTrim(FormName.sjsfsl)=="") {
		alert("请输入[升级收费数量]！");
		FormName.sjsfsl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfsl, "升级收费数量"))) {
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("请输入[升级差价]！");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "升级差价"))) {
		return false;
	}

	FormName.sjsfje.value=FormName.sjsfsl.value*FormName.sjcj.value;

	if(	javaTrim(FormName.sjsfje)=="") {
		alert("请输入[升级收费金额]！");
		FormName.sjsfje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfje, "升级收费金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
