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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">查询结转明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询员工花名册" onClick="f_do(selectform,'cxhmc')">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">分公司</td>
              <td width="31%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,rs_yhxxqmjz_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
              <td width="19%" align="right">所属单位</td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">员工状态</td>
              <td width="31%"> 
                <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="M">实习生</option>
                  <option value="Y">转正</option>
                  <option value="N">试用期</option>
                  <option value="S">辞职</option>
                  <option value="T">辞退</option>
                </select>
              </td>
              <td width="19%" align="right">是否离职</td>
              <td width="31%"> 
                <input type="radio" name="sflz" value="1" checked>
                员工 
                <input type="radio" name="sflz" value="2">
                离职 
                <input type="radio" name="sflz" value="3">
                实习生 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">兼职部门</td>
              <td width="31%"> 
                <select name="jzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh  and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.ssfgs,a.dwlx,a.dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select a.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.ssfgs='"+ssfgs+"' and a.dwlx in('A0','A1','F0','F1','F2') and  a.cxbz='N' order by a.dwlx,a.dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
              <td width="19%" align="right">电话是否公布</td>
              <td width="31%"><%
	cf.radioToken(out, "dhsfgb","1+本公司内&2+不受限制&9+不公布","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">序号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_ygbh" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">员工名称</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_bianhao" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">用户登录名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_yhdlm" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">劳动合同编号</td>
              <td width="31%"> 
                <input type="text" name="ldhtbh" value="" size="20" maxlength="14">
              </td>
              <td align="right" width="19%"><b>结转日期</b></td>
              <td width="31%">
                <input type="text" name="jzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">劳动合同类型</td>
              <td width="31%"> 
                <select name="ldhtlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ldhtlx c1,ldhtlx c2 from dm_ldhtlx order by ldhtlxbm","");
%> 
                </select>
              </td>
              <td align="right" width="19%"><font color="#000099"></font>劳动合同期限</td>
              <td width="31%"> 
                <select name="ldhtqx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ldhtqx c1,ldhtqx c2  from dm_ldhtqx order by ldhtqxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">合同开始日期 从</td>
              <td width="31%"> 
                <input type="text" name="htksrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="19%">到</td>
              <td width="31%"> 
                <input type="text" name="htksrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">合同到期日期 从</td>
              <td width="31%"> 
                <input type="text" name="htdqrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="19%">到</td>
              <td width="31%"> 
                <input type="text" name="htdqrq2" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">用户角色</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A0+总部&A1+总部部门&F0+分公司&F1+分公司部门&F2+分公司店面&F3+设计室&G0+供应商&J0+加盟商","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">住址</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_zz" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">所属设计室</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_sjsbh" size="20" maxlength="5" >
              </td>
              <td width="19%"> 
                <div align="right">可登陆系统标志</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_kdlxtbz","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">性别</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_xb","M+男&W+女","");
%> </td>
              <td width="19%"> 
                <div align="right"> 婚否 </div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_hf","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">出生日期从</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_csrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_csrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">民族</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_mz" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">身份证号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_sfzh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">手机</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_dh" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">email</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">行政职务</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">职务分类</div>
              </td>
              <td width="31%"> 
                <select name="zwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwflbm,zwflmc from dm_zwflbm order by zwflbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">工种</td>
              <td width="31%"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm","");
%> 
                </select>
              </td>
              <td width="19%" align="right">学历</td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_xlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">户籍所在地</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_hjszd" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">档案存放地</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_dacfd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">毕业院校</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_byyx" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">专业</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_zy" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">入职日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_rzsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_rzsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">离职日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_lzrq" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_lzrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">与公司人员有亲属关系</td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_sfqs","Y+是&N+否","");
%></td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否参加保险</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sfcjbx","Y+参保&N+未办理&T+停保&Z+转出","");
%> </td>
              <td width="19%"> 
                <div align="right">是否缴纳医疗保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_ylbx","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否缴纳养老保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_jylbx","Y+是&N+否","");
%> </td>
              <td width="19%"> 
                <div align="right">是否缴纳失业保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_sybx","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否缴纳工伤保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_gsby","Y+是&N+否","");
