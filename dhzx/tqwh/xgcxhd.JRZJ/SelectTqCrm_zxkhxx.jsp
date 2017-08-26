<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_zxkhxxTqList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">客户所属分公司</div>              </td>
              <td width="31%">
				<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
				<%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
				</select>			  </td>
              <td width="18%"> 
                <div align="right">咨询店面</div>              </td>
              <td width="32%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDwbh(selectform)">
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
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">部门小组</td>
              <td width="31%"> 
				<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
			if (kfgssq.equals("3"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
%>
				</select>              </td>
              <td width="18%" align="right">信息审核标志</td>
              <td width="32%"> 
                <input type="radio" name="shbz" value="Y">
                已审核 
                <input type="radio" name="shbz" value="N">
                未审核 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">是否做电子报价</td>
              <td width="31%"> 
                <input type="radio" name="sfzdzbj" value="N">
                未做报价 
                <input type="radio" name="sfzdzbj" value="Y">
                已做 </td>
              <td width="18%" align="right">家装标志</td>
              <td width="32%"> 
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入时间 从</div>              </td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%"> 
                <div align="right">到</div>              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">客户编号</div>              </td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
              <td width="18%"> 
                <div align="right">房屋地址</div>              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">客户姓名</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_khxm2" size="10" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属城区</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">小区</td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">咨询状态</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未分配店面</option>
                  <option value="1">分配店面</option>
                  <option value="2">设计师提交飞单</option>
                  <option value="5">飞单审核未通过</option>
                </select>              </td>
              <td width="18%" align="right">付量房订金标志</td>
              <td width="32%"> 
                <select name="lfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未交量房订金</option>
                  <option value="1">已交量房订金</option>
                  <option value="2">已退订金</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">咨询登记部门</td>
              <td width="31%"> 
                <select name="crm_zxkhxx_zxdjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssfgs='"+ssfgs+"' order by dwbh","");
%> 
                </select>              </td>
              <td width="18%" align="right">信息录入人</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" value="" >              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">所属城区</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>              </td>
              <td width="18%" align="right">失败原因</td>
              <td width="32%"> 
                <select name="crm_zxkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">房屋类型</div>              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">装修预算</div>              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">户型</div>              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">套内建筑面积</div>              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_fwmj" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">风格要求</div>              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">关系客户</div>              </td>
              <td width="32%"> 
                <select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">设计师</td>
              <td width="31%"> 
                <input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>              </td>
              <td width="18%" align="right">业务员</td>
              <td width="32%"> 
                <input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否需回访</div>              </td>
              <td width="31%"><%
	cf.radioToken(out, "crm_zxkhxx_sfxhf","Y+需回访&N+不需回访","");
%> </td>
              <td width="18%"> 
                <div align="right">最新回访时间</div>              </td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">回访日期 从</td>
              <td width="31%"> 
                <input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">回单标志</div>              </td>
              <td width="31%"> 
                <select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">非回单</option>
                  <option value="3">施工队回单</option>
                  <option value="2">设计师回单</option>
                  <option value="4">老客户回单</option>
                  <option value="5">员工回单</option>
                  <option value="6">班长回单</option>
                  <option value="7">售楼处</option>
                  <option value="8">材料商</option>
                  <option value="9">其他</option>
                </select>              </td>
              <td width="18%"> 
                <div align="right">回单人</div>              </td>
              <td width="32%"> 
                <input name="hdr" type="text" value="" maxlength="20" size="20">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">有效信息标志</td>
              <td width="31%"> 
                <select name="yzxxbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <option value="Y">有效信息</option>
                  <option value="N">无效信息</option>
                </select>              </td>
              <td width="18%" align="right">参加促销活动</td>
              <td width="32%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(yhyy)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'（'||DECODE(jsbz,'N','未结束','Y','结束')||'）' c2 from jc_cxhd where fgsbh='"+ssfgs+"' order by jsbz,cxhdbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_zxkhxx.khbh desc">客户编号</option>
                  <option value="crm_zxkhxx.lrsj desc">录入时间</option>
                  <option value="crm_zxkhxx.khxm">客户姓名</option>
                  <option value="crm_zxkhxx.fwdz">房屋地址</option>
                  <option value="crm_zxkhxx.lxfs">联系方式</option>
                  <option value="crm_zxkhxx.nlqjbm">年龄区间</option>
                  <option value="crm_zxkhxx.ysrbm">月收入</option>
                  <option value="crm_zxkhxx.zybm">职业</option>
                  <option value="crm_zxkhxx.sjs">设计师</option>
                  <option value="crm_zxkhxx.jhjfsj">计划交房时间</option>
                  <option value="crm_zxkhxx.yjzxsj">预计装修时间</option>
                  <option value="crm_zxkhxx.zxzt">咨询状态</option>
                  <option value="crm_zxkhxx.zxdm">咨询店面</option>
                  <option value="crm_zxkhxx.sbyybm">失败原因</option>
                  <option value="crm_zxkhxx.ywy">业务员</option>
                  <option value="crm_zxkhxx.cqbm">所属城区</option>
                  <option value="crm_zxkhxx.xqbm">小区</option>
                  <option value="crm_zxkhxx.rddqbm">热点地区</option>
                  <option value="crm_zxkhxx.hxwzbm">环线位置</option>
                  <option value="crm_zxkhxx.cxhdbm">参加促销活动</option>
                </select>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	czlx=1;

	FormName.zxdm.length=1;
	FormName.sjsbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	czlx=2;

	FormName.sjsbh.length=1;

	if (FormName.zxdm.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+FormName.zxdm.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.crm_zxkhxx_fwmj, "套内建筑面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "最新回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
