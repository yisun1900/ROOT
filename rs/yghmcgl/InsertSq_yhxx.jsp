<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String bianhao="";
try {
	conn=cf.getConnection();

	//检查是否做期末结转
	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转 
	int count=cf.checkQmjz(conn,"rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("上月没有进行『结转』！");
		return;
	}
	else if (count==-1)
	{
		out.println("出错！");
		return;
	}


	String bianma=null;
	ls_sql="select bianma";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bianma=cf.fillNull(rs.getString("bianma"));
	}
	rs.close();
	ps.close();
	if (bianma.equals(""))
	{
		out.println("错误！请在单位信息表中录入『编码』");
		return;
	}

	ls_sql="select NVL(max(TO_NUMBER(substr(bianhao,4 ,4))),0)";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	bianhao=bianma+"-"+cf.addZero(count+1,4);

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">员工登记表</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>姓名</td>
      <td width="15%"> 
        <input type="text" name="yhmc" value="" 	size="15" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>性别</td>
      <td width="15%"> 
        <select name="xb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="M">男</option>
          <option value="W">女</option>
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>出生日期</td>
      <td width="15%"> 
        <input type="text" name="csrq" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>员工状态 </td>
      <td width="15%"> 
        <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="M">实习生</option>
          <option value="Y">转正</option>
          <option value="N">试用期</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">民族</td>
      <td width="15%"> 
        <input type="text" name="mz" value="" size="15" maxlength="20" >      </td>
      <td align="right" width="15%">身高(cm)</td>
      <td width="15%"> 
        <input type="text" name="sg" value="" size="15" maxlength="8" >      </td>
      <td align="right" width="15%">体重(KG)</td>
      <td width="15%"> 
        <input type="text" name="tz" value="" size="15" maxlength="8" >      </td>
      <td align="right" width="10%">血型</td>
      <td width="15%"> 
        <select name="xx" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="1">A型</option>
          <option value="2">B型</option>
          <option value="3">AB型</option>
          <option value="4">O型</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">婚姻状况</td>
      <td width="15%"> 
        <select name="hf" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="N">未婚</option>
          <option value="Y">已婚</option>
        </select>      </td>
      <td align="right" width="15%">政治面貌</td>
      <td width="15%"> 
        <select name="zzmm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="0">群众</option>
          <option value="1">中共党员</option>
          <option value="2">共青团员</option>
          <option value="3">民主党派</option>
        </select>      </td>
      <td align="right" width="15%">技术职称</td>
      <td width="15%"> 
        <select name="zcmc" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc","");
%> 
        </select>      </td>
      <td align="right" width="10%">主要资质证书</td>
      <td width="15%"> 
        <select name="zyzzzs" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>文化程度</td>
      <td width="15%"> 
        <select name="xlbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm","");
