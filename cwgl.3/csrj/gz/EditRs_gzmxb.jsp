<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=null;
String ygbh=null;
String bianhao=null;
String yhmc=null;
String xzzwbm=null;
String zwbm=null;
String dwbh=null;
String lx=null;
String txbz=null;

double jbgz=0;
double gwgz=0;
double glgz=0;
double jtbt=0;
double dhbt=0;
double cb=0;
double buzhu=0;
double dxsf=0;
double khgz=0;
double jxfz=0;
double jxgz=0;
double khyj=0;
double bqyjze=0;
double cqts=0;
double sjts=0;
double bjts=0;
double kgts=0;
double sjkk=0;
double bjkk=0;
double cjkk=0;
double kgkk=0;
double qqkk=0;
double jbf=0;
double kbx=0;
double jf=0;
double kzbj=0;
double qtkk=0;
double yfgz=0;
double ksk=0;
double sfgz=0;

String lrr=null;
String lrsj=null;
String bz=null;
String khzq=null;
double jxgzjs=0;
double yjkhkk=0;
double cjts=0;
double jbts=0;
double sqyj=0;
double dixin=0;
double kbjf=0;
double kywx=0;

String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kywx,kbjf,ssfgs,ygbh,bianhao,yhmc,xzzwbm,zwbm,dwbh,lx,txbz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,dixin,dxsf,khgz,jxfz,jxgz,khyj,bqyjze,sqyj,cqts,sjts,bjts,kgts,sjkk,bjkk,cjkk,kgkk,qqkk,jbf,kbx,jf,kzbj,qtkk,yfgz,ksk,sfgz,lrr,lrsj,bz,khzq,jxgzjs,yjkhkk,cjts,jbts ";
	ls_sql+=" from  rs_gzmxb";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (ygbh="+whereygbh+") and  (khzq='"+wherekhzq+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kywx=rs.getDouble("kywx");
		kbjf=rs.getDouble("kbjf");
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lx=cf.fillNull(rs.getString("lx"));
		txbz=cf.fillNull(rs.getString("txbz"));

		jbgz=rs.getDouble("jbgz");
		gwgz=rs.getDouble("gwgz");
		glgz=rs.getDouble("glgz");
		jtbt=rs.getDouble("jtbt");
		dhbt=rs.getDouble("dhbt");
		cb=rs.getDouble("cb");
		buzhu=rs.getDouble("buzhu");
		dixin=rs.getDouble("dixin");
		dxsf=rs.getDouble("dxsf");

		khgz=rs.getDouble("khgz");
		jxfz=rs.getDouble("jxfz");
		jxgz=rs.getDouble("jxgz");
		khyj=rs.getDouble("khyj");
		bqyjze=rs.getDouble("bqyjze");
		sqyj=rs.getDouble("sqyj");
		cqts=rs.getDouble("cqts");
		sjts=rs.getDouble("sjts");
		bjts=rs.getDouble("bjts");
		kgts=rs.getDouble("kgts");
		sjkk=rs.getDouble("sjkk");
		bjkk=rs.getDouble("bjkk");
		cjkk=rs.getDouble("cjkk");
		kgkk=rs.getDouble("kgkk");
		qqkk=rs.getDouble("qqkk");
		jbf=rs.getDouble("jbf");
		kbx=rs.getDouble("kbx");
		jf=rs.getDouble("jf");
		kzbj=rs.getDouble("kzbj");
		qtkk=rs.getDouble("qtkk");
		yfgz=rs.getDouble("yfgz");
		ksk=rs.getDouble("ksk");
		sfgz=rs.getDouble("sfgz");

		jxgzjs=rs.getDouble("jxgzjs");
		yjkhkk=rs.getDouble("yjkhkk");
		cjts=rs.getDouble("cjts");
		jbts=rs.getDouble("jbts");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khzq=cf.fillNull(rs.getString("khzq"));
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
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_gzmxb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">考核周期</span></td>
    <td><input type="text" name="khzq" size="20" maxlength="6"  value="<%=khzq%>" readonly>    </td>
    <td align="right"><span class="STYLE1">分公司</span></td>
    <td>
	<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select>	</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">员工序号</span></td>
    <td><input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly></td>
    <td align="right"><span class="STYLE1">停薪标志</span></td>
    <td><select name="txbz" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectToken(out,"N+未停薪&Y+停薪",txbz,false);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">员工编号</span></td>
    <td><input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>    </td>
    <td align="right"><span class="STYLE1">员工姓名</span></td>
    <td><input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">行政职务</span></td>
    <td><input type="text" name="xzzwbm" size="20" maxlength="30"  value="<%=xzzwbm%>" readonly>    </td>
    <td align="right"><span class="STYLE1">工种</span></td>
    <td><select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm where zwbm='"+zwbm+"'",zwbm);
%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">所属部门</span></td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
      </select>    </td>
    <td align="right"><span class="STYLE1">类型</span></td>
    <td><select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectToken(out,"1+固定工资&2+浮动工资",lx,false);
%>
      </select>    </td>
  </tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">基本工资</td>
  <td><input type="text" name="jbgz" size="20" maxlength="17"  value="<%=jbgz%>" ></td>
  <td align="right">岗位工资</td>
  <td><input type="text" name="gwgz" size="20" maxlength="17"  value="<%=gwgz%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">工龄工资</td> 
  <td width="32%"><input type="text" name="glgz" size="20" maxlength="17"  value="<%=glgz%>" ></td>
  <td align="right" width="18%">交通补贴</td> 
  <td width="32%"><input type="text" name="jtbt" size="20" maxlength="17"  value="<%=jtbt%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">通讯补贴</td> 
  <td width="32%"><input type="text" name="dhbt" size="20" maxlength="17"  value="<%=dhbt%>" ></td>
  <td align="right" width="18%">餐饮补贴</td> 
  <td width="32%"><input type="text" name="cb" size="20" maxlength="17"  value="<%=cb%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">其它补贴</td> 
  <td width="32%"><input type="text" name="buzhu" size="20" maxlength="17"  value="<%=buzhu%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">底薪</span></td>
  <td colspan="3"><input type="text" name="dixin" size="20" maxlength="17"  value="<%=dixin%>" readonly>
    <span class="STYLE1">底薪=基本工资+岗位工资+工龄工资+交通补贴+通讯补贴+餐饮补贴+其它补贴<strong>+考核工资</strong></span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">底薪上浮</td> 
  <td width="32%"> 
    <input type="text" name="dxsf" size="20" maxlength="17"  value="<%=dxsf%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">绩效工资基数</td>
  <td><input type="text" name="jxgzjs" size="20" maxlength="17"  value="<%=jxgzjs%>" ></td>
  <td align="right">绩效分值</td>
  <td><input type="text" name="jxfz" size="20" maxlength="17"  value="<%=jxfz%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">绩效工资</td> 
  <td width="32%"><input type="text" name="jxgz" size="20" maxlength="17"  value="<%=jxgz%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">考核业绩</span></td> 
  <td width="32%"> 
    <input type="text" name="khyj" size="20" maxlength="17"  value="<%=khyj%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">本期业绩总额</span></td>
  <td><input type="text" name="bqyjze" size="20" maxlength="17"  value="<%=bqyjze%>" readonly></td>
  <td align="right"><span class="STYLE1">连续3期业绩</span></td>
  <td><input type="text" name="sqyj" size="20" maxlength="17"  value="<%=sqyj%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">业绩考核扣款</span></td>
  <td><input type="text" name="yjkhkk" size="20" maxlength="17"  value="<%=yjkhkk%>" readonly></td>
  <td align="right"><span class="STYLE1">考核工资</span></td>
  <td><input type="text" name="khgz" size="20" maxlength="17"  value="<%=khgz%>" readonly></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实际出勤天数</td> 
  <td width="32%"> 
    <input type="text" name="cqts" size="20" maxlength="9"  value="<%=cqts%>" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">事假天数</td>
  <td><input type="text" name="sjts" size="20" maxlength="9"  value="<%=sjts%>" ></td>
  <td align="right">事假扣款</td>
  <td><input type="text" name="sjkk" size="20" maxlength="17"  value="<%=sjkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">病假天数</td>
  <td><input type="text" name="bjts" size="20" maxlength="9"  value="<%=bjts%>" ></td>
  <td align="right">病假扣款</td>
  <td><input type="text" name="bjkk" size="20" maxlength="17"  value="<%=bjkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">产假天数</td>
  <td><input type="text" name="cjts" size="20" maxlength="9"  value="<%=cjts%>" ></td>
  <td align="right">产假扣款</td>
  <td><input type="text" name="cjkk" size="20" maxlength="17"  value="<%=cjkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">旷工天数</td> 
  <td width="32%"><input type="text" name="kgts" size="20" maxlength="9"  value="<%=kgts%>" ></td>
  <td align="right" width="18%">旷工扣款</td> 
  <td width="32%"><input type="text" name="kgkk" size="20" maxlength="17"  value="<%=kgkk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">缺勤扣款</span></td> 
  <td colspan="3"> 
    <input type="text" name="qqkk" size="20" maxlength="17"  value="<%=qqkk%>" readonly>
    <span class="STYLE1"> 缺勤扣款=事假扣款+病假扣款+产假扣款+旷工扣款</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">加班天数</td>
  <td><input type="text" name="jbts" size="20" maxlength="9"  value="<%=jbts%>" ></td>
  <td align="right">加班费</td>
  <td><input type="text" name="jbf" size="20" maxlength="17"  value="<%=jbf%>" ></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">扣社保</td> 
  <td width="32%"> 
    <input type="text" name="kbx" size="20" maxlength="17"  value="<%=kbx%>" >  </td>
  <td align="right" width="18%">扣意外险</td> 
  <td width="32%"><input name="kywx" type="text" id="kywx"  value="<%=kywx%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">奖罚</td>
  <td><input type="text" name="jf" size="20" maxlength="17"  value="<%=jf%>" ></td>
  <td align="right">扣保洁费</td>
  <td><input type="text" name="kbjf" size="20" maxlength="17"  value="<%=kbjf%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">其他款项</td> 
  <td width="32%"><input type="text" name="qtkk" size="20" maxlength="17"  value="<%=qtkk%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">应发工资</span></td>
  <td colspan="3"><input type="text" name="yfgz" size="20" maxlength="17"  value="<%=yfgz%>" readonly>
    <BR>
    <span class="STYLE1">应发工资=(基本工资+岗位工资+工龄工资+交通补贴+通讯补贴+餐饮补贴+其它补贴)+底薪上浮+考核工资+业绩考核扣款+缺勤扣款+加班费+扣社保+扣意外险+奖罚+扣保洁费+其他款项</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">扣质保金</td> 
  <td width="32%"> 
    <input type="text" name="kzbj" size="20" maxlength="17"  value="<%=kzbj%>" >  </td>
  <td align="right" width="18%">扣个税</td> 
  <td width="32%"><input type="text" name="ksk" size="20" maxlength="17"  value="<%=ksk%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实发工资</td> 
  <td width="32%"><input type="text" name="sfgz" size="20" maxlength="17"  value="<%=sfgz%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" ></td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
<input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.bianhao)=="") {
		alert("请输入[员工编号]！");
		FormName.bianhao.focus();
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工姓名]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.zwbm)=="") {
		alert("请输入[工种]！");
		FormName.zwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[所属部门编号]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lx)=="") {
		alert("请输入[类型]！");
		FormName.lx.focus();
		return false;
	}
	if(	javaTrim(FormName.txbz)=="") {
		alert("请输入[停薪标志]！");
		FormName.txbz.focus();
		return false;
	}
	if(	javaTrim(FormName.jbgz)=="") {
		alert("请输入[基本工资]！");
		FormName.jbgz.focus();
		return false;
	}
	if(!(isFloat(FormName.jbgz, "基本工资"))) {
		return false;
	}
	if(	javaTrim(FormName.gwgz)=="") {
		alert("请输入[岗位工资]！");
		FormName.gwgz.focus();
		return false;
	}
	if(!(isFloat(FormName.gwgz, "岗位工资"))) {
		return false;
	}
	if(	javaTrim(FormName.glgz)=="") {
		alert("请输入[工龄工资]！");
		FormName.glgz.focus();
		return false;
	}
	if(!(isFloat(FormName.glgz, "工龄工资"))) {
		return false;
	}
	if(	javaTrim(FormName.jtbt)=="") {
		alert("请输入[交通补贴]！");
		FormName.jtbt.focus();
		return false;
	}
	if(!(isFloat(FormName.jtbt, "交通补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.dhbt)=="") {
		alert("请输入[通讯补贴]！");
		FormName.dhbt.focus();
		return false;
	}
	if(!(isFloat(FormName.dhbt, "通讯补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.cb)=="") {
		alert("请输入[餐饮补贴]！");
		FormName.cb.focus();
		return false;
	}
	if(!(isFloat(FormName.cb, "餐饮补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.buzhu)=="") {
		alert("请输入[其它补贴]！");
		FormName.buzhu.focus();
		return false;
	}
	if(!(isFloat(FormName.buzhu, "其它补贴"))) {
		return false;
	}
	if(	javaTrim(FormName.dixin)=="") {
		alert("请输入[底薪]！");
		FormName.dixin.focus();
		return false;
	}
	if(!(isFloat(FormName.dixin, "底薪"))) {
		return false;
	}
	if(	javaTrim(FormName.dxsf)=="") {
		alert("请输入[底薪上浮]！");
		FormName.dxsf.focus();
		return false;
	}
	if(!(isFloat(FormName.dxsf, "底薪上浮"))) {
		return false;
	}
	if(	javaTrim(FormName.khgz)=="") {
		alert("请输入[考核工资]！");
		FormName.khgz.focus();
		return false;
	}
	if(!(isFloat(FormName.khgz, "考核工资"))) {
		return false;
	}
	if(	javaTrim(FormName.jxfz)=="") {
		alert("请输入[绩效分值]！");
		FormName.jxfz.focus();
		return false;
	}
	if(!(isFloat(FormName.jxfz, "绩效分值"))) {
		return false;
	}
	if(	javaTrim(FormName.jxgz)=="") {
		alert("请输入[绩效工资]！");
		FormName.jxgz.focus();
		return false;
	}
	if(!(isFloat(FormName.jxgz, "绩效工资"))) {
		return false;
	}
	if(	javaTrim(FormName.khyj)=="") {
		alert("请输入[考核业绩]！");
		FormName.khyj.focus();
		return false;
	}
	if(!(isFloat(FormName.khyj, "考核业绩"))) {
		return false;
	}
	if(	javaTrim(FormName.sqyj)=="") {
		alert("请输入[连续3期业绩]！");
		FormName.sqyj.focus();
		return false;
	}
	if(!(isFloat(FormName.sqyj, "连续3期业绩"))) {
		return false;
	}
	if(	javaTrim(FormName.bqyjze)=="") {
		alert("请输入[本期业绩总额]！");
		FormName.bqyjze.focus();
		return false;
	}
	if(!(isFloat(FormName.bqyjze, "本期业绩总额"))) {
		return false;
	}
	if(	javaTrim(FormName.cqts)=="") {
		alert("请输入[实际出勤天数]！");
		FormName.cqts.focus();
		return false;
	}
	if(!(isFloat(FormName.cqts, "实际出勤天数"))) {
		return false;
	}
	if(	javaTrim(FormName.sjts)=="") {
		alert("请输入[事假天数]！");
		FormName.sjts.focus();
		return false;
	}
	if(!(isFloat(FormName.sjts, "事假天数"))) {
		return false;
	}
	if(	javaTrim(FormName.bjts)=="") {
		alert("请输入[病假天数]！");
		FormName.bjts.focus();
		return false;
	}
	if(!(isFloat(FormName.bjts, "病假天数"))) {
		return false;
	}
	if(	javaTrim(FormName.kgts)=="") {
		alert("请输入[旷工天数]！");
		FormName.kgts.focus();
		return false;
	}
	if(!(isFloat(FormName.kgts, "旷工天数"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkk)=="") {
		alert("请输入[事假扣款]！");
		FormName.sjkk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjkk, "事假扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.bjkk)=="") {
		alert("请输入[病假扣款]！");
		FormName.bjkk.focus();
		return false;
	}
	if(!(isFloat(FormName.bjkk, "病假扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.cjkk)=="") {
		alert("请输入[产假扣款]！");
		FormName.cjkk.focus();
		return false;
	}
	if(!(isFloat(FormName.cjkk, "产假扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.kgkk)=="") {
		alert("请输入[旷工扣款]！");
		FormName.kgkk.focus();
		return false;
	}
	if(!(isFloat(FormName.kgkk, "旷工扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.qqkk)=="") {
		alert("请输入[缺勤扣款]！");
		FormName.qqkk.focus();
		return false;
	}
	if(!(isFloat(FormName.qqkk, "缺勤扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.jbf)=="") {
		alert("请输入[加班费]！");
		FormName.jbf.focus();
		return false;
	}
	if(!(isFloat(FormName.jbf, "加班费"))) {
		return false;
	}
	if(	javaTrim(FormName.kbx)=="") {
		alert("请输入[扣保险]！");
		FormName.kbx.focus();
		return false;
	}
	if(!(isFloat(FormName.kbx, "扣保险"))) {
		return false;
	}

	if(	javaTrim(FormName.jf)=="") {
		alert("请输入[奖罚]！");
		FormName.jf.focus();
		return false;
	}
	if(!(isFloat(FormName.jf, "奖罚"))) {
		return false;
	}

	if(	javaTrim(FormName.kzbj)=="") {
		alert("请输入[扣质保金]！");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.qtkk)=="") {
		alert("请输入[其他款项]！");
		FormName.qtkk.focus();
		return false;
	}
	if(!(isFloat(FormName.qtkk, "其他款项"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgz)=="") {
		alert("请输入[应发工资]！");
		FormName.yfgz.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgz, "应发工资"))) {
		return false;
	}
	if(	javaTrim(FormName.ksk)=="") {
		alert("请输入[扣个税]！");
		FormName.ksk.focus();
		return false;
	}
	if(!(isFloat(FormName.ksk, "扣个税"))) {
		return false;
	}
	if(	javaTrim(FormName.sfgz)=="") {
		alert("请输入[实发工资]！");
		FormName.sfgz.focus();
		return false;
	}
	if(!(isFloat(FormName.sfgz, "实发工资"))) {
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
	if(	javaTrim(FormName.khzq)=="") {
		alert("请输入[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.jxgzjs)=="") {
		alert("请输入[绩效工资基数]！");
		FormName.jxgzjs.focus();
		return false;
	}
	if(!(isFloat(FormName.jxgzjs, "绩效工资基数"))) {
		return false;
	}
	if(	javaTrim(FormName.yjkhkk)=="") {
		alert("请输入[业绩考核扣款]！");
		FormName.yjkhkk.focus();
		return false;
	}
	if(!(isFloat(FormName.yjkhkk, "业绩考核扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.cjts)=="") {
		alert("请输入[产假天数]！");
		FormName.cjts.focus();
		return false;
	}
	if(!(isFloat(FormName.cjts, "产假天数"))) {
		return false;
	}
	if(	javaTrim(FormName.jbts)=="") {
		alert("请输入[加班天数]！");
		FormName.jbts.focus();
		return false;
	}
	if(!(isFloat(FormName.jbts, "加班天数"))) {
		return false;
	}
	if(	javaTrim(FormName.kbjf)=="") {
		alert("请输入[扣保洁费]！");
		FormName.kbjf.focus();
		return false;
	}
	if(!(isFloat(FormName.kbjf, "扣保洁费"))) {
		return false;
	}
	if(	javaTrim(FormName.kywx)=="") {
		alert("请输入[扣意外险]！");
		FormName.kywx.focus();
		return false;
	}
	if(!(isFloat(FormName.kywx, "扣意外险"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
