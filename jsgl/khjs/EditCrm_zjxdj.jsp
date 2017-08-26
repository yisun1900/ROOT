<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fssj=null;
String dwbh=null;
String khbh=null;
String hth=null;
String khxm=null;
String dh=null;
String sgd=null;
String sgbz=null;
String zjxfsjd=null;
String zjxyysm=null;
double zjje=0;
String fwdz=null;
String sjs=null;
String dqbm=null;
String jzbz=null;
String jzjje=null;
String kglf=null;
String kqtk=null;

String zjxm=null;
String lxfs=null;
String qyrq=null;
double wdzgce=0;
String qye=null;
double zjxje=0;
String gckk=null;
String zjxwcbz=null;
double ljkglf=0;
double ljkqtk=0;
double zhzjxje=0;
double zkl=0;

String oldgckkspbz=null;
String newzjxxh=null;
String gcjdbm=null;
String gdjsjd="";
String sjsjsbz="";

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select crm_khxx.sjsjsbz,crm_khxx.gdjsjd,crm_khxx.gckkspbz,crm_khxx.gcjdbm,crm_khxx.zjxxh,crm_zjxdj.gckk,crm_zjxdj.zjxwcbz,crm_khxx.lxfs,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.zkl,crm_khxx.zjxje,crm_khxx.zhzjxje,crm_khxx.kglf ljkglf,crm_khxx.kqtk ljkqtk,crm_zjxdj.kqtk,jzjje,crm_zjxdj.kglf,fssj,dwbh,hth,crm_zjxdj.khbh,khxm,lxfs,sgd,sgbz,zjxfsjd,zjxyysm,zjje,fwdz,sjs,crm_khxx.jzbz";
	ls_sql+=" from  crm_zjxdj,crm_khxx";
	ls_sql+=" where  crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxdj.zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsjsbz=cf.fillNull(rs.getString("sjsjsbz"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		oldgckkspbz=cf.fillNull(rs.getString("gckkspbz"));//工程扣款审批标志
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));

		gckk=rs.getString("gckk");
		zjxwcbz=rs.getString("zjxwcbz");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getString("qye");
		zkl=rs.getDouble("zkl");
		zjxje=rs.getDouble("zjxje");
		ljkglf=rs.getDouble("ljkglf");
		ljkqtk=rs.getDouble("ljkqtk");
		zhzjxje=rs.getDouble("zhzjxje");

		lxfs=cf.fillNull(rs.getString("lxfs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));

		kqtk=cf.fillNull(rs.getString("kqtk"));
		jzjje=cf.fillNull(rs.getString("jzjje"));
		kglf=cf.fillNull(rs.getString("kglf"));
		fssj=cf.fillNull(rs.getDate("fssj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		dh=cf.fillNull(rs.getString("lxfs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxfsjd=cf.fillNull(rs.getString("zjxfsjd"));
		zjxyysm=cf.fillNull(rs.getString("zjxyysm"));
		zjje=rs.getDouble("zjje");
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		jzbz=rs.getString("jzbz");

		if (gckk.equals("0"))
		{
			gckk="";
		}
	}
	else{
		out.println("错误！增减项记录不存在");
		return;
	}
	rs.close();
	ps.close();


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	if (oldgckkspbz.equals("Y"))//N：未审批；Y：已审批
	{
		out.println("错误！工程扣款已审批，不能再修改");
		return;
	}
	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再修改");
		return;
	}
	if (!newzjxxh.equals(zjxxh))
	{
		out.println("错误！只能修改最新的增减项记录:"+newzjxxh);
		return;
	}
	if (sjsjsbz.equals("2"))//0：未结算；1：签单结算；2：完工结算
	{
		out.println("错误！设计师已结算，不能再修改");
		return;
	}
	if (gdjsjd.equals("1"))//0：未结算；1：已结算
	{
		out.println("错误！施工队已结算，不能再修改");
		return;
	}


	//获取最新电子报价++++++++++++++++
	double dzbj=0;
	//初始化
	dzbj.Dzbj getdzbj=new dzbj.Dzbj();
	//获取电子报价金额
	if (newzjxxh.equals(""))
	{
		dzbj=getdzbj.getBjje(conn,khbh,"hd");
	}
	else{
		dzbj=getdzbj.getZjxHBjje(conn,khbh,newzjxxh,"hd");
	}

	if ((int)(wdzgce+zjxje)!=(int)dzbj)
	{
		//修改：增减前报价总额、折前增减项发生额、折后增减项发生额、
		ls_sql="update crm_zjxdj set yqgcze=?";
		ls_sql+=" where  zjxxh='"+zjxxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,(wdzgce+zjxje-zjje));
		ps.executeUpdate();
		ps.close();

		out.println("<font color='#FF0033' SIZE=2px><strong>提醒！【工程原报价＋累计增减项＝"+cf.formatDouble(wdzgce+zjxje)+"】不等于【电子报价总额:"+cf.formatDouble(dzbj)+"】<BR>如果修改报价明细，则系统自动计算【增减项金额】，此时需注意【系统计算增减项金额】是否正确</strong></font>");
	}

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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">请修改增减项信息（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">合同号</font></div>
              </td>
              <td width="30%"> <%=hth%> </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="30%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td width="30%"><%=fwdz%></td>
              <td width="20%" align="right"><font color="#0000CC">质检</font></td>
              <td width="30%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">电话</font></div>
              </td>
              <td width="30%"> <%=lxfs%> </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="30%"><%=qyrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%></td>
              <td width="20%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="30%"><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">施工队</font></div>
              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,false);