%> 
        </select>      </td>
      <td align="right" width="15%">所学专业</td>
      <td width="15%"> 
        <input type="text" name="zy" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="15%">毕业时间</td>
      <td width="15%"> 
        <input type="text" name="cjgzsj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">学位</td>
      <td width="15%"> 
        <select name="xuewei" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <option value="1">学士学位</option>
          <option value="2">硕士学位</option>
          <option value="3">博士学位</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">毕业院校</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="byyx" value="" size="50" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>是否已体检</td>
      <td width="15%"> 
        <input type="radio" name="sfytj"  value="Y">
        是 
        <input type="radio" name="sfytj"  value="N" checked>
        否 </td>
      <td align="right" width="10%">体检日期</td>
      <td width="15%"> 
        <input type="text" name="tjrq" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">现详细住址</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="zz" value="" size="50" maxlength="200" >      </td>
      <td align="right" width="15%">邮政编码</td>
      <td width="15%"> 
        <input type="text" name="yzbm" value="" size="15" maxlength="6" >      </td>
      <td align="right" width="10%">email</td>
      <td width="15%"> 
        <input type="text" name="email" value="" size="15" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>手机</td>
      <td width="15%"> 
        <input type="text" name="dh" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>办公电话</td>
      <td width="15%"> 
        <input type="text" name="bgdh" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="15%">家庭电话</td>
      <td width="15%"> 
        <input type="text" name="jtdh" value="" size="15" maxlength="50" >      </td>
      <td align="right" width="10%">电话是否公布</td>
      <td width="15%"> 
        <select name="dhsfgb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value="1">本公司</option>
          <option value="2">不限制</option>
          <option value="9">不公布</option>
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>身份证号</td>
      <td width="15%"> 
        <input type="text" name="sfzh" value="" size="15" maxlength="18" >      </td>
      <td align="right" width="15%">身份证地址</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="sfzdz" value="" size="50" maxlength="100" >      </td>
      <td align="right" width="10%">工号</td>
      <td width="15%"> 
        <input type="text" name="bianhao" value="<%=bianhao%>" size="15" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">紧急联系人</td>
      <td width="15%"> 
        <input type="text" name="jjlxr" value="" size="15" maxlength="20" >      </td>
      <td align="right" width="15%">紧急联系人住址</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="jjlxrdz" value="" size="50" maxlength="100" >      </td>
      <td align="right" width="10%">联系人电话</td>
      <td width="15%"> 
        <input type="text" name="lxrdh" value="" size="15" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">是否裙带关系</td>
      <td width="15%"> 
        <input type="radio" name="sfqs"  value="Y">
        是 
        <input type="radio" name="sfqs"  value="N" checked>
        否 </td>
      <td align="right" width="15%">序号</td>
      <td width="15%"><input name="xuhao" type="text" value="" size="15" maxlength="8" ></td>
      <td align="right" width="15%">考勤号码</td>
      <td width="15%"> 
        <input type="text" name="kqhm" value="" size="15" maxlength="8" >      </td>
      <td width="10%" align="right">设计师职称</td>
      <td width="15%"> 
        <select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">业务专长<br>
        自我评价</td>
      <td colspan="7"> 
        <textarea name="zwpj" cols="118" rows="3"></textarea>      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8"><b>*档案办理情况*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>户籍所在地</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="hjszd" value="" size="50" maxlength="100" >      </td>
      <td align="right" width="15%">档案存放地</td>
      <td colspan="3"> 
        <input type="text" name="dacfd" value="" size="46" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">档案转入时间</td>
      <td width="15%"> 
        <input type="text" name="dazrsj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">档案转出时间</td>
      <td width="15%"> 
        <input type="text" name="dazcsj" size="15" maxlength="10"  value="" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">档案转出何处</td>
      <td width="15%"> 
        <input type="text" name="dazchc" size="15" maxlength="50"  value="">      </td>
      <td align="right" width="10%">档案保管费结算</td>
      <td width="15%"><%
	cf.radioToken(out, "dabgfjs","N+未结算&Y+结算","");
%></td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td height="5" colspan="8"><b>*入职*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>所属公司</td>
      <td width="15%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:114PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>所属部门</td>
      <td width="15%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:114PX" onChange="changeDwbh(insertform)">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
        </select>      </td>
      <td align="right" width="15%">所属部门小组</td>
      <td width="15%"> 
        <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
        </select>      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>行政职务</td>
      <td width="15%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%" height="35"><span class="STYLE1">*</span>入职日期</td>
      <td width="15%" height="35"> 
        <input type="text" name="rzsj" value="<%=cf.today()%>" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%" height="35"><span class="STYLE1">*</span>入职次数</td>
      <td width="15%" height="35"> 
        <input type="text" name="rzcs" value="1" size="15" maxlength="8" >      </td>
      <td align="right" width="15%" height="35">试用截至日期</td>
      <td width="15%" height="35"> 
        <input type="text" name="syjzrq" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%" height="35">工作年限</td>
      <td width="15%" height="35"> 
        <input type="text" name="gznx" value="" size="12" maxlength="8" >
        年 </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">未工作时间</td>
      <td width="15%"> 
        <input type="text" name="wgzsj" value="" size="12" maxlength="9" >
        年 </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>是否有担保书</td>
      <td width="15%"> 
        <input type="radio" name="sfydbs"  value="Y">
        是 
        <input type="radio" name="sfydbs"  value="N" checked>
        否 </td>
      <td align="right" width="15%">岗前培训 从</td>
      <td width="15%"> 
        <input name="gqpxkssj" type="text" id="gqpxkssj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">岗前培训 到</td>
      <td width="15%"> 
        <input name="gqpxjssj" type="text" id="gqpxjssj" value="" size="15" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%" height="19">前工作单位</td>
      <td colspan="7" height="19"> 
        <input type="text" name="qgzdw" value="" size="117" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8">&nbsp;</td>
    </tr>
    
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE2">录入人</span></td>
      <td width="15%"><input type="text" name="lrr" value="<%=yhmc%>" size="15" maxlength="20" readonly></td>
      <td align="right" width="15%"><span class="STYLE2">录入时间</span></td>
      <td width="15%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="15" maxlength="10" readonly></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="15%">&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">备注</td>
      <td colspan="7"><textarea name="bz" cols="116" rows="2"></textarea></td>
    </tr>
    <tr align="center"> 
      <td colspan="8"> 
        <input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
        <input type="reset"  value="重输" name="reset">
        <input type="button" value="录入教育经历" onClick="f_lrmx(insertform,'jyjl')" name="jyjl" disabled>
        <input type="button" value="录入工作经历" onClick="f_lrmx(insertform,'gzjl')" name="gzjl" disabled>
        <input type="button" value="录入家庭资料" onClick="f_lrmx(insertform,'jtzl')" name="jtzl" disabled>
        <input type="button"  value="上传照片" onClick="f_lrmx(insertform,'sczp')" name="sczp" disabled>
        <input type="button"  value="查看照片" onClick="f_lrmx(insertform,'ckzp')" name="ckzp" disabled>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>


