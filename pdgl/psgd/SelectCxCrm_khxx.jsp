<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");
String zjxm=yhmc;
if (!zwbm.equals("05"))
{
	zjxm="";
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">派施工队--查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC"> 
                客户所属分公司              </td>
              <td width="28%">
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
				</select>			  </td>
              <td width="17%" align="right"> 
              签约店面              </td>
              <td width="33%"> 
                <select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
              <td width="18%" align="right">部门小组</td>
              <td width="28%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
                  <option value=""></option>
              </select>              </td>
              <td width="19%" align="right">咨询状态</td>
              <td width="35%">
                <select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">未分配店面</option>
                  <option value="1">分配店面</option>
                  <option value="2">飞单审核未通过</option>
                  <option value="3">已签约</option>
                  <option value="4">飞单</option>
                  <option value="5">飞单审核未通过</option>
              </select>              </td>
            </tr>

            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                客户编号              </td>
              <td width="31%"> 
              <input type="text" name="khbh" size="20" maxlength="7" >              </td>
              <td width="17%" align="right"> 
              客户姓名              </td>
              <td width="33%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">所属城区</td>
              <td width="28%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cqbm')">
                  <option value=""></option>
              </select>              </td>
              <td width="17%" align="right"> 
              房屋地址              </td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                联系方式              </td>
              <td width="31%"> 
              <input type="text" name="lxfs" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"> 
              合同号              </td>
              <td width="33%"> 
                <input type="text" name="hth" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"> 
                签约日期 从              </td>
              <td width="31%"> 
              <input type="text" name="qyrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right"> 
              到              </td>
              <td width="33%"> 
                <input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                应开工日期 从              </td>
              <td width="31%"> 
              <input type="text" name="kgrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right"> 
              到              </td>
              <td width="33%"> 
                <input type="text" name="kgrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">建议交底日期 从</td>
              <td width="31%"> 
              <input type="text" name="jyjdrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="jyjdrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                设计师              </td>
              <td width="31%"> 
              <input type="text" name="sjs" size="20" maxlength="20" >              </td>
              <td width="17%" align="right" bgcolor="#FFFFFF">质检 </td>
              <td width="33%">
                <input type="text" name="zjxm" value="<%=zjxm%>" size="20" maxlength="20" <% if (!zjxm.equals("")) out.println("readonly");%>>              </td>
			  
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                回单标志              </td>
              <td width="31%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
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
              <td width="17%" align="right" bgcolor="#FFFFFF"> 
              客户类型              </td>
              <td width="33%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">派单状态</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">申请派单</option>
                  <option value="2">人工派单</option>
                  <option value="5">电子派单</option>
                  <option value="6">特权派单</option>
                  <option value="7">拒单</option>
                  <option value="8">换施工队</option>
                  <option value="4">不许修改派单</option>
                </select>              </td>
              <td width="17%" align="right" bgcolor="#FFFFFF">被派施工队</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc||'（'||dwmc||'）' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.ssfgs='"+ssfgs+"' and sq_sgd.cxbz='N' order by sq_sgd.ssfgs,sgdmc","");
	}
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">派单时间 从</td>
              <td width="31%"> 
              <input type="text" name="pdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="pdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" bgcolor="#FFFFFF" align="right">派单人</td>
              <td width="31%"> 
              <input type="text" name="pdr" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">是否拒单</td>
              <td width="33%">
                <input type="radio" name="hfjl" value="0">未拒单
                <input type="radio" name="hfjl" value="3">拒单              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">派单类型</td>
              <td width="31%"> 
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">人工派单</option>
                  <option value="1">回单奖励</option>
                  <option value="2">公司奖励</option>
                  <option value="3">设计师指定派单</option>
                  <option value="4">客户指定派单</option>
                  <option value="7">特殊情况</option>
                  <option value="8">电子派单</option>
                  <option value="9">同小区派单</option>
                </select>              </td>
              <td width="17%" align="right">是否占派单指标</td>
              <td width="33%"><%
	cf.radioToken(out, "shzzb","Y+占指标&N+不占指标","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">派单优先级 从</td>
              <td width="31%"> 
              <input type="text" name="sgdyxj" size="20" maxlength="10" >              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="sgdyxj2" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">派单说明</td>
              <td colspan="3"> 
                <input type="text" name="pdsm" size="71" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#CCFFFF">
              <td align="right">结果排序</td>
              <td colspan="3" bgcolor="#CCFFFF"> 第一列
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                    <option value="pd_pdjl.xuhao desc">派单序号</option>
                    <option value="pd_pdjl.pdsj desc">派单时间</option>
                    <option value="crm_khxx.kgsjqd desc">开工时间是否确定</option>
                    <option value="crm_khxx.jyjdrq ">建议交底日期</option>
                    <option value="crm_khxx.khbh ">客户编号</option>
                    <option value="crm_khxx.khxm">客户姓名</option>
                    <option value="crm_khxx.lxfs">联系方式</option>
                    <option value="crm_khxx.fwdz">房屋地址</option>
                    <option value="crm_khxx.sjs">设计师</option>
                    <option value="crm_khxx.sgd">施工队</option>
                    <option value="crm_khxx.zjxm">质检员</option>
                    <option value="crm_khxx.hth">合同号</option>
                    <option value="crm_khxx.gcjdbm">工程进度</option>
                    <option value="crm_khxx.qyrq desc">签约日期</option>
                    <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                    <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                    <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                    <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                    <option value="crm_khxx.dwbh">签约店面</option>
                    <option value="crm_khxx.cxhdbm">参加促销活动</option>
                    <option value="crm_khxx.jzbz">家装标志</option>
                </select>
                第二列
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                    <option value="pd_pdjl.xuhao desc">派单序号</option>
                    <option value="pd_pdjl.pdsj desc" selected>派单时间</option>
                  <option value="crm_khxx.kgsjqd desc">开工时间是否确定</option>
                  <option value="crm_khxx.jyjdrq" >建议交底日期</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
                第三列
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                    <option value="pd_pdjl.xuhao desc">派单序号</option>
                    <option value="pd_pdjl.pdsj desc">派单时间</option>
                  <option value="crm_khxx.kgsjqd desc">开工时间是否确定</option>
                  <option value="crm_khxx.jyjdrq" >建议交底日期</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">              </td>
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
var cqbmMark=0;
var sjsbhMark=0;
var fieldName="";
function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	cqbmMark=0;
	sjsbhMark=0;
	FormName.sjsbh.length=1;
	FormName.cqbm.length=1;

function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}
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
function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.zxdm.value=="")
			{
				sjsbhMark=0;
				selectform.zxdm.focus();
				alert("请首先选择【咨询店面】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.zxdm.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','（结束）') c2 from jc_cxhd where fgsbh='"+selectform.ssfgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
	else if (lx=="zxdjbm")
	{
		if (zxdjbmMark==0)
		{
			sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and ssfgs='"+selectform.ssfgs.value+"' order by cxbz,dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zxdjbmMark=1;
		}
		else{
			zxdjbmMark=2;
		}
	}
	else if (lx=="cqbm")
	{
		if (cqbmMark==0)
		{
			sql="select cqbm,cqmc from dm_cqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by cqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			cqbmMark=1;
		}
		else{
			cqbmMark=2;
		}
	}
	else if (lx=="rddqbm")
	{
		if (rddqbmMark==0)
		{
			sql="select rddqbm,rddq from dm_rddqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by rddqbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			rddqbmMark=1;
		}
		else{
			rddqbmMark=2;
		}
	}
	else if (lx=="hxwzbm")
	{
		if (hxwzbmMark==0)
		{
			sql="select hxwzbm,hxwz from dm_hxwzbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.ssfgs.value+"') order by hxwzbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			hxwzbmMark=1;
		}
		else{
			hxwzbmMark=2;
		}
	}
}

function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="bjjb")
	{
		if (bjjbMark==0)
		{
			var sql="select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			bjjbMark=1;
		}
	}
	else if (lx=="xxlybm")
	{
		if (xxlybmMark==0)
		{
			var sql="select xxlybm,xxlymc from dm_xxlybm order by xxlybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			xxlybmMark=1;
		}
	}
	else if (lx=="fwlxbm")
	{
		if (fwlxbmMark==0)
		{
			var sql="select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fwlxbmMark=1;
		}
	}
	else if (lx=="zxysbm")
	{
		if (zxysbmMark==0)
		{
			var sql="select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			zxysbmMark=1;
		}
	}
	else if (lx=="hxbm")
	{
		if (hxbmMark==0)
		{
			var sql="select hxbm,hxmc from dm_hxbm order by hxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			hxbmMark=1;
		}
	}
	else if (lx=="fgyqbm")
	{
		if (fgyqbmMark==0)
		{
			var sql="select fgflbm,fgflmc from dm_fgflbm order by fgflbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			fgyqbmMark=1;
		}
	}
	else if (lx=="sbyybm")
	{
		if (sbyybmMark==0)
		{
			var sql="select sbyybm,sbyymc from dm_sbyybm order by sbyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sbyybmMark=1;
		}
	}
	else if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
	else if (lx=="ysrbm")
	{
		if (ysrbmMark==0)
		{
			sql="select ysrbm,ysrmc from dm_ysrbm order by ysrbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ysrbmMark=1;
		}
		else{
			ysrbmMark=2;
		}
	}
	else if (lx=="nlqjbm")
	{
		if (nlqjbmMark==0)
		{
			sql="select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			nlqjbmMark=1;
		}
		else{
			nlqjbmMark=2;
		}
	}
	else if (lx=="zybm")
	{
		if (zybmMark==0)
		{
			sql="select zybm,zymc from dm_zybm order by zybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zybmMark=1;
		}
		else{
			zybmMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="bjjb")
	{
		strToSelect(selectform.bjjb,ajaxRetStr);
	}
	else if (fieldName=="xxlybm")
	{
		strToSelect(selectform.xxlybm,ajaxRetStr);
	}
	else if (fieldName=="fwlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_fwlxbm,ajaxRetStr);
	}
	else if (fieldName=="zxysbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxysbm,ajaxRetStr);
	}
	else if (fieldName=="hxbm")
	{
		strToSelect(selectform.crm_zxkhxx_hxbm,ajaxRetStr);
	}
	else if (fieldName=="fgyqbm")
	{
		strToSelect(selectform.crm_zxkhxx_fgyqbm,ajaxRetStr);
	}
	else if (fieldName=="sbyybm")
	{
		strToSelect(selectform.crm_zxkhxx_sbyybm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="ysrbm")
	{
		strToSelect(selectform.ysrbm,ajaxRetStr);
	}
	else if (fieldName=="nlqjbm")
	{
		strToSelect(selectform.nlqjbm,ajaxRetStr);
	}
	else if (fieldName=="zybm")
	{
		strToSelect(selectform.zybm,ajaxRetStr);
	}
	else if (fieldName=="zxdjbm")
	{
		strToSelect(selectform.crm_zxkhxx_zxdjbm,ajaxRetStr);
	}
	else if (fieldName=="cqbm")
	{
		strToSelect(selectform.cqbm,ajaxRetStr);
	}
	else if (fieldName=="rddqbm")
	{
		strToSelect(selectform.rddqbm,ajaxRetStr);
	}
	else if (fieldName=="hxwzbm")
	{
		strToSelect(selectform.hxwzbm,ajaxRetStr);
	}
}



function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jyjdrq2, "建议交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq2, "应开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.pdsj2, "派单时间"))) {
		return false;
	}
	if(!(isInt(FormName.sgdyxj, "派单优先级"))) {
		return false;
	}
	if(!(isInt(FormName.sgdyxj2, "派单优先级"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
 


