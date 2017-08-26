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
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	
	//检查是否做期末结转
	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

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
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">维护花名册－特权</div>
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
				</select>
			  </td>
              <td width="19%" align="right">所属单位</td>
              <td width="31%"> 
                <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwlx,dwbh","");
					}
					else if (kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwlx,dwbh","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
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
                  <option value="D">待岗</option>
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
                非员工 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">客户资料授权范围</td>
              <td width="31%"> 
                <select name="kfgssq" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="0">不授权</option>
                  <option value="1">授权单个分公司</option>
                  <option value="2">授权多个分公司</option>
                  <option value="3">授权单个店面</option>
                  <option value="4">授权某一分公司多个店面</option>
                  <option value="5">授权多个分公司多个店面</option>
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
                <input type="text" name="sq_yhxx_ygbh" size="20" maxlength="8" >
              </td>
              <td width="19%"> 
                <div align="right">员工名称</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">工号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_bianhao" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">用户登录名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_yhdlm" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">劳动合同编号</td>
              <td width="31%"> 
                <input type="text" name="ldhtbh" value="" size="20" maxlength="14">
              </td>
              <td align="right" width="19%">&nbsp;</td>
              <td width="31%">&nbsp; </td>
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
            <tr bgcolor="#E8E8FF"> 
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
                <select name="sq_yhxx_yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_zz" size="20" maxlength="200" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">所属设计室</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_sjsbh" size="20" maxlength="5" >
              </td>
              <td width="19%"> 
                <div align="right">可登陆系统标志</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_kdlxtbz","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">性别</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_xb","M+男&W+女","");
%> </td>
              <td width="19%"> 
                <div align="right"> 婚否 </div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_hf","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">出生日期从</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_csrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_csrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">民族</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_mz" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">身份证号</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_sfzh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">手机</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_dh" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">email</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_email" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">行政职务</div>
              </td>
              <td width="31%"> 
                <select name="sq_yhxx_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <select name="sq_yhxx_xlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_hjszd" size="20" maxlength="100" >
              </td>
              <td width="19%"> 
                <div align="right">档案存放地</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_dacfd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">毕业院校</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_byyx" size="20" maxlength="50" >
              </td>
              <td width="19%"> 
                <div align="right">专业</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_zy" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">毕业时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_cjgzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_cjgzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">体检日期 从</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_tjrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">到</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_tjrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">入职日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_rzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_rzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">试用截至日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="syjzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="syjzrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">离职日期 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_lzrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%"> 
                <div align="right">到</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_lzrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">与公司人员有亲属关系</td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_sfqs","Y+是&N+否","");
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
	cf.radioToken(out, "sq_yhxx_ylbx","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否缴纳养老保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_jylbx","Y+是&N+否","");
%> </td>
              <td width="19%"> 
                <div align="right">是否缴纳失业保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_sybx","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否缴纳工伤保险</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_gsby","Y+是&N+否","");
