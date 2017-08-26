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
String kkbbz=(String)session.getAttribute("kkbbz");//可拷贝
String yhjs=(String)session.getAttribute("yhjs");
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");
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
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String ssfgs=(String)session.getAttribute("ssfgs");
String khxxglsj=cf.executeQuery("select khxxglsj from sq_dwxx where dwlx='A0'");
if (khxxglsj==null)
{
	khxxglsj="";
}
else{
	khxxglsj=khxxglsj.substring(0,10);
}
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">呼叫中心－－导出客户资料</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxJyList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCFFFF"> 
              <td align="right">结果排序</td>
              <td colspan="3" bgcolor="#CCFFFF"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="crm_khxx.lrsj desc">录入时间</option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.khjl">客户经理</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.ysy">预算员</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="sq_sgd.sgdlx">施工队类型</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.khjl">客户经理</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.ysy">预算员</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="sq_sgd.sgdlx">施工队类型</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.lrsj">录入时间</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="crm_khxx.khbh ">客户编号</option>
                  <option value="crm_khxx.khxm">客户姓名</option>
                  <option value="crm_khxx.lxfs">联系方式</option>
                  <option value="crm_khxx.fwdz">房屋地址</option>
                  <option value="crm_khxx.khjl">客户经理</option>
                  <option value="crm_khxx.sjs">设计师</option>
                  <option value="crm_khxx.ysy">预算员</option>
                  <option value="crm_khxx.sgd">施工队</option>
                  <option value="sq_sgd.sgdlx">施工队类型</option>
                  <option value="crm_khxx.zjxm">质检员</option>
                  <option value="crm_khxx.hth">合同号</option>
                  <option value="crm_khxx.gcjdbm">工程进度</option>
                  <option value="crm_khxx.qyrq desc">签约日期</option>
                  <option value="crm_khxx.jgrq desc">合同竣工日期</option>
                  <option value="crm_khxx.sjkgrq desc">实际开工日期</option>
                  <option value="crm_khxx.sjjgrq desc">实际竣工日期</option>
                  <option value="crm_khxx.sjwjrq desc">实际完结日期</option>
                  <option value="crm_khxx.dwbh">签约店面</option>
                  <option value="crm_khxx.lrsj">录入时间</option>
                  <option value="DECODE(crm_khxx.gcsfyq,'1','未延期','2','延期')">工程是否延期</option>
                  <option value="crm_khxx.yqts">工程延期天数</option>
                  <option value="crm_khxx.cxhdbm">参加促销活动</option>
                  <option value="crm_khxx.jzbz">家装标志</option>
                </select>              </td>
            </tr>
            <%
			if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
			{
				%> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" >显示风格</td>
              <td colspan="3" > 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="25">              </td>
            </tr>
            <%
			}
			%> 
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询" onClick="f_do(selectform,'gccx')" name="button">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">分公司</div>              </td>
              <td width="30%">
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
				</select>			  </td> 
              <td width="20%"> 
                <div align="right">签约店面</div>              </td>
              <td width="30%"> 
                <select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
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
                </select>			  </td> 
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">部门小组</td>
              <td> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">家装标志</td>
              <td> 
                <input type="radio" name="jzbz" value="1">
                家装 
                <input type="radio" name="jzbz" value="2">
                公装 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td> 
                <div align="right">客户编号</div>              </td>
              <td> 
                <input type="text" name="crm_khxx_khbh" size="20" maxlength="7" >              </td>
              <td align="right">家装尾款全收</td>
              <td>
				  <input type="radio" name="jzwkqs" value="Y">全收
				  <input type="radio" name="jzwkqs" value="N">否			  </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td bgcolor="#E8E8FF" align="right">合同号</td>
              <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" ></td>
              <td align="right">书面合同编号</td>
              <td><input type="text" name="smhtbh" size="20" maxlength="20" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
              <td> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >              </td>
              <td align="right">客户姓名</td>
              <td> 
                <input type="text" name="crm_khxx_khxm2" size="14" maxlength="50" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right"><font color="#0000CC"><b>联系方式</b></font></td>
              <td> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="20" >              </td>
              <td align="right">联系方式</td>
              <td> 
                <input type="text" name="crm_khxx_lxfs2" size="14" maxlength="20" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
              <td> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >              </td>
              <td align="right">房屋地址</td>
              <td> 
                <input type="text" name="crm_khxx_fwdz2" size="14" maxlength="100" >
                （模糊查询） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"> 
                设计师              </td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="crm_khxx_sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>>              </td>
              <td align="right"> 
                业务员              </td>
              <td> 
                <input type="text" name="ywy"  value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客户经理</td>
              <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
              <td align="right">预算员</td>
              <td><input name="ysy" type="text" value="<%=ysy%>" size="20" maxlength="20" <% if (!ysy.equals("")) out.println("readonly");%>></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"> 
                施工队是否在职              </td>
              <td> 
                <input type="radio" name="cxbz" value="N">
                在职 
                <input type="radio" name="cxbz" value="Y">
                离职 </td>
              <td align="right"> 
                施工队类型              </td>
              <td> 
                <input type="radio" name="sgdlx" value="S0">
                非直属队 
                <input type="radio" name="sgdlx" value="S1">
                直属队 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">在职施工队</td>
              <td> 
                <select name="zzsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zzsgd')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">离职施工队</td>
              <td> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sgd')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">施工班组</td>
              <td> 
                <input type="text" name="crm_khxx_sgbz" size="20" maxlength="20" >              </td>
              <td align="right">质检姓名</td>
              <td> 
                <select name="crm_khxx_zjxm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('zjxm')">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right">工程进度</td>
              <td> 
                <select name="crm_khxx_gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%> 
                </select>              </td>
              <td align="right">身份证号码</td>
              <td> 
                <input type="text" name="sfzhm" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC"><font color="#0000CC"><b>签约日期</b></font> 
                从</td>
              <td> 
                <input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
              <td align="right">到</td>
              <td> 
                <input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td> 
                <div align="right">录入时间 从</div>              </td>
              <td> 
                <input type="text" name="crm_khxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td> 
                <div align="right">到</div>              </td>
              <td> 
                <input type="text" name="crm_khxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC"><b><font color="#0000CC">派单时间</font></b> 
                从</td>
              <td> 
                <input type="text" name="crm_khxx_pdsj" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)">              </td>
              <td align="right">到</td>
              <td> 
                <input type="text" name="crm_khxx_pdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#CCFFFF"> 
              <td align="right">关系客户</td>
              <td> 
                <select name="crm_khxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('khlxbm')">
                  <option value=""></option>
                </select>              </td>
              <td align="right">回单标志</td>
              <td> 
                <select name="crm_khxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">非回单</option>
                  <option value="2">设计师回单</option>
                  <option value="3">施工队回单</option>
                  <option value="4">老客户回单</option>
                  <option value="5">员工回单</option>
                  <option value="6">班长回单</option>
                  <option value="7">售楼处</option>
                  <option value="8">材料商</option>
                  <option value="9">其他</option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td bgcolor="#E8E8FF" align="right">派单状态</td>
              <td> 
                <select name="crm_khxx_pdclzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">未派单</option>
                  <option value="2">派单</option>
                </select>              </td>
              <td align="right">出开工证标志</td>
              <td> 
                <select name="kgzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未出开工证</option>
                  <option value="Y">已出开工证</option>
                </select>              </td>
            </tr>
          </table>

          <table width="100%" border="0" style="FONT-SIZE:12;display:block" id="id1" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">所属城区</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('cqbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" bgcolor="#E8E8FF" width="20%">小区/街道</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <input type="text" name="xqbm" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">所属热点地区</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('rddqbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" bgcolor="#E8E8FF" width="20%">所属环线位置</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('hxwzbm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">月收入</td>
              <td bgcolor="#E8E8FF" width="30%"> 
                <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ysrbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" bgcolor="#E8E8FF" width="20%">&nbsp;</td>
              <td bgcolor="#E8E8FF" width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">年龄区间</td>
              <td width="30%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('nlqjbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" width="20%">职业</td>
              <td width="30%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zybm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">房屋面积 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwmj" size="20" maxlength="8" >
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_fwmj2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">工程签约额 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qye" size="20" maxlength="17" >
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_qye2" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td bgcolor="#FFFFCC" width="20%"> 
                <div align="right">合同开工日期 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td width="20%"> 
                <div align="right">到</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_kgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">实际开工日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">合同竣工日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_jgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFFF" width="20%">实际竣工日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjjgrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="crm_khxx_sjjgrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">实完结日期 从</td>
              <td width="30%"> 
                <input type="text" name="sjwjrq" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="sjwjrq2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">完工标志</td>
              <td width="30%"> 
                <select name="crm_khxx_wgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">未开工</option>
                  <option value="2">已开工</option>
                  <option value="3">已完工</option>
                </select>
              </td>
              <td align="right" width="20%">完结标志</td>
              <td width="30%"> 
                <select name="crm_khxx_wjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">未完结</option>
                  <option value="2">已完结</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">隐蔽工程验收进度</td>
              <td width="30%"> 
                <select name="ybysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('ybysxmbm')">
                  <option value=""></option>
                </select>
              </td>
              <td align="right" width="20%">中期验收进度</td>
              <td width="30%"> 
                <select name="zqysxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zqysxmbm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">停工标志</td>
              <td width="30%"> 
                <select name="tgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="W">正常</option>
                  <option value="Y">已停工</option>
                  <option value="N">停工已复工</option>
                </select>
              </td>
              <td align="right" width="20%">客户类型</td>
              <td width="30%"> 
                <select name="crm_khxx_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="2">家装客户</option>
                  <option value="3">退单客户</option>
                  <option value="4">非家装客户</option>
                  <option value="5">设计客户</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">投诉标志</td>
              <td width="30%"> 
                <input type="radio" name="tsbz" value="Y">
                有投诉 
                <input type="radio" name="tsbz" value="N">
                无投诉 </td>
              <td align="right" width="20%">报修标志</td>
              <td width="30%"> 
                <input type="radio" name="bxbz" value="Y">
                有报修 
                <input type="radio" name="bxbz" value="N">
                无报修 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">工程是否延期</td>
              <td width="30%"> 
                <input type="radio" name="gcsfyq" value="1">
                未延期 
                <input type="radio" name="gcsfyq" value="2">
                延期 </td>
              <td align="right" width="20%">工程延期原因</td>
              <td width="30%"> 
                <select name="gcyqyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('gcyqyybm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFFF" width="20%">总延期天数 从</td>
              <td width="30%"> 
                <input type="text" name="yqts" value="" size="20" maxlength="10" >
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="yqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">某项原因延期天数 从</td>
              <td width="30%"> 
                <input type="text" name="yyyqts" value="" size="20" maxlength="10" >
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="yyyqts2" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">水质分析卡是否发放</td>
              <td width="30%"> 
                <input type="radio" name="sffk" value="Y">
                发卡 
                <input type="radio" name="sffk" value="N">
                未发卡 </td>
              <td align="right" width="20%">登记卡号</td>
              <td width="30%"> 
                <input type="text" name="djkh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td align="right" width="20%">发卡日期 从</td>
              <td width="30%"> 
                <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="fkrq2" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">是否返券</td>
              <td width="30%"> 
                <input type="radio" name="sffj"  value="Y">
                是 
                <input type="radio" name="sffj"  value="N" >
                否 </td>
              <td align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">是否已认证</td>
              <td width="30%"> 
                <input type="radio" name="sfyrz"  value="Y">
                是 
                <input type="radio" name="sfyrz"  value="N" >
                否 </td>
              <td align="right" width="20%">认证市场</td>
              <td width="30%"> 
                <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('rzsc')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">是否已上保险</td>
              <td width="30%"> 
                <input type="radio" name="sfysbx" value="1">
                未上保险 
                <input type="radio" name="sfysbx" value="2">
                已保险 </td>
              <td align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">保修开始时间 从</td>
              <td width="30%"> 
                <input type="text" name="bxkssj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="bxkssj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">保修截止时间 从</td>
              <td width="30%"> 
                <input type="text" name="bxjzsj" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="bxjzsj2" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">订购产品类型</td>
              <td width="30%"> 
                <select name="jcjjcp" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="zclbMark=0;sq_gysxx_zclb.length=1;gysmcMark=0;gysmc.length=1;jcddztMark=0;jcddzt.length=1;">
                  <option value=""></option>
                  <option value="1">木门</option>
                  <option value="2">橱柜</option>
                  <option value="3">家具</option>
                  <option value="4">主材</option>
                  <option value="5">全部</option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">主材类别</td>
              <td width="30%"> 
                <select name="sq_gysxx_zclb" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('zclb')" onChange="gysmcMark=0;gysmc.length=1;">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">工厂/品牌</td>
              <td width="30%"> 
                <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('gysmc')">
                  <option value=""></option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">工厂/品牌</td>
              <td width="30%"> 
                <input type="text" name="gysmc2" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">集成订单/合同日期 从</td>
              <td width="30%"> 
                <input type="text" name="ddrq" size="20" maxlength="10" value=""  onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="20%">到</td>
              <td width="30%"> 
                <input type="text" name="ddrq2" size="20" maxlength="10"  onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">订单状态</td>
              <td width="30%"> 
                <select name="jcddzt" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('jcddzt')">
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">项目专员</td>
              <td width="30%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('xmzy')">
                  <option value=""></option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">家居设计师</td>
              <td width="30%"> 
                <input type="text" name="jjsjs" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">项目专员是否已联系</td>
              <td width="30%"> 
                <select name="sfylx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="N">未联系</option>
                  <option value="Y">已联系</option>
                </select>
              </td>
              <td bgcolor="#E8E8FF" align="right" width="20%">客户接受联系方式</td>
              <td width="30%"> 
                <select name="jslxfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">电话联系</option>
                  <option value="2">发短信</option>
                  <option value="3">不受限制</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">参加促销活动</td>
              <td colspan="3"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:512PX" onclick="getThis('cxhdbm')">
                  <option value=""></option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khxxglsj" value="<%=khxxglsj%>" >
                <input type="button"  value="查询" onClick="f_do(selectform,'gccx')" >
              <input type="reset"  value="重输" name="reset"></td>
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



var sjsbhMark=0;
var zjxmMark=0;
var rzscMark=0;
var cqbmMark=0;
var rddqbmMark=0;
var hxwzbmMark=0;
var ysrbmMark=0;
var nlqjbmMark=0;
var zybmMark=0;
var xmzyMark=0;

var cxhdbmMark=0;
var zzsgdMark=0;
var sgdMark=0;
var zjxmMark=0;
var khlxbmMark=0;
var ybysxmbmMark=0;
var zqysxmbmMark=0;
var gcyqyybmMark=0;

var zclbMark=0;
var gysmcMark=0;
var jcddztMark=0;

var fieldName="";


function changeFgs(FormName) 
{
	FormName.crm_khxx_dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sjsbhMark=0;
	zjxmMark=0;
	rzscMark=0;
	cqbmMark=0;
	rddqbmMark=0;
	hxwzbmMark=0;
	xmzyMark=0;

	cxhdbmMark=0;
	zzsgdMark=0;
	sgdMark=0;
	zjxmMark=0;

	gysmcMark=0;

	FormName.sjsbh.length=1;
	FormName.xmzy.length=1;
	FormName.rzsc.length=1;
	FormName.crm_khxx_cqbm.length=1;
	FormName.rddqbm.length=1;
	FormName.hxwzbm.length=1;

	FormName.cxhdbm.length=1;
	FormName.zzsgd.length=1;
	FormName.crm_khxx_sgd.length=1;
	FormName.crm_khxx_zjxm.length=1;


	FormName.gysmc.length=1;


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


function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.crm_khxx_dwbh.value=="")
			{
				sjsbhMark=0;
				selectform.crm_khxx_dwbh.focus();
				alert("请首先选择【签约店面】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.crm_khxx_dwbh.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="xmzy")
	{
		if (xmzyMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" order by yhmc";

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

//			window.open(actionStr);
			openAjax(actionStr);
			xmzyMark=1;
		}
		else{
			xmzyMark=2;
		}
	}
	else if (lx=="rzsc")
	{
		if (rzscMark==0)
		{
			sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+selectform.fgs.value+"' and cxbz='N' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			rzscMark=1;
		}
		else{
			rzscMark=2;
		}
	}
	else if (lx=="cqbm")
	{
		if (cqbmMark==0)
		{
			sql="select cqbm,cqmc from dm_cqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.fgs.value+"') order by cqbm";
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
			sql="select rddqbm,rddq from dm_rddqbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.fgs.value+"') order by rddqbm";
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
			sql="select hxwzbm,hxwz from dm_hxwzbm where dqbm=(select dqbm from sq_dwxx where dwbh='"+selectform.fgs.value+"') order by hxwzbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			hxwzbmMark=1;
		}
		else{
			hxwzbmMark=2;
		}
	}

	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','（结束）') c2 from jc_cxhd where fgsbh='"+selectform.fgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
	else if (lx=="zzsgd")
	{
		if (zzsgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='N' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zzsgdMark=1;
		}
		else{
			zzsgdMark=2;
		}
	}
	else if (lx=="sgd")
	{
		if (sgdMark==0)
		{
			sql="select sgd,sgdmc||'（'||DECODE(sq_sgd.sgdlx,'S0','非直属','S1','直属')||'）' from sq_sgd where ssfgs='"+selectform.fgs.value+"' and cxbz='Y' order by sgdlx desc,sgdmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			sgdMark=1;
		}
		else{
			sgdMark=2;
		}
	}
	else if (lx=="zjxm")
	{
		if (zjxmMark==0)
		{
			sql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2  ";
			sql+=" from sq_yhxx,sq_sqfgs ";
			sql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+selectform.fgs.value+"' ";
			sql+=" and sq_yhxx.zwbm='05' and sq_yhxx.sfzszg in('Y','N') ";
			sql+=" order by yhmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zjxmMark=1;
		}
		else{
			zjxmMark=2;
		}
	}
	else if (lx=="gysmc")
	{
		if (gysmcMark==0)
		{
			if (selectform.jcjjcp.value=="")
			{
				gysmcMark=0;
				selectform.jcjjcp.focus();
				alert("请首先选择【订购产品类型】");
				return;
			}

			if (selectform.jcjjcp.value=="4")
			{
				if (selectform.sq_gysxx_zclb.value=="")
				{
					gysmcMark=0;
					selectform.sq_gysxx_zclb.focus();
					alert("请选择【主材类别】");
					return;
				}

				sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.dqbm=sq_ppgyssqfgs.dqbm and sq_gysxx.gysmc=sq_ppgyssqfgs.gysmc and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='"+selectform.jcjjcp.value+"' and sq_gysxx.zclb='"+selectform.sq_gysxx_zclb.value+"' order by sq_gysxx.gysmc";
			}
			else{
				sql="select sq_gysxx.gysmc from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.dqbm=sq_ppgyssqfgs.dqbm and sq_gysxx.gysmc=sq_ppgyssqfgs.gysmc and sq_ppgyssqfgs.ssfgs='"+selectform.fgs.value+"' and sq_gysxx.gyslb='"+selectform.jcjjcp.value+"' order by sq_gysxx.gysmc";
			}

			var actionStr="/ajax/getstr.jsp?sql="+sql;
//			window.open(actionStr);

			openAjax(actionStr);
			gysmcMark=1;
		}
		else{
			gysmcMark=2;
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
//			window.open(actionStr);

			openAjax(actionStr);
			zybmMark=1;
		}
		else{
			zybmMark=2;
		}
	}
	else if (lx=="ybysxmbm")
	{
		if (ybysxmbmMark==0)
		{
			sql="select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='3' order by gcjdbm,gcyszxmbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			ybysxmbmMark=1;
		}
		else{
			ybysxmbmMark=2;
		}
	}
	else if (lx=="zqysxmbm")
	{
		if (zqysxmbmMark==0)
		{
			sql="select gcyszxmbm,gcyszxmmc from dm_gcyszxmbm where gcjdbm='4' order by gcjdbm,gcyszxmbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zqysxmbmMark=1;
		}
		else{
			zqysxmbmMark=2;
		}
	}
	else if (lx=="gcyqyybm")
	{
		if (gcyqyybmMark==0)
		{
			sql="select gcyqyybm,gcyqyymc from dm_gcyqyybm order by gcyqyybm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			gcyqyybmMark=1;
		}
		else{
			gcyqyybmMark=2;
		}
	}
	else if (lx=="zclb")
	{
		if (zclbMark==0)
		{
			if (selectform.jcjjcp.value!="4")
			{
				zclbMark=0;
				selectform.jcjjcp.focus();
				alert("请选择【订购产品类型】为主材");
				return;
			}

			sql="select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlmc";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			zclbMark=1;
		}
		else{
			zclbMark=2;
		}
	}
	else if (lx=="jcddzt")
	{
		if (jcddztMark==0)
		{
			if (selectform.jcjjcp.value=="")
			{
				jcddztMark=0;
				selectform.jcjjcp.focus();
				alert("请首先选择【订购产品类型】");
				return;
			}

			if (selectform.jcjjcp.value=="1")
			{
				sql="select clzt,clztmc from jdm_mmyddzt order by clzt";
			}
			else if (selectform.jcjjcp.value=="2")
			{
				sql="select clzt,clztmc from jdm_cgddzt order by clzt";
			}
			else if (selectform.jcjjcp.value=="3")
			{
				sql="select clzt,clztmc from jdm_jjddzt order by clzt";
			}
			else if (selectform.jcjjcp.value=="4")
			{
				sql="select clzt,clztmc from jdm_zcddzt order by clzt";
			}

			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			jcddztMark=1;
		}
		else{
			jcddztMark=2;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.crm_khxx_dwbh,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="xmzy")
	{
		strToSelect(selectform.xmzy,ajaxRetStr);
	}
	else if (fieldName=="rzsc")
	{
		strToSelect(selectform.rzsc,ajaxRetStr);
	}
	else if (fieldName=="cqbm")
	{
		strToSelect(selectform.crm_khxx_cqbm,ajaxRetStr);
	}
	else if (fieldName=="rddqbm")
	{
		strToSelect(selectform.rddqbm,ajaxRetStr);
	}
	else if (fieldName=="hxwzbm")
	{
		strToSelect(selectform.hxwzbm,ajaxRetStr);
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


	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="zzsgd")
	{
		strToSelect(selectform.zzsgd,ajaxRetStr);
	}
	else if (fieldName=="sgd")
	{
		strToSelect(selectform.crm_khxx_sgd,ajaxRetStr);
	}
	else if (fieldName=="zjxm")
	{
		strToSelect(selectform.crm_khxx_zjxm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_khxx_khlxbm,ajaxRetStr);
	}
	else if (fieldName=="ybysxmbm")
	{
		strToSelect(selectform.ybysxmbm,ajaxRetStr);
	}
	else if (fieldName=="zqysxmbm")
	{
		strToSelect(selectform.zqysxmbm,ajaxRetStr);
	}
	else if (fieldName=="gcyqyybm")
	{
		strToSelect(selectform.gcyqyybm,ajaxRetStr);
	}
	else if (fieldName=="zclb")
	{
		strToSelect(selectform.sq_gysxx_zclb,ajaxRetStr);
	}
	else if (fieldName=="gysmc")
	{
		strToItem2(selectform.gysmc,ajaxRetStr);
	}
	else if (fieldName=="jcddzt")
	{
		strToSelect(selectform.jcddzt,ajaxRetStr);
	}

}



function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.crm_khxx_fwmj, "房屋面积"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_khxx_fwmj2, "房屋面积"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye, "工程签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_khxx_qye2, "工程签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_pdsj2, "派单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq, "订单合同日期 "))) {
		return false;
	}
	if(!(isDatetime(FormName.ddrq2, "订单合同日期 "))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_khxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_lrsj2, "录入时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_khxx_kgrq, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_kgrq2, "合同开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_jgrq2, "合同竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjjgrq2, "实际竣工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "实际完结日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "实际完结日期"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts, "延期天数"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts2, "延期天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.fkrq2, "发卡日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxkssj, "保修开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxkssj2, "保修开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj, "保修截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxjzsj2, "保修截止时间"))) {
		return false;
	}

	FormName.action="Crm_khxxCxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