function changeDwbh(FormName)
{
	FormName.sjsbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F3','F4') and  cxbz='N' and ssdw='"+FormName.dwbh.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.sjsbh,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("请输入[性别]！");
		FormName.xb.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "出生日期"))) {
		return false;
	}
	if(	javaTrim(FormName.sfzszg)=="") {
		alert("请选择[员工状态 ]！");
		FormName.sfzszg.focus();
		return false;
	}
	if(	javaTrim(FormName.xlbm)=="") {
		alert("请输入[文化程度]！");
		FormName.xlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.sg, "身高(cm)"))) {
		return false;
	}
	if(!(isNumber(FormName.tz, "体重(KG)"))) {
		return false;
	}
	if(	javaTrim(FormName.hjszd)=="") {
		alert("请输入[户籍所在地]！");
		FormName.hjszd.focus();
		return false;
	}
	if(!(isDatetime(FormName.cjgzsj, "毕业时间"))) {
		return false;
	}
	if(!(isNumber(FormName.gznx, "工作年限"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfytj)) {
		alert("请选择[是否已体检]！");
		FormName.sfytj[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq, "体检日期"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfqs)) {
		alert("请选择[是否与公司其他人有亲属关系]！");
		FormName.sfqs[0].focus();
		return false;
	}

	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[手机号码]！");
		FormName.dh.focus();
		return false;
	}



	if(	javaTrim(FormName.bgdh)=="") {
		alert("请输入[办公电话]！");
		FormName.bgdh.focus();
		return false;
	}

	if(	javaTrim(FormName.dhsfgb)=="") {
		alert("请选择[电话是否公布]！");
		FormName.dhsfgb.focus();
		return false;
	}
//	if(	javaTrim(FormName.dacfd)=="") {
//		alert("请输入[档案存放地]！");
//		FormName.dacfd.focus();
//		return false;
//	}

/*
	if(	javaTrim(FormName.bianhao)=="") {
		alert("请输入[工号]！");
		FormName.bianhao.focus();
		return false;
	}
*/

	if(	javaTrim(FormName.sfzh)=="") {
		alert("请输入[身份证]！");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[身份证]错误！只能是15位或18位");
		FormName.sfzh.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[所属部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("请输入[行政职务]！");
		FormName.xzzwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("请输入[入职时间]！");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "入职时间"))) {
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
	if(	!radioChecked(FormName.sfydbs)) {
		alert("请选择[是否有担保书]！");
		FormName.sfydbs[0].focus();
		return false;
	}
//	if(	javaTrim(FormName.wgzsj)=="") {
//		alert("请输入[未工作时间(年)]！");
//		FormName.wgzsj.focus();
//		return false;
//	}
	if(!(isFloat(FormName.wgzsj, "未工作时间(年)"))) {
		return false;
	}

	if (FormName.sfzszg.value=="N")
	{
		if(	javaTrim(FormName.syjzrq)=="") {
			alert("请输入[试用截至日期]！");
			FormName.syjzrq.focus();
			return false;
		}

		if(!(isDatetime(FormName.syjzrq, "试用截至日期"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.syjzrq)!="") {
			alert("非试用员工，不能录入[试用截至日期]！");
			FormName.syjzrq.select();
			return false;
		}
	}

	if(!(isNumber(FormName.kqhm, "考勤号码"))) {
		return false;
	}
	if(	javaTrim(FormName.rzcs)=="") {
		alert("请输入[入职次数]！");
		FormName.rzcs.focus();
		return false;
	}
	if(!(isNumber(FormName.rzcs, "入职次数"))) {
		return false;
	}
	if(!(isDatetime(FormName.dazrsj, "档案转入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.dazcsj, "档案转出时间"))) {
		return false;
	}

	if(!(isInt(FormName.xuhao, "序号"))) {
		return false;
	}

	FormName.action="SaveInsertSq_yhxx.jsp";
	FormName.submit();
	FormName.jyjl.disabled=false;
	FormName.gzjl.disabled=false;
	FormName.jtzl.disabled=false;
	FormName.sczp.disabled=false;
	FormName.ckzp.disabled=false;
	return true;
}

function f_lrmx(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sfzh)=="") {
		alert("请输入[身份证]！");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[身份证]错误！只能是15位或18位");
		FormName.sfzh.focus();
		return false;
	}

	FormName.action="lrmx.jsp?lx="+lx+"&sfzh="+FormName.sfzh.value;
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