%> </td>
              <td width="19%"> 
                <div align="right">是否缴纳生育保险</div>
              </td>
              <td width="31%"><%
	cf.radioToken(out, "sq_yhxx_syx","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">社保办理时间 从</td>
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
                <input type="text" name="sq_yhxx_shbxh" size="20" maxlength="20" >
              </td>
              <td width="19%" align="right">缴保险地点</td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jbxdd" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">紧急联系人</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jjlxr" size="20" maxlength="20" >
              </td>
              <td width="19%"> 
                <div align="right">急联系人手机</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_lxrdh" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">允许查看价格明细</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_ckjgbz","Y+可看&N+不可","");
%> </td>
              <td width="19%"> 
                <div align="right">重点用户标志</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_zdyhbz","Y+是&N+否","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">允许折扣率</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_zkl" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">报价级别</div>
              </td>
              <td width="31%"> 
                <select name="sq_yhxx_bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_glgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">岗位工资</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_gwgz" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">基本工资</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jbgz" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">设计师职称</div>
              </td>
              <td width="31%"> 
                <select name="sq_yhxx_sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="sq_yhxx_yjsxe" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">交通补贴</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_jtbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">每日餐补</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_cb" size="20" maxlength="9" >
              </td>
              <td width="19%"> 
                <div align="right">手机补贴</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sq_yhxx_dhbt" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">是否有担保书</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_sfydbs","Y+是&N+否","");
%> </td>
              <td width="19%"> 
                <div align="right">是否已体检</div>
              </td>
              <td width="31%"> <%
	cf.radioToken(out, "sq_yhxx_sfytj","Y+是&N+否","");
%> </td>
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
            <tr bgcolor="#E8E8FF"> 
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
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.zz">住址</option>
                  <option value="sq_yhxx.hjszd">户籍所在地</option>
                  <option value="sq_yhxx.dacfd">档案存放地</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.xzzwbm">行政职务</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.csrq">出生日期</option>
                  <option value="sq_yhxx.cjgzsj">毕业时间</option>
                  <option value="sq_yhxx.rzsj">入职日期</option>
                  <option value="sq_yhxx.syjzrq">试用截至日期</option>
                  <option value="sq_yhxx.htksrq">合同开始日期</option>
                  <option value="sq_yhxx.htdqrq">合同到期日期</option>
                  <option value="sq_yhxx.lzrq">离职日期</option>
                  <option value="sq_yhxx.xlbm">学历</option>
                  <option value="sq_yhxx.byyx">毕业院校</option>
                  <option value="sq_yhxx.zy">专业</option>
                  <option value="sq_yhxx.xb">性别</option>
                  <option value="sq_yhxx.hf">婚否</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                  <option value="sq_yhxx.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">工龄</option>
                </select>
                第二列 
                <select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.zz">住址</option>
                  <option value="sq_yhxx.hjszd">户籍所在地</option>
                  <option value="sq_yhxx.dacfd">档案存放地</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.xzzwbm">行政职务</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.csrq">出生日期</option>
                  <option value="sq_yhxx.cjgzsj">毕业时间</option>
                  <option value="sq_yhxx.rzsj">入职日期</option>
                  <option value="sq_yhxx.syjzrq">试用截至日期</option>
                  <option value="sq_yhxx.htksrq">合同开始日期</option>
                  <option value="sq_yhxx.htdqrq">合同到期日期</option>
                  <option value="sq_yhxx.lzrq">离职日期</option>
                  <option value="sq_yhxx.xlbm">学历</option>
                  <option value="sq_yhxx.byyx">毕业院校</option>
                  <option value="sq_yhxx.zy">专业</option>
                  <option value="sq_yhxx.xb">性别</option>
                  <option value="sq_yhxx.hf">婚否</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                  <option value="sq_yhxx.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">工龄</option>
                </select>
                第三列 
                <select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.zz">住址</option>
                  <option value="sq_yhxx.hjszd">户籍所在地</option>
                  <option value="sq_yhxx.dacfd">档案存放地</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.xzzwbm">行政职务</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.csrq">出生日期</option>
                  <option value="sq_yhxx.cjgzsj">毕业时间</option>
                  <option value="sq_yhxx.rzsj">入职日期</option>
                  <option value="sq_yhxx.syjzrq">试用截至日期</option>
                  <option value="sq_yhxx.htksrq">合同开始日期</option>
                  <option value="sq_yhxx.htdqrq">合同到期日期</option>
                  <option value="sq_yhxx.lzrq">离职日期</option>
                  <option value="sq_yhxx.xlbm">学历</option>
                  <option value="sq_yhxx.byyx">毕业院校</option>
                  <option value="sq_yhxx.zy">专业</option>
                  <option value="sq_yhxx.xb">性别</option>
                  <option value="sq_yhxx.hf">婚否</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                  <option value="sq_yhxx.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">工龄</option>
                </select>
                <BR>
                第四列 
                <select name="jgpx4" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.zz">住址</option>
                  <option value="sq_yhxx.hjszd">户籍所在地</option>
                  <option value="sq_yhxx.dacfd">档案存放地</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.xzzwbm">行政职务</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.csrq">出生日期</option>
                  <option value="sq_yhxx.cjgzsj">毕业时间</option>
                  <option value="sq_yhxx.rzsj">入职日期</option>
                  <option value="sq_yhxx.syjzrq">试用截至日期</option>
                  <option value="sq_yhxx.htksrq">合同开始日期</option>
                  <option value="sq_yhxx.htdqrq">合同到期日期</option>
                  <option value="sq_yhxx.lzrq">离职日期</option>
                  <option value="sq_yhxx.xlbm">学历</option>
                  <option value="sq_yhxx.byyx">毕业院校</option>
                  <option value="sq_yhxx.zy">专业</option>
                  <option value="sq_yhxx.xb">性别</option>
                  <option value="sq_yhxx.hf">婚否</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                  <option value="sq_yhxx.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">工龄</option>
                </select>
                第五列 
                <select name="jgpx5" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.zz">住址</option>
                  <option value="sq_yhxx.hjszd">户籍所在地</option>
                  <option value="sq_yhxx.dacfd">档案存放地</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.xzzwbm">行政职务</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.csrq">出生日期</option>
                  <option value="sq_yhxx.cjgzsj">毕业时间</option>
                  <option value="sq_yhxx.rzsj">入职日期</option>
                  <option value="sq_yhxx.syjzrq">试用截至日期</option>
                  <option value="sq_yhxx.htksrq">合同开始日期</option>
                  <option value="sq_yhxx.htdqrq">合同到期日期</option>
                  <option value="sq_yhxx.lzrq">离职日期</option>
                  <option value="sq_yhxx.xlbm">学历</option>
                  <option value="sq_yhxx.byyx">毕业院校</option>
                  <option value="sq_yhxx.zy">专业</option>
                  <option value="sq_yhxx.xb">性别</option>
                  <option value="sq_yhxx.hf">婚否</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                  <option value="sq_yhxx.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">工龄</option>
                </select>
                第六列 
                <select name="jgpx6" style="FONT-SIZE:12PX;WIDTH:100PX">
                  <option value=""></option>
                  <option value="sq_yhxx.dwbh">所属单位</option>
                  <option value="sq_yhxx.yhmc">员工名称</option>
                  <option value="sq_yhxx.bianhao">工号</option>
                  <option value="sq_yhxx.yhdlm">ERP用户名</option>
                  <option value="sq_yhxx.zz">住址</option>
                  <option value="sq_yhxx.hjszd">户籍所在地</option>
                  <option value="sq_yhxx.dacfd">档案存放地</option>
                  <option value="sq_yhxx.sjsjb">设计师职称</option>
                  <option value="sq_yhxx.ygbh">序号</option>
                  <option value="sq_yhxx.xzzwbm">行政职务</option>
                  <option value="sq_yhxx.kdlxtbz">可登陆</option>
                  <option value="sq_yhxx.yhjs">用户角色</option>
                  <option value="sq_yhxx.csrq">出生日期</option>
                  <option value="sq_yhxx.cjgzsj">毕业时间</option>
                  <option value="sq_yhxx.rzsj">入职日期</option>
                  <option value="sq_yhxx.syjzrq">试用截至日期</option>
                  <option value="sq_yhxx.htksrq">合同开始日期</option>
                  <option value="sq_yhxx.htdqrq">合同到期日期</option>
                  <option value="sq_yhxx.lzrq">离职日期</option>
                  <option value="sq_yhxx.xlbm">学历</option>
                  <option value="sq_yhxx.byyx">毕业院校</option>
                  <option value="sq_yhxx.zy">专业</option>
                  <option value="sq_yhxx.xb">性别</option>
                  <option value="sq_yhxx.hf">婚否</option>
                  <option value="sq_yhxx.sfzszg">员工状态</option>
                  <option value="sq_yhxx.gzlb">工资类别</option>
                  <option value="ROUND((SYSDATE-sq_yhxx.cjgzsj)/365,1)-sq_yhxx.wgzsj">工龄</option>
                </select>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="查询员工花名册" onClick="f_do(selectform,'cxhmc')">
                <input type="reset"  value="重输" name="reset">
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
<%
	cf.ajax(out);//启用AJAX
%>


function changeFgs(FormName) 
{
	FormName.sq_yhxx_dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwlx,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.sq_yhxx_dwbh,ajaxRetStr);
}

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.sq_yhxx_ygbh, "序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_csrq, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_csrq2, "出生日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_rzsj, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_rzsj2, "入职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.syjzrq, "试用截至日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.syjzrq2, "试用截至日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.sq_yhxx_lzrq, "离职日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_lzrq2, "离职日期"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_zkl, "允许折扣率"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_glgz, "工龄工资"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_gwgz, "岗位工资"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_jbgz, "基本工资"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_yjsxe, "交纳基数"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_jtbt, "交通补贴"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_cb, "每日餐补"))) {
		return false;
	}
	if(!(isFloat(FormName.sq_yhxx_dhbt, "手机补贴"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_tjrq, "体检日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_tjrq2, "体检日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_cjgzsj, "毕业时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sq_yhxx_cjgzsj2, "毕业时间"))) {
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


	FormName.action="Sq_yhxxTqList.jsp"


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
