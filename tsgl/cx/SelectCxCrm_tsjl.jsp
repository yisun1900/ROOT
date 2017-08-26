<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String tsxlstr=cf.getItemData("select tsxlbm,tsxlmc,tslxbm from dm_tsxlbm order by tslxbm,tsxlbm");
	String tsyystr=cf.getItemData("select tsyybm,tsyymc,tsxlbm from dm_tsyybm order by tsxlbm,tsyybm");

	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<div align="center">查询投诉报修记录
</div>
<table width="100%">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                分公司              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
				%> 
				</select>              
			  </td> 
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                签约店面              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%> 
                </select>
			  </td> 
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">合同号</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="hth" size="20" maxlength="20">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">客户编号</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="khbh" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC">设计师</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="sjs" size="20" maxlength="20">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">质检</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="zjxm" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="khxm" size="20" maxlength="50">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">客户姓名</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                <font color="#0000CC"><b>联系方式</b></font>              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="lxfs" size="20" maxlength="50">
              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                联系方式              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="lxfs2" size="14" maxlength="50">
                （模糊查询） </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <input type="text" name="fwdz" size="71" maxlength="100">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFCC"> 
                房屋地址              </td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <input type="text" name="fwdz2" size="65" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                投诉记录号              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_tsjlh" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                类型              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="radio" name="crm_tsjl_lx" value="1">
                投诉 
                <input type="radio" name="crm_tsjl_lx" value="2">
                报修 </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">责任部门</td>
              <td width="31%"> 
                <select name="crm_tsbm_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
		cf.selectItem(out,sql,"");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="18%" align="right">责任部门处理情况</td>
              <td width="32%"> 
                <select name="crm_tsbm_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">未处理</option>
                  <option value="2">在处理</option>
                  <option value="3">已解决</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"> 
                结案状态              </td>
              <td width="31%"> 
                <select name="crm_tsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未受理</option>
                  <option value="1">已受理</option>
                  <option value="2">在处理</option>
                  <option value="3">结案</option>
                  <option value="9">不立案</option>
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr>
              <td width="19%" bgcolor="#E8E8FF" align="right"><b><font color="#0000CC">投诉报修品牌</font></b></td>
              <td width="31%" bgcolor="#E8E8FF">
                <input type="text" name="crm_tsbm_tspp" size="20" maxlength="50" >
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">投诉报修品牌</td>
              <td width="32%" bgcolor="#E8E8FF">
                <input type="text" name="crm_tsbm_tspp2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                严重程度              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                投诉来源              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                是否需回访              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+需回访&N+不需回访","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">              </td>
              <td width="32%" bgcolor="#E8E8FF"> </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                需回访时间 从              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                到              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">客户要求解决时间 从</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_yqjjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">到</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_yqjjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">客服受理时间 从</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">到</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                客服受理人              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_slr" size="20" maxlength="16" >
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF">              </td>
              <td width="32%" bgcolor="#E8E8FF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">录入人</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">录入部门</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <select name="crm_tsjl_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">录入时间 从</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">到</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF">结案时间 从</td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_jasj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" bgcolor="#E8E8FF" align="right">到</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="crm_tsjl_jasj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#E8E8FF"> 
                是否分配施工队              </td>
              <td width="31%" bgcolor="#E8E8FF"> 
                <select name="sffpsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未分配</option>
                  <option value="Y">已分配</option>
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"> 
                维修施工队              </td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="wxsgd" size="20" maxlength="30" >
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                投诉报修大类              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsbm_tslxbm,crm_tsbm_tsxlbm,<%=tsxlstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                投诉报修小类              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(crm_tsbm_tsxlbm,crm_tsbm_tsyybm,<%=tsyystr%>)">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm order by tsxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                投诉报修原因              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm order by tsyybm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">              </td>
              <td width="32%" bgcolor="#CCCCFF">&nbsp; </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                客服回访结果              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="hfjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                是否及时联系              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_sfjslx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+及时联系&N+未及时联系&W+情况未知","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                结案客户是否满意              </td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_zzjgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                解决问题及时性              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="crm_tsbm_jsxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF">排序标准</td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="crm_khxx.khbh">客户姓名</option>
                  <option value="crm_tsjl.yzcdbm desc">严重程度</option>
                  <option value="crm_tsbm.tspp">投诉报修品牌</option>
                  <option value="crm_tsjl.lrsj desc" selected>录入时间</option>
                  <option value="crm_tsjl.slsj desc">客服受理时间</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="32%" bgcolor="#FFFFFF">&nbsp; </td>
            </tr>
            <tr> 
              <td align="right" width="19%" bgcolor="#FFFFFF" >显示风格</td>
              <td colspan="3" bgcolor="#FFFFFF" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
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
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj, "客户要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_yqjjsj2, "客户要求解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj, "需回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_hfsj2, "需回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_slsj2, "客服受理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj, "结案时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsjl_jasj2, "结案时间"))) {
		return false;
	}

	FormName.action="Crm_tsjlCxList.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
