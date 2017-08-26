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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">统计-完工评价表</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right"> 
        分公司      </td>
              <td width="32%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
      <td width="18%" align="right"> 
        签约店面      </td>
      <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">合同号</td>
      <td width="32%"> 
        <input type="text" name="hth" size="20" maxlength="20">      </td>
      <td width="18%" align="right">客户编号</td>
      <td width="32%"> 
        <input type="text" name="khbh" size="20" maxlength="20">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"> 
        客户姓名      </td>
      <td width="32%"> 
        <input type="text" name="khxm" size="20" maxlength="50">      </td>
      <td width="18%" align="right"> 
        联系方式      </td>
      <td width="32%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">房屋地址</td>
      <td width="32%"> 
        <input type="text" name="fwdz" size="20" maxlength="100">      </td>
      <td align="right" width="18%">施工队</td>
      <td width="32%"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where ssfgs='"+ssfgs+"' and cxbz='N' order by sgdmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">设计师</td>
      <td width="32%"> 
        <input type="text" name="sjs" size="20" maxlength="20" >      </td>
      <td align="right" width="18%">质检</td>
      <td width="32%"> 
        <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc","");
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">项目分类</td>
      <td width="32%"><select name="xmfl" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select xmfl c1,xmfl c2 from cmp_xmflbm order by xmflbm","");
%>
      </select></td>
      <td align="right" width="18%">评价结果</td>
      <td width="32%"><input type="radio" name="pjjgbm" value="1">
满意
  <input type="radio" name="pjjgbm" value="2">
一般
<input type="radio" name="pjjgbm" value="3">
不满意</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">评价项目</td>
      <td colspan="3"> 
        <select name="pjxm" style="FONT-SIZE:12PX;WIDTH:522PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select pjxm c1,pjxm||'（'||xmfl||'）' c2 from cmp_pjxmbm order by xmflbm,pjxmbm","");
%> 
        </select>      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">显示风格</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">选择－通用统计列</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">设计师</option>
          <option value="zjxm">质检</option>
          <option value="sgdmc">施工队</option>
          <option value="xmfl">项目分类</option>
          <option value="pjxm">评价项目</option>
          <option value="pjjg">评价结果</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">设计师</option>
          <option value="zjxm">质检</option>
          <option value="sgdmc">施工队</option>
          <option value="xmfl">项目分类</option>
          <option value="pjxm">评价项目</option>
          <option value="pjjg">评价结果</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">设计师</option>
          <option value="zjxm">质检</option>
          <option value="sgdmc">施工队</option>
          <option value="xmfl">项目分类</option>
          <option value="pjxm">评价项目</option>
          <option value="pjjg">评价结果</option>
        </select>
        <BR>
        第四列 
        <input type="hidden" name="tj4name" value="">
        <select name="tj4" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj4name.value=tj4.options[tj4.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">设计师</option>
          <option value="zjxm">质检</option>
          <option value="sgdmc">施工队</option>
          <option value="xmfl">项目分类</option>
          <option value="pjxm">评价项目</option>
          <option value="pjjg">评价结果</option>
        </select>
        第五列 
        <input type="hidden" name="tj5name" value="">
        <select name="tj5" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj5name.value=tj5.options[tj5.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">设计师</option>
          <option value="zjxm">质检</option>
          <option value="sgdmc">施工队</option>
          <option value="xmfl">项目分类</option>
          <option value="pjxm">评价项目</option>
          <option value="pjjg">评价结果</option>
        </select>
        第六列 
        <input type="hidden" name="tj6name" value="">
        <select name="tj6" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj6name.value=tj6.options[tj6.selectedIndex].text">
          <option value=""></option>
          <option value="sjs">设计师</option>
          <option value="zjxm">质检</option>
          <option value="sgdmc">施工队</option>
          <option value="xmfl">项目分类</option>
          <option value="pjxm">评价项目</option>
          <option value="pjjg">评价结果</option>
        </select>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="通用统计" onClick="f_do(selectform,'tytj')">
        <input type="button" onClick="f_do(selectform,'myd')"  value="满意度统计" name="myd">
        <input type="button"  value="客户评价汇总表" onClick="f_do(selectform,'khpjhzb')" name="pjhz">
        <input type="button"  value="调查问题汇总表" onClick="f_do(selectform,'dcwthzb')" name="wthz">
        <input type="button"  value="单额满意度统计" onClick="f_do(selectform,'demyd')" name="demyd">
        <input type="reset"  value="重输">      </td>
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

function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.lrsj, "录入时间 "))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 "))) {
		return false;
	}

	if (lx=='tytj')
	{
		FormName.action="Cmp_khpjxmTjList.jsp";
	}
	else if (lx=='myd')
	{
	/*
		if(	javaTrim(FormName.lrsj)=="") {
			alert("请选择[录入时间]！");
			FormName.lrsj.focus();
			return false;
		}
		if(	javaTrim(FormName.lrsj2)=="") {
			alert("请选择[录入时间]！");
			FormName.lrsj2.focus();
			return false;
		}
*/
		FormName.action="mydtjb.jsp";
		FormName.myd.disabled=true;
	}
	else if (lx=='khpjhzb')
	{
		FormName.action="khpjhzb.jsp";
		FormName.pjhz.disabled=true;
	}
	else if (lx=='dcwthzb')
	{
		FormName.action="dcwthzb.jsp";
		FormName.wthz.disabled=true;
	}
	else if (lx=='demyd')
	{
		FormName.action="demydtj.jsp";
		FormName.demyd.disabled=true;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