%> </td>
              <td width="19%"> 
                <div align="right">是否缴纳生育保险</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "rs_yhxxqmjz_syx","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" bgcolor="#FFFFFF" align="right">社保办理时间 从</td>
              <td width="31%">
                <input type="text" name="sbblsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%">
                <input type="text" name="sbblsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">社会保险号</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_shbxh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">缴保险地点</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jbxdd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">紧急联系人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jjlxr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">急联系人手机</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_lxrdh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">允许查看价格明细</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_ckjgbz","Y+可看&N+不可","");
%> </td>
              <td width="19%"> 
                <div align="right">重点用户标志</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_zdyhbz","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">允许折扣率</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_zkl" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">报价级别</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A+普通&B+普通、精品&C+乐华梅兰&D+普通、精品、乐华梅兰&E+精品、乐华梅兰","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工龄工资</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_glgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">岗位工资</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_gwgz" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">基本工资</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jbgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">设计师职称</div>
              </td>
              <td width="31%"> 
                <select name="rs_yhxxqmjz_sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">交纳基数</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_yjsxe" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">交通补贴</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_jtbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">每日餐补</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_cb" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">手机补贴</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_dhbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否有担保书</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_sfydbs","Y+是&N+否","");
%> </td>
              <td width="19%"> 
                <div align="right">是否已体检</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "rs_yhxxqmjz_sfytj","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">体检日期 从</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_tjrq" size="20" maxlength="10" >
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_tjrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">毕业时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_cjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="rs_yhxxqmjz_cjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right">工资类别</td>
              <td width="31%"> 
                <input type="radio" name="gzlb"  value="1">
                固定工资 
                <input type="radio" name="gzlb"  value="2" >
                浮动工资</td>
              <td width="19%" align="right">考勤号码</td>
              <td width="31%"> 
                <input type="text" name="kqhm" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">录入时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">查询结果排序</td>
              <td colspan="3"> 第一列 
                <select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value="rs_yhxxqmjz.dwbh">所属单位</option>
                  <option value="rs_yhxxqmjz.yhmc">员工名称</option>
                  <option value="rs_yhxxqmjz.bianhao">工号</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP用户名</option>
                  <option value="rs_yhxxqmjz.zz">住址</option>
                  <option value="rs_yhxxqmjz.hjszd">户籍所在地</option>
                  <option value="rs_yhxxqmjz.dacfd">档案存放地</option>
                  <option value="rs_yhxxqmjz.sjsjb">设计师职称</option>
                  <option value="rs_yhxxqmjz.ygbh">序号</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">可登陆</option>
                  <option value="rs_yhxxqmjz.yhjs">用户角色</option>
                  <option value="rs_yhxxqmjz.csrq">出生日期</option>
                  <option value="rs_yhxxqmjz.cjgzsj">毕业时间</option>
                  <option value="rs_yhxxqmjz.rzsj">入职日期</option>
                  <option value="rs_yhxxqmjz.htksrq">合同开始日期</option>
                  <option value="rs_yhxxqmjz.htdqrq">合同到期日期</option>
                  <option value="rs_yhxxqmjz.lzrq">离职日期</option>
                  <option value="rs_yhxxqmjz.xlbm">学历</option>
                  <option value="rs_yhxxqmjz.byyx">毕业院校</option>
                  <option value="rs_yhxxqmjz.zy">专业</option>
                  <option value="rs_yhxxqmjz.xb">性别</option>
                  <option value="rs_yhxxqmjz.hf">婚否</option>
                  <option value="rs_yhxxqmjz.sfzszg">员工状态</option>
                  <option value="rs_yhxxqmjz.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">工龄</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">所属单位</option>
                  <option value="rs_yhxxqmjz.yhmc">员工名称</option>
                  <option value="rs_yhxxqmjz.bianhao">工号</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP用户名</option>
                  <option value="rs_yhxxqmjz.zz">住址</option>
                  <option value="rs_yhxxqmjz.hjszd">户籍所在地</option>
                  <option value="rs_yhxxqmjz.dacfd">档案存放地</option>
                  <option value="rs_yhxxqmjz.sjsjb">设计师职称</option>
                  <option value="rs_yhxxqmjz.ygbh">序号</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">可登陆</option>
                  <option value="rs_yhxxqmjz.yhjs">用户角色</option>
                  <option value="rs_yhxxqmjz.csrq">出生日期</option>
                  <option value="rs_yhxxqmjz.cjgzsj">毕业时间</option>
                  <option value="rs_yhxxqmjz.rzsj">入职日期</option>
                  <option value="rs_yhxxqmjz.htksrq">合同开始日期</option>
                  <option value="rs_yhxxqmjz.htdqrq">合同到期日期</option>
                  <option value="rs_yhxxqmjz.lzrq">离职日期</option>
                  <option value="rs_yhxxqmjz.xlbm">学历</option>
                  <option value="rs_yhxxqmjz.byyx">毕业院校</option>
                  <option value="rs_yhxxqmjz.zy">专业</option>
                  <option value="rs_yhxxqmjz.xb">性别</option>
                  <option value="rs_yhxxqmjz.hf">婚否</option>
                  <option value="rs_yhxxqmjz.sfzszg">员工状态</option>
                  <option value="rs_yhxxqmjz.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">工龄</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">所属单位</option>
                  <option value="rs_yhxxqmjz.yhmc">员工名称</option>
                  <option value="rs_yhxxqmjz.bianhao">工号</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP用户名</option>
                  <option value="rs_yhxxqmjz.zz">住址</option>
                  <option value="rs_yhxxqmjz.hjszd">户籍所在地</option>
                  <option value="rs_yhxxqmjz.dacfd">档案存放地</option>
                  <option value="rs_yhxxqmjz.sjsjb">设计师职称</option>
                  <option value="rs_yhxxqmjz.ygbh">序号</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">可登陆</option>
                  <option value="rs_yhxxqmjz.yhjs">用户角色</option>
                  <option value="rs_yhxxqmjz.csrq">出生日期</option>
                  <option value="rs_yhxxqmjz.cjgzsj">毕业时间</option>
                  <option value="rs_yhxxqmjz.rzsj">入职日期</option>
                  <option value="rs_yhxxqmjz.htksrq">合同开始日期</option>
                  <option value="rs_yhxxqmjz.htdqrq">合同到期日期</option>
                  <option value="rs_yhxxqmjz.lzrq">离职日期</option>
                  <option value="rs_yhxxqmjz.xlbm">学历</option>
                  <option value="rs_yhxxqmjz.byyx">毕业院校</option>
                  <option value="rs_yhxxqmjz.zy">专业</option>
                  <option value="rs_yhxxqmjz.xb">性别</option>
                  <option value="rs_yhxxqmjz.hf">婚否</option>
                  <option value="rs_yhxxqmjz.sfzszg">员工状态</option>
                  <option value="rs_yhxxqmjz.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">工龄</option>
                </select>
                <BR>
                第四列 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">所属单位</option>
                  <option value="rs_yhxxqmjz.yhmc">员工名称</option>
                  <option value="rs_yhxxqmjz.bianhao">工号</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP用户名</option>
                  <option value="rs_yhxxqmjz.zz">住址</option>
                  <option value="rs_yhxxqmjz.hjszd">户籍所在地</option>
                  <option value="rs_yhxxqmjz.dacfd">档案存放地</option>
                  <option value="rs_yhxxqmjz.sjsjb">设计师职称</option>
                  <option value="rs_yhxxqmjz.ygbh">序号</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">可登陆</option>
                  <option value="rs_yhxxqmjz.yhjs">用户角色</option>
                  <option value="rs_yhxxqmjz.csrq">出生日期</option>
                  <option value="rs_yhxxqmjz.cjgzsj">毕业时间</option>
                  <option value="rs_yhxxqmjz.rzsj">入职日期</option>
                  <option value="rs_yhxxqmjz.htksrq">合同开始日期</option>
                  <option value="rs_yhxxqmjz.htdqrq">合同到期日期</option>
                  <option value="rs_yhxxqmjz.lzrq">离职日期</option>
                  <option value="rs_yhxxqmjz.xlbm">学历</option>
                  <option value="rs_yhxxqmjz.byyx">毕业院校</option>
                  <option value="rs_yhxxqmjz.zy">专业</option>
                  <option value="rs_yhxxqmjz.xb">性别</option>
                  <option value="rs_yhxxqmjz.hf">婚否</option>
                  <option value="rs_yhxxqmjz.sfzszg">员工状态</option>
                  <option value="rs_yhxxqmjz.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">工龄</option>
                </select>
                第五列 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">所属单位</option>
                  <option value="rs_yhxxqmjz.yhmc">员工名称</option>
                  <option value="rs_yhxxqmjz.bianhao">工号</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP用户名</option>
                  <option value="rs_yhxxqmjz.zz">住址</option>
                  <option value="rs_yhxxqmjz.hjszd">户籍所在地</option>
                  <option value="rs_yhxxqmjz.dacfd">档案存放地</option>
                  <option value="rs_yhxxqmjz.sjsjb">设计师职称</option>
                  <option value="rs_yhxxqmjz.ygbh">序号</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">可登陆</option>
                  <option value="rs_yhxxqmjz.yhjs">用户角色</option>
                  <option value="rs_yhxxqmjz.csrq">出生日期</option>
                  <option value="rs_yhxxqmjz.cjgzsj">毕业时间</option>
                  <option value="rs_yhxxqmjz.rzsj">入职日期</option>
                  <option value="rs_yhxxqmjz.htksrq">合同开始日期</option>
                  <option value="rs_yhxxqmjz.htdqrq">合同到期日期</option>
                  <option value="rs_yhxxqmjz.lzrq">离职日期</option>
                  <option value="rs_yhxxqmjz.xlbm">学历</option>
                  <option value="rs_yhxxqmjz.byyx">毕业院校</option>
                  <option value="rs_yhxxqmjz.zy">专业</option>
                  <option value="rs_yhxxqmjz.xb">性别</option>
                  <option value="rs_yhxxqmjz.hf">婚否</option>
                  <option value="rs_yhxxqmjz.sfzszg">员工状态</option>
                  <option value="rs_yhxxqmjz.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">工龄</option>
                </select>
                第六列 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="rs_yhxxqmjz.dwbh">所属单位</option>
                  <option value="rs_yhxxqmjz.yhmc">员工名称</option>
                  <option value="rs_yhxxqmjz.bianhao">工号</option>
                  <option value="rs_yhxxqmjz.yhdlm">ERP用户名</option>
                  <option value="rs_yhxxqmjz.zz">住址</option>
                  <option value="rs_yhxxqmjz.hjszd">户籍所在地</option>
                  <option value="rs_yhxxqmjz.dacfd">档案存放地</option>
                  <option value="rs_yhxxqmjz.sjsjb">设计师职称</option>
                  <option value="rs_yhxxqmjz.ygbh">序号</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="rs_yhxxqmjz.kdlxtbz">可登陆</option>
                  <option value="rs_yhxxqmjz.yhjs">用户角色</option>
                  <option value="rs_yhxxqmjz.csrq">出生日期</option>
                  <option value="rs_yhxxqmjz.cjgzsj">毕业时间</option>
                  <option value="rs_yhxxqmjz.rzsj">入职日期</option>
                  <option value="rs_yhxxqmjz.htksrq">合同开始日期</option>
                  <option value="rs_yhxxqmjz.htdqrq">合同到期日期</option>
                  <option value="rs_yhxxqmjz.lzrq">离职日期</option>
                  <option value="rs_yhxxqmjz.xlbm">学历</option>
                  <option value="rs_yhxxqmjz.byyx">毕业院校</option>
                  <option value="rs_yhxxqmjz.zy">专业</option>
                  <option value="rs_yhxxqmjz.xb">性别</option>
                  <option value="rs_yhxxqmjz.hf">婚否</option>
                  <option value="rs_yhxxqmjz.sfzszg">员工状态</option>
                  <option value="rs_yhxxqmjz.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-rs_yhxxqmjz.cjgzsj)/365,1)-rs_yhxxqmjz.wgzsj">工龄</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询员工花名册" onClick="f_do(selectform,'cxhmc')">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">统计表</td>
              <td colspan="3"> 第一列 
                <input type="hidden" name="tj1name" value="">
                <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">所属单位</option>
                  <option value="zz">住址</option>
                  <option value="hjszd">户籍所在地</option>
                  <option value="dacfd">档案存放地</option>
                  <option value="sjsjbmc">设计师职称</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否')">可登陆</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商')">用户角色</option>
                  <option value="csrq">出生日期</option>
                  <option value="cjgzsj">毕业时间</option>
                  <option value="rzsj">入职日期</option>
                  <option value="lzrq">离职日期</option>
                  <option value="htksrq">合同开始日期</option>
                  <option value="htdqrq">合同到期日期</option>
                  <option value="xueli">学历</option>
                  <option value="byyx">毕业院校</option>
                  <option value="zy">专业</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','男','W','女')">性别</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','是','N','否')">婚否</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退')">员工状态</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','固定工资','2','浮动工资')">工资类别</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="zwflmc">职务分类</option>
                </select>
                第二列 
                <input type="hidden" name="tj2name" value="">
                <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">所属单位</option>
                  <option value="zz">住址</option>
                  <option value="hjszd">户籍所在地</option>
                  <option value="dacfd">档案存放地</option>
                  <option value="sjsjbmc">设计师职称</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否')">可登陆</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商')">用户角色</option>
                  <option value="csrq">出生日期</option>
                  <option value="cjgzsj">毕业时间</option>
                  <option value="rzsj">入职日期</option>
                  <option value="lzrq">离职日期</option>
                  <option value="htksrq">合同开始日期</option>
                  <option value="htdqrq">合同到期日期</option>
                  <option value="xueli">学历</option>
                  <option value="byyx">毕业院校</option>
                  <option value="zy">专业</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','男','W','女')">性别</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','是','N','否')">婚否</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退')">员工状态</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','固定工资','2','浮动工资')">工资类别</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="zwflmc">职务分类</option>
                </select>
                第三列 
                <input type="hidden" name="tj3name" value="">
                <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">所属单位</option>
                  <option value="zz">住址</option>
                  <option value="hjszd">户籍所在地</option>
                  <option value="dacfd">档案存放地</option>
                  <option value="sjsjbmc">设计师职称</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否')">可登陆</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商')">用户角色</option>
                  <option value="csrq">出生日期</option>
                  <option value="cjgzsj">毕业时间</option>
                  <option value="rzsj">入职日期</option>
                  <option value="lzrq">离职日期</option>
                  <option value="htksrq">合同开始日期</option>
                  <option value="htdqrq">合同到期日期</option>
                  <option value="xueli">学历</option>
                  <option value="byyx">毕业院校</option>
                  <option value="zy">专业</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','男','W','女')">性别</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','是','N','否')">婚否</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退')">员工状态</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','固定工资','2','浮动工资')">工资类别</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="zwflmc">职务分类</option>
                </select>
                <BR>
                第四列 
                <input type="hidden" name="tj4name" value="">
                <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">所属单位</option>
                  <option value="zz">住址</option>
                  <option value="hjszd">户籍所在地</option>
                  <option value="dacfd">档案存放地</option>
                  <option value="sjsjbmc">设计师职称</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否')">可登陆</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商')">用户角色</option>
                  <option value="csrq">出生日期</option>
                  <option value="cjgzsj">毕业时间</option>
                  <option value="rzsj">入职日期</option>
                  <option value="lzrq">离职日期</option>
                  <option value="htksrq">合同开始日期</option>
                  <option value="htdqrq">合同到期日期</option>
                  <option value="xueli">学历</option>
                  <option value="byyx">毕业院校</option>
                  <option value="zy">专业</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','男','W','女')">性别</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','是','N','否')">婚否</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退')">员工状态</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','固定工资','2','浮动工资')">工资类别</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="zwflmc">职务分类</option>
                </select>
                第五列 
                <input type="hidden" name="tj5name" value="">
                <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">所属单位</option>
                  <option value="zz">住址</option>
                  <option value="hjszd">户籍所在地</option>
                  <option value="dacfd">档案存放地</option>
                  <option value="sjsjbmc">设计师职称</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否')">可登陆</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商')">用户角色</option>
                  <option value="csrq">出生日期</option>
                  <option value="cjgzsj">毕业时间</option>
                  <option value="rzsj">入职日期</option>
                  <option value="lzrq">离职日期</option>
                  <option value="htksrq">合同开始日期</option>
                  <option value="htdqrq">合同到期日期</option>
                  <option value="xueli">学历</option>
                  <option value="byyx">毕业院校</option>
                  <option value="zy">专业</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','男','W','女')">性别</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','是','N','否')">婚否</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退')">员工状态</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','固定工资','2','浮动工资')">工资类别</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="zwflmc">职务分类</option>
                </select>
                第六列 
                <input type="hidden" name="tj6name" value="">
                <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
                  <option value=""></option>
                  <option value="dwmc">所属单位</option>
                  <option value="zz">住址</option>
                  <option value="hjszd">户籍所在地</option>
                  <option value="dacfd">档案存放地</option>
                  <option value="sjsjbmc">设计师职称</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="DECODE(rs_yhxxqmjz.kdlxtbz,'Y','是','N','否')">可登陆</option>
                  <option value="DECODE(rs_yhxxqmjz.yhjs,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','分公司店面','F3','设计室','G0','供应商','J0','加盟商')">用户角色</option>
                  <option value="csrq">出生日期</option>
                  <option value="cjgzsj">毕业时间</option>
                  <option value="rzsj">入职日期</option>
                  <option value="lzrq">离职日期</option>
                  <option value="htksrq">合同开始日期</option>
                  <option value="htdqrq">合同到期日期</option>
                  <option value="xueli">学历</option>
                  <option value="byyx">毕业院校</option>
                  <option value="zy">专业</option>
                  <option value="DECODE(rs_yhxxqmjz.xb,'M','男','W','女')">性别</option>
                  <option value="DECODE(rs_yhxxqmjz.hf,'Y','是','N','否')">婚否</option>
                  <option value="DECODE(rs_yhxxqmjz.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退')">员工状态</option>
                  <option value="DECODE(rs_yhxxqmjz.gzlb,'1','固定工资','2','浮动工资')">工资类别</option>
                  <option value="rs_yhxxqmjz.xzzwbm">行政职务</option>
                  <option value="zwflmc">职务分类</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="统计表" onClick="f_do(selectform,'tj')" name="button2">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.jzrq, "结转日期"))) {
		return false;
	}
	if(!(isNumber(FormName.rs_yhxxqmjz_ygbh, "序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_csrq2, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_rzsj, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_rzsj2, "入职日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.rs_yhxxqmjz_lzrq, "离职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_lzrq2, "离职日期"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_zkl, "允许折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_glgz, "工龄工资"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_gwgz, "岗位工资"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_jbgz, "基本工资"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_yjsxe, "交纳基数"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_jtbt, "交通补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_cb, "每日餐补"))) {
		return false;
	}
	if(!(isFloat(FormName.rs_yhxxqmjz_dhbt, "手机补贴"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_tjrq, "体检日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_tjrq2, "体检日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_cjgzsj, "毕业时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_yhxxqmjz_cjgzsj2, "毕业时间"))) {
		return false;
	}
	if(!(isNumber(FormName.kqhm, "考勤号码"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq, "合同开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.htksrq2, "合同开始日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq, "合同到期日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.htdqrq2, "合同到期日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbblsj, "社保办理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sbblsj2, "社保办理时间"))) {
		return false;
	}

	if (lx=="cxhmc")
	{
		FormName.action="Rs_yhxxqmjzCxList.jsp"
	}
	else if (lx=="tj")
	{
		if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
			alert("请选择[统计列]！");
			FormName.tj1.focus();
			return false;
		}
		FormName.action="tjb.jsp"
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