%> </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="30%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">折扣</font></td>
              <td width="30%"><%=zkl%></td>
              <td align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">未打折工程额</font></td>
              <td width="30%"><%=wdzgce%></td>
              <td align="right" width="20%"><font color="#0000CC">工程签约额</font></td>
              <td width="30%"><%=qye%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000CC">折前累计工程增减项</font></td>
              <td width="30%"><%=zjxje%></td>
              <td align="right" width="20%"><font color="#0000CC">折后累计工程增减项</font></td>
              <td width="30%"><%=zhzjxje%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="20%"><font color="#0000CC">累计减项管理费</font></td>
              <td width="30%"><%=ljkglf%></td>
              <td align="right" width="20%"><font color="#0000CC">累计减项扣其它款</font></td>
              <td width="30%"><%=ljkqtk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>增减项发生阶段</td>
              <td width="30%"> 
                <select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd",zjxfsjd);
%> 
                </select>
              </td>
              <td align="right" width="20%"><font color="#FF0000">*</font>增减项发生时间</td>
              <td width="30%"> 
                <input type="text" name="fssj" value="<%=fssj%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000CC">折前增减项发生额</font></td>
              <td width="30%"> 
                <input type="hidden" name="oldzjje" value="<%=zjje%>" >
                <input type="text" name="zjje" size="10" maxlength="17"  value="<%=zjje%>" onChange="f_jzjje(editform)" readonly>
                <font color="#CC0066"><strong>增项为正，减项为负 </strong></font></td>
              <td rowspan="6" width="20%"> 
                <div align="right"><font color="#FF0000">*</font>增减项原因</div>
                <div align="right"></div>
              </td>
              <td rowspan="6" width="30%"> 
                <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <option value=""></option>
                  <%
	cf.mutilSelectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","select zjxyybm from crm_zjxyydj where zjxxh='"+zjxxh+"'");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000CC">折后增减项发生额</font></td>
              <td width="30%"> 
                <input type="text" name="jzjje" value="<%=jzjje%>" size="10" maxlength="17" readonly>
                <font color="#CC0066">增减项发生额×</font><font color="#0000CC">折扣</font> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>减项扣管理费</td>
              <td width="30%"> 
                <input type="text" name="kglf" value="<%=kglf%>" size="10" maxlength="17" >
                <font color="#CC0066"><strong>为正数</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>减项扣其它款</td>
              <td width="30%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="10" maxlength="17" >
                <font color="#CC0066"><strong>为正数</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><font color="#FF0000">*</font>增减项完成标志</td>
              <td width="30%"> 
                <input type="radio" name="zjxwcbz" value="2" checked>
                已完成
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">工程扣款</td>
              <td width="30%"> 
                <input type="text" name="gckk" size="20" maxlength="17" value="<%=gckk%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#FF0000">*</font>增减项说明</div>
              </td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="71" rows="4"><%=zjxyysm%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
                  <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)" name="bc">
                  <input type="button"  value="增加房间" onClick="f_lrfj(editform)" name="zjfj" >
                  <input type="button"  value="修改房间" onClick="f_xgfj(editform)" name="xgfj" >
                  <input type="button"  value="预览结算书" onClick="f_dybj(editform)" name="ck">
                  <input type="reset"  value="重输">
                  <P> 
                    <input type="button"  value="选择报价项目" onClick="f_xzxm(editform)" name="lr" >
                    <input type="button"  value="调项目顺序" onClick="f_xmpx(editform)">
                    <input type="button"  value="选其它收费" onClick="f_ewlr(editform)">
                    <input type="button"  value="修改其它收费" onClick="f_ewck(editform)">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jzjje(FormName)//参数FormName:Form的名称
{
	var jzjje=FormName.zjje.value*<%=zkl%>/10;
	jzjje=round(jzjje,2);
	FormName.jzjje.value=jzjje;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jzjje(FormName);

	if(	!selectChecked(FormName.zjxyybm)) {
		alert("请输入[增减项原因]！");
		FormName.zjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("请选择[增减项发生额]！");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "增减项发生额"))) {
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

	if(	javaTrim(FormName.jzjje)=="") {
		alert("请选择[折后增减项发生额]！");
		FormName.jzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.jzjje, "折后增减项发生额"))) {
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
	if(	javaTrim(FormName.zjxyysm)=="") {
		alert("请输入[增减项说明]！");
		FormName.zjxyysm.focus();
		return false;
	}

	if(!FormName.zjxwcbz.checked) {
		alert("请输入[增减项完成标志]！");
		FormName.zjxwcbz.focus();
		return false;
	}
	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.select();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}

	FormName.action="SaveEditCrm_zjxdj.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/ChooseBj_fjxx.jsp";
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

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/EditBj_fjxx.jsp";
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

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
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

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
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

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
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

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_sfxmmxList.jsp";
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

	if ("<%=jzbz%>"=="1")
	{
		winOpen("/gcgl/zjx/dzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"YES");
	}
	else{
		winOpen("/gcgl/zjx/gzdzbj/zxbjmx/TzXhBjxmList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>",900,600,'YES',"YES");
	}
}


//-->
</SCRIPT>
